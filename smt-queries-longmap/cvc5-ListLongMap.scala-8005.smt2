; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98870 () Bool)

(assert start!98870)

(declare-fun b_free!24475 () Bool)

(declare-fun b_next!24475 () Bool)

(assert (=> start!98870 (= b_free!24475 (not b_next!24475))))

(declare-fun tp!86135 () Bool)

(declare-fun b_and!39799 () Bool)

(assert (=> start!98870 (= tp!86135 b_and!39799)))

(declare-fun b!1156862 () Bool)

(declare-fun e!657912 () Bool)

(declare-fun e!657907 () Bool)

(assert (=> b!1156862 (= e!657912 e!657907)))

(declare-fun res!768362 () Bool)

(assert (=> b!1156862 (=> res!768362 e!657907)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74855 0))(
  ( (array!74856 (arr!36078 (Array (_ BitVec 32) (_ BitVec 64))) (size!36614 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74855)

(assert (=> b!1156862 (= res!768362 (not (= (select (arr!36078 _keys!1208) from!1455) k!934)))))

(declare-fun e!657901 () Bool)

(assert (=> b!1156862 e!657901))

(declare-fun c!115134 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156862 (= c!115134 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43801 0))(
  ( (V!43802 (val!14559 Int)) )
))
(declare-fun zeroValue!944 () V!43801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!38108 0))(
  ( (Unit!38109) )
))
(declare-fun lt!519425 () Unit!38108)

(declare-datatypes ((ValueCell!13793 0))(
  ( (ValueCellFull!13793 (v!17196 V!43801)) (EmptyCell!13793) )
))
(declare-datatypes ((array!74857 0))(
  ( (array!74858 (arr!36079 (Array (_ BitVec 32) ValueCell!13793)) (size!36615 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74857)

(declare-fun minValue!944 () V!43801)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!609 (array!74855 array!74857 (_ BitVec 32) (_ BitVec 32) V!43801 V!43801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38108)

(assert (=> b!1156862 (= lt!519425 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!657904 () Bool)

(declare-fun b!1156863 () Bool)

(declare-fun arrayContainsKey!0 (array!74855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156863 (= e!657904 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156864 () Bool)

(declare-fun res!768366 () Bool)

(declare-fun e!657897 () Bool)

(assert (=> b!1156864 (=> (not res!768366) (not e!657897))))

(declare-fun lt!519412 () array!74855)

(declare-datatypes ((List!25264 0))(
  ( (Nil!25261) (Cons!25260 (h!26469 (_ BitVec 64)) (t!36731 List!25264)) )
))
(declare-fun arrayNoDuplicates!0 (array!74855 (_ BitVec 32) List!25264) Bool)

(assert (=> b!1156864 (= res!768366 (arrayNoDuplicates!0 lt!519412 #b00000000000000000000000000000000 Nil!25261))))

(declare-fun mapIsEmpty!45332 () Bool)

(declare-fun mapRes!45332 () Bool)

(assert (=> mapIsEmpty!45332 mapRes!45332))

(declare-fun res!768358 () Bool)

(declare-fun e!657903 () Bool)

(assert (=> start!98870 (=> (not res!768358) (not e!657903))))

(assert (=> start!98870 (= res!768358 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36614 _keys!1208))))))

(assert (=> start!98870 e!657903))

(declare-fun tp_is_empty!29005 () Bool)

(assert (=> start!98870 tp_is_empty!29005))

(declare-fun array_inv!27612 (array!74855) Bool)

(assert (=> start!98870 (array_inv!27612 _keys!1208)))

(assert (=> start!98870 true))

(assert (=> start!98870 tp!86135))

(declare-fun e!657911 () Bool)

(declare-fun array_inv!27613 (array!74857) Bool)

(assert (=> start!98870 (and (array_inv!27613 _values!996) e!657911)))

(declare-fun b!1156865 () Bool)

(declare-fun e!657898 () Bool)

(assert (=> b!1156865 (= e!657897 (not e!657898))))

(declare-fun res!768360 () Bool)

(assert (=> b!1156865 (=> res!768360 e!657898)))

(assert (=> b!1156865 (= res!768360 (bvsgt from!1455 i!673))))

(assert (=> b!1156865 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!519408 () Unit!38108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74855 (_ BitVec 64) (_ BitVec 32)) Unit!38108)

(assert (=> b!1156865 (= lt!519408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1156866 () Bool)

(declare-fun res!768368 () Bool)

(assert (=> b!1156866 (=> (not res!768368) (not e!657903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74855 (_ BitVec 32)) Bool)

(assert (=> b!1156866 (= res!768368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156867 () Bool)

(declare-fun e!657908 () Unit!38108)

(declare-fun Unit!38110 () Unit!38108)

(assert (=> b!1156867 (= e!657908 Unit!38110)))

(declare-fun b!1156868 () Bool)

(declare-fun e!657896 () Unit!38108)

(declare-fun Unit!38111 () Unit!38108)

(assert (=> b!1156868 (= e!657896 Unit!38111)))

(declare-fun b!1156869 () Bool)

(declare-fun e!657910 () Bool)

(assert (=> b!1156869 (= e!657911 (and e!657910 mapRes!45332))))

(declare-fun condMapEmpty!45332 () Bool)

(declare-fun mapDefault!45332 () ValueCell!13793)

