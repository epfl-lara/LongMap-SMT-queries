; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81872 () Bool)

(assert start!81872)

(declare-fun b_free!18385 () Bool)

(declare-fun b_next!18385 () Bool)

(assert (=> start!81872 (= b_free!18385 (not b_next!18385))))

(declare-fun tp!63855 () Bool)

(declare-fun b_and!29845 () Bool)

(assert (=> start!81872 (= tp!63855 b_and!29845)))

(declare-fun b!954838 () Bool)

(declare-fun res!639455 () Bool)

(declare-fun e!537929 () Bool)

(assert (=> b!954838 (=> (not res!639455) (not e!537929))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32889 0))(
  ( (V!32890 (val!10515 Int)) )
))
(declare-fun zeroValue!1139 () V!32889)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57928 0))(
  ( (array!57929 (arr!27844 (Array (_ BitVec 32) (_ BitVec 64))) (size!28325 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57928)

(declare-datatypes ((ValueCell!9983 0))(
  ( (ValueCellFull!9983 (v!13069 V!32889)) (EmptyCell!9983) )
))
(declare-datatypes ((array!57930 0))(
  ( (array!57931 (arr!27845 (Array (_ BitVec 32) ValueCell!9983)) (size!28326 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57930)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32889)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13696 0))(
  ( (tuple2!13697 (_1!6859 (_ BitVec 64)) (_2!6859 V!32889)) )
))
(declare-datatypes ((List!19436 0))(
  ( (Nil!19433) (Cons!19432 (h!20594 tuple2!13696) (t!27788 List!19436)) )
))
(declare-datatypes ((ListLongMap!12383 0))(
  ( (ListLongMap!12384 (toList!6207 List!19436)) )
))
(declare-fun contains!5248 (ListLongMap!12383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3369 (array!57928 array!57930 (_ BitVec 32) (_ BitVec 32) V!32889 V!32889 (_ BitVec 32) Int) ListLongMap!12383)

(assert (=> b!954838 (= res!639455 (contains!5248 (getCurrentListMap!3369 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27844 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33355 () Bool)

(declare-fun mapRes!33355 () Bool)

(declare-fun tp!63856 () Bool)

(declare-fun e!537928 () Bool)

(assert (=> mapNonEmpty!33355 (= mapRes!33355 (and tp!63856 e!537928))))

(declare-fun mapKey!33355 () (_ BitVec 32))

(declare-fun mapRest!33355 () (Array (_ BitVec 32) ValueCell!9983))

(declare-fun mapValue!33355 () ValueCell!9983)

(assert (=> mapNonEmpty!33355 (= (arr!27845 _values!1197) (store mapRest!33355 mapKey!33355 mapValue!33355))))

(declare-fun b!954839 () Bool)

(declare-fun res!639451 () Bool)

(assert (=> b!954839 (=> (not res!639451) (not e!537929))))

(declare-datatypes ((List!19437 0))(
  ( (Nil!19434) (Cons!19433 (h!20595 (_ BitVec 64)) (t!27789 List!19437)) )
))
(declare-fun arrayNoDuplicates!0 (array!57928 (_ BitVec 32) List!19437) Bool)

(assert (=> b!954839 (= res!639451 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19434))))

(declare-fun b!954840 () Bool)

(declare-fun e!537927 () Bool)

(declare-fun e!537926 () Bool)

(assert (=> b!954840 (= e!537927 (and e!537926 mapRes!33355))))

(declare-fun condMapEmpty!33355 () Bool)

(declare-fun mapDefault!33355 () ValueCell!9983)

(assert (=> b!954840 (= condMapEmpty!33355 (= (arr!27845 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9983)) mapDefault!33355)))))

(declare-fun b!954841 () Bool)

(declare-fun tp_is_empty!20929 () Bool)

(assert (=> b!954841 (= e!537928 tp_is_empty!20929)))

(declare-fun b!954842 () Bool)

(assert (=> b!954842 (= e!537926 tp_is_empty!20929)))

(declare-fun mapIsEmpty!33355 () Bool)

(assert (=> mapIsEmpty!33355 mapRes!33355))

(declare-fun b!954844 () Bool)

(declare-fun res!639453 () Bool)

(assert (=> b!954844 (=> (not res!639453) (not e!537929))))

(assert (=> b!954844 (= res!639453 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28325 _keys!1441))))))

(declare-fun b!954845 () Bool)

(declare-fun res!639452 () Bool)

(assert (=> b!954845 (=> (not res!639452) (not e!537929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57928 (_ BitVec 32)) Bool)

(assert (=> b!954845 (= res!639452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954846 () Bool)

(declare-fun res!639456 () Bool)

(assert (=> b!954846 (=> (not res!639456) (not e!537929))))

(assert (=> b!954846 (= res!639456 (and (= (size!28326 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28325 _keys!1441) (size!28326 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954847 () Bool)

(assert (=> b!954847 (= e!537929 (not true))))

(assert (=> b!954847 (contains!5248 (getCurrentListMap!3369 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27844 _keys!1441) i!735))))

(declare-datatypes ((Unit!31964 0))(
  ( (Unit!31965) )
))
(declare-fun lt!429735 () Unit!31964)

(declare-fun lemmaInListMapFromThenFromZero!1 (array!57928 array!57930 (_ BitVec 32) (_ BitVec 32) V!32889 V!32889 (_ BitVec 32) (_ BitVec 32) Int) Unit!31964)

(assert (=> b!954847 (= lt!429735 (lemmaInListMapFromThenFromZero!1 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!954843 () Bool)

(declare-fun res!639457 () Bool)

(assert (=> b!954843 (=> (not res!639457) (not e!537929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954843 (= res!639457 (validKeyInArray!0 (select (arr!27844 _keys!1441) i!735)))))

(declare-fun res!639454 () Bool)

(assert (=> start!81872 (=> (not res!639454) (not e!537929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81872 (= res!639454 (validMask!0 mask!1823))))

(assert (=> start!81872 e!537929))

(assert (=> start!81872 true))

(assert (=> start!81872 tp_is_empty!20929))

(declare-fun array_inv!21673 (array!57928) Bool)

(assert (=> start!81872 (array_inv!21673 _keys!1441)))

(declare-fun array_inv!21674 (array!57930) Bool)

(assert (=> start!81872 (and (array_inv!21674 _values!1197) e!537927)))

(assert (=> start!81872 tp!63855))

(assert (= (and start!81872 res!639454) b!954846))

(assert (= (and b!954846 res!639456) b!954845))

(assert (= (and b!954845 res!639452) b!954839))

(assert (= (and b!954839 res!639451) b!954844))

(assert (= (and b!954844 res!639453) b!954843))

(assert (= (and b!954843 res!639457) b!954838))

(assert (= (and b!954838 res!639455) b!954847))

(assert (= (and b!954840 condMapEmpty!33355) mapIsEmpty!33355))

(assert (= (and b!954840 (not condMapEmpty!33355)) mapNonEmpty!33355))

(get-info :version)

(assert (= (and mapNonEmpty!33355 ((_ is ValueCellFull!9983) mapValue!33355)) b!954841))

(assert (= (and b!954840 ((_ is ValueCellFull!9983) mapDefault!33355)) b!954842))

(assert (= start!81872 b!954840))

(declare-fun m!885885 () Bool)

(assert (=> b!954845 m!885885))

(declare-fun m!885887 () Bool)

(assert (=> mapNonEmpty!33355 m!885887))

(declare-fun m!885889 () Bool)

(assert (=> b!954847 m!885889))

(declare-fun m!885891 () Bool)

(assert (=> b!954847 m!885891))

(assert (=> b!954847 m!885889))

(assert (=> b!954847 m!885891))

(declare-fun m!885893 () Bool)

(assert (=> b!954847 m!885893))

(declare-fun m!885895 () Bool)

(assert (=> b!954847 m!885895))

(declare-fun m!885897 () Bool)

(assert (=> b!954839 m!885897))

(assert (=> b!954843 m!885891))

(assert (=> b!954843 m!885891))

(declare-fun m!885899 () Bool)

(assert (=> b!954843 m!885899))

(declare-fun m!885901 () Bool)

(assert (=> start!81872 m!885901))

(declare-fun m!885903 () Bool)

(assert (=> start!81872 m!885903))

(declare-fun m!885905 () Bool)

(assert (=> start!81872 m!885905))

(declare-fun m!885907 () Bool)

(assert (=> b!954838 m!885907))

(assert (=> b!954838 m!885891))

(assert (=> b!954838 m!885907))

(assert (=> b!954838 m!885891))

(declare-fun m!885909 () Bool)

(assert (=> b!954838 m!885909))

(check-sat (not b!954843) (not b!954845) (not b!954839) (not mapNonEmpty!33355) (not b!954847) (not b!954838) tp_is_empty!20929 (not b_next!18385) (not start!81872) b_and!29845)
(check-sat b_and!29845 (not b_next!18385))
