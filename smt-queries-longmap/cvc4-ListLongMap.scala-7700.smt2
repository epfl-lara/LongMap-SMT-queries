; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96708 () Bool)

(assert start!96708)

(declare-fun b_free!23129 () Bool)

(declare-fun b_next!23129 () Bool)

(assert (=> start!96708 (= b_free!23129 (not b_next!23129))))

(declare-fun tp!81332 () Bool)

(declare-fun b_and!37005 () Bool)

(assert (=> start!96708 (= tp!81332 b_and!37005)))

(declare-datatypes ((V!41365 0))(
  ( (V!41366 (val!13646 Int)) )
))
(declare-datatypes ((tuple2!17344 0))(
  ( (tuple2!17345 (_1!8683 (_ BitVec 64)) (_2!8683 V!41365)) )
))
(declare-datatypes ((List!23962 0))(
  ( (Nil!23959) (Cons!23958 (h!25167 tuple2!17344) (t!34137 List!23962)) )
))
(declare-datatypes ((ListLongMap!15313 0))(
  ( (ListLongMap!15314 (toList!7672 List!23962)) )
))
(declare-fun lt!492645 () ListLongMap!15313)

(declare-fun lt!492651 () ListLongMap!15313)

(declare-fun lt!492646 () tuple2!17344)

(declare-fun b!1099908 () Bool)

(declare-fun e!627794 () Bool)

(declare-fun +!3379 (ListLongMap!15313 tuple2!17344) ListLongMap!15313)

(assert (=> b!1099908 (= e!627794 (= lt!492651 (+!3379 lt!492645 lt!492646)))))

(declare-fun e!627799 () Bool)

(assert (=> b!1099908 e!627799))

(declare-fun res!733971 () Bool)

(assert (=> b!1099908 (=> (not res!733971) (not e!627799))))

(declare-fun lt!492653 () ListLongMap!15313)

(assert (=> b!1099908 (= res!733971 (= lt!492651 (+!3379 lt!492653 lt!492646)))))

(declare-fun zeroValue!831 () V!41365)

