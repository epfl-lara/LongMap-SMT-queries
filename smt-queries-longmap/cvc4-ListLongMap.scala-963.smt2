; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20898 () Bool)

(assert start!20898)

(declare-fun b_free!5531 () Bool)

(declare-fun b_next!5531 () Bool)

(assert (=> start!20898 (= b_free!5531 (not b_next!5531))))

(declare-fun tp!19637 () Bool)

(declare-fun b_and!12289 () Bool)

(assert (=> start!20898 (= tp!19637 b_and!12289)))

(declare-fun b!209835 () Bool)

(declare-fun res!102333 () Bool)

(declare-fun e!136679 () Bool)

(assert (=> b!209835 (=> (not res!102333) (not e!136679))))

(declare-datatypes ((array!9983 0))(
  ( (array!9984 (arr!4741 (Array (_ BitVec 32) (_ BitVec 64))) (size!5066 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9983)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9983 (_ BitVec 32)) Bool)

(assert (=> b!209835 (= res!102333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209837 () Bool)

(declare-fun res!102331 () Bool)

(assert (=> b!209837 (=> (not res!102331) (not e!136679))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209837 (= res!102331 (= (select (arr!4741 _keys!825) i!601) k!843))))

(declare-fun b!209838 () Bool)

(declare-fun e!136675 () Bool)

(assert (=> b!209838 (= e!136679 (not e!136675))))

(declare-fun res!102330 () Bool)

(assert (=> b!209838 (=> res!102330 e!136675)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209838 (= res!102330 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6837 0))(
  ( (V!6838 (val!2741 Int)) )
))
(declare-datatypes ((ValueCell!2353 0))(
  ( (ValueCellFull!2353 (v!4715 V!6837)) (EmptyCell!2353) )
))
(declare-datatypes ((array!9985 0))(
  ( (array!9986 (arr!4742 (Array (_ BitVec 32) ValueCell!2353)) (size!5067 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9985)

(declare-datatypes ((tuple2!4142 0))(
  ( (tuple2!4143 (_1!2082 (_ BitVec 64)) (_2!2082 V!6837)) )
))
(declare-datatypes ((List!3038 0))(
  ( (Nil!3035) (Cons!3034 (h!3676 tuple2!4142) (t!7971 List!3038)) )
))
(declare-datatypes ((ListLongMap!3055 0))(
  ( (ListLongMap!3056 (toList!1543 List!3038)) )
))
(declare-fun lt!107313 () ListLongMap!3055)

(declare-fun zeroValue!615 () V!6837)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6837)

(declare-fun getCurrentListMap!1081 (array!9983 array!9985 (_ BitVec 32) (_ BitVec 32) V!6837 V!6837 (_ BitVec 32) Int) ListLongMap!3055)

(assert (=> b!209838 (= lt!107313 (getCurrentListMap!1081 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107314 () array!9985)

(declare-fun lt!107309 () ListLongMap!3055)

(assert (=> b!209838 (= lt!107309 (getCurrentListMap!1081 _keys!825 lt!107314 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107317 () ListLongMap!3055)

(declare-fun lt!107312 () ListLongMap!3055)

(assert (=> b!209838 (and (= lt!107317 lt!107312) (= lt!107312 lt!107317))))

(declare-fun lt!107315 () ListLongMap!3055)

(declare-fun v!520 () V!6837)

(declare-fun +!546 (ListLongMap!3055 tuple2!4142) ListLongMap!3055)

(assert (=> b!209838 (= lt!107312 (+!546 lt!107315 (tuple2!4143 k!843 v!520)))))

(declare-datatypes ((Unit!6380 0))(
  ( (Unit!6381) )
))
(declare-fun lt!107311 () Unit!6380)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!198 (array!9983 array!9985 (_ BitVec 32) (_ BitVec 32) V!6837 V!6837 (_ BitVec 32) (_ BitVec 64) V!6837 (_ BitVec 32) Int) Unit!6380)

(assert (=> b!209838 (= lt!107311 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!198 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!483 (array!9983 array!9985 (_ BitVec 32) (_ BitVec 32) V!6837 V!6837 (_ BitVec 32) Int) ListLongMap!3055)

(assert (=> b!209838 (= lt!107317 (getCurrentListMapNoExtraKeys!483 _keys!825 lt!107314 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209838 (= lt!107314 (array!9986 (store (arr!4742 _values!649) i!601 (ValueCellFull!2353 v!520)) (size!5067 _values!649)))))

(assert (=> b!209838 (= lt!107315 (getCurrentListMapNoExtraKeys!483 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9161 () Bool)

(declare-fun mapRes!9161 () Bool)

(declare-fun tp!19636 () Bool)

(declare-fun e!136678 () Bool)

(assert (=> mapNonEmpty!9161 (= mapRes!9161 (and tp!19636 e!136678))))

(declare-fun mapRest!9161 () (Array (_ BitVec 32) ValueCell!2353))

(declare-fun mapKey!9161 () (_ BitVec 32))

(declare-fun mapValue!9161 () ValueCell!2353)

(assert (=> mapNonEmpty!9161 (= (arr!4742 _values!649) (store mapRest!9161 mapKey!9161 mapValue!9161))))

(declare-fun b!209839 () Bool)

(declare-fun e!136677 () Bool)

(declare-fun tp_is_empty!5393 () Bool)

(assert (=> b!209839 (= e!136677 tp_is_empty!5393)))

(declare-fun mapIsEmpty!9161 () Bool)

(assert (=> mapIsEmpty!9161 mapRes!9161))

(declare-fun b!209840 () Bool)

(declare-fun res!102329 () Bool)

(assert (=> b!209840 (=> (not res!102329) (not e!136679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209840 (= res!102329 (validKeyInArray!0 k!843))))

(declare-fun lt!107310 () tuple2!4142)

(declare-fun b!209841 () Bool)

(declare-fun lt!107316 () tuple2!4142)

(assert (=> b!209841 (= e!136675 (= lt!107313 (+!546 (+!546 lt!107315 lt!107310) lt!107316)))))

(assert (=> b!209841 (= lt!107309 (+!546 (+!546 lt!107317 lt!107310) lt!107316))))

(assert (=> b!209841 (= lt!107316 (tuple2!4143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!209841 (= lt!107310 (tuple2!4143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!209842 () Bool)

(declare-fun e!136680 () Bool)

(assert (=> b!209842 (= e!136680 (and e!136677 mapRes!9161))))

(declare-fun condMapEmpty!9161 () Bool)

(declare-fun mapDefault!9161 () ValueCell!2353)

