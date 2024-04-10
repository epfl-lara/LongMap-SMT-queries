; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81898 () Bool)

(assert start!81898)

(declare-fun b_free!18393 () Bool)

(declare-fun b_next!18393 () Bool)

(assert (=> start!81898 (= b_free!18393 (not b_next!18393))))

(declare-fun tp!63879 () Bool)

(declare-fun b_and!29879 () Bool)

(assert (=> start!81898 (= tp!63879 b_and!29879)))

(declare-fun b!955197 () Bool)

(declare-fun e!538134 () Bool)

(declare-fun tp_is_empty!20937 () Bool)

(assert (=> b!955197 (= e!538134 tp_is_empty!20937)))

(declare-fun b!955198 () Bool)

(declare-fun res!639650 () Bool)

(declare-fun e!538135 () Bool)

(assert (=> b!955198 (=> (not res!639650) (not e!538135))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57979 0))(
  ( (array!57980 (arr!27869 (Array (_ BitVec 32) (_ BitVec 64))) (size!28348 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57979)

(assert (=> b!955198 (= res!639650 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28348 _keys!1441))))))

(declare-fun b!955199 () Bool)

(declare-fun e!538138 () Bool)

(declare-fun e!538137 () Bool)

(declare-fun mapRes!33367 () Bool)

(assert (=> b!955199 (= e!538138 (and e!538137 mapRes!33367))))

(declare-fun condMapEmpty!33367 () Bool)

