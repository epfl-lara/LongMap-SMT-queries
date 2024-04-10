; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80304 () Bool)

(assert start!80304)

(declare-fun b!943434 () Bool)

(declare-fun b_free!18003 () Bool)

(declare-fun b_next!18003 () Bool)

(assert (=> b!943434 (= b_free!18003 (not b_next!18003))))

(declare-fun tp!62515 () Bool)

(declare-fun b_and!29415 () Bool)

(assert (=> b!943434 (= tp!62515 b_and!29415)))

(declare-fun b!943432 () Bool)

(declare-fun res!633923 () Bool)

(declare-fun e!530439 () Bool)

(assert (=> b!943432 (=> (not res!633923) (not e!530439))))

(declare-datatypes ((V!32313 0))(
  ( (V!32314 (val!10306 Int)) )
))
(declare-datatypes ((ValueCell!9774 0))(
  ( (ValueCellFull!9774 (v!12837 V!32313)) (EmptyCell!9774) )
))
(declare-datatypes ((array!56988 0))(
  ( (array!56989 (arr!27420 (Array (_ BitVec 32) ValueCell!9774)) (size!27885 (_ BitVec 32))) )
))
(declare-datatypes ((array!56990 0))(
  ( (array!56991 (arr!27421 (Array (_ BitVec 32) (_ BitVec 64))) (size!27886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4698 0))(
  ( (LongMapFixedSize!4699 (defaultEntry!5640 Int) (mask!27268 (_ BitVec 32)) (extraKeys!5372 (_ BitVec 32)) (zeroValue!5476 V!32313) (minValue!5476 V!32313) (_size!2404 (_ BitVec 32)) (_keys!10514 array!56990) (_values!5663 array!56988) (_vacant!2404 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4698)

(assert (=> b!943432 (= res!633923 (and (= (size!27885 (_values!5663 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27268 thiss!1141))) (= (size!27886 (_keys!10514 thiss!1141)) (size!27885 (_values!5663 thiss!1141))) (bvsge (mask!27268 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5372 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5372 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943433 () Bool)

(declare-fun res!633926 () Bool)

(assert (=> b!943433 (=> (not res!633926) (not e!530439))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13442 0))(
  ( (tuple2!13443 (_1!6732 (_ BitVec 64)) (_2!6732 V!32313)) )
))
(declare-datatypes ((List!19252 0))(
  ( (Nil!19249) (Cons!19248 (h!20398 tuple2!13442) (t!27567 List!19252)) )
))
(declare-datatypes ((ListLongMap!12139 0))(
  ( (ListLongMap!12140 (toList!6085 List!19252)) )
))
(declare-fun contains!5155 (ListLongMap!12139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3319 (array!56990 array!56988 (_ BitVec 32) (_ BitVec 32) V!32313 V!32313 (_ BitVec 32) Int) ListLongMap!12139)

(assert (=> b!943433 (= res!633926 (contains!5155 (getCurrentListMap!3319 (_keys!10514 thiss!1141) (_values!5663 thiss!1141) (mask!27268 thiss!1141) (extraKeys!5372 thiss!1141) (zeroValue!5476 thiss!1141) (minValue!5476 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5640 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32588 () Bool)

(declare-fun mapRes!32588 () Bool)

(assert (=> mapIsEmpty!32588 mapRes!32588))

(declare-fun mapNonEmpty!32588 () Bool)

(declare-fun tp!62514 () Bool)

(declare-fun e!530441 () Bool)

(assert (=> mapNonEmpty!32588 (= mapRes!32588 (and tp!62514 e!530441))))

(declare-fun mapValue!32588 () ValueCell!9774)

(declare-fun mapKey!32588 () (_ BitVec 32))

(declare-fun mapRest!32588 () (Array (_ BitVec 32) ValueCell!9774))

(assert (=> mapNonEmpty!32588 (= (arr!27420 (_values!5663 thiss!1141)) (store mapRest!32588 mapKey!32588 mapValue!32588))))

(declare-fun res!633924 () Bool)

(assert (=> start!80304 (=> (not res!633924) (not e!530439))))

(declare-fun valid!1796 (LongMapFixedSize!4698) Bool)

(assert (=> start!80304 (= res!633924 (valid!1796 thiss!1141))))

(assert (=> start!80304 e!530439))

(declare-fun e!530440 () Bool)

(assert (=> start!80304 e!530440))

(assert (=> start!80304 true))

(declare-fun tp_is_empty!20511 () Bool)

(declare-fun e!530437 () Bool)

(declare-fun array_inv!21306 (array!56990) Bool)

(declare-fun array_inv!21307 (array!56988) Bool)

(assert (=> b!943434 (= e!530440 (and tp!62515 tp_is_empty!20511 (array_inv!21306 (_keys!10514 thiss!1141)) (array_inv!21307 (_values!5663 thiss!1141)) e!530437))))

(declare-fun b!943435 () Bool)

(declare-fun e!530442 () Bool)

(assert (=> b!943435 (= e!530442 tp_is_empty!20511)))

(declare-fun b!943436 () Bool)

(assert (=> b!943436 (= e!530439 false)))

(declare-fun lt!425254 () Bool)

(declare-datatypes ((List!19253 0))(
  ( (Nil!19250) (Cons!19249 (h!20399 (_ BitVec 64)) (t!27568 List!19253)) )
))
(declare-fun arrayNoDuplicates!0 (array!56990 (_ BitVec 32) List!19253) Bool)

(assert (=> b!943436 (= lt!425254 (arrayNoDuplicates!0 (_keys!10514 thiss!1141) #b00000000000000000000000000000000 Nil!19250))))

(declare-fun b!943437 () Bool)

(assert (=> b!943437 (= e!530441 tp_is_empty!20511)))

(declare-fun b!943438 () Bool)

(assert (=> b!943438 (= e!530437 (and e!530442 mapRes!32588))))

(declare-fun condMapEmpty!32588 () Bool)

(declare-fun mapDefault!32588 () ValueCell!9774)

(assert (=> b!943438 (= condMapEmpty!32588 (= (arr!27420 (_values!5663 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9774)) mapDefault!32588)))))

(declare-fun b!943439 () Bool)

(declare-fun res!633920 () Bool)

(assert (=> b!943439 (=> (not res!633920) (not e!530439))))

(assert (=> b!943439 (= res!633920 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943440 () Bool)

(declare-fun res!633925 () Bool)

(assert (=> b!943440 (=> (not res!633925) (not e!530439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56990 (_ BitVec 32)) Bool)

(assert (=> b!943440 (= res!633925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10514 thiss!1141) (mask!27268 thiss!1141)))))

(declare-fun b!943441 () Bool)

(declare-fun res!633921 () Bool)

(assert (=> b!943441 (=> (not res!633921) (not e!530439))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9051 0))(
  ( (MissingZero!9051 (index!38575 (_ BitVec 32))) (Found!9051 (index!38576 (_ BitVec 32))) (Intermediate!9051 (undefined!9863 Bool) (index!38577 (_ BitVec 32)) (x!81020 (_ BitVec 32))) (Undefined!9051) (MissingVacant!9051 (index!38578 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56990 (_ BitVec 32)) SeekEntryResult!9051)

(assert (=> b!943441 (= res!633921 (not ((_ is Found!9051) (seekEntry!0 key!756 (_keys!10514 thiss!1141) (mask!27268 thiss!1141)))))))

(declare-fun b!943442 () Bool)

(declare-fun res!633922 () Bool)

(assert (=> b!943442 (=> (not res!633922) (not e!530439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943442 (= res!633922 (validMask!0 (mask!27268 thiss!1141)))))

(assert (= (and start!80304 res!633924) b!943439))

(assert (= (and b!943439 res!633920) b!943441))

(assert (= (and b!943441 res!633921) b!943433))

(assert (= (and b!943433 res!633926) b!943442))

(assert (= (and b!943442 res!633922) b!943432))

(assert (= (and b!943432 res!633923) b!943440))

(assert (= (and b!943440 res!633925) b!943436))

(assert (= (and b!943438 condMapEmpty!32588) mapIsEmpty!32588))

(assert (= (and b!943438 (not condMapEmpty!32588)) mapNonEmpty!32588))

(assert (= (and mapNonEmpty!32588 ((_ is ValueCellFull!9774) mapValue!32588)) b!943437))

(assert (= (and b!943438 ((_ is ValueCellFull!9774) mapDefault!32588)) b!943435))

(assert (= b!943434 b!943438))

(assert (= start!80304 b!943434))

(declare-fun m!877599 () Bool)

(assert (=> b!943436 m!877599))

(declare-fun m!877601 () Bool)

(assert (=> b!943434 m!877601))

(declare-fun m!877603 () Bool)

(assert (=> b!943434 m!877603))

(declare-fun m!877605 () Bool)

(assert (=> b!943433 m!877605))

(assert (=> b!943433 m!877605))

(declare-fun m!877607 () Bool)

(assert (=> b!943433 m!877607))

(declare-fun m!877609 () Bool)

(assert (=> b!943442 m!877609))

(declare-fun m!877611 () Bool)

(assert (=> start!80304 m!877611))

(declare-fun m!877613 () Bool)

(assert (=> b!943440 m!877613))

(declare-fun m!877615 () Bool)

(assert (=> mapNonEmpty!32588 m!877615))

(declare-fun m!877617 () Bool)

(assert (=> b!943441 m!877617))

(check-sat (not b!943441) (not mapNonEmpty!32588) (not b_next!18003) (not b!943436) b_and!29415 (not b!943433) (not b!943440) tp_is_empty!20511 (not b!943434) (not b!943442) (not start!80304))
(check-sat b_and!29415 (not b_next!18003))
