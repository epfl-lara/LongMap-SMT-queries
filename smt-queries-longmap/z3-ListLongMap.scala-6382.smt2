; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82212 () Bool)

(assert start!82212)

(declare-fun b_free!18451 () Bool)

(declare-fun b_next!18451 () Bool)

(assert (=> start!82212 (= b_free!18451 (not b_next!18451))))

(declare-fun tp!64165 () Bool)

(declare-fun b_and!29949 () Bool)

(assert (=> start!82212 (= tp!64165 b_and!29949)))

(declare-fun b!957718 () Bool)

(declare-fun res!640960 () Bool)

(declare-fun e!539764 () Bool)

(assert (=> b!957718 (=> (not res!640960) (not e!539764))))

(declare-datatypes ((array!58272 0))(
  ( (array!58273 (arr!28010 (Array (_ BitVec 32) (_ BitVec 64))) (size!28490 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58272)

(declare-datatypes ((List!19492 0))(
  ( (Nil!19489) (Cons!19488 (h!20656 (_ BitVec 64)) (t!27847 List!19492)) )
))
(declare-fun arrayNoDuplicates!0 (array!58272 (_ BitVec 32) List!19492) Bool)

(assert (=> b!957718 (= res!640960 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19489))))

(declare-fun b!957719 () Bool)

(declare-fun res!640958 () Bool)

(assert (=> b!957719 (=> (not res!640958) (not e!539764))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!957719 (= res!640958 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28490 _keys!1441))))))

(declare-fun mapNonEmpty!33565 () Bool)

(declare-fun mapRes!33565 () Bool)

(declare-fun tp!64164 () Bool)

(declare-fun e!539765 () Bool)

(assert (=> mapNonEmpty!33565 (= mapRes!33565 (and tp!64164 e!539765))))

(declare-datatypes ((V!33073 0))(
  ( (V!33074 (val!10584 Int)) )
))
(declare-datatypes ((ValueCell!10052 0))(
  ( (ValueCellFull!10052 (v!13137 V!33073)) (EmptyCell!10052) )
))
(declare-fun mapValue!33565 () ValueCell!10052)

(declare-fun mapRest!33565 () (Array (_ BitVec 32) ValueCell!10052))

(declare-fun mapKey!33565 () (_ BitVec 32))

