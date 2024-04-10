; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96926 () Bool)

(assert start!96926)

(declare-fun b_free!23219 () Bool)

(declare-fun b_next!23219 () Bool)

(assert (=> start!96926 (= b_free!23219 (not b_next!23219))))

(declare-fun tp!81617 () Bool)

(declare-fun b_and!37255 () Bool)

(assert (=> start!96926 (= tp!81617 b_and!37255)))

(declare-fun b!1102817 () Bool)

(declare-fun e!629443 () Bool)

(declare-fun e!629444 () Bool)

(assert (=> b!1102817 (= e!629443 (not e!629444))))

(declare-fun res!735836 () Bool)

(assert (=> b!1102817 (=> res!735836 e!629444)))

(declare-fun lt!494898 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41485 0))(
  ( (V!41486 (val!13691 Int)) )
))
(declare-datatypes ((tuple2!17416 0))(
  ( (tuple2!17417 (_1!8719 (_ BitVec 64)) (_2!8719 V!41485)) )
))
(declare-datatypes ((List!24033 0))(
  ( (Nil!24030) (Cons!24029 (h!25238 tuple2!17416) (t!34298 List!24033)) )
))
(declare-datatypes ((ListLongMap!15385 0))(
  ( (ListLongMap!15386 (toList!7708 List!24033)) )
))
(declare-fun lt!494900 () ListLongMap!15385)

(declare-fun lt!494903 () ListLongMap!15385)

(assert (=> b!1102817 (= res!735836 (or (and (not lt!494898) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494898) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494898) (not (= lt!494900 lt!494903))))))

