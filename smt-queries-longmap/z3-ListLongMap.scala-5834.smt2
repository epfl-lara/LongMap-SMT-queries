; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75288 () Bool)

(assert start!75288)

(declare-fun b!886903 () Bool)

(declare-fun b_free!15505 () Bool)

(declare-fun b_next!15505 () Bool)

(assert (=> b!886903 (= b_free!15505 (not b_next!15505))))

(declare-fun tp!54450 () Bool)

(declare-fun b_and!25685 () Bool)

(assert (=> b!886903 (= tp!54450 b_and!25685)))

(declare-fun b!886897 () Bool)

(declare-fun e!493818 () Bool)

(declare-fun e!493814 () Bool)

(assert (=> b!886897 (= e!493818 e!493814)))

(declare-fun mapNonEmpty!28269 () Bool)

(declare-fun mapRes!28269 () Bool)

(declare-fun tp!54449 () Bool)

(declare-fun e!493819 () Bool)

(assert (=> mapNonEmpty!28269 (= mapRes!28269 (and tp!54449 e!493819))))

(declare-datatypes ((V!28743 0))(
  ( (V!28744 (val!8967 Int)) )
))
(declare-datatypes ((ValueCell!8435 0))(
  ( (ValueCellFull!8435 (v!11408 V!28743)) (EmptyCell!8435) )
))
(declare-fun mapValue!28269 () ValueCell!8435)

(declare-fun mapRest!28269 () (Array (_ BitVec 32) ValueCell!8435))

(declare-fun mapKey!28269 () (_ BitVec 32))

(declare-datatypes ((array!51609 0))(
  ( (array!51610 (arr!24821 (Array (_ BitVec 32) ValueCell!8435)) (size!25263 (_ BitVec 32))) )
))
(declare-datatypes ((array!51611 0))(
  ( (array!51612 (arr!24822 (Array (_ BitVec 32) (_ BitVec 64))) (size!25264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3886 0))(
  ( (LongMapFixedSize!3887 (defaultEntry!5131 Int) (mask!25517 (_ BitVec 32)) (extraKeys!4824 (_ BitVec 32)) (zeroValue!4928 V!28743) (minValue!4928 V!28743) (_size!1998 (_ BitVec 32)) (_keys!9801 array!51611) (_values!5115 array!51609) (_vacant!1998 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1038 0))(
  ( (Cell!1039 (v!11409 LongMapFixedSize!3886)) )
))
(declare-datatypes ((LongMap!1038 0))(
  ( (LongMap!1039 (underlying!530 Cell!1038)) )
))
(declare-fun thiss!833 () LongMap!1038)

(assert (=> mapNonEmpty!28269 (= (arr!24821 (_values!5115 (v!11409 (underlying!530 thiss!833)))) (store mapRest!28269 mapKey!28269 mapValue!28269))))

(declare-fun mapIsEmpty!28269 () Bool)

(assert (=> mapIsEmpty!28269 mapRes!28269))

(declare-fun b!886899 () Bool)

(declare-fun e!493815 () Bool)

(declare-fun tp_is_empty!17833 () Bool)

(assert (=> b!886899 (= e!493815 tp_is_empty!17833)))

(declare-fun b!886900 () Bool)

(declare-fun e!493817 () Bool)

(assert (=> b!886900 (= e!493814 e!493817)))

(declare-fun b!886901 () Bool)

(declare-fun e!493813 () Bool)

(assert (=> b!886901 (= e!493813 false)))

(declare-fun lt!400961 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4276 (LongMap!1038 (_ BitVec 64)) Bool)

(assert (=> b!886901 (= lt!400961 (contains!4276 thiss!833 key!673))))

(declare-fun lt!400960 () V!28743)

(declare-fun apply!389 (LongMapFixedSize!3886 (_ BitVec 64)) V!28743)

(assert (=> b!886901 (= lt!400960 (apply!389 (v!11409 (underlying!530 thiss!833)) key!673))))

(declare-fun b!886902 () Bool)

(assert (=> b!886902 (= e!493819 tp_is_empty!17833)))

(declare-fun e!493816 () Bool)

(declare-fun array_inv!19590 (array!51611) Bool)

(declare-fun array_inv!19591 (array!51609) Bool)

(assert (=> b!886903 (= e!493817 (and tp!54450 tp_is_empty!17833 (array_inv!19590 (_keys!9801 (v!11409 (underlying!530 thiss!833)))) (array_inv!19591 (_values!5115 (v!11409 (underlying!530 thiss!833)))) e!493816))))

(declare-fun res!601955 () Bool)

(assert (=> start!75288 (=> (not res!601955) (not e!493813))))

(declare-fun valid!1521 (LongMap!1038) Bool)

(assert (=> start!75288 (= res!601955 (valid!1521 thiss!833))))

(assert (=> start!75288 e!493813))

(assert (=> start!75288 e!493818))

(assert (=> start!75288 true))

(declare-fun b!886898 () Bool)

(assert (=> b!886898 (= e!493816 (and e!493815 mapRes!28269))))

(declare-fun condMapEmpty!28269 () Bool)

(declare-fun mapDefault!28269 () ValueCell!8435)

(assert (=> b!886898 (= condMapEmpty!28269 (= (arr!24821 (_values!5115 (v!11409 (underlying!530 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8435)) mapDefault!28269)))))

(assert (= (and start!75288 res!601955) b!886901))

(assert (= (and b!886898 condMapEmpty!28269) mapIsEmpty!28269))

(assert (= (and b!886898 (not condMapEmpty!28269)) mapNonEmpty!28269))

(get-info :version)

(assert (= (and mapNonEmpty!28269 ((_ is ValueCellFull!8435) mapValue!28269)) b!886902))

(assert (= (and b!886898 ((_ is ValueCellFull!8435) mapDefault!28269)) b!886899))

(assert (= b!886903 b!886898))

(assert (= b!886900 b!886903))

(assert (= b!886897 b!886900))

(assert (= start!75288 b!886897))

(declare-fun m!826113 () Bool)

(assert (=> mapNonEmpty!28269 m!826113))

(declare-fun m!826115 () Bool)

(assert (=> b!886901 m!826115))

(declare-fun m!826117 () Bool)

(assert (=> b!886901 m!826117))

(declare-fun m!826119 () Bool)

(assert (=> b!886903 m!826119))

(declare-fun m!826121 () Bool)

(assert (=> b!886903 m!826121))

(declare-fun m!826123 () Bool)

(assert (=> start!75288 m!826123))

(check-sat tp_is_empty!17833 (not b_next!15505) (not b!886903) (not b!886901) (not start!75288) (not mapNonEmpty!28269) b_and!25685)
(check-sat b_and!25685 (not b_next!15505))
