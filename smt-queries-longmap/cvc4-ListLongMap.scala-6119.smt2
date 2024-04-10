; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78826 () Bool)

(assert start!78826)

(declare-fun b_free!17039 () Bool)

(declare-fun b_next!17039 () Bool)

(assert (=> start!78826 (= b_free!17039 (not b_next!17039))))

(declare-fun tp!59558 () Bool)

(declare-fun b_and!27815 () Bool)

(assert (=> start!78826 (= tp!59558 b_and!27815)))

(declare-fun b!920419 () Bool)

(declare-fun e!516585 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920419 (= e!516585 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!920420 () Bool)

(declare-datatypes ((array!55074 0))(
  ( (array!55075 (arr!26482 (Array (_ BitVec 32) (_ BitVec 64))) (size!26941 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55074)

(declare-fun arrayContainsKey!0 (array!55074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920420 (= e!516585 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920421 () Bool)

(declare-fun e!516590 () Bool)

(declare-fun tp_is_empty!19547 () Bool)

(assert (=> b!920421 (= e!516590 tp_is_empty!19547)))

(declare-fun b!920422 () Bool)

(declare-fun res!620682 () Bool)

(declare-fun e!516587 () Bool)

(assert (=> b!920422 (=> (not res!620682) (not e!516587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920422 (= res!620682 (validKeyInArray!0 k!1099))))

(declare-fun b!920423 () Bool)

(declare-fun res!620683 () Bool)

(declare-fun e!516591 () Bool)

(assert (=> b!920423 (=> res!620683 e!516591)))

(declare-datatypes ((List!18575 0))(
  ( (Nil!18572) (Cons!18571 (h!19717 (_ BitVec 64)) (t!26344 List!18575)) )
))
(declare-fun noDuplicate!1333 (List!18575) Bool)

(assert (=> b!920423 (= res!620683 (not (noDuplicate!1333 Nil!18572)))))

(declare-fun b!920424 () Bool)

(declare-fun e!516589 () Bool)

(assert (=> b!920424 (= e!516589 e!516587)))

(declare-fun res!620678 () Bool)

(assert (=> b!920424 (=> (not res!620678) (not e!516587))))

(declare-datatypes ((V!31027 0))(
  ( (V!31028 (val!9824 Int)) )
))
(declare-datatypes ((tuple2!12772 0))(
  ( (tuple2!12773 (_1!6397 (_ BitVec 64)) (_2!6397 V!31027)) )
))
(declare-datatypes ((List!18576 0))(
  ( (Nil!18573) (Cons!18572 (h!19718 tuple2!12772) (t!26345 List!18576)) )
))
(declare-datatypes ((ListLongMap!11469 0))(
  ( (ListLongMap!11470 (toList!5750 List!18576)) )
))
(declare-fun lt!413205 () ListLongMap!11469)

(declare-fun contains!4797 (ListLongMap!11469 (_ BitVec 64)) Bool)

(assert (=> b!920424 (= res!620678 (contains!4797 lt!413205 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9292 0))(
  ( (ValueCellFull!9292 (v!12342 V!31027)) (EmptyCell!9292) )
))
(declare-datatypes ((array!55076 0))(
  ( (array!55077 (arr!26483 (Array (_ BitVec 32) ValueCell!9292)) (size!26942 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55076)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31027)

(declare-fun minValue!1173 () V!31027)

(declare-fun getCurrentListMap!3005 (array!55074 array!55076 (_ BitVec 32) (_ BitVec 32) V!31027 V!31027 (_ BitVec 32) Int) ListLongMap!11469)

(assert (=> b!920424 (= lt!413205 (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31077 () Bool)

(declare-fun mapRes!31077 () Bool)

(declare-fun tp!59557 () Bool)

(declare-fun e!516584 () Bool)

(assert (=> mapNonEmpty!31077 (= mapRes!31077 (and tp!59557 e!516584))))

(declare-fun mapRest!31077 () (Array (_ BitVec 32) ValueCell!9292))

(declare-fun mapKey!31077 () (_ BitVec 32))

(declare-fun mapValue!31077 () ValueCell!9292)

(assert (=> mapNonEmpty!31077 (= (arr!26483 _values!1231) (store mapRest!31077 mapKey!31077 mapValue!31077))))

(declare-fun b!920425 () Bool)

(declare-fun res!620680 () Bool)

(assert (=> b!920425 (=> (not res!620680) (not e!516589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55074 (_ BitVec 32)) Bool)

(assert (=> b!920425 (= res!620680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920426 () Bool)

(declare-fun res!620676 () Bool)

(assert (=> b!920426 (=> (not res!620676) (not e!516589))))

(assert (=> b!920426 (= res!620676 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26941 _keys!1487))))))

(declare-fun b!920427 () Bool)

(declare-fun res!620679 () Bool)

(assert (=> b!920427 (=> (not res!620679) (not e!516589))))

(assert (=> b!920427 (= res!620679 (and (= (size!26942 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26941 _keys!1487) (size!26942 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620675 () Bool)

(assert (=> start!78826 (=> (not res!620675) (not e!516589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78826 (= res!620675 (validMask!0 mask!1881))))

(assert (=> start!78826 e!516589))

(assert (=> start!78826 true))

(assert (=> start!78826 tp_is_empty!19547))

(declare-fun e!516586 () Bool)

(declare-fun array_inv!20638 (array!55076) Bool)

(assert (=> start!78826 (and (array_inv!20638 _values!1231) e!516586)))

(assert (=> start!78826 tp!59558))

(declare-fun array_inv!20639 (array!55074) Bool)

(assert (=> start!78826 (array_inv!20639 _keys!1487)))

(declare-fun b!920428 () Bool)

(declare-fun res!620674 () Bool)

(assert (=> b!920428 (=> res!620674 e!516591)))

(declare-fun contains!4798 (List!18575 (_ BitVec 64)) Bool)

(assert (=> b!920428 (= res!620674 (contains!4798 Nil!18572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920429 () Bool)

(declare-fun e!516592 () Bool)

(assert (=> b!920429 (= e!516587 e!516592)))

(declare-fun res!620686 () Bool)

(assert (=> b!920429 (=> (not res!620686) (not e!516592))))

(declare-fun lt!413202 () (_ BitVec 64))

(assert (=> b!920429 (= res!620686 (validKeyInArray!0 lt!413202))))

(assert (=> b!920429 (= lt!413202 (select (arr!26482 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920430 () Bool)

(declare-fun res!620684 () Bool)

(assert (=> b!920430 (=> (not res!620684) (not e!516587))))

(assert (=> b!920430 (= res!620684 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920431 () Bool)

(assert (=> b!920431 (= e!516592 (not e!516591))))

(declare-fun res!620681 () Bool)

(assert (=> b!920431 (=> res!620681 e!516591)))

(assert (=> b!920431 (= res!620681 (or (bvsge (size!26941 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26941 _keys!1487))))))

(assert (=> b!920431 e!516585))

(declare-fun c!96060 () Bool)

(assert (=> b!920431 (= c!96060 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31064 0))(
  ( (Unit!31065) )
))
(declare-fun lt!413208 () Unit!31064)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!165 (array!55074 array!55076 (_ BitVec 32) (_ BitVec 32) V!31027 V!31027 (_ BitVec 64) (_ BitVec 32) Int) Unit!31064)

(assert (=> b!920431 (= lt!413208 (lemmaListMapContainsThenArrayContainsFrom!165 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55074 (_ BitVec 32) List!18575) Bool)

(assert (=> b!920431 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18572)))

(declare-fun lt!413201 () Unit!31064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55074 (_ BitVec 32) (_ BitVec 32)) Unit!31064)

(assert (=> b!920431 (= lt!413201 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413204 () tuple2!12772)

(declare-fun +!2658 (ListLongMap!11469 tuple2!12772) ListLongMap!11469)

(assert (=> b!920431 (contains!4797 (+!2658 lt!413205 lt!413204) k!1099)))

(declare-fun lt!413206 () V!31027)

(declare-fun lt!413207 () Unit!31064)

(declare-fun addStillContains!382 (ListLongMap!11469 (_ BitVec 64) V!31027 (_ BitVec 64)) Unit!31064)

(assert (=> b!920431 (= lt!413207 (addStillContains!382 lt!413205 lt!413202 lt!413206 k!1099))))

(assert (=> b!920431 (= (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2658 (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413204))))

(assert (=> b!920431 (= lt!413204 (tuple2!12773 lt!413202 lt!413206))))

(declare-fun get!13893 (ValueCell!9292 V!31027) V!31027)

(declare-fun dynLambda!1447 (Int (_ BitVec 64)) V!31027)

(assert (=> b!920431 (= lt!413206 (get!13893 (select (arr!26483 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1447 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413203 () Unit!31064)

(declare-fun lemmaListMapRecursiveValidKeyArray!48 (array!55074 array!55076 (_ BitVec 32) (_ BitVec 32) V!31027 V!31027 (_ BitVec 32) Int) Unit!31064)

(assert (=> b!920431 (= lt!413203 (lemmaListMapRecursiveValidKeyArray!48 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920432 () Bool)

(declare-fun res!620677 () Bool)

(assert (=> b!920432 (=> (not res!620677) (not e!516589))))

(assert (=> b!920432 (= res!620677 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18572))))

(declare-fun b!920433 () Bool)

(declare-fun res!620685 () Bool)

(assert (=> b!920433 (=> (not res!620685) (not e!516587))))

(declare-fun v!791 () V!31027)

(declare-fun apply!592 (ListLongMap!11469 (_ BitVec 64)) V!31027)

(assert (=> b!920433 (= res!620685 (= (apply!592 lt!413205 k!1099) v!791))))

(declare-fun b!920434 () Bool)

(assert (=> b!920434 (= e!516591 true)))

(declare-fun lt!413209 () Bool)

(assert (=> b!920434 (= lt!413209 (contains!4798 Nil!18572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!31077 () Bool)

(assert (=> mapIsEmpty!31077 mapRes!31077))

(declare-fun b!920435 () Bool)

(assert (=> b!920435 (= e!516586 (and e!516590 mapRes!31077))))

(declare-fun condMapEmpty!31077 () Bool)

(declare-fun mapDefault!31077 () ValueCell!9292)

