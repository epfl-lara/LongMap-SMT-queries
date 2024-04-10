; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21018 () Bool)

(assert start!21018)

(declare-fun b_free!5569 () Bool)

(declare-fun b_next!5569 () Bool)

(assert (=> start!21018 (= b_free!5569 (not b_next!5569))))

(declare-fun tp!19762 () Bool)

(declare-fun b_and!12375 () Bool)

(assert (=> start!21018 (= tp!19762 b_and!12375)))

(declare-fun b!211279 () Bool)

(declare-fun e!137536 () Bool)

(declare-fun e!137540 () Bool)

(assert (=> b!211279 (= e!137536 (not e!137540))))

(declare-fun res!103171 () Bool)

(assert (=> b!211279 (=> res!103171 e!137540)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211279 (= res!103171 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6889 0))(
  ( (V!6890 (val!2760 Int)) )
))
(declare-datatypes ((ValueCell!2372 0))(
  ( (ValueCellFull!2372 (v!4750 V!6889)) (EmptyCell!2372) )
))
(declare-datatypes ((array!10063 0))(
  ( (array!10064 (arr!4777 (Array (_ BitVec 32) ValueCell!2372)) (size!5102 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10063)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6889)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!4172 0))(
  ( (tuple2!4173 (_1!2097 (_ BitVec 64)) (_2!2097 V!6889)) )
))
(declare-datatypes ((List!3065 0))(
  ( (Nil!3062) (Cons!3061 (h!3703 tuple2!4172) (t!8006 List!3065)) )
))
(declare-datatypes ((ListLongMap!3085 0))(
  ( (ListLongMap!3086 (toList!1558 List!3065)) )
))
(declare-fun lt!108600 () ListLongMap!3085)

(declare-datatypes ((array!10065 0))(
  ( (array!10066 (arr!4778 (Array (_ BitVec 32) (_ BitVec 64))) (size!5103 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10065)

(declare-fun minValue!615 () V!6889)

(declare-fun getCurrentListMap!1092 (array!10065 array!10063 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3085)

(assert (=> b!211279 (= lt!108600 (getCurrentListMap!1092 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108599 () array!10063)

(declare-fun lt!108601 () ListLongMap!3085)

(assert (=> b!211279 (= lt!108601 (getCurrentListMap!1092 _keys!825 lt!108599 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108604 () ListLongMap!3085)

(declare-fun lt!108605 () ListLongMap!3085)

(assert (=> b!211279 (and (= lt!108604 lt!108605) (= lt!108605 lt!108604))))

(declare-fun lt!108602 () ListLongMap!3085)

(declare-fun v!520 () V!6889)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!561 (ListLongMap!3085 tuple2!4172) ListLongMap!3085)

(assert (=> b!211279 (= lt!108605 (+!561 lt!108602 (tuple2!4173 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6414 0))(
  ( (Unit!6415) )
))
(declare-fun lt!108606 () Unit!6414)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!209 (array!10065 array!10063 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) (_ BitVec 64) V!6889 (_ BitVec 32) Int) Unit!6414)

(assert (=> b!211279 (= lt!108606 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!209 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!494 (array!10065 array!10063 (_ BitVec 32) (_ BitVec 32) V!6889 V!6889 (_ BitVec 32) Int) ListLongMap!3085)

(assert (=> b!211279 (= lt!108604 (getCurrentListMapNoExtraKeys!494 _keys!825 lt!108599 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211279 (= lt!108599 (array!10064 (store (arr!4777 _values!649) i!601 (ValueCellFull!2372 v!520)) (size!5102 _values!649)))))

(assert (=> b!211279 (= lt!108602 (getCurrentListMapNoExtraKeys!494 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211281 () Bool)

(declare-fun e!137535 () Bool)

(declare-fun e!137538 () Bool)

(declare-fun mapRes!9230 () Bool)

(assert (=> b!211281 (= e!137535 (and e!137538 mapRes!9230))))

(declare-fun condMapEmpty!9230 () Bool)

(declare-fun mapDefault!9230 () ValueCell!2372)

