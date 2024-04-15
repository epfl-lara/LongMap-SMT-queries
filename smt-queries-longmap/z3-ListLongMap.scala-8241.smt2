; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100388 () Bool)

(assert start!100388)

(declare-fun b_free!25717 () Bool)

(declare-fun b_next!25717 () Bool)

(assert (=> start!100388 (= b_free!25717 (not b_next!25717))))

(declare-fun tp!90140 () Bool)

(declare-fun b_and!42311 () Bool)

(assert (=> start!100388 (= tp!90140 b_and!42311)))

(declare-fun res!797351 () Bool)

(declare-fun e!680563 () Bool)

(assert (=> start!100388 (=> (not res!797351) (not e!680563))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77550 0))(
  ( (array!77551 (arr!37420 (Array (_ BitVec 32) (_ BitVec 64))) (size!37958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77550)

(assert (=> start!100388 (= res!797351 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37958 _keys!1208))))))

(assert (=> start!100388 e!680563))

(declare-fun tp_is_empty!30421 () Bool)

(assert (=> start!100388 tp_is_empty!30421))

(declare-fun array_inv!28638 (array!77550) Bool)

(assert (=> start!100388 (array_inv!28638 _keys!1208)))

(assert (=> start!100388 true))

(assert (=> start!100388 tp!90140))

