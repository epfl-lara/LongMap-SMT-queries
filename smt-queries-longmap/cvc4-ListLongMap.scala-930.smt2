; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20680 () Bool)

(assert start!20680)

(declare-fun b_free!5339 () Bool)

(declare-fun b_next!5339 () Bool)

(assert (=> start!20680 (= b_free!5339 (not b_next!5339))))

(declare-fun tp!19048 () Bool)

(declare-fun b_and!12085 () Bool)

(assert (=> start!20680 (= tp!19048 b_and!12085)))

(declare-fun b!206696 () Bool)

(declare-fun res!100190 () Bool)

(declare-fun e!135057 () Bool)

(assert (=> b!206696 (=> (not res!100190) (not e!135057))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206696 (= res!100190 (validKeyInArray!0 k!843))))

(declare-fun b!206697 () Bool)

(assert (=> b!206697 (= e!135057 (not true))))

(declare-datatypes ((V!6573 0))(
  ( (V!6574 (val!2642 Int)) )
))
(declare-datatypes ((tuple2!4012 0))(
  ( (tuple2!4013 (_1!2017 (_ BitVec 64)) (_2!2017 V!6573)) )
))
(declare-datatypes ((List!2904 0))(
  ( (Nil!2901) (Cons!2900 (h!3542 tuple2!4012) (t!7835 List!2904)) )
))
(declare-datatypes ((ListLongMap!2925 0))(
  ( (ListLongMap!2926 (toList!1478 List!2904)) )
))
(declare-fun lt!105750 () ListLongMap!2925)

(declare-datatypes ((ValueCell!2254 0))(
  ( (ValueCellFull!2254 (v!4612 V!6573)) (EmptyCell!2254) )
))
(declare-datatypes ((array!9601 0))(
  ( (array!9602 (arr!4551 (Array (_ BitVec 32) ValueCell!2254)) (size!4876 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9601)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6573)

(declare-datatypes ((array!9603 0))(
  ( (array!9604 (arr!4552 (Array (_ BitVec 32) (_ BitVec 64))) (size!4877 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9603)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6573)

(declare-fun getCurrentListMap!1045 (array!9603 array!9601 (_ BitVec 32) (_ BitVec 32) V!6573 V!6573 (_ BitVec 32) Int) ListLongMap!2925)

(assert (=> b!206697 (= lt!105750 (getCurrentListMap!1045 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105752 () array!9601)

(declare-fun lt!105756 () ListLongMap!2925)

(assert (=> b!206697 (= lt!105756 (getCurrentListMap!1045 _keys!825 lt!105752 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105755 () ListLongMap!2925)

(declare-fun lt!105751 () ListLongMap!2925)

(assert (=> b!206697 (and (= lt!105755 lt!105751) (= lt!105751 lt!105755))))

(declare-fun lt!105754 () ListLongMap!2925)

(declare-fun v!520 () V!6573)

(declare-fun +!505 (ListLongMap!2925 tuple2!4012) ListLongMap!2925)

(assert (=> b!206697 (= lt!105751 (+!505 lt!105754 (tuple2!4013 k!843 v!520)))))

(declare-datatypes ((Unit!6298 0))(
  ( (Unit!6299) )
))
(declare-fun lt!105753 () Unit!6298)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!158 (array!9603 array!9601 (_ BitVec 32) (_ BitVec 32) V!6573 V!6573 (_ BitVec 32) (_ BitVec 64) V!6573 (_ BitVec 32) Int) Unit!6298)

(assert (=> b!206697 (= lt!105753 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!158 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!419 (array!9603 array!9601 (_ BitVec 32) (_ BitVec 32) V!6573 V!6573 (_ BitVec 32) Int) ListLongMap!2925)

(assert (=> b!206697 (= lt!105755 (getCurrentListMapNoExtraKeys!419 _keys!825 lt!105752 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206697 (= lt!105752 (array!9602 (store (arr!4551 _values!649) i!601 (ValueCellFull!2254 v!520)) (size!4876 _values!649)))))

(assert (=> b!206697 (= lt!105754 (getCurrentListMapNoExtraKeys!419 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206698 () Bool)

(declare-fun e!135059 () Bool)

(declare-fun tp_is_empty!5195 () Bool)

(assert (=> b!206698 (= e!135059 tp_is_empty!5195)))

(declare-fun b!206699 () Bool)

(declare-fun res!100188 () Bool)

(assert (=> b!206699 (=> (not res!100188) (not e!135057))))

(assert (=> b!206699 (= res!100188 (and (= (size!4876 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4877 _keys!825) (size!4876 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206700 () Bool)

(declare-fun res!100191 () Bool)

(assert (=> b!206700 (=> (not res!100191) (not e!135057))))

(assert (=> b!206700 (= res!100191 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4877 _keys!825))))))

(declare-fun b!206701 () Bool)

(declare-fun e!135055 () Bool)

(declare-fun mapRes!8861 () Bool)

(assert (=> b!206701 (= e!135055 (and e!135059 mapRes!8861))))

(declare-fun condMapEmpty!8861 () Bool)

(declare-fun mapDefault!8861 () ValueCell!2254)

