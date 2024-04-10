; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75288 () Bool)

(assert start!75288)

(declare-fun b!887014 () Bool)

(declare-fun b_free!15495 () Bool)

(declare-fun b_next!15495 () Bool)

(assert (=> b!887014 (= b_free!15495 (not b_next!15495))))

(declare-fun tp!54415 () Bool)

(declare-fun b_and!25701 () Bool)

(assert (=> b!887014 (= tp!54415 b_and!25701)))

(declare-fun tp_is_empty!17823 () Bool)

(declare-fun e!493836 () Bool)

(declare-datatypes ((V!28729 0))(
  ( (V!28730 (val!8962 Int)) )
))
(declare-datatypes ((ValueCell!8430 0))(
  ( (ValueCellFull!8430 (v!11404 V!28729)) (EmptyCell!8430) )
))
(declare-datatypes ((array!51604 0))(
  ( (array!51605 (arr!24819 (Array (_ BitVec 32) ValueCell!8430)) (size!25259 (_ BitVec 32))) )
))
(declare-datatypes ((array!51606 0))(
  ( (array!51607 (arr!24820 (Array (_ BitVec 32) (_ BitVec 64))) (size!25260 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3876 0))(
  ( (LongMapFixedSize!3877 (defaultEntry!5126 Int) (mask!25515 (_ BitVec 32)) (extraKeys!4819 (_ BitVec 32)) (zeroValue!4923 V!28729) (minValue!4923 V!28729) (_size!1993 (_ BitVec 32)) (_keys!9801 array!51606) (_values!5110 array!51604) (_vacant!1993 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1036 0))(
  ( (Cell!1037 (v!11405 LongMapFixedSize!3876)) )
))
(declare-datatypes ((LongMap!1036 0))(
  ( (LongMap!1037 (underlying!529 Cell!1036)) )
))
(declare-fun thiss!833 () LongMap!1036)

(declare-fun e!493834 () Bool)

(declare-fun array_inv!19540 (array!51606) Bool)

(declare-fun array_inv!19541 (array!51604) Bool)

(assert (=> b!887014 (= e!493834 (and tp!54415 tp_is_empty!17823 (array_inv!19540 (_keys!9801 (v!11405 (underlying!529 thiss!833)))) (array_inv!19541 (_values!5110 (v!11405 (underlying!529 thiss!833)))) e!493836))))

(declare-fun b!887015 () Bool)

(declare-fun e!493835 () Bool)

(assert (=> b!887015 (= e!493835 tp_is_empty!17823)))

(declare-fun res!602041 () Bool)

(declare-fun e!493838 () Bool)

(assert (=> start!75288 (=> (not res!602041) (not e!493838))))

(declare-fun valid!1508 (LongMap!1036) Bool)

(assert (=> start!75288 (= res!602041 (valid!1508 thiss!833))))

(assert (=> start!75288 e!493838))

(declare-fun e!493839 () Bool)

(assert (=> start!75288 e!493839))

(declare-fun b!887016 () Bool)

(declare-fun e!493832 () Bool)

(assert (=> b!887016 (= e!493832 tp_is_empty!17823)))

(declare-fun b!887017 () Bool)

(declare-fun mapRes!28251 () Bool)

(assert (=> b!887017 (= e!493836 (and e!493835 mapRes!28251))))

(declare-fun condMapEmpty!28251 () Bool)

(declare-fun mapDefault!28251 () ValueCell!8430)

(assert (=> b!887017 (= condMapEmpty!28251 (= (arr!24819 (_values!5110 (v!11405 (underlying!529 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8430)) mapDefault!28251)))))

(declare-fun mapNonEmpty!28251 () Bool)

(declare-fun tp!54416 () Bool)

(assert (=> mapNonEmpty!28251 (= mapRes!28251 (and tp!54416 e!493832))))

(declare-fun mapValue!28251 () ValueCell!8430)

(declare-fun mapRest!28251 () (Array (_ BitVec 32) ValueCell!8430))

(declare-fun mapKey!28251 () (_ BitVec 32))

(assert (=> mapNonEmpty!28251 (= (arr!24819 (_values!5110 (v!11405 (underlying!529 thiss!833)))) (store mapRest!28251 mapKey!28251 mapValue!28251))))

(declare-fun b!887018 () Bool)

(declare-fun e!493837 () Bool)

(assert (=> b!887018 (= e!493837 e!493834)))

(declare-fun b!887019 () Bool)

(declare-fun valid!1509 (LongMapFixedSize!3876) Bool)

(assert (=> b!887019 (= e!493838 (not (valid!1509 (v!11405 (underlying!529 thiss!833)))))))

(declare-fun mapIsEmpty!28251 () Bool)

(assert (=> mapIsEmpty!28251 mapRes!28251))

(declare-fun b!887020 () Bool)

(assert (=> b!887020 (= e!493839 e!493837)))

(assert (= (and start!75288 res!602041) b!887019))

(assert (= (and b!887017 condMapEmpty!28251) mapIsEmpty!28251))

(assert (= (and b!887017 (not condMapEmpty!28251)) mapNonEmpty!28251))

(get-info :version)

(assert (= (and mapNonEmpty!28251 ((_ is ValueCellFull!8430) mapValue!28251)) b!887016))

(assert (= (and b!887017 ((_ is ValueCellFull!8430) mapDefault!28251)) b!887015))

(assert (= b!887014 b!887017))

(assert (= b!887018 b!887014))

(assert (= b!887020 b!887018))

(assert (= start!75288 b!887020))

(declare-fun m!826811 () Bool)

(assert (=> b!887014 m!826811))

(declare-fun m!826813 () Bool)

(assert (=> b!887014 m!826813))

(declare-fun m!826815 () Bool)

(assert (=> start!75288 m!826815))

(declare-fun m!826817 () Bool)

(assert (=> mapNonEmpty!28251 m!826817))

(declare-fun m!826819 () Bool)

(assert (=> b!887019 m!826819))

(check-sat b_and!25701 (not start!75288) tp_is_empty!17823 (not b!887019) (not b!887014) (not mapNonEmpty!28251) (not b_next!15495))
(check-sat b_and!25701 (not b_next!15495))
(get-model)

(declare-fun d!109873 () Bool)

(assert (=> d!109873 (= (valid!1508 thiss!833) (valid!1509 (v!11405 (underlying!529 thiss!833))))))

(declare-fun bs!24861 () Bool)

(assert (= bs!24861 d!109873))

(assert (=> bs!24861 m!826819))

(assert (=> start!75288 d!109873))

(declare-fun d!109875 () Bool)

(assert (=> d!109875 (= (array_inv!19540 (_keys!9801 (v!11405 (underlying!529 thiss!833)))) (bvsge (size!25260 (_keys!9801 (v!11405 (underlying!529 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887014 d!109875))

(declare-fun d!109877 () Bool)

(assert (=> d!109877 (= (array_inv!19541 (_values!5110 (v!11405 (underlying!529 thiss!833)))) (bvsge (size!25259 (_values!5110 (v!11405 (underlying!529 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887014 d!109877))

(declare-fun d!109879 () Bool)

(declare-fun res!602051 () Bool)

(declare-fun e!493866 () Bool)

(assert (=> d!109879 (=> (not res!602051) (not e!493866))))

(declare-fun simpleValid!286 (LongMapFixedSize!3876) Bool)

(assert (=> d!109879 (= res!602051 (simpleValid!286 (v!11405 (underlying!529 thiss!833))))))

(assert (=> d!109879 (= (valid!1509 (v!11405 (underlying!529 thiss!833))) e!493866)))

(declare-fun b!887048 () Bool)

(declare-fun res!602052 () Bool)

(assert (=> b!887048 (=> (not res!602052) (not e!493866))))

(declare-fun arrayCountValidKeys!0 (array!51606 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887048 (= res!602052 (= (arrayCountValidKeys!0 (_keys!9801 (v!11405 (underlying!529 thiss!833))) #b00000000000000000000000000000000 (size!25260 (_keys!9801 (v!11405 (underlying!529 thiss!833))))) (_size!1993 (v!11405 (underlying!529 thiss!833)))))))

(declare-fun b!887049 () Bool)

(declare-fun res!602053 () Bool)

(assert (=> b!887049 (=> (not res!602053) (not e!493866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51606 (_ BitVec 32)) Bool)

(assert (=> b!887049 (= res!602053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9801 (v!11405 (underlying!529 thiss!833))) (mask!25515 (v!11405 (underlying!529 thiss!833)))))))

(declare-fun b!887050 () Bool)

(declare-datatypes ((List!17677 0))(
  ( (Nil!17674) (Cons!17673 (h!18804 (_ BitVec 64)) (t!24960 List!17677)) )
))
(declare-fun arrayNoDuplicates!0 (array!51606 (_ BitVec 32) List!17677) Bool)

(assert (=> b!887050 (= e!493866 (arrayNoDuplicates!0 (_keys!9801 (v!11405 (underlying!529 thiss!833))) #b00000000000000000000000000000000 Nil!17674))))

(assert (= (and d!109879 res!602051) b!887048))

(assert (= (and b!887048 res!602052) b!887049))

(assert (= (and b!887049 res!602053) b!887050))

(declare-fun m!826831 () Bool)

(assert (=> d!109879 m!826831))

(declare-fun m!826833 () Bool)

(assert (=> b!887048 m!826833))

(declare-fun m!826835 () Bool)

(assert (=> b!887049 m!826835))

(declare-fun m!826837 () Bool)

(assert (=> b!887050 m!826837))

(assert (=> b!887019 d!109879))

(declare-fun mapNonEmpty!28257 () Bool)

(declare-fun mapRes!28257 () Bool)

(declare-fun tp!54425 () Bool)

(declare-fun e!493871 () Bool)

(assert (=> mapNonEmpty!28257 (= mapRes!28257 (and tp!54425 e!493871))))

(declare-fun mapRest!28257 () (Array (_ BitVec 32) ValueCell!8430))

(declare-fun mapKey!28257 () (_ BitVec 32))

(declare-fun mapValue!28257 () ValueCell!8430)

(assert (=> mapNonEmpty!28257 (= mapRest!28251 (store mapRest!28257 mapKey!28257 mapValue!28257))))

(declare-fun condMapEmpty!28257 () Bool)

(declare-fun mapDefault!28257 () ValueCell!8430)

(assert (=> mapNonEmpty!28251 (= condMapEmpty!28257 (= mapRest!28251 ((as const (Array (_ BitVec 32) ValueCell!8430)) mapDefault!28257)))))

(declare-fun e!493872 () Bool)

(assert (=> mapNonEmpty!28251 (= tp!54416 (and e!493872 mapRes!28257))))

(declare-fun mapIsEmpty!28257 () Bool)

(assert (=> mapIsEmpty!28257 mapRes!28257))

(declare-fun b!887057 () Bool)

(assert (=> b!887057 (= e!493871 tp_is_empty!17823)))

(declare-fun b!887058 () Bool)

(assert (=> b!887058 (= e!493872 tp_is_empty!17823)))

(assert (= (and mapNonEmpty!28251 condMapEmpty!28257) mapIsEmpty!28257))

(assert (= (and mapNonEmpty!28251 (not condMapEmpty!28257)) mapNonEmpty!28257))

(assert (= (and mapNonEmpty!28257 ((_ is ValueCellFull!8430) mapValue!28257)) b!887057))

(assert (= (and mapNonEmpty!28251 ((_ is ValueCellFull!8430) mapDefault!28257)) b!887058))

(declare-fun m!826839 () Bool)

(assert (=> mapNonEmpty!28257 m!826839))

(check-sat (not d!109873) (not b!887049) b_and!25701 (not d!109879) (not mapNonEmpty!28257) tp_is_empty!17823 (not b!887050) (not b!887048) (not b_next!15495))
(check-sat b_and!25701 (not b_next!15495))
