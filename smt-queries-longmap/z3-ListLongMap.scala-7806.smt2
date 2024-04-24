; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97816 () Bool)

(assert start!97816)

(declare-fun b!1115875 () Bool)

(declare-fun res!744505 () Bool)

(declare-fun e!636078 () Bool)

(assert (=> b!1115875 (=> (not res!744505) (not e!636078))))

(declare-datatypes ((array!72563 0))(
  ( (array!72564 (arr!34928 (Array (_ BitVec 32) (_ BitVec 64))) (size!35465 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72563)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42209 0))(
  ( (V!42210 (val!13962 Int)) )
))
(declare-datatypes ((ValueCell!13196 0))(
  ( (ValueCellFull!13196 (v!16591 V!42209)) (EmptyCell!13196) )
))
(declare-datatypes ((array!72565 0))(
  ( (array!72566 (arr!34929 (Array (_ BitVec 32) ValueCell!13196)) (size!35466 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72565)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115875 (= res!744505 (and (= (size!35466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35465 _keys!1208) (size!35466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115876 () Bool)

(declare-fun e!636077 () Bool)

(assert (=> b!1115876 (= e!636078 e!636077)))

(declare-fun res!744513 () Bool)

(assert (=> b!1115876 (=> (not res!744513) (not e!636077))))

(declare-fun lt!497358 () array!72563)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72563 (_ BitVec 32)) Bool)

(assert (=> b!1115876 (= res!744513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497358 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115876 (= lt!497358 (array!72564 (store (arr!34928 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35465 _keys!1208)))))

(declare-fun b!1115877 () Bool)

(declare-fun res!744509 () Bool)

(assert (=> b!1115877 (=> (not res!744509) (not e!636078))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115877 (= res!744509 (= (select (arr!34928 _keys!1208) i!673) k0!934))))

(declare-fun b!1115878 () Bool)

(declare-fun e!636073 () Bool)

(declare-fun e!636075 () Bool)

(declare-fun mapRes!43534 () Bool)

(assert (=> b!1115878 (= e!636073 (and e!636075 mapRes!43534))))

(declare-fun condMapEmpty!43534 () Bool)

(declare-fun mapDefault!43534 () ValueCell!13196)

(assert (=> b!1115878 (= condMapEmpty!43534 (= (arr!34929 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13196)) mapDefault!43534)))))

(declare-fun b!1115879 () Bool)

(declare-fun res!744508 () Bool)

(assert (=> b!1115879 (=> (not res!744508) (not e!636078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115879 (= res!744508 (validKeyInArray!0 k0!934))))

(declare-fun b!1115880 () Bool)

(declare-fun res!744512 () Bool)

(assert (=> b!1115880 (=> (not res!744512) (not e!636078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115880 (= res!744512 (validMask!0 mask!1564))))

(declare-fun b!1115881 () Bool)

(declare-fun res!744507 () Bool)

(assert (=> b!1115881 (=> (not res!744507) (not e!636078))))

(assert (=> b!1115881 (= res!744507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115882 () Bool)

(assert (=> b!1115882 (= e!636077 (not true))))

(declare-fun arrayContainsKey!0 (array!72563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115882 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36549 0))(
  ( (Unit!36550) )
))
(declare-fun lt!497359 () Unit!36549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72563 (_ BitVec 64) (_ BitVec 32)) Unit!36549)

(assert (=> b!1115882 (= lt!497359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115883 () Bool)

(declare-fun res!744506 () Bool)

(assert (=> b!1115883 (=> (not res!744506) (not e!636078))))

(assert (=> b!1115883 (= res!744506 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35465 _keys!1208))))))

(declare-fun mapNonEmpty!43534 () Bool)

(declare-fun tp!82778 () Bool)

(declare-fun e!636074 () Bool)

(assert (=> mapNonEmpty!43534 (= mapRes!43534 (and tp!82778 e!636074))))

(declare-fun mapValue!43534 () ValueCell!13196)

(declare-fun mapRest!43534 () (Array (_ BitVec 32) ValueCell!13196))

(declare-fun mapKey!43534 () (_ BitVec 32))

(assert (=> mapNonEmpty!43534 (= (arr!34929 _values!996) (store mapRest!43534 mapKey!43534 mapValue!43534))))

(declare-fun b!1115884 () Bool)

(declare-fun tp_is_empty!27811 () Bool)

(assert (=> b!1115884 (= e!636074 tp_is_empty!27811)))

(declare-fun b!1115885 () Bool)

(declare-fun res!744514 () Bool)

(assert (=> b!1115885 (=> (not res!744514) (not e!636078))))

(declare-datatypes ((List!24348 0))(
  ( (Nil!24345) (Cons!24344 (h!25562 (_ BitVec 64)) (t!34821 List!24348)) )
))
(declare-fun arrayNoDuplicates!0 (array!72563 (_ BitVec 32) List!24348) Bool)

(assert (=> b!1115885 (= res!744514 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24345))))

(declare-fun b!1115886 () Bool)

(declare-fun res!744510 () Bool)

(assert (=> b!1115886 (=> (not res!744510) (not e!636077))))

(assert (=> b!1115886 (= res!744510 (arrayNoDuplicates!0 lt!497358 #b00000000000000000000000000000000 Nil!24345))))

(declare-fun b!1115887 () Bool)

(assert (=> b!1115887 (= e!636075 tp_is_empty!27811)))

(declare-fun res!744511 () Bool)

(assert (=> start!97816 (=> (not res!744511) (not e!636078))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97816 (= res!744511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35465 _keys!1208))))))

(assert (=> start!97816 e!636078))

(declare-fun array_inv!26914 (array!72563) Bool)

(assert (=> start!97816 (array_inv!26914 _keys!1208)))

(assert (=> start!97816 true))

(declare-fun array_inv!26915 (array!72565) Bool)

(assert (=> start!97816 (and (array_inv!26915 _values!996) e!636073)))

(declare-fun mapIsEmpty!43534 () Bool)

(assert (=> mapIsEmpty!43534 mapRes!43534))

(assert (= (and start!97816 res!744511) b!1115880))

(assert (= (and b!1115880 res!744512) b!1115875))

(assert (= (and b!1115875 res!744505) b!1115881))

(assert (= (and b!1115881 res!744507) b!1115885))

(assert (= (and b!1115885 res!744514) b!1115883))

(assert (= (and b!1115883 res!744506) b!1115879))

(assert (= (and b!1115879 res!744508) b!1115877))

(assert (= (and b!1115877 res!744509) b!1115876))

(assert (= (and b!1115876 res!744513) b!1115886))

(assert (= (and b!1115886 res!744510) b!1115882))

(assert (= (and b!1115878 condMapEmpty!43534) mapIsEmpty!43534))

(assert (= (and b!1115878 (not condMapEmpty!43534)) mapNonEmpty!43534))

(get-info :version)

(assert (= (and mapNonEmpty!43534 ((_ is ValueCellFull!13196) mapValue!43534)) b!1115884))

(assert (= (and b!1115878 ((_ is ValueCellFull!13196) mapDefault!43534)) b!1115887))

(assert (= start!97816 b!1115878))

(declare-fun m!1033059 () Bool)

(assert (=> b!1115876 m!1033059))

(declare-fun m!1033061 () Bool)

(assert (=> b!1115876 m!1033061))

(declare-fun m!1033063 () Bool)

(assert (=> start!97816 m!1033063))

(declare-fun m!1033065 () Bool)

(assert (=> start!97816 m!1033065))

(declare-fun m!1033067 () Bool)

(assert (=> b!1115881 m!1033067))

(declare-fun m!1033069 () Bool)

(assert (=> b!1115885 m!1033069))

(declare-fun m!1033071 () Bool)

(assert (=> b!1115879 m!1033071))

(declare-fun m!1033073 () Bool)

(assert (=> b!1115880 m!1033073))

(declare-fun m!1033075 () Bool)

(assert (=> b!1115877 m!1033075))

(declare-fun m!1033077 () Bool)

(assert (=> b!1115882 m!1033077))

(declare-fun m!1033079 () Bool)

(assert (=> b!1115882 m!1033079))

(declare-fun m!1033081 () Bool)

(assert (=> mapNonEmpty!43534 m!1033081))

(declare-fun m!1033083 () Bool)

(assert (=> b!1115886 m!1033083))

(check-sat (not b!1115876) (not b!1115881) (not b!1115885) tp_is_empty!27811 (not start!97816) (not b!1115880) (not b!1115882) (not b!1115879) (not mapNonEmpty!43534) (not b!1115886))
(check-sat)
