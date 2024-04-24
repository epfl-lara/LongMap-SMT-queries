; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76310 () Bool)

(assert start!76310)

(declare-fun b!895395 () Bool)

(declare-fun b_free!15871 () Bool)

(declare-fun b_next!15871 () Bool)

(assert (=> b!895395 (= b_free!15871 (not b_next!15871))))

(declare-fun tp!55601 () Bool)

(declare-fun b_and!26173 () Bool)

(assert (=> b!895395 (= tp!55601 b_and!26173)))

(declare-fun tp_is_empty!18199 () Bool)

(declare-fun e!500204 () Bool)

(declare-fun e!500208 () Bool)

(declare-datatypes ((array!52427 0))(
  ( (array!52428 (arr!25210 (Array (_ BitVec 32) (_ BitVec 64))) (size!25657 (_ BitVec 32))) )
))
(declare-datatypes ((V!29231 0))(
  ( (V!29232 (val!9150 Int)) )
))
(declare-datatypes ((ValueCell!8618 0))(
  ( (ValueCellFull!8618 (v!11637 V!29231)) (EmptyCell!8618) )
))
(declare-datatypes ((array!52429 0))(
  ( (array!52430 (arr!25211 (Array (_ BitVec 32) ValueCell!8618)) (size!25658 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4252 0))(
  ( (LongMapFixedSize!4253 (defaultEntry!5338 Int) (mask!25940 (_ BitVec 32)) (extraKeys!5034 (_ BitVec 32)) (zeroValue!5138 V!29231) (minValue!5138 V!29231) (_size!2181 (_ BitVec 32)) (_keys!10063 array!52427) (_values!5325 array!52429) (_vacant!2181 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4252)

(declare-fun array_inv!19844 (array!52427) Bool)

(declare-fun array_inv!19845 (array!52429) Bool)

(assert (=> b!895395 (= e!500204 (and tp!55601 tp_is_empty!18199 (array_inv!19844 (_keys!10063 thiss!1181)) (array_inv!19845 (_values!5325 thiss!1181)) e!500208))))

(declare-fun b!895396 () Bool)

(declare-fun res!605706 () Bool)

(declare-fun e!500206 () Bool)

(assert (=> b!895396 (=> (not res!605706) (not e!500206))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895396 (= res!605706 (not (= key!785 (bvneg key!785))))))

(declare-fun res!605705 () Bool)

(assert (=> start!76310 (=> (not res!605705) (not e!500206))))

(declare-fun valid!1656 (LongMapFixedSize!4252) Bool)

(assert (=> start!76310 (= res!605705 (valid!1656 thiss!1181))))

(assert (=> start!76310 e!500206))

(assert (=> start!76310 e!500204))

(assert (=> start!76310 true))

(declare-fun b!895397 () Bool)

(declare-fun e!500205 () Bool)

(assert (=> b!895397 (= e!500205 tp_is_empty!18199)))

(declare-fun b!895398 () Bool)

(declare-fun e!500203 () Bool)

(assert (=> b!895398 (= e!500203 tp_is_empty!18199)))

(declare-fun b!895399 () Bool)

(declare-fun mapRes!28872 () Bool)

(assert (=> b!895399 (= e!500208 (and e!500203 mapRes!28872))))

(declare-fun condMapEmpty!28872 () Bool)

(declare-fun mapDefault!28872 () ValueCell!8618)

(assert (=> b!895399 (= condMapEmpty!28872 (= (arr!25211 (_values!5325 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8618)) mapDefault!28872)))))

(declare-fun b!895400 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895400 (= e!500206 (not (validMask!0 (mask!25940 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8822 0))(
  ( (MissingZero!8822 (index!37659 (_ BitVec 32))) (Found!8822 (index!37660 (_ BitVec 32))) (Intermediate!8822 (undefined!9634 Bool) (index!37661 (_ BitVec 32)) (x!76016 (_ BitVec 32))) (Undefined!8822) (MissingVacant!8822 (index!37662 (_ BitVec 32))) )
))
(declare-fun lt!404648 () SeekEntryResult!8822)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8822)

(assert (=> b!895400 (= lt!404648 (seekEntry!0 key!785 (_keys!10063 thiss!1181) (mask!25940 thiss!1181)))))

(declare-fun mapNonEmpty!28872 () Bool)

(declare-fun tp!55602 () Bool)

(assert (=> mapNonEmpty!28872 (= mapRes!28872 (and tp!55602 e!500205))))

(declare-fun mapRest!28872 () (Array (_ BitVec 32) ValueCell!8618))

(declare-fun mapKey!28872 () (_ BitVec 32))

(declare-fun mapValue!28872 () ValueCell!8618)

(assert (=> mapNonEmpty!28872 (= (arr!25211 (_values!5325 thiss!1181)) (store mapRest!28872 mapKey!28872 mapValue!28872))))

(declare-fun mapIsEmpty!28872 () Bool)

(assert (=> mapIsEmpty!28872 mapRes!28872))

(assert (= (and start!76310 res!605705) b!895396))

(assert (= (and b!895396 res!605706) b!895400))

(assert (= (and b!895399 condMapEmpty!28872) mapIsEmpty!28872))

(assert (= (and b!895399 (not condMapEmpty!28872)) mapNonEmpty!28872))

(get-info :version)

(assert (= (and mapNonEmpty!28872 ((_ is ValueCellFull!8618) mapValue!28872)) b!895397))

(assert (= (and b!895399 ((_ is ValueCellFull!8618) mapDefault!28872)) b!895398))

(assert (= b!895395 b!895399))

(assert (= start!76310 b!895395))

(declare-fun m!833835 () Bool)

(assert (=> b!895395 m!833835))

(declare-fun m!833837 () Bool)

(assert (=> b!895395 m!833837))

(declare-fun m!833839 () Bool)

(assert (=> start!76310 m!833839))

(declare-fun m!833841 () Bool)

(assert (=> b!895400 m!833841))

(declare-fun m!833843 () Bool)

(assert (=> b!895400 m!833843))

(declare-fun m!833845 () Bool)

(assert (=> mapNonEmpty!28872 m!833845))

(check-sat tp_is_empty!18199 (not start!76310) (not b!895400) (not b_next!15871) b_and!26173 (not b!895395) (not mapNonEmpty!28872))
(check-sat b_and!26173 (not b_next!15871))
(get-model)

(declare-fun d!110977 () Bool)

(assert (=> d!110977 (= (validMask!0 (mask!25940 thiss!1181)) (and (or (= (mask!25940 thiss!1181) #b00000000000000000000000000000111) (= (mask!25940 thiss!1181) #b00000000000000000000000000001111) (= (mask!25940 thiss!1181) #b00000000000000000000000000011111) (= (mask!25940 thiss!1181) #b00000000000000000000000000111111) (= (mask!25940 thiss!1181) #b00000000000000000000000001111111) (= (mask!25940 thiss!1181) #b00000000000000000000000011111111) (= (mask!25940 thiss!1181) #b00000000000000000000000111111111) (= (mask!25940 thiss!1181) #b00000000000000000000001111111111) (= (mask!25940 thiss!1181) #b00000000000000000000011111111111) (= (mask!25940 thiss!1181) #b00000000000000000000111111111111) (= (mask!25940 thiss!1181) #b00000000000000000001111111111111) (= (mask!25940 thiss!1181) #b00000000000000000011111111111111) (= (mask!25940 thiss!1181) #b00000000000000000111111111111111) (= (mask!25940 thiss!1181) #b00000000000000001111111111111111) (= (mask!25940 thiss!1181) #b00000000000000011111111111111111) (= (mask!25940 thiss!1181) #b00000000000000111111111111111111) (= (mask!25940 thiss!1181) #b00000000000001111111111111111111) (= (mask!25940 thiss!1181) #b00000000000011111111111111111111) (= (mask!25940 thiss!1181) #b00000000000111111111111111111111) (= (mask!25940 thiss!1181) #b00000000001111111111111111111111) (= (mask!25940 thiss!1181) #b00000000011111111111111111111111) (= (mask!25940 thiss!1181) #b00000000111111111111111111111111) (= (mask!25940 thiss!1181) #b00000001111111111111111111111111) (= (mask!25940 thiss!1181) #b00000011111111111111111111111111) (= (mask!25940 thiss!1181) #b00000111111111111111111111111111) (= (mask!25940 thiss!1181) #b00001111111111111111111111111111) (= (mask!25940 thiss!1181) #b00011111111111111111111111111111) (= (mask!25940 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25940 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895400 d!110977))

(declare-fun b!895449 () Bool)

(declare-fun e!500253 () SeekEntryResult!8822)

(declare-fun e!500251 () SeekEntryResult!8822)

(assert (=> b!895449 (= e!500253 e!500251)))

(declare-fun lt!404665 () (_ BitVec 64))

(declare-fun lt!404664 () SeekEntryResult!8822)

(assert (=> b!895449 (= lt!404665 (select (arr!25210 (_keys!10063 thiss!1181)) (index!37661 lt!404664)))))

(declare-fun c!94691 () Bool)

(assert (=> b!895449 (= c!94691 (= lt!404665 key!785))))

(declare-fun b!895451 () Bool)

(assert (=> b!895451 (= e!500253 Undefined!8822)))

(declare-fun b!895452 () Bool)

(declare-fun c!94690 () Bool)

(assert (=> b!895452 (= c!94690 (= lt!404665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500252 () SeekEntryResult!8822)

(assert (=> b!895452 (= e!500251 e!500252)))

(declare-fun b!895453 () Bool)

(assert (=> b!895453 (= e!500251 (Found!8822 (index!37661 lt!404664)))))

(declare-fun b!895454 () Bool)

(declare-fun lt!404666 () SeekEntryResult!8822)

(assert (=> b!895454 (= e!500252 (ite ((_ is MissingVacant!8822) lt!404666) (MissingZero!8822 (index!37662 lt!404666)) lt!404666))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8822)

(assert (=> b!895454 (= lt!404666 (seekKeyOrZeroReturnVacant!0 (x!76016 lt!404664) (index!37661 lt!404664) (index!37661 lt!404664) key!785 (_keys!10063 thiss!1181) (mask!25940 thiss!1181)))))

(declare-fun b!895450 () Bool)

(assert (=> b!895450 (= e!500252 (MissingZero!8822 (index!37661 lt!404664)))))

(declare-fun d!110979 () Bool)

(declare-fun lt!404663 () SeekEntryResult!8822)

(assert (=> d!110979 (and (or ((_ is MissingVacant!8822) lt!404663) (not ((_ is Found!8822) lt!404663)) (and (bvsge (index!37660 lt!404663) #b00000000000000000000000000000000) (bvslt (index!37660 lt!404663) (size!25657 (_keys!10063 thiss!1181))))) (not ((_ is MissingVacant!8822) lt!404663)) (or (not ((_ is Found!8822) lt!404663)) (= (select (arr!25210 (_keys!10063 thiss!1181)) (index!37660 lt!404663)) key!785)))))

(assert (=> d!110979 (= lt!404663 e!500253)))

(declare-fun c!94689 () Bool)

(assert (=> d!110979 (= c!94689 (and ((_ is Intermediate!8822) lt!404664) (undefined!9634 lt!404664)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110979 (= lt!404664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25940 thiss!1181)) key!785 (_keys!10063 thiss!1181) (mask!25940 thiss!1181)))))

(assert (=> d!110979 (validMask!0 (mask!25940 thiss!1181))))

(assert (=> d!110979 (= (seekEntry!0 key!785 (_keys!10063 thiss!1181) (mask!25940 thiss!1181)) lt!404663)))

(assert (= (and d!110979 c!94689) b!895451))

(assert (= (and d!110979 (not c!94689)) b!895449))

(assert (= (and b!895449 c!94691) b!895453))

(assert (= (and b!895449 (not c!94691)) b!895452))

(assert (= (and b!895452 c!94690) b!895450))

(assert (= (and b!895452 (not c!94690)) b!895454))

(declare-fun m!833871 () Bool)

(assert (=> b!895449 m!833871))

(declare-fun m!833873 () Bool)

(assert (=> b!895454 m!833873))

(declare-fun m!833875 () Bool)

(assert (=> d!110979 m!833875))

(declare-fun m!833877 () Bool)

(assert (=> d!110979 m!833877))

(assert (=> d!110979 m!833877))

(declare-fun m!833879 () Bool)

(assert (=> d!110979 m!833879))

(assert (=> d!110979 m!833841))

(assert (=> b!895400 d!110979))

(declare-fun d!110981 () Bool)

(assert (=> d!110981 (= (array_inv!19844 (_keys!10063 thiss!1181)) (bvsge (size!25657 (_keys!10063 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895395 d!110981))

(declare-fun d!110983 () Bool)

(assert (=> d!110983 (= (array_inv!19845 (_values!5325 thiss!1181)) (bvsge (size!25658 (_values!5325 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895395 d!110983))

(declare-fun d!110985 () Bool)

(declare-fun res!605725 () Bool)

(declare-fun e!500256 () Bool)

(assert (=> d!110985 (=> (not res!605725) (not e!500256))))

(declare-fun simpleValid!300 (LongMapFixedSize!4252) Bool)

(assert (=> d!110985 (= res!605725 (simpleValid!300 thiss!1181))))

(assert (=> d!110985 (= (valid!1656 thiss!1181) e!500256)))

(declare-fun b!895461 () Bool)

(declare-fun res!605726 () Bool)

(assert (=> b!895461 (=> (not res!605726) (not e!500256))))

(declare-fun arrayCountValidKeys!0 (array!52427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895461 (= res!605726 (= (arrayCountValidKeys!0 (_keys!10063 thiss!1181) #b00000000000000000000000000000000 (size!25657 (_keys!10063 thiss!1181))) (_size!2181 thiss!1181)))))

(declare-fun b!895462 () Bool)

(declare-fun res!605727 () Bool)

(assert (=> b!895462 (=> (not res!605727) (not e!500256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52427 (_ BitVec 32)) Bool)

(assert (=> b!895462 (= res!605727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10063 thiss!1181) (mask!25940 thiss!1181)))))

(declare-fun b!895463 () Bool)

(declare-datatypes ((List!17759 0))(
  ( (Nil!17756) (Cons!17755 (h!18894 (_ BitVec 64)) (t!25090 List!17759)) )
))
(declare-fun arrayNoDuplicates!0 (array!52427 (_ BitVec 32) List!17759) Bool)

(assert (=> b!895463 (= e!500256 (arrayNoDuplicates!0 (_keys!10063 thiss!1181) #b00000000000000000000000000000000 Nil!17756))))

(assert (= (and d!110985 res!605725) b!895461))

(assert (= (and b!895461 res!605726) b!895462))

(assert (= (and b!895462 res!605727) b!895463))

(declare-fun m!833881 () Bool)

(assert (=> d!110985 m!833881))

(declare-fun m!833883 () Bool)

(assert (=> b!895461 m!833883))

(declare-fun m!833885 () Bool)

(assert (=> b!895462 m!833885))

(declare-fun m!833887 () Bool)

(assert (=> b!895463 m!833887))

(assert (=> start!76310 d!110985))

(declare-fun b!895470 () Bool)

(declare-fun e!500261 () Bool)

(assert (=> b!895470 (= e!500261 tp_is_empty!18199)))

(declare-fun mapIsEmpty!28881 () Bool)

(declare-fun mapRes!28881 () Bool)

(assert (=> mapIsEmpty!28881 mapRes!28881))

(declare-fun condMapEmpty!28881 () Bool)

(declare-fun mapDefault!28881 () ValueCell!8618)

(assert (=> mapNonEmpty!28872 (= condMapEmpty!28881 (= mapRest!28872 ((as const (Array (_ BitVec 32) ValueCell!8618)) mapDefault!28881)))))

(declare-fun e!500262 () Bool)

(assert (=> mapNonEmpty!28872 (= tp!55602 (and e!500262 mapRes!28881))))

(declare-fun mapNonEmpty!28881 () Bool)

(declare-fun tp!55617 () Bool)

(assert (=> mapNonEmpty!28881 (= mapRes!28881 (and tp!55617 e!500261))))

(declare-fun mapKey!28881 () (_ BitVec 32))

(declare-fun mapRest!28881 () (Array (_ BitVec 32) ValueCell!8618))

(declare-fun mapValue!28881 () ValueCell!8618)

(assert (=> mapNonEmpty!28881 (= mapRest!28872 (store mapRest!28881 mapKey!28881 mapValue!28881))))

(declare-fun b!895471 () Bool)

(assert (=> b!895471 (= e!500262 tp_is_empty!18199)))

(assert (= (and mapNonEmpty!28872 condMapEmpty!28881) mapIsEmpty!28881))

(assert (= (and mapNonEmpty!28872 (not condMapEmpty!28881)) mapNonEmpty!28881))

(assert (= (and mapNonEmpty!28881 ((_ is ValueCellFull!8618) mapValue!28881)) b!895470))

(assert (= (and mapNonEmpty!28872 ((_ is ValueCellFull!8618) mapDefault!28881)) b!895471))

(declare-fun m!833889 () Bool)

(assert (=> mapNonEmpty!28881 m!833889))

(check-sat (not mapNonEmpty!28881) tp_is_empty!18199 (not d!110979) (not b!895461) (not b!895454) (not b_next!15871) (not b!895463) (not b!895462) (not d!110985) b_and!26173)
(check-sat b_and!26173 (not b_next!15871))
