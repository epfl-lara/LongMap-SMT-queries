; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96242 () Bool)

(assert start!96242)

(declare-fun b_free!22895 () Bool)

(declare-fun b_next!22895 () Bool)

(assert (=> start!96242 (= b_free!22895 (not b_next!22895))))

(declare-fun tp!80533 () Bool)

(declare-fun b_and!36465 () Bool)

(assert (=> start!96242 (= tp!80533 b_and!36465)))

(declare-fun b!1093279 () Bool)

(declare-fun res!729548 () Bool)

(declare-fun e!624271 () Bool)

(assert (=> b!1093279 (=> (not res!729548) (not e!624271))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093279 (= res!729548 (validKeyInArray!0 k!904))))

(declare-fun b!1093280 () Bool)

(declare-fun e!624269 () Bool)

(declare-fun tp_is_empty!26897 () Bool)

(assert (=> b!1093280 (= e!624269 tp_is_empty!26897)))

(declare-fun b!1093281 () Bool)

(declare-fun res!729541 () Bool)

(assert (=> b!1093281 (=> (not res!729541) (not e!624271))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70711 0))(
  ( (array!70712 (arr!34029 (Array (_ BitVec 32) (_ BitVec 64))) (size!34565 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70711)

(declare-datatypes ((V!40989 0))(
  ( (V!40990 (val!13505 Int)) )
))
(declare-datatypes ((ValueCell!12739 0))(
  ( (ValueCellFull!12739 (v!16126 V!40989)) (EmptyCell!12739) )
))
(declare-datatypes ((array!70713 0))(
  ( (array!70714 (arr!34030 (Array (_ BitVec 32) ValueCell!12739)) (size!34566 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70713)

(assert (=> b!1093281 (= res!729541 (and (= (size!34566 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34565 _keys!1070) (size!34566 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093282 () Bool)

(declare-fun res!729549 () Bool)

(assert (=> b!1093282 (=> (not res!729549) (not e!624271))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093282 (= res!729549 (= (select (arr!34029 _keys!1070) i!650) k!904))))

(declare-datatypes ((tuple2!17182 0))(
  ( (tuple2!17183 (_1!8602 (_ BitVec 64)) (_2!8602 V!40989)) )
))
(declare-datatypes ((List!23774 0))(
  ( (Nil!23771) (Cons!23770 (h!24979 tuple2!17182) (t!33727 List!23774)) )
))
(declare-datatypes ((ListLongMap!15151 0))(
  ( (ListLongMap!15152 (toList!7591 List!23774)) )
))
(declare-fun lt!488890 () ListLongMap!15151)

(declare-fun e!624270 () Bool)

(declare-fun b!1093283 () Bool)

(declare-fun lt!488889 () Bool)

(declare-fun lt!488881 () ListLongMap!15151)

(assert (=> b!1093283 (= e!624270 (not (or (and (not lt!488889) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!488889) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!488889) (not (= lt!488890 lt!488881)) (bvsle #b00000000000000000000000000000000 (size!34565 _keys!1070)))))))

(assert (=> b!1093283 (= lt!488889 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40989)

(declare-fun lt!488887 () ListLongMap!15151)

(declare-fun zeroValue!831 () V!40989)

(declare-fun getCurrentListMap!4347 (array!70711 array!70713 (_ BitVec 32) (_ BitVec 32) V!40989 V!40989 (_ BitVec 32) Int) ListLongMap!15151)

(assert (=> b!1093283 (= lt!488887 (getCurrentListMap!4347 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488885 () array!70711)

(declare-fun lt!488884 () array!70713)

(assert (=> b!1093283 (= lt!488890 (getCurrentListMap!4347 lt!488885 lt!488884 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488882 () ListLongMap!15151)

(assert (=> b!1093283 (and (= lt!488881 lt!488882) (= lt!488882 lt!488881))))

(declare-fun lt!488886 () ListLongMap!15151)

(declare-fun -!910 (ListLongMap!15151 (_ BitVec 64)) ListLongMap!15151)

(assert (=> b!1093283 (= lt!488882 (-!910 lt!488886 k!904))))

(declare-datatypes ((Unit!35986 0))(
  ( (Unit!35987) )
))
(declare-fun lt!488888 () Unit!35986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 (array!70711 array!70713 (_ BitVec 32) (_ BitVec 32) V!40989 V!40989 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35986)

(assert (=> b!1093283 (= lt!488888 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4107 (array!70711 array!70713 (_ BitVec 32) (_ BitVec 32) V!40989 V!40989 (_ BitVec 32) Int) ListLongMap!15151)

(assert (=> b!1093283 (= lt!488881 (getCurrentListMapNoExtraKeys!4107 lt!488885 lt!488884 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2244 (Int (_ BitVec 64)) V!40989)

(assert (=> b!1093283 (= lt!488884 (array!70714 (store (arr!34030 _values!874) i!650 (ValueCellFull!12739 (dynLambda!2244 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34566 _values!874)))))

(assert (=> b!1093283 (= lt!488886 (getCurrentListMapNoExtraKeys!4107 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093283 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488883 () Unit!35986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70711 (_ BitVec 64) (_ BitVec 32)) Unit!35986)

(assert (=> b!1093283 (= lt!488883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!42100 () Bool)

(declare-fun mapRes!42100 () Bool)

(declare-fun tp!80534 () Bool)

(declare-fun e!624268 () Bool)

(assert (=> mapNonEmpty!42100 (= mapRes!42100 (and tp!80534 e!624268))))

(declare-fun mapValue!42100 () ValueCell!12739)

(declare-fun mapRest!42100 () (Array (_ BitVec 32) ValueCell!12739))

(declare-fun mapKey!42100 () (_ BitVec 32))

(assert (=> mapNonEmpty!42100 (= (arr!34030 _values!874) (store mapRest!42100 mapKey!42100 mapValue!42100))))

(declare-fun b!1093284 () Bool)

(declare-fun res!729543 () Bool)

(assert (=> b!1093284 (=> (not res!729543) (not e!624270))))

(declare-datatypes ((List!23775 0))(
  ( (Nil!23772) (Cons!23771 (h!24980 (_ BitVec 64)) (t!33728 List!23775)) )
))
(declare-fun arrayNoDuplicates!0 (array!70711 (_ BitVec 32) List!23775) Bool)

(assert (=> b!1093284 (= res!729543 (arrayNoDuplicates!0 lt!488885 #b00000000000000000000000000000000 Nil!23772))))

(declare-fun b!1093285 () Bool)

(assert (=> b!1093285 (= e!624271 e!624270)))

(declare-fun res!729547 () Bool)

(assert (=> b!1093285 (=> (not res!729547) (not e!624270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70711 (_ BitVec 32)) Bool)

(assert (=> b!1093285 (= res!729547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488885 mask!1414))))

(assert (=> b!1093285 (= lt!488885 (array!70712 (store (arr!34029 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34565 _keys!1070)))))

(declare-fun b!1093286 () Bool)

(declare-fun e!624267 () Bool)

(assert (=> b!1093286 (= e!624267 (and e!624269 mapRes!42100))))

(declare-fun condMapEmpty!42100 () Bool)

(declare-fun mapDefault!42100 () ValueCell!12739)

