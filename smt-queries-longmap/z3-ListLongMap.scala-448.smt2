; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8302 () Bool)

(assert start!8302)

(declare-fun b!54201 () Bool)

(declare-fun b_free!1769 () Bool)

(declare-fun b_next!1769 () Bool)

(assert (=> b!54201 (= b_free!1769 (not b_next!1769))))

(declare-fun tp!7410 () Bool)

(declare-fun b_and!3079 () Bool)

(assert (=> b!54201 (= tp!7410 b_and!3079)))

(declare-fun b!54189 () Bool)

(declare-fun b_free!1771 () Bool)

(declare-fun b_next!1771 () Bool)

(assert (=> b!54189 (= b_free!1771 (not b_next!1771))))

(declare-fun tp!7409 () Bool)

(declare-fun b_and!3081 () Bool)

(assert (=> b!54189 (= tp!7409 b_and!3081)))

(declare-fun b!54185 () Bool)

(declare-fun e!35378 () Bool)

(assert (=> b!54185 (= e!35378 false)))

(declare-datatypes ((V!2715 0))(
  ( (V!2716 (val!1195 Int)) )
))
(declare-datatypes ((array!3525 0))(
  ( (array!3526 (arr!1685 (Array (_ BitVec 32) (_ BitVec 64))) (size!1914 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!807 0))(
  ( (ValueCellFull!807 (v!2276 V!2715)) (EmptyCell!807) )
))
(declare-datatypes ((array!3527 0))(
  ( (array!3528 (arr!1686 (Array (_ BitVec 32) ValueCell!807)) (size!1915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!522 0))(
  ( (LongMapFixedSize!523 (defaultEntry!1975 Int) (mask!5818 (_ BitVec 32)) (extraKeys!1866 (_ BitVec 32)) (zeroValue!1893 V!2715) (minValue!1893 V!2715) (_size!310 (_ BitVec 32)) (_keys!3595 array!3525) (_values!1958 array!3527) (_vacant!310 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!338 0))(
  ( (Cell!339 (v!2277 LongMapFixedSize!522)) )
))
(declare-datatypes ((LongMap!338 0))(
  ( (LongMap!339 (underlying!180 Cell!338)) )
))
(declare-fun thiss!992 () LongMap!338)

(declare-fun lt!21605 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1912 0))(
  ( (tuple2!1913 (_1!967 (_ BitVec 64)) (_2!967 V!2715)) )
))
(declare-datatypes ((List!1369 0))(
  ( (Nil!1366) (Cons!1365 (h!1945 tuple2!1912) (t!4507 List!1369)) )
))
(declare-datatypes ((ListLongMap!1303 0))(
  ( (ListLongMap!1304 (toList!667 List!1369)) )
))
(declare-fun lt!21604 () ListLongMap!1303)

(declare-fun contains!641 (ListLongMap!1303 (_ BitVec 64)) Bool)

(assert (=> b!54185 (= lt!21605 (contains!641 lt!21604 (select (arr!1685 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) from!355)))))

(declare-fun b!54186 () Bool)

(declare-fun e!35373 () Bool)

(declare-fun e!35381 () Bool)

(declare-fun mapRes!2574 () Bool)

(assert (=> b!54186 (= e!35373 (and e!35381 mapRes!2574))))

(declare-fun condMapEmpty!2574 () Bool)

(declare-fun mapDefault!2574 () ValueCell!807)

(assert (=> b!54186 (= condMapEmpty!2574 (= (arr!1686 (_values!1958 (v!2277 (underlying!180 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!807)) mapDefault!2574)))))

(declare-fun b!54187 () Bool)

(declare-fun res!30684 () Bool)

(declare-fun e!35385 () Bool)

(assert (=> b!54187 (=> (not res!30684) (not e!35385))))

(assert (=> b!54187 (= res!30684 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1914 (_keys!3595 (v!2277 (underlying!180 thiss!992)))))))))

(declare-fun b!54188 () Bool)

(declare-fun res!30677 () Bool)

(assert (=> b!54188 (=> (not res!30677) (not e!35378))))

(assert (=> b!54188 (= res!30677 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1914 (_keys!3595 (v!2277 (underlying!180 thiss!992)))))))))

(declare-fun mapNonEmpty!2573 () Bool)

(declare-fun tp!7407 () Bool)

(declare-fun e!35387 () Bool)

(assert (=> mapNonEmpty!2573 (= mapRes!2574 (and tp!7407 e!35387))))

(declare-fun mapKey!2574 () (_ BitVec 32))

(declare-fun mapValue!2574 () ValueCell!807)

(declare-fun mapRest!2574 () (Array (_ BitVec 32) ValueCell!807))

