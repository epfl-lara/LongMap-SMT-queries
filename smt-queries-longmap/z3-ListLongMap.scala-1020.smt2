; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21724 () Bool)

(assert start!21724)

(declare-fun b!218205 () Bool)

(declare-fun b_free!5869 () Bool)

(declare-fun b_next!5869 () Bool)

(assert (=> b!218205 (= b_free!5869 (not b_next!5869))))

(declare-fun tp!20741 () Bool)

(declare-fun b_and!12733 () Bool)

(assert (=> b!218205 (= tp!20741 b_and!12733)))

(declare-fun b!218203 () Bool)

(declare-fun e!141932 () Bool)

(declare-fun e!141936 () Bool)

(assert (=> b!218203 (= e!141932 e!141936)))

(declare-fun res!106955 () Bool)

(assert (=> b!218203 (=> (not res!106955) (not e!141936))))

(declare-datatypes ((SeekEntryResult!783 0))(
  ( (MissingZero!783 (index!5302 (_ BitVec 32))) (Found!783 (index!5303 (_ BitVec 32))) (Intermediate!783 (undefined!1595 Bool) (index!5304 (_ BitVec 32)) (x!22830 (_ BitVec 32))) (Undefined!783) (MissingVacant!783 (index!5305 (_ BitVec 32))) )
))
(declare-fun lt!111332 () SeekEntryResult!783)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218203 (= res!106955 (or (= lt!111332 (MissingZero!783 index!297)) (= lt!111332 (MissingVacant!783 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7289 0))(
  ( (V!7290 (val!2910 Int)) )
))
(declare-datatypes ((ValueCell!2522 0))(
  ( (ValueCellFull!2522 (v!4922 V!7289)) (EmptyCell!2522) )
))
(declare-datatypes ((array!10693 0))(
  ( (array!10694 (arr!5067 (Array (_ BitVec 32) ValueCell!2522)) (size!5400 (_ BitVec 32))) )
))
(declare-datatypes ((array!10695 0))(
  ( (array!10696 (arr!5068 (Array (_ BitVec 32) (_ BitVec 64))) (size!5401 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2944 0))(
  ( (LongMapFixedSize!2945 (defaultEntry!4122 Int) (mask!9896 (_ BitVec 32)) (extraKeys!3859 (_ BitVec 32)) (zeroValue!3963 V!7289) (minValue!3963 V!7289) (_size!1521 (_ BitVec 32)) (_keys!6170 array!10695) (_values!4105 array!10693) (_vacant!1521 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2944)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10695 (_ BitVec 32)) SeekEntryResult!783)

(assert (=> b!218203 (= lt!111332 (seekEntryOrOpen!0 key!932 (_keys!6170 thiss!1504) (mask!9896 thiss!1504)))))

(declare-fun b!218204 () Bool)

(declare-fun e!141933 () Bool)

(declare-fun tp_is_empty!5731 () Bool)

(assert (=> b!218204 (= e!141933 tp_is_empty!5731)))

(declare-fun e!141934 () Bool)

(declare-fun e!141938 () Bool)

(declare-fun array_inv!3339 (array!10695) Bool)

(declare-fun array_inv!3340 (array!10693) Bool)

(assert (=> b!218205 (= e!141938 (and tp!20741 tp_is_empty!5731 (array_inv!3339 (_keys!6170 thiss!1504)) (array_inv!3340 (_values!4105 thiss!1504)) e!141934))))

(declare-fun b!218206 () Bool)

(declare-fun res!106958 () Bool)

(assert (=> b!218206 (=> (not res!106958) (not e!141936))))

(declare-datatypes ((tuple2!4286 0))(
  ( (tuple2!4287 (_1!2154 (_ BitVec 64)) (_2!2154 V!7289)) )
))
(declare-datatypes ((List!3209 0))(
  ( (Nil!3206) (Cons!3205 (h!3852 tuple2!4286) (t!8155 List!3209)) )
))
(declare-datatypes ((ListLongMap!3189 0))(
  ( (ListLongMap!3190 (toList!1610 List!3209)) )
))
(declare-fun contains!1451 (ListLongMap!3189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1119 (array!10695 array!10693 (_ BitVec 32) (_ BitVec 32) V!7289 V!7289 (_ BitVec 32) Int) ListLongMap!3189)

(assert (=> b!218206 (= res!106958 (not (contains!1451 (getCurrentListMap!1119 (_keys!6170 thiss!1504) (_values!4105 thiss!1504) (mask!9896 thiss!1504) (extraKeys!3859 thiss!1504) (zeroValue!3963 thiss!1504) (minValue!3963 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4122 thiss!1504)) key!932)))))

(declare-fun b!218207 () Bool)

(declare-fun res!106954 () Bool)

(assert (=> b!218207 (=> (not res!106954) (not e!141936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218207 (= res!106954 (validMask!0 (mask!9896 thiss!1504)))))

(declare-fun b!218208 () Bool)

(declare-fun res!106956 () Bool)

(assert (=> b!218208 (=> (not res!106956) (not e!141936))))

(assert (=> b!218208 (= res!106956 (and (= (size!5400 (_values!4105 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9896 thiss!1504))) (= (size!5401 (_keys!6170 thiss!1504)) (size!5400 (_values!4105 thiss!1504))) (bvsge (mask!9896 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3859 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3859 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9759 () Bool)

(declare-fun mapRes!9759 () Bool)

(declare-fun tp!20742 () Bool)

(declare-fun e!141935 () Bool)

(assert (=> mapNonEmpty!9759 (= mapRes!9759 (and tp!20742 e!141935))))

(declare-fun mapValue!9759 () ValueCell!2522)

(declare-fun mapRest!9759 () (Array (_ BitVec 32) ValueCell!2522))

(declare-fun mapKey!9759 () (_ BitVec 32))

(assert (=> mapNonEmpty!9759 (= (arr!5067 (_values!4105 thiss!1504)) (store mapRest!9759 mapKey!9759 mapValue!9759))))

(declare-fun mapIsEmpty!9759 () Bool)

(assert (=> mapIsEmpty!9759 mapRes!9759))

(declare-fun b!218209 () Bool)

(assert (=> b!218209 (= e!141936 false)))

(declare-fun lt!111331 () Bool)

(declare-datatypes ((List!3210 0))(
  ( (Nil!3207) (Cons!3206 (h!3853 (_ BitVec 64)) (t!8156 List!3210)) )
))
(declare-fun arrayNoDuplicates!0 (array!10695 (_ BitVec 32) List!3210) Bool)

(assert (=> b!218209 (= lt!111331 (arrayNoDuplicates!0 (_keys!6170 thiss!1504) #b00000000000000000000000000000000 Nil!3207))))

(declare-fun b!218211 () Bool)

(assert (=> b!218211 (= e!141934 (and e!141933 mapRes!9759))))

(declare-fun condMapEmpty!9759 () Bool)

(declare-fun mapDefault!9759 () ValueCell!2522)

(assert (=> b!218211 (= condMapEmpty!9759 (= (arr!5067 (_values!4105 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2522)) mapDefault!9759)))))

(declare-fun res!106959 () Bool)

(assert (=> start!21724 (=> (not res!106959) (not e!141932))))

(declare-fun valid!1209 (LongMapFixedSize!2944) Bool)

(assert (=> start!21724 (= res!106959 (valid!1209 thiss!1504))))

(assert (=> start!21724 e!141932))

(assert (=> start!21724 e!141938))

(assert (=> start!21724 true))

(declare-fun b!218210 () Bool)

(declare-fun res!106957 () Bool)

(assert (=> b!218210 (=> (not res!106957) (not e!141932))))

(assert (=> b!218210 (= res!106957 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218212 () Bool)

(declare-fun res!106960 () Bool)

(assert (=> b!218212 (=> (not res!106960) (not e!141936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10695 (_ BitVec 32)) Bool)

(assert (=> b!218212 (= res!106960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6170 thiss!1504) (mask!9896 thiss!1504)))))

(declare-fun b!218213 () Bool)

(assert (=> b!218213 (= e!141935 tp_is_empty!5731)))

(assert (= (and start!21724 res!106959) b!218210))

(assert (= (and b!218210 res!106957) b!218203))

(assert (= (and b!218203 res!106955) b!218206))

(assert (= (and b!218206 res!106958) b!218207))

(assert (= (and b!218207 res!106954) b!218208))

(assert (= (and b!218208 res!106956) b!218212))

(assert (= (and b!218212 res!106960) b!218209))

(assert (= (and b!218211 condMapEmpty!9759) mapIsEmpty!9759))

(assert (= (and b!218211 (not condMapEmpty!9759)) mapNonEmpty!9759))

(get-info :version)

(assert (= (and mapNonEmpty!9759 ((_ is ValueCellFull!2522) mapValue!9759)) b!218213))

(assert (= (and b!218211 ((_ is ValueCellFull!2522) mapDefault!9759)) b!218204))

(assert (= b!218205 b!218211))

(assert (= start!21724 b!218205))

(declare-fun m!243693 () Bool)

(assert (=> b!218212 m!243693))

(declare-fun m!243695 () Bool)

(assert (=> mapNonEmpty!9759 m!243695))

(declare-fun m!243697 () Bool)

(assert (=> b!218206 m!243697))

(assert (=> b!218206 m!243697))

(declare-fun m!243699 () Bool)

(assert (=> b!218206 m!243699))

(declare-fun m!243701 () Bool)

(assert (=> b!218207 m!243701))

(declare-fun m!243703 () Bool)

(assert (=> b!218203 m!243703))

(declare-fun m!243705 () Bool)

(assert (=> start!21724 m!243705))

(declare-fun m!243707 () Bool)

(assert (=> b!218209 m!243707))

(declare-fun m!243709 () Bool)

(assert (=> b!218205 m!243709))

(declare-fun m!243711 () Bool)

(assert (=> b!218205 m!243711))

(check-sat (not b_next!5869) (not b!218212) (not b!218205) (not b!218209) b_and!12733 (not b!218207) (not b!218206) tp_is_empty!5731 (not b!218203) (not start!21724) (not mapNonEmpty!9759))
(check-sat b_and!12733 (not b_next!5869))
