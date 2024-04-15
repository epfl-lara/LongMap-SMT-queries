; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16276 () Bool)

(assert start!16276)

(declare-fun b!162188 () Bool)

(declare-fun b_free!3733 () Bool)

(declare-fun b_next!3733 () Bool)

(assert (=> b!162188 (= b_free!3733 (not b_next!3733))))

(declare-fun tp!13769 () Bool)

(declare-fun b_and!10121 () Bool)

(assert (=> b!162188 (= tp!13769 b_and!10121)))

(declare-fun e!106253 () Bool)

(declare-fun tp_is_empty!3535 () Bool)

(declare-datatypes ((V!4361 0))(
  ( (V!4362 (val!1812 Int)) )
))
(declare-datatypes ((ValueCell!1424 0))(
  ( (ValueCellFull!1424 (v!3671 V!4361)) (EmptyCell!1424) )
))
(declare-datatypes ((array!6129 0))(
  ( (array!6130 (arr!2908 (Array (_ BitVec 32) (_ BitVec 64))) (size!3193 (_ BitVec 32))) )
))
(declare-datatypes ((array!6131 0))(
  ( (array!6132 (arr!2909 (Array (_ BitVec 32) ValueCell!1424)) (size!3194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1756 0))(
  ( (LongMapFixedSize!1757 (defaultEntry!3320 Int) (mask!7939 (_ BitVec 32)) (extraKeys!3061 (_ BitVec 32)) (zeroValue!3163 V!4361) (minValue!3163 V!4361) (_size!927 (_ BitVec 32)) (_keys!5120 array!6129) (_values!3303 array!6131) (_vacant!927 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1756)

(declare-fun e!106255 () Bool)

(declare-fun array_inv!1877 (array!6129) Bool)

(declare-fun array_inv!1878 (array!6131) Bool)

(assert (=> b!162188 (= e!106253 (and tp!13769 tp_is_empty!3535 (array_inv!1877 (_keys!5120 thiss!1248)) (array_inv!1878 (_values!3303 thiss!1248)) e!106255))))

(declare-fun mapNonEmpty!5990 () Bool)

(declare-fun mapRes!5990 () Bool)

(declare-fun tp!13768 () Bool)

(declare-fun e!106251 () Bool)

(assert (=> mapNonEmpty!5990 (= mapRes!5990 (and tp!13768 e!106251))))

(declare-fun mapValue!5990 () ValueCell!1424)

(declare-fun mapRest!5990 () (Array (_ BitVec 32) ValueCell!1424))

(declare-fun mapKey!5990 () (_ BitVec 32))

(assert (=> mapNonEmpty!5990 (= (arr!2909 (_values!3303 thiss!1248)) (store mapRest!5990 mapKey!5990 mapValue!5990))))

(declare-fun b!162189 () Bool)

(declare-fun e!106254 () Bool)

(declare-datatypes ((SeekEntryResult!388 0))(
  ( (MissingZero!388 (index!3720 (_ BitVec 32))) (Found!388 (index!3721 (_ BitVec 32))) (Intermediate!388 (undefined!1200 Bool) (index!3722 (_ BitVec 32)) (x!17963 (_ BitVec 32))) (Undefined!388) (MissingVacant!388 (index!3723 (_ BitVec 32))) )
))
(declare-fun lt!82239 () SeekEntryResult!388)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162189 (= e!106254 (and (not ((_ is Undefined!388) lt!82239)) (not ((_ is MissingVacant!388) lt!82239)) ((_ is MissingZero!388) lt!82239) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82239 (MissingZero!388 (index!3720 lt!82239)))) (not (= lt!82239 (MissingVacant!388 (index!3720 lt!82239))))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6129 (_ BitVec 32)) SeekEntryResult!388)

(assert (=> b!162189 (= lt!82239 (seekEntryOrOpen!0 key!828 (_keys!5120 thiss!1248) (mask!7939 thiss!1248)))))

(declare-fun b!162190 () Bool)

(assert (=> b!162190 (= e!106251 tp_is_empty!3535)))

(declare-fun res!76784 () Bool)

(assert (=> start!16276 (=> (not res!76784) (not e!106254))))

(declare-fun valid!796 (LongMapFixedSize!1756) Bool)

(assert (=> start!16276 (= res!76784 (valid!796 thiss!1248))))

(assert (=> start!16276 e!106254))

(assert (=> start!16276 e!106253))

(assert (=> start!16276 true))

(declare-fun b!162191 () Bool)

(declare-fun e!106252 () Bool)

(assert (=> b!162191 (= e!106255 (and e!106252 mapRes!5990))))

(declare-fun condMapEmpty!5990 () Bool)

(declare-fun mapDefault!5990 () ValueCell!1424)

(assert (=> b!162191 (= condMapEmpty!5990 (= (arr!2909 (_values!3303 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1424)) mapDefault!5990)))))

(declare-fun b!162192 () Bool)

(assert (=> b!162192 (= e!106252 tp_is_empty!3535)))

(declare-fun b!162193 () Bool)

(declare-fun res!76785 () Bool)

(assert (=> b!162193 (=> (not res!76785) (not e!106254))))

(assert (=> b!162193 (= res!76785 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5990 () Bool)

(assert (=> mapIsEmpty!5990 mapRes!5990))

(assert (= (and start!16276 res!76784) b!162193))

(assert (= (and b!162193 res!76785) b!162189))

(assert (= (and b!162191 condMapEmpty!5990) mapIsEmpty!5990))

(assert (= (and b!162191 (not condMapEmpty!5990)) mapNonEmpty!5990))

(assert (= (and mapNonEmpty!5990 ((_ is ValueCellFull!1424) mapValue!5990)) b!162190))

(assert (= (and b!162191 ((_ is ValueCellFull!1424) mapDefault!5990)) b!162192))

(assert (= b!162188 b!162191))

(assert (= start!16276 b!162188))

(declare-fun m!192871 () Bool)

(assert (=> b!162188 m!192871))

(declare-fun m!192873 () Bool)

(assert (=> b!162188 m!192873))

(declare-fun m!192875 () Bool)

(assert (=> mapNonEmpty!5990 m!192875))

(declare-fun m!192877 () Bool)

(assert (=> b!162189 m!192877))

(declare-fun m!192879 () Bool)

(assert (=> start!16276 m!192879))

(check-sat b_and!10121 (not mapNonEmpty!5990) (not b!162189) tp_is_empty!3535 (not b_next!3733) (not b!162188) (not start!16276))
(check-sat b_and!10121 (not b_next!3733))
