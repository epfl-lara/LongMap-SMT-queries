; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100234 () Bool)

(assert start!100234)

(declare-fun b!1195430 () Bool)

(declare-fun e!679283 () Bool)

(declare-fun e!679282 () Bool)

(assert (=> b!1195430 (= e!679283 e!679282)))

(declare-fun res!795482 () Bool)

(assert (=> b!1195430 (=> (not res!795482) (not e!679282))))

(declare-datatypes ((array!77326 0))(
  ( (array!77327 (arr!37310 (Array (_ BitVec 32) (_ BitVec 64))) (size!37848 (_ BitVec 32))) )
))
(declare-fun lt!542753 () array!77326)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77326 (_ BitVec 32)) Bool)

(assert (=> b!1195430 (= res!795482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542753 mask!1564))))

(declare-fun _keys!1208 () array!77326)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195430 (= lt!542753 (array!77327 (store (arr!37310 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37848 _keys!1208)))))

(declare-fun mapNonEmpty!47297 () Bool)

(declare-fun mapRes!47297 () Bool)

(declare-fun tp!89907 () Bool)

(declare-fun e!679280 () Bool)

(assert (=> mapNonEmpty!47297 (= mapRes!47297 (and tp!89907 e!679280))))

(declare-fun mapKey!47297 () (_ BitVec 32))

(declare-datatypes ((V!45537 0))(
  ( (V!45538 (val!15210 Int)) )
))
(declare-datatypes ((ValueCell!14444 0))(
  ( (ValueCellFull!14444 (v!17847 V!45537)) (EmptyCell!14444) )
))
(declare-fun mapValue!47297 () ValueCell!14444)