(declare-datatypes ((V!32899 0))(
  ( (V!32900 (val!10519 Int)) )
))
(declare-datatypes ((ValueCell!9987 0))(
  ( (ValueCellFull!9987 (v!13074 V!32899)) (EmptyCell!9987) )
))
(declare-datatypes ((array!57981 0))(
  ( (array!57982 (arr!27870 (Array (_ BitVec 32) ValueCell!9987)) (size!28349 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57981)

(declare-fun mapDefault!33367 () ValueCell!9987)

(assert (=> b!955199 (= condMapEmpty!33367 (= (arr!27870 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9987)) mapDefault!33367)))))

(declare-fun mapNonEmpty!33367 () Bool)

(declare-fun tp!63878 () Bool)

(assert (=> mapNonEmpty!33367 (= mapRes!33367 (and tp!63878 e!538134))))

(declare-fun mapRest!33367 () (Array (_ BitVec 32) ValueCell!9987))

(declare-fun mapValue!33367 () ValueCell!9987)

(declare-fun mapKey!33367 () (_ BitVec 32))

(assert (=> mapNonEmpty!33367 (= (arr!27870 _values!1197) (store mapRest!33367 mapKey!33367 mapValue!33367))))

(declare-fun res!639647 () Bool)

(assert (=> start!81898 (=> (not res!639647) (not e!538135))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81898 (= res!639647 (validMask!0 mask!1823))))

(assert (=> start!81898 e!538135))

(assert (=> start!81898 true))

(assert (=> start!81898 tp_is_empty!20937))

(declare-fun array_inv!21629 (array!57979) Bool)

(assert (=> start!81898 (array_inv!21629 _keys!1441)))

(declare-fun array_inv!21630 (array!57981) Bool)

(assert (=> start!81898 (and (array_inv!21630 _values!1197) e!538138)))

(assert (=> start!81898 tp!63879))

(declare-fun b!955200 () Bool)

(assert (=> b!955200 (= e!538135 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32899)

(declare-fun minValue!1139 () V!32899)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13648 0))(
  ( (tuple2!13649 (_1!6835 (_ BitVec 64)) (_2!6835 V!32899)) )
))
(declare-datatypes ((List!19424 0))(
  ( (Nil!19421) (Cons!19420 (h!20582 tuple2!13648) (t!27785 List!19424)) )
))
(declare-datatypes ((ListLongMap!12345 0))(
  ( (ListLongMap!12346 (toList!6188 List!19424)) )
))
(declare-fun contains!5286 (ListLongMap!12345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3421 (array!57979 array!57981 (_ BitVec 32) (_ BitVec 32) V!32899 V!32899 (_ BitVec 32) Int) ListLongMap!12345)

(assert (=> b!955200 (contains!5286 (getCurrentListMap!3421 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27869 _keys!1441) i!735))))

(declare-datatypes ((Unit!32097 0))(
  ( (Unit!32098) )
))
(declare-fun lt!429983 () Unit!32097)

(declare-fun lemmaInListMapFromThenFromZero!3 (array!57979 array!57981 (_ BitVec 32) (_ BitVec 32) V!32899 V!32899 (_ BitVec 32) (_ BitVec 32) Int) Unit!32097)

(assert (=> b!955200 (= lt!429983 (lemmaInListMapFromThenFromZero!3 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955201 () Bool)

(declare-fun res!639651 () Bool)

(assert (=> b!955201 (=> (not res!639651) (not e!538135))))

(assert (=> b!955201 (= res!639651 (and (= (size!28349 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28348 _keys!1441) (size!28349 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33367 () Bool)

(assert (=> mapIsEmpty!33367 mapRes!33367))

(declare-fun b!955202 () Bool)

(assert (=> b!955202 (= e!538137 tp_is_empty!20937)))

(declare-fun b!955203 () Bool)

(declare-fun res!639648 () Bool)

(assert (=> b!955203 (=> (not res!639648) (not e!538135))))

(assert (=> b!955203 (= res!639648 (contains!5286 (getCurrentListMap!3421 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27869 _keys!1441) i!735)))))

(declare-fun b!955204 () Bool)

(declare-fun res!639645 () Bool)

(assert (=> b!955204 (=> (not res!639645) (not e!538135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955204 (= res!639645 (validKeyInArray!0 (select (arr!27869 _keys!1441) i!735)))))

(declare-fun b!955205 () Bool)

(declare-fun res!639646 () Bool)

(assert (=> b!955205 (=> (not res!639646) (not e!538135))))

(declare-datatypes ((List!19425 0))(
  ( (Nil!19422) (Cons!19421 (h!20583 (_ BitVec 64)) (t!27786 List!19425)) )
))
(declare-fun arrayNoDuplicates!0 (array!57979 (_ BitVec 32) List!19425) Bool)

(assert (=> b!955205 (= res!639646 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19422))))

(declare-fun b!955206 () Bool)

(declare-fun res!639649 () Bool)

(assert (=> b!955206 (=> (not res!639649) (not e!538135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57979 (_ BitVec 32)) Bool)

(assert (=> b!955206 (= res!639649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!81898 res!639647) b!955201))

(assert (= (and b!955201 res!639651) b!955206))

(assert (= (and b!955206 res!639649) b!955205))

(assert (= (and b!955205 res!639646) b!955198))

(assert (= (and b!955198 res!639650) b!955204))

(assert (= (and b!955204 res!639645) b!955203))

(assert (= (and b!955203 res!639648) b!955200))

(assert (= (and b!955199 condMapEmpty!33367) mapIsEmpty!33367))

(assert (= (and b!955199 (not condMapEmpty!33367)) mapNonEmpty!33367))

(get-info :version)

(assert (= (and mapNonEmpty!33367 ((_ is ValueCellFull!9987) mapValue!33367)) b!955197))

(assert (= (and b!955199 ((_ is ValueCellFull!9987) mapDefault!33367)) b!955202))

(assert (= start!81898 b!955199))

(declare-fun m!886747 () Bool)

(assert (=> b!955204 m!886747))

(assert (=> b!955204 m!886747))

(declare-fun m!886749 () Bool)

(assert (=> b!955204 m!886749))

(declare-fun m!886751 () Bool)

(assert (=> start!81898 m!886751))

(declare-fun m!886753 () Bool)

(assert (=> start!81898 m!886753))

(declare-fun m!886755 () Bool)

(assert (=> start!81898 m!886755))

(declare-fun m!886757 () Bool)

(assert (=> b!955200 m!886757))

(assert (=> b!955200 m!886747))

(assert (=> b!955200 m!886757))

(assert (=> b!955200 m!886747))

(declare-fun m!886759 () Bool)

(assert (=> b!955200 m!886759))

(declare-fun m!886761 () Bool)

(assert (=> b!955200 m!886761))

(declare-fun m!886763 () Bool)

(assert (=> b!955205 m!886763))

(declare-fun m!886765 () Bool)

(assert (=> mapNonEmpty!33367 m!886765))

(declare-fun m!886767 () Bool)

(assert (=> b!955203 m!886767))

(assert (=> b!955203 m!886747))

(assert (=> b!955203 m!886767))

(assert (=> b!955203 m!886747))

(declare-fun m!886769 () Bool)

(assert (=> b!955203 m!886769))

(declare-fun m!886771 () Bool)

(assert (=> b!955206 m!886771))

(check-sat (not b!955200) (not b!955203) (not b!955204) tp_is_empty!20937 (not start!81898) (not b_next!18393) b_and!29879 (not b!955206) (not b!955205) (not mapNonEmpty!33367))
(check-sat b_and!29879 (not b_next!18393))
