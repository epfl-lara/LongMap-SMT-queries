; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20380 () Bool)

(assert start!20380)

(declare-fun b_free!5039 () Bool)

(declare-fun b_next!5039 () Bool)

(assert (=> start!20380 (= b_free!5039 (not b_next!5039))))

(declare-fun tp!18148 () Bool)

(declare-fun b_and!11785 () Bool)

(assert (=> start!20380 (= tp!18148 b_and!11785)))

(declare-fun b!201330 () Bool)

(declare-fun e!131962 () Bool)

(declare-fun e!131957 () Bool)

(assert (=> b!201330 (= e!131962 (not e!131957))))

(declare-fun res!96176 () Bool)

(assert (=> b!201330 (=> res!96176 e!131957)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201330 (= res!96176 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6173 0))(
  ( (V!6174 (val!2492 Int)) )
))
(declare-datatypes ((ValueCell!2104 0))(
  ( (ValueCellFull!2104 (v!4462 V!6173)) (EmptyCell!2104) )
))
(declare-datatypes ((array!9019 0))(
  ( (array!9020 (arr!4260 (Array (_ BitVec 32) ValueCell!2104)) (size!4585 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9019)

(declare-datatypes ((tuple2!3772 0))(
  ( (tuple2!3773 (_1!1897 (_ BitVec 64)) (_2!1897 V!6173)) )
))
(declare-datatypes ((List!2687 0))(
  ( (Nil!2684) (Cons!2683 (h!3325 tuple2!3772) (t!7618 List!2687)) )
))
(declare-datatypes ((ListLongMap!2685 0))(
  ( (ListLongMap!2686 (toList!1358 List!2687)) )
))
(declare-fun lt!100239 () ListLongMap!2685)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6173)

(declare-datatypes ((array!9021 0))(
  ( (array!9022 (arr!4261 (Array (_ BitVec 32) (_ BitVec 64))) (size!4586 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9021)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6173)

(declare-fun getCurrentListMap!947 (array!9021 array!9019 (_ BitVec 32) (_ BitVec 32) V!6173 V!6173 (_ BitVec 32) Int) ListLongMap!2685)

(assert (=> b!201330 (= lt!100239 (getCurrentListMap!947 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100232 () array!9019)

(declare-fun lt!100225 () ListLongMap!2685)

(assert (=> b!201330 (= lt!100225 (getCurrentListMap!947 _keys!825 lt!100232 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100234 () ListLongMap!2685)

(declare-fun lt!100238 () ListLongMap!2685)

(assert (=> b!201330 (and (= lt!100234 lt!100238) (= lt!100238 lt!100234))))

(declare-fun lt!100228 () ListLongMap!2685)

(declare-fun lt!100229 () tuple2!3772)

(declare-fun +!385 (ListLongMap!2685 tuple2!3772) ListLongMap!2685)

(assert (=> b!201330 (= lt!100238 (+!385 lt!100228 lt!100229))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6173)

(assert (=> b!201330 (= lt!100229 (tuple2!3773 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6070 0))(
  ( (Unit!6071) )
))
(declare-fun lt!100227 () Unit!6070)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 (array!9021 array!9019 (_ BitVec 32) (_ BitVec 32) V!6173 V!6173 (_ BitVec 32) (_ BitVec 64) V!6173 (_ BitVec 32) Int) Unit!6070)

(assert (=> b!201330 (= lt!100227 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!321 (array!9021 array!9019 (_ BitVec 32) (_ BitVec 32) V!6173 V!6173 (_ BitVec 32) Int) ListLongMap!2685)

(assert (=> b!201330 (= lt!100234 (getCurrentListMapNoExtraKeys!321 _keys!825 lt!100232 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201330 (= lt!100232 (array!9020 (store (arr!4260 _values!649) i!601 (ValueCellFull!2104 v!520)) (size!4585 _values!649)))))

(assert (=> b!201330 (= lt!100228 (getCurrentListMapNoExtraKeys!321 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201331 () Bool)

(declare-fun e!131958 () Bool)

(assert (=> b!201331 (= e!131957 e!131958)))

(declare-fun res!96172 () Bool)

(assert (=> b!201331 (=> res!96172 e!131958)))

(assert (=> b!201331 (= res!96172 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100233 () ListLongMap!2685)

(declare-fun lt!100236 () ListLongMap!2685)

(assert (=> b!201331 (= lt!100233 lt!100236)))

(declare-fun lt!100230 () ListLongMap!2685)

(assert (=> b!201331 (= lt!100236 (+!385 lt!100230 lt!100229))))

(declare-fun lt!100237 () Unit!6070)

(declare-fun addCommutativeForDiffKeys!106 (ListLongMap!2685 (_ BitVec 64) V!6173 (_ BitVec 64) V!6173) Unit!6070)

(assert (=> b!201331 (= lt!100237 (addCommutativeForDiffKeys!106 lt!100228 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100231 () tuple2!3772)

(assert (=> b!201331 (= lt!100225 (+!385 lt!100233 lt!100231))))

(declare-fun lt!100224 () tuple2!3772)

(assert (=> b!201331 (= lt!100233 (+!385 lt!100238 lt!100224))))

(declare-fun lt!100235 () ListLongMap!2685)

(assert (=> b!201331 (= lt!100239 lt!100235)))

(assert (=> b!201331 (= lt!100235 (+!385 lt!100230 lt!100231))))

(assert (=> b!201331 (= lt!100230 (+!385 lt!100228 lt!100224))))

(assert (=> b!201331 (= lt!100225 (+!385 (+!385 lt!100234 lt!100224) lt!100231))))

(assert (=> b!201331 (= lt!100231 (tuple2!3773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201331 (= lt!100224 (tuple2!3773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201332 () Bool)

(declare-fun e!131963 () Bool)

(declare-fun tp_is_empty!4895 () Bool)

(assert (=> b!201332 (= e!131963 tp_is_empty!4895)))

(declare-fun res!96175 () Bool)

(assert (=> start!20380 (=> (not res!96175) (not e!131962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20380 (= res!96175 (validMask!0 mask!1149))))

(assert (=> start!20380 e!131962))

(declare-fun e!131961 () Bool)

(declare-fun array_inv!2809 (array!9019) Bool)

(assert (=> start!20380 (and (array_inv!2809 _values!649) e!131961)))

(assert (=> start!20380 true))

(assert (=> start!20380 tp_is_empty!4895))

(declare-fun array_inv!2810 (array!9021) Bool)

(assert (=> start!20380 (array_inv!2810 _keys!825)))

(assert (=> start!20380 tp!18148))

(declare-fun b!201333 () Bool)

(declare-fun res!96173 () Bool)

(assert (=> b!201333 (=> (not res!96173) (not e!131962))))

(assert (=> b!201333 (= res!96173 (and (= (size!4585 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4586 _keys!825) (size!4585 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201334 () Bool)

(assert (=> b!201334 (= e!131958 (bvsle #b00000000000000000000000000000000 (size!4586 _keys!825)))))

(assert (=> b!201334 (= (+!385 lt!100236 lt!100231) (+!385 lt!100235 lt!100229))))

(declare-fun lt!100226 () Unit!6070)

(assert (=> b!201334 (= lt!100226 (addCommutativeForDiffKeys!106 lt!100230 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201335 () Bool)

(declare-fun res!96178 () Bool)

(assert (=> b!201335 (=> (not res!96178) (not e!131962))))

(assert (=> b!201335 (= res!96178 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4586 _keys!825))))))

(declare-fun b!201336 () Bool)

(declare-fun mapRes!8411 () Bool)

(assert (=> b!201336 (= e!131961 (and e!131963 mapRes!8411))))

(declare-fun condMapEmpty!8411 () Bool)

(declare-fun mapDefault!8411 () ValueCell!2104)

