; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80470 () Bool)

(assert start!80470)

(declare-fun b!944304 () Bool)

(declare-fun b_free!18001 () Bool)

(declare-fun b_next!18001 () Bool)

(assert (=> b!944304 (= b_free!18001 (not b_next!18001))))

(declare-fun tp!62509 () Bool)

(declare-fun b_and!29423 () Bool)

(assert (=> b!944304 (= tp!62509 b_and!29423)))

(declare-fun b!944302 () Bool)

(declare-fun e!531003 () Bool)

(declare-fun e!531005 () Bool)

(declare-fun mapRes!32585 () Bool)

(assert (=> b!944302 (= e!531003 (and e!531005 mapRes!32585))))

(declare-fun condMapEmpty!32585 () Bool)

(declare-datatypes ((V!32311 0))(
  ( (V!32312 (val!10305 Int)) )
))
(declare-datatypes ((ValueCell!9773 0))(
  ( (ValueCellFull!9773 (v!12833 V!32311)) (EmptyCell!9773) )
))
(declare-datatypes ((array!57035 0))(
  ( (array!57036 (arr!27439 (Array (_ BitVec 32) ValueCell!9773)) (size!27905 (_ BitVec 32))) )
))
(declare-datatypes ((array!57037 0))(
  ( (array!57038 (arr!27440 (Array (_ BitVec 32) (_ BitVec 64))) (size!27906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4696 0))(
  ( (LongMapFixedSize!4697 (defaultEntry!5639 Int) (mask!27310 (_ BitVec 32)) (extraKeys!5371 (_ BitVec 32)) (zeroValue!5475 V!32311) (minValue!5475 V!32311) (_size!2403 (_ BitVec 32)) (_keys!10541 array!57037) (_values!5662 array!57035) (_vacant!2403 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4696)

(declare-fun mapDefault!32585 () ValueCell!9773)

(assert (=> b!944302 (= condMapEmpty!32585 (= (arr!27439 (_values!5662 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9773)) mapDefault!32585)))))

(declare-fun b!944303 () Bool)

(declare-fun res!634249 () Bool)

(declare-fun e!531001 () Bool)

(assert (=> b!944303 (=> (not res!634249) (not e!531001))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944303 (= res!634249 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!531006 () Bool)

(declare-fun tp_is_empty!20509 () Bool)

(declare-fun array_inv!21408 (array!57037) Bool)

(declare-fun array_inv!21409 (array!57035) Bool)

(assert (=> b!944304 (= e!531006 (and tp!62509 tp_is_empty!20509 (array_inv!21408 (_keys!10541 thiss!1141)) (array_inv!21409 (_values!5662 thiss!1141)) e!531003))))

(declare-fun b!944305 () Bool)

(declare-fun res!634248 () Bool)

(assert (=> b!944305 (=> (not res!634248) (not e!531001))))

(assert (=> b!944305 (= res!634248 (and (= (size!27905 (_values!5662 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27310 thiss!1141))) (= (size!27906 (_keys!10541 thiss!1141)) (size!27905 (_values!5662 thiss!1141))) (bvsge (mask!27310 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5371 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5371 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!944307 () Bool)

(declare-fun res!634244 () Bool)

(assert (=> b!944307 (=> (not res!634244) (not e!531001))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9010 0))(
  ( (MissingZero!9010 (index!38411 (_ BitVec 32))) (Found!9010 (index!38412 (_ BitVec 32))) (Intermediate!9010 (undefined!9822 Bool) (index!38413 (_ BitVec 32)) (x!80993 (_ BitVec 32))) (Undefined!9010) (MissingVacant!9010 (index!38414 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57037 (_ BitVec 32)) SeekEntryResult!9010)

(assert (=> b!944307 (= res!634244 (not ((_ is Found!9010) (seekEntry!0 key!756 (_keys!10541 thiss!1141) (mask!27310 thiss!1141)))))))

(declare-fun b!944308 () Bool)

(declare-fun res!634246 () Bool)

(assert (=> b!944308 (=> (not res!634246) (not e!531001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57037 (_ BitVec 32)) Bool)

(assert (=> b!944308 (= res!634246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10541 thiss!1141) (mask!27310 thiss!1141)))))

(declare-fun b!944309 () Bool)

(assert (=> b!944309 (= e!531001 false)))

(declare-fun lt!425612 () Bool)

(declare-datatypes ((List!19239 0))(
  ( (Nil!19236) (Cons!19235 (h!20391 (_ BitVec 64)) (t!27546 List!19239)) )
))
(declare-fun arrayNoDuplicates!0 (array!57037 (_ BitVec 32) List!19239) Bool)

(assert (=> b!944309 (= lt!425612 (arrayNoDuplicates!0 (_keys!10541 thiss!1141) #b00000000000000000000000000000000 Nil!19236))))

(declare-fun b!944310 () Bool)

(declare-fun res!634247 () Bool)

(assert (=> b!944310 (=> (not res!634247) (not e!531001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944310 (= res!634247 (validMask!0 (mask!27310 thiss!1141)))))

(declare-fun mapNonEmpty!32585 () Bool)

(declare-fun tp!62510 () Bool)

(declare-fun e!531002 () Bool)

(assert (=> mapNonEmpty!32585 (= mapRes!32585 (and tp!62510 e!531002))))

(declare-fun mapKey!32585 () (_ BitVec 32))

(declare-fun mapValue!32585 () ValueCell!9773)

(declare-fun mapRest!32585 () (Array (_ BitVec 32) ValueCell!9773))

(assert (=> mapNonEmpty!32585 (= (arr!27439 (_values!5662 thiss!1141)) (store mapRest!32585 mapKey!32585 mapValue!32585))))

(declare-fun b!944311 () Bool)

(declare-fun res!634245 () Bool)

(assert (=> b!944311 (=> (not res!634245) (not e!531001))))

(declare-datatypes ((tuple2!13426 0))(
  ( (tuple2!13427 (_1!6724 (_ BitVec 64)) (_2!6724 V!32311)) )
))
(declare-datatypes ((List!19240 0))(
  ( (Nil!19237) (Cons!19236 (h!20392 tuple2!13426) (t!27547 List!19240)) )
))
(declare-datatypes ((ListLongMap!12125 0))(
  ( (ListLongMap!12126 (toList!6078 List!19240)) )
))
(declare-fun contains!5159 (ListLongMap!12125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3312 (array!57037 array!57035 (_ BitVec 32) (_ BitVec 32) V!32311 V!32311 (_ BitVec 32) Int) ListLongMap!12125)

(assert (=> b!944311 (= res!634245 (contains!5159 (getCurrentListMap!3312 (_keys!10541 thiss!1141) (_values!5662 thiss!1141) (mask!27310 thiss!1141) (extraKeys!5371 thiss!1141) (zeroValue!5475 thiss!1141) (minValue!5475 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5639 thiss!1141)) key!756))))

(declare-fun b!944312 () Bool)

(assert (=> b!944312 (= e!531002 tp_is_empty!20509)))

(declare-fun mapIsEmpty!32585 () Bool)

(assert (=> mapIsEmpty!32585 mapRes!32585))

(declare-fun res!634243 () Bool)

(assert (=> start!80470 (=> (not res!634243) (not e!531001))))

(declare-fun valid!1802 (LongMapFixedSize!4696) Bool)

(assert (=> start!80470 (= res!634243 (valid!1802 thiss!1141))))

(assert (=> start!80470 e!531001))

(assert (=> start!80470 e!531006))

(assert (=> start!80470 true))

(declare-fun b!944306 () Bool)

(assert (=> b!944306 (= e!531005 tp_is_empty!20509)))

(assert (= (and start!80470 res!634243) b!944303))

(assert (= (and b!944303 res!634249) b!944307))

(assert (= (and b!944307 res!634244) b!944311))

(assert (= (and b!944311 res!634245) b!944310))

(assert (= (and b!944310 res!634247) b!944305))

(assert (= (and b!944305 res!634248) b!944308))

(assert (= (and b!944308 res!634246) b!944309))

(assert (= (and b!944302 condMapEmpty!32585) mapIsEmpty!32585))

(assert (= (and b!944302 (not condMapEmpty!32585)) mapNonEmpty!32585))

(assert (= (and mapNonEmpty!32585 ((_ is ValueCellFull!9773) mapValue!32585)) b!944312))

(assert (= (and b!944302 ((_ is ValueCellFull!9773) mapDefault!32585)) b!944306))

(assert (= b!944304 b!944302))

(assert (= start!80470 b!944304))

(declare-fun m!878873 () Bool)

(assert (=> b!944308 m!878873))

(declare-fun m!878875 () Bool)

(assert (=> start!80470 m!878875))

(declare-fun m!878877 () Bool)

(assert (=> b!944309 m!878877))

(declare-fun m!878879 () Bool)

(assert (=> b!944307 m!878879))

(declare-fun m!878881 () Bool)

(assert (=> b!944310 m!878881))

(declare-fun m!878883 () Bool)

(assert (=> b!944304 m!878883))

(declare-fun m!878885 () Bool)

(assert (=> b!944304 m!878885))

(declare-fun m!878887 () Bool)

(assert (=> mapNonEmpty!32585 m!878887))

(declare-fun m!878889 () Bool)

(assert (=> b!944311 m!878889))

(assert (=> b!944311 m!878889))

(declare-fun m!878891 () Bool)

(assert (=> b!944311 m!878891))

(check-sat (not b!944309) (not b_next!18001) (not mapNonEmpty!32585) (not b!944310) (not b!944311) (not b!944307) b_and!29423 (not b!944304) tp_is_empty!20509 (not start!80470) (not b!944308))
(check-sat b_and!29423 (not b_next!18001))
