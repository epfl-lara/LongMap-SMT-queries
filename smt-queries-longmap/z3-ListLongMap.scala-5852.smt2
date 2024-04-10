; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75644 () Bool)

(assert start!75644)

(declare-fun b!889310 () Bool)

(declare-fun b_free!15615 () Bool)

(declare-fun b_next!15615 () Bool)

(assert (=> b!889310 (= b_free!15615 (not b_next!15615))))

(declare-fun tp!54813 () Bool)

(declare-fun b_and!25855 () Bool)

(assert (=> b!889310 (= tp!54813 b_and!25855)))

(declare-fun b!889309 () Bool)

(declare-fun e!495688 () Bool)

(declare-fun e!495685 () Bool)

(assert (=> b!889309 (= e!495688 e!495685)))

(declare-fun res!602713 () Bool)

(assert (=> b!889309 (=> (not res!602713) (not e!495685))))

(declare-datatypes ((array!51866 0))(
  ( (array!51867 (arr!24939 (Array (_ BitVec 32) (_ BitVec 64))) (size!25383 (_ BitVec 32))) )
))
(declare-datatypes ((V!28889 0))(
  ( (V!28890 (val!9022 Int)) )
))
(declare-datatypes ((ValueCell!8490 0))(
  ( (ValueCellFull!8490 (v!11500 V!28889)) (EmptyCell!8490) )
))
(declare-datatypes ((array!51868 0))(
  ( (array!51869 (arr!24940 (Array (_ BitVec 32) ValueCell!8490)) (size!25384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3996 0))(
  ( (LongMapFixedSize!3997 (defaultEntry!5195 Int) (mask!25640 (_ BitVec 32)) (extraKeys!4889 (_ BitVec 32)) (zeroValue!4993 V!28889) (minValue!4993 V!28889) (_size!2053 (_ BitVec 32)) (_keys!9878 array!51866) (_values!5180 array!51868) (_vacant!2053 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3996)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889309 (= res!602713 (validMask!0 (mask!25640 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8771 0))(
  ( (MissingZero!8771 (index!37455 (_ BitVec 32))) (Found!8771 (index!37456 (_ BitVec 32))) (Intermediate!8771 (undefined!9583 Bool) (index!37457 (_ BitVec 32)) (x!75499 (_ BitVec 32))) (Undefined!8771) (MissingVacant!8771 (index!37458 (_ BitVec 32))) )
))
(declare-fun lt!402004 () SeekEntryResult!8771)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51866 (_ BitVec 32)) SeekEntryResult!8771)

(assert (=> b!889309 (= lt!402004 (seekEntry!0 key!785 (_keys!9878 thiss!1181) (mask!25640 thiss!1181)))))

(declare-fun e!495684 () Bool)

(declare-fun e!495690 () Bool)

(declare-fun tp_is_empty!17943 () Bool)

(declare-fun array_inv!19620 (array!51866) Bool)

(declare-fun array_inv!19621 (array!51868) Bool)

(assert (=> b!889310 (= e!495684 (and tp!54813 tp_is_empty!17943 (array_inv!19620 (_keys!9878 thiss!1181)) (array_inv!19621 (_values!5180 thiss!1181)) e!495690))))

(declare-fun res!602710 () Bool)

(assert (=> start!75644 (=> (not res!602710) (not e!495688))))

(declare-fun valid!1556 (LongMapFixedSize!3996) Bool)

(assert (=> start!75644 (= res!602710 (valid!1556 thiss!1181))))

(assert (=> start!75644 e!495688))

(assert (=> start!75644 e!495684))

(assert (=> start!75644 true))

(declare-fun b!889311 () Bool)

(declare-fun e!495687 () Bool)

(assert (=> b!889311 (= e!495687 tp_is_empty!17943)))

(declare-fun mapNonEmpty!28469 () Bool)

(declare-fun mapRes!28469 () Bool)

(declare-fun tp!54814 () Bool)

(assert (=> mapNonEmpty!28469 (= mapRes!28469 (and tp!54814 e!495687))))

(declare-fun mapKey!28469 () (_ BitVec 32))

(declare-fun mapRest!28469 () (Array (_ BitVec 32) ValueCell!8490))

(declare-fun mapValue!28469 () ValueCell!8490)

(assert (=> mapNonEmpty!28469 (= (arr!24940 (_values!5180 thiss!1181)) (store mapRest!28469 mapKey!28469 mapValue!28469))))

(declare-fun b!889312 () Bool)

(declare-fun e!495689 () Bool)

(assert (=> b!889312 (= e!495689 tp_is_empty!17943)))

(declare-fun mapIsEmpty!28469 () Bool)

(assert (=> mapIsEmpty!28469 mapRes!28469))

(declare-fun b!889313 () Bool)

(assert (=> b!889313 (= e!495685 false)))

(declare-fun lt!402003 () Bool)

(declare-datatypes ((List!17699 0))(
  ( (Nil!17696) (Cons!17695 (h!18826 (_ BitVec 64)) (t!24998 List!17699)) )
))
(declare-fun arrayNoDuplicates!0 (array!51866 (_ BitVec 32) List!17699) Bool)

(assert (=> b!889313 (= lt!402003 (arrayNoDuplicates!0 (_keys!9878 thiss!1181) #b00000000000000000000000000000000 Nil!17696))))

(declare-fun b!889314 () Bool)

(declare-fun res!602714 () Bool)

(assert (=> b!889314 (=> (not res!602714) (not e!495688))))

(assert (=> b!889314 (= res!602714 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889315 () Bool)

(assert (=> b!889315 (= e!495690 (and e!495689 mapRes!28469))))

(declare-fun condMapEmpty!28469 () Bool)

(declare-fun mapDefault!28469 () ValueCell!8490)

(assert (=> b!889315 (= condMapEmpty!28469 (= (arr!24940 (_values!5180 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8490)) mapDefault!28469)))))

(declare-fun b!889316 () Bool)

(declare-fun res!602711 () Bool)

(assert (=> b!889316 (=> (not res!602711) (not e!495685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51866 (_ BitVec 32)) Bool)

(assert (=> b!889316 (= res!602711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9878 thiss!1181) (mask!25640 thiss!1181)))))

(declare-fun b!889317 () Bool)

(declare-fun res!602712 () Bool)

(assert (=> b!889317 (=> (not res!602712) (not e!495685))))

(assert (=> b!889317 (= res!602712 (and (= (size!25384 (_values!5180 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25640 thiss!1181))) (= (size!25383 (_keys!9878 thiss!1181)) (size!25384 (_values!5180 thiss!1181))) (bvsge (mask!25640 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4889 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4889 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75644 res!602710) b!889314))

(assert (= (and b!889314 res!602714) b!889309))

(assert (= (and b!889309 res!602713) b!889317))

(assert (= (and b!889317 res!602712) b!889316))

(assert (= (and b!889316 res!602711) b!889313))

(assert (= (and b!889315 condMapEmpty!28469) mapIsEmpty!28469))

(assert (= (and b!889315 (not condMapEmpty!28469)) mapNonEmpty!28469))

(get-info :version)

(assert (= (and mapNonEmpty!28469 ((_ is ValueCellFull!8490) mapValue!28469)) b!889311))

(assert (= (and b!889315 ((_ is ValueCellFull!8490) mapDefault!28469)) b!889312))

(assert (= b!889310 b!889315))

(assert (= start!75644 b!889310))

(declare-fun m!828277 () Bool)

(assert (=> mapNonEmpty!28469 m!828277))

(declare-fun m!828279 () Bool)

(assert (=> b!889309 m!828279))

(declare-fun m!828281 () Bool)

(assert (=> b!889309 m!828281))

(declare-fun m!828283 () Bool)

(assert (=> start!75644 m!828283))

(declare-fun m!828285 () Bool)

(assert (=> b!889310 m!828285))

(declare-fun m!828287 () Bool)

(assert (=> b!889310 m!828287))

(declare-fun m!828289 () Bool)

(assert (=> b!889313 m!828289))

(declare-fun m!828291 () Bool)

(assert (=> b!889316 m!828291))

(check-sat (not b!889310) (not b!889316) b_and!25855 (not start!75644) (not mapNonEmpty!28469) (not b_next!15615) tp_is_empty!17943 (not b!889313) (not b!889309))
(check-sat b_and!25855 (not b_next!15615))
