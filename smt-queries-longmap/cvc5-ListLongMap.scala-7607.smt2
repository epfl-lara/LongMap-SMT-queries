; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95962 () Bool)

(assert start!95962)

(declare-fun b_free!22615 () Bool)

(declare-fun b_next!22615 () Bool)

(assert (=> start!95962 (= b_free!22615 (not b_next!22615))))

(declare-fun tp!79693 () Bool)

(declare-fun b_and!35905 () Bool)

(assert (=> start!95962 (= tp!79693 b_and!35905)))

(declare-fun b!1087263 () Bool)

(declare-fun e!621067 () Bool)

(declare-fun e!621071 () Bool)

(assert (=> b!1087263 (= e!621067 (not e!621071))))

(declare-fun res!725069 () Bool)

(assert (=> b!1087263 (=> res!725069 e!621071)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087263 (= res!725069 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40617 0))(
  ( (V!40618 (val!13365 Int)) )
))
(declare-fun minValue!831 () V!40617)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16958 0))(
  ( (tuple2!16959 (_1!8490 (_ BitVec 64)) (_2!8490 V!40617)) )
))
(declare-datatypes ((List!23546 0))(
  ( (Nil!23543) (Cons!23542 (h!24751 tuple2!16958) (t!33219 List!23546)) )
))
(declare-datatypes ((ListLongMap!14927 0))(
  ( (ListLongMap!14928 (toList!7479 List!23546)) )
))
(declare-fun lt!483790 () ListLongMap!14927)

(declare-fun zeroValue!831 () V!40617)

(declare-datatypes ((array!70161 0))(
  ( (array!70162 (arr!33754 (Array (_ BitVec 32) (_ BitVec 64))) (size!34290 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70161)

(declare-datatypes ((ValueCell!12599 0))(
  ( (ValueCellFull!12599 (v!15986 V!40617)) (EmptyCell!12599) )
))
(declare-datatypes ((array!70163 0))(
  ( (array!70164 (arr!33755 (Array (_ BitVec 32) ValueCell!12599)) (size!34291 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70163)

(declare-fun getCurrentListMap!4255 (array!70161 array!70163 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14927)

(assert (=> b!1087263 (= lt!483790 (getCurrentListMap!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483786 () array!70161)

(declare-fun lt!483788 () ListLongMap!14927)

(declare-fun lt!483783 () array!70163)

(assert (=> b!1087263 (= lt!483788 (getCurrentListMap!4255 lt!483786 lt!483783 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483784 () ListLongMap!14927)

(declare-fun lt!483782 () ListLongMap!14927)

(assert (=> b!1087263 (and (= lt!483784 lt!483782) (= lt!483782 lt!483784))))

(declare-fun lt!483787 () ListLongMap!14927)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!805 (ListLongMap!14927 (_ BitVec 64)) ListLongMap!14927)

(assert (=> b!1087263 (= lt!483782 (-!805 lt!483787 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35776 0))(
  ( (Unit!35777) )
))
(declare-fun lt!483789 () Unit!35776)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 (array!70161 array!70163 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35776)

(assert (=> b!1087263 (= lt!483789 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!74 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4015 (array!70161 array!70163 (_ BitVec 32) (_ BitVec 32) V!40617 V!40617 (_ BitVec 32) Int) ListLongMap!14927)

(assert (=> b!1087263 (= lt!483784 (getCurrentListMapNoExtraKeys!4015 lt!483786 lt!483783 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2152 (Int (_ BitVec 64)) V!40617)

(assert (=> b!1087263 (= lt!483783 (array!70164 (store (arr!33755 _values!874) i!650 (ValueCellFull!12599 (dynLambda!2152 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34291 _values!874)))))

(assert (=> b!1087263 (= lt!483787 (getCurrentListMapNoExtraKeys!4015 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087263 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483781 () Unit!35776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70161 (_ BitVec 64) (_ BitVec 32)) Unit!35776)

(assert (=> b!1087263 (= lt!483781 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087264 () Bool)

(declare-fun res!725065 () Bool)

(declare-fun e!621074 () Bool)

(assert (=> b!1087264 (=> (not res!725065) (not e!621074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087264 (= res!725065 (validKeyInArray!0 k!904))))

(declare-fun b!1087265 () Bool)

(declare-fun res!725068 () Bool)

(assert (=> b!1087265 (=> (not res!725068) (not e!621074))))

(assert (=> b!1087265 (= res!725068 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34290 _keys!1070))))))

(declare-fun b!1087266 () Bool)

(declare-fun res!725072 () Bool)

(assert (=> b!1087266 (=> (not res!725072) (not e!621074))))

(assert (=> b!1087266 (= res!725072 (and (= (size!34291 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34290 _keys!1070) (size!34291 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087267 () Bool)

(declare-fun res!725070 () Bool)

(assert (=> b!1087267 (=> (not res!725070) (not e!621074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70161 (_ BitVec 32)) Bool)

(assert (=> b!1087267 (= res!725070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087268 () Bool)

(declare-fun e!621070 () Bool)

(declare-fun tp_is_empty!26617 () Bool)

(assert (=> b!1087268 (= e!621070 tp_is_empty!26617)))

(declare-fun b!1087269 () Bool)

(declare-fun e!621073 () Bool)

(assert (=> b!1087269 (= e!621073 tp_is_empty!26617)))

(declare-fun b!1087270 () Bool)

(declare-fun e!621068 () Bool)

(declare-fun lt!483785 () tuple2!16958)

(declare-fun +!3284 (ListLongMap!14927 tuple2!16958) ListLongMap!14927)

(assert (=> b!1087270 (= e!621068 (= lt!483788 (+!3284 lt!483782 lt!483785)))))

(declare-fun b!1087272 () Bool)

(declare-fun res!725071 () Bool)

(assert (=> b!1087272 (=> (not res!725071) (not e!621074))))

(assert (=> b!1087272 (= res!725071 (= (select (arr!33754 _keys!1070) i!650) k!904))))

(declare-fun b!1087273 () Bool)

(assert (=> b!1087273 (= e!621071 true)))

(assert (=> b!1087273 e!621068))

(declare-fun res!725067 () Bool)

(assert (=> b!1087273 (=> (not res!725067) (not e!621068))))

(assert (=> b!1087273 (= res!725067 (= lt!483788 (+!3284 lt!483784 lt!483785)))))

(assert (=> b!1087273 (= lt!483785 (tuple2!16959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41680 () Bool)

(declare-fun mapRes!41680 () Bool)

(declare-fun tp!79694 () Bool)

(assert (=> mapNonEmpty!41680 (= mapRes!41680 (and tp!79694 e!621070))))

(declare-fun mapKey!41680 () (_ BitVec 32))

(declare-fun mapValue!41680 () ValueCell!12599)

(declare-fun mapRest!41680 () (Array (_ BitVec 32) ValueCell!12599))

(assert (=> mapNonEmpty!41680 (= (arr!33755 _values!874) (store mapRest!41680 mapKey!41680 mapValue!41680))))

(declare-fun b!1087274 () Bool)

(declare-fun e!621072 () Bool)

(assert (=> b!1087274 (= e!621072 (and e!621073 mapRes!41680))))

(declare-fun condMapEmpty!41680 () Bool)

(declare-fun mapDefault!41680 () ValueCell!12599)