(declare-datatypes ((array!58274 0))(
  ( (array!58275 (arr!28011 (Array (_ BitVec 32) ValueCell!10052)) (size!28491 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58274)

(assert (=> mapNonEmpty!33565 (= (arr!28011 _values!1197) (store mapRest!33565 mapKey!33565 mapValue!33565))))

(declare-fun b!957720 () Bool)

(declare-fun e!539763 () Bool)

(declare-fun tp_is_empty!21067 () Bool)

(assert (=> b!957720 (= e!539763 tp_is_empty!21067)))

(declare-fun b!957721 () Bool)

(assert (=> b!957721 (= e!539765 tp_is_empty!21067)))

(declare-fun b!957722 () Bool)

(declare-fun res!640962 () Bool)

(assert (=> b!957722 (=> (not res!640962) (not e!539764))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58272 (_ BitVec 32)) Bool)

(assert (=> b!957722 (= res!640962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640959 () Bool)

(assert (=> start!82212 (=> (not res!640959) (not e!539764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82212 (= res!640959 (validMask!0 mask!1823))))

(assert (=> start!82212 e!539764))

(assert (=> start!82212 true))

(assert (=> start!82212 tp_is_empty!21067))

(declare-fun array_inv!21803 (array!58272) Bool)

(assert (=> start!82212 (array_inv!21803 _keys!1441)))

(declare-fun e!539767 () Bool)

(declare-fun array_inv!21804 (array!58274) Bool)

(assert (=> start!82212 (and (array_inv!21804 _values!1197) e!539767)))

(assert (=> start!82212 tp!64165))

(declare-fun b!957723 () Bool)

(declare-fun res!640963 () Bool)

(assert (=> b!957723 (=> (not res!640963) (not e!539764))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!957723 (= res!640963 (and (= (size!28491 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28490 _keys!1441) (size!28491 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957724 () Bool)

(assert (=> b!957724 (= e!539764 (not true))))

(declare-fun zeroValue!1139 () V!33073)

(declare-fun minValue!1139 () V!33073)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13682 0))(
  ( (tuple2!13683 (_1!6852 (_ BitVec 64)) (_2!6852 V!33073)) )
))
(declare-datatypes ((List!19493 0))(
  ( (Nil!19490) (Cons!19489 (h!20657 tuple2!13682) (t!27848 List!19493)) )
))
(declare-datatypes ((ListLongMap!12381 0))(
  ( (ListLongMap!12382 (toList!6206 List!19493)) )
))
(declare-fun contains!5316 (ListLongMap!12381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3439 (array!58272 array!58274 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) Int) ListLongMap!12381)

(assert (=> b!957724 (contains!5316 (getCurrentListMap!3439 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!28010 _keys!1441) i!735))))

(declare-datatypes ((Unit!32114 0))(
  ( (Unit!32115) )
))
(declare-fun lt!430617 () Unit!32114)

(declare-fun lemmaInListMapFromThenFromZero!20 (array!58272 array!58274 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) (_ BitVec 32) Int) Unit!32114)

(assert (=> b!957724 (= lt!430617 (lemmaInListMapFromThenFromZero!20 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!957725 () Bool)

(declare-fun res!640964 () Bool)

(assert (=> b!957725 (=> (not res!640964) (not e!539764))))

(assert (=> b!957725 (= res!640964 (contains!5316 (getCurrentListMap!3439 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!28010 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33565 () Bool)

(assert (=> mapIsEmpty!33565 mapRes!33565))

(declare-fun b!957726 () Bool)

(assert (=> b!957726 (= e!539767 (and e!539763 mapRes!33565))))

(declare-fun condMapEmpty!33565 () Bool)

(declare-fun mapDefault!33565 () ValueCell!10052)

(assert (=> b!957726 (= condMapEmpty!33565 (= (arr!28011 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10052)) mapDefault!33565)))))

(declare-fun b!957727 () Bool)

(declare-fun res!640961 () Bool)

(assert (=> b!957727 (=> (not res!640961) (not e!539764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957727 (= res!640961 (validKeyInArray!0 (select (arr!28010 _keys!1441) i!735)))))

(assert (= (and start!82212 res!640959) b!957723))

(assert (= (and b!957723 res!640963) b!957722))

(assert (= (and b!957722 res!640962) b!957718))

(assert (= (and b!957718 res!640960) b!957719))

(assert (= (and b!957719 res!640958) b!957727))

(assert (= (and b!957727 res!640961) b!957725))

(assert (= (and b!957725 res!640964) b!957724))

(assert (= (and b!957726 condMapEmpty!33565) mapIsEmpty!33565))

(assert (= (and b!957726 (not condMapEmpty!33565)) mapNonEmpty!33565))

(get-info :version)

(assert (= (and mapNonEmpty!33565 ((_ is ValueCellFull!10052) mapValue!33565)) b!957721))

(assert (= (and b!957726 ((_ is ValueCellFull!10052) mapDefault!33565)) b!957720))

(assert (= start!82212 b!957726))

(declare-fun m!889289 () Bool)

(assert (=> b!957724 m!889289))

(declare-fun m!889291 () Bool)

(assert (=> b!957724 m!889291))

(assert (=> b!957724 m!889289))

(assert (=> b!957724 m!889291))

(declare-fun m!889293 () Bool)

(assert (=> b!957724 m!889293))

(declare-fun m!889295 () Bool)

(assert (=> b!957724 m!889295))

(declare-fun m!889297 () Bool)

(assert (=> b!957718 m!889297))

(declare-fun m!889299 () Bool)

(assert (=> b!957725 m!889299))

(assert (=> b!957725 m!889291))

(assert (=> b!957725 m!889299))

(assert (=> b!957725 m!889291))

(declare-fun m!889301 () Bool)

(assert (=> b!957725 m!889301))

(assert (=> b!957727 m!889291))

(assert (=> b!957727 m!889291))

(declare-fun m!889303 () Bool)

(assert (=> b!957727 m!889303))

(declare-fun m!889305 () Bool)

(assert (=> start!82212 m!889305))

(declare-fun m!889307 () Bool)

(assert (=> start!82212 m!889307))

(declare-fun m!889309 () Bool)

(assert (=> start!82212 m!889309))

(declare-fun m!889311 () Bool)

(assert (=> mapNonEmpty!33565 m!889311))

(declare-fun m!889313 () Bool)

(assert (=> b!957722 m!889313))

(check-sat (not b!957727) (not b!957722) (not b_next!18451) (not b!957718) (not b!957725) b_and!29949 (not b!957724) tp_is_empty!21067 (not mapNonEmpty!33565) (not start!82212))
(check-sat b_and!29949 (not b_next!18451))
