; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97544 () Bool)

(assert start!97544)

(declare-fun res!743468 () Bool)

(declare-fun e!634871 () Bool)

(assert (=> start!97544 (=> (not res!743468) (not e!634871))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72368 0))(
  ( (array!72369 (arr!34837 (Array (_ BitVec 32) (_ BitVec 64))) (size!35375 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72368)

(assert (=> start!97544 (= res!743468 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35375 _keys!1208))))))

(assert (=> start!97544 e!634871))

(declare-fun array_inv!26858 (array!72368) Bool)

(assert (=> start!97544 (array_inv!26858 _keys!1208)))

(assert (=> start!97544 true))

(declare-datatypes ((V!42169 0))(
  ( (V!42170 (val!13947 Int)) )
))
(declare-datatypes ((ValueCell!13181 0))(
  ( (ValueCellFull!13181 (v!16579 V!42169)) (EmptyCell!13181) )
))
(declare-datatypes ((array!72370 0))(
  ( (array!72371 (arr!34838 (Array (_ BitVec 32) ValueCell!13181)) (size!35376 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72370)

(declare-fun e!634872 () Bool)

(declare-fun array_inv!26859 (array!72370) Bool)

(assert (=> start!97544 (and (array_inv!26859 _values!996) e!634872)))

(declare-fun b!1113834 () Bool)

(declare-fun res!743469 () Bool)

(assert (=> b!1113834 (=> (not res!743469) (not e!634871))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113834 (= res!743469 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35375 _keys!1208))))))

(declare-fun b!1113835 () Bool)

(declare-fun res!743464 () Bool)

(assert (=> b!1113835 (=> (not res!743464) (not e!634871))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113835 (= res!743464 (= (select (arr!34837 _keys!1208) i!673) k0!934))))

(declare-fun b!1113836 () Bool)

(declare-fun e!634868 () Bool)

(assert (=> b!1113836 (= e!634868 (not true))))

(declare-fun arrayContainsKey!0 (array!72368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113836 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36377 0))(
  ( (Unit!36378) )
))
(declare-fun lt!496553 () Unit!36377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72368 (_ BitVec 64) (_ BitVec 32)) Unit!36377)

