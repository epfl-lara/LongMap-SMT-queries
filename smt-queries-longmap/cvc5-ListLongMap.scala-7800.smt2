; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97544 () Bool)

(assert start!97544)

(declare-fun b!1113846 () Bool)

(declare-fun res!743448 () Bool)

(declare-fun e!634897 () Bool)

(assert (=> b!1113846 (=> (not res!743448) (not e!634897))))

(declare-datatypes ((array!72457 0))(
  ( (array!72458 (arr!34881 (Array (_ BitVec 32) (_ BitVec 64))) (size!35417 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72457)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72457 (_ BitVec 32)) Bool)

(assert (=> b!1113846 (= res!743448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113847 () Bool)

(declare-fun e!634896 () Bool)

(assert (=> b!1113847 (= e!634896 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113847 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36554 0))(
  ( (Unit!36555) )
))
(declare-fun lt!496735 () Unit!36554)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72457 (_ BitVec 64) (_ BitVec 32)) Unit!36554)

(assert (=> b!1113847 (= lt!496735 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113848 () Bool)

(declare-fun res!743444 () Bool)

(assert (=> b!1113848 (=> (not res!743444) (not e!634897))))

(declare-datatypes ((List!24316 0))(
  ( (Nil!24313) (Cons!24312 (h!25521 (_ BitVec 64)) (t!34797 List!24316)) )
))
(declare-fun arrayNoDuplicates!0 (array!72457 (_ BitVec 32) List!24316) Bool)

(assert (=> b!1113848 (= res!743444 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24313))))

(declare-fun b!1113849 () Bool)

(assert (=> b!1113849 (= e!634897 e!634896)))

(declare-fun res!743449 () Bool)

(assert (=> b!1113849 (=> (not res!743449) (not e!634896))))

(declare-fun lt!496736 () array!72457)

(assert (=> b!1113849 (= res!743449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496736 mask!1564))))

(assert (=> b!1113849 (= lt!496736 (array!72458 (store (arr!34881 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35417 _keys!1208)))))

(declare-fun b!1113850 () Bool)

(declare-fun e!634898 () Bool)

(declare-fun tp_is_empty!27775 () Bool)

(assert (=> b!1113850 (= e!634898 tp_is_empty!27775)))

(declare-fun b!1113851 () Bool)

(declare-fun res!743450 () Bool)

(assert (=> b!1113851 (=> (not res!743450) (not e!634897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113851 (= res!743450 (validKeyInArray!0 k!934))))

(declare-fun b!1113853 () Bool)

(declare-fun res!743452 () Bool)

(assert (=> b!1113853 (=> (not res!743452) (not e!634897))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42161 0))(
  ( (V!42162 (val!13944 Int)) )
))
(declare-datatypes ((ValueCell!13178 0))(
  ( (ValueCellFull!13178 (v!16577 V!42161)) (EmptyCell!13178) )
))
(declare-datatypes ((array!72459 0))(
  ( (array!72460 (arr!34882 (Array (_ BitVec 32) ValueCell!13178)) (size!35418 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72459)

(assert (=> b!1113853 (= res!743452 (and (= (size!35418 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35417 _keys!1208) (size!35418 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113854 () Bool)

(declare-fun res!743446 () Bool)

(assert (=> b!1113854 (=> (not res!743446) (not e!634897))))

(assert (=> b!1113854 (= res!743446 (= (select (arr!34881 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43480 () Bool)

(declare-fun mapRes!43480 () Bool)

(assert (=> mapIsEmpty!43480 mapRes!43480))

(declare-fun b!1113855 () Bool)

(declare-fun res!743451 () Bool)

(assert (=> b!1113855 (=> (not res!743451) (not e!634897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113855 (= res!743451 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43480 () Bool)

(declare-fun tp!82724 () Bool)

(declare-fun e!634894 () Bool)

(assert (=> mapNonEmpty!43480 (= mapRes!43480 (and tp!82724 e!634894))))

(declare-fun mapKey!43480 () (_ BitVec 32))

(declare-fun mapValue!43480 () ValueCell!13178)

(declare-fun mapRest!43480 () (Array (_ BitVec 32) ValueCell!13178))

(assert (=> mapNonEmpty!43480 (= (arr!34882 _values!996) (store mapRest!43480 mapKey!43480 mapValue!43480))))

(declare-fun b!1113856 () Bool)

(declare-fun res!743445 () Bool)

(assert (=> b!1113856 (=> (not res!743445) (not e!634897))))

(assert (=> b!1113856 (= res!743445 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35417 _keys!1208))))))

(declare-fun b!1113852 () Bool)

(declare-fun res!743447 () Bool)

(assert (=> b!1113852 (=> (not res!743447) (not e!634896))))

(assert (=> b!1113852 (= res!743447 (arrayNoDuplicates!0 lt!496736 #b00000000000000000000000000000000 Nil!24313))))

(declare-fun res!743443 () Bool)

(assert (=> start!97544 (=> (not res!743443) (not e!634897))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97544 (= res!743443 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35417 _keys!1208))))))

(assert (=> start!97544 e!634897))

(declare-fun array_inv!26814 (array!72457) Bool)

(assert (=> start!97544 (array_inv!26814 _keys!1208)))

(assert (=> start!97544 true))

(declare-fun e!634895 () Bool)

(declare-fun array_inv!26815 (array!72459) Bool)

(assert (=> start!97544 (and (array_inv!26815 _values!996) e!634895)))

(declare-fun b!1113857 () Bool)

(assert (=> b!1113857 (= e!634894 tp_is_empty!27775)))

(declare-fun b!1113858 () Bool)

(assert (=> b!1113858 (= e!634895 (and e!634898 mapRes!43480))))

(declare-fun condMapEmpty!43480 () Bool)

(declare-fun mapDefault!43480 () ValueCell!13178)

