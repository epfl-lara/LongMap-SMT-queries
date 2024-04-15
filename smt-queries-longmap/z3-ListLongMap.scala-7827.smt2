; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97700 () Bool)

(assert start!97700)

(declare-fun b!1116876 () Bool)

(declare-fun res!745807 () Bool)

(declare-fun e!636274 () Bool)

(assert (=> b!1116876 (=> (not res!745807) (not e!636274))))

(declare-datatypes ((array!72670 0))(
  ( (array!72671 (arr!34988 (Array (_ BitVec 32) (_ BitVec 64))) (size!35526 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72670)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72670 (_ BitVec 32)) Bool)

(assert (=> b!1116876 (= res!745807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116877 () Bool)

(declare-fun res!745813 () Bool)

(declare-fun e!636276 () Bool)

(assert (=> b!1116877 (=> (not res!745813) (not e!636276))))

(declare-fun lt!497021 () array!72670)

(declare-datatypes ((List!24415 0))(
  ( (Nil!24412) (Cons!24411 (h!25620 (_ BitVec 64)) (t!34887 List!24415)) )
))
(declare-fun arrayNoDuplicates!0 (array!72670 (_ BitVec 32) List!24415) Bool)

(assert (=> b!1116877 (= res!745813 (arrayNoDuplicates!0 lt!497021 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun mapIsEmpty!43723 () Bool)

(declare-fun mapRes!43723 () Bool)

(assert (=> mapIsEmpty!43723 mapRes!43723))

(declare-fun b!1116878 () Bool)

(declare-fun res!745805 () Bool)

(assert (=> b!1116878 (=> (not res!745805) (not e!636274))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116878 (= res!745805 (validKeyInArray!0 k0!934))))

(declare-fun b!1116879 () Bool)

(declare-fun res!745809 () Bool)

(assert (=> b!1116879 (=> (not res!745809) (not e!636274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116879 (= res!745809 (validMask!0 mask!1564))))

(declare-fun b!1116880 () Bool)

(declare-fun e!636273 () Bool)

(declare-fun e!636272 () Bool)

(assert (=> b!1116880 (= e!636273 (and e!636272 mapRes!43723))))

(declare-fun condMapEmpty!43723 () Bool)

(declare-datatypes ((V!42377 0))(
  ( (V!42378 (val!14025 Int)) )
))
(declare-datatypes ((ValueCell!13259 0))(
  ( (ValueCellFull!13259 (v!16657 V!42377)) (EmptyCell!13259) )
))
(declare-datatypes ((array!72672 0))(
  ( (array!72673 (arr!34989 (Array (_ BitVec 32) ValueCell!13259)) (size!35527 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72672)

(declare-fun mapDefault!43723 () ValueCell!13259)

(assert (=> b!1116880 (= condMapEmpty!43723 (= (arr!34989 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13259)) mapDefault!43723)))))

(declare-fun b!1116881 () Bool)

(declare-fun res!745808 () Bool)

(assert (=> b!1116881 (=> (not res!745808) (not e!636274))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116881 (= res!745808 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35526 _keys!1208))))))

(declare-fun b!1116883 () Bool)

(assert (=> b!1116883 (= e!636276 (not true))))

(declare-fun arrayContainsKey!0 (array!72670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116883 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36481 0))(
  ( (Unit!36482) )
))
(declare-fun lt!497022 () Unit!36481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72670 (_ BitVec 64) (_ BitVec 32)) Unit!36481)

(assert (=> b!1116883 (= lt!497022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116884 () Bool)

(declare-fun tp_is_empty!27937 () Bool)

(assert (=> b!1116884 (= e!636272 tp_is_empty!27937)))

(declare-fun b!1116885 () Bool)

(declare-fun res!745806 () Bool)

(assert (=> b!1116885 (=> (not res!745806) (not e!636274))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116885 (= res!745806 (and (= (size!35527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35526 _keys!1208) (size!35527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116886 () Bool)

(declare-fun res!745811 () Bool)

(assert (=> b!1116886 (=> (not res!745811) (not e!636274))))

(assert (=> b!1116886 (= res!745811 (= (select (arr!34988 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43723 () Bool)

(declare-fun tp!82967 () Bool)

(declare-fun e!636275 () Bool)

(assert (=> mapNonEmpty!43723 (= mapRes!43723 (and tp!82967 e!636275))))

(declare-fun mapKey!43723 () (_ BitVec 32))

(declare-fun mapValue!43723 () ValueCell!13259)

(declare-fun mapRest!43723 () (Array (_ BitVec 32) ValueCell!13259))

(assert (=> mapNonEmpty!43723 (= (arr!34989 _values!996) (store mapRest!43723 mapKey!43723 mapValue!43723))))

(declare-fun res!745812 () Bool)

(assert (=> start!97700 (=> (not res!745812) (not e!636274))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97700 (= res!745812 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35526 _keys!1208))))))

(assert (=> start!97700 e!636274))

(declare-fun array_inv!26960 (array!72670) Bool)

(assert (=> start!97700 (array_inv!26960 _keys!1208)))

(assert (=> start!97700 true))

(declare-fun array_inv!26961 (array!72672) Bool)

(assert (=> start!97700 (and (array_inv!26961 _values!996) e!636273)))

(declare-fun b!1116882 () Bool)

(assert (=> b!1116882 (= e!636275 tp_is_empty!27937)))

(declare-fun b!1116887 () Bool)

(declare-fun res!745804 () Bool)

(assert (=> b!1116887 (=> (not res!745804) (not e!636274))))

(assert (=> b!1116887 (= res!745804 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun b!1116888 () Bool)

(assert (=> b!1116888 (= e!636274 e!636276)))

(declare-fun res!745810 () Bool)

(assert (=> b!1116888 (=> (not res!745810) (not e!636276))))

(assert (=> b!1116888 (= res!745810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497021 mask!1564))))

(assert (=> b!1116888 (= lt!497021 (array!72671 (store (arr!34988 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35526 _keys!1208)))))

(assert (= (and start!97700 res!745812) b!1116879))

(assert (= (and b!1116879 res!745809) b!1116885))

(assert (= (and b!1116885 res!745806) b!1116876))

(assert (= (and b!1116876 res!745807) b!1116887))

(assert (= (and b!1116887 res!745804) b!1116881))

(assert (= (and b!1116881 res!745808) b!1116878))

(assert (= (and b!1116878 res!745805) b!1116886))

(assert (= (and b!1116886 res!745811) b!1116888))

(assert (= (and b!1116888 res!745810) b!1116877))

(assert (= (and b!1116877 res!745813) b!1116883))

(assert (= (and b!1116880 condMapEmpty!43723) mapIsEmpty!43723))

(assert (= (and b!1116880 (not condMapEmpty!43723)) mapNonEmpty!43723))

(get-info :version)

(assert (= (and mapNonEmpty!43723 ((_ is ValueCellFull!13259) mapValue!43723)) b!1116882))

(assert (= (and b!1116880 ((_ is ValueCellFull!13259) mapDefault!43723)) b!1116884))

(assert (= start!97700 b!1116880))

(declare-fun m!1032399 () Bool)

(assert (=> mapNonEmpty!43723 m!1032399))

(declare-fun m!1032401 () Bool)

(assert (=> b!1116876 m!1032401))

(declare-fun m!1032403 () Bool)

(assert (=> b!1116879 m!1032403))

(declare-fun m!1032405 () Bool)

(assert (=> b!1116887 m!1032405))

(declare-fun m!1032407 () Bool)

(assert (=> start!97700 m!1032407))

(declare-fun m!1032409 () Bool)

(assert (=> start!97700 m!1032409))

(declare-fun m!1032411 () Bool)

(assert (=> b!1116878 m!1032411))

(declare-fun m!1032413 () Bool)

(assert (=> b!1116883 m!1032413))

(declare-fun m!1032415 () Bool)

(assert (=> b!1116883 m!1032415))

(declare-fun m!1032417 () Bool)

(assert (=> b!1116886 m!1032417))

(declare-fun m!1032419 () Bool)

(assert (=> b!1116877 m!1032419))

(declare-fun m!1032421 () Bool)

(assert (=> b!1116888 m!1032421))

(declare-fun m!1032423 () Bool)

(assert (=> b!1116888 m!1032423))

(check-sat (not b!1116878) (not b!1116888) (not b!1116887) (not mapNonEmpty!43723) (not b!1116883) tp_is_empty!27937 (not b!1116876) (not b!1116877) (not b!1116879) (not start!97700))
(check-sat)
