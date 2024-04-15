; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80254 () Bool)

(assert start!80254)

(declare-fun b!942667 () Bool)

(declare-fun b_free!17971 () Bool)

(declare-fun b_next!17971 () Bool)

(assert (=> b!942667 (= b_free!17971 (not b_next!17971))))

(declare-fun tp!62420 () Bool)

(declare-fun b_and!29357 () Bool)

(assert (=> b!942667 (= tp!62420 b_and!29357)))

(declare-fun b!942665 () Bool)

(declare-fun e!530005 () Bool)

(declare-fun e!530002 () Bool)

(declare-fun mapRes!32540 () Bool)

(assert (=> b!942665 (= e!530005 (and e!530002 mapRes!32540))))

(declare-fun condMapEmpty!32540 () Bool)

(declare-datatypes ((V!32271 0))(
  ( (V!32272 (val!10290 Int)) )
))
(declare-datatypes ((ValueCell!9758 0))(
  ( (ValueCellFull!9758 (v!12820 V!32271)) (EmptyCell!9758) )
))
(declare-datatypes ((array!56889 0))(
  ( (array!56890 (arr!27371 (Array (_ BitVec 32) ValueCell!9758)) (size!27838 (_ BitVec 32))) )
))
(declare-datatypes ((array!56891 0))(
  ( (array!56892 (arr!27372 (Array (_ BitVec 32) (_ BitVec 64))) (size!27839 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4666 0))(
  ( (LongMapFixedSize!4667 (defaultEntry!5624 Int) (mask!27235 (_ BitVec 32)) (extraKeys!5356 (_ BitVec 32)) (zeroValue!5460 V!32271) (minValue!5460 V!32271) (_size!2388 (_ BitVec 32)) (_keys!10493 array!56891) (_values!5647 array!56889) (_vacant!2388 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4666)

(declare-fun mapDefault!32540 () ValueCell!9758)

(assert (=> b!942665 (= condMapEmpty!32540 (= (arr!27371 (_values!5647 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9758)) mapDefault!32540)))))

(declare-fun b!942666 () Bool)

(declare-fun res!633474 () Bool)

(declare-fun e!530006 () Bool)

(assert (=> b!942666 (=> (not res!633474) (not e!530006))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942666 (= res!633474 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!20479 () Bool)

(declare-fun e!530003 () Bool)

(declare-fun array_inv!21332 (array!56891) Bool)

(declare-fun array_inv!21333 (array!56889) Bool)

(assert (=> b!942667 (= e!530003 (and tp!62420 tp_is_empty!20479 (array_inv!21332 (_keys!10493 thiss!1141)) (array_inv!21333 (_values!5647 thiss!1141)) e!530005))))

(declare-fun b!942668 () Bool)

(declare-fun e!530001 () Bool)

(assert (=> b!942668 (= e!530001 tp_is_empty!20479)))

(declare-fun b!942669 () Bool)

(declare-fun res!633475 () Bool)

(assert (=> b!942669 (=> (not res!633475) (not e!530006))))

(assert (=> b!942669 (= res!633475 (and (= (size!27838 (_values!5647 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27235 thiss!1141))) (= (size!27839 (_keys!10493 thiss!1141)) (size!27838 (_values!5647 thiss!1141))) (bvsge (mask!27235 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5356 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5356 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942670 () Bool)

(declare-fun res!633476 () Bool)

(assert (=> b!942670 (=> (not res!633476) (not e!530006))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9042 0))(
  ( (MissingZero!9042 (index!38539 (_ BitVec 32))) (Found!9042 (index!38540 (_ BitVec 32))) (Intermediate!9042 (undefined!9854 Bool) (index!38541 (_ BitVec 32)) (x!80966 (_ BitVec 32))) (Undefined!9042) (MissingVacant!9042 (index!38542 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56891 (_ BitVec 32)) SeekEntryResult!9042)

(assert (=> b!942670 (= res!633476 (not ((_ is Found!9042) (seekEntry!0 key!756 (_keys!10493 thiss!1141) (mask!27235 thiss!1141)))))))

(declare-fun b!942671 () Bool)

(declare-fun res!633477 () Bool)

(assert (=> b!942671 (=> (not res!633477) (not e!530006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56891 (_ BitVec 32)) Bool)

(assert (=> b!942671 (= res!633477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10493 thiss!1141) (mask!27235 thiss!1141)))))

(declare-fun b!942673 () Bool)

(declare-fun res!633480 () Bool)

(assert (=> b!942673 (=> (not res!633480) (not e!530006))))

(declare-datatypes ((tuple2!13470 0))(
  ( (tuple2!13471 (_1!6746 (_ BitVec 64)) (_2!6746 V!32271)) )
))
(declare-datatypes ((List!19239 0))(
  ( (Nil!19236) (Cons!19235 (h!20385 tuple2!13470) (t!27545 List!19239)) )
))
(declare-datatypes ((ListLongMap!12157 0))(
  ( (ListLongMap!12158 (toList!6094 List!19239)) )
))
(declare-fun contains!5107 (ListLongMap!12157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3257 (array!56891 array!56889 (_ BitVec 32) (_ BitVec 32) V!32271 V!32271 (_ BitVec 32) Int) ListLongMap!12157)

(assert (=> b!942673 (= res!633480 (contains!5107 (getCurrentListMap!3257 (_keys!10493 thiss!1141) (_values!5647 thiss!1141) (mask!27235 thiss!1141) (extraKeys!5356 thiss!1141) (zeroValue!5460 thiss!1141) (minValue!5460 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5624 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32540 () Bool)

(declare-fun tp!62419 () Bool)

(assert (=> mapNonEmpty!32540 (= mapRes!32540 (and tp!62419 e!530001))))

(declare-fun mapRest!32540 () (Array (_ BitVec 32) ValueCell!9758))

(declare-fun mapValue!32540 () ValueCell!9758)

(declare-fun mapKey!32540 () (_ BitVec 32))

(assert (=> mapNonEmpty!32540 (= (arr!27371 (_values!5647 thiss!1141)) (store mapRest!32540 mapKey!32540 mapValue!32540))))

(declare-fun mapIsEmpty!32540 () Bool)

(assert (=> mapIsEmpty!32540 mapRes!32540))

(declare-fun b!942674 () Bool)

(assert (=> b!942674 (= e!530002 tp_is_empty!20479)))

(declare-fun b!942675 () Bool)

(assert (=> b!942675 (= e!530006 false)))

(declare-fun lt!424970 () Bool)

(declare-datatypes ((List!19240 0))(
  ( (Nil!19237) (Cons!19236 (h!20386 (_ BitVec 64)) (t!27546 List!19240)) )
))
(declare-fun arrayNoDuplicates!0 (array!56891 (_ BitVec 32) List!19240) Bool)

(assert (=> b!942675 (= lt!424970 (arrayNoDuplicates!0 (_keys!10493 thiss!1141) #b00000000000000000000000000000000 Nil!19237))))

(declare-fun res!633479 () Bool)

(assert (=> start!80254 (=> (not res!633479) (not e!530006))))

(declare-fun valid!1794 (LongMapFixedSize!4666) Bool)

(assert (=> start!80254 (= res!633479 (valid!1794 thiss!1141))))

(assert (=> start!80254 e!530006))

(assert (=> start!80254 e!530003))

(assert (=> start!80254 true))

(declare-fun b!942672 () Bool)

(declare-fun res!633478 () Bool)

(assert (=> b!942672 (=> (not res!633478) (not e!530006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942672 (= res!633478 (validMask!0 (mask!27235 thiss!1141)))))

(assert (= (and start!80254 res!633479) b!942666))

(assert (= (and b!942666 res!633474) b!942670))

(assert (= (and b!942670 res!633476) b!942673))

(assert (= (and b!942673 res!633480) b!942672))

(assert (= (and b!942672 res!633478) b!942669))

(assert (= (and b!942669 res!633475) b!942671))

(assert (= (and b!942671 res!633477) b!942675))

(assert (= (and b!942665 condMapEmpty!32540) mapIsEmpty!32540))

(assert (= (and b!942665 (not condMapEmpty!32540)) mapNonEmpty!32540))

(assert (= (and mapNonEmpty!32540 ((_ is ValueCellFull!9758) mapValue!32540)) b!942668))

(assert (= (and b!942665 ((_ is ValueCellFull!9758) mapDefault!32540)) b!942674))

(assert (= b!942667 b!942665))

(assert (= start!80254 b!942667))

(declare-fun m!876521 () Bool)

(assert (=> mapNonEmpty!32540 m!876521))

(declare-fun m!876523 () Bool)

(assert (=> b!942672 m!876523))

(declare-fun m!876525 () Bool)

(assert (=> b!942671 m!876525))

(declare-fun m!876527 () Bool)

(assert (=> b!942675 m!876527))

(declare-fun m!876529 () Bool)

(assert (=> b!942667 m!876529))

(declare-fun m!876531 () Bool)

(assert (=> b!942667 m!876531))

(declare-fun m!876533 () Bool)

(assert (=> b!942670 m!876533))

(declare-fun m!876535 () Bool)

(assert (=> b!942673 m!876535))

(assert (=> b!942673 m!876535))

(declare-fun m!876537 () Bool)

(assert (=> b!942673 m!876537))

(declare-fun m!876539 () Bool)

(assert (=> start!80254 m!876539))

(check-sat (not start!80254) (not b!942667) (not mapNonEmpty!32540) tp_is_empty!20479 (not b!942671) (not b!942670) (not b_next!17971) (not b!942675) (not b!942673) b_and!29357 (not b!942672))
(check-sat b_and!29357 (not b_next!17971))