(declare-datatypes ((V!45689 0))(
  ( (V!45690 (val!15267 Int)) )
))
(declare-datatypes ((ValueCell!14501 0))(
  ( (ValueCellFull!14501 (v!17904 V!45689)) (EmptyCell!14501) )
))
(declare-datatypes ((array!77552 0))(
  ( (array!77553 (arr!37421 (Array (_ BitVec 32) ValueCell!14501)) (size!37959 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77552)

(declare-fun e!680566 () Bool)

(declare-fun array_inv!28639 (array!77552) Bool)

(assert (=> start!100388 (and (array_inv!28639 _values!996) e!680566)))

(declare-fun b!1198064 () Bool)

(declare-fun res!797350 () Bool)

(assert (=> b!1198064 (=> (not res!797350) (not e!680563))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77550 (_ BitVec 32)) Bool)

(assert (=> b!1198064 (= res!797350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198065 () Bool)

(declare-fun e!680567 () Bool)

(declare-fun mapRes!47474 () Bool)

(assert (=> b!1198065 (= e!680566 (and e!680567 mapRes!47474))))

(declare-fun condMapEmpty!47474 () Bool)

(declare-fun mapDefault!47474 () ValueCell!14501)

(assert (=> b!1198065 (= condMapEmpty!47474 (= (arr!37421 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14501)) mapDefault!47474)))))

(declare-fun b!1198066 () Bool)

(declare-fun res!797342 () Bool)

(assert (=> b!1198066 (=> (not res!797342) (not e!680563))))

(declare-datatypes ((List!26413 0))(
  ( (Nil!26410) (Cons!26409 (h!27618 (_ BitVec 64)) (t!39111 List!26413)) )
))
(declare-fun arrayNoDuplicates!0 (array!77550 (_ BitVec 32) List!26413) Bool)

(assert (=> b!1198066 (= res!797342 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26410))))

(declare-fun b!1198067 () Bool)

(assert (=> b!1198067 (= e!680567 tp_is_empty!30421)))

(declare-fun b!1198068 () Bool)

(declare-fun res!797347 () Bool)

(assert (=> b!1198068 (=> (not res!797347) (not e!680563))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198068 (= res!797347 (= (select (arr!37420 _keys!1208) i!673) k0!934))))

(declare-fun b!1198069 () Bool)

(declare-fun e!680564 () Bool)

(assert (=> b!1198069 (= e!680563 e!680564)))

(declare-fun res!797346 () Bool)

(assert (=> b!1198069 (=> (not res!797346) (not e!680564))))

(declare-fun lt!543250 () array!77550)

(assert (=> b!1198069 (= res!797346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543250 mask!1564))))

(assert (=> b!1198069 (= lt!543250 (array!77551 (store (arr!37420 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37958 _keys!1208)))))

(declare-fun b!1198070 () Bool)

(declare-fun res!797344 () Bool)

(assert (=> b!1198070 (=> (not res!797344) (not e!680563))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198070 (= res!797344 (and (= (size!37959 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37958 _keys!1208) (size!37959 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47474 () Bool)

(assert (=> mapIsEmpty!47474 mapRes!47474))

(declare-fun b!1198071 () Bool)

(declare-fun res!797352 () Bool)

(assert (=> b!1198071 (=> (not res!797352) (not e!680564))))

(assert (=> b!1198071 (= res!797352 (arrayNoDuplicates!0 lt!543250 #b00000000000000000000000000000000 Nil!26410))))

(declare-fun b!1198072 () Bool)

(declare-fun e!680565 () Bool)

(assert (=> b!1198072 (= e!680564 (not e!680565))))

(declare-fun res!797348 () Bool)

(assert (=> b!1198072 (=> res!797348 e!680565)))

(assert (=> b!1198072 (= res!797348 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198072 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39585 0))(
  ( (Unit!39586) )
))
(declare-fun lt!543249 () Unit!39585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77550 (_ BitVec 64) (_ BitVec 32)) Unit!39585)

(assert (=> b!1198072 (= lt!543249 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47474 () Bool)

(declare-fun tp!90141 () Bool)

(declare-fun e!680569 () Bool)

(assert (=> mapNonEmpty!47474 (= mapRes!47474 (and tp!90141 e!680569))))

(declare-fun mapKey!47474 () (_ BitVec 32))

(declare-fun mapRest!47474 () (Array (_ BitVec 32) ValueCell!14501))

(declare-fun mapValue!47474 () ValueCell!14501)

(assert (=> mapNonEmpty!47474 (= (arr!37421 _values!996) (store mapRest!47474 mapKey!47474 mapValue!47474))))

(declare-fun b!1198073 () Bool)

(assert (=> b!1198073 (= e!680569 tp_is_empty!30421)))

(declare-fun b!1198074 () Bool)

(declare-fun res!797345 () Bool)

(assert (=> b!1198074 (=> (not res!797345) (not e!680563))))

(assert (=> b!1198074 (= res!797345 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37958 _keys!1208))))))

(declare-fun b!1198075 () Bool)

(assert (=> b!1198075 (= e!680565 true)))

(declare-fun zeroValue!944 () V!45689)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19626 0))(
  ( (tuple2!19627 (_1!9824 (_ BitVec 64)) (_2!9824 V!45689)) )
))
(declare-datatypes ((List!26414 0))(
  ( (Nil!26411) (Cons!26410 (h!27619 tuple2!19626) (t!39112 List!26414)) )
))
(declare-datatypes ((ListLongMap!17595 0))(
  ( (ListLongMap!17596 (toList!8813 List!26414)) )
))
(declare-fun lt!543248 () ListLongMap!17595)

(declare-fun minValue!944 () V!45689)

(declare-fun getCurrentListMapNoExtraKeys!5262 (array!77550 array!77552 (_ BitVec 32) (_ BitVec 32) V!45689 V!45689 (_ BitVec 32) Int) ListLongMap!17595)

(assert (=> b!1198075 (= lt!543248 (getCurrentListMapNoExtraKeys!5262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198076 () Bool)

(declare-fun res!797349 () Bool)

(assert (=> b!1198076 (=> (not res!797349) (not e!680563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198076 (= res!797349 (validMask!0 mask!1564))))

(declare-fun b!1198077 () Bool)

(declare-fun res!797343 () Bool)

(assert (=> b!1198077 (=> (not res!797343) (not e!680563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198077 (= res!797343 (validKeyInArray!0 k0!934))))

(assert (= (and start!100388 res!797351) b!1198076))

(assert (= (and b!1198076 res!797349) b!1198070))

(assert (= (and b!1198070 res!797344) b!1198064))

(assert (= (and b!1198064 res!797350) b!1198066))

(assert (= (and b!1198066 res!797342) b!1198074))

(assert (= (and b!1198074 res!797345) b!1198077))

(assert (= (and b!1198077 res!797343) b!1198068))

(assert (= (and b!1198068 res!797347) b!1198069))

(assert (= (and b!1198069 res!797346) b!1198071))

(assert (= (and b!1198071 res!797352) b!1198072))

(assert (= (and b!1198072 (not res!797348)) b!1198075))

(assert (= (and b!1198065 condMapEmpty!47474) mapIsEmpty!47474))

(assert (= (and b!1198065 (not condMapEmpty!47474)) mapNonEmpty!47474))

(get-info :version)

(assert (= (and mapNonEmpty!47474 ((_ is ValueCellFull!14501) mapValue!47474)) b!1198073))

(assert (= (and b!1198065 ((_ is ValueCellFull!14501) mapDefault!47474)) b!1198067))

(assert (= start!100388 b!1198065))

(declare-fun m!1104427 () Bool)

(assert (=> b!1198071 m!1104427))

(declare-fun m!1104429 () Bool)

(assert (=> b!1198068 m!1104429))

(declare-fun m!1104431 () Bool)

(assert (=> mapNonEmpty!47474 m!1104431))

(declare-fun m!1104433 () Bool)

(assert (=> b!1198077 m!1104433))

(declare-fun m!1104435 () Bool)

(assert (=> b!1198064 m!1104435))

(declare-fun m!1104437 () Bool)

(assert (=> b!1198066 m!1104437))

(declare-fun m!1104439 () Bool)

(assert (=> b!1198076 m!1104439))

(declare-fun m!1104441 () Bool)

(assert (=> b!1198075 m!1104441))

(declare-fun m!1104443 () Bool)

(assert (=> b!1198072 m!1104443))

(declare-fun m!1104445 () Bool)

(assert (=> b!1198072 m!1104445))

(declare-fun m!1104447 () Bool)

(assert (=> start!100388 m!1104447))

(declare-fun m!1104449 () Bool)

(assert (=> start!100388 m!1104449))

(declare-fun m!1104451 () Bool)

(assert (=> b!1198069 m!1104451))

(declare-fun m!1104453 () Bool)

(assert (=> b!1198069 m!1104453))

(check-sat (not b_next!25717) (not mapNonEmpty!47474) (not b!1198069) (not b!1198066) tp_is_empty!30421 (not b!1198076) (not b!1198077) (not b!1198064) (not start!100388) b_and!42311 (not b!1198071) (not b!1198072) (not b!1198075))
(check-sat b_and!42311 (not b_next!25717))
