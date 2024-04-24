; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80464 () Bool)

(assert start!80464)

(declare-fun b!944210 () Bool)

(declare-fun b_free!17995 () Bool)

(declare-fun b_next!17995 () Bool)

(assert (=> b!944210 (= b_free!17995 (not b_next!17995))))

(declare-fun tp!62492 () Bool)

(declare-fun b_and!29417 () Bool)

(assert (=> b!944210 (= tp!62492 b_and!29417)))

(declare-fun b!944203 () Bool)

(declare-fun e!530948 () Bool)

(assert (=> b!944203 (= e!530948 false)))

(declare-fun lt!425603 () Bool)

(declare-datatypes ((V!32303 0))(
  ( (V!32304 (val!10302 Int)) )
))
(declare-datatypes ((ValueCell!9770 0))(
  ( (ValueCellFull!9770 (v!12830 V!32303)) (EmptyCell!9770) )
))
(declare-datatypes ((array!57023 0))(
  ( (array!57024 (arr!27433 (Array (_ BitVec 32) ValueCell!9770)) (size!27899 (_ BitVec 32))) )
))
(declare-datatypes ((array!57025 0))(
  ( (array!57026 (arr!27434 (Array (_ BitVec 32) (_ BitVec 64))) (size!27900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4690 0))(
  ( (LongMapFixedSize!4691 (defaultEntry!5636 Int) (mask!27305 (_ BitVec 32)) (extraKeys!5368 (_ BitVec 32)) (zeroValue!5472 V!32303) (minValue!5472 V!32303) (_size!2400 (_ BitVec 32)) (_keys!10538 array!57025) (_values!5659 array!57023) (_vacant!2400 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4690)

(declare-datatypes ((List!19235 0))(
  ( (Nil!19232) (Cons!19231 (h!20387 (_ BitVec 64)) (t!27542 List!19235)) )
))
(declare-fun arrayNoDuplicates!0 (array!57025 (_ BitVec 32) List!19235) Bool)

(assert (=> b!944203 (= lt!425603 (arrayNoDuplicates!0 (_keys!10538 thiss!1141) #b00000000000000000000000000000000 Nil!19232))))

(declare-fun b!944204 () Bool)

(declare-fun e!530949 () Bool)

(declare-fun tp_is_empty!20503 () Bool)

(assert (=> b!944204 (= e!530949 tp_is_empty!20503)))

(declare-fun b!944205 () Bool)

(declare-fun res!634181 () Bool)

(assert (=> b!944205 (=> (not res!634181) (not e!530948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57025 (_ BitVec 32)) Bool)

(assert (=> b!944205 (= res!634181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10538 thiss!1141) (mask!27305 thiss!1141)))))

(declare-fun b!944206 () Bool)

(declare-fun res!634186 () Bool)

(assert (=> b!944206 (=> (not res!634186) (not e!530948))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9008 0))(
  ( (MissingZero!9008 (index!38403 (_ BitVec 32))) (Found!9008 (index!38404 (_ BitVec 32))) (Intermediate!9008 (undefined!9820 Bool) (index!38405 (_ BitVec 32)) (x!80983 (_ BitVec 32))) (Undefined!9008) (MissingVacant!9008 (index!38406 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57025 (_ BitVec 32)) SeekEntryResult!9008)

(assert (=> b!944206 (= res!634186 (not ((_ is Found!9008) (seekEntry!0 key!756 (_keys!10538 thiss!1141) (mask!27305 thiss!1141)))))))

(declare-fun res!634185 () Bool)

(assert (=> start!80464 (=> (not res!634185) (not e!530948))))

(declare-fun valid!1800 (LongMapFixedSize!4690) Bool)

(assert (=> start!80464 (= res!634185 (valid!1800 thiss!1141))))

(assert (=> start!80464 e!530948))

(declare-fun e!530951 () Bool)

(assert (=> start!80464 e!530951))

(assert (=> start!80464 true))

(declare-fun b!944207 () Bool)

(declare-fun res!634184 () Bool)

(assert (=> b!944207 (=> (not res!634184) (not e!530948))))

(assert (=> b!944207 (= res!634184 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944208 () Bool)

(declare-fun res!634180 () Bool)

(assert (=> b!944208 (=> (not res!634180) (not e!530948))))

(declare-datatypes ((tuple2!13422 0))(
  ( (tuple2!13423 (_1!6722 (_ BitVec 64)) (_2!6722 V!32303)) )
))
(declare-datatypes ((List!19236 0))(
  ( (Nil!19233) (Cons!19232 (h!20388 tuple2!13422) (t!27543 List!19236)) )
))
(declare-datatypes ((ListLongMap!12121 0))(
  ( (ListLongMap!12122 (toList!6076 List!19236)) )
))
(declare-fun contains!5157 (ListLongMap!12121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3310 (array!57025 array!57023 (_ BitVec 32) (_ BitVec 32) V!32303 V!32303 (_ BitVec 32) Int) ListLongMap!12121)

(assert (=> b!944208 (= res!634180 (contains!5157 (getCurrentListMap!3310 (_keys!10538 thiss!1141) (_values!5659 thiss!1141) (mask!27305 thiss!1141) (extraKeys!5368 thiss!1141) (zeroValue!5472 thiss!1141) (minValue!5472 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5636 thiss!1141)) key!756))))

(declare-fun b!944209 () Bool)

(declare-fun res!634182 () Bool)

(assert (=> b!944209 (=> (not res!634182) (not e!530948))))

(assert (=> b!944209 (= res!634182 (and (= (size!27899 (_values!5659 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27305 thiss!1141))) (= (size!27900 (_keys!10538 thiss!1141)) (size!27899 (_values!5659 thiss!1141))) (bvsge (mask!27305 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5368 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5368 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32576 () Bool)

(declare-fun mapRes!32576 () Bool)

(declare-fun tp!62491 () Bool)

(assert (=> mapNonEmpty!32576 (= mapRes!32576 (and tp!62491 e!530949))))

(declare-fun mapRest!32576 () (Array (_ BitVec 32) ValueCell!9770))

(declare-fun mapValue!32576 () ValueCell!9770)

(declare-fun mapKey!32576 () (_ BitVec 32))

(assert (=> mapNonEmpty!32576 (= (arr!27433 (_values!5659 thiss!1141)) (store mapRest!32576 mapKey!32576 mapValue!32576))))

(declare-fun e!530952 () Bool)

(declare-fun array_inv!21404 (array!57025) Bool)

(declare-fun array_inv!21405 (array!57023) Bool)

(assert (=> b!944210 (= e!530951 (and tp!62492 tp_is_empty!20503 (array_inv!21404 (_keys!10538 thiss!1141)) (array_inv!21405 (_values!5659 thiss!1141)) e!530952))))

(declare-fun b!944211 () Bool)

(declare-fun e!530947 () Bool)

(assert (=> b!944211 (= e!530952 (and e!530947 mapRes!32576))))

(declare-fun condMapEmpty!32576 () Bool)

(declare-fun mapDefault!32576 () ValueCell!9770)

(assert (=> b!944211 (= condMapEmpty!32576 (= (arr!27433 (_values!5659 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9770)) mapDefault!32576)))))

(declare-fun b!944212 () Bool)

(declare-fun res!634183 () Bool)

(assert (=> b!944212 (=> (not res!634183) (not e!530948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944212 (= res!634183 (validMask!0 (mask!27305 thiss!1141)))))

(declare-fun mapIsEmpty!32576 () Bool)

(assert (=> mapIsEmpty!32576 mapRes!32576))

(declare-fun b!944213 () Bool)

(assert (=> b!944213 (= e!530947 tp_is_empty!20503)))

(assert (= (and start!80464 res!634185) b!944207))

(assert (= (and b!944207 res!634184) b!944206))

(assert (= (and b!944206 res!634186) b!944208))

(assert (= (and b!944208 res!634180) b!944212))

(assert (= (and b!944212 res!634183) b!944209))

(assert (= (and b!944209 res!634182) b!944205))

(assert (= (and b!944205 res!634181) b!944203))

(assert (= (and b!944211 condMapEmpty!32576) mapIsEmpty!32576))

(assert (= (and b!944211 (not condMapEmpty!32576)) mapNonEmpty!32576))

(assert (= (and mapNonEmpty!32576 ((_ is ValueCellFull!9770) mapValue!32576)) b!944204))

(assert (= (and b!944211 ((_ is ValueCellFull!9770) mapDefault!32576)) b!944213))

(assert (= b!944210 b!944211))

(assert (= start!80464 b!944210))

(declare-fun m!878813 () Bool)

(assert (=> b!944205 m!878813))

(declare-fun m!878815 () Bool)

(assert (=> start!80464 m!878815))

(declare-fun m!878817 () Bool)

(assert (=> b!944208 m!878817))

(assert (=> b!944208 m!878817))

(declare-fun m!878819 () Bool)

(assert (=> b!944208 m!878819))

(declare-fun m!878821 () Bool)

(assert (=> mapNonEmpty!32576 m!878821))

(declare-fun m!878823 () Bool)

(assert (=> b!944206 m!878823))

(declare-fun m!878825 () Bool)

(assert (=> b!944212 m!878825))

(declare-fun m!878827 () Bool)

(assert (=> b!944203 m!878827))

(declare-fun m!878829 () Bool)

(assert (=> b!944210 m!878829))

(declare-fun m!878831 () Bool)

(assert (=> b!944210 m!878831))

(check-sat (not b!944208) (not mapNonEmpty!32576) (not b!944203) (not start!80464) b_and!29417 (not b_next!17995) tp_is_empty!20503 (not b!944210) (not b!944205) (not b!944206) (not b!944212))
(check-sat b_and!29417 (not b_next!17995))