(assert (=> b!1113836 (= lt!496553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113837 () Bool)

(declare-fun e!634870 () Bool)

(declare-fun tp_is_empty!27781 () Bool)

(assert (=> b!1113837 (= e!634870 tp_is_empty!27781)))

(declare-fun b!1113838 () Bool)

(declare-fun e!634867 () Bool)

(assert (=> b!1113838 (= e!634867 tp_is_empty!27781)))

(declare-fun b!1113839 () Bool)

(declare-fun res!743470 () Bool)

(assert (=> b!1113839 (=> (not res!743470) (not e!634871))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113839 (= res!743470 (validMask!0 mask!1564))))

(declare-fun b!1113840 () Bool)

(declare-fun res!743466 () Bool)

(assert (=> b!1113840 (=> (not res!743466) (not e!634871))))

(declare-datatypes ((List!24353 0))(
  ( (Nil!24350) (Cons!24349 (h!25558 (_ BitVec 64)) (t!34825 List!24353)) )
))
(declare-fun arrayNoDuplicates!0 (array!72368 (_ BitVec 32) List!24353) Bool)

(assert (=> b!1113840 (= res!743466 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24350))))

(declare-fun b!1113841 () Bool)

(declare-fun res!743467 () Bool)

(assert (=> b!1113841 (=> (not res!743467) (not e!634871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113841 (= res!743467 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43489 () Bool)

(declare-fun mapRes!43489 () Bool)

(assert (=> mapIsEmpty!43489 mapRes!43489))

(declare-fun b!1113842 () Bool)

(assert (=> b!1113842 (= e!634871 e!634868)))

(declare-fun res!743473 () Bool)

(assert (=> b!1113842 (=> (not res!743473) (not e!634868))))

(declare-fun lt!496554 () array!72368)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72368 (_ BitVec 32)) Bool)

(assert (=> b!1113842 (= res!743473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496554 mask!1564))))

(assert (=> b!1113842 (= lt!496554 (array!72369 (store (arr!34837 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35375 _keys!1208)))))

(declare-fun b!1113843 () Bool)

(declare-fun res!743465 () Bool)

(assert (=> b!1113843 (=> (not res!743465) (not e!634871))))

(assert (=> b!1113843 (= res!743465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113844 () Bool)

(assert (=> b!1113844 (= e!634872 (and e!634867 mapRes!43489))))

(declare-fun condMapEmpty!43489 () Bool)

(declare-fun mapDefault!43489 () ValueCell!13181)

(assert (=> b!1113844 (= condMapEmpty!43489 (= (arr!34838 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13181)) mapDefault!43489)))))

(declare-fun mapNonEmpty!43489 () Bool)

(declare-fun tp!82733 () Bool)

(assert (=> mapNonEmpty!43489 (= mapRes!43489 (and tp!82733 e!634870))))

(declare-fun mapKey!43489 () (_ BitVec 32))

(declare-fun mapRest!43489 () (Array (_ BitVec 32) ValueCell!13181))

(declare-fun mapValue!43489 () ValueCell!13181)

(assert (=> mapNonEmpty!43489 (= (arr!34838 _values!996) (store mapRest!43489 mapKey!43489 mapValue!43489))))

(declare-fun b!1113845 () Bool)

(declare-fun res!743471 () Bool)

(assert (=> b!1113845 (=> (not res!743471) (not e!634871))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113845 (= res!743471 (and (= (size!35376 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35375 _keys!1208) (size!35376 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113846 () Bool)

(declare-fun res!743472 () Bool)

(assert (=> b!1113846 (=> (not res!743472) (not e!634868))))

(assert (=> b!1113846 (= res!743472 (arrayNoDuplicates!0 lt!496554 #b00000000000000000000000000000000 Nil!24350))))

(assert (= (and start!97544 res!743468) b!1113839))

(assert (= (and b!1113839 res!743470) b!1113845))

(assert (= (and b!1113845 res!743471) b!1113843))

(assert (= (and b!1113843 res!743465) b!1113840))

(assert (= (and b!1113840 res!743466) b!1113834))

(assert (= (and b!1113834 res!743469) b!1113841))

(assert (= (and b!1113841 res!743467) b!1113835))

(assert (= (and b!1113835 res!743464) b!1113842))

(assert (= (and b!1113842 res!743473) b!1113846))

(assert (= (and b!1113846 res!743472) b!1113836))

(assert (= (and b!1113844 condMapEmpty!43489) mapIsEmpty!43489))

(assert (= (and b!1113844 (not condMapEmpty!43489)) mapNonEmpty!43489))

(get-info :version)

(assert (= (and mapNonEmpty!43489 ((_ is ValueCellFull!13181) mapValue!43489)) b!1113837))

(assert (= (and b!1113844 ((_ is ValueCellFull!13181) mapDefault!43489)) b!1113838))

(assert (= start!97544 b!1113844))

(declare-fun m!1030371 () Bool)

(assert (=> b!1113846 m!1030371))

(declare-fun m!1030373 () Bool)

(assert (=> start!97544 m!1030373))

(declare-fun m!1030375 () Bool)

(assert (=> start!97544 m!1030375))

(declare-fun m!1030377 () Bool)

(assert (=> b!1113835 m!1030377))

(declare-fun m!1030379 () Bool)

(assert (=> b!1113840 m!1030379))

(declare-fun m!1030381 () Bool)

(assert (=> b!1113836 m!1030381))

(declare-fun m!1030383 () Bool)

(assert (=> b!1113836 m!1030383))

(declare-fun m!1030385 () Bool)

(assert (=> b!1113839 m!1030385))

(declare-fun m!1030387 () Bool)

(assert (=> b!1113842 m!1030387))

(declare-fun m!1030389 () Bool)

(assert (=> b!1113842 m!1030389))

(declare-fun m!1030391 () Bool)

(assert (=> b!1113843 m!1030391))

(declare-fun m!1030393 () Bool)

(assert (=> mapNonEmpty!43489 m!1030393))

(declare-fun m!1030395 () Bool)

(assert (=> b!1113841 m!1030395))

(check-sat (not b!1113843) tp_is_empty!27781 (not mapNonEmpty!43489) (not start!97544) (not b!1113839) (not b!1113836) (not b!1113842) (not b!1113840) (not b!1113846) (not b!1113841))
(check-sat)
