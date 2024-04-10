; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97202 () Bool)

(assert start!97202)

(declare-fun b!1105953 () Bool)

(declare-fun res!737989 () Bool)

(declare-fun e!631150 () Bool)

(assert (=> b!1105953 (=> (not res!737989) (not e!631150))))

(declare-datatypes ((array!71783 0))(
  ( (array!71784 (arr!34544 (Array (_ BitVec 32) (_ BitVec 64))) (size!35080 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71783)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71783 (_ BitVec 32)) Bool)

(assert (=> b!1105953 (= res!737989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105954 () Bool)

(declare-fun e!631151 () Bool)

(declare-fun tp_is_empty!27433 () Bool)

(assert (=> b!1105954 (= e!631151 tp_is_empty!27433)))

(declare-fun b!1105955 () Bool)

(declare-fun res!737993 () Bool)

(assert (=> b!1105955 (=> (not res!737993) (not e!631150))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41705 0))(
  ( (V!41706 (val!13773 Int)) )
))
(declare-datatypes ((ValueCell!13007 0))(
  ( (ValueCellFull!13007 (v!16406 V!41705)) (EmptyCell!13007) )
))
(declare-datatypes ((array!71785 0))(
  ( (array!71786 (arr!34545 (Array (_ BitVec 32) ValueCell!13007)) (size!35081 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71785)

(assert (=> b!1105955 (= res!737993 (and (= (size!35081 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35080 _keys!1208) (size!35081 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105956 () Bool)

(declare-fun res!737995 () Bool)

(declare-fun e!631153 () Bool)

(assert (=> b!1105956 (=> (not res!737995) (not e!631153))))

(declare-fun lt!495385 () array!71783)

(declare-datatypes ((List!24084 0))(
  ( (Nil!24081) (Cons!24080 (h!25289 (_ BitVec 64)) (t!34349 List!24084)) )
))
(declare-fun arrayNoDuplicates!0 (array!71783 (_ BitVec 32) List!24084) Bool)

(assert (=> b!1105956 (= res!737995 (arrayNoDuplicates!0 lt!495385 #b00000000000000000000000000000000 Nil!24081))))

(declare-fun b!1105957 () Bool)

(declare-fun res!737994 () Bool)

(assert (=> b!1105957 (=> (not res!737994) (not e!631150))))

(assert (=> b!1105957 (= res!737994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24081))))

(declare-fun b!1105958 () Bool)

(declare-fun e!631154 () Bool)

(assert (=> b!1105958 (= e!631154 tp_is_empty!27433)))

(declare-fun res!737996 () Bool)

(assert (=> start!97202 (=> (not res!737996) (not e!631150))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97202 (= res!737996 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35080 _keys!1208))))))

(assert (=> start!97202 e!631150))

(declare-fun array_inv!26586 (array!71783) Bool)

(assert (=> start!97202 (array_inv!26586 _keys!1208)))

(assert (=> start!97202 true))

(declare-fun e!631155 () Bool)

(declare-fun array_inv!26587 (array!71785) Bool)

(assert (=> start!97202 (and (array_inv!26587 _values!996) e!631155)))

(declare-fun b!1105959 () Bool)

(assert (=> b!1105959 (= e!631153 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105959 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36286 0))(
  ( (Unit!36287) )
))
(declare-fun lt!495386 () Unit!36286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71783 (_ BitVec 64) (_ BitVec 32)) Unit!36286)

(assert (=> b!1105959 (= lt!495386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105960 () Bool)

(declare-fun res!737992 () Bool)

(assert (=> b!1105960 (=> (not res!737992) (not e!631150))))

(assert (=> b!1105960 (= res!737992 (= (select (arr!34544 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!42967 () Bool)

(declare-fun mapRes!42967 () Bool)

(assert (=> mapIsEmpty!42967 mapRes!42967))

(declare-fun b!1105961 () Bool)

(declare-fun res!737998 () Bool)

(assert (=> b!1105961 (=> (not res!737998) (not e!631150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105961 (= res!737998 (validKeyInArray!0 k!934))))

(declare-fun b!1105962 () Bool)

(declare-fun res!737991 () Bool)

(assert (=> b!1105962 (=> (not res!737991) (not e!631150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105962 (= res!737991 (validMask!0 mask!1564))))

(declare-fun b!1105963 () Bool)

(assert (=> b!1105963 (= e!631150 e!631153)))

(declare-fun res!737990 () Bool)

(assert (=> b!1105963 (=> (not res!737990) (not e!631153))))

(assert (=> b!1105963 (= res!737990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495385 mask!1564))))

(assert (=> b!1105963 (= lt!495385 (array!71784 (store (arr!34544 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35080 _keys!1208)))))

(declare-fun mapNonEmpty!42967 () Bool)

(declare-fun tp!81887 () Bool)

(assert (=> mapNonEmpty!42967 (= mapRes!42967 (and tp!81887 e!631151))))

(declare-fun mapKey!42967 () (_ BitVec 32))

(declare-fun mapValue!42967 () ValueCell!13007)

(declare-fun mapRest!42967 () (Array (_ BitVec 32) ValueCell!13007))

(assert (=> mapNonEmpty!42967 (= (arr!34545 _values!996) (store mapRest!42967 mapKey!42967 mapValue!42967))))

(declare-fun b!1105964 () Bool)

(assert (=> b!1105964 (= e!631155 (and e!631154 mapRes!42967))))

(declare-fun condMapEmpty!42967 () Bool)

(declare-fun mapDefault!42967 () ValueCell!13007)

