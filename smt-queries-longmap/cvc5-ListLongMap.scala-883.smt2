; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20394 () Bool)

(assert start!20394)

(declare-fun b_free!5053 () Bool)

(declare-fun b_next!5053 () Bool)

(assert (=> start!20394 (= b_free!5053 (not b_next!5053))))

(declare-fun tp!18190 () Bool)

(declare-fun b_and!11799 () Bool)

(assert (=> start!20394 (= tp!18190 b_and!11799)))

(declare-fun b!201582 () Bool)

(declare-fun res!96364 () Bool)

(declare-fun e!132110 () Bool)

(assert (=> b!201582 (=> (not res!96364) (not e!132110))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9047 0))(
  ( (array!9048 (arr!4274 (Array (_ BitVec 32) (_ BitVec 64))) (size!4599 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9047)

(assert (=> b!201582 (= res!96364 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4599 _keys!825))))))

(declare-fun res!96366 () Bool)

(assert (=> start!20394 (=> (not res!96366) (not e!132110))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20394 (= res!96366 (validMask!0 mask!1149))))

(assert (=> start!20394 e!132110))

(declare-datatypes ((V!6193 0))(
  ( (V!6194 (val!2499 Int)) )
))
(declare-datatypes ((ValueCell!2111 0))(
  ( (ValueCellFull!2111 (v!4469 V!6193)) (EmptyCell!2111) )
))
(declare-datatypes ((array!9049 0))(
  ( (array!9050 (arr!4275 (Array (_ BitVec 32) ValueCell!2111)) (size!4600 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9049)

(declare-fun e!132106 () Bool)

(declare-fun array_inv!2821 (array!9049) Bool)

(assert (=> start!20394 (and (array_inv!2821 _values!649) e!132106)))

(assert (=> start!20394 true))

(declare-fun tp_is_empty!4909 () Bool)

(assert (=> start!20394 tp_is_empty!4909))

(declare-fun array_inv!2822 (array!9047) Bool)

(assert (=> start!20394 (array_inv!2822 _keys!825)))

(assert (=> start!20394 tp!18190))

(declare-fun b!201583 () Bool)

(declare-fun e!132105 () Bool)

(assert (=> b!201583 (= e!132105 tp_is_empty!4909)))

(declare-fun mapIsEmpty!8432 () Bool)

(declare-fun mapRes!8432 () Bool)

(assert (=> mapIsEmpty!8432 mapRes!8432))

(declare-fun b!201584 () Bool)

(declare-fun res!96365 () Bool)

(assert (=> b!201584 (=> (not res!96365) (not e!132110))))

(declare-datatypes ((List!2696 0))(
  ( (Nil!2693) (Cons!2692 (h!3334 (_ BitVec 64)) (t!7627 List!2696)) )
))
(declare-fun arrayNoDuplicates!0 (array!9047 (_ BitVec 32) List!2696) Bool)

(assert (=> b!201584 (= res!96365 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2693))))

(declare-fun b!201585 () Bool)

(declare-fun e!132108 () Bool)

(assert (=> b!201585 (= e!132110 (not e!132108))))

(declare-fun res!96360 () Bool)

(assert (=> b!201585 (=> res!96360 e!132108)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201585 (= res!96360 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3784 0))(
  ( (tuple2!3785 (_1!1903 (_ BitVec 64)) (_2!1903 V!6193)) )
))
(declare-datatypes ((List!2697 0))(
  ( (Nil!2694) (Cons!2693 (h!3335 tuple2!3784) (t!7628 List!2697)) )
))
(declare-datatypes ((ListLongMap!2697 0))(
  ( (ListLongMap!2698 (toList!1364 List!2697)) )
))
(declare-fun lt!100567 () ListLongMap!2697)

(declare-fun zeroValue!615 () V!6193)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6193)

(declare-fun getCurrentListMap!952 (array!9047 array!9049 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2697)

(assert (=> b!201585 (= lt!100567 (getCurrentListMap!952 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100565 () array!9049)

(declare-fun lt!100571 () ListLongMap!2697)

(assert (=> b!201585 (= lt!100571 (getCurrentListMap!952 _keys!825 lt!100565 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100566 () ListLongMap!2697)

(declare-fun lt!100569 () ListLongMap!2697)

(assert (=> b!201585 (and (= lt!100566 lt!100569) (= lt!100569 lt!100566))))

(declare-fun lt!100574 () ListLongMap!2697)

(declare-fun lt!100563 () tuple2!3784)

(declare-fun +!391 (ListLongMap!2697 tuple2!3784) ListLongMap!2697)

(assert (=> b!201585 (= lt!100569 (+!391 lt!100574 lt!100563))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6193)

(assert (=> b!201585 (= lt!100563 (tuple2!3785 k!843 v!520))))

(declare-datatypes ((Unit!6082 0))(
  ( (Unit!6083) )
))
(declare-fun lt!100561 () Unit!6082)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!65 (array!9047 array!9049 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) (_ BitVec 64) V!6193 (_ BitVec 32) Int) Unit!6082)

(assert (=> b!201585 (= lt!100561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!65 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!326 (array!9047 array!9049 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2697)

(assert (=> b!201585 (= lt!100566 (getCurrentListMapNoExtraKeys!326 _keys!825 lt!100565 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201585 (= lt!100565 (array!9050 (store (arr!4275 _values!649) i!601 (ValueCellFull!2111 v!520)) (size!4600 _values!649)))))

(assert (=> b!201585 (= lt!100574 (getCurrentListMapNoExtraKeys!326 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201586 () Bool)

(declare-fun e!132109 () Bool)

(assert (=> b!201586 (= e!132109 true)))

(declare-fun lt!100575 () ListLongMap!2697)

(declare-fun lt!100568 () tuple2!3784)

(declare-fun lt!100570 () ListLongMap!2697)

(assert (=> b!201586 (= (+!391 lt!100570 lt!100568) (+!391 lt!100575 lt!100563))))

(declare-fun lt!100560 () ListLongMap!2697)

(declare-fun lt!100564 () Unit!6082)

(declare-fun addCommutativeForDiffKeys!112 (ListLongMap!2697 (_ BitVec 64) V!6193 (_ BitVec 64) V!6193) Unit!6082)

(assert (=> b!201586 (= lt!100564 (addCommutativeForDiffKeys!112 lt!100560 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201587 () Bool)

(assert (=> b!201587 (= e!132106 (and e!132105 mapRes!8432))))

(declare-fun condMapEmpty!8432 () Bool)

(declare-fun mapDefault!8432 () ValueCell!2111)

