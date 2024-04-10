; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97546 () Bool)

(assert start!97546)

(declare-fun b!1113885 () Bool)

(declare-fun e!634915 () Bool)

(assert (=> b!1113885 (= e!634915 (not true))))

(declare-datatypes ((array!72461 0))(
  ( (array!72462 (arr!34883 (Array (_ BitVec 32) (_ BitVec 64))) (size!35419 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72461)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113885 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36556 0))(
  ( (Unit!36557) )
))
(declare-fun lt!496742 () Unit!36556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72461 (_ BitVec 64) (_ BitVec 32)) Unit!36556)

(assert (=> b!1113885 (= lt!496742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43483 () Bool)

(declare-fun mapRes!43483 () Bool)

(declare-fun tp!82727 () Bool)

(declare-fun e!634916 () Bool)

(assert (=> mapNonEmpty!43483 (= mapRes!43483 (and tp!82727 e!634916))))

(declare-datatypes ((V!42163 0))(
  ( (V!42164 (val!13945 Int)) )
))
(declare-datatypes ((ValueCell!13179 0))(
  ( (ValueCellFull!13179 (v!16578 V!42163)) (EmptyCell!13179) )
))
(declare-fun mapValue!43483 () ValueCell!13179)

(declare-fun mapKey!43483 () (_ BitVec 32))

(declare-datatypes ((array!72463 0))(
  ( (array!72464 (arr!34884 (Array (_ BitVec 32) ValueCell!13179)) (size!35420 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72463)

(declare-fun mapRest!43483 () (Array (_ BitVec 32) ValueCell!13179))

(assert (=> mapNonEmpty!43483 (= (arr!34884 _values!996) (store mapRest!43483 mapKey!43483 mapValue!43483))))

(declare-fun b!1113886 () Bool)

(declare-fun e!634914 () Bool)

(declare-fun tp_is_empty!27777 () Bool)

(assert (=> b!1113886 (= e!634914 tp_is_empty!27777)))

(declare-fun b!1113887 () Bool)

(declare-fun res!743481 () Bool)

(declare-fun e!634917 () Bool)

(assert (=> b!1113887 (=> (not res!743481) (not e!634917))))

(assert (=> b!1113887 (= res!743481 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35419 _keys!1208))))))

(declare-fun b!1113888 () Bool)

(assert (=> b!1113888 (= e!634916 tp_is_empty!27777)))

(declare-fun b!1113889 () Bool)

(declare-fun res!743477 () Bool)

(assert (=> b!1113889 (=> (not res!743477) (not e!634917))))

(assert (=> b!1113889 (= res!743477 (= (select (arr!34883 _keys!1208) i!673) k0!934))))

(declare-fun b!1113891 () Bool)

(declare-fun res!743480 () Bool)

(assert (=> b!1113891 (=> (not res!743480) (not e!634917))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113891 (= res!743480 (validMask!0 mask!1564))))

(declare-fun b!1113892 () Bool)

(declare-fun res!743478 () Bool)

(assert (=> b!1113892 (=> (not res!743478) (not e!634917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72461 (_ BitVec 32)) Bool)

(assert (=> b!1113892 (= res!743478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113893 () Bool)

(declare-fun res!743479 () Bool)

(assert (=> b!1113893 (=> (not res!743479) (not e!634917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113893 (= res!743479 (validKeyInArray!0 k0!934))))

(declare-fun b!1113894 () Bool)

(declare-fun res!743482 () Bool)

(assert (=> b!1113894 (=> (not res!743482) (not e!634917))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113894 (= res!743482 (and (= (size!35420 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35419 _keys!1208) (size!35420 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113895 () Bool)

(assert (=> b!1113895 (= e!634917 e!634915)))

(declare-fun res!743475 () Bool)

(assert (=> b!1113895 (=> (not res!743475) (not e!634915))))

(declare-fun lt!496741 () array!72461)

(assert (=> b!1113895 (= res!743475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496741 mask!1564))))

(assert (=> b!1113895 (= lt!496741 (array!72462 (store (arr!34883 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35419 _keys!1208)))))

(declare-fun b!1113896 () Bool)

(declare-fun res!743476 () Bool)

(assert (=> b!1113896 (=> (not res!743476) (not e!634915))))

(declare-datatypes ((List!24317 0))(
  ( (Nil!24314) (Cons!24313 (h!25522 (_ BitVec 64)) (t!34798 List!24317)) )
))
(declare-fun arrayNoDuplicates!0 (array!72461 (_ BitVec 32) List!24317) Bool)

(assert (=> b!1113896 (= res!743476 (arrayNoDuplicates!0 lt!496741 #b00000000000000000000000000000000 Nil!24314))))

(declare-fun b!1113897 () Bool)

(declare-fun e!634912 () Bool)

(assert (=> b!1113897 (= e!634912 (and e!634914 mapRes!43483))))

(declare-fun condMapEmpty!43483 () Bool)

(declare-fun mapDefault!43483 () ValueCell!13179)

(assert (=> b!1113897 (= condMapEmpty!43483 (= (arr!34884 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13179)) mapDefault!43483)))))

(declare-fun mapIsEmpty!43483 () Bool)

(assert (=> mapIsEmpty!43483 mapRes!43483))

(declare-fun res!743473 () Bool)

(assert (=> start!97546 (=> (not res!743473) (not e!634917))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97546 (= res!743473 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35419 _keys!1208))))))

(assert (=> start!97546 e!634917))

(declare-fun array_inv!26816 (array!72461) Bool)

(assert (=> start!97546 (array_inv!26816 _keys!1208)))

(assert (=> start!97546 true))

(declare-fun array_inv!26817 (array!72463) Bool)

(assert (=> start!97546 (and (array_inv!26817 _values!996) e!634912)))

(declare-fun b!1113890 () Bool)

(declare-fun res!743474 () Bool)

(assert (=> b!1113890 (=> (not res!743474) (not e!634917))))

(assert (=> b!1113890 (= res!743474 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24314))))

(assert (= (and start!97546 res!743473) b!1113891))

(assert (= (and b!1113891 res!743480) b!1113894))

(assert (= (and b!1113894 res!743482) b!1113892))

(assert (= (and b!1113892 res!743478) b!1113890))

(assert (= (and b!1113890 res!743474) b!1113887))

(assert (= (and b!1113887 res!743481) b!1113893))

(assert (= (and b!1113893 res!743479) b!1113889))

(assert (= (and b!1113889 res!743477) b!1113895))

(assert (= (and b!1113895 res!743475) b!1113896))

(assert (= (and b!1113896 res!743476) b!1113885))

(assert (= (and b!1113897 condMapEmpty!43483) mapIsEmpty!43483))

(assert (= (and b!1113897 (not condMapEmpty!43483)) mapNonEmpty!43483))

(get-info :version)

(assert (= (and mapNonEmpty!43483 ((_ is ValueCellFull!13179) mapValue!43483)) b!1113888))

(assert (= (and b!1113897 ((_ is ValueCellFull!13179) mapDefault!43483)) b!1113886))

(assert (= start!97546 b!1113897))

(declare-fun m!1030945 () Bool)

(assert (=> mapNonEmpty!43483 m!1030945))

(declare-fun m!1030947 () Bool)

(assert (=> b!1113890 m!1030947))

(declare-fun m!1030949 () Bool)

(assert (=> b!1113892 m!1030949))

(declare-fun m!1030951 () Bool)

(assert (=> start!97546 m!1030951))

(declare-fun m!1030953 () Bool)

(assert (=> start!97546 m!1030953))

(declare-fun m!1030955 () Bool)

(assert (=> b!1113895 m!1030955))

(declare-fun m!1030957 () Bool)

(assert (=> b!1113895 m!1030957))

(declare-fun m!1030959 () Bool)

(assert (=> b!1113885 m!1030959))

(declare-fun m!1030961 () Bool)

(assert (=> b!1113885 m!1030961))

(declare-fun m!1030963 () Bool)

(assert (=> b!1113893 m!1030963))

(declare-fun m!1030965 () Bool)

(assert (=> b!1113889 m!1030965))

(declare-fun m!1030967 () Bool)

(assert (=> b!1113891 m!1030967))

(declare-fun m!1030969 () Bool)

(assert (=> b!1113896 m!1030969))

(check-sat (not b!1113896) (not start!97546) (not b!1113885) (not b!1113892) (not b!1113890) (not b!1113891) (not b!1113895) tp_is_empty!27777 (not mapNonEmpty!43483) (not b!1113893))
(check-sat)
