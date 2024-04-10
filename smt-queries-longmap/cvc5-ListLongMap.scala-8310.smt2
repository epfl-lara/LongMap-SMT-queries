; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101208 () Bool)

(assert start!101208)

(declare-fun b_free!26131 () Bool)

(declare-fun b_next!26131 () Bool)

(assert (=> start!101208 (= b_free!26131 (not b_next!26131))))

(declare-fun tp!91414 () Bool)

(declare-fun b_and!43379 () Bool)

(assert (=> start!101208 (= tp!91414 b_and!43379)))

(declare-fun b!1215156 () Bool)

(declare-fun res!806792 () Bool)

(declare-fun e!690009 () Bool)

(assert (=> b!1215156 (=> (not res!806792) (not e!690009))))

(declare-datatypes ((array!78449 0))(
  ( (array!78450 (arr!37859 (Array (_ BitVec 32) (_ BitVec 64))) (size!38395 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78449)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1215156 (= res!806792 (= (select (arr!37859 _keys!1208) i!673) k!934))))

(declare-fun b!1215157 () Bool)

(declare-fun e!690008 () Bool)

(assert (=> b!1215157 (= e!690009 e!690008)))

(declare-fun res!806796 () Bool)

(assert (=> b!1215157 (=> (not res!806796) (not e!690008))))

(declare-fun lt!552538 () array!78449)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78449 (_ BitVec 32)) Bool)

(assert (=> b!1215157 (= res!806796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552538 mask!1564))))

(assert (=> b!1215157 (= lt!552538 (array!78450 (store (arr!37859 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38395 _keys!1208)))))

(declare-fun b!1215158 () Bool)

(declare-fun e!690007 () Bool)

(assert (=> b!1215158 (= e!690008 (not e!690007))))

(declare-fun res!806794 () Bool)

(assert (=> b!1215158 (=> res!806794 e!690007)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1215158 (= res!806794 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215158 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40292 0))(
  ( (Unit!40293) )
))
(declare-fun lt!552539 () Unit!40292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78449 (_ BitVec 64) (_ BitVec 32)) Unit!40292)

(assert (=> b!1215158 (= lt!552539 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215159 () Bool)

(declare-fun res!806795 () Bool)

(assert (=> b!1215159 (=> (not res!806795) (not e!690009))))

(assert (=> b!1215159 (= res!806795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38395 _keys!1208))))))

(declare-fun b!1215160 () Bool)

(declare-fun res!806800 () Bool)

(assert (=> b!1215160 (=> (not res!806800) (not e!690009))))

(declare-datatypes ((List!26690 0))(
  ( (Nil!26687) (Cons!26686 (h!27895 (_ BitVec 64)) (t!39801 List!26690)) )
))
(declare-fun arrayNoDuplicates!0 (array!78449 (_ BitVec 32) List!26690) Bool)

(assert (=> b!1215160 (= res!806800 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26687))))

(declare-fun b!1215161 () Bool)

(declare-fun res!806798 () Bool)

(assert (=> b!1215161 (=> (not res!806798) (not e!690009))))

(assert (=> b!1215161 (= res!806798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48127 () Bool)

(declare-fun mapRes!48127 () Bool)

(assert (=> mapIsEmpty!48127 mapRes!48127))

(declare-fun b!1215162 () Bool)

(declare-fun res!806799 () Bool)

(assert (=> b!1215162 (=> (not res!806799) (not e!690009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215162 (= res!806799 (validMask!0 mask!1564))))

(declare-fun b!1215163 () Bool)

(declare-fun res!806791 () Bool)

(assert (=> b!1215163 (=> (not res!806791) (not e!690008))))

(assert (=> b!1215163 (= res!806791 (arrayNoDuplicates!0 lt!552538 #b00000000000000000000000000000000 Nil!26687))))

(declare-fun b!1215164 () Bool)

(declare-fun res!806797 () Bool)

(assert (=> b!1215164 (=> (not res!806797) (not e!690009))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46241 0))(
  ( (V!46242 (val!15474 Int)) )
))
(declare-datatypes ((ValueCell!14708 0))(
  ( (ValueCellFull!14708 (v!18127 V!46241)) (EmptyCell!14708) )
))
(declare-datatypes ((array!78451 0))(
  ( (array!78452 (arr!37860 (Array (_ BitVec 32) ValueCell!14708)) (size!38396 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78451)

(assert (=> b!1215164 (= res!806797 (and (= (size!38396 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38395 _keys!1208) (size!38396 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!806793 () Bool)

(assert (=> start!101208 (=> (not res!806793) (not e!690009))))

(assert (=> start!101208 (= res!806793 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38395 _keys!1208))))))

(assert (=> start!101208 e!690009))

(declare-fun tp_is_empty!30835 () Bool)

(assert (=> start!101208 tp_is_empty!30835))

(declare-fun array_inv!28828 (array!78449) Bool)

(assert (=> start!101208 (array_inv!28828 _keys!1208)))

(assert (=> start!101208 true))

(assert (=> start!101208 tp!91414))

(declare-fun e!690013 () Bool)

(declare-fun array_inv!28829 (array!78451) Bool)

(assert (=> start!101208 (and (array_inv!28829 _values!996) e!690013)))

(declare-fun b!1215165 () Bool)

(declare-fun e!690011 () Bool)

(assert (=> b!1215165 (= e!690013 (and e!690011 mapRes!48127))))

(declare-fun condMapEmpty!48127 () Bool)

(declare-fun mapDefault!48127 () ValueCell!14708)