(assert (=> b!1099908 (= lt!492646 (tuple2!17345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099909 () Bool)

(declare-fun res!733976 () Bool)

(declare-fun e!627797 () Bool)

(assert (=> b!1099909 (=> (not res!733976) (not e!627797))))

(declare-datatypes ((array!71275 0))(
  ( (array!71276 (arr!34303 (Array (_ BitVec 32) (_ BitVec 64))) (size!34839 (_ BitVec 32))) )
))
(declare-fun lt!492652 () array!71275)

(declare-datatypes ((List!23963 0))(
  ( (Nil!23960) (Cons!23959 (h!25168 (_ BitVec 64)) (t!34138 List!23963)) )
))
(declare-fun arrayNoDuplicates!0 (array!71275 (_ BitVec 32) List!23963) Bool)

(assert (=> b!1099909 (= res!733976 (arrayNoDuplicates!0 lt!492652 #b00000000000000000000000000000000 Nil!23960))))

(declare-fun mapNonEmpty!42547 () Bool)

(declare-fun mapRes!42547 () Bool)

(declare-fun tp!81331 () Bool)

(declare-fun e!627792 () Bool)

(assert (=> mapNonEmpty!42547 (= mapRes!42547 (and tp!81331 e!627792))))

(declare-datatypes ((ValueCell!12880 0))(
  ( (ValueCellFull!12880 (v!16273 V!41365)) (EmptyCell!12880) )
))
(declare-datatypes ((array!71277 0))(
  ( (array!71278 (arr!34304 (Array (_ BitVec 32) ValueCell!12880)) (size!34840 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71277)

(declare-fun mapValue!42547 () ValueCell!12880)

(declare-fun mapRest!42547 () (Array (_ BitVec 32) ValueCell!12880))

(declare-fun mapKey!42547 () (_ BitVec 32))

(assert (=> mapNonEmpty!42547 (= (arr!34304 _values!874) (store mapRest!42547 mapKey!42547 mapValue!42547))))

(declare-fun b!1099910 () Bool)

(declare-fun e!627798 () Bool)

(assert (=> b!1099910 (= e!627798 e!627797)))

(declare-fun res!733978 () Bool)

(assert (=> b!1099910 (=> (not res!733978) (not e!627797))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71275 (_ BitVec 32)) Bool)

(assert (=> b!1099910 (= res!733978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492652 mask!1414))))

(declare-fun _keys!1070 () array!71275)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099910 (= lt!492652 (array!71276 (store (arr!34303 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34839 _keys!1070)))))

(declare-fun mapIsEmpty!42547 () Bool)

(assert (=> mapIsEmpty!42547 mapRes!42547))

(declare-fun b!1099911 () Bool)

(declare-fun res!733977 () Bool)

(assert (=> b!1099911 (=> (not res!733977) (not e!627798))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1099911 (= res!733977 (= (select (arr!34303 _keys!1070) i!650) k!904))))

(declare-fun b!1099912 () Bool)

(declare-fun res!733974 () Bool)

(assert (=> b!1099912 (=> (not res!733974) (not e!627798))))

(assert (=> b!1099912 (= res!733974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!733972 () Bool)

(assert (=> start!96708 (=> (not res!733972) (not e!627798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96708 (= res!733972 (validMask!0 mask!1414))))

(assert (=> start!96708 e!627798))

(assert (=> start!96708 tp!81332))

(assert (=> start!96708 true))

(declare-fun tp_is_empty!27179 () Bool)

(assert (=> start!96708 tp_is_empty!27179))

(declare-fun array_inv!26424 (array!71275) Bool)

(assert (=> start!96708 (array_inv!26424 _keys!1070)))

(declare-fun e!627795 () Bool)

(declare-fun array_inv!26425 (array!71277) Bool)

(assert (=> start!96708 (and (array_inv!26425 _values!874) e!627795)))

(declare-fun b!1099913 () Bool)

(declare-fun lt!492647 () ListLongMap!15313)

(declare-fun lt!492644 () ListLongMap!15313)

(assert (=> b!1099913 (= e!627799 (= lt!492647 (+!3379 lt!492644 lt!492646)))))

(declare-fun b!1099914 () Bool)

(assert (=> b!1099914 (= e!627797 (not e!627794))))

(declare-fun res!733980 () Bool)

(assert (=> b!1099914 (=> res!733980 e!627794)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099914 (= res!733980 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41365)

(declare-fun getCurrentListMap!4385 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41365 V!41365 (_ BitVec 32) Int) ListLongMap!15313)

(assert (=> b!1099914 (= lt!492647 (getCurrentListMap!4385 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492649 () array!71277)

(assert (=> b!1099914 (= lt!492651 (getCurrentListMap!4385 lt!492652 lt!492649 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1099914 (and (= lt!492653 lt!492645) (= lt!492645 lt!492653))))

(declare-fun -!960 (ListLongMap!15313 (_ BitVec 64)) ListLongMap!15313)

(assert (=> b!1099914 (= lt!492645 (-!960 lt!492644 k!904))))

(declare-datatypes ((Unit!36164 0))(
  ( (Unit!36165) )
))
(declare-fun lt!492650 () Unit!36164)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!211 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41365 V!41365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36164)

(assert (=> b!1099914 (= lt!492650 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4181 (array!71275 array!71277 (_ BitVec 32) (_ BitVec 32) V!41365 V!41365 (_ BitVec 32) Int) ListLongMap!15313)

(assert (=> b!1099914 (= lt!492653 (getCurrentListMapNoExtraKeys!4181 lt!492652 lt!492649 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2316 (Int (_ BitVec 64)) V!41365)

(assert (=> b!1099914 (= lt!492649 (array!71278 (store (arr!34304 _values!874) i!650 (ValueCellFull!12880 (dynLambda!2316 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34840 _values!874)))))

(assert (=> b!1099914 (= lt!492644 (getCurrentListMapNoExtraKeys!4181 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099914 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492648 () Unit!36164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71275 (_ BitVec 64) (_ BitVec 32)) Unit!36164)

(assert (=> b!1099914 (= lt!492648 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1099915 () Bool)

(declare-fun e!627796 () Bool)

(assert (=> b!1099915 (= e!627795 (and e!627796 mapRes!42547))))

(declare-fun condMapEmpty!42547 () Bool)

(declare-fun mapDefault!42547 () ValueCell!12880)

