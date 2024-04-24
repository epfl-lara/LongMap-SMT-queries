; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82052 () Bool)

(assert start!82052)

(declare-fun b_free!18379 () Bool)

(declare-fun b_next!18379 () Bool)

(assert (=> start!82052 (= b_free!18379 (not b_next!18379))))

(declare-fun tp!63838 () Bool)

(declare-fun b_and!29875 () Bool)

(assert (=> start!82052 (= tp!63838 b_and!29875)))

(declare-fun b!955897 () Bool)

(declare-fun e!538612 () Bool)

(declare-fun tp_is_empty!20923 () Bool)

(assert (=> b!955897 (= e!538612 tp_is_empty!20923)))

(declare-fun b!955898 () Bool)

(declare-fun res!639853 () Bool)

(declare-fun e!538613 () Bool)

(assert (=> b!955898 (=> (not res!639853) (not e!538613))))

(declare-datatypes ((array!58002 0))(
  ( (array!58003 (arr!27876 (Array (_ BitVec 32) (_ BitVec 64))) (size!28356 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58002)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58002 (_ BitVec 32)) Bool)

(assert (=> b!955898 (= res!639853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955899 () Bool)

(declare-fun e!538614 () Bool)

(declare-fun mapRes!33346 () Bool)

(assert (=> b!955899 (= e!538614 (and e!538612 mapRes!33346))))

(declare-fun condMapEmpty!33346 () Bool)

(declare-datatypes ((V!32881 0))(
  ( (V!32882 (val!10512 Int)) )
))
(declare-datatypes ((ValueCell!9980 0))(
  ( (ValueCellFull!9980 (v!13064 V!32881)) (EmptyCell!9980) )
))
(declare-datatypes ((array!58004 0))(
  ( (array!58005 (arr!27877 (Array (_ BitVec 32) ValueCell!9980)) (size!28357 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58004)

(declare-fun mapDefault!33346 () ValueCell!9980)

(assert (=> b!955899 (= condMapEmpty!33346 (= (arr!27877 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9980)) mapDefault!33346)))))

(declare-fun mapNonEmpty!33346 () Bool)

(declare-fun tp!63837 () Bool)

(declare-fun e!538615 () Bool)

(assert (=> mapNonEmpty!33346 (= mapRes!33346 (and tp!63837 e!538615))))

(declare-fun mapValue!33346 () ValueCell!9980)

(declare-fun mapKey!33346 () (_ BitVec 32))

(declare-fun mapRest!33346 () (Array (_ BitVec 32) ValueCell!9980))

(assert (=> mapNonEmpty!33346 (= (arr!27877 _values!1197) (store mapRest!33346 mapKey!33346 mapValue!33346))))

(declare-fun res!639849 () Bool)

(assert (=> start!82052 (=> (not res!639849) (not e!538613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82052 (= res!639849 (validMask!0 mask!1823))))

(assert (=> start!82052 e!538613))

(assert (=> start!82052 true))

(assert (=> start!82052 tp_is_empty!20923))

(declare-fun array_inv!21717 (array!58002) Bool)

(assert (=> start!82052 (array_inv!21717 _keys!1441)))

(declare-fun array_inv!21718 (array!58004) Bool)

(assert (=> start!82052 (and (array_inv!21718 _values!1197) e!538614)))

(assert (=> start!82052 tp!63838))

(declare-fun b!955900 () Bool)

(declare-fun res!639851 () Bool)

(assert (=> b!955900 (=> (not res!639851) (not e!538613))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955900 (= res!639851 (and (= (size!28357 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28356 _keys!1441) (size!28357 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955901 () Bool)

(declare-fun res!639854 () Bool)

(assert (=> b!955901 (=> (not res!639854) (not e!538613))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955901 (= res!639854 (validKeyInArray!0 (select (arr!27876 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33346 () Bool)

(assert (=> mapIsEmpty!33346 mapRes!33346))

(declare-fun b!955902 () Bool)

(declare-fun res!639852 () Bool)

(assert (=> b!955902 (=> (not res!639852) (not e!538613))))

(assert (=> b!955902 (= res!639852 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28356 _keys!1441))))))

(declare-fun b!955903 () Bool)

(assert (=> b!955903 (= e!538613 false)))

(declare-fun zeroValue!1139 () V!32881)

(declare-fun lt!430323 () Bool)

(declare-fun minValue!1139 () V!32881)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13632 0))(
  ( (tuple2!13633 (_1!6827 (_ BitVec 64)) (_2!6827 V!32881)) )
))
(declare-datatypes ((List!19418 0))(
  ( (Nil!19415) (Cons!19414 (h!20582 tuple2!13632) (t!27771 List!19418)) )
))
(declare-datatypes ((ListLongMap!12331 0))(
  ( (ListLongMap!12332 (toList!6181 List!19418)) )
))
(declare-fun contains!5290 (ListLongMap!12331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3414 (array!58002 array!58004 (_ BitVec 32) (_ BitVec 32) V!32881 V!32881 (_ BitVec 32) Int) ListLongMap!12331)

(assert (=> b!955903 (= lt!430323 (contains!5290 (getCurrentListMap!3414 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27876 _keys!1441) i!735)))))

(declare-fun b!955904 () Bool)

(assert (=> b!955904 (= e!538615 tp_is_empty!20923)))

(declare-fun b!955905 () Bool)

(declare-fun res!639850 () Bool)

(assert (=> b!955905 (=> (not res!639850) (not e!538613))))

(declare-datatypes ((List!19419 0))(
  ( (Nil!19416) (Cons!19415 (h!20583 (_ BitVec 64)) (t!27772 List!19419)) )
))
(declare-fun arrayNoDuplicates!0 (array!58002 (_ BitVec 32) List!19419) Bool)

(assert (=> b!955905 (= res!639850 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19416))))

(assert (= (and start!82052 res!639849) b!955900))

(assert (= (and b!955900 res!639851) b!955898))

(assert (= (and b!955898 res!639853) b!955905))

(assert (= (and b!955905 res!639850) b!955902))

(assert (= (and b!955902 res!639852) b!955901))

(assert (= (and b!955901 res!639854) b!955903))

(assert (= (and b!955899 condMapEmpty!33346) mapIsEmpty!33346))

(assert (= (and b!955899 (not condMapEmpty!33346)) mapNonEmpty!33346))

(get-info :version)

(assert (= (and mapNonEmpty!33346 ((_ is ValueCellFull!9980) mapValue!33346)) b!955904))

(assert (= (and b!955899 ((_ is ValueCellFull!9980) mapDefault!33346)) b!955897))

(assert (= start!82052 b!955899))

(declare-fun m!887877 () Bool)

(assert (=> b!955898 m!887877))

(declare-fun m!887879 () Bool)

(assert (=> start!82052 m!887879))

(declare-fun m!887881 () Bool)

(assert (=> start!82052 m!887881))

(declare-fun m!887883 () Bool)

(assert (=> start!82052 m!887883))

(declare-fun m!887885 () Bool)

(assert (=> mapNonEmpty!33346 m!887885))

(declare-fun m!887887 () Bool)

(assert (=> b!955901 m!887887))

(assert (=> b!955901 m!887887))

(declare-fun m!887889 () Bool)

(assert (=> b!955901 m!887889))

(declare-fun m!887891 () Bool)

(assert (=> b!955905 m!887891))

(declare-fun m!887893 () Bool)

(assert (=> b!955903 m!887893))

(assert (=> b!955903 m!887887))

(assert (=> b!955903 m!887893))

(assert (=> b!955903 m!887887))

(declare-fun m!887895 () Bool)

(assert (=> b!955903 m!887895))

(check-sat (not b!955903) tp_is_empty!20923 (not b!955901) (not mapNonEmpty!33346) (not b!955898) (not b_next!18379) (not start!82052) b_and!29875 (not b!955905))
(check-sat b_and!29875 (not b_next!18379))
