; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81892 () Bool)

(assert start!81892)

(declare-fun b_free!18387 () Bool)

(declare-fun b_next!18387 () Bool)

(assert (=> start!81892 (= b_free!18387 (not b_next!18387))))

(declare-fun tp!63861 () Bool)

(declare-fun b_and!29873 () Bool)

(assert (=> start!81892 (= tp!63861 b_and!29873)))

(declare-fun b!955107 () Bool)

(declare-fun res!639587 () Bool)

(declare-fun e!538091 () Bool)

(assert (=> b!955107 (=> (not res!639587) (not e!538091))))

(declare-datatypes ((array!57967 0))(
  ( (array!57968 (arr!27863 (Array (_ BitVec 32) (_ BitVec 64))) (size!28342 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57967)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57967 (_ BitVec 32)) Bool)

(assert (=> b!955107 (= res!639587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955108 () Bool)

(declare-fun e!538093 () Bool)

(declare-fun e!538089 () Bool)

(declare-fun mapRes!33358 () Bool)

(assert (=> b!955108 (= e!538093 (and e!538089 mapRes!33358))))

(declare-fun condMapEmpty!33358 () Bool)

(declare-datatypes ((V!32891 0))(
  ( (V!32892 (val!10516 Int)) )
))
(declare-datatypes ((ValueCell!9984 0))(
  ( (ValueCellFull!9984 (v!13071 V!32891)) (EmptyCell!9984) )
))
(declare-datatypes ((array!57969 0))(
  ( (array!57970 (arr!27864 (Array (_ BitVec 32) ValueCell!9984)) (size!28343 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57969)

(declare-fun mapDefault!33358 () ValueCell!9984)

(assert (=> b!955108 (= condMapEmpty!33358 (= (arr!27864 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9984)) mapDefault!33358)))))

(declare-fun b!955109 () Bool)

(declare-fun res!639586 () Bool)

(assert (=> b!955109 (=> (not res!639586) (not e!538091))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955109 (= res!639586 (validKeyInArray!0 (select (arr!27863 _keys!1441) i!735)))))

(declare-fun b!955110 () Bool)

(assert (=> b!955110 (= e!538091 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32891)

(declare-fun minValue!1139 () V!32891)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13644 0))(
  ( (tuple2!13645 (_1!6833 (_ BitVec 64)) (_2!6833 V!32891)) )
))
(declare-datatypes ((List!19420 0))(
  ( (Nil!19417) (Cons!19416 (h!20578 tuple2!13644) (t!27781 List!19420)) )
))
(declare-datatypes ((ListLongMap!12341 0))(
  ( (ListLongMap!12342 (toList!6186 List!19420)) )
))
(declare-fun contains!5284 (ListLongMap!12341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3419 (array!57967 array!57969 (_ BitVec 32) (_ BitVec 32) V!32891 V!32891 (_ BitVec 32) Int) ListLongMap!12341)

(assert (=> b!955110 (contains!5284 (getCurrentListMap!3419 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27863 _keys!1441) i!735))))

(declare-datatypes ((Unit!32093 0))(
  ( (Unit!32094) )
))
(declare-fun lt!429974 () Unit!32093)

(declare-fun lemmaInListMapFromThenFromZero!1 (array!57967 array!57969 (_ BitVec 32) (_ BitVec 32) V!32891 V!32891 (_ BitVec 32) (_ BitVec 32) Int) Unit!32093)

(assert (=> b!955110 (= lt!429974 (lemmaInListMapFromThenFromZero!1 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955111 () Bool)

(declare-fun res!639588 () Bool)

(assert (=> b!955111 (=> (not res!639588) (not e!538091))))

(assert (=> b!955111 (= res!639588 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28342 _keys!1441))))))

(declare-fun b!955112 () Bool)

(declare-fun res!639585 () Bool)

(assert (=> b!955112 (=> (not res!639585) (not e!538091))))

(declare-datatypes ((List!19421 0))(
  ( (Nil!19418) (Cons!19417 (h!20579 (_ BitVec 64)) (t!27782 List!19421)) )
))
(declare-fun arrayNoDuplicates!0 (array!57967 (_ BitVec 32) List!19421) Bool)

(assert (=> b!955112 (= res!639585 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19418))))

(declare-fun res!639582 () Bool)

(assert (=> start!81892 (=> (not res!639582) (not e!538091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81892 (= res!639582 (validMask!0 mask!1823))))

(assert (=> start!81892 e!538091))

(assert (=> start!81892 true))

(declare-fun tp_is_empty!20931 () Bool)

(assert (=> start!81892 tp_is_empty!20931))

(declare-fun array_inv!21625 (array!57967) Bool)

(assert (=> start!81892 (array_inv!21625 _keys!1441)))

(declare-fun array_inv!21626 (array!57969) Bool)

(assert (=> start!81892 (and (array_inv!21626 _values!1197) e!538093)))

(assert (=> start!81892 tp!63861))

(declare-fun b!955113 () Bool)

(declare-fun e!538090 () Bool)

(assert (=> b!955113 (= e!538090 tp_is_empty!20931)))

(declare-fun mapNonEmpty!33358 () Bool)

(declare-fun tp!63860 () Bool)

(assert (=> mapNonEmpty!33358 (= mapRes!33358 (and tp!63860 e!538090))))

(declare-fun mapValue!33358 () ValueCell!9984)

(declare-fun mapKey!33358 () (_ BitVec 32))

(declare-fun mapRest!33358 () (Array (_ BitVec 32) ValueCell!9984))

(assert (=> mapNonEmpty!33358 (= (arr!27864 _values!1197) (store mapRest!33358 mapKey!33358 mapValue!33358))))

(declare-fun b!955114 () Bool)

(assert (=> b!955114 (= e!538089 tp_is_empty!20931)))

(declare-fun b!955115 () Bool)

(declare-fun res!639584 () Bool)

(assert (=> b!955115 (=> (not res!639584) (not e!538091))))

(assert (=> b!955115 (= res!639584 (contains!5284 (getCurrentListMap!3419 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27863 _keys!1441) i!735)))))

(declare-fun b!955116 () Bool)

(declare-fun res!639583 () Bool)

(assert (=> b!955116 (=> (not res!639583) (not e!538091))))

(assert (=> b!955116 (= res!639583 (and (= (size!28343 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28342 _keys!1441) (size!28343 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33358 () Bool)

(assert (=> mapIsEmpty!33358 mapRes!33358))

(assert (= (and start!81892 res!639582) b!955116))

(assert (= (and b!955116 res!639583) b!955107))

(assert (= (and b!955107 res!639587) b!955112))

(assert (= (and b!955112 res!639585) b!955111))

(assert (= (and b!955111 res!639588) b!955109))

(assert (= (and b!955109 res!639586) b!955115))

(assert (= (and b!955115 res!639584) b!955110))

(assert (= (and b!955108 condMapEmpty!33358) mapIsEmpty!33358))

(assert (= (and b!955108 (not condMapEmpty!33358)) mapNonEmpty!33358))

(get-info :version)

(assert (= (and mapNonEmpty!33358 ((_ is ValueCellFull!9984) mapValue!33358)) b!955113))

(assert (= (and b!955108 ((_ is ValueCellFull!9984) mapDefault!33358)) b!955114))

(assert (= start!81892 b!955108))

(declare-fun m!886669 () Bool)

(assert (=> mapNonEmpty!33358 m!886669))

(declare-fun m!886671 () Bool)

(assert (=> b!955107 m!886671))

(declare-fun m!886673 () Bool)

(assert (=> b!955112 m!886673))

(declare-fun m!886675 () Bool)

(assert (=> b!955109 m!886675))

(assert (=> b!955109 m!886675))

(declare-fun m!886677 () Bool)

(assert (=> b!955109 m!886677))

(declare-fun m!886679 () Bool)

(assert (=> b!955110 m!886679))

(assert (=> b!955110 m!886675))

(assert (=> b!955110 m!886679))

(assert (=> b!955110 m!886675))

(declare-fun m!886681 () Bool)

(assert (=> b!955110 m!886681))

(declare-fun m!886683 () Bool)

(assert (=> b!955110 m!886683))

(declare-fun m!886685 () Bool)

(assert (=> b!955115 m!886685))

(assert (=> b!955115 m!886675))

(assert (=> b!955115 m!886685))

(assert (=> b!955115 m!886675))

(declare-fun m!886687 () Bool)

(assert (=> b!955115 m!886687))

(declare-fun m!886689 () Bool)

(assert (=> start!81892 m!886689))

(declare-fun m!886691 () Bool)

(assert (=> start!81892 m!886691))

(declare-fun m!886693 () Bool)

(assert (=> start!81892 m!886693))

(check-sat b_and!29873 (not b_next!18387) (not b!955109) tp_is_empty!20931 (not mapNonEmpty!33358) (not b!955107) (not start!81892) (not b!955115) (not b!955112) (not b!955110))
(check-sat b_and!29873 (not b_next!18387))
