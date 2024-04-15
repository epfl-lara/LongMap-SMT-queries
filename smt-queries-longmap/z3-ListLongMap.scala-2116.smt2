; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35850 () Bool)

(assert start!35850)

(declare-fun b!360304 () Bool)

(declare-fun res!200434 () Bool)

(declare-fun e!220580 () Bool)

(assert (=> b!360304 (=> (not res!200434) (not e!220580))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360304 (= res!200434 (validKeyInArray!0 k0!1077))))

(declare-fun b!360306 () Bool)

(declare-fun res!200433 () Bool)

(assert (=> b!360306 (=> (not res!200433) (not e!220580))))

(declare-datatypes ((array!20159 0))(
  ( (array!20160 (arr!9573 (Array (_ BitVec 32) (_ BitVec 64))) (size!9926 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20159)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360306 (= res!200433 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13983 () Bool)

(declare-fun mapRes!13983 () Bool)

(declare-fun tp!28050 () Bool)

(declare-fun e!220577 () Bool)

(assert (=> mapNonEmpty!13983 (= mapRes!13983 (and tp!28050 e!220577))))

(declare-datatypes ((V!12067 0))(
  ( (V!12068 (val!4203 Int)) )
))
(declare-datatypes ((ValueCell!3815 0))(
  ( (ValueCellFull!3815 (v!6391 V!12067)) (EmptyCell!3815) )
))
(declare-fun mapValue!13983 () ValueCell!3815)

(declare-fun mapRest!13983 () (Array (_ BitVec 32) ValueCell!3815))

(declare-datatypes ((array!20161 0))(
  ( (array!20162 (arr!9574 (Array (_ BitVec 32) ValueCell!3815)) (size!9927 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20161)

(declare-fun mapKey!13983 () (_ BitVec 32))

(assert (=> mapNonEmpty!13983 (= (arr!9574 _values!1208) (store mapRest!13983 mapKey!13983 mapValue!13983))))

(declare-fun b!360307 () Bool)

(declare-fun e!220579 () Bool)

(declare-fun tp_is_empty!8317 () Bool)

(assert (=> b!360307 (= e!220579 tp_is_empty!8317)))

(declare-fun b!360308 () Bool)

(declare-fun e!220581 () Bool)

(assert (=> b!360308 (= e!220581 (and e!220579 mapRes!13983))))

(declare-fun condMapEmpty!13983 () Bool)

(declare-fun mapDefault!13983 () ValueCell!3815)

(assert (=> b!360308 (= condMapEmpty!13983 (= (arr!9574 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3815)) mapDefault!13983)))))

(declare-fun b!360309 () Bool)

(declare-fun res!200432 () Bool)

(assert (=> b!360309 (=> (not res!200432) (not e!220580))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20159 (_ BitVec 32)) Bool)

(assert (=> b!360309 (= res!200432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360310 () Bool)

(declare-fun res!200431 () Bool)

(assert (=> b!360310 (=> (not res!200431) (not e!220580))))

(declare-datatypes ((List!5459 0))(
  ( (Nil!5456) (Cons!5455 (h!6311 (_ BitVec 64)) (t!10600 List!5459)) )
))
(declare-fun arrayNoDuplicates!0 (array!20159 (_ BitVec 32) List!5459) Bool)

(assert (=> b!360310 (= res!200431 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5456))))

(declare-fun res!200429 () Bool)

(assert (=> start!35850 (=> (not res!200429) (not e!220580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35850 (= res!200429 (validMask!0 mask!1842))))

(assert (=> start!35850 e!220580))

(assert (=> start!35850 tp_is_empty!8317))

(assert (=> start!35850 true))

(declare-fun array_inv!7054 (array!20159) Bool)

(assert (=> start!35850 (array_inv!7054 _keys!1456)))

(declare-fun array_inv!7055 (array!20161) Bool)

(assert (=> start!35850 (and (array_inv!7055 _values!1208) e!220581)))

(declare-fun b!360305 () Bool)

(declare-fun res!200430 () Bool)

(assert (=> b!360305 (=> (not res!200430) (not e!220580))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!360305 (= res!200430 (and (= (size!9927 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9926 _keys!1456) (size!9927 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360311 () Bool)

(declare-fun res!200427 () Bool)

(assert (=> b!360311 (=> (not res!200427) (not e!220580))))

(assert (=> b!360311 (= res!200427 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9926 _keys!1456))))))

(declare-fun b!360312 () Bool)

(assert (=> b!360312 (= e!220580 (not (and (bvsge (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1805) (size!9926 _keys!1456)))))))

(assert (=> b!360312 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12067)

(declare-datatypes ((Unit!11074 0))(
  ( (Unit!11075) )
))
(declare-fun lt!166228 () Unit!11074)

(declare-fun zeroValue!1150 () V!12067)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!60 (array!20159 array!20161 (_ BitVec 32) (_ BitVec 32) V!12067 V!12067 (_ BitVec 64) (_ BitVec 32)) Unit!11074)

(assert (=> b!360312 (= lt!166228 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!60 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360313 () Bool)

(assert (=> b!360313 (= e!220577 tp_is_empty!8317)))

(declare-fun mapIsEmpty!13983 () Bool)

(assert (=> mapIsEmpty!13983 mapRes!13983))

(declare-fun b!360314 () Bool)

(declare-fun res!200428 () Bool)

(assert (=> b!360314 (=> (not res!200428) (not e!220580))))

(assert (=> b!360314 (= res!200428 (not (= (select (arr!9573 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35850 res!200429) b!360305))

(assert (= (and b!360305 res!200430) b!360309))

(assert (= (and b!360309 res!200432) b!360310))

(assert (= (and b!360310 res!200431) b!360304))

(assert (= (and b!360304 res!200434) b!360311))

(assert (= (and b!360311 res!200427) b!360306))

(assert (= (and b!360306 res!200433) b!360314))

(assert (= (and b!360314 res!200428) b!360312))

(assert (= (and b!360308 condMapEmpty!13983) mapIsEmpty!13983))

(assert (= (and b!360308 (not condMapEmpty!13983)) mapNonEmpty!13983))

(get-info :version)

(assert (= (and mapNonEmpty!13983 ((_ is ValueCellFull!3815) mapValue!13983)) b!360313))

(assert (= (and b!360308 ((_ is ValueCellFull!3815) mapDefault!13983)) b!360307))

(assert (= start!35850 b!360308))

(declare-fun m!356967 () Bool)

(assert (=> b!360306 m!356967))

(declare-fun m!356969 () Bool)

(assert (=> b!360312 m!356969))

(declare-fun m!356971 () Bool)

(assert (=> b!360312 m!356971))

(declare-fun m!356973 () Bool)

(assert (=> b!360314 m!356973))

(declare-fun m!356975 () Bool)

(assert (=> b!360309 m!356975))

(declare-fun m!356977 () Bool)

(assert (=> b!360304 m!356977))

(declare-fun m!356979 () Bool)

(assert (=> start!35850 m!356979))

(declare-fun m!356981 () Bool)

(assert (=> start!35850 m!356981))

(declare-fun m!356983 () Bool)

(assert (=> start!35850 m!356983))

(declare-fun m!356985 () Bool)

(assert (=> b!360310 m!356985))

(declare-fun m!356987 () Bool)

(assert (=> mapNonEmpty!13983 m!356987))

(check-sat (not start!35850) (not b!360312) (not b!360309) (not b!360304) tp_is_empty!8317 (not b!360306) (not b!360310) (not mapNonEmpty!13983))
(check-sat)
(get-model)

(declare-fun b!360389 () Bool)

(declare-fun e!220618 () Bool)

(declare-fun call!27137 () Bool)

(assert (=> b!360389 (= e!220618 call!27137)))

(declare-fun b!360390 () Bool)

(declare-fun e!220619 () Bool)

(assert (=> b!360390 (= e!220619 e!220618)))

(declare-fun c!53639 () Bool)

(assert (=> b!360390 (= c!53639 (validKeyInArray!0 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360391 () Bool)

(declare-fun e!220620 () Bool)

(assert (=> b!360391 (= e!220620 call!27137)))

(declare-fun bm!27134 () Bool)

(assert (=> bm!27134 (= call!27137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!360392 () Bool)

(assert (=> b!360392 (= e!220618 e!220620)))

(declare-fun lt!166241 () (_ BitVec 64))

(assert (=> b!360392 (= lt!166241 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000))))

(declare-fun lt!166242 () Unit!11074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20159 (_ BitVec 64) (_ BitVec 32)) Unit!11074)

(assert (=> b!360392 (= lt!166242 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!166241 #b00000000000000000000000000000000))))

(assert (=> b!360392 (arrayContainsKey!0 _keys!1456 lt!166241 #b00000000000000000000000000000000)))

(declare-fun lt!166243 () Unit!11074)

(assert (=> b!360392 (= lt!166243 lt!166242)))

(declare-fun res!200487 () Bool)

(declare-datatypes ((SeekEntryResult!3486 0))(
  ( (MissingZero!3486 (index!16123 (_ BitVec 32))) (Found!3486 (index!16124 (_ BitVec 32))) (Intermediate!3486 (undefined!4298 Bool) (index!16125 (_ BitVec 32)) (x!35915 (_ BitVec 32))) (Undefined!3486) (MissingVacant!3486 (index!16126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20159 (_ BitVec 32)) SeekEntryResult!3486)

(assert (=> b!360392 (= res!200487 (= (seekEntryOrOpen!0 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3486 #b00000000000000000000000000000000)))))

(assert (=> b!360392 (=> (not res!200487) (not e!220620))))

(declare-fun d!71647 () Bool)

(declare-fun res!200488 () Bool)

(assert (=> d!71647 (=> res!200488 e!220619)))

(assert (=> d!71647 (= res!200488 (bvsge #b00000000000000000000000000000000 (size!9926 _keys!1456)))))

(assert (=> d!71647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!220619)))

(assert (= (and d!71647 (not res!200488)) b!360390))

(assert (= (and b!360390 c!53639) b!360392))

(assert (= (and b!360390 (not c!53639)) b!360389))

(assert (= (and b!360392 res!200487) b!360391))

(assert (= (or b!360391 b!360389) bm!27134))

(declare-fun m!357033 () Bool)

(assert (=> b!360390 m!357033))

(assert (=> b!360390 m!357033))

(declare-fun m!357035 () Bool)

(assert (=> b!360390 m!357035))

(declare-fun m!357037 () Bool)

(assert (=> bm!27134 m!357037))

(assert (=> b!360392 m!357033))

(declare-fun m!357039 () Bool)

(assert (=> b!360392 m!357039))

(declare-fun m!357041 () Bool)

(assert (=> b!360392 m!357041))

(assert (=> b!360392 m!357033))

(declare-fun m!357043 () Bool)

(assert (=> b!360392 m!357043))

(assert (=> b!360309 d!71647))

(declare-fun b!360403 () Bool)

(declare-fun e!220629 () Bool)

(declare-fun call!27140 () Bool)

(assert (=> b!360403 (= e!220629 call!27140)))

(declare-fun b!360404 () Bool)

(assert (=> b!360404 (= e!220629 call!27140)))

(declare-fun bm!27137 () Bool)

(declare-fun c!53642 () Bool)

(assert (=> bm!27137 (= call!27140 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53642 (Cons!5455 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000) Nil!5456) Nil!5456)))))

(declare-fun b!360405 () Bool)

(declare-fun e!220632 () Bool)

(declare-fun e!220631 () Bool)

(assert (=> b!360405 (= e!220632 e!220631)))

(declare-fun res!200497 () Bool)

(assert (=> b!360405 (=> (not res!200497) (not e!220631))))

(declare-fun e!220630 () Bool)

(assert (=> b!360405 (= res!200497 (not e!220630))))

(declare-fun res!200495 () Bool)

(assert (=> b!360405 (=> (not res!200495) (not e!220630))))

(assert (=> b!360405 (= res!200495 (validKeyInArray!0 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360406 () Bool)

(assert (=> b!360406 (= e!220631 e!220629)))

(assert (=> b!360406 (= c!53642 (validKeyInArray!0 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71649 () Bool)

(declare-fun res!200496 () Bool)

(assert (=> d!71649 (=> res!200496 e!220632)))

(assert (=> d!71649 (= res!200496 (bvsge #b00000000000000000000000000000000 (size!9926 _keys!1456)))))

(assert (=> d!71649 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5456) e!220632)))

(declare-fun b!360407 () Bool)

(declare-fun contains!2411 (List!5459 (_ BitVec 64)) Bool)

(assert (=> b!360407 (= e!220630 (contains!2411 Nil!5456 (select (arr!9573 _keys!1456) #b00000000000000000000000000000000)))))

(assert (= (and d!71649 (not res!200496)) b!360405))

(assert (= (and b!360405 res!200495) b!360407))

(assert (= (and b!360405 res!200497) b!360406))

(assert (= (and b!360406 c!53642) b!360403))

(assert (= (and b!360406 (not c!53642)) b!360404))

(assert (= (or b!360403 b!360404) bm!27137))

(assert (=> bm!27137 m!357033))

(declare-fun m!357045 () Bool)

(assert (=> bm!27137 m!357045))

(assert (=> b!360405 m!357033))

(assert (=> b!360405 m!357033))

(assert (=> b!360405 m!357035))

(assert (=> b!360406 m!357033))

(assert (=> b!360406 m!357033))

(assert (=> b!360406 m!357035))

(assert (=> b!360407 m!357033))

(assert (=> b!360407 m!357033))

(declare-fun m!357047 () Bool)

(assert (=> b!360407 m!357047))

(assert (=> b!360310 d!71649))

(declare-fun d!71651 () Bool)

(assert (=> d!71651 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!360304 d!71651))

(declare-fun d!71653 () Bool)

(declare-fun res!200502 () Bool)

(declare-fun e!220637 () Bool)

(assert (=> d!71653 (=> res!200502 e!220637)))

(assert (=> d!71653 (= res!200502 (= (select (arr!9573 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) k0!1077))))

(assert (=> d!71653 (= (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805)) e!220637)))

(declare-fun b!360412 () Bool)

(declare-fun e!220638 () Bool)

(assert (=> b!360412 (= e!220637 e!220638)))

(declare-fun res!200503 () Bool)

(assert (=> b!360412 (=> (not res!200503) (not e!220638))))

(assert (=> b!360412 (= res!200503 (bvslt (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001) (size!9926 _keys!1456)))))

(declare-fun b!360413 () Bool)

(assert (=> b!360413 (= e!220638 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71653 (not res!200502)) b!360412))

(assert (= (and b!360412 res!200503) b!360413))

(declare-fun m!357049 () Bool)

(assert (=> d!71653 m!357049))

(declare-fun m!357051 () Bool)

(assert (=> b!360413 m!357051))

(assert (=> b!360312 d!71653))

(declare-fun d!71655 () Bool)

(assert (=> d!71655 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001))))

(declare-fun lt!166246 () Unit!11074)

(declare-fun choose!1317 (array!20159 array!20161 (_ BitVec 32) (_ BitVec 32) V!12067 V!12067 (_ BitVec 64) (_ BitVec 32)) Unit!11074)

(assert (=> d!71655 (= lt!166246 (choose!1317 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (=> d!71655 (validMask!0 mask!1842)))

(assert (=> d!71655 (= (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!60 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805) lt!166246)))

(declare-fun bs!12261 () Bool)

(assert (= bs!12261 d!71655))

(declare-fun m!357053 () Bool)

(assert (=> bs!12261 m!357053))

(declare-fun m!357055 () Bool)

(assert (=> bs!12261 m!357055))

(assert (=> bs!12261 m!356979))

(assert (=> b!360312 d!71655))

(declare-fun d!71657 () Bool)

(assert (=> d!71657 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35850 d!71657))

(declare-fun d!71659 () Bool)

(assert (=> d!71659 (= (array_inv!7054 _keys!1456) (bvsge (size!9926 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35850 d!71659))

(declare-fun d!71661 () Bool)

(assert (=> d!71661 (= (array_inv!7055 _values!1208) (bvsge (size!9927 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35850 d!71661))

(declare-fun d!71663 () Bool)

(declare-fun res!200504 () Bool)

(declare-fun e!220639 () Bool)

(assert (=> d!71663 (=> res!200504 e!220639)))

(assert (=> d!71663 (= res!200504 (= (select (arr!9573 _keys!1456) from!1805) k0!1077))))

(assert (=> d!71663 (= (arrayContainsKey!0 _keys!1456 k0!1077 from!1805) e!220639)))

(declare-fun b!360414 () Bool)

(declare-fun e!220640 () Bool)

(assert (=> b!360414 (= e!220639 e!220640)))

(declare-fun res!200505 () Bool)

(assert (=> b!360414 (=> (not res!200505) (not e!220640))))

(assert (=> b!360414 (= res!200505 (bvslt (bvadd from!1805 #b00000000000000000000000000000001) (size!9926 _keys!1456)))))

(declare-fun b!360415 () Bool)

(assert (=> b!360415 (= e!220640 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71663 (not res!200504)) b!360414))

(assert (= (and b!360414 res!200505) b!360415))

(assert (=> d!71663 m!356973))

(assert (=> b!360415 m!357053))

(assert (=> b!360306 d!71663))

(declare-fun b!360422 () Bool)

(declare-fun e!220646 () Bool)

(assert (=> b!360422 (= e!220646 tp_is_empty!8317)))

(declare-fun condMapEmpty!13992 () Bool)

(declare-fun mapDefault!13992 () ValueCell!3815)

(assert (=> mapNonEmpty!13983 (= condMapEmpty!13992 (= mapRest!13983 ((as const (Array (_ BitVec 32) ValueCell!3815)) mapDefault!13992)))))

(declare-fun e!220645 () Bool)

(declare-fun mapRes!13992 () Bool)

(assert (=> mapNonEmpty!13983 (= tp!28050 (and e!220645 mapRes!13992))))

(declare-fun b!360423 () Bool)

(assert (=> b!360423 (= e!220645 tp_is_empty!8317)))

(declare-fun mapIsEmpty!13992 () Bool)

(assert (=> mapIsEmpty!13992 mapRes!13992))

(declare-fun mapNonEmpty!13992 () Bool)

(declare-fun tp!28059 () Bool)

(assert (=> mapNonEmpty!13992 (= mapRes!13992 (and tp!28059 e!220646))))

(declare-fun mapRest!13992 () (Array (_ BitVec 32) ValueCell!3815))

(declare-fun mapValue!13992 () ValueCell!3815)

(declare-fun mapKey!13992 () (_ BitVec 32))

(assert (=> mapNonEmpty!13992 (= mapRest!13983 (store mapRest!13992 mapKey!13992 mapValue!13992))))

(assert (= (and mapNonEmpty!13983 condMapEmpty!13992) mapIsEmpty!13992))

(assert (= (and mapNonEmpty!13983 (not condMapEmpty!13992)) mapNonEmpty!13992))

(assert (= (and mapNonEmpty!13992 ((_ is ValueCellFull!3815) mapValue!13992)) b!360422))

(assert (= (and mapNonEmpty!13983 ((_ is ValueCellFull!3815) mapDefault!13992)) b!360423))

(declare-fun m!357057 () Bool)

(assert (=> mapNonEmpty!13992 m!357057))

(check-sat (not b!360406) (not b!360415) tp_is_empty!8317 (not b!360390) (not d!71655) (not mapNonEmpty!13992) (not b!360407) (not b!360413) (not bm!27134) (not bm!27137) (not b!360392) (not b!360405))
(check-sat)
