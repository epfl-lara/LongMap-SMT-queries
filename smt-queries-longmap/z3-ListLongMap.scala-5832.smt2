; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75268 () Bool)

(assert start!75268)

(declare-fun b!886757 () Bool)

(declare-fun b_free!15493 () Bool)

(declare-fun b_next!15493 () Bool)

(assert (=> b!886757 (= b_free!15493 (not b_next!15493))))

(declare-fun tp!54410 () Bool)

(declare-fun b_and!25673 () Bool)

(assert (=> b!886757 (= tp!54410 b_and!25673)))

(declare-fun b!886754 () Bool)

(declare-fun e!493660 () Bool)

(declare-datatypes ((V!28727 0))(
  ( (V!28728 (val!8961 Int)) )
))
(declare-datatypes ((ValueCell!8429 0))(
  ( (ValueCellFull!8429 (v!11396 V!28727)) (EmptyCell!8429) )
))
(declare-datatypes ((array!51583 0))(
  ( (array!51584 (arr!24809 (Array (_ BitVec 32) ValueCell!8429)) (size!25251 (_ BitVec 32))) )
))
(declare-datatypes ((array!51585 0))(
  ( (array!51586 (arr!24810 (Array (_ BitVec 32) (_ BitVec 64))) (size!25252 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3874 0))(
  ( (LongMapFixedSize!3875 (defaultEntry!5125 Int) (mask!25507 (_ BitVec 32)) (extraKeys!4818 (_ BitVec 32)) (zeroValue!4922 V!28727) (minValue!4922 V!28727) (_size!1992 (_ BitVec 32)) (_keys!9795 array!51585) (_values!5109 array!51583) (_vacant!1992 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1026 0))(
  ( (Cell!1027 (v!11397 LongMapFixedSize!3874)) )
))
(declare-datatypes ((LongMap!1026 0))(
  ( (LongMap!1027 (underlying!524 Cell!1026)) )
))
(declare-fun thiss!833 () LongMap!1026)

(declare-fun valid!1516 (LongMapFixedSize!3874) Bool)

(assert (=> b!886754 (= e!493660 (not (valid!1516 (v!11397 (underlying!524 thiss!833)))))))

(declare-fun res!601928 () Bool)

(assert (=> start!75268 (=> (not res!601928) (not e!493660))))

(declare-fun valid!1517 (LongMap!1026) Bool)

(assert (=> start!75268 (= res!601928 (valid!1517 thiss!833))))

(assert (=> start!75268 e!493660))

(declare-fun e!493663 () Bool)

(assert (=> start!75268 e!493663))

(declare-fun mapNonEmpty!28248 () Bool)

(declare-fun mapRes!28248 () Bool)

(declare-fun tp!54411 () Bool)

(declare-fun e!493664 () Bool)

(assert (=> mapNonEmpty!28248 (= mapRes!28248 (and tp!54411 e!493664))))

(declare-fun mapValue!28248 () ValueCell!8429)

(declare-fun mapRest!28248 () (Array (_ BitVec 32) ValueCell!8429))

(declare-fun mapKey!28248 () (_ BitVec 32))

(assert (=> mapNonEmpty!28248 (= (arr!24809 (_values!5109 (v!11397 (underlying!524 thiss!833)))) (store mapRest!28248 mapKey!28248 mapValue!28248))))

(declare-fun b!886755 () Bool)

(declare-fun tp_is_empty!17821 () Bool)

(assert (=> b!886755 (= e!493664 tp_is_empty!17821)))

(declare-fun b!886756 () Bool)

(declare-fun e!493661 () Bool)

(declare-fun e!493662 () Bool)

(assert (=> b!886756 (= e!493661 e!493662)))

(declare-fun e!493667 () Bool)

(declare-fun array_inv!19582 (array!51585) Bool)

(declare-fun array_inv!19583 (array!51583) Bool)

(assert (=> b!886757 (= e!493662 (and tp!54410 tp_is_empty!17821 (array_inv!19582 (_keys!9795 (v!11397 (underlying!524 thiss!833)))) (array_inv!19583 (_values!5109 (v!11397 (underlying!524 thiss!833)))) e!493667))))

(declare-fun b!886758 () Bool)

(assert (=> b!886758 (= e!493663 e!493661)))

(declare-fun b!886759 () Bool)

(declare-fun e!493666 () Bool)

(assert (=> b!886759 (= e!493666 tp_is_empty!17821)))

(declare-fun mapIsEmpty!28248 () Bool)

(assert (=> mapIsEmpty!28248 mapRes!28248))

(declare-fun b!886760 () Bool)

(assert (=> b!886760 (= e!493667 (and e!493666 mapRes!28248))))

(declare-fun condMapEmpty!28248 () Bool)

(declare-fun mapDefault!28248 () ValueCell!8429)

(assert (=> b!886760 (= condMapEmpty!28248 (= (arr!24809 (_values!5109 (v!11397 (underlying!524 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8429)) mapDefault!28248)))))

(assert (= (and start!75268 res!601928) b!886754))

(assert (= (and b!886760 condMapEmpty!28248) mapIsEmpty!28248))

(assert (= (and b!886760 (not condMapEmpty!28248)) mapNonEmpty!28248))

(get-info :version)

(assert (= (and mapNonEmpty!28248 ((_ is ValueCellFull!8429) mapValue!28248)) b!886755))

(assert (= (and b!886760 ((_ is ValueCellFull!8429) mapDefault!28248)) b!886759))

(assert (= b!886757 b!886760))

(assert (= b!886756 b!886757))

(assert (= b!886758 b!886756))

(assert (= start!75268 b!886758))

(declare-fun m!826043 () Bool)

(assert (=> b!886754 m!826043))

(declare-fun m!826045 () Bool)

(assert (=> start!75268 m!826045))

(declare-fun m!826047 () Bool)

(assert (=> mapNonEmpty!28248 m!826047))

(declare-fun m!826049 () Bool)

(assert (=> b!886757 m!826049))

(declare-fun m!826051 () Bool)

(assert (=> b!886757 m!826051))

(check-sat b_and!25673 (not b_next!15493) tp_is_empty!17821 (not b!886757) (not mapNonEmpty!28248) (not start!75268) (not b!886754))
(check-sat b_and!25673 (not b_next!15493))
(get-model)

(declare-fun d!109675 () Bool)

(declare-fun res!601941 () Bool)

(declare-fun e!493718 () Bool)

(assert (=> d!109675 (=> (not res!601941) (not e!493718))))

(declare-fun simpleValid!286 (LongMapFixedSize!3874) Bool)

(assert (=> d!109675 (= res!601941 (simpleValid!286 (v!11397 (underlying!524 thiss!833))))))

(assert (=> d!109675 (= (valid!1516 (v!11397 (underlying!524 thiss!833))) e!493718)))

(declare-fun b!886809 () Bool)

(declare-fun res!601942 () Bool)

(assert (=> b!886809 (=> (not res!601942) (not e!493718))))

(declare-fun arrayCountValidKeys!0 (array!51585 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!886809 (= res!601942 (= (arrayCountValidKeys!0 (_keys!9795 (v!11397 (underlying!524 thiss!833))) #b00000000000000000000000000000000 (size!25252 (_keys!9795 (v!11397 (underlying!524 thiss!833))))) (_size!1992 (v!11397 (underlying!524 thiss!833)))))))

(declare-fun b!886810 () Bool)

(declare-fun res!601943 () Bool)

(assert (=> b!886810 (=> (not res!601943) (not e!493718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51585 (_ BitVec 32)) Bool)

(assert (=> b!886810 (= res!601943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9795 (v!11397 (underlying!524 thiss!833))) (mask!25507 (v!11397 (underlying!524 thiss!833)))))))

(declare-fun b!886811 () Bool)

(declare-datatypes ((List!17685 0))(
  ( (Nil!17682) (Cons!17681 (h!18812 (_ BitVec 64)) (t!24959 List!17685)) )
))
(declare-fun arrayNoDuplicates!0 (array!51585 (_ BitVec 32) List!17685) Bool)

(assert (=> b!886811 (= e!493718 (arrayNoDuplicates!0 (_keys!9795 (v!11397 (underlying!524 thiss!833))) #b00000000000000000000000000000000 Nil!17682))))

(assert (= (and d!109675 res!601941) b!886809))

(assert (= (and b!886809 res!601942) b!886810))

(assert (= (and b!886810 res!601943) b!886811))

(declare-fun m!826073 () Bool)

(assert (=> d!109675 m!826073))

(declare-fun m!826075 () Bool)

(assert (=> b!886809 m!826075))

(declare-fun m!826077 () Bool)

(assert (=> b!886810 m!826077))

(declare-fun m!826079 () Bool)

(assert (=> b!886811 m!826079))

(assert (=> b!886754 d!109675))

(declare-fun d!109677 () Bool)

(assert (=> d!109677 (= (array_inv!19582 (_keys!9795 (v!11397 (underlying!524 thiss!833)))) (bvsge (size!25252 (_keys!9795 (v!11397 (underlying!524 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!886757 d!109677))

(declare-fun d!109679 () Bool)

(assert (=> d!109679 (= (array_inv!19583 (_values!5109 (v!11397 (underlying!524 thiss!833)))) (bvsge (size!25251 (_values!5109 (v!11397 (underlying!524 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!886757 d!109679))

(declare-fun d!109681 () Bool)

(assert (=> d!109681 (= (valid!1517 thiss!833) (valid!1516 (v!11397 (underlying!524 thiss!833))))))

(declare-fun bs!24828 () Bool)

(assert (= bs!24828 d!109681))

(assert (=> bs!24828 m!826043))

(assert (=> start!75268 d!109681))

(declare-fun mapNonEmpty!28257 () Bool)

(declare-fun mapRes!28257 () Bool)

(declare-fun tp!54426 () Bool)

(declare-fun e!493724 () Bool)

(assert (=> mapNonEmpty!28257 (= mapRes!28257 (and tp!54426 e!493724))))

(declare-fun mapRest!28257 () (Array (_ BitVec 32) ValueCell!8429))

(declare-fun mapValue!28257 () ValueCell!8429)

(declare-fun mapKey!28257 () (_ BitVec 32))

(assert (=> mapNonEmpty!28257 (= mapRest!28248 (store mapRest!28257 mapKey!28257 mapValue!28257))))

(declare-fun condMapEmpty!28257 () Bool)

(declare-fun mapDefault!28257 () ValueCell!8429)

(assert (=> mapNonEmpty!28248 (= condMapEmpty!28257 (= mapRest!28248 ((as const (Array (_ BitVec 32) ValueCell!8429)) mapDefault!28257)))))

(declare-fun e!493723 () Bool)

(assert (=> mapNonEmpty!28248 (= tp!54411 (and e!493723 mapRes!28257))))

(declare-fun mapIsEmpty!28257 () Bool)

(assert (=> mapIsEmpty!28257 mapRes!28257))

(declare-fun b!886819 () Bool)

(assert (=> b!886819 (= e!493723 tp_is_empty!17821)))

(declare-fun b!886818 () Bool)

(assert (=> b!886818 (= e!493724 tp_is_empty!17821)))

(assert (= (and mapNonEmpty!28248 condMapEmpty!28257) mapIsEmpty!28257))

(assert (= (and mapNonEmpty!28248 (not condMapEmpty!28257)) mapNonEmpty!28257))

(assert (= (and mapNonEmpty!28257 ((_ is ValueCellFull!8429) mapValue!28257)) b!886818))

(assert (= (and mapNonEmpty!28248 ((_ is ValueCellFull!8429) mapDefault!28257)) b!886819))

(declare-fun m!826081 () Bool)

(assert (=> mapNonEmpty!28257 m!826081))

(check-sat b_and!25673 (not mapNonEmpty!28257) (not b_next!15493) (not b!886809) tp_is_empty!17821 (not d!109675) (not b!886810) (not b!886811) (not d!109681))
(check-sat b_and!25673 (not b_next!15493))
