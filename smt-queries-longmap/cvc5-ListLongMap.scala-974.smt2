; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21082 () Bool)

(assert start!21082)

(declare-fun b_free!5593 () Bool)

(declare-fun b_next!5593 () Bool)

(assert (=> start!21082 (= b_free!5593 (not b_next!5593))))

(declare-fun tp!19841 () Bool)

(declare-fun b_and!12423 () Bool)

(assert (=> start!21082 (= tp!19841 b_and!12423)))

(declare-fun b!212091 () Bool)

(declare-fun res!103656 () Bool)

(declare-fun e!138019 () Bool)

(assert (=> b!212091 (=> (not res!103656) (not e!138019))))

(declare-datatypes ((array!10113 0))(
  ( (array!10114 (arr!4800 (Array (_ BitVec 32) (_ BitVec 64))) (size!5125 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10113)

(declare-datatypes ((List!3084 0))(
  ( (Nil!3081) (Cons!3080 (h!3722 (_ BitVec 64)) (t!8029 List!3084)) )
))
(declare-fun arrayNoDuplicates!0 (array!10113 (_ BitVec 32) List!3084) Bool)

(assert (=> b!212091 (= res!103656 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3081))))

(declare-fun b!212092 () Bool)

(declare-fun e!138023 () Bool)

(declare-fun e!138021 () Bool)

(assert (=> b!212092 (= e!138023 e!138021)))

(declare-fun res!103663 () Bool)

(assert (=> b!212092 (=> res!103663 e!138021)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!212092 (= res!103663 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6921 0))(
  ( (V!6922 (val!2772 Int)) )
))
(declare-datatypes ((tuple2!4194 0))(
  ( (tuple2!4195 (_1!2108 (_ BitVec 64)) (_2!2108 V!6921)) )
))
(declare-datatypes ((List!3085 0))(
  ( (Nil!3082) (Cons!3081 (h!3723 tuple2!4194) (t!8030 List!3085)) )
))
(declare-datatypes ((ListLongMap!3107 0))(
  ( (ListLongMap!3108 (toList!1569 List!3085)) )
))
(declare-fun lt!109234 () ListLongMap!3107)

(declare-fun lt!109237 () ListLongMap!3107)

(assert (=> b!212092 (= lt!109234 lt!109237)))

(declare-fun lt!109236 () ListLongMap!3107)

(declare-fun lt!109239 () tuple2!4194)

(declare-fun +!572 (ListLongMap!3107 tuple2!4194) ListLongMap!3107)

(assert (=> b!212092 (= lt!109237 (+!572 lt!109236 lt!109239))))

(declare-fun lt!109240 () ListLongMap!3107)

(declare-fun lt!109238 () ListLongMap!3107)

(assert (=> b!212092 (= lt!109240 lt!109238)))

(declare-fun lt!109233 () ListLongMap!3107)

(assert (=> b!212092 (= lt!109238 (+!572 lt!109233 lt!109239))))

(declare-fun lt!109241 () ListLongMap!3107)

(assert (=> b!212092 (= lt!109234 (+!572 lt!109241 lt!109239))))

(declare-fun zeroValue!615 () V!6921)

(assert (=> b!212092 (= lt!109239 (tuple2!4195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!9272 () Bool)

(declare-fun mapRes!9272 () Bool)

(declare-fun tp!19840 () Bool)

(declare-fun e!138022 () Bool)

(assert (=> mapNonEmpty!9272 (= mapRes!9272 (and tp!19840 e!138022))))

(declare-datatypes ((ValueCell!2384 0))(
  ( (ValueCellFull!2384 (v!4770 V!6921)) (EmptyCell!2384) )
))
(declare-fun mapRest!9272 () (Array (_ BitVec 32) ValueCell!2384))

(declare-fun mapValue!9272 () ValueCell!2384)

(declare-fun mapKey!9272 () (_ BitVec 32))

(declare-datatypes ((array!10115 0))(
  ( (array!10116 (arr!4801 (Array (_ BitVec 32) ValueCell!2384)) (size!5126 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10115)

(assert (=> mapNonEmpty!9272 (= (arr!4801 _values!649) (store mapRest!9272 mapKey!9272 mapValue!9272))))

(declare-fun b!212093 () Bool)

(declare-fun e!138017 () Bool)

(declare-fun tp_is_empty!5455 () Bool)

(assert (=> b!212093 (= e!138017 tp_is_empty!5455)))

(declare-fun b!212094 () Bool)

(assert (=> b!212094 (= e!138019 (not e!138023))))

(declare-fun res!103662 () Bool)

(assert (=> b!212094 (=> res!103662 e!138023)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212094 (= res!103662 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6921)

(declare-fun getCurrentListMap!1102 (array!10113 array!10115 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3107)

(assert (=> b!212094 (= lt!109240 (getCurrentListMap!1102 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109235 () array!10115)

(assert (=> b!212094 (= lt!109234 (getCurrentListMap!1102 _keys!825 lt!109235 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212094 (and (= lt!109241 lt!109236) (= lt!109236 lt!109241))))

(declare-fun lt!109232 () tuple2!4194)

(assert (=> b!212094 (= lt!109236 (+!572 lt!109233 lt!109232))))

(declare-fun v!520 () V!6921)

(assert (=> b!212094 (= lt!109232 (tuple2!4195 k!843 v!520))))

(declare-datatypes ((Unit!6438 0))(
  ( (Unit!6439) )
))
(declare-fun lt!109242 () Unit!6438)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!219 (array!10113 array!10115 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) (_ BitVec 64) V!6921 (_ BitVec 32) Int) Unit!6438)

(assert (=> b!212094 (= lt!109242 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!219 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!504 (array!10113 array!10115 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3107)

(assert (=> b!212094 (= lt!109241 (getCurrentListMapNoExtraKeys!504 _keys!825 lt!109235 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212094 (= lt!109235 (array!10116 (store (arr!4801 _values!649) i!601 (ValueCellFull!2384 v!520)) (size!5126 _values!649)))))

(assert (=> b!212094 (= lt!109233 (getCurrentListMapNoExtraKeys!504 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212095 () Bool)

(declare-fun res!103655 () Bool)

(assert (=> b!212095 (=> (not res!103655) (not e!138019))))

(assert (=> b!212095 (= res!103655 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5125 _keys!825))))))

(declare-fun res!103659 () Bool)

(assert (=> start!21082 (=> (not res!103659) (not e!138019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21082 (= res!103659 (validMask!0 mask!1149))))

(assert (=> start!21082 e!138019))

(declare-fun e!138018 () Bool)

(declare-fun array_inv!3175 (array!10115) Bool)

(assert (=> start!21082 (and (array_inv!3175 _values!649) e!138018)))

(assert (=> start!21082 true))

(assert (=> start!21082 tp_is_empty!5455))

(declare-fun array_inv!3176 (array!10113) Bool)

(assert (=> start!21082 (array_inv!3176 _keys!825)))

(assert (=> start!21082 tp!19841))

(declare-fun b!212096 () Bool)

(assert (=> b!212096 (= e!138022 tp_is_empty!5455)))

(declare-fun b!212097 () Bool)

(declare-fun res!103657 () Bool)

(assert (=> b!212097 (=> (not res!103657) (not e!138019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212097 (= res!103657 (validKeyInArray!0 k!843))))

(declare-fun b!212098 () Bool)

(assert (=> b!212098 (= e!138021 (= (+!572 lt!109240 lt!109232) lt!109234))))

(assert (=> b!212098 (= lt!109237 (+!572 lt!109238 lt!109232))))

(declare-fun lt!109231 () Unit!6438)

(declare-fun addCommutativeForDiffKeys!205 (ListLongMap!3107 (_ BitVec 64) V!6921 (_ BitVec 64) V!6921) Unit!6438)

(assert (=> b!212098 (= lt!109231 (addCommutativeForDiffKeys!205 lt!109233 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212099 () Bool)

(assert (=> b!212099 (= e!138018 (and e!138017 mapRes!9272))))

(declare-fun condMapEmpty!9272 () Bool)

(declare-fun mapDefault!9272 () ValueCell!2384)

