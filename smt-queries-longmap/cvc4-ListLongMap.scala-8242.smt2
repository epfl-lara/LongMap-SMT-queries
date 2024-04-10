; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100404 () Bool)

(assert start!100404)

(declare-fun b_free!25727 () Bool)

(declare-fun b_next!25727 () Bool)

(assert (=> start!100404 (= b_free!25727 (not b_next!25727))))

(declare-fun tp!90171 () Bool)

(declare-fun b_and!42343 () Bool)

(assert (=> start!100404 (= tp!90171 b_and!42343)))

(declare-fun b!1198399 () Bool)

(declare-fun res!797578 () Bool)

(declare-fun e!680749 () Bool)

(assert (=> b!1198399 (=> (not res!797578) (not e!680749))))

(declare-datatypes ((array!77641 0))(
  ( (array!77642 (arr!37465 (Array (_ BitVec 32) (_ BitVec 64))) (size!38001 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77641)

(declare-datatypes ((List!26357 0))(
  ( (Nil!26354) (Cons!26353 (h!27562 (_ BitVec 64)) (t!39064 List!26357)) )
))
(declare-fun arrayNoDuplicates!0 (array!77641 (_ BitVec 32) List!26357) Bool)

(assert (=> b!1198399 (= res!797578 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26354))))

(declare-fun b!1198400 () Bool)

(declare-fun res!797576 () Bool)

(declare-fun e!680746 () Bool)

(assert (=> b!1198400 (=> (not res!797576) (not e!680746))))

(declare-fun lt!543486 () array!77641)

(assert (=> b!1198400 (= res!797576 (arrayNoDuplicates!0 lt!543486 #b00000000000000000000000000000000 Nil!26354))))

(declare-fun mapNonEmpty!47489 () Bool)

(declare-fun mapRes!47489 () Bool)

(declare-fun tp!90170 () Bool)

(declare-fun e!680751 () Bool)

(assert (=> mapNonEmpty!47489 (= mapRes!47489 (and tp!90170 e!680751))))

(declare-datatypes ((V!45701 0))(
  ( (V!45702 (val!15272 Int)) )
))
(declare-datatypes ((ValueCell!14506 0))(
  ( (ValueCellFull!14506 (v!17910 V!45701)) (EmptyCell!14506) )
))
(declare-fun mapRest!47489 () (Array (_ BitVec 32) ValueCell!14506))

(declare-fun mapValue!47489 () ValueCell!14506)

(declare-fun mapKey!47489 () (_ BitVec 32))

(declare-datatypes ((array!77643 0))(
  ( (array!77644 (arr!37466 (Array (_ BitVec 32) ValueCell!14506)) (size!38002 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77643)

(assert (=> mapNonEmpty!47489 (= (arr!37466 _values!996) (store mapRest!47489 mapKey!47489 mapValue!47489))))

(declare-fun b!1198401 () Bool)

(assert (=> b!1198401 (= e!680749 e!680746)))

(declare-fun res!797582 () Bool)

(assert (=> b!1198401 (=> (not res!797582) (not e!680746))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77641 (_ BitVec 32)) Bool)

(assert (=> b!1198401 (= res!797582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543486 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198401 (= lt!543486 (array!77642 (store (arr!37465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38001 _keys!1208)))))

(declare-fun b!1198402 () Bool)

(declare-fun e!680747 () Bool)

(declare-fun tp_is_empty!30431 () Bool)

(assert (=> b!1198402 (= e!680747 tp_is_empty!30431)))

(declare-fun b!1198403 () Bool)

(declare-fun res!797577 () Bool)

(assert (=> b!1198403 (=> (not res!797577) (not e!680749))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198403 (= res!797577 (= (select (arr!37465 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47489 () Bool)

(assert (=> mapIsEmpty!47489 mapRes!47489))

(declare-fun b!1198404 () Bool)

(declare-fun res!797579 () Bool)

(assert (=> b!1198404 (=> (not res!797579) (not e!680749))))

(assert (=> b!1198404 (= res!797579 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38001 _keys!1208))))))

(declare-fun b!1198405 () Bool)

(declare-fun res!797581 () Bool)

(assert (=> b!1198405 (=> (not res!797581) (not e!680749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198405 (= res!797581 (validMask!0 mask!1564))))

(declare-fun b!1198398 () Bool)

(declare-fun res!797575 () Bool)

(assert (=> b!1198398 (=> (not res!797575) (not e!680749))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198398 (= res!797575 (and (= (size!38002 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38001 _keys!1208) (size!38002 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!797574 () Bool)

(assert (=> start!100404 (=> (not res!797574) (not e!680749))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100404 (= res!797574 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38001 _keys!1208))))))

(assert (=> start!100404 e!680749))

(assert (=> start!100404 tp_is_empty!30431))

(declare-fun array_inv!28552 (array!77641) Bool)

(assert (=> start!100404 (array_inv!28552 _keys!1208)))

(assert (=> start!100404 true))

(assert (=> start!100404 tp!90171))

(declare-fun e!680752 () Bool)

(declare-fun array_inv!28553 (array!77643) Bool)

(assert (=> start!100404 (and (array_inv!28553 _values!996) e!680752)))

(declare-fun b!1198406 () Bool)

(declare-fun res!797573 () Bool)

(assert (=> b!1198406 (=> (not res!797573) (not e!680749))))

(assert (=> b!1198406 (= res!797573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198407 () Bool)

(declare-fun e!680750 () Bool)

(assert (=> b!1198407 (= e!680746 (not e!680750))))

(declare-fun res!797580 () Bool)

(assert (=> b!1198407 (=> res!797580 e!680750)))

(assert (=> b!1198407 (= res!797580 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198407 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39732 0))(
  ( (Unit!39733) )
))
(declare-fun lt!543487 () Unit!39732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77641 (_ BitVec 64) (_ BitVec 32)) Unit!39732)

(assert (=> b!1198407 (= lt!543487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198408 () Bool)

(declare-fun res!797583 () Bool)

(assert (=> b!1198408 (=> (not res!797583) (not e!680749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198408 (= res!797583 (validKeyInArray!0 k!934))))

(declare-fun b!1198409 () Bool)

(assert (=> b!1198409 (= e!680751 tp_is_empty!30431)))

(declare-fun b!1198410 () Bool)

(assert (=> b!1198410 (= e!680752 (and e!680747 mapRes!47489))))

(declare-fun condMapEmpty!47489 () Bool)

(declare-fun mapDefault!47489 () ValueCell!14506)

