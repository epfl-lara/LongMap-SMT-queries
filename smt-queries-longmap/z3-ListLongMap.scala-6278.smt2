; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80292 () Bool)

(assert start!80292)

(declare-fun b!943234 () Bool)

(declare-fun b_free!17991 () Bool)

(declare-fun b_next!17991 () Bool)

(assert (=> b!943234 (= b_free!17991 (not b_next!17991))))

(declare-fun tp!62479 () Bool)

(declare-fun b_and!29403 () Bool)

(assert (=> b!943234 (= tp!62479 b_and!29403)))

(declare-fun e!530332 () Bool)

(declare-datatypes ((V!32297 0))(
  ( (V!32298 (val!10300 Int)) )
))
(declare-datatypes ((ValueCell!9768 0))(
  ( (ValueCellFull!9768 (v!12831 V!32297)) (EmptyCell!9768) )
))
(declare-datatypes ((array!56964 0))(
  ( (array!56965 (arr!27408 (Array (_ BitVec 32) ValueCell!9768)) (size!27873 (_ BitVec 32))) )
))
(declare-datatypes ((array!56966 0))(
  ( (array!56967 (arr!27409 (Array (_ BitVec 32) (_ BitVec 64))) (size!27874 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4686 0))(
  ( (LongMapFixedSize!4687 (defaultEntry!5634 Int) (mask!27258 (_ BitVec 32)) (extraKeys!5366 (_ BitVec 32)) (zeroValue!5470 V!32297) (minValue!5470 V!32297) (_size!2398 (_ BitVec 32)) (_keys!10508 array!56966) (_values!5657 array!56964) (_vacant!2398 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4686)

(declare-fun tp_is_empty!20499 () Bool)

(declare-fun e!530331 () Bool)

(declare-fun array_inv!21296 (array!56966) Bool)

(declare-fun array_inv!21297 (array!56964) Bool)

(assert (=> b!943234 (= e!530331 (and tp!62479 tp_is_empty!20499 (array_inv!21296 (_keys!10508 thiss!1141)) (array_inv!21297 (_values!5657 thiss!1141)) e!530332))))

(declare-fun b!943235 () Bool)

(declare-fun e!530333 () Bool)

(assert (=> b!943235 (= e!530333 tp_is_empty!20499)))

(declare-fun mapIsEmpty!32570 () Bool)

(declare-fun mapRes!32570 () Bool)

(assert (=> mapIsEmpty!32570 mapRes!32570))

(declare-fun mapNonEmpty!32570 () Bool)

(declare-fun tp!62478 () Bool)

(assert (=> mapNonEmpty!32570 (= mapRes!32570 (and tp!62478 e!530333))))

(declare-fun mapValue!32570 () ValueCell!9768)

(declare-fun mapKey!32570 () (_ BitVec 32))

(declare-fun mapRest!32570 () (Array (_ BitVec 32) ValueCell!9768))

(assert (=> mapNonEmpty!32570 (= (arr!27408 (_values!5657 thiss!1141)) (store mapRest!32570 mapKey!32570 mapValue!32570))))

(declare-fun b!943236 () Bool)

(declare-fun e!530330 () Bool)

(assert (=> b!943236 (= e!530330 false)))

(declare-fun lt!425236 () Bool)

(declare-datatypes ((List!19244 0))(
  ( (Nil!19241) (Cons!19240 (h!20390 (_ BitVec 64)) (t!27559 List!19244)) )
))
(declare-fun arrayNoDuplicates!0 (array!56966 (_ BitVec 32) List!19244) Bool)

(assert (=> b!943236 (= lt!425236 (arrayNoDuplicates!0 (_keys!10508 thiss!1141) #b00000000000000000000000000000000 Nil!19241))))

(declare-fun b!943237 () Bool)

(declare-fun res!633799 () Bool)

(assert (=> b!943237 (=> (not res!633799) (not e!530330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943237 (= res!633799 (validMask!0 (mask!27258 thiss!1141)))))

(declare-fun b!943238 () Bool)

(declare-fun res!633796 () Bool)

(assert (=> b!943238 (=> (not res!633796) (not e!530330))))

(assert (=> b!943238 (= res!633796 (and (= (size!27873 (_values!5657 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27258 thiss!1141))) (= (size!27874 (_keys!10508 thiss!1141)) (size!27873 (_values!5657 thiss!1141))) (bvsge (mask!27258 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5366 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5366 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943239 () Bool)

(declare-fun res!633800 () Bool)

(assert (=> b!943239 (=> (not res!633800) (not e!530330))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13434 0))(
  ( (tuple2!13435 (_1!6728 (_ BitVec 64)) (_2!6728 V!32297)) )
))
(declare-datatypes ((List!19245 0))(
  ( (Nil!19242) (Cons!19241 (h!20391 tuple2!13434) (t!27560 List!19245)) )
))
(declare-datatypes ((ListLongMap!12131 0))(
  ( (ListLongMap!12132 (toList!6081 List!19245)) )
))
(declare-fun contains!5151 (ListLongMap!12131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3315 (array!56966 array!56964 (_ BitVec 32) (_ BitVec 32) V!32297 V!32297 (_ BitVec 32) Int) ListLongMap!12131)

(assert (=> b!943239 (= res!633800 (contains!5151 (getCurrentListMap!3315 (_keys!10508 thiss!1141) (_values!5657 thiss!1141) (mask!27258 thiss!1141) (extraKeys!5366 thiss!1141) (zeroValue!5470 thiss!1141) (minValue!5470 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5634 thiss!1141)) key!756))))

(declare-fun b!943240 () Bool)

(declare-fun e!530329 () Bool)

(assert (=> b!943240 (= e!530332 (and e!530329 mapRes!32570))))

(declare-fun condMapEmpty!32570 () Bool)

(declare-fun mapDefault!32570 () ValueCell!9768)

(assert (=> b!943240 (= condMapEmpty!32570 (= (arr!27408 (_values!5657 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9768)) mapDefault!32570)))))

(declare-fun b!943241 () Bool)

(declare-fun res!633797 () Bool)

(assert (=> b!943241 (=> (not res!633797) (not e!530330))))

(assert (=> b!943241 (= res!633797 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943242 () Bool)

(assert (=> b!943242 (= e!530329 tp_is_empty!20499)))

(declare-fun res!633794 () Bool)

(assert (=> start!80292 (=> (not res!633794) (not e!530330))))

(declare-fun valid!1790 (LongMapFixedSize!4686) Bool)

(assert (=> start!80292 (= res!633794 (valid!1790 thiss!1141))))

(assert (=> start!80292 e!530330))

(assert (=> start!80292 e!530331))

(assert (=> start!80292 true))

(declare-fun b!943243 () Bool)

(declare-fun res!633798 () Bool)

(assert (=> b!943243 (=> (not res!633798) (not e!530330))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9048 0))(
  ( (MissingZero!9048 (index!38563 (_ BitVec 32))) (Found!9048 (index!38564 (_ BitVec 32))) (Intermediate!9048 (undefined!9860 Bool) (index!38565 (_ BitVec 32)) (x!81001 (_ BitVec 32))) (Undefined!9048) (MissingVacant!9048 (index!38566 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56966 (_ BitVec 32)) SeekEntryResult!9048)

(assert (=> b!943243 (= res!633798 (not ((_ is Found!9048) (seekEntry!0 key!756 (_keys!10508 thiss!1141) (mask!27258 thiss!1141)))))))

(declare-fun b!943244 () Bool)

(declare-fun res!633795 () Bool)

(assert (=> b!943244 (=> (not res!633795) (not e!530330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56966 (_ BitVec 32)) Bool)

(assert (=> b!943244 (= res!633795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10508 thiss!1141) (mask!27258 thiss!1141)))))

(assert (= (and start!80292 res!633794) b!943241))

(assert (= (and b!943241 res!633797) b!943243))

(assert (= (and b!943243 res!633798) b!943239))

(assert (= (and b!943239 res!633800) b!943237))

(assert (= (and b!943237 res!633799) b!943238))

(assert (= (and b!943238 res!633796) b!943244))

(assert (= (and b!943244 res!633795) b!943236))

(assert (= (and b!943240 condMapEmpty!32570) mapIsEmpty!32570))

(assert (= (and b!943240 (not condMapEmpty!32570)) mapNonEmpty!32570))

(assert (= (and mapNonEmpty!32570 ((_ is ValueCellFull!9768) mapValue!32570)) b!943235))

(assert (= (and b!943240 ((_ is ValueCellFull!9768) mapDefault!32570)) b!943242))

(assert (= b!943234 b!943240))

(assert (= start!80292 b!943234))

(declare-fun m!877479 () Bool)

(assert (=> mapNonEmpty!32570 m!877479))

(declare-fun m!877481 () Bool)

(assert (=> b!943236 m!877481))

(declare-fun m!877483 () Bool)

(assert (=> b!943234 m!877483))

(declare-fun m!877485 () Bool)

(assert (=> b!943234 m!877485))

(declare-fun m!877487 () Bool)

(assert (=> b!943239 m!877487))

(assert (=> b!943239 m!877487))

(declare-fun m!877489 () Bool)

(assert (=> b!943239 m!877489))

(declare-fun m!877491 () Bool)

(assert (=> b!943237 m!877491))

(declare-fun m!877493 () Bool)

(assert (=> b!943243 m!877493))

(declare-fun m!877495 () Bool)

(assert (=> b!943244 m!877495))

(declare-fun m!877497 () Bool)

(assert (=> start!80292 m!877497))

(check-sat (not b_next!17991) (not b!943244) (not b!943234) b_and!29403 tp_is_empty!20499 (not mapNonEmpty!32570) (not b!943243) (not start!80292) (not b!943236) (not b!943237) (not b!943239))
(check-sat b_and!29403 (not b_next!17991))
