; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97620 () Bool)

(assert start!97620)

(declare-fun mapNonEmpty!43594 () Bool)

(declare-fun mapRes!43594 () Bool)

(declare-fun tp!82838 () Bool)

(declare-fun e!635580 () Bool)

(assert (=> mapNonEmpty!43594 (= mapRes!43594 (and tp!82838 e!635580))))

(declare-datatypes ((V!42261 0))(
  ( (V!42262 (val!13982 Int)) )
))
(declare-datatypes ((ValueCell!13216 0))(
  ( (ValueCellFull!13216 (v!16615 V!42261)) (EmptyCell!13216) )
))
(declare-fun mapValue!43594 () ValueCell!13216)

(declare-fun mapKey!43594 () (_ BitVec 32))

(declare-fun mapRest!43594 () (Array (_ BitVec 32) ValueCell!13216))

(declare-datatypes ((array!72603 0))(
  ( (array!72604 (arr!34954 (Array (_ BitVec 32) ValueCell!13216)) (size!35490 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72603)

(assert (=> mapNonEmpty!43594 (= (arr!34954 _values!996) (store mapRest!43594 mapKey!43594 mapValue!43594))))

(declare-fun b!1115328 () Bool)

(declare-fun res!744583 () Bool)

(declare-fun e!635579 () Bool)

(assert (=> b!1115328 (=> (not res!744583) (not e!635579))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115328 (= res!744583 (validMask!0 mask!1564))))

(declare-fun b!1115329 () Bool)

(declare-fun res!744584 () Bool)

(assert (=> b!1115329 (=> (not res!744584) (not e!635579))))

(declare-datatypes ((array!72605 0))(
  ( (array!72606 (arr!34955 (Array (_ BitVec 32) (_ BitVec 64))) (size!35491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72605)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1115329 (= res!744584 (= (select (arr!34955 _keys!1208) i!673) k!934))))

(declare-fun b!1115330 () Bool)

(declare-fun res!744588 () Bool)

(assert (=> b!1115330 (=> (not res!744588) (not e!635579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72605 (_ BitVec 32)) Bool)

(assert (=> b!1115330 (= res!744588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115331 () Bool)

(declare-fun tp_is_empty!27851 () Bool)

(assert (=> b!1115331 (= e!635580 tp_is_empty!27851)))

(declare-fun mapIsEmpty!43594 () Bool)

(assert (=> mapIsEmpty!43594 mapRes!43594))

(declare-fun b!1115332 () Bool)

(declare-fun e!635583 () Bool)

(assert (=> b!1115332 (= e!635579 e!635583)))

(declare-fun res!744591 () Bool)

(assert (=> b!1115332 (=> (not res!744591) (not e!635583))))

(declare-fun lt!496963 () array!72605)

(assert (=> b!1115332 (= res!744591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496963 mask!1564))))

(assert (=> b!1115332 (= lt!496963 (array!72606 (store (arr!34955 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35491 _keys!1208)))))

(declare-fun b!1115333 () Bool)

(declare-fun e!635578 () Bool)

(assert (=> b!1115333 (= e!635578 tp_is_empty!27851)))

(declare-fun b!1115334 () Bool)

(declare-fun res!744587 () Bool)

(assert (=> b!1115334 (=> (not res!744587) (not e!635579))))

(assert (=> b!1115334 (= res!744587 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35491 _keys!1208))))))

(declare-fun b!1115335 () Bool)

(declare-fun res!744586 () Bool)

(assert (=> b!1115335 (=> (not res!744586) (not e!635579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115335 (= res!744586 (validKeyInArray!0 k!934))))

(declare-fun b!1115336 () Bool)

(declare-fun res!744585 () Bool)

(assert (=> b!1115336 (=> (not res!744585) (not e!635579))))

(declare-datatypes ((List!24345 0))(
  ( (Nil!24342) (Cons!24341 (h!25550 (_ BitVec 64)) (t!34826 List!24345)) )
))
(declare-fun arrayNoDuplicates!0 (array!72605 (_ BitVec 32) List!24345) Bool)

(assert (=> b!1115336 (= res!744585 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24342))))

(declare-fun b!1115337 () Bool)

(assert (=> b!1115337 (= e!635583 (not true))))

(declare-fun arrayContainsKey!0 (array!72605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115337 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36608 0))(
  ( (Unit!36609) )
))
(declare-fun lt!496964 () Unit!36608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72605 (_ BitVec 64) (_ BitVec 32)) Unit!36608)

(assert (=> b!1115337 (= lt!496964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1115338 () Bool)

(declare-fun res!744592 () Bool)

(assert (=> b!1115338 (=> (not res!744592) (not e!635579))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115338 (= res!744592 (and (= (size!35490 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35491 _keys!1208) (size!35490 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115339 () Bool)

(declare-fun res!744589 () Bool)

(assert (=> b!1115339 (=> (not res!744589) (not e!635583))))

(assert (=> b!1115339 (= res!744589 (arrayNoDuplicates!0 lt!496963 #b00000000000000000000000000000000 Nil!24342))))

(declare-fun b!1115340 () Bool)

(declare-fun e!635582 () Bool)

(assert (=> b!1115340 (= e!635582 (and e!635578 mapRes!43594))))

(declare-fun condMapEmpty!43594 () Bool)

(declare-fun mapDefault!43594 () ValueCell!13216)

