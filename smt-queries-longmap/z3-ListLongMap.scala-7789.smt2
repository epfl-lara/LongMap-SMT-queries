; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97714 () Bool)

(assert start!97714)

(declare-fun res!742975 () Bool)

(declare-fun e!635157 () Bool)

(assert (=> start!97714 (=> (not res!742975) (not e!635157))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72369 0))(
  ( (array!72370 (arr!34831 (Array (_ BitVec 32) (_ BitVec 64))) (size!35368 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72369)

(assert (=> start!97714 (= res!742975 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35368 _keys!1208))))))

(assert (=> start!97714 e!635157))

(declare-fun array_inv!26840 (array!72369) Bool)

(assert (=> start!97714 (array_inv!26840 _keys!1208)))

(assert (=> start!97714 true))

(declare-datatypes ((V!42073 0))(
  ( (V!42074 (val!13911 Int)) )
))
(declare-datatypes ((ValueCell!13145 0))(
  ( (ValueCellFull!13145 (v!16540 V!42073)) (EmptyCell!13145) )
))
(declare-datatypes ((array!72371 0))(
  ( (array!72372 (arr!34832 (Array (_ BitVec 32) ValueCell!13145)) (size!35369 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72371)

(declare-fun e!635160 () Bool)

(declare-fun array_inv!26841 (array!72371) Bool)

(assert (=> start!97714 (and (array_inv!26841 _values!996) e!635160)))

(declare-fun b!1113886 () Bool)

(declare-fun res!742984 () Bool)

(declare-fun e!635159 () Bool)

(assert (=> b!1113886 (=> (not res!742984) (not e!635159))))

(declare-fun lt!497053 () array!72369)

(declare-datatypes ((List!24312 0))(
  ( (Nil!24309) (Cons!24308 (h!25526 (_ BitVec 64)) (t!34785 List!24312)) )
))
(declare-fun arrayNoDuplicates!0 (array!72369 (_ BitVec 32) List!24312) Bool)

(assert (=> b!1113886 (= res!742984 (arrayNoDuplicates!0 lt!497053 #b00000000000000000000000000000000 Nil!24309))))

(declare-fun mapNonEmpty!43381 () Bool)

(declare-fun mapRes!43381 () Bool)

(declare-fun tp!82625 () Bool)

(declare-fun e!635158 () Bool)

(assert (=> mapNonEmpty!43381 (= mapRes!43381 (and tp!82625 e!635158))))

(declare-fun mapValue!43381 () ValueCell!13145)

(declare-fun mapRest!43381 () (Array (_ BitVec 32) ValueCell!13145))

(declare-fun mapKey!43381 () (_ BitVec 32))

(assert (=> mapNonEmpty!43381 (= (arr!34832 _values!996) (store mapRest!43381 mapKey!43381 mapValue!43381))))

(declare-fun b!1113887 () Bool)

(declare-fun res!742976 () Bool)

(assert (=> b!1113887 (=> (not res!742976) (not e!635157))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113887 (= res!742976 (validKeyInArray!0 k0!934))))

(declare-fun b!1113888 () Bool)

(declare-fun e!635155 () Bool)

(assert (=> b!1113888 (= e!635160 (and e!635155 mapRes!43381))))

(declare-fun condMapEmpty!43381 () Bool)

(declare-fun mapDefault!43381 () ValueCell!13145)

(assert (=> b!1113888 (= condMapEmpty!43381 (= (arr!34832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13145)) mapDefault!43381)))))

(declare-fun b!1113889 () Bool)

(declare-fun res!742977 () Bool)

(assert (=> b!1113889 (=> (not res!742977) (not e!635157))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113889 (= res!742977 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35368 _keys!1208))))))

(declare-fun b!1113890 () Bool)

(declare-fun res!742979 () Bool)

(assert (=> b!1113890 (=> (not res!742979) (not e!635157))))

(assert (=> b!1113890 (= res!742979 (= (select (arr!34831 _keys!1208) i!673) k0!934))))

(declare-fun b!1113891 () Bool)

(assert (=> b!1113891 (= e!635157 e!635159)))

(declare-fun res!742982 () Bool)

(assert (=> b!1113891 (=> (not res!742982) (not e!635159))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72369 (_ BitVec 32)) Bool)

(assert (=> b!1113891 (= res!742982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497053 mask!1564))))

(assert (=> b!1113891 (= lt!497053 (array!72370 (store (arr!34831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35368 _keys!1208)))))

(declare-fun b!1113892 () Bool)

(declare-fun res!742980 () Bool)

(assert (=> b!1113892 (=> (not res!742980) (not e!635157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113892 (= res!742980 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43381 () Bool)

(assert (=> mapIsEmpty!43381 mapRes!43381))

(declare-fun b!1113893 () Bool)

(assert (=> b!1113893 (= e!635159 (not true))))

(declare-fun arrayContainsKey!0 (array!72369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113893 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36491 0))(
  ( (Unit!36492) )
))
(declare-fun lt!497052 () Unit!36491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72369 (_ BitVec 64) (_ BitVec 32)) Unit!36491)

(assert (=> b!1113893 (= lt!497052 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113894 () Bool)

(declare-fun tp_is_empty!27709 () Bool)

(assert (=> b!1113894 (= e!635158 tp_is_empty!27709)))

(declare-fun b!1113895 () Bool)

(declare-fun res!742978 () Bool)

(assert (=> b!1113895 (=> (not res!742978) (not e!635157))))

(assert (=> b!1113895 (= res!742978 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24309))))

(declare-fun b!1113896 () Bool)

(declare-fun res!742981 () Bool)

(assert (=> b!1113896 (=> (not res!742981) (not e!635157))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113896 (= res!742981 (and (= (size!35369 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35368 _keys!1208) (size!35369 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113897 () Bool)

(declare-fun res!742983 () Bool)

(assert (=> b!1113897 (=> (not res!742983) (not e!635157))))

(assert (=> b!1113897 (= res!742983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113898 () Bool)

(assert (=> b!1113898 (= e!635155 tp_is_empty!27709)))

(assert (= (and start!97714 res!742975) b!1113892))

(assert (= (and b!1113892 res!742980) b!1113896))

(assert (= (and b!1113896 res!742981) b!1113897))

(assert (= (and b!1113897 res!742983) b!1113895))

(assert (= (and b!1113895 res!742978) b!1113889))

(assert (= (and b!1113889 res!742977) b!1113887))

(assert (= (and b!1113887 res!742976) b!1113890))

(assert (= (and b!1113890 res!742979) b!1113891))

(assert (= (and b!1113891 res!742982) b!1113886))

(assert (= (and b!1113886 res!742984) b!1113893))

(assert (= (and b!1113888 condMapEmpty!43381) mapIsEmpty!43381))

(assert (= (and b!1113888 (not condMapEmpty!43381)) mapNonEmpty!43381))

(get-info :version)

(assert (= (and mapNonEmpty!43381 ((_ is ValueCellFull!13145) mapValue!43381)) b!1113894))

(assert (= (and b!1113888 ((_ is ValueCellFull!13145) mapDefault!43381)) b!1113898))

(assert (= start!97714 b!1113888))

(declare-fun m!1031733 () Bool)

(assert (=> mapNonEmpty!43381 m!1031733))

(declare-fun m!1031735 () Bool)

(assert (=> b!1113892 m!1031735))

(declare-fun m!1031737 () Bool)

(assert (=> b!1113886 m!1031737))

(declare-fun m!1031739 () Bool)

(assert (=> b!1113890 m!1031739))

(declare-fun m!1031741 () Bool)

(assert (=> b!1113887 m!1031741))

(declare-fun m!1031743 () Bool)

(assert (=> b!1113897 m!1031743))

(declare-fun m!1031745 () Bool)

(assert (=> b!1113893 m!1031745))

(declare-fun m!1031747 () Bool)

(assert (=> b!1113893 m!1031747))

(declare-fun m!1031749 () Bool)

(assert (=> b!1113895 m!1031749))

(declare-fun m!1031751 () Bool)

(assert (=> start!97714 m!1031751))

(declare-fun m!1031753 () Bool)

(assert (=> start!97714 m!1031753))

(declare-fun m!1031755 () Bool)

(assert (=> b!1113891 m!1031755))

(declare-fun m!1031757 () Bool)

(assert (=> b!1113891 m!1031757))

(check-sat (not b!1113893) (not b!1113887) tp_is_empty!27709 (not b!1113897) (not mapNonEmpty!43381) (not b!1113891) (not b!1113895) (not b!1113892) (not start!97714) (not b!1113886))
(check-sat)
