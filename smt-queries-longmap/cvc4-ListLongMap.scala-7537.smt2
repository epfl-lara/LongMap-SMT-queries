; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95546 () Bool)

(assert start!95546)

(declare-fun b!1079097 () Bool)

(declare-fun res!719084 () Bool)

(declare-fun e!616973 () Bool)

(assert (=> b!1079097 (=> (not res!719084) (not e!616973))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69359 0))(
  ( (array!69360 (arr!33353 (Array (_ BitVec 32) (_ BitVec 64))) (size!33889 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69359)

(declare-datatypes ((V!40061 0))(
  ( (V!40062 (val!13157 Int)) )
))
(declare-datatypes ((ValueCell!12391 0))(
  ( (ValueCellFull!12391 (v!15778 V!40061)) (EmptyCell!12391) )
))
(declare-datatypes ((array!69361 0))(
  ( (array!69362 (arr!33354 (Array (_ BitVec 32) ValueCell!12391)) (size!33890 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69361)

(assert (=> b!1079097 (= res!719084 (and (= (size!33890 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33889 _keys!1070) (size!33890 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079098 () Bool)

(declare-fun res!719087 () Bool)

(declare-fun e!616971 () Bool)

(assert (=> b!1079098 (=> (not res!719087) (not e!616971))))

(declare-fun lt!478755 () array!69359)

(declare-datatypes ((List!23252 0))(
  ( (Nil!23249) (Cons!23248 (h!24457 (_ BitVec 64)) (t!32611 List!23252)) )
))
(declare-fun arrayNoDuplicates!0 (array!69359 (_ BitVec 32) List!23252) Bool)

(assert (=> b!1079098 (= res!719087 (arrayNoDuplicates!0 lt!478755 #b00000000000000000000000000000000 Nil!23249))))

(declare-fun b!1079099 () Bool)

(declare-fun res!719089 () Bool)

(assert (=> b!1079099 (=> (not res!719089) (not e!616973))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079099 (= res!719089 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33889 _keys!1070))))))

(declare-fun mapIsEmpty!41056 () Bool)

(declare-fun mapRes!41056 () Bool)

(assert (=> mapIsEmpty!41056 mapRes!41056))

(declare-fun b!1079100 () Bool)

(declare-fun res!719086 () Bool)

(assert (=> b!1079100 (=> (not res!719086) (not e!616973))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079100 (= res!719086 (validKeyInArray!0 k!904))))

(declare-fun res!719091 () Bool)

(assert (=> start!95546 (=> (not res!719091) (not e!616973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95546 (= res!719091 (validMask!0 mask!1414))))

(assert (=> start!95546 e!616973))

(assert (=> start!95546 true))

(declare-fun array_inv!25764 (array!69359) Bool)

(assert (=> start!95546 (array_inv!25764 _keys!1070)))

(declare-fun e!616970 () Bool)

(declare-fun array_inv!25765 (array!69361) Bool)

(assert (=> start!95546 (and (array_inv!25765 _values!874) e!616970)))

(declare-fun mapNonEmpty!41056 () Bool)

(declare-fun tp!78518 () Bool)

(declare-fun e!616972 () Bool)

(assert (=> mapNonEmpty!41056 (= mapRes!41056 (and tp!78518 e!616972))))

(declare-fun mapKey!41056 () (_ BitVec 32))

(declare-fun mapRest!41056 () (Array (_ BitVec 32) ValueCell!12391))

(declare-fun mapValue!41056 () ValueCell!12391)

(assert (=> mapNonEmpty!41056 (= (arr!33354 _values!874) (store mapRest!41056 mapKey!41056 mapValue!41056))))

(declare-fun b!1079101 () Bool)

(declare-fun res!719085 () Bool)

(assert (=> b!1079101 (=> (not res!719085) (not e!616973))))

(assert (=> b!1079101 (= res!719085 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23249))))

(declare-fun b!1079102 () Bool)

(declare-fun res!719090 () Bool)

(assert (=> b!1079102 (=> (not res!719090) (not e!616973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69359 (_ BitVec 32)) Bool)

(assert (=> b!1079102 (= res!719090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079103 () Bool)

(assert (=> b!1079103 (= e!616971 (not true))))

(declare-fun arrayContainsKey!0 (array!69359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079103 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35482 0))(
  ( (Unit!35483) )
))
(declare-fun lt!478756 () Unit!35482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69359 (_ BitVec 64) (_ BitVec 32)) Unit!35482)

(assert (=> b!1079103 (= lt!478756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079104 () Bool)

(declare-fun res!719088 () Bool)

(assert (=> b!1079104 (=> (not res!719088) (not e!616973))))

(assert (=> b!1079104 (= res!719088 (= (select (arr!33353 _keys!1070) i!650) k!904))))

(declare-fun b!1079105 () Bool)

(assert (=> b!1079105 (= e!616973 e!616971)))

(declare-fun res!719083 () Bool)

(assert (=> b!1079105 (=> (not res!719083) (not e!616971))))

(assert (=> b!1079105 (= res!719083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478755 mask!1414))))

(assert (=> b!1079105 (= lt!478755 (array!69360 (store (arr!33353 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33889 _keys!1070)))))

(declare-fun b!1079106 () Bool)

(declare-fun e!616968 () Bool)

(assert (=> b!1079106 (= e!616970 (and e!616968 mapRes!41056))))

(declare-fun condMapEmpty!41056 () Bool)

(declare-fun mapDefault!41056 () ValueCell!12391)

