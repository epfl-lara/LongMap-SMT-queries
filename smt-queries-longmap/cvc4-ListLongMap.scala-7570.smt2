; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95744 () Bool)

(assert start!95744)

(declare-fun b_free!22397 () Bool)

(declare-fun b_next!22397 () Bool)

(assert (=> start!95744 (= b_free!22397 (not b_next!22397))))

(declare-fun tp!79040 () Bool)

(declare-fun b_and!35469 () Bool)

(assert (=> start!95744 (= tp!79040 b_and!35469)))

(declare-fun mapNonEmpty!41353 () Bool)

(declare-fun mapRes!41353 () Bool)

(declare-fun tp!79039 () Bool)

(declare-fun e!618753 () Bool)

(assert (=> mapNonEmpty!41353 (= mapRes!41353 (and tp!79039 e!618753))))

(declare-datatypes ((V!40325 0))(
  ( (V!40326 (val!13256 Int)) )
))
(declare-datatypes ((ValueCell!12490 0))(
  ( (ValueCellFull!12490 (v!15877 V!40325)) (EmptyCell!12490) )
))
(declare-datatypes ((array!69743 0))(
  ( (array!69744 (arr!33545 (Array (_ BitVec 32) ValueCell!12490)) (size!34081 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69743)

(declare-fun mapKey!41353 () (_ BitVec 32))

(declare-fun mapRest!41353 () (Array (_ BitVec 32) ValueCell!12490))

(declare-fun mapValue!41353 () ValueCell!12490)

(assert (=> mapNonEmpty!41353 (= (arr!33545 _values!874) (store mapRest!41353 mapKey!41353 mapValue!41353))))

(declare-fun b!1082755 () Bool)

(declare-fun res!721760 () Bool)

(declare-fun e!618755 () Bool)

(assert (=> b!1082755 (=> (not res!721760) (not e!618755))))

(declare-datatypes ((array!69745 0))(
  ( (array!69746 (arr!33546 (Array (_ BitVec 32) (_ BitVec 64))) (size!34082 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69745)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69745 (_ BitVec 32)) Bool)

(assert (=> b!1082755 (= res!721760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082757 () Bool)

(declare-fun res!721763 () Bool)

(assert (=> b!1082757 (=> (not res!721763) (not e!618755))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082757 (= res!721763 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34082 _keys!1070))))))

(declare-fun b!1082758 () Bool)

(declare-fun e!618754 () Bool)

(declare-fun tp_is_empty!26399 () Bool)

(assert (=> b!1082758 (= e!618754 tp_is_empty!26399)))

(declare-fun b!1082759 () Bool)

(declare-fun res!721757 () Bool)

(assert (=> b!1082759 (=> (not res!721757) (not e!618755))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1082759 (= res!721757 (= (select (arr!33546 _keys!1070) i!650) k!904))))

(declare-fun b!1082760 () Bool)

(declare-fun res!721759 () Bool)

(assert (=> b!1082760 (=> (not res!721759) (not e!618755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082760 (= res!721759 (validKeyInArray!0 k!904))))

(declare-fun b!1082761 () Bool)

(declare-fun e!618750 () Bool)

(assert (=> b!1082761 (= e!618750 (not true))))

(declare-datatypes ((tuple2!16796 0))(
  ( (tuple2!16797 (_1!8409 (_ BitVec 64)) (_2!8409 V!40325)) )
))
(declare-datatypes ((List!23382 0))(
  ( (Nil!23379) (Cons!23378 (h!24587 tuple2!16796) (t!32837 List!23382)) )
))
(declare-datatypes ((ListLongMap!14765 0))(
  ( (ListLongMap!14766 (toList!7398 List!23382)) )
))
(declare-fun lt!479755 () ListLongMap!14765)

(declare-fun lt!479750 () ListLongMap!14765)

(assert (=> b!1082761 (and (= lt!479755 lt!479750) (= lt!479750 lt!479755))))

(declare-fun lt!479753 () ListLongMap!14765)

(declare-fun -!725 (ListLongMap!14765 (_ BitVec 64)) ListLongMap!14765)

(assert (=> b!1082761 (= lt!479750 (-!725 lt!479753 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40325)

(declare-datatypes ((Unit!35616 0))(
  ( (Unit!35617) )
))
(declare-fun lt!479754 () Unit!35616)

(declare-fun zeroValue!831 () V!40325)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!5 (array!69745 array!69743 (_ BitVec 32) (_ BitVec 32) V!40325 V!40325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35616)

(assert (=> b!1082761 (= lt!479754 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!5 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479752 () array!69745)

(declare-fun getCurrentListMapNoExtraKeys!3946 (array!69745 array!69743 (_ BitVec 32) (_ BitVec 32) V!40325 V!40325 (_ BitVec 32) Int) ListLongMap!14765)

(declare-fun dynLambda!2083 (Int (_ BitVec 64)) V!40325)

(assert (=> b!1082761 (= lt!479755 (getCurrentListMapNoExtraKeys!3946 lt!479752 (array!69744 (store (arr!33545 _values!874) i!650 (ValueCellFull!12490 (dynLambda!2083 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34081 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082761 (= lt!479753 (getCurrentListMapNoExtraKeys!3946 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082761 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479751 () Unit!35616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69745 (_ BitVec 64) (_ BitVec 32)) Unit!35616)

(assert (=> b!1082761 (= lt!479751 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082762 () Bool)

(declare-fun res!721756 () Bool)

(assert (=> b!1082762 (=> (not res!721756) (not e!618750))))

(declare-datatypes ((List!23383 0))(
  ( (Nil!23380) (Cons!23379 (h!24588 (_ BitVec 64)) (t!32838 List!23383)) )
))
(declare-fun arrayNoDuplicates!0 (array!69745 (_ BitVec 32) List!23383) Bool)

(assert (=> b!1082762 (= res!721756 (arrayNoDuplicates!0 lt!479752 #b00000000000000000000000000000000 Nil!23380))))

(declare-fun b!1082763 () Bool)

(declare-fun res!721761 () Bool)

(assert (=> b!1082763 (=> (not res!721761) (not e!618755))))

(assert (=> b!1082763 (= res!721761 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23380))))

(declare-fun b!1082764 () Bool)

(assert (=> b!1082764 (= e!618755 e!618750)))

(declare-fun res!721762 () Bool)

(assert (=> b!1082764 (=> (not res!721762) (not e!618750))))

(assert (=> b!1082764 (= res!721762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479752 mask!1414))))

(assert (=> b!1082764 (= lt!479752 (array!69746 (store (arr!33546 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34082 _keys!1070)))))

(declare-fun b!1082765 () Bool)

(declare-fun res!721758 () Bool)

(assert (=> b!1082765 (=> (not res!721758) (not e!618755))))

(assert (=> b!1082765 (= res!721758 (and (= (size!34081 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34082 _keys!1070) (size!34081 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!721764 () Bool)

(assert (=> start!95744 (=> (not res!721764) (not e!618755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95744 (= res!721764 (validMask!0 mask!1414))))

(assert (=> start!95744 e!618755))

(assert (=> start!95744 tp!79040))

(assert (=> start!95744 true))

(assert (=> start!95744 tp_is_empty!26399))

(declare-fun array_inv!25892 (array!69745) Bool)

(assert (=> start!95744 (array_inv!25892 _keys!1070)))

(declare-fun e!618751 () Bool)

(declare-fun array_inv!25893 (array!69743) Bool)

(assert (=> start!95744 (and (array_inv!25893 _values!874) e!618751)))

(declare-fun b!1082756 () Bool)

(assert (=> b!1082756 (= e!618753 tp_is_empty!26399)))

(declare-fun mapIsEmpty!41353 () Bool)

(assert (=> mapIsEmpty!41353 mapRes!41353))

(declare-fun b!1082766 () Bool)

(assert (=> b!1082766 (= e!618751 (and e!618754 mapRes!41353))))

(declare-fun condMapEmpty!41353 () Bool)

(declare-fun mapDefault!41353 () ValueCell!12490)

