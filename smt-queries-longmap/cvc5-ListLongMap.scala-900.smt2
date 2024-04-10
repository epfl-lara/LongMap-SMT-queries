; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20496 () Bool)

(assert start!20496)

(declare-fun b_free!5155 () Bool)

(declare-fun b_next!5155 () Bool)

(assert (=> start!20496 (= b_free!5155 (not b_next!5155))))

(declare-fun tp!18496 () Bool)

(declare-fun b_and!11901 () Bool)

(assert (=> start!20496 (= tp!18496 b_and!11901)))

(declare-fun b!203427 () Bool)

(declare-fun e!133178 () Bool)

(declare-fun e!133176 () Bool)

(assert (=> b!203427 (= e!133178 (not e!133176))))

(declare-fun res!97747 () Bool)

(assert (=> b!203427 (=> res!97747 e!133176)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203427 (= res!97747 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6329 0))(
  ( (V!6330 (val!2550 Int)) )
))
(declare-datatypes ((tuple2!3870 0))(
  ( (tuple2!3871 (_1!1946 (_ BitVec 64)) (_2!1946 V!6329)) )
))
(declare-datatypes ((List!2772 0))(
  ( (Nil!2769) (Cons!2768 (h!3410 tuple2!3870) (t!7703 List!2772)) )
))
(declare-datatypes ((ListLongMap!2783 0))(
  ( (ListLongMap!2784 (toList!1407 List!2772)) )
))
(declare-fun lt!102615 () ListLongMap!2783)

(declare-datatypes ((ValueCell!2162 0))(
  ( (ValueCellFull!2162 (v!4520 V!6329)) (EmptyCell!2162) )
))
(declare-datatypes ((array!9245 0))(
  ( (array!9246 (arr!4373 (Array (_ BitVec 32) ValueCell!2162)) (size!4698 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9245)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6329)

(declare-datatypes ((array!9247 0))(
  ( (array!9248 (arr!4374 (Array (_ BitVec 32) (_ BitVec 64))) (size!4699 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9247)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6329)

(declare-fun getCurrentListMap!982 (array!9247 array!9245 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2783)

(assert (=> b!203427 (= lt!102615 (getCurrentListMap!982 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102612 () array!9245)

(declare-fun lt!102614 () ListLongMap!2783)

(assert (=> b!203427 (= lt!102614 (getCurrentListMap!982 _keys!825 lt!102612 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102607 () ListLongMap!2783)

(declare-fun lt!102605 () ListLongMap!2783)

(assert (=> b!203427 (and (= lt!102607 lt!102605) (= lt!102605 lt!102607))))

(declare-fun lt!102604 () ListLongMap!2783)

(declare-fun lt!102613 () tuple2!3870)

(declare-fun +!434 (ListLongMap!2783 tuple2!3870) ListLongMap!2783)

(assert (=> b!203427 (= lt!102605 (+!434 lt!102604 lt!102613))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6329)

(assert (=> b!203427 (= lt!102613 (tuple2!3871 k!843 v!520))))

(declare-datatypes ((Unit!6162 0))(
  ( (Unit!6163) )
))
(declare-fun lt!102609 () Unit!6162)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!95 (array!9247 array!9245 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) (_ BitVec 64) V!6329 (_ BitVec 32) Int) Unit!6162)

(assert (=> b!203427 (= lt!102609 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!95 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!356 (array!9247 array!9245 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2783)

(assert (=> b!203427 (= lt!102607 (getCurrentListMapNoExtraKeys!356 _keys!825 lt!102612 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203427 (= lt!102612 (array!9246 (store (arr!4373 _values!649) i!601 (ValueCellFull!2162 v!520)) (size!4698 _values!649)))))

(assert (=> b!203427 (= lt!102604 (getCurrentListMapNoExtraKeys!356 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8585 () Bool)

(declare-fun mapRes!8585 () Bool)

(assert (=> mapIsEmpty!8585 mapRes!8585))

(declare-fun b!203428 () Bool)

(declare-fun e!133179 () Bool)

(declare-fun e!133181 () Bool)

(assert (=> b!203428 (= e!133179 (and e!133181 mapRes!8585))))

(declare-fun condMapEmpty!8585 () Bool)

(declare-fun mapDefault!8585 () ValueCell!2162)

