; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76124 () Bool)

(assert start!76124)

(declare-fun b!894254 () Bool)

(declare-fun b_free!15871 () Bool)

(declare-fun b_next!15871 () Bool)

(assert (=> b!894254 (= b_free!15871 (not b_next!15871))))

(declare-fun tp!55602 () Bool)

(declare-fun b_and!26137 () Bool)

(assert (=> b!894254 (= tp!55602 b_and!26137)))

(declare-fun mapIsEmpty!28872 () Bool)

(declare-fun mapRes!28872 () Bool)

(assert (=> mapIsEmpty!28872 mapRes!28872))

(declare-fun b!894253 () Bool)

(declare-fun e!499474 () Bool)

(declare-datatypes ((array!52371 0))(
  ( (array!52372 (arr!25187 (Array (_ BitVec 32) (_ BitVec 64))) (size!25635 (_ BitVec 32))) )
))
(declare-datatypes ((V!29231 0))(
  ( (V!29232 (val!9150 Int)) )
))
(declare-datatypes ((ValueCell!8618 0))(
  ( (ValueCellFull!8618 (v!11637 V!29231)) (EmptyCell!8618) )
))
(declare-datatypes ((array!52373 0))(
  ( (array!52374 (arr!25188 (Array (_ BitVec 32) ValueCell!8618)) (size!25636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4252 0))(
  ( (LongMapFixedSize!4253 (defaultEntry!5338 Int) (mask!25890 (_ BitVec 32)) (extraKeys!5034 (_ BitVec 32)) (zeroValue!5138 V!29231) (minValue!5138 V!29231) (_size!2181 (_ BitVec 32)) (_keys!10030 array!52371) (_values!5325 array!52373) (_vacant!2181 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4252)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894253 (= e!499474 (not (validMask!0 (mask!25890 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8873 0))(
  ( (MissingZero!8873 (index!37863 (_ BitVec 32))) (Found!8873 (index!37864 (_ BitVec 32))) (Intermediate!8873 (undefined!9685 Bool) (index!37865 (_ BitVec 32)) (x!76048 (_ BitVec 32))) (Undefined!8873) (MissingVacant!8873 (index!37866 (_ BitVec 32))) )
))
(declare-fun lt!404051 () SeekEntryResult!8873)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!894253 (= lt!404051 (seekEntry!0 key!785 (_keys!10030 thiss!1181) (mask!25890 thiss!1181)))))

(declare-fun tp_is_empty!18199 () Bool)

(declare-fun e!499476 () Bool)

(declare-fun e!499473 () Bool)

(declare-fun array_inv!19832 (array!52371) Bool)

(declare-fun array_inv!19833 (array!52373) Bool)

(assert (=> b!894254 (= e!499476 (and tp!55602 tp_is_empty!18199 (array_inv!19832 (_keys!10030 thiss!1181)) (array_inv!19833 (_values!5325 thiss!1181)) e!499473))))

(declare-fun res!605252 () Bool)

(assert (=> start!76124 (=> (not res!605252) (not e!499474))))

(declare-fun valid!1651 (LongMapFixedSize!4252) Bool)

(assert (=> start!76124 (= res!605252 (valid!1651 thiss!1181))))

(assert (=> start!76124 e!499474))

(assert (=> start!76124 e!499476))

(assert (=> start!76124 true))

(declare-fun b!894255 () Bool)

(declare-fun e!499478 () Bool)

(assert (=> b!894255 (= e!499473 (and e!499478 mapRes!28872))))

(declare-fun condMapEmpty!28872 () Bool)

(declare-fun mapDefault!28872 () ValueCell!8618)

(assert (=> b!894255 (= condMapEmpty!28872 (= (arr!25188 (_values!5325 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8618)) mapDefault!28872)))))

(declare-fun b!894256 () Bool)

(assert (=> b!894256 (= e!499478 tp_is_empty!18199)))

(declare-fun mapNonEmpty!28872 () Bool)

(declare-fun tp!55601 () Bool)

(declare-fun e!499475 () Bool)

(assert (=> mapNonEmpty!28872 (= mapRes!28872 (and tp!55601 e!499475))))

(declare-fun mapValue!28872 () ValueCell!8618)

(declare-fun mapRest!28872 () (Array (_ BitVec 32) ValueCell!8618))

(declare-fun mapKey!28872 () (_ BitVec 32))

(assert (=> mapNonEmpty!28872 (= (arr!25188 (_values!5325 thiss!1181)) (store mapRest!28872 mapKey!28872 mapValue!28872))))

(declare-fun b!894257 () Bool)

(assert (=> b!894257 (= e!499475 tp_is_empty!18199)))

(declare-fun b!894258 () Bool)

(declare-fun res!605251 () Bool)

(assert (=> b!894258 (=> (not res!605251) (not e!499474))))

(assert (=> b!894258 (= res!605251 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76124 res!605252) b!894258))

(assert (= (and b!894258 res!605251) b!894253))

(assert (= (and b!894255 condMapEmpty!28872) mapIsEmpty!28872))

(assert (= (and b!894255 (not condMapEmpty!28872)) mapNonEmpty!28872))

(get-info :version)

(assert (= (and mapNonEmpty!28872 ((_ is ValueCellFull!8618) mapValue!28872)) b!894257))

(assert (= (and b!894255 ((_ is ValueCellFull!8618) mapDefault!28872)) b!894256))

(assert (= b!894254 b!894255))

(assert (= start!76124 b!894254))

(declare-fun m!831783 () Bool)

(assert (=> b!894253 m!831783))

(declare-fun m!831785 () Bool)

(assert (=> b!894253 m!831785))

(declare-fun m!831787 () Bool)

(assert (=> b!894254 m!831787))

(declare-fun m!831789 () Bool)

(assert (=> b!894254 m!831789))

(declare-fun m!831791 () Bool)

(assert (=> start!76124 m!831791))

(declare-fun m!831793 () Bool)

(assert (=> mapNonEmpty!28872 m!831793))

(check-sat (not start!76124) (not mapNonEmpty!28872) (not b_next!15871) (not b!894253) b_and!26137 tp_is_empty!18199 (not b!894254))
(check-sat b_and!26137 (not b_next!15871))
(get-model)

(declare-fun d!110457 () Bool)

(declare-fun res!605271 () Bool)

(declare-fun e!499517 () Bool)

(assert (=> d!110457 (=> (not res!605271) (not e!499517))))

(declare-fun simpleValid!300 (LongMapFixedSize!4252) Bool)

(assert (=> d!110457 (= res!605271 (simpleValid!300 thiss!1181))))

(assert (=> d!110457 (= (valid!1651 thiss!1181) e!499517)))

(declare-fun b!894301 () Bool)

(declare-fun res!605272 () Bool)

(assert (=> b!894301 (=> (not res!605272) (not e!499517))))

(declare-fun arrayCountValidKeys!0 (array!52371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894301 (= res!605272 (= (arrayCountValidKeys!0 (_keys!10030 thiss!1181) #b00000000000000000000000000000000 (size!25635 (_keys!10030 thiss!1181))) (_size!2181 thiss!1181)))))

(declare-fun b!894302 () Bool)

(declare-fun res!605273 () Bool)

(assert (=> b!894302 (=> (not res!605273) (not e!499517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52371 (_ BitVec 32)) Bool)

(assert (=> b!894302 (= res!605273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10030 thiss!1181) (mask!25890 thiss!1181)))))

(declare-fun b!894303 () Bool)

(declare-datatypes ((List!17815 0))(
  ( (Nil!17812) (Cons!17811 (h!18944 (_ BitVec 64)) (t!25145 List!17815)) )
))
(declare-fun arrayNoDuplicates!0 (array!52371 (_ BitVec 32) List!17815) Bool)

(assert (=> b!894303 (= e!499517 (arrayNoDuplicates!0 (_keys!10030 thiss!1181) #b00000000000000000000000000000000 Nil!17812))))

(assert (= (and d!110457 res!605271) b!894301))

(assert (= (and b!894301 res!605272) b!894302))

(assert (= (and b!894302 res!605273) b!894303))

(declare-fun m!831819 () Bool)

(assert (=> d!110457 m!831819))

(declare-fun m!831821 () Bool)

(assert (=> b!894301 m!831821))

(declare-fun m!831823 () Bool)

(assert (=> b!894302 m!831823))

(declare-fun m!831825 () Bool)

(assert (=> b!894303 m!831825))

(assert (=> start!76124 d!110457))

(declare-fun d!110459 () Bool)

(assert (=> d!110459 (= (validMask!0 (mask!25890 thiss!1181)) (and (or (= (mask!25890 thiss!1181) #b00000000000000000000000000000111) (= (mask!25890 thiss!1181) #b00000000000000000000000000001111) (= (mask!25890 thiss!1181) #b00000000000000000000000000011111) (= (mask!25890 thiss!1181) #b00000000000000000000000000111111) (= (mask!25890 thiss!1181) #b00000000000000000000000001111111) (= (mask!25890 thiss!1181) #b00000000000000000000000011111111) (= (mask!25890 thiss!1181) #b00000000000000000000000111111111) (= (mask!25890 thiss!1181) #b00000000000000000000001111111111) (= (mask!25890 thiss!1181) #b00000000000000000000011111111111) (= (mask!25890 thiss!1181) #b00000000000000000000111111111111) (= (mask!25890 thiss!1181) #b00000000000000000001111111111111) (= (mask!25890 thiss!1181) #b00000000000000000011111111111111) (= (mask!25890 thiss!1181) #b00000000000000000111111111111111) (= (mask!25890 thiss!1181) #b00000000000000001111111111111111) (= (mask!25890 thiss!1181) #b00000000000000011111111111111111) (= (mask!25890 thiss!1181) #b00000000000000111111111111111111) (= (mask!25890 thiss!1181) #b00000000000001111111111111111111) (= (mask!25890 thiss!1181) #b00000000000011111111111111111111) (= (mask!25890 thiss!1181) #b00000000000111111111111111111111) (= (mask!25890 thiss!1181) #b00000000001111111111111111111111) (= (mask!25890 thiss!1181) #b00000000011111111111111111111111) (= (mask!25890 thiss!1181) #b00000000111111111111111111111111) (= (mask!25890 thiss!1181) #b00000001111111111111111111111111) (= (mask!25890 thiss!1181) #b00000011111111111111111111111111) (= (mask!25890 thiss!1181) #b00000111111111111111111111111111) (= (mask!25890 thiss!1181) #b00001111111111111111111111111111) (= (mask!25890 thiss!1181) #b00011111111111111111111111111111) (= (mask!25890 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25890 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894253 d!110459))

(declare-fun b!894316 () Bool)

(declare-fun e!499524 () SeekEntryResult!8873)

(declare-fun lt!404069 () SeekEntryResult!8873)

(assert (=> b!894316 (= e!499524 (ite ((_ is MissingVacant!8873) lt!404069) (MissingZero!8873 (index!37866 lt!404069)) lt!404069))))

(declare-fun lt!404067 () SeekEntryResult!8873)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!894316 (= lt!404069 (seekKeyOrZeroReturnVacant!0 (x!76048 lt!404067) (index!37865 lt!404067) (index!37865 lt!404067) key!785 (_keys!10030 thiss!1181) (mask!25890 thiss!1181)))))

(declare-fun b!894317 () Bool)

(assert (=> b!894317 (= e!499524 (MissingZero!8873 (index!37865 lt!404067)))))

(declare-fun b!894318 () Bool)

(declare-fun e!499526 () SeekEntryResult!8873)

(assert (=> b!894318 (= e!499526 Undefined!8873)))

(declare-fun b!894319 () Bool)

(declare-fun e!499525 () SeekEntryResult!8873)

(assert (=> b!894319 (= e!499525 (Found!8873 (index!37865 lt!404067)))))

(declare-fun b!894320 () Bool)

(declare-fun c!94343 () Bool)

(declare-fun lt!404068 () (_ BitVec 64))

(assert (=> b!894320 (= c!94343 (= lt!404068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894320 (= e!499525 e!499524)))

(declare-fun d!110461 () Bool)

(declare-fun lt!404066 () SeekEntryResult!8873)

(assert (=> d!110461 (and (or ((_ is MissingVacant!8873) lt!404066) (not ((_ is Found!8873) lt!404066)) (and (bvsge (index!37864 lt!404066) #b00000000000000000000000000000000) (bvslt (index!37864 lt!404066) (size!25635 (_keys!10030 thiss!1181))))) (not ((_ is MissingVacant!8873) lt!404066)) (or (not ((_ is Found!8873) lt!404066)) (= (select (arr!25187 (_keys!10030 thiss!1181)) (index!37864 lt!404066)) key!785)))))

(assert (=> d!110461 (= lt!404066 e!499526)))

(declare-fun c!94342 () Bool)

(assert (=> d!110461 (= c!94342 (and ((_ is Intermediate!8873) lt!404067) (undefined!9685 lt!404067)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52371 (_ BitVec 32)) SeekEntryResult!8873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110461 (= lt!404067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25890 thiss!1181)) key!785 (_keys!10030 thiss!1181) (mask!25890 thiss!1181)))))

(assert (=> d!110461 (validMask!0 (mask!25890 thiss!1181))))

(assert (=> d!110461 (= (seekEntry!0 key!785 (_keys!10030 thiss!1181) (mask!25890 thiss!1181)) lt!404066)))

(declare-fun b!894321 () Bool)

(assert (=> b!894321 (= e!499526 e!499525)))

(assert (=> b!894321 (= lt!404068 (select (arr!25187 (_keys!10030 thiss!1181)) (index!37865 lt!404067)))))

(declare-fun c!94344 () Bool)

(assert (=> b!894321 (= c!94344 (= lt!404068 key!785))))

(assert (= (and d!110461 c!94342) b!894318))

(assert (= (and d!110461 (not c!94342)) b!894321))

(assert (= (and b!894321 c!94344) b!894319))

(assert (= (and b!894321 (not c!94344)) b!894320))

(assert (= (and b!894320 c!94343) b!894317))

(assert (= (and b!894320 (not c!94343)) b!894316))

(declare-fun m!831827 () Bool)

(assert (=> b!894316 m!831827))

(declare-fun m!831829 () Bool)

(assert (=> d!110461 m!831829))

(declare-fun m!831831 () Bool)

(assert (=> d!110461 m!831831))

(assert (=> d!110461 m!831831))

(declare-fun m!831833 () Bool)

(assert (=> d!110461 m!831833))

(assert (=> d!110461 m!831783))

(declare-fun m!831835 () Bool)

(assert (=> b!894321 m!831835))

(assert (=> b!894253 d!110461))

(declare-fun d!110463 () Bool)

(assert (=> d!110463 (= (array_inv!19832 (_keys!10030 thiss!1181)) (bvsge (size!25635 (_keys!10030 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894254 d!110463))

(declare-fun d!110465 () Bool)

(assert (=> d!110465 (= (array_inv!19833 (_values!5325 thiss!1181)) (bvsge (size!25636 (_values!5325 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894254 d!110465))

(declare-fun b!894328 () Bool)

(declare-fun e!499532 () Bool)

(assert (=> b!894328 (= e!499532 tp_is_empty!18199)))

(declare-fun b!894329 () Bool)

(declare-fun e!499531 () Bool)

(assert (=> b!894329 (= e!499531 tp_is_empty!18199)))

(declare-fun mapNonEmpty!28881 () Bool)

(declare-fun mapRes!28881 () Bool)

(declare-fun tp!55617 () Bool)

(assert (=> mapNonEmpty!28881 (= mapRes!28881 (and tp!55617 e!499532))))

(declare-fun mapValue!28881 () ValueCell!8618)

(declare-fun mapKey!28881 () (_ BitVec 32))

(declare-fun mapRest!28881 () (Array (_ BitVec 32) ValueCell!8618))

(assert (=> mapNonEmpty!28881 (= mapRest!28872 (store mapRest!28881 mapKey!28881 mapValue!28881))))

(declare-fun mapIsEmpty!28881 () Bool)

(assert (=> mapIsEmpty!28881 mapRes!28881))

(declare-fun condMapEmpty!28881 () Bool)

(declare-fun mapDefault!28881 () ValueCell!8618)

(assert (=> mapNonEmpty!28872 (= condMapEmpty!28881 (= mapRest!28872 ((as const (Array (_ BitVec 32) ValueCell!8618)) mapDefault!28881)))))

(assert (=> mapNonEmpty!28872 (= tp!55601 (and e!499531 mapRes!28881))))

(assert (= (and mapNonEmpty!28872 condMapEmpty!28881) mapIsEmpty!28881))

(assert (= (and mapNonEmpty!28872 (not condMapEmpty!28881)) mapNonEmpty!28881))

(assert (= (and mapNonEmpty!28881 ((_ is ValueCellFull!8618) mapValue!28881)) b!894328))

(assert (= (and mapNonEmpty!28872 ((_ is ValueCellFull!8618) mapDefault!28881)) b!894329))

(declare-fun m!831837 () Bool)

(assert (=> mapNonEmpty!28881 m!831837))

(check-sat tp_is_empty!18199 (not b!894302) (not b_next!15871) (not b!894303) (not mapNonEmpty!28881) (not d!110457) b_and!26137 (not b!894316) (not d!110461) (not b!894301))
(check-sat b_and!26137 (not b_next!15871))
