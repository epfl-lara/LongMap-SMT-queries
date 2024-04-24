; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82070 () Bool)

(assert start!82070)

(declare-fun b_free!18397 () Bool)

(declare-fun b_next!18397 () Bool)

(assert (=> start!82070 (= b_free!18397 (not b_next!18397))))

(declare-fun tp!63892 () Bool)

(declare-fun b_and!29893 () Bool)

(assert (=> start!82070 (= tp!63892 b_and!29893)))

(declare-fun b!956160 () Bool)

(declare-fun res!640033 () Bool)

(declare-fun e!538749 () Bool)

(assert (=> b!956160 (=> (not res!640033) (not e!538749))))

(declare-datatypes ((array!58036 0))(
  ( (array!58037 (arr!27893 (Array (_ BitVec 32) (_ BitVec 64))) (size!28373 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58036)

(declare-datatypes ((List!19431 0))(
  ( (Nil!19428) (Cons!19427 (h!20595 (_ BitVec 64)) (t!27784 List!19431)) )
))
(declare-fun arrayNoDuplicates!0 (array!58036 (_ BitVec 32) List!19431) Bool)

(assert (=> b!956160 (= res!640033 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19428))))

(declare-fun b!956161 () Bool)

(declare-fun e!538750 () Bool)

(declare-fun tp_is_empty!20941 () Bool)

(assert (=> b!956161 (= e!538750 tp_is_empty!20941)))

(declare-fun b!956162 () Bool)

(assert (=> b!956162 (= e!538749 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32905 0))(
  ( (V!32906 (val!10521 Int)) )
))
(declare-fun zeroValue!1139 () V!32905)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9989 0))(
  ( (ValueCellFull!9989 (v!13073 V!32905)) (EmptyCell!9989) )
))
(declare-datatypes ((array!58038 0))(
  ( (array!58039 (arr!27894 (Array (_ BitVec 32) ValueCell!9989)) (size!28374 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58038)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32905)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13648 0))(
  ( (tuple2!13649 (_1!6835 (_ BitVec 64)) (_2!6835 V!32905)) )
))
(declare-datatypes ((List!19432 0))(
  ( (Nil!19429) (Cons!19428 (h!20596 tuple2!13648) (t!27785 List!19432)) )
))
(declare-datatypes ((ListLongMap!12347 0))(
  ( (ListLongMap!12348 (toList!6189 List!19432)) )
))
(declare-fun contains!5298 (ListLongMap!12347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3422 (array!58036 array!58038 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) Int) ListLongMap!12347)

(assert (=> b!956162 (contains!5298 (getCurrentListMap!3422 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27893 _keys!1441) i!735))))

(declare-datatypes ((Unit!32080 0))(
  ( (Unit!32081) )
))
(declare-fun lt!430350 () Unit!32080)

(declare-fun lemmaInListMapFromThenFromZero!5 (array!58036 array!58038 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) (_ BitVec 32) Int) Unit!32080)

