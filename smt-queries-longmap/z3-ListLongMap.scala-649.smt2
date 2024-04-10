; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16244 () Bool)

(assert start!16244)

(declare-fun b!162075 () Bool)

(declare-fun b_free!3705 () Bool)

(declare-fun b_next!3705 () Bool)

(assert (=> b!162075 (= b_free!3705 (not b_next!3705))))

(declare-fun tp!13685 () Bool)

(declare-fun b_and!10119 () Bool)

(assert (=> b!162075 (= tp!13685 b_and!10119)))

(declare-fun mapIsEmpty!5948 () Bool)

(declare-fun mapRes!5948 () Bool)

(assert (=> mapIsEmpty!5948 mapRes!5948))

(declare-fun mapNonEmpty!5948 () Bool)

(declare-fun tp!13684 () Bool)

(declare-fun e!106090 () Bool)

(assert (=> mapNonEmpty!5948 (= mapRes!5948 (and tp!13684 e!106090))))

(declare-datatypes ((V!4323 0))(
  ( (V!4324 (val!1798 Int)) )
))
(declare-datatypes ((ValueCell!1410 0))(
  ( (ValueCellFull!1410 (v!3663 V!4323)) (EmptyCell!1410) )
))
(declare-fun mapRest!5948 () (Array (_ BitVec 32) ValueCell!1410))

(declare-fun mapValue!5948 () ValueCell!1410)

(declare-datatypes ((array!6093 0))(
  ( (array!6094 (arr!2891 (Array (_ BitVec 32) (_ BitVec 64))) (size!3175 (_ BitVec 32))) )
))
(declare-datatypes ((array!6095 0))(
  ( (array!6096 (arr!2892 (Array (_ BitVec 32) ValueCell!1410)) (size!3176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1728 0))(
  ( (LongMapFixedSize!1729 (defaultEntry!3306 Int) (mask!7916 (_ BitVec 32)) (extraKeys!3047 (_ BitVec 32)) (zeroValue!3149 V!4323) (minValue!3149 V!4323) (_size!913 (_ BitVec 32)) (_keys!5107 array!6093) (_values!3289 array!6095) (_vacant!913 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1728)

(declare-fun mapKey!5948 () (_ BitVec 32))

(assert (=> mapNonEmpty!5948 (= (arr!2892 (_values!3289 thiss!1248)) (store mapRest!5948 mapKey!5948 mapValue!5948))))

(declare-fun b!162070 () Bool)

(declare-fun e!106088 () Bool)

(declare-fun e!106089 () Bool)

(assert (=> b!162070 (= e!106088 e!106089)))

(declare-fun res!76783 () Bool)

(assert (=> b!162070 (=> (not res!76783) (not e!106089))))

(declare-datatypes ((SeekEntryResult!369 0))(
  ( (MissingZero!369 (index!3644 (_ BitVec 32))) (Found!369 (index!3645 (_ BitVec 32))) (Intermediate!369 (undefined!1181 Bool) (index!3646 (_ BitVec 32)) (x!17905 (_ BitVec 32))) (Undefined!369) (MissingVacant!369 (index!3647 (_ BitVec 32))) )
))
(declare-fun lt!82365 () SeekEntryResult!369)

(get-info :version)

(assert (=> b!162070 (= res!76783 (and (not ((_ is Undefined!369) lt!82365)) ((_ is MissingVacant!369) lt!82365)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6093 (_ BitVec 32)) SeekEntryResult!369)

(assert (=> b!162070 (= lt!82365 (seekEntryOrOpen!0 key!828 (_keys!5107 thiss!1248) (mask!7916 thiss!1248)))))

(declare-fun b!162071 () Bool)

(assert (=> b!162071 (= e!106089 false)))

(declare-fun lt!82366 () Bool)

(declare-fun v!309 () V!4323)

(declare-fun valid!785 (LongMapFixedSize!1728) Bool)

(declare-datatypes ((tuple2!2986 0))(
  ( (tuple2!2987 (_1!1504 Bool) (_2!1504 LongMapFixedSize!1728)) )
))
(declare-fun updateHelperNewKey!76 (LongMapFixedSize!1728 (_ BitVec 64) V!4323 (_ BitVec 32)) tuple2!2986)

(assert (=> b!162071 (= lt!82366 (valid!785 (_2!1504 (updateHelperNewKey!76 thiss!1248 key!828 v!309 (index!3647 lt!82365)))))))

(declare-fun b!162073 () Bool)

(declare-fun e!106092 () Bool)

(declare-fun e!106087 () Bool)

(assert (=> b!162073 (= e!106092 (and e!106087 mapRes!5948))))

(declare-fun condMapEmpty!5948 () Bool)

(declare-fun mapDefault!5948 () ValueCell!1410)

(assert (=> b!162073 (= condMapEmpty!5948 (= (arr!2892 (_values!3289 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1410)) mapDefault!5948)))))

(declare-fun b!162074 () Bool)

(declare-fun res!76784 () Bool)

(assert (=> b!162074 (=> (not res!76784) (not e!106088))))

(assert (=> b!162074 (= res!76784 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106086 () Bool)

(declare-fun tp_is_empty!3507 () Bool)

(declare-fun array_inv!1847 (array!6093) Bool)

(declare-fun array_inv!1848 (array!6095) Bool)

(assert (=> b!162075 (= e!106086 (and tp!13685 tp_is_empty!3507 (array_inv!1847 (_keys!5107 thiss!1248)) (array_inv!1848 (_values!3289 thiss!1248)) e!106092))))

(declare-fun b!162076 () Bool)

(assert (=> b!162076 (= e!106087 tp_is_empty!3507)))

(declare-fun res!76782 () Bool)

(assert (=> start!16244 (=> (not res!76782) (not e!106088))))

(assert (=> start!16244 (= res!76782 (valid!785 thiss!1248))))

(assert (=> start!16244 e!106088))

(assert (=> start!16244 e!106086))

(assert (=> start!16244 true))

(assert (=> start!16244 tp_is_empty!3507))

(declare-fun b!162072 () Bool)

(assert (=> b!162072 (= e!106090 tp_is_empty!3507)))

(assert (= (and start!16244 res!76782) b!162074))

(assert (= (and b!162074 res!76784) b!162070))

(assert (= (and b!162070 res!76783) b!162071))

(assert (= (and b!162073 condMapEmpty!5948) mapIsEmpty!5948))

(assert (= (and b!162073 (not condMapEmpty!5948)) mapNonEmpty!5948))

(assert (= (and mapNonEmpty!5948 ((_ is ValueCellFull!1410) mapValue!5948)) b!162072))

(assert (= (and b!162073 ((_ is ValueCellFull!1410) mapDefault!5948)) b!162076))

(assert (= b!162075 b!162073))

(assert (= start!16244 b!162075))

(declare-fun m!193331 () Bool)

(assert (=> start!16244 m!193331))

(declare-fun m!193333 () Bool)

(assert (=> mapNonEmpty!5948 m!193333))

(declare-fun m!193335 () Bool)

(assert (=> b!162075 m!193335))

(declare-fun m!193337 () Bool)

(assert (=> b!162075 m!193337))

(declare-fun m!193339 () Bool)

(assert (=> b!162070 m!193339))

(declare-fun m!193341 () Bool)

(assert (=> b!162071 m!193341))

(declare-fun m!193343 () Bool)

(assert (=> b!162071 m!193343))

(check-sat tp_is_empty!3507 (not b_next!3705) (not b!162070) (not start!16244) (not mapNonEmpty!5948) (not b!162071) b_and!10119 (not b!162075))
(check-sat b_and!10119 (not b_next!3705))