(assert (=> mapNonEmpty!2573 (= (arr!1686 (_values!1958 (v!2277 (underlying!180 thiss!992)))) (store mapRest!2574 mapKey!2574 mapValue!2574))))

(declare-fun tp_is_empty!2301 () Bool)

(declare-fun e!35383 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!522)

(declare-fun e!35382 () Bool)

(declare-fun array_inv!1041 (array!3525) Bool)

(declare-fun array_inv!1042 (array!3527) Bool)

(assert (=> b!54189 (= e!35383 (and tp!7409 tp_is_empty!2301 (array_inv!1041 (_keys!3595 newMap!16)) (array_inv!1042 (_values!1958 newMap!16)) e!35382))))

(declare-fun b!54190 () Bool)

(declare-fun res!30678 () Bool)

(assert (=> b!54190 (=> (not res!30678) (not e!35378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54190 (= res!30678 (validMask!0 (mask!5818 (v!2277 (underlying!180 thiss!992)))))))

(declare-fun b!54191 () Bool)

(declare-fun e!35376 () Bool)

(assert (=> b!54191 (= e!35376 e!35378)))

(declare-fun res!30685 () Bool)

(assert (=> b!54191 (=> (not res!30685) (not e!35378))))

(declare-fun lt!21603 () ListLongMap!1303)

(assert (=> b!54191 (= res!30685 (contains!641 lt!21603 (select (arr!1685 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1914 0))(
  ( (tuple2!1915 (_1!968 Bool) (_2!968 LongMapFixedSize!522)) )
))
(declare-fun lt!21606 () tuple2!1914)

(declare-fun update!49 (LongMapFixedSize!522 (_ BitVec 64) V!2715) tuple2!1914)

(declare-fun get!1005 (ValueCell!807 V!2715) V!2715)

(declare-fun dynLambda!280 (Int (_ BitVec 64)) V!2715)

(assert (=> b!54191 (= lt!21606 (update!49 newMap!16 (select (arr!1685 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) from!355) (get!1005 (select (arr!1686 (_values!1958 (v!2277 (underlying!180 thiss!992)))) from!355) (dynLambda!280 (defaultEntry!1975 (v!2277 (underlying!180 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54192 () Bool)

(declare-fun res!30679 () Bool)

(assert (=> b!54192 (=> (not res!30679) (not e!35378))))

(assert (=> b!54192 (= res!30679 (and (= (size!1915 (_values!1958 (v!2277 (underlying!180 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5818 (v!2277 (underlying!180 thiss!992))))) (= (size!1914 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) (size!1915 (_values!1958 (v!2277 (underlying!180 thiss!992))))) (bvsge (mask!5818 (v!2277 (underlying!180 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1866 (v!2277 (underlying!180 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1866 (v!2277 (underlying!180 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54193 () Bool)

(declare-fun e!35375 () Bool)

(assert (=> b!54193 (= e!35375 tp_is_empty!2301)))

(declare-fun b!54194 () Bool)

(declare-fun res!30686 () Bool)

(assert (=> b!54194 (=> (not res!30686) (not e!35385))))

(assert (=> b!54194 (= res!30686 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5818 newMap!16)) (_size!310 (v!2277 (underlying!180 thiss!992)))))))

(declare-fun b!54195 () Bool)

(declare-fun res!30680 () Bool)

(assert (=> b!54195 (=> (not res!30680) (not e!35385))))

(declare-fun valid!200 (LongMapFixedSize!522) Bool)

(assert (=> b!54195 (= res!30680 (valid!200 newMap!16))))

(declare-fun b!54196 () Bool)

(declare-fun res!30682 () Bool)

(assert (=> b!54196 (=> (not res!30682) (not e!35378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3525 (_ BitVec 32)) Bool)

(assert (=> b!54196 (= res!30682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3595 (v!2277 (underlying!180 thiss!992))) (mask!5818 (v!2277 (underlying!180 thiss!992)))))))

(declare-fun mapNonEmpty!2574 () Bool)

(declare-fun mapRes!2573 () Bool)

(declare-fun tp!7408 () Bool)

(declare-fun e!35386 () Bool)

(assert (=> mapNonEmpty!2574 (= mapRes!2573 (and tp!7408 e!35386))))

(declare-fun mapKey!2573 () (_ BitVec 32))

(declare-fun mapValue!2573 () ValueCell!807)

(declare-fun mapRest!2573 () (Array (_ BitVec 32) ValueCell!807))

(assert (=> mapNonEmpty!2574 (= (arr!1686 (_values!1958 newMap!16)) (store mapRest!2573 mapKey!2573 mapValue!2573))))

(declare-fun b!54197 () Bool)

(assert (=> b!54197 (= e!35386 tp_is_empty!2301)))

(declare-fun b!54198 () Bool)

(declare-fun e!35379 () Bool)

(declare-fun e!35374 () Bool)

(assert (=> b!54198 (= e!35379 e!35374)))

(declare-fun mapIsEmpty!2573 () Bool)

(assert (=> mapIsEmpty!2573 mapRes!2574))

(declare-fun b!54199 () Bool)

(assert (=> b!54199 (= e!35387 tp_is_empty!2301)))

(declare-fun mapIsEmpty!2574 () Bool)

(assert (=> mapIsEmpty!2574 mapRes!2573))

(declare-fun b!54200 () Bool)

(assert (=> b!54200 (= e!35385 e!35376)))

(declare-fun res!30681 () Bool)

(assert (=> b!54200 (=> (not res!30681) (not e!35376))))

(assert (=> b!54200 (= res!30681 (and (= lt!21604 lt!21603) (not (= (select (arr!1685 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1685 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1048 (LongMapFixedSize!522) ListLongMap!1303)

(assert (=> b!54200 (= lt!21603 (map!1048 newMap!16))))

(declare-fun getCurrentListMap!377 (array!3525 array!3527 (_ BitVec 32) (_ BitVec 32) V!2715 V!2715 (_ BitVec 32) Int) ListLongMap!1303)

(assert (=> b!54200 (= lt!21604 (getCurrentListMap!377 (_keys!3595 (v!2277 (underlying!180 thiss!992))) (_values!1958 (v!2277 (underlying!180 thiss!992))) (mask!5818 (v!2277 (underlying!180 thiss!992))) (extraKeys!1866 (v!2277 (underlying!180 thiss!992))) (zeroValue!1893 (v!2277 (underlying!180 thiss!992))) (minValue!1893 (v!2277 (underlying!180 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1975 (v!2277 (underlying!180 thiss!992)))))))

(declare-fun res!30683 () Bool)

(assert (=> start!8302 (=> (not res!30683) (not e!35385))))

(declare-fun valid!201 (LongMap!338) Bool)

(assert (=> start!8302 (= res!30683 (valid!201 thiss!992))))

(assert (=> start!8302 e!35385))

(declare-fun e!35377 () Bool)

(assert (=> start!8302 e!35377))

(assert (=> start!8302 true))

(assert (=> start!8302 e!35383))

(assert (=> b!54201 (= e!35374 (and tp!7410 tp_is_empty!2301 (array_inv!1041 (_keys!3595 (v!2277 (underlying!180 thiss!992)))) (array_inv!1042 (_values!1958 (v!2277 (underlying!180 thiss!992)))) e!35373))))

(declare-fun b!54202 () Bool)

(assert (=> b!54202 (= e!35381 tp_is_empty!2301)))

(declare-fun b!54203 () Bool)

(assert (=> b!54203 (= e!35377 e!35379)))

(declare-fun b!54204 () Bool)

(declare-fun res!30676 () Bool)

(assert (=> b!54204 (=> (not res!30676) (not e!35378))))

(declare-datatypes ((List!1370 0))(
  ( (Nil!1367) (Cons!1366 (h!1946 (_ BitVec 64)) (t!4508 List!1370)) )
))
(declare-fun arrayNoDuplicates!0 (array!3525 (_ BitVec 32) List!1370) Bool)

(assert (=> b!54204 (= res!30676 (arrayNoDuplicates!0 (_keys!3595 (v!2277 (underlying!180 thiss!992))) #b00000000000000000000000000000000 Nil!1367))))

(declare-fun b!54205 () Bool)

(assert (=> b!54205 (= e!35382 (and e!35375 mapRes!2573))))

(declare-fun condMapEmpty!2573 () Bool)

(declare-fun mapDefault!2573 () ValueCell!807)

(assert (=> b!54205 (= condMapEmpty!2573 (= (arr!1686 (_values!1958 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!807)) mapDefault!2573)))))

(assert (= (and start!8302 res!30683) b!54187))

(assert (= (and b!54187 res!30684) b!54195))

(assert (= (and b!54195 res!30680) b!54194))

(assert (= (and b!54194 res!30686) b!54200))

(assert (= (and b!54200 res!30681) b!54191))

(assert (= (and b!54191 res!30685) b!54190))

(assert (= (and b!54190 res!30678) b!54192))

(assert (= (and b!54192 res!30679) b!54196))

(assert (= (and b!54196 res!30682) b!54204))

(assert (= (and b!54204 res!30676) b!54188))

(assert (= (and b!54188 res!30677) b!54185))

(assert (= (and b!54186 condMapEmpty!2574) mapIsEmpty!2573))

(assert (= (and b!54186 (not condMapEmpty!2574)) mapNonEmpty!2573))

(get-info :version)

(assert (= (and mapNonEmpty!2573 ((_ is ValueCellFull!807) mapValue!2574)) b!54199))

(assert (= (and b!54186 ((_ is ValueCellFull!807) mapDefault!2574)) b!54202))

(assert (= b!54201 b!54186))

(assert (= b!54198 b!54201))

(assert (= b!54203 b!54198))

(assert (= start!8302 b!54203))

(assert (= (and b!54205 condMapEmpty!2573) mapIsEmpty!2574))

(assert (= (and b!54205 (not condMapEmpty!2573)) mapNonEmpty!2574))

(assert (= (and mapNonEmpty!2574 ((_ is ValueCellFull!807) mapValue!2573)) b!54197))

(assert (= (and b!54205 ((_ is ValueCellFull!807) mapDefault!2573)) b!54193))

(assert (= b!54189 b!54205))

(assert (= start!8302 b!54189))

(declare-fun b_lambda!2395 () Bool)

(assert (=> (not b_lambda!2395) (not b!54191)))

(declare-fun t!4504 () Bool)

(declare-fun tb!1113 () Bool)

(assert (=> (and b!54201 (= (defaultEntry!1975 (v!2277 (underlying!180 thiss!992))) (defaultEntry!1975 (v!2277 (underlying!180 thiss!992)))) t!4504) tb!1113))

(declare-fun result!2067 () Bool)

(assert (=> tb!1113 (= result!2067 tp_is_empty!2301)))

(assert (=> b!54191 t!4504))

(declare-fun b_and!3083 () Bool)

(assert (= b_and!3079 (and (=> t!4504 result!2067) b_and!3083)))

(declare-fun t!4506 () Bool)

(declare-fun tb!1115 () Bool)

(assert (=> (and b!54189 (= (defaultEntry!1975 newMap!16) (defaultEntry!1975 (v!2277 (underlying!180 thiss!992)))) t!4506) tb!1115))

(declare-fun result!2071 () Bool)

(assert (= result!2071 result!2067))

(assert (=> b!54191 t!4506))

(declare-fun b_and!3085 () Bool)

(assert (= b_and!3081 (and (=> t!4506 result!2071) b_and!3085)))

(declare-fun m!45885 () Bool)

(assert (=> b!54196 m!45885))

(declare-fun m!45887 () Bool)

(assert (=> b!54195 m!45887))

(declare-fun m!45889 () Bool)

(assert (=> start!8302 m!45889))

(declare-fun m!45891 () Bool)

(assert (=> b!54191 m!45891))

(declare-fun m!45893 () Bool)

(assert (=> b!54191 m!45893))

(declare-fun m!45895 () Bool)

(assert (=> b!54191 m!45895))

(declare-fun m!45897 () Bool)

(assert (=> b!54191 m!45897))

(declare-fun m!45899 () Bool)

(assert (=> b!54191 m!45899))

(assert (=> b!54191 m!45897))

(assert (=> b!54191 m!45893))

(assert (=> b!54191 m!45897))

(assert (=> b!54191 m!45895))

(declare-fun m!45901 () Bool)

(assert (=> b!54191 m!45901))

(assert (=> b!54191 m!45891))

(declare-fun m!45903 () Bool)

(assert (=> b!54190 m!45903))

(declare-fun m!45905 () Bool)

(assert (=> b!54201 m!45905))

(declare-fun m!45907 () Bool)

(assert (=> b!54201 m!45907))

(declare-fun m!45909 () Bool)

(assert (=> mapNonEmpty!2574 m!45909))

(assert (=> b!54200 m!45897))

(declare-fun m!45911 () Bool)

(assert (=> b!54200 m!45911))

(declare-fun m!45913 () Bool)

(assert (=> b!54200 m!45913))

(declare-fun m!45915 () Bool)

(assert (=> mapNonEmpty!2573 m!45915))

(declare-fun m!45917 () Bool)

(assert (=> b!54189 m!45917))

(declare-fun m!45919 () Bool)

(assert (=> b!54189 m!45919))

(declare-fun m!45921 () Bool)

(assert (=> b!54204 m!45921))

(assert (=> b!54185 m!45897))

(assert (=> b!54185 m!45897))

(declare-fun m!45923 () Bool)

(assert (=> b!54185 m!45923))

(check-sat (not b!54190) (not b!54191) (not b!54196) tp_is_empty!2301 (not b_next!1771) (not b!54195) b_and!3083 (not mapNonEmpty!2574) (not mapNonEmpty!2573) (not b_next!1769) b_and!3085 (not b!54189) (not b!54201) (not b!54200) (not start!8302) (not b_lambda!2395) (not b!54185) (not b!54204))
(check-sat b_and!3083 b_and!3085 (not b_next!1769) (not b_next!1771))