(assert (=> b!956162 (= lt!430350 (lemmaInListMapFromThenFromZero!5 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956163 () Bool)

(declare-fun res!640032 () Bool)

(assert (=> b!956163 (=> (not res!640032) (not e!538749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956163 (= res!640032 (validKeyInArray!0 (select (arr!27893 _keys!1441) i!735)))))

(declare-fun b!956164 () Bool)

(declare-fun res!640037 () Bool)

(assert (=> b!956164 (=> (not res!640037) (not e!538749))))

(assert (=> b!956164 (= res!640037 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28373 _keys!1441))))))

(declare-fun b!956165 () Bool)

(declare-fun res!640031 () Bool)

(assert (=> b!956165 (=> (not res!640031) (not e!538749))))

(assert (=> b!956165 (= res!640031 (and (= (size!28374 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28373 _keys!1441) (size!28374 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33373 () Bool)

(declare-fun mapRes!33373 () Bool)

(assert (=> mapIsEmpty!33373 mapRes!33373))

(declare-fun mapNonEmpty!33373 () Bool)

(declare-fun tp!63891 () Bool)

(assert (=> mapNonEmpty!33373 (= mapRes!33373 (and tp!63891 e!538750))))

(declare-fun mapRest!33373 () (Array (_ BitVec 32) ValueCell!9989))

(declare-fun mapValue!33373 () ValueCell!9989)

(declare-fun mapKey!33373 () (_ BitVec 32))

(assert (=> mapNonEmpty!33373 (= (arr!27894 _values!1197) (store mapRest!33373 mapKey!33373 mapValue!33373))))

(declare-fun b!956166 () Bool)

(declare-fun e!538747 () Bool)

(assert (=> b!956166 (= e!538747 tp_is_empty!20941)))

(declare-fun b!956167 () Bool)

(declare-fun res!640034 () Bool)

(assert (=> b!956167 (=> (not res!640034) (not e!538749))))

(assert (=> b!956167 (= res!640034 (contains!5298 (getCurrentListMap!3422 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27893 _keys!1441) i!735)))))

(declare-fun res!640035 () Bool)

(assert (=> start!82070 (=> (not res!640035) (not e!538749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82070 (= res!640035 (validMask!0 mask!1823))))

(assert (=> start!82070 e!538749))

(assert (=> start!82070 true))

(assert (=> start!82070 tp_is_empty!20941))

(declare-fun array_inv!21725 (array!58036) Bool)

(assert (=> start!82070 (array_inv!21725 _keys!1441)))

(declare-fun e!538746 () Bool)

(declare-fun array_inv!21726 (array!58038) Bool)

(assert (=> start!82070 (and (array_inv!21726 _values!1197) e!538746)))

(assert (=> start!82070 tp!63892))

(declare-fun b!956168 () Bool)

(declare-fun res!640036 () Bool)

(assert (=> b!956168 (=> (not res!640036) (not e!538749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58036 (_ BitVec 32)) Bool)

(assert (=> b!956168 (= res!640036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956169 () Bool)

(assert (=> b!956169 (= e!538746 (and e!538747 mapRes!33373))))

(declare-fun condMapEmpty!33373 () Bool)

(declare-fun mapDefault!33373 () ValueCell!9989)

(assert (=> b!956169 (= condMapEmpty!33373 (= (arr!27894 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9989)) mapDefault!33373)))))

(assert (= (and start!82070 res!640035) b!956165))

(assert (= (and b!956165 res!640031) b!956168))

(assert (= (and b!956168 res!640036) b!956160))

(assert (= (and b!956160 res!640033) b!956164))

(assert (= (and b!956164 res!640037) b!956163))

(assert (= (and b!956163 res!640032) b!956167))

(assert (= (and b!956167 res!640034) b!956162))

(assert (= (and b!956169 condMapEmpty!33373) mapIsEmpty!33373))

(assert (= (and b!956169 (not condMapEmpty!33373)) mapNonEmpty!33373))

(get-info :version)

(assert (= (and mapNonEmpty!33373 ((_ is ValueCellFull!9989) mapValue!33373)) b!956161))

(assert (= (and b!956169 ((_ is ValueCellFull!9989) mapDefault!33373)) b!956166))

(assert (= start!82070 b!956169))

(declare-fun m!888093 () Bool)

(assert (=> start!82070 m!888093))

(declare-fun m!888095 () Bool)

(assert (=> start!82070 m!888095))

(declare-fun m!888097 () Bool)

(assert (=> start!82070 m!888097))

(declare-fun m!888099 () Bool)

(assert (=> b!956162 m!888099))

(declare-fun m!888101 () Bool)

(assert (=> b!956162 m!888101))

(assert (=> b!956162 m!888099))

(assert (=> b!956162 m!888101))

(declare-fun m!888103 () Bool)

(assert (=> b!956162 m!888103))

(declare-fun m!888105 () Bool)

(assert (=> b!956162 m!888105))

(declare-fun m!888107 () Bool)

(assert (=> b!956168 m!888107))

(declare-fun m!888109 () Bool)

(assert (=> mapNonEmpty!33373 m!888109))

(declare-fun m!888111 () Bool)

(assert (=> b!956160 m!888111))

(declare-fun m!888113 () Bool)

(assert (=> b!956167 m!888113))

(assert (=> b!956167 m!888101))

(assert (=> b!956167 m!888113))

(assert (=> b!956167 m!888101))

(declare-fun m!888115 () Bool)

(assert (=> b!956167 m!888115))

(assert (=> b!956163 m!888101))

(assert (=> b!956163 m!888101))

(declare-fun m!888117 () Bool)

(assert (=> b!956163 m!888117))

(check-sat (not b!956160) (not start!82070) (not mapNonEmpty!33373) (not b_next!18397) (not b!956163) tp_is_empty!20941 b_and!29893 (not b!956162) (not b!956167) (not b!956168))
(check-sat b_and!29893 (not b_next!18397))
