; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82058 () Bool)

(assert start!82058)

(declare-fun b_free!18385 () Bool)

(declare-fun b_next!18385 () Bool)

(assert (=> start!82058 (= b_free!18385 (not b_next!18385))))

(declare-fun tp!63855 () Bool)

(declare-fun b_and!29881 () Bool)

(assert (=> start!82058 (= tp!63855 b_and!29881)))

(declare-fun b!955980 () Bool)

(declare-fun e!538656 () Bool)

(declare-fun tp_is_empty!20929 () Bool)

(assert (=> b!955980 (= e!538656 tp_is_empty!20929)))

(declare-fun res!639910 () Bool)

(declare-fun e!538657 () Bool)

(assert (=> start!82058 (=> (not res!639910) (not e!538657))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82058 (= res!639910 (validMask!0 mask!1823))))

(assert (=> start!82058 e!538657))

(assert (=> start!82058 true))

(assert (=> start!82058 tp_is_empty!20929))

(declare-datatypes ((array!58012 0))(
  ( (array!58013 (arr!27881 (Array (_ BitVec 32) (_ BitVec 64))) (size!28361 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58012)

(declare-fun array_inv!21719 (array!58012) Bool)

(assert (=> start!82058 (array_inv!21719 _keys!1441)))

(declare-datatypes ((V!32889 0))(
  ( (V!32890 (val!10515 Int)) )
))
(declare-datatypes ((ValueCell!9983 0))(
  ( (ValueCellFull!9983 (v!13067 V!32889)) (EmptyCell!9983) )
))
(declare-datatypes ((array!58014 0))(
  ( (array!58015 (arr!27882 (Array (_ BitVec 32) ValueCell!9983)) (size!28362 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58014)

(declare-fun e!538659 () Bool)

(declare-fun array_inv!21720 (array!58014) Bool)

(assert (=> start!82058 (and (array_inv!21720 _values!1197) e!538659)))

(assert (=> start!82058 tp!63855))

(declare-fun b!955981 () Bool)

(assert (=> b!955981 (= e!538657 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32889)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32889)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13636 0))(
  ( (tuple2!13637 (_1!6829 (_ BitVec 64)) (_2!6829 V!32889)) )
))
(declare-datatypes ((List!19421 0))(
  ( (Nil!19418) (Cons!19417 (h!20585 tuple2!13636) (t!27774 List!19421)) )
))
(declare-datatypes ((ListLongMap!12335 0))(
  ( (ListLongMap!12336 (toList!6183 List!19421)) )
))
(declare-fun contains!5292 (ListLongMap!12335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3416 (array!58012 array!58014 (_ BitVec 32) (_ BitVec 32) V!32889 V!32889 (_ BitVec 32) Int) ListLongMap!12335)

(assert (=> b!955981 (contains!5292 (getCurrentListMap!3416 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735))))

(declare-datatypes ((Unit!32072 0))(
  ( (Unit!32073) )
))
(declare-fun lt!430332 () Unit!32072)

(declare-fun lemmaInListMapFromThenFromZero!1 (array!58012 array!58014 (_ BitVec 32) (_ BitVec 32) V!32889 V!32889 (_ BitVec 32) (_ BitVec 32) Int) Unit!32072)

(assert (=> b!955981 (= lt!430332 (lemmaInListMapFromThenFromZero!1 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955982 () Bool)

(declare-fun res!639906 () Bool)

(assert (=> b!955982 (=> (not res!639906) (not e!538657))))

(assert (=> b!955982 (= res!639906 (contains!5292 (getCurrentListMap!3416 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27881 _keys!1441) i!735)))))

(declare-fun b!955983 () Bool)

(declare-fun res!639907 () Bool)

(assert (=> b!955983 (=> (not res!639907) (not e!538657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58012 (_ BitVec 32)) Bool)

(assert (=> b!955983 (= res!639907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955984 () Bool)

(declare-fun mapRes!33355 () Bool)

(assert (=> b!955984 (= e!538659 (and e!538656 mapRes!33355))))

(declare-fun condMapEmpty!33355 () Bool)

(declare-fun mapDefault!33355 () ValueCell!9983)

(assert (=> b!955984 (= condMapEmpty!33355 (= (arr!27882 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9983)) mapDefault!33355)))))

(declare-fun mapIsEmpty!33355 () Bool)

(assert (=> mapIsEmpty!33355 mapRes!33355))

(declare-fun b!955985 () Bool)

(declare-fun res!639905 () Bool)

(assert (=> b!955985 (=> (not res!639905) (not e!538657))))

(assert (=> b!955985 (= res!639905 (and (= (size!28362 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28361 _keys!1441) (size!28362 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955986 () Bool)

(declare-fun res!639909 () Bool)

(assert (=> b!955986 (=> (not res!639909) (not e!538657))))

(assert (=> b!955986 (= res!639909 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28361 _keys!1441))))))

(declare-fun mapNonEmpty!33355 () Bool)

(declare-fun tp!63856 () Bool)

(declare-fun e!538660 () Bool)

(assert (=> mapNonEmpty!33355 (= mapRes!33355 (and tp!63856 e!538660))))

(declare-fun mapValue!33355 () ValueCell!9983)

(declare-fun mapKey!33355 () (_ BitVec 32))

(declare-fun mapRest!33355 () (Array (_ BitVec 32) ValueCell!9983))

(assert (=> mapNonEmpty!33355 (= (arr!27882 _values!1197) (store mapRest!33355 mapKey!33355 mapValue!33355))))

(declare-fun b!955987 () Bool)

(declare-fun res!639908 () Bool)

(assert (=> b!955987 (=> (not res!639908) (not e!538657))))

(declare-datatypes ((List!19422 0))(
  ( (Nil!19419) (Cons!19418 (h!20586 (_ BitVec 64)) (t!27775 List!19422)) )
))
(declare-fun arrayNoDuplicates!0 (array!58012 (_ BitVec 32) List!19422) Bool)

(assert (=> b!955987 (= res!639908 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19419))))

(declare-fun b!955988 () Bool)

(assert (=> b!955988 (= e!538660 tp_is_empty!20929)))

(declare-fun b!955989 () Bool)

(declare-fun res!639911 () Bool)

(assert (=> b!955989 (=> (not res!639911) (not e!538657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955989 (= res!639911 (validKeyInArray!0 (select (arr!27881 _keys!1441) i!735)))))

(assert (= (and start!82058 res!639910) b!955985))

(assert (= (and b!955985 res!639905) b!955983))

(assert (= (and b!955983 res!639907) b!955987))

(assert (= (and b!955987 res!639908) b!955986))

(assert (= (and b!955986 res!639909) b!955989))

(assert (= (and b!955989 res!639911) b!955982))

(assert (= (and b!955982 res!639906) b!955981))

(assert (= (and b!955984 condMapEmpty!33355) mapIsEmpty!33355))

(assert (= (and b!955984 (not condMapEmpty!33355)) mapNonEmpty!33355))

(get-info :version)

(assert (= (and mapNonEmpty!33355 ((_ is ValueCellFull!9983) mapValue!33355)) b!955988))

(assert (= (and b!955984 ((_ is ValueCellFull!9983) mapDefault!33355)) b!955980))

(assert (= start!82058 b!955984))

(declare-fun m!887937 () Bool)

(assert (=> mapNonEmpty!33355 m!887937))

(declare-fun m!887939 () Bool)

(assert (=> b!955987 m!887939))

(declare-fun m!887941 () Bool)

(assert (=> b!955982 m!887941))

(declare-fun m!887943 () Bool)

(assert (=> b!955982 m!887943))

(assert (=> b!955982 m!887941))

(assert (=> b!955982 m!887943))

(declare-fun m!887945 () Bool)

(assert (=> b!955982 m!887945))

(declare-fun m!887947 () Bool)

(assert (=> b!955983 m!887947))

(declare-fun m!887949 () Bool)

(assert (=> b!955981 m!887949))

(assert (=> b!955981 m!887943))

(assert (=> b!955981 m!887949))

(assert (=> b!955981 m!887943))

(declare-fun m!887951 () Bool)

(assert (=> b!955981 m!887951))

(declare-fun m!887953 () Bool)

(assert (=> b!955981 m!887953))

(declare-fun m!887955 () Bool)

(assert (=> start!82058 m!887955))

(declare-fun m!887957 () Bool)

(assert (=> start!82058 m!887957))

(declare-fun m!887959 () Bool)

(assert (=> start!82058 m!887959))

(assert (=> b!955989 m!887943))

(assert (=> b!955989 m!887943))

(declare-fun m!887961 () Bool)

(assert (=> b!955989 m!887961))

(check-sat (not b!955983) (not b!955987) (not b_next!18385) (not start!82058) (not mapNonEmpty!33355) (not b!955982) b_and!29881 tp_is_empty!20929 (not b!955989) (not b!955981))
(check-sat b_and!29881 (not b_next!18385))
