; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21092 () Bool)

(assert start!21092)

(declare-fun b_free!5603 () Bool)

(declare-fun b_next!5603 () Bool)

(assert (=> start!21092 (= b_free!5603 (not b_next!5603))))

(declare-fun tp!19870 () Bool)

(declare-fun b_and!12433 () Bool)

(assert (=> start!21092 (= tp!19870 b_and!12433)))

(declare-fun mapIsEmpty!9287 () Bool)

(declare-fun mapRes!9287 () Bool)

(assert (=> mapIsEmpty!9287 mapRes!9287))

(declare-fun b!212263 () Bool)

(declare-fun res!103783 () Bool)

(declare-fun e!138117 () Bool)

(assert (=> b!212263 (=> (not res!103783) (not e!138117))))

(declare-datatypes ((array!10133 0))(
  ( (array!10134 (arr!4810 (Array (_ BitVec 32) (_ BitVec 64))) (size!5135 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10133)

(declare-datatypes ((List!3093 0))(
  ( (Nil!3090) (Cons!3089 (h!3731 (_ BitVec 64)) (t!8038 List!3093)) )
))
(declare-fun arrayNoDuplicates!0 (array!10133 (_ BitVec 32) List!3093) Bool)

(assert (=> b!212263 (= res!103783 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3090))))

(declare-fun b!212264 () Bool)

(declare-fun res!103784 () Bool)

(assert (=> b!212264 (=> (not res!103784) (not e!138117))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212264 (= res!103784 (= (select (arr!4810 _keys!825) i!601) k!843))))

(declare-fun b!212265 () Bool)

(declare-fun e!138114 () Bool)

(assert (=> b!212265 (= e!138117 (not e!138114))))

(declare-fun res!103782 () Bool)

(assert (=> b!212265 (=> res!103782 e!138114)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212265 (= res!103782 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6933 0))(
  ( (V!6934 (val!2777 Int)) )
))
(declare-datatypes ((ValueCell!2389 0))(
  ( (ValueCellFull!2389 (v!4775 V!6933)) (EmptyCell!2389) )
))
(declare-datatypes ((array!10135 0))(
  ( (array!10136 (arr!4811 (Array (_ BitVec 32) ValueCell!2389)) (size!5136 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10135)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6933)

(declare-fun zeroValue!615 () V!6933)

(declare-datatypes ((tuple2!4204 0))(
  ( (tuple2!4205 (_1!2113 (_ BitVec 64)) (_2!2113 V!6933)) )
))
(declare-datatypes ((List!3094 0))(
  ( (Nil!3091) (Cons!3090 (h!3732 tuple2!4204) (t!8039 List!3094)) )
))
(declare-datatypes ((ListLongMap!3117 0))(
  ( (ListLongMap!3118 (toList!1574 List!3094)) )
))
(declare-fun lt!109374 () ListLongMap!3117)

(declare-fun getCurrentListMap!1107 (array!10133 array!10135 (_ BitVec 32) (_ BitVec 32) V!6933 V!6933 (_ BitVec 32) Int) ListLongMap!3117)

(assert (=> b!212265 (= lt!109374 (getCurrentListMap!1107 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109377 () ListLongMap!3117)

(declare-fun lt!109371 () array!10135)

(assert (=> b!212265 (= lt!109377 (getCurrentListMap!1107 _keys!825 lt!109371 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109372 () ListLongMap!3117)

(declare-fun lt!109373 () ListLongMap!3117)

(assert (=> b!212265 (and (= lt!109372 lt!109373) (= lt!109373 lt!109372))))

(declare-fun v!520 () V!6933)

(declare-fun lt!109375 () ListLongMap!3117)

(declare-fun +!577 (ListLongMap!3117 tuple2!4204) ListLongMap!3117)

(assert (=> b!212265 (= lt!109373 (+!577 lt!109375 (tuple2!4205 k!843 v!520)))))

(declare-datatypes ((Unit!6448 0))(
  ( (Unit!6449) )
))
(declare-fun lt!109376 () Unit!6448)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!224 (array!10133 array!10135 (_ BitVec 32) (_ BitVec 32) V!6933 V!6933 (_ BitVec 32) (_ BitVec 64) V!6933 (_ BitVec 32) Int) Unit!6448)

(assert (=> b!212265 (= lt!109376 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!224 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!509 (array!10133 array!10135 (_ BitVec 32) (_ BitVec 32) V!6933 V!6933 (_ BitVec 32) Int) ListLongMap!3117)

(assert (=> b!212265 (= lt!109372 (getCurrentListMapNoExtraKeys!509 _keys!825 lt!109371 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212265 (= lt!109371 (array!10136 (store (arr!4811 _values!649) i!601 (ValueCellFull!2389 v!520)) (size!5136 _values!649)))))

(assert (=> b!212265 (= lt!109375 (getCurrentListMapNoExtraKeys!509 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212266 () Bool)

(declare-fun e!138118 () Bool)

(declare-fun tp_is_empty!5465 () Bool)

(assert (=> b!212266 (= e!138118 tp_is_empty!5465)))

(declare-fun res!103787 () Bool)

(assert (=> start!21092 (=> (not res!103787) (not e!138117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21092 (= res!103787 (validMask!0 mask!1149))))

(assert (=> start!21092 e!138117))

(declare-fun e!138116 () Bool)

(declare-fun array_inv!3183 (array!10135) Bool)

(assert (=> start!21092 (and (array_inv!3183 _values!649) e!138116)))

(assert (=> start!21092 true))

(assert (=> start!21092 tp_is_empty!5465))

(declare-fun array_inv!3184 (array!10133) Bool)

(assert (=> start!21092 (array_inv!3184 _keys!825)))

(assert (=> start!21092 tp!19870))

(declare-fun b!212267 () Bool)

(declare-fun res!103786 () Bool)

(assert (=> b!212267 (=> (not res!103786) (not e!138117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10133 (_ BitVec 32)) Bool)

(assert (=> b!212267 (= res!103786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212268 () Bool)

(declare-fun res!103788 () Bool)

(assert (=> b!212268 (=> (not res!103788) (not e!138117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212268 (= res!103788 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!9287 () Bool)

(declare-fun tp!19871 () Bool)

(assert (=> mapNonEmpty!9287 (= mapRes!9287 (and tp!19871 e!138118))))

(declare-fun mapValue!9287 () ValueCell!2389)

(declare-fun mapRest!9287 () (Array (_ BitVec 32) ValueCell!2389))

(declare-fun mapKey!9287 () (_ BitVec 32))

(assert (=> mapNonEmpty!9287 (= (arr!4811 _values!649) (store mapRest!9287 mapKey!9287 mapValue!9287))))

(declare-fun b!212269 () Bool)

(declare-fun res!103785 () Bool)

(assert (=> b!212269 (=> (not res!103785) (not e!138117))))

(assert (=> b!212269 (= res!103785 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5135 _keys!825))))))

(declare-fun b!212270 () Bool)

(declare-fun e!138119 () Bool)

(assert (=> b!212270 (= e!138119 tp_is_empty!5465)))

(declare-fun b!212271 () Bool)

(assert (=> b!212271 (= e!138114 (= lt!109377 (+!577 lt!109372 (tuple2!4205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!212272 () Bool)

(assert (=> b!212272 (= e!138116 (and e!138119 mapRes!9287))))

(declare-fun condMapEmpty!9287 () Bool)

(declare-fun mapDefault!9287 () ValueCell!2389)

