; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97230 () Bool)

(assert start!97230)

(declare-fun res!738417 () Bool)

(declare-fun e!631407 () Bool)

(assert (=> start!97230 (=> (not res!738417) (not e!631407))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71839 0))(
  ( (array!71840 (arr!34572 (Array (_ BitVec 32) (_ BitVec 64))) (size!35108 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71839)

(assert (=> start!97230 (= res!738417 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35108 _keys!1208))))))

(assert (=> start!97230 e!631407))

(declare-fun array_inv!26608 (array!71839) Bool)

(assert (=> start!97230 (array_inv!26608 _keys!1208)))

(assert (=> start!97230 true))

(declare-datatypes ((V!41741 0))(
  ( (V!41742 (val!13787 Int)) )
))
(declare-datatypes ((ValueCell!13021 0))(
  ( (ValueCellFull!13021 (v!16420 V!41741)) (EmptyCell!13021) )
))
(declare-datatypes ((array!71841 0))(
  ( (array!71842 (arr!34573 (Array (_ BitVec 32) ValueCell!13021)) (size!35109 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71841)

(declare-fun e!631406 () Bool)

(declare-fun array_inv!26609 (array!71841) Bool)

(assert (=> start!97230 (and (array_inv!26609 _values!996) e!631406)))

(declare-fun b!1106499 () Bool)

(declare-fun res!738415 () Bool)

(assert (=> b!1106499 (=> (not res!738415) (not e!631407))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106499 (= res!738415 (validKeyInArray!0 k!934))))

(declare-fun b!1106500 () Bool)

(declare-fun res!738410 () Bool)

(assert (=> b!1106500 (=> (not res!738410) (not e!631407))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1106500 (= res!738410 (and (= (size!35109 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35108 _keys!1208) (size!35109 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106501 () Bool)

(declare-fun e!631404 () Bool)

(declare-fun tp_is_empty!27461 () Bool)

(assert (=> b!1106501 (= e!631404 tp_is_empty!27461)))

(declare-fun b!1106502 () Bool)

(declare-fun res!738416 () Bool)

(assert (=> b!1106502 (=> (not res!738416) (not e!631407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106502 (= res!738416 (validMask!0 mask!1564))))

(declare-fun b!1106503 () Bool)

(declare-fun e!631403 () Bool)

(assert (=> b!1106503 (= e!631407 e!631403)))

(declare-fun res!738418 () Bool)

(assert (=> b!1106503 (=> (not res!738418) (not e!631403))))

(declare-fun lt!495469 () array!71839)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71839 (_ BitVec 32)) Bool)

(assert (=> b!1106503 (= res!738418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495469 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106503 (= lt!495469 (array!71840 (store (arr!34572 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35108 _keys!1208)))))

(declare-fun b!1106504 () Bool)

(assert (=> b!1106504 (= e!631403 (not true))))

(declare-fun arrayContainsKey!0 (array!71839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106504 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36310 0))(
  ( (Unit!36311) )
))
(declare-fun lt!495470 () Unit!36310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71839 (_ BitVec 64) (_ BitVec 32)) Unit!36310)

(assert (=> b!1106504 (= lt!495470 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106505 () Bool)

(declare-fun mapRes!43009 () Bool)

(assert (=> b!1106505 (= e!631406 (and e!631404 mapRes!43009))))

(declare-fun condMapEmpty!43009 () Bool)

(declare-fun mapDefault!43009 () ValueCell!13021)

