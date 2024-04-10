; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8272 () Bool)

(assert start!8272)

(declare-fun b!53226 () Bool)

(declare-fun b_free!1709 () Bool)

(declare-fun b_next!1709 () Bool)

(assert (=> b!53226 (= b_free!1709 (not b_next!1709))))

(declare-fun tp!7228 () Bool)

(declare-fun b_and!2959 () Bool)

(assert (=> b!53226 (= tp!7228 b_and!2959)))

(declare-fun b!53219 () Bool)

(declare-fun b_free!1711 () Bool)

(declare-fun b_next!1711 () Bool)

(assert (=> b!53219 (= b_free!1711 (not b_next!1711))))

(declare-fun tp!7227 () Bool)

(declare-fun b_and!2961 () Bool)

(assert (=> b!53219 (= tp!7227 b_and!2961)))

(declare-fun b!53210 () Bool)

(declare-fun e!34704 () Bool)

(declare-fun e!34708 () Bool)

(assert (=> b!53210 (= e!34704 e!34708)))

(declare-fun res!30191 () Bool)

(assert (=> b!53210 (=> (not res!30191) (not e!34708))))

(declare-datatypes ((V!2675 0))(
  ( (V!2676 (val!1180 Int)) )
))
(declare-datatypes ((array!3465 0))(
  ( (array!3466 (arr!1655 (Array (_ BitVec 32) (_ BitVec 64))) (size!1884 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!792 0))(
  ( (ValueCellFull!792 (v!2249 V!2675)) (EmptyCell!792) )
))
(declare-datatypes ((array!3467 0))(
  ( (array!3468 (arr!1656 (Array (_ BitVec 32) ValueCell!792)) (size!1885 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!492 0))(
  ( (LongMapFixedSize!493 (defaultEntry!1960 Int) (mask!5793 (_ BitVec 32)) (extraKeys!1851 (_ BitVec 32)) (zeroValue!1878 V!2675) (minValue!1878 V!2675) (_size!295 (_ BitVec 32)) (_keys!3580 array!3465) (_values!1943 array!3467) (_vacant!295 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!314 0))(
  ( (Cell!315 (v!2250 LongMapFixedSize!492)) )
))
(declare-datatypes ((LongMap!314 0))(
  ( (LongMap!315 (underlying!168 Cell!314)) )
))
(declare-fun thiss!992 () LongMap!314)

(declare-datatypes ((tuple2!1878 0))(
  ( (tuple2!1879 (_1!950 (_ BitVec 64)) (_2!950 V!2675)) )
))
(declare-datatypes ((List!1354 0))(
  ( (Nil!1351) (Cons!1350 (h!1930 tuple2!1878) (t!4432 List!1354)) )
))
(declare-datatypes ((ListLongMap!1283 0))(
  ( (ListLongMap!1284 (toList!657 List!1354)) )
))
(declare-fun lt!21424 () ListLongMap!1283)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!632 (ListLongMap!1283 (_ BitVec 64)) Bool)

(assert (=> b!53210 (= res!30191 (contains!632 lt!21424 (select (arr!1655 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!492)

(declare-datatypes ((tuple2!1880 0))(
  ( (tuple2!1881 (_1!951 Bool) (_2!951 LongMapFixedSize!492)) )
))
(declare-fun lt!21425 () tuple2!1880)

(declare-fun update!42 (LongMapFixedSize!492 (_ BitVec 64) V!2675) tuple2!1880)

(declare-fun get!988 (ValueCell!792 V!2675) V!2675)

(declare-fun dynLambda!273 (Int (_ BitVec 64)) V!2675)

(assert (=> b!53210 (= lt!21425 (update!42 newMap!16 (select (arr!1655 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) from!355) (get!988 (select (arr!1656 (_values!1943 (v!2250 (underlying!168 thiss!992)))) from!355) (dynLambda!273 (defaultEntry!1960 (v!2250 (underlying!168 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2483 () Bool)

(declare-fun mapRes!2483 () Bool)

(assert (=> mapIsEmpty!2483 mapRes!2483))

(declare-fun b!53211 () Bool)

(declare-fun res!30184 () Bool)

(declare-fun e!34698 () Bool)

(assert (=> b!53211 (=> (not res!30184) (not e!34698))))

(assert (=> b!53211 (= res!30184 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5793 newMap!16)) (_size!295 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun res!30187 () Bool)

(assert (=> start!8272 (=> (not res!30187) (not e!34698))))

(declare-fun valid!185 (LongMap!314) Bool)

(assert (=> start!8272 (= res!30187 (valid!185 thiss!992))))

(assert (=> start!8272 e!34698))

(declare-fun e!34709 () Bool)

(assert (=> start!8272 e!34709))

(assert (=> start!8272 true))

(declare-fun e!34710 () Bool)

(assert (=> start!8272 e!34710))

(declare-fun b!53212 () Bool)

(assert (=> b!53212 (= e!34708 false)))

(declare-fun lt!21423 () ListLongMap!1283)

(declare-fun lt!21426 () Bool)

(assert (=> b!53212 (= lt!21426 (contains!632 lt!21423 (select (arr!1655 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) from!355)))))

(declare-fun b!53213 () Bool)

(declare-fun res!30188 () Bool)

(assert (=> b!53213 (=> (not res!30188) (not e!34708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53213 (= res!30188 (validMask!0 (mask!5793 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun b!53214 () Bool)

(declare-fun res!30181 () Bool)

(assert (=> b!53214 (=> (not res!30181) (not e!34698))))

(declare-fun valid!186 (LongMapFixedSize!492) Bool)

(assert (=> b!53214 (= res!30181 (valid!186 newMap!16))))

(declare-fun b!53215 () Bool)

(declare-fun res!30185 () Bool)

(assert (=> b!53215 (=> (not res!30185) (not e!34698))))

(assert (=> b!53215 (= res!30185 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1884 (_keys!3580 (v!2250 (underlying!168 thiss!992)))))))))

(declare-fun b!53216 () Bool)

(declare-fun e!34706 () Bool)

(declare-fun tp_is_empty!2271 () Bool)

(assert (=> b!53216 (= e!34706 tp_is_empty!2271)))

(declare-fun b!53217 () Bool)

(declare-fun e!34707 () Bool)

(declare-fun e!34705 () Bool)

(declare-fun mapRes!2484 () Bool)

(assert (=> b!53217 (= e!34707 (and e!34705 mapRes!2484))))

(declare-fun condMapEmpty!2484 () Bool)

(declare-fun mapDefault!2484 () ValueCell!792)

(assert (=> b!53217 (= condMapEmpty!2484 (= (arr!1656 (_values!1943 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!792)) mapDefault!2484)))))

(declare-fun b!53218 () Bool)

(assert (=> b!53218 (= e!34698 e!34704)))

(declare-fun res!30183 () Bool)

(assert (=> b!53218 (=> (not res!30183) (not e!34704))))

(assert (=> b!53218 (= res!30183 (and (= lt!21423 lt!21424) (not (= (select (arr!1655 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1655 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1030 (LongMapFixedSize!492) ListLongMap!1283)

(assert (=> b!53218 (= lt!21424 (map!1030 newMap!16))))

(declare-fun getCurrentListMap!369 (array!3465 array!3467 (_ BitVec 32) (_ BitVec 32) V!2675 V!2675 (_ BitVec 32) Int) ListLongMap!1283)

(assert (=> b!53218 (= lt!21423 (getCurrentListMap!369 (_keys!3580 (v!2250 (underlying!168 thiss!992))) (_values!1943 (v!2250 (underlying!168 thiss!992))) (mask!5793 (v!2250 (underlying!168 thiss!992))) (extraKeys!1851 (v!2250 (underlying!168 thiss!992))) (zeroValue!1878 (v!2250 (underlying!168 thiss!992))) (minValue!1878 (v!2250 (underlying!168 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1960 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun array_inv!1025 (array!3465) Bool)

(declare-fun array_inv!1026 (array!3467) Bool)

(assert (=> b!53219 (= e!34710 (and tp!7227 tp_is_empty!2271 (array_inv!1025 (_keys!3580 newMap!16)) (array_inv!1026 (_values!1943 newMap!16)) e!34707))))

(declare-fun b!53220 () Bool)

(declare-fun e!34712 () Bool)

(assert (=> b!53220 (= e!34712 tp_is_empty!2271)))

(declare-fun mapNonEmpty!2483 () Bool)

(declare-fun tp!7230 () Bool)

(assert (=> mapNonEmpty!2483 (= mapRes!2483 (and tp!7230 e!34706))))

(declare-fun mapRest!2483 () (Array (_ BitVec 32) ValueCell!792))

(declare-fun mapValue!2484 () ValueCell!792)

(declare-fun mapKey!2483 () (_ BitVec 32))

(assert (=> mapNonEmpty!2483 (= (arr!1656 (_values!1943 (v!2250 (underlying!168 thiss!992)))) (store mapRest!2483 mapKey!2483 mapValue!2484))))

(declare-fun b!53221 () Bool)

(declare-fun res!30182 () Bool)

(assert (=> b!53221 (=> (not res!30182) (not e!34708))))

(declare-datatypes ((List!1355 0))(
  ( (Nil!1352) (Cons!1351 (h!1931 (_ BitVec 64)) (t!4433 List!1355)) )
))
(declare-fun arrayNoDuplicates!0 (array!3465 (_ BitVec 32) List!1355) Bool)

(assert (=> b!53221 (= res!30182 (arrayNoDuplicates!0 (_keys!3580 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000 Nil!1352))))

(declare-fun b!53222 () Bool)

(declare-fun e!34700 () Bool)

(assert (=> b!53222 (= e!34709 e!34700)))

(declare-fun b!53223 () Bool)

(declare-fun res!30189 () Bool)

(assert (=> b!53223 (=> (not res!30189) (not e!34708))))

(assert (=> b!53223 (= res!30189 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1884 (_keys!3580 (v!2250 (underlying!168 thiss!992)))))))))

(declare-fun b!53224 () Bool)

(declare-fun e!34703 () Bool)

(assert (=> b!53224 (= e!34703 tp_is_empty!2271)))

(declare-fun b!53225 () Bool)

(declare-fun e!34702 () Bool)

(assert (=> b!53225 (= e!34702 (and e!34703 mapRes!2483))))

(declare-fun condMapEmpty!2483 () Bool)

(declare-fun mapDefault!2483 () ValueCell!792)

(assert (=> b!53225 (= condMapEmpty!2483 (= (arr!1656 (_values!1943 (v!2250 (underlying!168 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!792)) mapDefault!2483)))))

(declare-fun e!34699 () Bool)

(assert (=> b!53226 (= e!34699 (and tp!7228 tp_is_empty!2271 (array_inv!1025 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) (array_inv!1026 (_values!1943 (v!2250 (underlying!168 thiss!992)))) e!34702))))

(declare-fun mapNonEmpty!2484 () Bool)

(declare-fun tp!7229 () Bool)

(assert (=> mapNonEmpty!2484 (= mapRes!2484 (and tp!7229 e!34712))))

(declare-fun mapValue!2483 () ValueCell!792)

(declare-fun mapRest!2484 () (Array (_ BitVec 32) ValueCell!792))

(declare-fun mapKey!2484 () (_ BitVec 32))

(assert (=> mapNonEmpty!2484 (= (arr!1656 (_values!1943 newMap!16)) (store mapRest!2484 mapKey!2484 mapValue!2483))))

(declare-fun b!53227 () Bool)

(assert (=> b!53227 (= e!34705 tp_is_empty!2271)))

(declare-fun b!53228 () Bool)

(declare-fun res!30186 () Bool)

(assert (=> b!53228 (=> (not res!30186) (not e!34708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3465 (_ BitVec 32)) Bool)

(assert (=> b!53228 (= res!30186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3580 (v!2250 (underlying!168 thiss!992))) (mask!5793 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun mapIsEmpty!2484 () Bool)

(assert (=> mapIsEmpty!2484 mapRes!2484))

(declare-fun b!53229 () Bool)

(assert (=> b!53229 (= e!34700 e!34699)))

(declare-fun b!53230 () Bool)

(declare-fun res!30190 () Bool)

(assert (=> b!53230 (=> (not res!30190) (not e!34708))))

(assert (=> b!53230 (= res!30190 (and (= (size!1885 (_values!1943 (v!2250 (underlying!168 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5793 (v!2250 (underlying!168 thiss!992))))) (= (size!1884 (_keys!3580 (v!2250 (underlying!168 thiss!992)))) (size!1885 (_values!1943 (v!2250 (underlying!168 thiss!992))))) (bvsge (mask!5793 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1851 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1851 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000011)))))

(assert (= (and start!8272 res!30187) b!53215))

(assert (= (and b!53215 res!30185) b!53214))

(assert (= (and b!53214 res!30181) b!53211))

(assert (= (and b!53211 res!30184) b!53218))

(assert (= (and b!53218 res!30183) b!53210))

(assert (= (and b!53210 res!30191) b!53213))

(assert (= (and b!53213 res!30188) b!53230))

(assert (= (and b!53230 res!30190) b!53228))

(assert (= (and b!53228 res!30186) b!53221))

(assert (= (and b!53221 res!30182) b!53223))

(assert (= (and b!53223 res!30189) b!53212))

(assert (= (and b!53225 condMapEmpty!2483) mapIsEmpty!2483))

(assert (= (and b!53225 (not condMapEmpty!2483)) mapNonEmpty!2483))

(get-info :version)

(assert (= (and mapNonEmpty!2483 ((_ is ValueCellFull!792) mapValue!2484)) b!53216))

(assert (= (and b!53225 ((_ is ValueCellFull!792) mapDefault!2483)) b!53224))

(assert (= b!53226 b!53225))

(assert (= b!53229 b!53226))

(assert (= b!53222 b!53229))

(assert (= start!8272 b!53222))

(assert (= (and b!53217 condMapEmpty!2484) mapIsEmpty!2484))

(assert (= (and b!53217 (not condMapEmpty!2484)) mapNonEmpty!2484))

(assert (= (and mapNonEmpty!2484 ((_ is ValueCellFull!792) mapValue!2483)) b!53220))

(assert (= (and b!53217 ((_ is ValueCellFull!792) mapDefault!2484)) b!53227))

(assert (= b!53219 b!53217))

(assert (= start!8272 b!53219))

(declare-fun b_lambda!2365 () Bool)

(assert (=> (not b_lambda!2365) (not b!53210)))

(declare-fun t!4429 () Bool)

(declare-fun tb!1053 () Bool)

(assert (=> (and b!53226 (= (defaultEntry!1960 (v!2250 (underlying!168 thiss!992))) (defaultEntry!1960 (v!2250 (underlying!168 thiss!992)))) t!4429) tb!1053))

(declare-fun result!1977 () Bool)

(assert (=> tb!1053 (= result!1977 tp_is_empty!2271)))

(assert (=> b!53210 t!4429))

(declare-fun b_and!2963 () Bool)

(assert (= b_and!2959 (and (=> t!4429 result!1977) b_and!2963)))

(declare-fun t!4431 () Bool)

(declare-fun tb!1055 () Bool)

(assert (=> (and b!53219 (= (defaultEntry!1960 newMap!16) (defaultEntry!1960 (v!2250 (underlying!168 thiss!992)))) t!4431) tb!1055))

(declare-fun result!1981 () Bool)

(assert (= result!1981 result!1977))

(assert (=> b!53210 t!4431))

(declare-fun b_and!2965 () Bool)

(assert (= b_and!2961 (and (=> t!4431 result!1981) b_and!2965)))

(declare-fun m!45285 () Bool)

(assert (=> b!53210 m!45285))

(declare-fun m!45287 () Bool)

(assert (=> b!53210 m!45287))

(declare-fun m!45289 () Bool)

(assert (=> b!53210 m!45289))

(declare-fun m!45291 () Bool)

(assert (=> b!53210 m!45291))

(assert (=> b!53210 m!45291))

(declare-fun m!45293 () Bool)

(assert (=> b!53210 m!45293))

(assert (=> b!53210 m!45287))

(assert (=> b!53210 m!45291))

(assert (=> b!53210 m!45289))

(declare-fun m!45295 () Bool)

(assert (=> b!53210 m!45295))

(assert (=> b!53210 m!45285))

(declare-fun m!45297 () Bool)

(assert (=> mapNonEmpty!2483 m!45297))

(declare-fun m!45299 () Bool)

(assert (=> start!8272 m!45299))

(declare-fun m!45301 () Bool)

(assert (=> b!53213 m!45301))

(assert (=> b!53212 m!45291))

(assert (=> b!53212 m!45291))

(declare-fun m!45303 () Bool)

(assert (=> b!53212 m!45303))

(declare-fun m!45305 () Bool)

(assert (=> mapNonEmpty!2484 m!45305))

(assert (=> b!53218 m!45291))

(declare-fun m!45307 () Bool)

(assert (=> b!53218 m!45307))

(declare-fun m!45309 () Bool)

(assert (=> b!53218 m!45309))

(declare-fun m!45311 () Bool)

(assert (=> b!53226 m!45311))

(declare-fun m!45313 () Bool)

(assert (=> b!53226 m!45313))

(declare-fun m!45315 () Bool)

(assert (=> b!53221 m!45315))

(declare-fun m!45317 () Bool)

(assert (=> b!53214 m!45317))

(declare-fun m!45319 () Bool)

(assert (=> b!53219 m!45319))

(declare-fun m!45321 () Bool)

(assert (=> b!53219 m!45321))

(declare-fun m!45323 () Bool)

(assert (=> b!53228 m!45323))

(check-sat (not b!53214) (not b!53213) (not start!8272) (not b!53221) tp_is_empty!2271 (not b_next!1709) b_and!2965 (not b!53228) (not b!53226) (not b!53219) (not b_lambda!2365) b_and!2963 (not b!53210) (not mapNonEmpty!2484) (not b!53218) (not b!53212) (not mapNonEmpty!2483) (not b_next!1711))
(check-sat b_and!2963 b_and!2965 (not b_next!1709) (not b_next!1711))
