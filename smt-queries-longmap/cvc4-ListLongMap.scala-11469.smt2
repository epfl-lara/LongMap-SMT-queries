; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133616 () Bool)

(assert start!133616)

(declare-fun b_free!32033 () Bool)

(declare-fun b_next!32033 () Bool)

(assert (=> start!133616 (= b_free!32033 (not b_next!32033))))

(declare-fun tp!113223 () Bool)

(declare-fun b_and!51577 () Bool)

(assert (=> start!133616 (= tp!113223 b_and!51577)))

(declare-fun b!1562263 () Bool)

(declare-fun res!1068140 () Bool)

(declare-fun e!870579 () Bool)

(assert (=> b!1562263 (=> (not res!1068140) (not e!870579))))

(declare-datatypes ((array!104114 0))(
  ( (array!104115 (arr!50249 (Array (_ BitVec 32) (_ BitVec 64))) (size!50799 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104114)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562263 (= res!1068140 (validKeyInArray!0 (select (arr!50249 _keys!637) from!782)))))

(declare-fun b!1562264 () Bool)

(declare-fun res!1068144 () Bool)

(assert (=> b!1562264 (=> (not res!1068144) (not e!870579))))

(declare-datatypes ((List!36475 0))(
  ( (Nil!36472) (Cons!36471 (h!37917 (_ BitVec 64)) (t!51298 List!36475)) )
))
(declare-fun arrayNoDuplicates!0 (array!104114 (_ BitVec 32) List!36475) Bool)

(assert (=> b!1562264 (= res!1068144 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36472))))

(declare-fun res!1068141 () Bool)

(assert (=> start!133616 (=> (not res!1068141) (not e!870579))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133616 (= res!1068141 (validMask!0 mask!947))))

(assert (=> start!133616 e!870579))

(assert (=> start!133616 tp!113223))

(declare-fun tp_is_empty!38699 () Bool)

(assert (=> start!133616 tp_is_empty!38699))

(assert (=> start!133616 true))

(declare-fun array_inv!39057 (array!104114) Bool)

(assert (=> start!133616 (array_inv!39057 _keys!637)))

(declare-datatypes ((V!59805 0))(
  ( (V!59806 (val!19433 Int)) )
))
(declare-datatypes ((ValueCell!18319 0))(
  ( (ValueCellFull!18319 (v!22185 V!59805)) (EmptyCell!18319) )
))
(declare-datatypes ((array!104116 0))(
  ( (array!104117 (arr!50250 (Array (_ BitVec 32) ValueCell!18319)) (size!50800 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104116)

(declare-fun e!870581 () Bool)

(declare-fun array_inv!39058 (array!104116) Bool)

(assert (=> start!133616 (and (array_inv!39058 _values!487) e!870581)))

(declare-fun b!1562265 () Bool)

(declare-fun e!870580 () Bool)

(assert (=> b!1562265 (= e!870580 tp_is_empty!38699)))

(declare-fun mapIsEmpty!59424 () Bool)

(declare-fun mapRes!59424 () Bool)

(assert (=> mapIsEmpty!59424 mapRes!59424))

(declare-fun b!1562266 () Bool)

(declare-fun res!1068139 () Bool)

(assert (=> b!1562266 (=> (not res!1068139) (not e!870579))))

(assert (=> b!1562266 (= res!1068139 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50799 _keys!637)) (bvslt from!782 (size!50799 _keys!637))))))

(declare-fun b!1562267 () Bool)

(declare-fun res!1068143 () Bool)

(assert (=> b!1562267 (=> (not res!1068143) (not e!870579))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562267 (= res!1068143 (and (= (size!50800 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50799 _keys!637) (size!50800 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562268 () Bool)

(assert (=> b!1562268 (= e!870579 (not true))))

(declare-fun lt!671570 () Bool)

(declare-datatypes ((tuple2!25104 0))(
  ( (tuple2!25105 (_1!12563 (_ BitVec 64)) (_2!12563 V!59805)) )
))
(declare-datatypes ((List!36476 0))(
  ( (Nil!36473) (Cons!36472 (h!37918 tuple2!25104) (t!51299 List!36476)) )
))
(declare-datatypes ((ListLongMap!22539 0))(
  ( (ListLongMap!22540 (toList!11285 List!36476)) )
))
(declare-fun lt!671572 () ListLongMap!22539)

(declare-fun contains!10275 (ListLongMap!22539 (_ BitVec 64)) Bool)

(assert (=> b!1562268 (= lt!671570 (contains!10275 lt!671572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562268 (not (contains!10275 lt!671572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671571 () V!59805)

(declare-fun lt!671574 () ListLongMap!22539)

(declare-fun +!5055 (ListLongMap!22539 tuple2!25104) ListLongMap!22539)

(assert (=> b!1562268 (= lt!671572 (+!5055 lt!671574 (tuple2!25105 (select (arr!50249 _keys!637) from!782) lt!671571)))))

(declare-datatypes ((Unit!51964 0))(
  ( (Unit!51965) )
))
(declare-fun lt!671573 () Unit!51964)

(declare-fun addStillNotContains!545 (ListLongMap!22539 (_ BitVec 64) V!59805 (_ BitVec 64)) Unit!51964)

(assert (=> b!1562268 (= lt!671573 (addStillNotContains!545 lt!671574 (select (arr!50249 _keys!637) from!782) lt!671571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26242 (ValueCell!18319 V!59805) V!59805)

(declare-fun dynLambda!3839 (Int (_ BitVec 64)) V!59805)

(assert (=> b!1562268 (= lt!671571 (get!26242 (select (arr!50250 _values!487) from!782) (dynLambda!3839 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59805)

(declare-fun minValue!453 () V!59805)

(declare-fun getCurrentListMapNoExtraKeys!6669 (array!104114 array!104116 (_ BitVec 32) (_ BitVec 32) V!59805 V!59805 (_ BitVec 32) Int) ListLongMap!22539)

(assert (=> b!1562268 (= lt!671574 (getCurrentListMapNoExtraKeys!6669 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562269 () Bool)

(declare-fun e!870582 () Bool)

(assert (=> b!1562269 (= e!870582 tp_is_empty!38699)))

(declare-fun b!1562270 () Bool)

(declare-fun res!1068142 () Bool)

(assert (=> b!1562270 (=> (not res!1068142) (not e!870579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104114 (_ BitVec 32)) Bool)

(assert (=> b!1562270 (= res!1068142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59424 () Bool)

(declare-fun tp!113222 () Bool)

(assert (=> mapNonEmpty!59424 (= mapRes!59424 (and tp!113222 e!870582))))

(declare-fun mapRest!59424 () (Array (_ BitVec 32) ValueCell!18319))

(declare-fun mapValue!59424 () ValueCell!18319)

(declare-fun mapKey!59424 () (_ BitVec 32))

(assert (=> mapNonEmpty!59424 (= (arr!50250 _values!487) (store mapRest!59424 mapKey!59424 mapValue!59424))))

(declare-fun b!1562271 () Bool)

(assert (=> b!1562271 (= e!870581 (and e!870580 mapRes!59424))))

(declare-fun condMapEmpty!59424 () Bool)

(declare-fun mapDefault!59424 () ValueCell!18319)

