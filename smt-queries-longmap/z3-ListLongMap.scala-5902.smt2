; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76294 () Bool)

(assert start!76294)

(declare-fun b!895356 () Bool)

(declare-fun b_free!15913 () Bool)

(declare-fun b_next!15913 () Bool)

(assert (=> b!895356 (= b_free!15913 (not b_next!15913))))

(declare-fun tp!55753 () Bool)

(declare-fun b_and!26179 () Bool)

(assert (=> b!895356 (= tp!55753 b_and!26179)))

(declare-fun b!895349 () Bool)

(declare-fun e!500267 () Bool)

(declare-fun tp_is_empty!18241 () Bool)

(assert (=> b!895349 (= e!500267 tp_is_empty!18241)))

(declare-fun b!895350 () Bool)

(declare-fun res!605663 () Bool)

(declare-fun e!500272 () Bool)

(assert (=> b!895350 (=> (not res!605663) (not e!500272))))

(declare-datatypes ((array!52469 0))(
  ( (array!52470 (arr!25229 (Array (_ BitVec 32) (_ BitVec 64))) (size!25681 (_ BitVec 32))) )
))
(declare-datatypes ((V!29287 0))(
  ( (V!29288 (val!9171 Int)) )
))
(declare-datatypes ((ValueCell!8639 0))(
  ( (ValueCellFull!8639 (v!11658 V!29287)) (EmptyCell!8639) )
))
(declare-datatypes ((array!52471 0))(
  ( (array!52472 (arr!25230 (Array (_ BitVec 32) ValueCell!8639)) (size!25682 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4294 0))(
  ( (LongMapFixedSize!4295 (defaultEntry!5359 Int) (mask!25956 (_ BitVec 32)) (extraKeys!5055 (_ BitVec 32)) (zeroValue!5159 V!29287) (minValue!5159 V!29287) (_size!2202 (_ BitVec 32)) (_keys!10071 array!52469) (_values!5346 array!52471) (_vacant!2202 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4294)

(assert (=> b!895350 (= res!605663 (and (= (size!25682 (_values!5346 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25956 thiss!1181))) (= (size!25681 (_keys!10071 thiss!1181)) (size!25682 (_values!5346 thiss!1181))) (bvsge (mask!25956 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5055 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5055 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895351 () Bool)

(declare-fun e!500269 () Bool)

(assert (=> b!895351 (= e!500269 tp_is_empty!18241)))

(declare-fun b!895352 () Bool)

(declare-fun e!500271 () Bool)

(declare-fun mapRes!28960 () Bool)

(assert (=> b!895352 (= e!500271 (and e!500267 mapRes!28960))))

(declare-fun condMapEmpty!28960 () Bool)

(declare-fun mapDefault!28960 () ValueCell!8639)

(assert (=> b!895352 (= condMapEmpty!28960 (= (arr!25230 (_values!5346 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8639)) mapDefault!28960)))))

(declare-fun b!895353 () Bool)

(declare-fun res!605665 () Bool)

(declare-fun e!500268 () Bool)

(assert (=> b!895353 (=> (not res!605665) (not e!500268))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895353 (= res!605665 (not (= key!785 (bvneg key!785))))))

(declare-fun res!605667 () Bool)

(assert (=> start!76294 (=> (not res!605667) (not e!500268))))

(declare-fun valid!1664 (LongMapFixedSize!4294) Bool)

(assert (=> start!76294 (= res!605667 (valid!1664 thiss!1181))))

(assert (=> start!76294 e!500268))

(declare-fun e!500266 () Bool)

(assert (=> start!76294 e!500266))

(assert (=> start!76294 true))

(declare-fun mapIsEmpty!28960 () Bool)

(assert (=> mapIsEmpty!28960 mapRes!28960))

(declare-fun mapNonEmpty!28960 () Bool)

(declare-fun tp!55752 () Bool)

(assert (=> mapNonEmpty!28960 (= mapRes!28960 (and tp!55752 e!500269))))

(declare-fun mapValue!28960 () ValueCell!8639)

(declare-fun mapRest!28960 () (Array (_ BitVec 32) ValueCell!8639))

(declare-fun mapKey!28960 () (_ BitVec 32))

(assert (=> mapNonEmpty!28960 (= (arr!25230 (_values!5346 thiss!1181)) (store mapRest!28960 mapKey!28960 mapValue!28960))))

(declare-fun b!895354 () Bool)

(assert (=> b!895354 (= e!500268 e!500272)))

(declare-fun res!605664 () Bool)

(assert (=> b!895354 (=> (not res!605664) (not e!500272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895354 (= res!605664 (validMask!0 (mask!25956 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8886 0))(
  ( (MissingZero!8886 (index!37915 (_ BitVec 32))) (Found!8886 (index!37916 (_ BitVec 32))) (Intermediate!8886 (undefined!9698 Bool) (index!37917 (_ BitVec 32)) (x!76209 (_ BitVec 32))) (Undefined!8886) (MissingVacant!8886 (index!37918 (_ BitVec 32))) )
))
(declare-fun lt!404327 () SeekEntryResult!8886)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895354 (= lt!404327 (seekEntry!0 key!785 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895355 () Bool)

(declare-datatypes ((List!17822 0))(
  ( (Nil!17819) (Cons!17818 (h!18955 (_ BitVec 64)) (t!25152 List!17822)) )
))
(declare-fun arrayNoDuplicates!0 (array!52469 (_ BitVec 32) List!17822) Bool)

(assert (=> b!895355 (= e!500272 (not (arrayNoDuplicates!0 (_keys!10071 thiss!1181) #b00000000000000000000000000000000 Nil!17819)))))

(declare-fun array_inv!19858 (array!52469) Bool)

(declare-fun array_inv!19859 (array!52471) Bool)

(assert (=> b!895356 (= e!500266 (and tp!55753 tp_is_empty!18241 (array_inv!19858 (_keys!10071 thiss!1181)) (array_inv!19859 (_values!5346 thiss!1181)) e!500271))))

(declare-fun b!895357 () Bool)

(declare-fun res!605666 () Bool)

(assert (=> b!895357 (=> (not res!605666) (not e!500272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52469 (_ BitVec 32)) Bool)

(assert (=> b!895357 (= res!605666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(assert (= (and start!76294 res!605667) b!895353))

(assert (= (and b!895353 res!605665) b!895354))

(assert (= (and b!895354 res!605664) b!895350))

(assert (= (and b!895350 res!605663) b!895357))

(assert (= (and b!895357 res!605666) b!895355))

(assert (= (and b!895352 condMapEmpty!28960) mapIsEmpty!28960))

(assert (= (and b!895352 (not condMapEmpty!28960)) mapNonEmpty!28960))

(get-info :version)

(assert (= (and mapNonEmpty!28960 ((_ is ValueCellFull!8639) mapValue!28960)) b!895351))

(assert (= (and b!895352 ((_ is ValueCellFull!8639) mapDefault!28960)) b!895349))

(assert (= b!895356 b!895352))

(assert (= start!76294 b!895356))

(declare-fun m!832343 () Bool)

(assert (=> b!895357 m!832343))

(declare-fun m!832345 () Bool)

(assert (=> mapNonEmpty!28960 m!832345))

(declare-fun m!832347 () Bool)

(assert (=> start!76294 m!832347))

(declare-fun m!832349 () Bool)

(assert (=> b!895354 m!832349))

(declare-fun m!832351 () Bool)

(assert (=> b!895354 m!832351))

(declare-fun m!832353 () Bool)

(assert (=> b!895356 m!832353))

(declare-fun m!832355 () Bool)

(assert (=> b!895356 m!832355))

(declare-fun m!832357 () Bool)

(assert (=> b!895355 m!832357))

(check-sat tp_is_empty!18241 (not b!895357) (not mapNonEmpty!28960) (not b!895356) (not b!895354) b_and!26179 (not b!895355) (not start!76294) (not b_next!15913))
(check-sat b_and!26179 (not b_next!15913))
(get-model)

(declare-fun d!110599 () Bool)

(declare-fun res!605706 () Bool)

(declare-fun e!500323 () Bool)

(assert (=> d!110599 (=> res!605706 e!500323)))

(assert (=> d!110599 (= res!605706 (bvsge #b00000000000000000000000000000000 (size!25681 (_keys!10071 thiss!1181))))))

(assert (=> d!110599 (= (arrayNoDuplicates!0 (_keys!10071 thiss!1181) #b00000000000000000000000000000000 Nil!17819) e!500323)))

(declare-fun b!895422 () Bool)

(declare-fun e!500325 () Bool)

(declare-fun e!500326 () Bool)

(assert (=> b!895422 (= e!500325 e!500326)))

(declare-fun c!94524 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895422 (= c!94524 (validKeyInArray!0 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895423 () Bool)

(declare-fun call!39734 () Bool)

(assert (=> b!895423 (= e!500326 call!39734)))

(declare-fun b!895424 () Bool)

(assert (=> b!895424 (= e!500326 call!39734)))

(declare-fun b!895425 () Bool)

(assert (=> b!895425 (= e!500323 e!500325)))

(declare-fun res!605705 () Bool)

(assert (=> b!895425 (=> (not res!605705) (not e!500325))))

(declare-fun e!500324 () Bool)

(assert (=> b!895425 (= res!605705 (not e!500324))))

(declare-fun res!605704 () Bool)

(assert (=> b!895425 (=> (not res!605704) (not e!500324))))

(assert (=> b!895425 (= res!605704 (validKeyInArray!0 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39731 () Bool)

(assert (=> bm!39731 (= call!39734 (arrayNoDuplicates!0 (_keys!10071 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94524 (Cons!17818 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000) Nil!17819) Nil!17819)))))

(declare-fun b!895426 () Bool)

(declare-fun contains!4368 (List!17822 (_ BitVec 64)) Bool)

(assert (=> b!895426 (= e!500324 (contains!4368 Nil!17819 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110599 (not res!605706)) b!895425))

(assert (= (and b!895425 res!605704) b!895426))

(assert (= (and b!895425 res!605705) b!895422))

(assert (= (and b!895422 c!94524) b!895424))

(assert (= (and b!895422 (not c!94524)) b!895423))

(assert (= (or b!895424 b!895423) bm!39731))

(declare-fun m!832391 () Bool)

(assert (=> b!895422 m!832391))

(assert (=> b!895422 m!832391))

(declare-fun m!832393 () Bool)

(assert (=> b!895422 m!832393))

(assert (=> b!895425 m!832391))

(assert (=> b!895425 m!832391))

(assert (=> b!895425 m!832393))

(assert (=> bm!39731 m!832391))

(declare-fun m!832395 () Bool)

(assert (=> bm!39731 m!832395))

(assert (=> b!895426 m!832391))

(assert (=> b!895426 m!832391))

(declare-fun m!832397 () Bool)

(assert (=> b!895426 m!832397))

(assert (=> b!895355 d!110599))

(declare-fun d!110601 () Bool)

(declare-fun res!605713 () Bool)

(declare-fun e!500329 () Bool)

(assert (=> d!110601 (=> (not res!605713) (not e!500329))))

(declare-fun simpleValid!307 (LongMapFixedSize!4294) Bool)

(assert (=> d!110601 (= res!605713 (simpleValid!307 thiss!1181))))

(assert (=> d!110601 (= (valid!1664 thiss!1181) e!500329)))

(declare-fun b!895433 () Bool)

(declare-fun res!605714 () Bool)

(assert (=> b!895433 (=> (not res!605714) (not e!500329))))

(declare-fun arrayCountValidKeys!0 (array!52469 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895433 (= res!605714 (= (arrayCountValidKeys!0 (_keys!10071 thiss!1181) #b00000000000000000000000000000000 (size!25681 (_keys!10071 thiss!1181))) (_size!2202 thiss!1181)))))

(declare-fun b!895434 () Bool)

(declare-fun res!605715 () Bool)

(assert (=> b!895434 (=> (not res!605715) (not e!500329))))

(assert (=> b!895434 (= res!605715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895435 () Bool)

(assert (=> b!895435 (= e!500329 (arrayNoDuplicates!0 (_keys!10071 thiss!1181) #b00000000000000000000000000000000 Nil!17819))))

(assert (= (and d!110601 res!605713) b!895433))

(assert (= (and b!895433 res!605714) b!895434))

(assert (= (and b!895434 res!605715) b!895435))

(declare-fun m!832399 () Bool)

(assert (=> d!110601 m!832399))

(declare-fun m!832401 () Bool)

(assert (=> b!895433 m!832401))

(assert (=> b!895434 m!832343))

(assert (=> b!895435 m!832357))

(assert (=> start!76294 d!110601))

(declare-fun d!110603 () Bool)

(assert (=> d!110603 (= (validMask!0 (mask!25956 thiss!1181)) (and (or (= (mask!25956 thiss!1181) #b00000000000000000000000000000111) (= (mask!25956 thiss!1181) #b00000000000000000000000000001111) (= (mask!25956 thiss!1181) #b00000000000000000000000000011111) (= (mask!25956 thiss!1181) #b00000000000000000000000000111111) (= (mask!25956 thiss!1181) #b00000000000000000000000001111111) (= (mask!25956 thiss!1181) #b00000000000000000000000011111111) (= (mask!25956 thiss!1181) #b00000000000000000000000111111111) (= (mask!25956 thiss!1181) #b00000000000000000000001111111111) (= (mask!25956 thiss!1181) #b00000000000000000000011111111111) (= (mask!25956 thiss!1181) #b00000000000000000000111111111111) (= (mask!25956 thiss!1181) #b00000000000000000001111111111111) (= (mask!25956 thiss!1181) #b00000000000000000011111111111111) (= (mask!25956 thiss!1181) #b00000000000000000111111111111111) (= (mask!25956 thiss!1181) #b00000000000000001111111111111111) (= (mask!25956 thiss!1181) #b00000000000000011111111111111111) (= (mask!25956 thiss!1181) #b00000000000000111111111111111111) (= (mask!25956 thiss!1181) #b00000000000001111111111111111111) (= (mask!25956 thiss!1181) #b00000000000011111111111111111111) (= (mask!25956 thiss!1181) #b00000000000111111111111111111111) (= (mask!25956 thiss!1181) #b00000000001111111111111111111111) (= (mask!25956 thiss!1181) #b00000000011111111111111111111111) (= (mask!25956 thiss!1181) #b00000000111111111111111111111111) (= (mask!25956 thiss!1181) #b00000001111111111111111111111111) (= (mask!25956 thiss!1181) #b00000011111111111111111111111111) (= (mask!25956 thiss!1181) #b00000111111111111111111111111111) (= (mask!25956 thiss!1181) #b00001111111111111111111111111111) (= (mask!25956 thiss!1181) #b00011111111111111111111111111111) (= (mask!25956 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25956 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895354 d!110603))

(declare-fun b!895448 () Bool)

(declare-fun e!500336 () SeekEntryResult!8886)

(declare-fun lt!404344 () SeekEntryResult!8886)

(assert (=> b!895448 (= e!500336 (ite ((_ is MissingVacant!8886) lt!404344) (MissingZero!8886 (index!37918 lt!404344)) lt!404344))))

(declare-fun lt!404343 () SeekEntryResult!8886)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895448 (= lt!404344 (seekKeyOrZeroReturnVacant!0 (x!76209 lt!404343) (index!37917 lt!404343) (index!37917 lt!404343) key!785 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895449 () Bool)

(assert (=> b!895449 (= e!500336 (MissingZero!8886 (index!37917 lt!404343)))))

(declare-fun d!110605 () Bool)

(declare-fun lt!404345 () SeekEntryResult!8886)

(assert (=> d!110605 (and (or ((_ is MissingVacant!8886) lt!404345) (not ((_ is Found!8886) lt!404345)) (and (bvsge (index!37916 lt!404345) #b00000000000000000000000000000000) (bvslt (index!37916 lt!404345) (size!25681 (_keys!10071 thiss!1181))))) (not ((_ is MissingVacant!8886) lt!404345)) (or (not ((_ is Found!8886) lt!404345)) (= (select (arr!25229 (_keys!10071 thiss!1181)) (index!37916 lt!404345)) key!785)))))

(declare-fun e!500338 () SeekEntryResult!8886)

(assert (=> d!110605 (= lt!404345 e!500338)))

(declare-fun c!94533 () Bool)

(assert (=> d!110605 (= c!94533 (and ((_ is Intermediate!8886) lt!404343) (undefined!9698 lt!404343)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110605 (= lt!404343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25956 thiss!1181)) key!785 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(assert (=> d!110605 (validMask!0 (mask!25956 thiss!1181))))

(assert (=> d!110605 (= (seekEntry!0 key!785 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)) lt!404345)))

(declare-fun b!895450 () Bool)

(declare-fun e!500337 () SeekEntryResult!8886)

(assert (=> b!895450 (= e!500338 e!500337)))

(declare-fun lt!404342 () (_ BitVec 64))

(assert (=> b!895450 (= lt!404342 (select (arr!25229 (_keys!10071 thiss!1181)) (index!37917 lt!404343)))))

(declare-fun c!94531 () Bool)

(assert (=> b!895450 (= c!94531 (= lt!404342 key!785))))

(declare-fun b!895451 () Bool)

(assert (=> b!895451 (= e!500337 (Found!8886 (index!37917 lt!404343)))))

(declare-fun b!895452 () Bool)

(declare-fun c!94532 () Bool)

(assert (=> b!895452 (= c!94532 (= lt!404342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895452 (= e!500337 e!500336)))

(declare-fun b!895453 () Bool)

(assert (=> b!895453 (= e!500338 Undefined!8886)))

(assert (= (and d!110605 c!94533) b!895453))

(assert (= (and d!110605 (not c!94533)) b!895450))

(assert (= (and b!895450 c!94531) b!895451))

(assert (= (and b!895450 (not c!94531)) b!895452))

(assert (= (and b!895452 c!94532) b!895449))

(assert (= (and b!895452 (not c!94532)) b!895448))

(declare-fun m!832403 () Bool)

(assert (=> b!895448 m!832403))

(declare-fun m!832405 () Bool)

(assert (=> d!110605 m!832405))

(declare-fun m!832407 () Bool)

(assert (=> d!110605 m!832407))

(assert (=> d!110605 m!832407))

(declare-fun m!832409 () Bool)

(assert (=> d!110605 m!832409))

(assert (=> d!110605 m!832349))

(declare-fun m!832411 () Bool)

(assert (=> b!895450 m!832411))

(assert (=> b!895354 d!110605))

(declare-fun d!110607 () Bool)

(assert (=> d!110607 (= (array_inv!19858 (_keys!10071 thiss!1181)) (bvsge (size!25681 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895356 d!110607))

(declare-fun d!110609 () Bool)

(assert (=> d!110609 (= (array_inv!19859 (_values!5346 thiss!1181)) (bvsge (size!25682 (_values!5346 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895356 d!110609))

(declare-fun b!895462 () Bool)

(declare-fun e!500345 () Bool)

(declare-fun call!39737 () Bool)

(assert (=> b!895462 (= e!500345 call!39737)))

(declare-fun b!895463 () Bool)

(declare-fun e!500346 () Bool)

(assert (=> b!895463 (= e!500345 e!500346)))

(declare-fun lt!404354 () (_ BitVec 64))

(assert (=> b!895463 (= lt!404354 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30408 0))(
  ( (Unit!30409) )
))
(declare-fun lt!404353 () Unit!30408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52469 (_ BitVec 64) (_ BitVec 32)) Unit!30408)

(assert (=> b!895463 (= lt!404353 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10071 thiss!1181) lt!404354 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895463 (arrayContainsKey!0 (_keys!10071 thiss!1181) lt!404354 #b00000000000000000000000000000000)))

(declare-fun lt!404352 () Unit!30408)

(assert (=> b!895463 (= lt!404352 lt!404353)))

(declare-fun res!605720 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52469 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!895463 (= res!605720 (= (seekEntryOrOpen!0 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000) (_keys!10071 thiss!1181) (mask!25956 thiss!1181)) (Found!8886 #b00000000000000000000000000000000)))))

(assert (=> b!895463 (=> (not res!605720) (not e!500346))))

(declare-fun b!895464 () Bool)

(assert (=> b!895464 (= e!500346 call!39737)))

(declare-fun d!110611 () Bool)

(declare-fun res!605721 () Bool)

(declare-fun e!500347 () Bool)

(assert (=> d!110611 (=> res!605721 e!500347)))

(assert (=> d!110611 (= res!605721 (bvsge #b00000000000000000000000000000000 (size!25681 (_keys!10071 thiss!1181))))))

(assert (=> d!110611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10071 thiss!1181) (mask!25956 thiss!1181)) e!500347)))

(declare-fun bm!39734 () Bool)

(assert (=> bm!39734 (= call!39737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10071 thiss!1181) (mask!25956 thiss!1181)))))

(declare-fun b!895465 () Bool)

(assert (=> b!895465 (= e!500347 e!500345)))

(declare-fun c!94536 () Bool)

(assert (=> b!895465 (= c!94536 (validKeyInArray!0 (select (arr!25229 (_keys!10071 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110611 (not res!605721)) b!895465))

(assert (= (and b!895465 c!94536) b!895463))

(assert (= (and b!895465 (not c!94536)) b!895462))

(assert (= (and b!895463 res!605720) b!895464))

(assert (= (or b!895464 b!895462) bm!39734))

(assert (=> b!895463 m!832391))

(declare-fun m!832413 () Bool)

(assert (=> b!895463 m!832413))

(declare-fun m!832415 () Bool)

(assert (=> b!895463 m!832415))

(assert (=> b!895463 m!832391))

(declare-fun m!832417 () Bool)

(assert (=> b!895463 m!832417))

(declare-fun m!832419 () Bool)

(assert (=> bm!39734 m!832419))

(assert (=> b!895465 m!832391))

(assert (=> b!895465 m!832391))

(assert (=> b!895465 m!832393))

(assert (=> b!895357 d!110611))

(declare-fun b!895472 () Bool)

(declare-fun e!500353 () Bool)

(assert (=> b!895472 (= e!500353 tp_is_empty!18241)))

(declare-fun mapIsEmpty!28969 () Bool)

(declare-fun mapRes!28969 () Bool)

(assert (=> mapIsEmpty!28969 mapRes!28969))

(declare-fun mapNonEmpty!28969 () Bool)

(declare-fun tp!55768 () Bool)

(assert (=> mapNonEmpty!28969 (= mapRes!28969 (and tp!55768 e!500353))))

(declare-fun mapValue!28969 () ValueCell!8639)

(declare-fun mapKey!28969 () (_ BitVec 32))

(declare-fun mapRest!28969 () (Array (_ BitVec 32) ValueCell!8639))

(assert (=> mapNonEmpty!28969 (= mapRest!28960 (store mapRest!28969 mapKey!28969 mapValue!28969))))

(declare-fun condMapEmpty!28969 () Bool)

(declare-fun mapDefault!28969 () ValueCell!8639)

(assert (=> mapNonEmpty!28960 (= condMapEmpty!28969 (= mapRest!28960 ((as const (Array (_ BitVec 32) ValueCell!8639)) mapDefault!28969)))))

(declare-fun e!500352 () Bool)

(assert (=> mapNonEmpty!28960 (= tp!55752 (and e!500352 mapRes!28969))))

(declare-fun b!895473 () Bool)

(assert (=> b!895473 (= e!500352 tp_is_empty!18241)))

(assert (= (and mapNonEmpty!28960 condMapEmpty!28969) mapIsEmpty!28969))

(assert (= (and mapNonEmpty!28960 (not condMapEmpty!28969)) mapNonEmpty!28969))

(assert (= (and mapNonEmpty!28969 ((_ is ValueCellFull!8639) mapValue!28969)) b!895472))

(assert (= (and mapNonEmpty!28960 ((_ is ValueCellFull!8639) mapDefault!28969)) b!895473))

(declare-fun m!832421 () Bool)

(assert (=> mapNonEmpty!28969 m!832421))

(check-sat (not b!895422) tp_is_empty!18241 (not b!895463) (not b!895465) (not b!895425) b_and!26179 (not b!895435) (not b!895433) (not bm!39734) (not b_next!15913) (not b!895434) (not mapNonEmpty!28969) (not bm!39731) (not d!110601) (not d!110605) (not b!895426) (not b!895448))
(check-sat b_and!26179 (not b_next!15913))
