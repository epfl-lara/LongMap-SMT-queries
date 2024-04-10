; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97706 () Bool)

(assert start!97706)

(declare-fun b!1117005 () Bool)

(declare-fun res!745875 () Bool)

(declare-fun e!636354 () Bool)

(assert (=> b!1117005 (=> (not res!745875) (not e!636354))))

(declare-datatypes ((array!72771 0))(
  ( (array!72772 (arr!35038 (Array (_ BitVec 32) (_ BitVec 64))) (size!35574 (_ BitVec 32))) )
))
(declare-fun lt!497221 () array!72771)

(declare-datatypes ((List!24380 0))(
  ( (Nil!24377) (Cons!24376 (h!25585 (_ BitVec 64)) (t!34861 List!24380)) )
))
(declare-fun arrayNoDuplicates!0 (array!72771 (_ BitVec 32) List!24380) Bool)

(assert (=> b!1117005 (= res!745875 (arrayNoDuplicates!0 lt!497221 #b00000000000000000000000000000000 Nil!24377))))

(declare-fun b!1117006 () Bool)

(declare-fun res!745878 () Bool)

(declare-fun e!636356 () Bool)

(assert (=> b!1117006 (=> (not res!745878) (not e!636356))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun _keys!1208 () array!72771)

(assert (=> b!1117006 (= res!745878 (= (select (arr!35038 _keys!1208) i!673) k!934))))

(declare-fun b!1117007 () Bool)

(declare-fun e!636355 () Bool)

(declare-fun tp_is_empty!27937 () Bool)

(assert (=> b!1117007 (= e!636355 tp_is_empty!27937)))

(declare-fun b!1117008 () Bool)

(declare-fun res!745882 () Bool)

(assert (=> b!1117008 (=> (not res!745882) (not e!636356))))

(assert (=> b!1117008 (= res!745882 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35574 _keys!1208))))))

(declare-fun b!1117009 () Bool)

(assert (=> b!1117009 (= e!636356 e!636354)))

(declare-fun res!745880 () Bool)

(assert (=> b!1117009 (=> (not res!745880) (not e!636354))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72771 (_ BitVec 32)) Bool)

(assert (=> b!1117009 (= res!745880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497221 mask!1564))))

(assert (=> b!1117009 (= lt!497221 (array!72772 (store (arr!35038 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35574 _keys!1208)))))

(declare-fun mapIsEmpty!43723 () Bool)

(declare-fun mapRes!43723 () Bool)

(assert (=> mapIsEmpty!43723 mapRes!43723))

(declare-fun b!1117010 () Bool)

(declare-fun e!636352 () Bool)

(assert (=> b!1117010 (= e!636352 tp_is_empty!27937)))

(declare-fun b!1117011 () Bool)

(declare-fun res!745881 () Bool)

(assert (=> b!1117011 (=> (not res!745881) (not e!636356))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42377 0))(
  ( (V!42378 (val!14025 Int)) )
))
(declare-datatypes ((ValueCell!13259 0))(
  ( (ValueCellFull!13259 (v!16658 V!42377)) (EmptyCell!13259) )
))
(declare-datatypes ((array!72773 0))(
  ( (array!72774 (arr!35039 (Array (_ BitVec 32) ValueCell!13259)) (size!35575 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72773)

(assert (=> b!1117011 (= res!745881 (and (= (size!35575 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35574 _keys!1208) (size!35575 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117012 () Bool)

(declare-fun res!745876 () Bool)

(assert (=> b!1117012 (=> (not res!745876) (not e!636356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117012 (= res!745876 (validMask!0 mask!1564))))

(declare-fun b!1117013 () Bool)

(declare-fun res!745879 () Bool)

(assert (=> b!1117013 (=> (not res!745879) (not e!636356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117013 (= res!745879 (validKeyInArray!0 k!934))))

(declare-fun b!1117014 () Bool)

(declare-fun res!745874 () Bool)

(assert (=> b!1117014 (=> (not res!745874) (not e!636356))))

(assert (=> b!1117014 (= res!745874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117015 () Bool)

(assert (=> b!1117015 (= e!636354 (not true))))

(declare-fun arrayContainsKey!0 (array!72771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117015 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36656 0))(
  ( (Unit!36657) )
))
(declare-fun lt!497222 () Unit!36656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72771 (_ BitVec 64) (_ BitVec 32)) Unit!36656)

(assert (=> b!1117015 (= lt!497222 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117016 () Bool)

(declare-fun e!636353 () Bool)

(assert (=> b!1117016 (= e!636353 (and e!636352 mapRes!43723))))

(declare-fun condMapEmpty!43723 () Bool)

(declare-fun mapDefault!43723 () ValueCell!13259)

