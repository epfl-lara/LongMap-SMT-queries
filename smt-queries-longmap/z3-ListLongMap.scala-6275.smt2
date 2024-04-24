; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80440 () Bool)

(assert start!80440)

(declare-fun b!943813 () Bool)

(declare-fun b_free!17971 () Bool)

(declare-fun b_next!17971 () Bool)

(assert (=> b!943813 (= b_free!17971 (not b_next!17971))))

(declare-fun tp!62420 () Bool)

(declare-fun b_and!29393 () Bool)

(assert (=> b!943813 (= tp!62420 b_and!29393)))

(declare-fun b!943807 () Bool)

(declare-fun res!633932 () Bool)

(declare-fun e!530732 () Bool)

(assert (=> b!943807 (=> (not res!633932) (not e!530732))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943807 (= res!633932 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32540 () Bool)

(declare-fun mapRes!32540 () Bool)

(assert (=> mapIsEmpty!32540 mapRes!32540))

(declare-fun res!633930 () Bool)

(assert (=> start!80440 (=> (not res!633930) (not e!530732))))

(declare-datatypes ((V!32271 0))(
  ( (V!32272 (val!10290 Int)) )
))
(declare-datatypes ((ValueCell!9758 0))(
  ( (ValueCellFull!9758 (v!12818 V!32271)) (EmptyCell!9758) )
))
(declare-datatypes ((array!56975 0))(
  ( (array!56976 (arr!27409 (Array (_ BitVec 32) ValueCell!9758)) (size!27875 (_ BitVec 32))) )
))
(declare-datatypes ((array!56977 0))(
  ( (array!56978 (arr!27410 (Array (_ BitVec 32) (_ BitVec 64))) (size!27876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4666 0))(
  ( (LongMapFixedSize!4667 (defaultEntry!5624 Int) (mask!27285 (_ BitVec 32)) (extraKeys!5356 (_ BitVec 32)) (zeroValue!5460 V!32271) (minValue!5460 V!32271) (_size!2388 (_ BitVec 32)) (_keys!10526 array!56977) (_values!5647 array!56975) (_vacant!2388 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4666)

(declare-fun valid!1792 (LongMapFixedSize!4666) Bool)

(assert (=> start!80440 (= res!633930 (valid!1792 thiss!1141))))

(assert (=> start!80440 e!530732))

(declare-fun e!530735 () Bool)

(assert (=> start!80440 e!530735))

(assert (=> start!80440 true))

(declare-fun b!943808 () Bool)

(declare-fun e!530734 () Bool)

(declare-fun tp_is_empty!20479 () Bool)

(assert (=> b!943808 (= e!530734 tp_is_empty!20479)))

(declare-fun b!943809 () Bool)

(declare-fun e!530733 () Bool)

(assert (=> b!943809 (= e!530733 (and e!530734 mapRes!32540))))

(declare-fun condMapEmpty!32540 () Bool)

(declare-fun mapDefault!32540 () ValueCell!9758)

(assert (=> b!943809 (= condMapEmpty!32540 (= (arr!27409 (_values!5647 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9758)) mapDefault!32540)))))

(declare-fun b!943810 () Bool)

(declare-fun res!633931 () Bool)

(assert (=> b!943810 (=> (not res!633931) (not e!530732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56977 (_ BitVec 32)) Bool)

(assert (=> b!943810 (= res!633931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10526 thiss!1141) (mask!27285 thiss!1141)))))

(declare-fun b!943811 () Bool)

(declare-fun res!633929 () Bool)

(assert (=> b!943811 (=> (not res!633929) (not e!530732))))

(declare-datatypes ((tuple2!13404 0))(
  ( (tuple2!13405 (_1!6713 (_ BitVec 64)) (_2!6713 V!32271)) )
))
(declare-datatypes ((List!19217 0))(
  ( (Nil!19214) (Cons!19213 (h!20369 tuple2!13404) (t!27524 List!19217)) )
))
(declare-datatypes ((ListLongMap!12103 0))(
  ( (ListLongMap!12104 (toList!6067 List!19217)) )
))
(declare-fun contains!5148 (ListLongMap!12103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3301 (array!56977 array!56975 (_ BitVec 32) (_ BitVec 32) V!32271 V!32271 (_ BitVec 32) Int) ListLongMap!12103)

(assert (=> b!943811 (= res!633929 (contains!5148 (getCurrentListMap!3301 (_keys!10526 thiss!1141) (_values!5647 thiss!1141) (mask!27285 thiss!1141) (extraKeys!5356 thiss!1141) (zeroValue!5460 thiss!1141) (minValue!5460 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5624 thiss!1141)) key!756))))

(declare-fun b!943812 () Bool)

(declare-fun e!530736 () Bool)

(assert (=> b!943812 (= e!530736 tp_is_empty!20479)))

(declare-fun array_inv!21388 (array!56977) Bool)

(declare-fun array_inv!21389 (array!56975) Bool)

(assert (=> b!943813 (= e!530735 (and tp!62420 tp_is_empty!20479 (array_inv!21388 (_keys!10526 thiss!1141)) (array_inv!21389 (_values!5647 thiss!1141)) e!530733))))

(declare-fun b!943814 () Bool)

(declare-fun res!633928 () Bool)

(assert (=> b!943814 (=> (not res!633928) (not e!530732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943814 (= res!633928 (validMask!0 (mask!27285 thiss!1141)))))

(declare-fun mapNonEmpty!32540 () Bool)

(declare-fun tp!62419 () Bool)

(assert (=> mapNonEmpty!32540 (= mapRes!32540 (and tp!62419 e!530736))))

(declare-fun mapKey!32540 () (_ BitVec 32))

(declare-fun mapValue!32540 () ValueCell!9758)

(declare-fun mapRest!32540 () (Array (_ BitVec 32) ValueCell!9758))

(assert (=> mapNonEmpty!32540 (= (arr!27409 (_values!5647 thiss!1141)) (store mapRest!32540 mapKey!32540 mapValue!32540))))

(declare-fun b!943815 () Bool)

(declare-fun res!633934 () Bool)

(assert (=> b!943815 (=> (not res!633934) (not e!530732))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8999 0))(
  ( (MissingZero!8999 (index!38367 (_ BitVec 32))) (Found!8999 (index!38368 (_ BitVec 32))) (Intermediate!8999 (undefined!9811 Bool) (index!38369 (_ BitVec 32)) (x!80942 (_ BitVec 32))) (Undefined!8999) (MissingVacant!8999 (index!38370 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56977 (_ BitVec 32)) SeekEntryResult!8999)

(assert (=> b!943815 (= res!633934 (not ((_ is Found!8999) (seekEntry!0 key!756 (_keys!10526 thiss!1141) (mask!27285 thiss!1141)))))))

(declare-fun b!943816 () Bool)

(assert (=> b!943816 (= e!530732 false)))

(declare-fun lt!425567 () Bool)

(declare-datatypes ((List!19218 0))(
  ( (Nil!19215) (Cons!19214 (h!20370 (_ BitVec 64)) (t!27525 List!19218)) )
))
(declare-fun arrayNoDuplicates!0 (array!56977 (_ BitVec 32) List!19218) Bool)

(assert (=> b!943816 (= lt!425567 (arrayNoDuplicates!0 (_keys!10526 thiss!1141) #b00000000000000000000000000000000 Nil!19215))))

(declare-fun b!943817 () Bool)

(declare-fun res!633933 () Bool)

(assert (=> b!943817 (=> (not res!633933) (not e!530732))))

(assert (=> b!943817 (= res!633933 (and (= (size!27875 (_values!5647 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27285 thiss!1141))) (= (size!27876 (_keys!10526 thiss!1141)) (size!27875 (_values!5647 thiss!1141))) (bvsge (mask!27285 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5356 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5356 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80440 res!633930) b!943807))

(assert (= (and b!943807 res!633932) b!943815))

(assert (= (and b!943815 res!633934) b!943811))

(assert (= (and b!943811 res!633929) b!943814))

(assert (= (and b!943814 res!633928) b!943817))

(assert (= (and b!943817 res!633933) b!943810))

(assert (= (and b!943810 res!633931) b!943816))

(assert (= (and b!943809 condMapEmpty!32540) mapIsEmpty!32540))

(assert (= (and b!943809 (not condMapEmpty!32540)) mapNonEmpty!32540))

(assert (= (and mapNonEmpty!32540 ((_ is ValueCellFull!9758) mapValue!32540)) b!943812))

(assert (= (and b!943809 ((_ is ValueCellFull!9758) mapDefault!32540)) b!943808))

(assert (= b!943813 b!943809))

(assert (= start!80440 b!943813))

(declare-fun m!878573 () Bool)

(assert (=> b!943810 m!878573))

(declare-fun m!878575 () Bool)

(assert (=> b!943815 m!878575))

(declare-fun m!878577 () Bool)

(assert (=> b!943813 m!878577))

(declare-fun m!878579 () Bool)

(assert (=> b!943813 m!878579))

(declare-fun m!878581 () Bool)

(assert (=> b!943811 m!878581))

(assert (=> b!943811 m!878581))

(declare-fun m!878583 () Bool)

(assert (=> b!943811 m!878583))

(declare-fun m!878585 () Bool)

(assert (=> start!80440 m!878585))

(declare-fun m!878587 () Bool)

(assert (=> mapNonEmpty!32540 m!878587))

(declare-fun m!878589 () Bool)

(assert (=> b!943814 m!878589))

(declare-fun m!878591 () Bool)

(assert (=> b!943816 m!878591))

(check-sat (not b!943813) (not b!943814) (not b!943816) (not mapNonEmpty!32540) (not b!943815) (not b!943811) (not start!80440) (not b_next!17971) tp_is_empty!20479 (not b!943810) b_and!29393)
(check-sat b_and!29393 (not b_next!17971))
