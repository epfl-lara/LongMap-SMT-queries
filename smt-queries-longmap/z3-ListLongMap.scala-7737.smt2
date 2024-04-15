; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97160 () Bool)

(assert start!97160)

(declare-fun b!1105098 () Bool)

(declare-fun e!630735 () Bool)

(declare-fun tp_is_empty!27397 () Bool)

(assert (=> b!1105098 (= e!630735 tp_is_empty!27397)))

(declare-fun b!1105099 () Bool)

(declare-fun e!630738 () Bool)

(assert (=> b!1105099 (= e!630738 tp_is_empty!27397)))

(declare-fun b!1105100 () Bool)

(declare-fun e!630734 () Bool)

(declare-fun e!630737 () Bool)

(assert (=> b!1105100 (= e!630734 e!630737)))

(declare-fun res!737382 () Bool)

(assert (=> b!1105100 (=> (not res!737382) (not e!630737))))

(declare-datatypes ((array!71628 0))(
  ( (array!71629 (arr!34467 (Array (_ BitVec 32) (_ BitVec 64))) (size!35005 (_ BitVec 32))) )
))
(declare-fun lt!495078 () array!71628)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71628 (_ BitVec 32)) Bool)

(assert (=> b!1105100 (= res!737382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495078 mask!1564))))

(declare-fun _keys!1208 () array!71628)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105100 (= lt!495078 (array!71629 (store (arr!34467 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35005 _keys!1208)))))

(declare-fun mapNonEmpty!42913 () Bool)

(declare-fun mapRes!42913 () Bool)

(declare-fun tp!81833 () Bool)

(assert (=> mapNonEmpty!42913 (= mapRes!42913 (and tp!81833 e!630735))))

(declare-datatypes ((V!41657 0))(
  ( (V!41658 (val!13755 Int)) )
))
(declare-datatypes ((ValueCell!12989 0))(
  ( (ValueCellFull!12989 (v!16387 V!41657)) (EmptyCell!12989) )
))
(declare-fun mapValue!42913 () ValueCell!12989)

(declare-fun mapKey!42913 () (_ BitVec 32))

(declare-fun mapRest!42913 () (Array (_ BitVec 32) ValueCell!12989))

