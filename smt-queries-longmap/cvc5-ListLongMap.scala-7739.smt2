; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97178 () Bool)

(assert start!97178)

(declare-fun b!1105485 () Bool)

(declare-fun res!737633 () Bool)

(declare-fun e!630939 () Bool)

(assert (=> b!1105485 (=> (not res!737633) (not e!630939))))

(declare-datatypes ((array!71739 0))(
  ( (array!71740 (arr!34522 (Array (_ BitVec 32) (_ BitVec 64))) (size!35058 (_ BitVec 32))) )
))
(declare-fun lt!495313 () array!71739)

(declare-datatypes ((List!24075 0))(
  ( (Nil!24072) (Cons!24071 (h!25280 (_ BitVec 64)) (t!34340 List!24075)) )
))
(declare-fun arrayNoDuplicates!0 (array!71739 (_ BitVec 32) List!24075) Bool)

(assert (=> b!1105485 (= res!737633 (arrayNoDuplicates!0 lt!495313 #b00000000000000000000000000000000 Nil!24072))))

(declare-fun mapIsEmpty!42931 () Bool)

(declare-fun mapRes!42931 () Bool)

(assert (=> mapIsEmpty!42931 mapRes!42931))

(declare-fun b!1105486 () Bool)

(declare-fun res!737629 () Bool)

(declare-fun e!630935 () Bool)

(assert (=> b!1105486 (=> (not res!737629) (not e!630935))))

(declare-fun _keys!1208 () array!71739)

(assert (=> b!1105486 (= res!737629 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24072))))

(declare-fun b!1105487 () Bool)

(declare-fun res!737638 () Bool)

(assert (=> b!1105487 (=> (not res!737638) (not e!630935))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105487 (= res!737638 (validMask!0 mask!1564))))

(declare-fun b!1105488 () Bool)

(declare-fun res!737631 () Bool)

(assert (=> b!1105488 (=> (not res!737631) (not e!630935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71739 (_ BitVec 32)) Bool)

(assert (=> b!1105488 (= res!737631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105489 () Bool)

(declare-fun res!737635 () Bool)

(assert (=> b!1105489 (=> (not res!737635) (not e!630935))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41673 0))(
  ( (V!41674 (val!13761 Int)) )
))
(declare-datatypes ((ValueCell!12995 0))(
  ( (ValueCellFull!12995 (v!16394 V!41673)) (EmptyCell!12995) )
))
(declare-datatypes ((array!71741 0))(
  ( (array!71742 (arr!34523 (Array (_ BitVec 32) ValueCell!12995)) (size!35059 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71741)

(assert (=> b!1105489 (= res!737635 (and (= (size!35059 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35058 _keys!1208) (size!35059 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105490 () Bool)

(declare-fun e!630938 () Bool)

(declare-fun tp_is_empty!27409 () Bool)

(assert (=> b!1105490 (= e!630938 tp_is_empty!27409)))

(declare-fun b!1105491 () Bool)

(declare-fun e!630934 () Bool)

(assert (=> b!1105491 (= e!630934 tp_is_empty!27409)))

(declare-fun mapNonEmpty!42931 () Bool)

(declare-fun tp!81851 () Bool)

(assert (=> mapNonEmpty!42931 (= mapRes!42931 (and tp!81851 e!630934))))

(declare-fun mapValue!42931 () ValueCell!12995)

(declare-fun mapRest!42931 () (Array (_ BitVec 32) ValueCell!12995))

(declare-fun mapKey!42931 () (_ BitVec 32))

(assert (=> mapNonEmpty!42931 (= (arr!34523 _values!996) (store mapRest!42931 mapKey!42931 mapValue!42931))))

(declare-fun b!1105492 () Bool)

(assert (=> b!1105492 (= e!630939 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105492 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36274 0))(
  ( (Unit!36275) )
))
(declare-fun lt!495314 () Unit!36274)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71739 (_ BitVec 64) (_ BitVec 32)) Unit!36274)

(assert (=> b!1105492 (= lt!495314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105493 () Bool)

(declare-fun e!630937 () Bool)

(assert (=> b!1105493 (= e!630937 (and e!630938 mapRes!42931))))

(declare-fun condMapEmpty!42931 () Bool)

(declare-fun mapDefault!42931 () ValueCell!12995)