(declare-datatypes ((array!77328 0))(
  ( (array!77329 (arr!37311 (Array (_ BitVec 32) ValueCell!14444)) (size!37849 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77328)

(declare-fun mapRest!47297 () (Array (_ BitVec 32) ValueCell!14444))

(assert (=> mapNonEmpty!47297 (= (arr!37311 _values!996) (store mapRest!47297 mapKey!47297 mapValue!47297))))

(declare-fun b!1195431 () Bool)

(declare-fun res!795486 () Bool)

(assert (=> b!1195431 (=> (not res!795486) (not e!679282))))

(declare-datatypes ((List!26357 0))(
  ( (Nil!26354) (Cons!26353 (h!27562 (_ BitVec 64)) (t!39019 List!26357)) )
))
(declare-fun arrayNoDuplicates!0 (array!77326 (_ BitVec 32) List!26357) Bool)

(assert (=> b!1195431 (= res!795486 (arrayNoDuplicates!0 lt!542753 #b00000000000000000000000000000000 Nil!26354))))

(declare-fun b!1195433 () Bool)

(declare-fun res!795489 () Bool)

(assert (=> b!1195433 (=> (not res!795489) (not e!679283))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195433 (= res!795489 (= (select (arr!37310 _keys!1208) i!673) k0!934))))

(declare-fun b!1195434 () Bool)

(declare-fun res!795481 () Bool)

(assert (=> b!1195434 (=> (not res!795481) (not e!679283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195434 (= res!795481 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47297 () Bool)

(assert (=> mapIsEmpty!47297 mapRes!47297))

(declare-fun b!1195435 () Bool)

(declare-fun res!795488 () Bool)

(assert (=> b!1195435 (=> (not res!795488) (not e!679283))))

(assert (=> b!1195435 (= res!795488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195436 () Bool)

(declare-fun res!795487 () Bool)

(assert (=> b!1195436 (=> (not res!795487) (not e!679283))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195436 (= res!795487 (and (= (size!37849 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37848 _keys!1208) (size!37849 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195437 () Bool)

(declare-fun res!795490 () Bool)

(assert (=> b!1195437 (=> (not res!795490) (not e!679283))))

(assert (=> b!1195437 (= res!795490 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37848 _keys!1208))))))

(declare-fun b!1195438 () Bool)

(declare-fun e!679285 () Bool)

(declare-fun tp_is_empty!30307 () Bool)

(assert (=> b!1195438 (= e!679285 tp_is_empty!30307)))

(declare-fun b!1195432 () Bool)

(assert (=> b!1195432 (= e!679282 (not true))))

(declare-fun arrayContainsKey!0 (array!77326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195432 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39507 0))(
  ( (Unit!39508) )
))
(declare-fun lt!542754 () Unit!39507)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77326 (_ BitVec 64) (_ BitVec 32)) Unit!39507)

(assert (=> b!1195432 (= lt!542754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!795485 () Bool)

(assert (=> start!100234 (=> (not res!795485) (not e!679283))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100234 (= res!795485 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37848 _keys!1208))))))

(assert (=> start!100234 e!679283))

(declare-fun array_inv!28560 (array!77326) Bool)

(assert (=> start!100234 (array_inv!28560 _keys!1208)))

(assert (=> start!100234 true))

(declare-fun e!679284 () Bool)

(declare-fun array_inv!28561 (array!77328) Bool)

(assert (=> start!100234 (and (array_inv!28561 _values!996) e!679284)))

(declare-fun b!1195439 () Bool)

(declare-fun res!795483 () Bool)

(assert (=> b!1195439 (=> (not res!795483) (not e!679283))))

(assert (=> b!1195439 (= res!795483 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26354))))

(declare-fun b!1195440 () Bool)

(assert (=> b!1195440 (= e!679280 tp_is_empty!30307)))

(declare-fun b!1195441 () Bool)

(declare-fun res!795484 () Bool)

(assert (=> b!1195441 (=> (not res!795484) (not e!679283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195441 (= res!795484 (validKeyInArray!0 k0!934))))

(declare-fun b!1195442 () Bool)

(assert (=> b!1195442 (= e!679284 (and e!679285 mapRes!47297))))

(declare-fun condMapEmpty!47297 () Bool)

(declare-fun mapDefault!47297 () ValueCell!14444)

(assert (=> b!1195442 (= condMapEmpty!47297 (= (arr!37311 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14444)) mapDefault!47297)))))

(assert (= (and start!100234 res!795485) b!1195434))

(assert (= (and b!1195434 res!795481) b!1195436))

(assert (= (and b!1195436 res!795487) b!1195435))

(assert (= (and b!1195435 res!795488) b!1195439))

(assert (= (and b!1195439 res!795483) b!1195437))

(assert (= (and b!1195437 res!795490) b!1195441))

(assert (= (and b!1195441 res!795484) b!1195433))

(assert (= (and b!1195433 res!795489) b!1195430))

(assert (= (and b!1195430 res!795482) b!1195431))

(assert (= (and b!1195431 res!795486) b!1195432))

(assert (= (and b!1195442 condMapEmpty!47297) mapIsEmpty!47297))

(assert (= (and b!1195442 (not condMapEmpty!47297)) mapNonEmpty!47297))

(get-info :version)

(assert (= (and mapNonEmpty!47297 ((_ is ValueCellFull!14444) mapValue!47297)) b!1195440))

(assert (= (and b!1195442 ((_ is ValueCellFull!14444) mapDefault!47297)) b!1195438))

(assert (= start!100234 b!1195442))

(declare-fun m!1102475 () Bool)

(assert (=> mapNonEmpty!47297 m!1102475))

(declare-fun m!1102477 () Bool)

(assert (=> b!1195434 m!1102477))

(declare-fun m!1102479 () Bool)

(assert (=> b!1195435 m!1102479))

(declare-fun m!1102481 () Bool)

(assert (=> b!1195441 m!1102481))

(declare-fun m!1102483 () Bool)

(assert (=> b!1195431 m!1102483))

(declare-fun m!1102485 () Bool)

(assert (=> b!1195433 m!1102485))

(declare-fun m!1102487 () Bool)

(assert (=> b!1195430 m!1102487))

(declare-fun m!1102489 () Bool)

(assert (=> b!1195430 m!1102489))

(declare-fun m!1102491 () Bool)

(assert (=> b!1195432 m!1102491))

(declare-fun m!1102493 () Bool)

(assert (=> b!1195432 m!1102493))

(declare-fun m!1102495 () Bool)

(assert (=> start!100234 m!1102495))

(declare-fun m!1102497 () Bool)

(assert (=> start!100234 m!1102497))

(declare-fun m!1102499 () Bool)

(assert (=> b!1195439 m!1102499))

(check-sat (not start!100234) (not b!1195435) (not b!1195431) (not b!1195432) tp_is_empty!30307 (not b!1195439) (not b!1195434) (not mapNonEmpty!47297) (not b!1195430) (not b!1195441))
(check-sat)
