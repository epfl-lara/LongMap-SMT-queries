; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80568 () Bool)

(assert start!80568)

(declare-fun b!945235 () Bool)

(declare-fun b_free!18043 () Bool)

(declare-fun b_next!18043 () Bool)

(assert (=> b!945235 (= b_free!18043 (not b_next!18043))))

(declare-fun tp!62640 () Bool)

(declare-fun b_and!29471 () Bool)

(assert (=> b!945235 (= tp!62640 b_and!29471)))

(declare-fun b!945228 () Bool)

(declare-fun res!634726 () Bool)

(declare-fun e!531612 () Bool)

(assert (=> b!945228 (=> (not res!634726) (not e!531612))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32367 0))(
  ( (V!32368 (val!10326 Int)) )
))
(declare-datatypes ((ValueCell!9794 0))(
  ( (ValueCellFull!9794 (v!12855 V!32367)) (EmptyCell!9794) )
))
(declare-datatypes ((array!57121 0))(
  ( (array!57122 (arr!27481 (Array (_ BitVec 32) ValueCell!9794)) (size!27948 (_ BitVec 32))) )
))
(declare-datatypes ((array!57123 0))(
  ( (array!57124 (arr!27482 (Array (_ BitVec 32) (_ BitVec 64))) (size!27949 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4738 0))(
  ( (LongMapFixedSize!4739 (defaultEntry!5664 Int) (mask!27355 (_ BitVec 32)) (extraKeys!5396 (_ BitVec 32)) (zeroValue!5500 V!32367) (minValue!5500 V!32367) (_size!2424 (_ BitVec 32)) (_keys!10570 array!57123) (_values!5687 array!57121) (_vacant!2424 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4738)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9027 0))(
  ( (MissingZero!9027 (index!38479 (_ BitVec 32))) (Found!9027 (index!38480 (_ BitVec 32))) (Intermediate!9027 (undefined!9839 Bool) (index!38481 (_ BitVec 32)) (x!81084 (_ BitVec 32))) (Undefined!9027) (MissingVacant!9027 (index!38482 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57123 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!945228 (= res!634726 (not ((_ is Found!9027) (seekEntry!0 key!756 (_keys!10570 thiss!1141) (mask!27355 thiss!1141)))))))

(declare-fun b!945229 () Bool)

(declare-fun e!531614 () Bool)

(assert (=> b!945229 (= e!531614 true)))

(declare-fun lt!425954 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57123 (_ BitVec 32)) Bool)

(assert (=> b!945229 (= lt!425954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10570 thiss!1141) (mask!27355 thiss!1141)))))

(declare-fun b!945230 () Bool)

(assert (=> b!945230 (= e!531612 (not e!531614))))

(declare-fun res!634725 () Bool)

(assert (=> b!945230 (=> res!634725 e!531614)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945230 (= res!634725 (not (validMask!0 (mask!27355 thiss!1141))))))

(declare-fun lt!425956 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57123 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945230 (= lt!425956 (arrayScanForKey!0 (_keys!10570 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945230 (arrayContainsKey!0 (_keys!10570 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31824 0))(
  ( (Unit!31825) )
))
(declare-fun lt!425955 () Unit!31824)

(declare-fun lemmaKeyInListMapIsInArray!303 (array!57123 array!57121 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 64) Int) Unit!31824)

(assert (=> b!945230 (= lt!425955 (lemmaKeyInListMapIsInArray!303 (_keys!10570 thiss!1141) (_values!5687 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) key!756 (defaultEntry!5664 thiss!1141)))))

(declare-fun b!945231 () Bool)

(declare-fun res!634722 () Bool)

(assert (=> b!945231 (=> (not res!634722) (not e!531612))))

(declare-datatypes ((tuple2!13456 0))(
  ( (tuple2!13457 (_1!6739 (_ BitVec 64)) (_2!6739 V!32367)) )
))
(declare-datatypes ((List!19257 0))(
  ( (Nil!19254) (Cons!19253 (h!20410 tuple2!13456) (t!27566 List!19257)) )
))
(declare-datatypes ((ListLongMap!12155 0))(
  ( (ListLongMap!12156 (toList!6093 List!19257)) )
))
(declare-fun contains!5176 (ListLongMap!12155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3327 (array!57123 array!57121 (_ BitVec 32) (_ BitVec 32) V!32367 V!32367 (_ BitVec 32) Int) ListLongMap!12155)

(assert (=> b!945231 (= res!634722 (contains!5176 (getCurrentListMap!3327 (_keys!10570 thiss!1141) (_values!5687 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5396 thiss!1141) (zeroValue!5500 thiss!1141) (minValue!5500 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5664 thiss!1141)) key!756))))

(declare-fun b!945232 () Bool)

(declare-fun e!531611 () Bool)

(declare-fun tp_is_empty!20551 () Bool)

(assert (=> b!945232 (= e!531611 tp_is_empty!20551)))

(declare-fun b!945233 () Bool)

(declare-fun e!531616 () Bool)

(assert (=> b!945233 (= e!531616 tp_is_empty!20551)))

(declare-fun mapIsEmpty!32652 () Bool)

(declare-fun mapRes!32652 () Bool)

(assert (=> mapIsEmpty!32652 mapRes!32652))

(declare-fun b!945234 () Bool)

(declare-fun e!531613 () Bool)

(assert (=> b!945234 (= e!531613 (and e!531616 mapRes!32652))))

(declare-fun condMapEmpty!32652 () Bool)

(declare-fun mapDefault!32652 () ValueCell!9794)

(assert (=> b!945234 (= condMapEmpty!32652 (= (arr!27481 (_values!5687 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9794)) mapDefault!32652)))))

(declare-fun e!531610 () Bool)

(declare-fun array_inv!21436 (array!57123) Bool)

(declare-fun array_inv!21437 (array!57121) Bool)

(assert (=> b!945235 (= e!531610 (and tp!62640 tp_is_empty!20551 (array_inv!21436 (_keys!10570 thiss!1141)) (array_inv!21437 (_values!5687 thiss!1141)) e!531613))))

(declare-fun b!945236 () Bool)

(declare-fun res!634724 () Bool)

(assert (=> b!945236 (=> res!634724 e!531614)))

(assert (=> b!945236 (= res!634724 (or (not (= (size!27949 (_keys!10570 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27355 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27949 (_keys!10570 thiss!1141))) (bvslt lt!425956 #b00000000000000000000000000000000) (bvsgt lt!425956 (size!27949 (_keys!10570 thiss!1141)))))))

(declare-fun res!634723 () Bool)

(assert (=> start!80568 (=> (not res!634723) (not e!531612))))

(declare-fun valid!1819 (LongMapFixedSize!4738) Bool)

(assert (=> start!80568 (= res!634723 (valid!1819 thiss!1141))))

(assert (=> start!80568 e!531612))

(assert (=> start!80568 e!531610))

(assert (=> start!80568 true))

(declare-fun b!945237 () Bool)

(declare-fun res!634727 () Bool)

(assert (=> b!945237 (=> (not res!634727) (not e!531612))))

(assert (=> b!945237 (= res!634727 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32652 () Bool)

(declare-fun tp!62639 () Bool)

(assert (=> mapNonEmpty!32652 (= mapRes!32652 (and tp!62639 e!531611))))

(declare-fun mapKey!32652 () (_ BitVec 32))

(declare-fun mapValue!32652 () ValueCell!9794)

(declare-fun mapRest!32652 () (Array (_ BitVec 32) ValueCell!9794))

(assert (=> mapNonEmpty!32652 (= (arr!27481 (_values!5687 thiss!1141)) (store mapRest!32652 mapKey!32652 mapValue!32652))))

(assert (= (and start!80568 res!634723) b!945237))

(assert (= (and b!945237 res!634727) b!945228))

(assert (= (and b!945228 res!634726) b!945231))

(assert (= (and b!945231 res!634722) b!945230))

(assert (= (and b!945230 (not res!634725)) b!945236))

(assert (= (and b!945236 (not res!634724)) b!945229))

(assert (= (and b!945234 condMapEmpty!32652) mapIsEmpty!32652))

(assert (= (and b!945234 (not condMapEmpty!32652)) mapNonEmpty!32652))

(assert (= (and mapNonEmpty!32652 ((_ is ValueCellFull!9794) mapValue!32652)) b!945232))

(assert (= (and b!945234 ((_ is ValueCellFull!9794) mapDefault!32652)) b!945233))

(assert (= b!945235 b!945234))

(assert (= start!80568 b!945235))

(declare-fun m!879643 () Bool)

(assert (=> start!80568 m!879643))

(declare-fun m!879645 () Bool)

(assert (=> b!945229 m!879645))

(declare-fun m!879647 () Bool)

(assert (=> b!945235 m!879647))

(declare-fun m!879649 () Bool)

(assert (=> b!945235 m!879649))

(declare-fun m!879651 () Bool)

(assert (=> b!945231 m!879651))

(assert (=> b!945231 m!879651))

(declare-fun m!879653 () Bool)

(assert (=> b!945231 m!879653))

(declare-fun m!879655 () Bool)

(assert (=> b!945228 m!879655))

(declare-fun m!879657 () Bool)

(assert (=> b!945230 m!879657))

(declare-fun m!879659 () Bool)

(assert (=> b!945230 m!879659))

(declare-fun m!879661 () Bool)

(assert (=> b!945230 m!879661))

(declare-fun m!879663 () Bool)

(assert (=> b!945230 m!879663))

(declare-fun m!879665 () Bool)

(assert (=> mapNonEmpty!32652 m!879665))

(check-sat (not b!945235) (not start!80568) (not mapNonEmpty!32652) (not b!945230) (not b!945228) tp_is_empty!20551 b_and!29471 (not b!945229) (not b_next!18043) (not b!945231))
(check-sat b_and!29471 (not b_next!18043))
