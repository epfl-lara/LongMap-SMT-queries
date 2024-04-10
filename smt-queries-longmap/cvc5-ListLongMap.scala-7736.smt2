; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97144 () Bool)

(assert start!97144)

(declare-fun b!1105084 () Bool)

(declare-fun res!737337 () Bool)

(declare-fun e!630734 () Bool)

(assert (=> b!1105084 (=> (not res!737337) (not e!630734))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105084 (= res!737337 (validKeyInArray!0 k!934))))

(declare-fun b!1105085 () Bool)

(declare-fun res!737339 () Bool)

(assert (=> b!1105085 (=> (not res!737339) (not e!630734))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71703 0))(
  ( (array!71704 (arr!34505 (Array (_ BitVec 32) (_ BitVec 64))) (size!35041 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71703)

(assert (=> b!1105085 (= res!737339 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35041 _keys!1208))))))

(declare-fun b!1105086 () Bool)

(declare-fun e!630737 () Bool)

(assert (=> b!1105086 (= e!630737 (not (or (bvsge #b00000000000000000000000000000000 (size!35041 _keys!1208)) (bvslt (size!35041 _keys!1208) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!71703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105086 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36262 0))(
  ( (Unit!36263) )
))
(declare-fun lt!495245 () Unit!36262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71703 (_ BitVec 64) (_ BitVec 32)) Unit!36262)

(assert (=> b!1105086 (= lt!495245 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105087 () Bool)

(declare-fun e!630736 () Bool)

(declare-fun tp_is_empty!27391 () Bool)

(assert (=> b!1105087 (= e!630736 tp_is_empty!27391)))

(declare-fun b!1105089 () Bool)

(declare-fun res!737340 () Bool)

(assert (=> b!1105089 (=> (not res!737340) (not e!630734))))

(declare-datatypes ((List!24069 0))(
  ( (Nil!24066) (Cons!24065 (h!25274 (_ BitVec 64)) (t!34334 List!24069)) )
))
(declare-fun arrayNoDuplicates!0 (array!71703 (_ BitVec 32) List!24069) Bool)

(assert (=> b!1105089 (= res!737340 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24066))))

(declare-fun b!1105090 () Bool)

(assert (=> b!1105090 (= e!630734 e!630737)))

(declare-fun res!737342 () Bool)

(assert (=> b!1105090 (=> (not res!737342) (not e!630737))))

(declare-fun lt!495244 () array!71703)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71703 (_ BitVec 32)) Bool)

(assert (=> b!1105090 (= res!737342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495244 mask!1564))))

(assert (=> b!1105090 (= lt!495244 (array!71704 (store (arr!34505 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35041 _keys!1208)))))

(declare-fun b!1105091 () Bool)

(declare-fun res!737334 () Bool)

(assert (=> b!1105091 (=> (not res!737334) (not e!630734))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41649 0))(
  ( (V!41650 (val!13752 Int)) )
))
(declare-datatypes ((ValueCell!12986 0))(
  ( (ValueCellFull!12986 (v!16385 V!41649)) (EmptyCell!12986) )
))
(declare-datatypes ((array!71705 0))(
  ( (array!71706 (arr!34506 (Array (_ BitVec 32) ValueCell!12986)) (size!35042 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71705)

(assert (=> b!1105091 (= res!737334 (and (= (size!35042 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35041 _keys!1208) (size!35042 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42901 () Bool)

(declare-fun mapRes!42901 () Bool)

(assert (=> mapIsEmpty!42901 mapRes!42901))

(declare-fun b!1105092 () Bool)

(declare-fun res!737336 () Bool)

(assert (=> b!1105092 (=> (not res!737336) (not e!630734))))

(assert (=> b!1105092 (= res!737336 (= (select (arr!34505 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!42901 () Bool)

(declare-fun tp!81821 () Bool)

(assert (=> mapNonEmpty!42901 (= mapRes!42901 (and tp!81821 e!630736))))

(declare-fun mapRest!42901 () (Array (_ BitVec 32) ValueCell!12986))

(declare-fun mapValue!42901 () ValueCell!12986)

(declare-fun mapKey!42901 () (_ BitVec 32))

(assert (=> mapNonEmpty!42901 (= (arr!34506 _values!996) (store mapRest!42901 mapKey!42901 mapValue!42901))))

(declare-fun b!1105093 () Bool)

(declare-fun res!737335 () Bool)

(assert (=> b!1105093 (=> (not res!737335) (not e!630737))))

(assert (=> b!1105093 (= res!737335 (arrayNoDuplicates!0 lt!495244 #b00000000000000000000000000000000 Nil!24066))))

(declare-fun b!1105094 () Bool)

(declare-fun e!630735 () Bool)

(declare-fun e!630732 () Bool)

(assert (=> b!1105094 (= e!630735 (and e!630732 mapRes!42901))))

(declare-fun condMapEmpty!42901 () Bool)

(declare-fun mapDefault!42901 () ValueCell!12986)