(assert (=> b!1102817 (= lt!494898 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41485)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!494901 () ListLongMap!15385)

(declare-fun zeroValue!831 () V!41485)

(declare-datatypes ((array!71459 0))(
  ( (array!71460 (arr!34390 (Array (_ BitVec 32) (_ BitVec 64))) (size!34926 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71459)

(declare-datatypes ((ValueCell!12925 0))(
  ( (ValueCellFull!12925 (v!16322 V!41485)) (EmptyCell!12925) )
))
(declare-datatypes ((array!71461 0))(
  ( (array!71462 (arr!34391 (Array (_ BitVec 32) ValueCell!12925)) (size!34927 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71461)

(declare-fun getCurrentListMap!4412 (array!71459 array!71461 (_ BitVec 32) (_ BitVec 32) V!41485 V!41485 (_ BitVec 32) Int) ListLongMap!15385)

(assert (=> b!1102817 (= lt!494901 (getCurrentListMap!4412 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494896 () array!71459)

(declare-fun lt!494904 () array!71461)

(assert (=> b!1102817 (= lt!494900 (getCurrentListMap!4412 lt!494896 lt!494904 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494897 () ListLongMap!15385)

(assert (=> b!1102817 (and (= lt!494903 lt!494897) (= lt!494897 lt!494903))))

(declare-fun lt!494899 () ListLongMap!15385)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!991 (ListLongMap!15385 (_ BitVec 64)) ListLongMap!15385)

(assert (=> b!1102817 (= lt!494897 (-!991 lt!494899 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36236 0))(
  ( (Unit!36237) )
))
(declare-fun lt!494902 () Unit!36236)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!238 (array!71459 array!71461 (_ BitVec 32) (_ BitVec 32) V!41485 V!41485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36236)

(assert (=> b!1102817 (= lt!494902 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4208 (array!71459 array!71461 (_ BitVec 32) (_ BitVec 32) V!41485 V!41485 (_ BitVec 32) Int) ListLongMap!15385)

(assert (=> b!1102817 (= lt!494903 (getCurrentListMapNoExtraKeys!4208 lt!494896 lt!494904 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2343 (Int (_ BitVec 64)) V!41485)

(assert (=> b!1102817 (= lt!494904 (array!71462 (store (arr!34391 _values!874) i!650 (ValueCellFull!12925 (dynLambda!2343 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34927 _values!874)))))

(assert (=> b!1102817 (= lt!494899 (getCurrentListMapNoExtraKeys!4208 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102817 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494895 () Unit!36236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71459 (_ BitVec 64) (_ BitVec 32)) Unit!36236)

(assert (=> b!1102817 (= lt!494895 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1102818 () Bool)

(declare-fun res!735835 () Bool)

(declare-fun e!629442 () Bool)

(assert (=> b!1102818 (=> (not res!735835) (not e!629442))))

(declare-datatypes ((List!24034 0))(
  ( (Nil!24031) (Cons!24030 (h!25239 (_ BitVec 64)) (t!34299 List!24034)) )
))
(declare-fun arrayNoDuplicates!0 (array!71459 (_ BitVec 32) List!24034) Bool)

(assert (=> b!1102818 (= res!735835 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24031))))

(declare-fun mapIsEmpty!42697 () Bool)

(declare-fun mapRes!42697 () Bool)

(assert (=> mapIsEmpty!42697 mapRes!42697))

(declare-fun b!1102819 () Bool)

(declare-fun res!735840 () Bool)

(assert (=> b!1102819 (=> (not res!735840) (not e!629442))))

(assert (=> b!1102819 (= res!735840 (and (= (size!34927 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34926 _keys!1070) (size!34927 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102820 () Bool)

(assert (=> b!1102820 (= e!629442 e!629443)))

(declare-fun res!735839 () Bool)

(assert (=> b!1102820 (=> (not res!735839) (not e!629443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71459 (_ BitVec 32)) Bool)

(assert (=> b!1102820 (= res!735839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494896 mask!1414))))

(assert (=> b!1102820 (= lt!494896 (array!71460 (store (arr!34390 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34926 _keys!1070)))))

(declare-fun res!735838 () Bool)

(assert (=> start!96926 (=> (not res!735838) (not e!629442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96926 (= res!735838 (validMask!0 mask!1414))))

(assert (=> start!96926 e!629442))

(assert (=> start!96926 tp!81617))

(assert (=> start!96926 true))

(declare-fun tp_is_empty!27269 () Bool)

(assert (=> start!96926 tp_is_empty!27269))

(declare-fun array_inv!26486 (array!71459) Bool)

(assert (=> start!96926 (array_inv!26486 _keys!1070)))

(declare-fun e!629446 () Bool)

(declare-fun array_inv!26487 (array!71461) Bool)

(assert (=> start!96926 (and (array_inv!26487 _values!874) e!629446)))

(declare-fun b!1102821 () Bool)

(assert (=> b!1102821 (= e!629444 (= (-!991 lt!494901 k!904) lt!494900))))

(declare-fun b!1102822 () Bool)

(declare-fun res!735837 () Bool)

(assert (=> b!1102822 (=> (not res!735837) (not e!629442))))

(assert (=> b!1102822 (= res!735837 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34926 _keys!1070))))))

(declare-fun b!1102823 () Bool)

(declare-fun res!735844 () Bool)

(assert (=> b!1102823 (=> (not res!735844) (not e!629443))))

(assert (=> b!1102823 (= res!735844 (arrayNoDuplicates!0 lt!494896 #b00000000000000000000000000000000 Nil!24031))))

(declare-fun mapNonEmpty!42697 () Bool)

(declare-fun tp!81616 () Bool)

(declare-fun e!629445 () Bool)

(assert (=> mapNonEmpty!42697 (= mapRes!42697 (and tp!81616 e!629445))))

(declare-fun mapValue!42697 () ValueCell!12925)

(declare-fun mapKey!42697 () (_ BitVec 32))

(declare-fun mapRest!42697 () (Array (_ BitVec 32) ValueCell!12925))

(assert (=> mapNonEmpty!42697 (= (arr!34391 _values!874) (store mapRest!42697 mapKey!42697 mapValue!42697))))

(declare-fun b!1102824 () Bool)

(declare-fun res!735841 () Bool)

(assert (=> b!1102824 (=> (not res!735841) (not e!629442))))

(assert (=> b!1102824 (= res!735841 (= (select (arr!34390 _keys!1070) i!650) k!904))))

(declare-fun b!1102825 () Bool)

(declare-fun res!735843 () Bool)

(assert (=> b!1102825 (=> (not res!735843) (not e!629442))))

(assert (=> b!1102825 (= res!735843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102826 () Bool)

(declare-fun e!629441 () Bool)

(assert (=> b!1102826 (= e!629441 tp_is_empty!27269)))

(declare-fun b!1102827 () Bool)

(declare-fun res!735842 () Bool)

(assert (=> b!1102827 (=> (not res!735842) (not e!629442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102827 (= res!735842 (validKeyInArray!0 k!904))))

(declare-fun b!1102828 () Bool)

(assert (=> b!1102828 (= e!629445 tp_is_empty!27269)))

(declare-fun b!1102829 () Bool)

(assert (=> b!1102829 (= e!629446 (and e!629441 mapRes!42697))))

(declare-fun condMapEmpty!42697 () Bool)

(declare-fun mapDefault!42697 () ValueCell!12925)

