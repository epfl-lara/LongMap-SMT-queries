; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96644 () Bool)

(assert start!96644)

(declare-fun b_free!23117 () Bool)

(declare-fun b_next!23117 () Bool)

(assert (=> start!96644 (= b_free!23117 (not b_next!23117))))

(declare-fun tp!81289 () Bool)

(declare-fun b_and!36953 () Bool)

(assert (=> start!96644 (= tp!81289 b_and!36953)))

(declare-datatypes ((V!41349 0))(
  ( (V!41350 (val!13640 Int)) )
))
(declare-datatypes ((tuple2!17332 0))(
  ( (tuple2!17333 (_1!8677 (_ BitVec 64)) (_2!8677 V!41349)) )
))
(declare-datatypes ((List!23950 0))(
  ( (Nil!23947) (Cons!23946 (h!25155 tuple2!17332) (t!34113 List!23950)) )
))
(declare-datatypes ((ListLongMap!15301 0))(
  ( (ListLongMap!15302 (toList!7666 List!23950)) )
))
(declare-fun lt!492171 () ListLongMap!15301)

(declare-fun e!627401 () Bool)

(declare-fun lt!492164 () ListLongMap!15301)

(declare-fun b!1099258 () Bool)

(declare-fun zeroValue!831 () V!41349)

(declare-fun +!3374 (ListLongMap!15301 tuple2!17332) ListLongMap!15301)

(assert (=> b!1099258 (= e!627401 (= lt!492164 (+!3374 lt!492171 (tuple2!17333 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun b!1099259 () Bool)

(declare-fun e!627402 () Bool)

(assert (=> b!1099259 (= e!627402 (not e!627401))))

(declare-fun res!733607 () Bool)

(assert (=> b!1099259 (=> res!733607 e!627401)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099259 (= res!733607 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41349)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!492167 () ListLongMap!15301)

(declare-datatypes ((array!71247 0))(
  ( (array!71248 (arr!34291 (Array (_ BitVec 32) (_ BitVec 64))) (size!34827 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71247)

(declare-datatypes ((ValueCell!12874 0))(
  ( (ValueCellFull!12874 (v!16265 V!41349)) (EmptyCell!12874) )
))
(declare-datatypes ((array!71249 0))(
  ( (array!71250 (arr!34292 (Array (_ BitVec 32) ValueCell!12874)) (size!34828 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71249)

(declare-fun getCurrentListMap!4380 (array!71247 array!71249 (_ BitVec 32) (_ BitVec 32) V!41349 V!41349 (_ BitVec 32) Int) ListLongMap!15301)

(assert (=> b!1099259 (= lt!492167 (getCurrentListMap!4380 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492165 () array!71247)

(declare-fun lt!492163 () array!71249)

(assert (=> b!1099259 (= lt!492164 (getCurrentListMap!4380 lt!492165 lt!492163 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492166 () ListLongMap!15301)

(assert (=> b!1099259 (and (= lt!492171 lt!492166) (= lt!492166 lt!492171))))

(declare-fun lt!492170 () ListLongMap!15301)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!955 (ListLongMap!15301 (_ BitVec 64)) ListLongMap!15301)

(assert (=> b!1099259 (= lt!492166 (-!955 lt!492170 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36150 0))(
  ( (Unit!36151) )
))
(declare-fun lt!492168 () Unit!36150)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 (array!71247 array!71249 (_ BitVec 32) (_ BitVec 32) V!41349 V!41349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36150)

(assert (=> b!1099259 (= lt!492168 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4176 (array!71247 array!71249 (_ BitVec 32) (_ BitVec 32) V!41349 V!41349 (_ BitVec 32) Int) ListLongMap!15301)

(assert (=> b!1099259 (= lt!492171 (getCurrentListMapNoExtraKeys!4176 lt!492165 lt!492163 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2311 (Int (_ BitVec 64)) V!41349)

(assert (=> b!1099259 (= lt!492163 (array!71250 (store (arr!34292 _values!874) i!650 (ValueCellFull!12874 (dynLambda!2311 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34828 _values!874)))))

(assert (=> b!1099259 (= lt!492170 (getCurrentListMapNoExtraKeys!4176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099259 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492169 () Unit!36150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71247 (_ BitVec 64) (_ BitVec 32)) Unit!36150)

(assert (=> b!1099259 (= lt!492169 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!42523 () Bool)

(declare-fun mapRes!42523 () Bool)

(assert (=> mapIsEmpty!42523 mapRes!42523))

(declare-fun b!1099260 () Bool)

(declare-fun res!733615 () Bool)

(declare-fun e!627403 () Bool)

(assert (=> b!1099260 (=> (not res!733615) (not e!627403))))

(assert (=> b!1099260 (= res!733615 (and (= (size!34828 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34827 _keys!1070) (size!34828 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099261 () Bool)

(declare-fun res!733608 () Bool)

(assert (=> b!1099261 (=> (not res!733608) (not e!627403))))

(assert (=> b!1099261 (= res!733608 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34827 _keys!1070))))))

(declare-fun b!1099262 () Bool)

(assert (=> b!1099262 (= e!627403 e!627402)))

(declare-fun res!733616 () Bool)

(assert (=> b!1099262 (=> (not res!733616) (not e!627402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71247 (_ BitVec 32)) Bool)

(assert (=> b!1099262 (= res!733616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492165 mask!1414))))

(assert (=> b!1099262 (= lt!492165 (array!71248 (store (arr!34291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34827 _keys!1070)))))

(declare-fun b!1099263 () Bool)

(declare-fun res!733609 () Bool)

(assert (=> b!1099263 (=> (not res!733609) (not e!627403))))

(assert (=> b!1099263 (= res!733609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099264 () Bool)

(declare-fun res!733610 () Bool)

(assert (=> b!1099264 (=> (not res!733610) (not e!627403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099264 (= res!733610 (validKeyInArray!0 k!904))))

(declare-fun b!1099265 () Bool)

(declare-fun res!733613 () Bool)

(assert (=> b!1099265 (=> (not res!733613) (not e!627403))))

(assert (=> b!1099265 (= res!733613 (= (select (arr!34291 _keys!1070) i!650) k!904))))

(declare-fun b!1099266 () Bool)

(declare-fun res!733611 () Bool)

(assert (=> b!1099266 (=> (not res!733611) (not e!627403))))

(declare-datatypes ((List!23951 0))(
  ( (Nil!23948) (Cons!23947 (h!25156 (_ BitVec 64)) (t!34114 List!23951)) )
))
(declare-fun arrayNoDuplicates!0 (array!71247 (_ BitVec 32) List!23951) Bool)

(assert (=> b!1099266 (= res!733611 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23948))))

(declare-fun b!1099267 () Bool)

(declare-fun e!627405 () Bool)

(declare-fun tp_is_empty!27167 () Bool)

(assert (=> b!1099267 (= e!627405 tp_is_empty!27167)))

(declare-fun b!1099268 () Bool)

(declare-fun res!733612 () Bool)

(assert (=> b!1099268 (=> (not res!733612) (not e!627402))))

(assert (=> b!1099268 (= res!733612 (arrayNoDuplicates!0 lt!492165 #b00000000000000000000000000000000 Nil!23948))))

(declare-fun b!1099269 () Bool)

(declare-fun e!627399 () Bool)

(assert (=> b!1099269 (= e!627399 (and e!627405 mapRes!42523))))

(declare-fun condMapEmpty!42523 () Bool)

(declare-fun mapDefault!42523 () ValueCell!12874)

