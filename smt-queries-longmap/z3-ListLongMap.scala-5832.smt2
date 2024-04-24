; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75454 () Bool)

(assert start!75454)

(declare-fun b!887902 () Bool)

(declare-fun b_free!15493 () Bool)

(declare-fun b_next!15493 () Bool)

(assert (=> b!887902 (= b_free!15493 (not b_next!15493))))

(declare-fun tp!54410 () Bool)

(declare-fun b_and!25709 () Bool)

(assert (=> b!887902 (= tp!54410 b_and!25709)))

(declare-fun b!887896 () Bool)

(declare-fun e!494397 () Bool)

(declare-fun e!494393 () Bool)

(declare-fun mapRes!28248 () Bool)

(assert (=> b!887896 (= e!494397 (and e!494393 mapRes!28248))))

(declare-fun condMapEmpty!28248 () Bool)

(declare-datatypes ((V!28727 0))(
  ( (V!28728 (val!8961 Int)) )
))
(declare-datatypes ((ValueCell!8429 0))(
  ( (ValueCellFull!8429 (v!11402 V!28727)) (EmptyCell!8429) )
))
(declare-datatypes ((array!51639 0))(
  ( (array!51640 (arr!24832 (Array (_ BitVec 32) ValueCell!8429)) (size!25273 (_ BitVec 32))) )
))
(declare-datatypes ((array!51641 0))(
  ( (array!51642 (arr!24833 (Array (_ BitVec 32) (_ BitVec 64))) (size!25274 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3874 0))(
  ( (LongMapFixedSize!3875 (defaultEntry!5125 Int) (mask!25557 (_ BitVec 32)) (extraKeys!4818 (_ BitVec 32)) (zeroValue!4922 V!28727) (minValue!4922 V!28727) (_size!1992 (_ BitVec 32)) (_keys!9828 array!51641) (_values!5109 array!51639) (_vacant!1992 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1034 0))(
  ( (Cell!1035 (v!11403 LongMapFixedSize!3874)) )
))
(declare-datatypes ((LongMap!1034 0))(
  ( (LongMap!1035 (underlying!528 Cell!1034)) )
))
(declare-fun thiss!833 () LongMap!1034)

(declare-fun mapDefault!28248 () ValueCell!8429)

(assert (=> b!887896 (= condMapEmpty!28248 (= (arr!24832 (_values!5109 (v!11403 (underlying!528 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8429)) mapDefault!28248)))))

(declare-fun b!887897 () Bool)

(declare-fun e!494391 () Bool)

(declare-fun e!494394 () Bool)

(assert (=> b!887897 (= e!494391 e!494394)))

(declare-fun b!887898 () Bool)

(declare-fun e!494396 () Bool)

(assert (=> b!887898 (= e!494394 e!494396)))

(declare-fun b!887899 () Bool)

(declare-fun e!494392 () Bool)

(declare-fun valid!1515 (LongMapFixedSize!3874) Bool)

(assert (=> b!887899 (= e!494392 (not (valid!1515 (v!11403 (underlying!528 thiss!833)))))))

(declare-fun b!887900 () Bool)

(declare-fun e!494395 () Bool)

(declare-fun tp_is_empty!17821 () Bool)

(assert (=> b!887900 (= e!494395 tp_is_empty!17821)))

(declare-fun mapNonEmpty!28248 () Bool)

(declare-fun tp!54411 () Bool)

(assert (=> mapNonEmpty!28248 (= mapRes!28248 (and tp!54411 e!494395))))

(declare-fun mapKey!28248 () (_ BitVec 32))

(declare-fun mapRest!28248 () (Array (_ BitVec 32) ValueCell!8429))

(declare-fun mapValue!28248 () ValueCell!8429)

(assert (=> mapNonEmpty!28248 (= (arr!24832 (_values!5109 (v!11403 (underlying!528 thiss!833)))) (store mapRest!28248 mapKey!28248 mapValue!28248))))

(declare-fun mapIsEmpty!28248 () Bool)

(assert (=> mapIsEmpty!28248 mapRes!28248))

(declare-fun b!887901 () Bool)

(assert (=> b!887901 (= e!494393 tp_is_empty!17821)))

(declare-fun res!602382 () Bool)

(assert (=> start!75454 (=> (not res!602382) (not e!494392))))

(declare-fun valid!1516 (LongMap!1034) Bool)

(assert (=> start!75454 (= res!602382 (valid!1516 thiss!833))))

(assert (=> start!75454 e!494392))

(assert (=> start!75454 e!494391))

(declare-fun array_inv!19586 (array!51641) Bool)

(declare-fun array_inv!19587 (array!51639) Bool)

(assert (=> b!887902 (= e!494396 (and tp!54410 tp_is_empty!17821 (array_inv!19586 (_keys!9828 (v!11403 (underlying!528 thiss!833)))) (array_inv!19587 (_values!5109 (v!11403 (underlying!528 thiss!833)))) e!494397))))

(assert (= (and start!75454 res!602382) b!887899))

(assert (= (and b!887896 condMapEmpty!28248) mapIsEmpty!28248))

(assert (= (and b!887896 (not condMapEmpty!28248)) mapNonEmpty!28248))

(get-info :version)

(assert (= (and mapNonEmpty!28248 ((_ is ValueCellFull!8429) mapValue!28248)) b!887900))

(assert (= (and b!887896 ((_ is ValueCellFull!8429) mapDefault!28248)) b!887901))

(assert (= b!887902 b!887896))

(assert (= b!887898 b!887902))

(assert (= b!887897 b!887898))

(assert (= start!75454 b!887897))

(declare-fun m!828095 () Bool)

(assert (=> b!887899 m!828095))

(declare-fun m!828097 () Bool)

(assert (=> mapNonEmpty!28248 m!828097))

(declare-fun m!828099 () Bool)

(assert (=> start!75454 m!828099))

(declare-fun m!828101 () Bool)

(assert (=> b!887902 m!828101))

(declare-fun m!828103 () Bool)

(assert (=> b!887902 m!828103))

(check-sat (not b!887902) (not start!75454) tp_is_empty!17821 (not b!887899) (not mapNonEmpty!28248) b_and!25709 (not b_next!15493))
(check-sat b_and!25709 (not b_next!15493))
(get-model)

(declare-fun d!110195 () Bool)

(assert (=> d!110195 (= (valid!1516 thiss!833) (valid!1515 (v!11403 (underlying!528 thiss!833))))))

(declare-fun bs!24874 () Bool)

(assert (= bs!24874 d!110195))

(assert (=> bs!24874 m!828095))

(assert (=> start!75454 d!110195))

(declare-fun d!110197 () Bool)

(assert (=> d!110197 (= (array_inv!19586 (_keys!9828 (v!11403 (underlying!528 thiss!833)))) (bvsge (size!25274 (_keys!9828 (v!11403 (underlying!528 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887902 d!110197))

(declare-fun d!110199 () Bool)

(assert (=> d!110199 (= (array_inv!19587 (_values!5109 (v!11403 (underlying!528 thiss!833)))) (bvsge (size!25273 (_values!5109 (v!11403 (underlying!528 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887902 d!110199))

(declare-fun d!110201 () Bool)

(declare-fun res!602395 () Bool)

(declare-fun e!494448 () Bool)

(assert (=> d!110201 (=> (not res!602395) (not e!494448))))

(declare-fun simpleValid!286 (LongMapFixedSize!3874) Bool)

(assert (=> d!110201 (= res!602395 (simpleValid!286 (v!11403 (underlying!528 thiss!833))))))

(assert (=> d!110201 (= (valid!1515 (v!11403 (underlying!528 thiss!833))) e!494448)))

(declare-fun b!887951 () Bool)

(declare-fun res!602396 () Bool)

(assert (=> b!887951 (=> (not res!602396) (not e!494448))))

(declare-fun arrayCountValidKeys!0 (array!51641 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887951 (= res!602396 (= (arrayCountValidKeys!0 (_keys!9828 (v!11403 (underlying!528 thiss!833))) #b00000000000000000000000000000000 (size!25274 (_keys!9828 (v!11403 (underlying!528 thiss!833))))) (_size!1992 (v!11403 (underlying!528 thiss!833)))))))

(declare-fun b!887952 () Bool)

(declare-fun res!602397 () Bool)

(assert (=> b!887952 (=> (not res!602397) (not e!494448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51641 (_ BitVec 32)) Bool)

(assert (=> b!887952 (= res!602397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9828 (v!11403 (underlying!528 thiss!833))) (mask!25557 (v!11403 (underlying!528 thiss!833)))))))

(declare-fun b!887953 () Bool)

(declare-datatypes ((List!17632 0))(
  ( (Nil!17629) (Cons!17628 (h!18765 (_ BitVec 64)) (t!24907 List!17632)) )
))
(declare-fun arrayNoDuplicates!0 (array!51641 (_ BitVec 32) List!17632) Bool)

(assert (=> b!887953 (= e!494448 (arrayNoDuplicates!0 (_keys!9828 (v!11403 (underlying!528 thiss!833))) #b00000000000000000000000000000000 Nil!17629))))

(assert (= (and d!110201 res!602395) b!887951))

(assert (= (and b!887951 res!602396) b!887952))

(assert (= (and b!887952 res!602397) b!887953))

(declare-fun m!828125 () Bool)

(assert (=> d!110201 m!828125))

(declare-fun m!828127 () Bool)

(assert (=> b!887951 m!828127))

(declare-fun m!828129 () Bool)

(assert (=> b!887952 m!828129))

(declare-fun m!828131 () Bool)

(assert (=> b!887953 m!828131))

(assert (=> b!887899 d!110201))

(declare-fun condMapEmpty!28257 () Bool)

(declare-fun mapDefault!28257 () ValueCell!8429)

(assert (=> mapNonEmpty!28248 (= condMapEmpty!28257 (= mapRest!28248 ((as const (Array (_ BitVec 32) ValueCell!8429)) mapDefault!28257)))))

(declare-fun e!494454 () Bool)

(declare-fun mapRes!28257 () Bool)

(assert (=> mapNonEmpty!28248 (= tp!54411 (and e!494454 mapRes!28257))))

(declare-fun mapNonEmpty!28257 () Bool)

(declare-fun tp!54426 () Bool)

(declare-fun e!494453 () Bool)

(assert (=> mapNonEmpty!28257 (= mapRes!28257 (and tp!54426 e!494453))))

(declare-fun mapRest!28257 () (Array (_ BitVec 32) ValueCell!8429))

(declare-fun mapKey!28257 () (_ BitVec 32))

(declare-fun mapValue!28257 () ValueCell!8429)

(assert (=> mapNonEmpty!28257 (= mapRest!28248 (store mapRest!28257 mapKey!28257 mapValue!28257))))

(declare-fun b!887961 () Bool)

(assert (=> b!887961 (= e!494454 tp_is_empty!17821)))

(declare-fun mapIsEmpty!28257 () Bool)

(assert (=> mapIsEmpty!28257 mapRes!28257))

(declare-fun b!887960 () Bool)

(assert (=> b!887960 (= e!494453 tp_is_empty!17821)))

(assert (= (and mapNonEmpty!28248 condMapEmpty!28257) mapIsEmpty!28257))

(assert (= (and mapNonEmpty!28248 (not condMapEmpty!28257)) mapNonEmpty!28257))

(assert (= (and mapNonEmpty!28257 ((_ is ValueCellFull!8429) mapValue!28257)) b!887960))

(assert (= (and mapNonEmpty!28248 ((_ is ValueCellFull!8429) mapDefault!28257)) b!887961))

(declare-fun m!828133 () Bool)

(assert (=> mapNonEmpty!28257 m!828133))

(check-sat (not mapNonEmpty!28257) tp_is_empty!17821 b_and!25709 (not b_next!15493) (not b!887952) (not d!110201) (not d!110195) (not b!887951) (not b!887953))
(check-sat b_and!25709 (not b_next!15493))
