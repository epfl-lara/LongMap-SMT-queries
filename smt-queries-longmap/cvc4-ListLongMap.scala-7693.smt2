; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96560 () Bool)

(assert start!96560)

(declare-fun b_free!23087 () Bool)

(declare-fun b_next!23087 () Bool)

(assert (=> start!96560 (= b_free!23087 (not b_next!23087))))

(declare-fun tp!81194 () Bool)

(declare-fun b_and!36865 () Bool)

(assert (=> start!96560 (= tp!81194 b_and!36865)))

(declare-fun b!1098200 () Bool)

(declare-fun e!626793 () Bool)

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1098200 (= e!626793 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(declare-fun e!626791 () Bool)

(assert (=> b!1098200 e!626791))

(declare-fun res!732945 () Bool)

(assert (=> b!1098200 (=> (not res!732945) (not e!626791))))

(declare-datatypes ((V!41309 0))(
  ( (V!41310 (val!13625 Int)) )
))
(declare-datatypes ((tuple2!17306 0))(
  ( (tuple2!17307 (_1!8664 (_ BitVec 64)) (_2!8664 V!41309)) )
))
(declare-fun lt!491156 () tuple2!17306)

(declare-fun lt!491163 () tuple2!17306)

(declare-datatypes ((List!23927 0))(
  ( (Nil!23924) (Cons!23923 (h!25132 tuple2!17306) (t!34060 List!23927)) )
))
(declare-datatypes ((ListLongMap!15275 0))(
  ( (ListLongMap!15276 (toList!7653 List!23927)) )
))
(declare-fun lt!491158 () ListLongMap!15275)

(declare-fun lt!491159 () ListLongMap!15275)

(declare-fun +!3362 (ListLongMap!15275 tuple2!17306) ListLongMap!15275)

(assert (=> b!1098200 (= res!732945 (= lt!491158 (+!3362 (+!3362 lt!491159 lt!491163) lt!491156)))))

(declare-fun minValue!831 () V!41309)

(assert (=> b!1098200 (= lt!491156 (tuple2!17307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41309)

(assert (=> b!1098200 (= lt!491163 (tuple2!17307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098201 () Bool)

(declare-fun e!626790 () Bool)

(declare-fun tp_is_empty!27137 () Bool)

(assert (=> b!1098201 (= e!626790 tp_is_empty!27137)))

(declare-fun b!1098202 () Bool)

(declare-fun res!732941 () Bool)

(assert (=> b!1098202 (=> (not res!732941) (not e!626791))))

(declare-fun lt!491153 () ListLongMap!15275)

(declare-fun lt!491157 () ListLongMap!15275)

(assert (=> b!1098202 (= res!732941 (= lt!491157 (+!3362 (+!3362 lt!491153 lt!491163) lt!491156)))))

(declare-fun b!1098203 () Bool)

(declare-fun res!732944 () Bool)

(declare-fun e!626788 () Bool)

(assert (=> b!1098203 (=> (not res!732944) (not e!626788))))

(declare-datatypes ((array!71185 0))(
  ( (array!71186 (arr!34262 (Array (_ BitVec 32) (_ BitVec 64))) (size!34798 (_ BitVec 32))) )
))
(declare-fun lt!491154 () array!71185)

(declare-datatypes ((List!23928 0))(
  ( (Nil!23925) (Cons!23924 (h!25133 (_ BitVec 64)) (t!34061 List!23928)) )
))
(declare-fun arrayNoDuplicates!0 (array!71185 (_ BitVec 32) List!23928) Bool)

(assert (=> b!1098203 (= res!732944 (arrayNoDuplicates!0 lt!491154 #b00000000000000000000000000000000 Nil!23925))))

(declare-fun b!1098204 () Bool)

(declare-fun res!732937 () Bool)

(declare-fun e!626789 () Bool)

(assert (=> b!1098204 (=> (not res!732937) (not e!626789))))

(declare-fun _keys!1070 () array!71185)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098204 (= res!732937 (= (select (arr!34262 _keys!1070) i!650) k!904))))

(declare-fun b!1098205 () Bool)

(declare-fun res!732936 () Bool)

(assert (=> b!1098205 (=> (not res!732936) (not e!626789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098205 (= res!732936 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!42472 () Bool)

(declare-fun mapRes!42472 () Bool)

(declare-fun tp!81193 () Bool)

(declare-fun e!626795 () Bool)

(assert (=> mapNonEmpty!42472 (= mapRes!42472 (and tp!81193 e!626795))))

(declare-datatypes ((ValueCell!12859 0))(
  ( (ValueCellFull!12859 (v!16248 V!41309)) (EmptyCell!12859) )
))
(declare-fun mapValue!42472 () ValueCell!12859)

(declare-fun mapRest!42472 () (Array (_ BitVec 32) ValueCell!12859))

(declare-datatypes ((array!71187 0))(
  ( (array!71188 (arr!34263 (Array (_ BitVec 32) ValueCell!12859)) (size!34799 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71187)

(declare-fun mapKey!42472 () (_ BitVec 32))

(assert (=> mapNonEmpty!42472 (= (arr!34263 _values!874) (store mapRest!42472 mapKey!42472 mapValue!42472))))

(declare-fun b!1098206 () Bool)

(declare-fun lt!491162 () ListLongMap!15275)

(assert (=> b!1098206 (= e!626791 (= lt!491158 (+!3362 (+!3362 lt!491162 lt!491163) lt!491156)))))

(declare-fun res!732934 () Bool)

(assert (=> start!96560 (=> (not res!732934) (not e!626789))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96560 (= res!732934 (validMask!0 mask!1414))))

(assert (=> start!96560 e!626789))

(assert (=> start!96560 tp!81194))

(assert (=> start!96560 true))

(assert (=> start!96560 tp_is_empty!27137))

(declare-fun array_inv!26396 (array!71185) Bool)

(assert (=> start!96560 (array_inv!26396 _keys!1070)))

(declare-fun e!626792 () Bool)

(declare-fun array_inv!26397 (array!71187) Bool)

(assert (=> start!96560 (and (array_inv!26397 _values!874) e!626792)))

(declare-fun b!1098207 () Bool)

(assert (=> b!1098207 (= e!626792 (and e!626790 mapRes!42472))))

(declare-fun condMapEmpty!42472 () Bool)

(declare-fun mapDefault!42472 () ValueCell!12859)

