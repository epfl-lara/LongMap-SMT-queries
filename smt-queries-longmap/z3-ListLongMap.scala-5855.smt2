; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75642 () Bool)

(assert start!75642)

(declare-fun b!889289 () Bool)

(declare-fun b_free!15631 () Bool)

(declare-fun b_next!15631 () Bool)

(assert (=> b!889289 (= b_free!15631 (not b_next!15631))))

(declare-fun tp!54862 () Bool)

(declare-fun b_and!25845 () Bool)

(assert (=> b!889289 (= tp!54862 b_and!25845)))

(declare-fun b!889286 () Bool)

(declare-fun e!495707 () Bool)

(assert (=> b!889286 (= e!495707 false)))

(declare-fun lt!401816 () Bool)

(declare-datatypes ((array!51881 0))(
  ( (array!51882 (arr!24947 (Array (_ BitVec 32) (_ BitVec 64))) (size!25393 (_ BitVec 32))) )
))
(declare-datatypes ((V!28911 0))(
  ( (V!28912 (val!9030 Int)) )
))
(declare-datatypes ((ValueCell!8498 0))(
  ( (ValueCellFull!8498 (v!11502 V!28911)) (EmptyCell!8498) )
))
(declare-datatypes ((array!51883 0))(
  ( (array!51884 (arr!24948 (Array (_ BitVec 32) ValueCell!8498)) (size!25394 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4012 0))(
  ( (LongMapFixedSize!4013 (defaultEntry!5203 Int) (mask!25647 (_ BitVec 32)) (extraKeys!4897 (_ BitVec 32)) (zeroValue!5001 V!28911) (minValue!5001 V!28911) (_size!2061 (_ BitVec 32)) (_keys!9881 array!51881) (_values!5188 array!51883) (_vacant!2061 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4012)

(declare-datatypes ((List!17714 0))(
  ( (Nil!17711) (Cons!17710 (h!18841 (_ BitVec 64)) (t!25004 List!17714)) )
))
(declare-fun arrayNoDuplicates!0 (array!51881 (_ BitVec 32) List!17714) Bool)

(assert (=> b!889286 (= lt!401816 (arrayNoDuplicates!0 (_keys!9881 thiss!1181) #b00000000000000000000000000000000 Nil!17711))))

(declare-fun b!889287 () Bool)

(declare-fun res!602721 () Bool)

(declare-fun e!495709 () Bool)

(assert (=> b!889287 (=> (not res!602721) (not e!495709))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889287 (= res!602721 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889288 () Bool)

(declare-fun res!602722 () Bool)

(assert (=> b!889288 (=> (not res!602722) (not e!495707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51881 (_ BitVec 32)) Bool)

(assert (=> b!889288 (= res!602722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9881 thiss!1181) (mask!25647 thiss!1181)))))

(declare-fun e!495704 () Bool)

(declare-fun e!495708 () Bool)

(declare-fun tp_is_empty!17959 () Bool)

(declare-fun array_inv!19668 (array!51881) Bool)

(declare-fun array_inv!19669 (array!51883) Bool)

(assert (=> b!889289 (= e!495708 (and tp!54862 tp_is_empty!17959 (array_inv!19668 (_keys!9881 thiss!1181)) (array_inv!19669 (_values!5188 thiss!1181)) e!495704))))

(declare-fun mapNonEmpty!28493 () Bool)

(declare-fun mapRes!28493 () Bool)

(declare-fun tp!54863 () Bool)

(declare-fun e!495705 () Bool)

(assert (=> mapNonEmpty!28493 (= mapRes!28493 (and tp!54863 e!495705))))

(declare-fun mapKey!28493 () (_ BitVec 32))

(declare-fun mapValue!28493 () ValueCell!8498)

(declare-fun mapRest!28493 () (Array (_ BitVec 32) ValueCell!8498))

(assert (=> mapNonEmpty!28493 (= (arr!24948 (_values!5188 thiss!1181)) (store mapRest!28493 mapKey!28493 mapValue!28493))))

(declare-fun res!602724 () Bool)

(assert (=> start!75642 (=> (not res!602724) (not e!495709))))

(declare-fun valid!1570 (LongMapFixedSize!4012) Bool)

(assert (=> start!75642 (= res!602724 (valid!1570 thiss!1181))))

(assert (=> start!75642 e!495709))

(assert (=> start!75642 e!495708))

(assert (=> start!75642 true))

(declare-fun mapIsEmpty!28493 () Bool)

(assert (=> mapIsEmpty!28493 mapRes!28493))

(declare-fun b!889290 () Bool)

(declare-fun res!602723 () Bool)

(assert (=> b!889290 (=> (not res!602723) (not e!495707))))

(assert (=> b!889290 (= res!602723 (and (= (size!25394 (_values!5188 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25647 thiss!1181))) (= (size!25393 (_keys!9881 thiss!1181)) (size!25394 (_values!5188 thiss!1181))) (bvsge (mask!25647 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4897 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4897 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889291 () Bool)

(assert (=> b!889291 (= e!495709 e!495707)))

(declare-fun res!602720 () Bool)

(assert (=> b!889291 (=> (not res!602720) (not e!495707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889291 (= res!602720 (validMask!0 (mask!25647 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8775 0))(
  ( (MissingZero!8775 (index!37471 (_ BitVec 32))) (Found!8775 (index!37472 (_ BitVec 32))) (Intermediate!8775 (undefined!9587 Bool) (index!37473 (_ BitVec 32)) (x!75522 (_ BitVec 32))) (Undefined!8775) (MissingVacant!8775 (index!37474 (_ BitVec 32))) )
))
(declare-fun lt!401815 () SeekEntryResult!8775)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51881 (_ BitVec 32)) SeekEntryResult!8775)

(assert (=> b!889291 (= lt!401815 (seekEntry!0 key!785 (_keys!9881 thiss!1181) (mask!25647 thiss!1181)))))

(declare-fun b!889292 () Bool)

(declare-fun e!495710 () Bool)

(assert (=> b!889292 (= e!495704 (and e!495710 mapRes!28493))))

(declare-fun condMapEmpty!28493 () Bool)

(declare-fun mapDefault!28493 () ValueCell!8498)

(assert (=> b!889292 (= condMapEmpty!28493 (= (arr!24948 (_values!5188 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8498)) mapDefault!28493)))))

(declare-fun b!889293 () Bool)

(assert (=> b!889293 (= e!495705 tp_is_empty!17959)))

(declare-fun b!889294 () Bool)

(assert (=> b!889294 (= e!495710 tp_is_empty!17959)))

(assert (= (and start!75642 res!602724) b!889287))

(assert (= (and b!889287 res!602721) b!889291))

(assert (= (and b!889291 res!602720) b!889290))

(assert (= (and b!889290 res!602723) b!889288))

(assert (= (and b!889288 res!602722) b!889286))

(assert (= (and b!889292 condMapEmpty!28493) mapIsEmpty!28493))

(assert (= (and b!889292 (not condMapEmpty!28493)) mapNonEmpty!28493))

(get-info :version)

(assert (= (and mapNonEmpty!28493 ((_ is ValueCellFull!8498) mapValue!28493)) b!889293))

(assert (= (and b!889292 ((_ is ValueCellFull!8498) mapDefault!28493)) b!889294))

(assert (= b!889289 b!889292))

(assert (= start!75642 b!889289))

(declare-fun m!827647 () Bool)

(assert (=> b!889289 m!827647))

(declare-fun m!827649 () Bool)

(assert (=> b!889289 m!827649))

(declare-fun m!827651 () Bool)

(assert (=> b!889291 m!827651))

(declare-fun m!827653 () Bool)

(assert (=> b!889291 m!827653))

(declare-fun m!827655 () Bool)

(assert (=> start!75642 m!827655))

(declare-fun m!827657 () Bool)

(assert (=> b!889288 m!827657))

(declare-fun m!827659 () Bool)

(assert (=> b!889286 m!827659))

(declare-fun m!827661 () Bool)

(assert (=> mapNonEmpty!28493 m!827661))

(check-sat (not b!889286) tp_is_empty!17959 (not b_next!15631) b_and!25845 (not b!889288) (not mapNonEmpty!28493) (not b!889291) (not b!889289) (not start!75642))
(check-sat b_and!25845 (not b_next!15631))