(declare-datatypes ((array!71630 0))(
  ( (array!71631 (arr!34468 (Array (_ BitVec 32) ValueCell!12989)) (size!35006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71630)

(assert (=> mapNonEmpty!42913 (= (arr!34468 _values!996) (store mapRest!42913 mapKey!42913 mapValue!42913))))

(declare-fun b!1105101 () Bool)

(assert (=> b!1105101 (= e!630737 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36085 0))(
  ( (Unit!36086) )
))
(declare-fun lt!495077 () Unit!36085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71628 (_ BitVec 64) (_ BitVec 32)) Unit!36085)

(assert (=> b!1105101 (= lt!495077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105102 () Bool)

(declare-fun res!737387 () Bool)

(assert (=> b!1105102 (=> (not res!737387) (not e!630734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105102 (= res!737387 (validKeyInArray!0 k0!934))))

(declare-fun b!1105103 () Bool)

(declare-fun res!737388 () Bool)

(assert (=> b!1105103 (=> (not res!737388) (not e!630734))))

(assert (=> b!1105103 (= res!737388 (= (select (arr!34467 _keys!1208) i!673) k0!934))))

(declare-fun b!1105104 () Bool)

(declare-fun res!737380 () Bool)

(assert (=> b!1105104 (=> (not res!737380) (not e!630734))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105104 (= res!737380 (and (= (size!35006 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35005 _keys!1208) (size!35006 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105105 () Bool)

(declare-fun res!737383 () Bool)

(assert (=> b!1105105 (=> (not res!737383) (not e!630737))))

(declare-datatypes ((List!24105 0))(
  ( (Nil!24102) (Cons!24101 (h!25310 (_ BitVec 64)) (t!34361 List!24105)) )
))
(declare-fun arrayNoDuplicates!0 (array!71628 (_ BitVec 32) List!24105) Bool)

(assert (=> b!1105105 (= res!737383 (arrayNoDuplicates!0 lt!495078 #b00000000000000000000000000000000 Nil!24102))))

(declare-fun b!1105106 () Bool)

(declare-fun res!737384 () Bool)

(assert (=> b!1105106 (=> (not res!737384) (not e!630734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105106 (= res!737384 (validMask!0 mask!1564))))

(declare-fun res!737389 () Bool)

(assert (=> start!97160 (=> (not res!737389) (not e!630734))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97160 (= res!737389 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35005 _keys!1208))))))

(assert (=> start!97160 e!630734))

(declare-fun array_inv!26580 (array!71628) Bool)

(assert (=> start!97160 (array_inv!26580 _keys!1208)))

(assert (=> start!97160 true))

(declare-fun e!630736 () Bool)

(declare-fun array_inv!26581 (array!71630) Bool)

(assert (=> start!97160 (and (array_inv!26581 _values!996) e!630736)))

(declare-fun mapIsEmpty!42913 () Bool)

(assert (=> mapIsEmpty!42913 mapRes!42913))

(declare-fun b!1105107 () Bool)

(declare-fun res!737386 () Bool)

(assert (=> b!1105107 (=> (not res!737386) (not e!630734))))

(assert (=> b!1105107 (= res!737386 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24102))))

(declare-fun b!1105108 () Bool)

(declare-fun res!737385 () Bool)

(assert (=> b!1105108 (=> (not res!737385) (not e!630734))))

(assert (=> b!1105108 (= res!737385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35005 _keys!1208))))))

(declare-fun b!1105109 () Bool)

(declare-fun res!737381 () Bool)

(assert (=> b!1105109 (=> (not res!737381) (not e!630734))))

(assert (=> b!1105109 (= res!737381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105110 () Bool)

(assert (=> b!1105110 (= e!630736 (and e!630738 mapRes!42913))))

(declare-fun condMapEmpty!42913 () Bool)

(declare-fun mapDefault!42913 () ValueCell!12989)

(assert (=> b!1105110 (= condMapEmpty!42913 (= (arr!34468 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12989)) mapDefault!42913)))))

(assert (= (and start!97160 res!737389) b!1105106))

(assert (= (and b!1105106 res!737384) b!1105104))

(assert (= (and b!1105104 res!737380) b!1105109))

(assert (= (and b!1105109 res!737381) b!1105107))

(assert (= (and b!1105107 res!737386) b!1105108))

(assert (= (and b!1105108 res!737385) b!1105102))

(assert (= (and b!1105102 res!737387) b!1105103))

(assert (= (and b!1105103 res!737388) b!1105100))

(assert (= (and b!1105100 res!737382) b!1105105))

(assert (= (and b!1105105 res!737383) b!1105101))

(assert (= (and b!1105110 condMapEmpty!42913) mapIsEmpty!42913))

(assert (= (and b!1105110 (not condMapEmpty!42913)) mapNonEmpty!42913))

(get-info :version)

(assert (= (and mapNonEmpty!42913 ((_ is ValueCellFull!12989) mapValue!42913)) b!1105098))

(assert (= (and b!1105110 ((_ is ValueCellFull!12989) mapDefault!42913)) b!1105099))

(assert (= start!97160 b!1105110))

(declare-fun m!1024083 () Bool)

(assert (=> b!1105109 m!1024083))

(declare-fun m!1024085 () Bool)

(assert (=> b!1105102 m!1024085))

(declare-fun m!1024087 () Bool)

(assert (=> b!1105100 m!1024087))

(declare-fun m!1024089 () Bool)

(assert (=> b!1105100 m!1024089))

(declare-fun m!1024091 () Bool)

(assert (=> b!1105105 m!1024091))

(declare-fun m!1024093 () Bool)

(assert (=> start!97160 m!1024093))

(declare-fun m!1024095 () Bool)

(assert (=> start!97160 m!1024095))

(declare-fun m!1024097 () Bool)

(assert (=> b!1105107 m!1024097))

(declare-fun m!1024099 () Bool)

(assert (=> b!1105106 m!1024099))

(declare-fun m!1024101 () Bool)

(assert (=> b!1105103 m!1024101))

(declare-fun m!1024103 () Bool)

(assert (=> b!1105101 m!1024103))

(declare-fun m!1024105 () Bool)

(assert (=> b!1105101 m!1024105))

(declare-fun m!1024107 () Bool)

(assert (=> mapNonEmpty!42913 m!1024107))

(check-sat (not b!1105102) (not b!1105107) tp_is_empty!27397 (not mapNonEmpty!42913) (not b!1105100) (not b!1105109) (not b!1105106) (not start!97160) (not b!1105105) (not b!1105101))
(check-sat)
