; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80446 () Bool)

(assert start!80446)

(declare-fun b!943910 () Bool)

(declare-fun b_free!17977 () Bool)

(declare-fun b_next!17977 () Bool)

(assert (=> b!943910 (= b_free!17977 (not b_next!17977))))

(declare-fun tp!62438 () Bool)

(declare-fun b_and!29399 () Bool)

(assert (=> b!943910 (= tp!62438 b_and!29399)))

(declare-fun b!943906 () Bool)

(declare-fun res!633992 () Bool)

(declare-fun e!530786 () Bool)

(assert (=> b!943906 (=> (not res!633992) (not e!530786))))

(declare-datatypes ((V!32279 0))(
  ( (V!32280 (val!10293 Int)) )
))
(declare-datatypes ((ValueCell!9761 0))(
  ( (ValueCellFull!9761 (v!12821 V!32279)) (EmptyCell!9761) )
))
(declare-datatypes ((array!56987 0))(
  ( (array!56988 (arr!27415 (Array (_ BitVec 32) ValueCell!9761)) (size!27881 (_ BitVec 32))) )
))
(declare-datatypes ((array!56989 0))(
  ( (array!56990 (arr!27416 (Array (_ BitVec 32) (_ BitVec 64))) (size!27882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4672 0))(
  ( (LongMapFixedSize!4673 (defaultEntry!5627 Int) (mask!27290 (_ BitVec 32)) (extraKeys!5359 (_ BitVec 32)) (zeroValue!5463 V!32279) (minValue!5463 V!32279) (_size!2391 (_ BitVec 32)) (_keys!10529 array!56989) (_values!5650 array!56987) (_vacant!2391 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4672)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943906 (= res!633992 (validMask!0 (mask!27290 thiss!1141)))))

(declare-fun mapIsEmpty!32549 () Bool)

(declare-fun mapRes!32549 () Bool)

(assert (=> mapIsEmpty!32549 mapRes!32549))

(declare-fun b!943907 () Bool)

(declare-fun e!530785 () Bool)

(declare-fun tp_is_empty!20485 () Bool)

(assert (=> b!943907 (= e!530785 tp_is_empty!20485)))

(declare-fun b!943908 () Bool)

(declare-fun res!633994 () Bool)

(assert (=> b!943908 (=> (not res!633994) (not e!530786))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13410 0))(
  ( (tuple2!13411 (_1!6716 (_ BitVec 64)) (_2!6716 V!32279)) )
))
(declare-datatypes ((List!19223 0))(
  ( (Nil!19220) (Cons!19219 (h!20375 tuple2!13410) (t!27530 List!19223)) )
))
(declare-datatypes ((ListLongMap!12109 0))(
  ( (ListLongMap!12110 (toList!6070 List!19223)) )
))
(declare-fun contains!5151 (ListLongMap!12109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3304 (array!56989 array!56987 (_ BitVec 32) (_ BitVec 32) V!32279 V!32279 (_ BitVec 32) Int) ListLongMap!12109)

(assert (=> b!943908 (= res!633994 (contains!5151 (getCurrentListMap!3304 (_keys!10529 thiss!1141) (_values!5650 thiss!1141) (mask!27290 thiss!1141) (extraKeys!5359 thiss!1141) (zeroValue!5463 thiss!1141) (minValue!5463 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5627 thiss!1141)) key!756))))

(declare-fun b!943909 () Bool)

(assert (=> b!943909 (= e!530786 false)))

(declare-fun lt!425576 () Bool)

(declare-datatypes ((List!19224 0))(
  ( (Nil!19221) (Cons!19220 (h!20376 (_ BitVec 64)) (t!27531 List!19224)) )
))
(declare-fun arrayNoDuplicates!0 (array!56989 (_ BitVec 32) List!19224) Bool)

(assert (=> b!943909 (= lt!425576 (arrayNoDuplicates!0 (_keys!10529 thiss!1141) #b00000000000000000000000000000000 Nil!19221))))

(declare-fun mapNonEmpty!32549 () Bool)

(declare-fun tp!62437 () Bool)

(assert (=> mapNonEmpty!32549 (= mapRes!32549 (and tp!62437 e!530785))))

(declare-fun mapRest!32549 () (Array (_ BitVec 32) ValueCell!9761))

(declare-fun mapValue!32549 () ValueCell!9761)

(declare-fun mapKey!32549 () (_ BitVec 32))

(assert (=> mapNonEmpty!32549 (= (arr!27415 (_values!5650 thiss!1141)) (store mapRest!32549 mapKey!32549 mapValue!32549))))

(declare-fun e!530790 () Bool)

(declare-fun e!530788 () Bool)

(declare-fun array_inv!21390 (array!56989) Bool)

(declare-fun array_inv!21391 (array!56987) Bool)

(assert (=> b!943910 (= e!530790 (and tp!62438 tp_is_empty!20485 (array_inv!21390 (_keys!10529 thiss!1141)) (array_inv!21391 (_values!5650 thiss!1141)) e!530788))))

(declare-fun b!943911 () Bool)

(declare-fun e!530787 () Bool)

(assert (=> b!943911 (= e!530788 (and e!530787 mapRes!32549))))

(declare-fun condMapEmpty!32549 () Bool)

(declare-fun mapDefault!32549 () ValueCell!9761)

(assert (=> b!943911 (= condMapEmpty!32549 (= (arr!27415 (_values!5650 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9761)) mapDefault!32549)))))

(declare-fun b!943912 () Bool)

(declare-fun res!633995 () Bool)

(assert (=> b!943912 (=> (not res!633995) (not e!530786))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9001 0))(
  ( (MissingZero!9001 (index!38375 (_ BitVec 32))) (Found!9001 (index!38376 (_ BitVec 32))) (Intermediate!9001 (undefined!9813 Bool) (index!38377 (_ BitVec 32)) (x!80952 (_ BitVec 32))) (Undefined!9001) (MissingVacant!9001 (index!38378 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56989 (_ BitVec 32)) SeekEntryResult!9001)

(assert (=> b!943912 (= res!633995 (not ((_ is Found!9001) (seekEntry!0 key!756 (_keys!10529 thiss!1141) (mask!27290 thiss!1141)))))))

(declare-fun res!633997 () Bool)

(assert (=> start!80446 (=> (not res!633997) (not e!530786))))

(declare-fun valid!1793 (LongMapFixedSize!4672) Bool)

(assert (=> start!80446 (= res!633997 (valid!1793 thiss!1141))))

(assert (=> start!80446 e!530786))

(assert (=> start!80446 e!530790))

(assert (=> start!80446 true))

(declare-fun b!943913 () Bool)

(assert (=> b!943913 (= e!530787 tp_is_empty!20485)))

(declare-fun b!943914 () Bool)

(declare-fun res!633993 () Bool)

(assert (=> b!943914 (=> (not res!633993) (not e!530786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56989 (_ BitVec 32)) Bool)

(assert (=> b!943914 (= res!633993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10529 thiss!1141) (mask!27290 thiss!1141)))))

(declare-fun b!943915 () Bool)

(declare-fun res!633996 () Bool)

(assert (=> b!943915 (=> (not res!633996) (not e!530786))))

(assert (=> b!943915 (= res!633996 (and (= (size!27881 (_values!5650 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27290 thiss!1141))) (= (size!27882 (_keys!10529 thiss!1141)) (size!27881 (_values!5650 thiss!1141))) (bvsge (mask!27290 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5359 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5359 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943916 () Bool)

(declare-fun res!633991 () Bool)

(assert (=> b!943916 (=> (not res!633991) (not e!530786))))

(assert (=> b!943916 (= res!633991 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80446 res!633997) b!943916))

(assert (= (and b!943916 res!633991) b!943912))

(assert (= (and b!943912 res!633995) b!943908))

(assert (= (and b!943908 res!633994) b!943906))

(assert (= (and b!943906 res!633992) b!943915))

(assert (= (and b!943915 res!633996) b!943914))

(assert (= (and b!943914 res!633993) b!943909))

(assert (= (and b!943911 condMapEmpty!32549) mapIsEmpty!32549))

(assert (= (and b!943911 (not condMapEmpty!32549)) mapNonEmpty!32549))

(assert (= (and mapNonEmpty!32549 ((_ is ValueCellFull!9761) mapValue!32549)) b!943907))

(assert (= (and b!943911 ((_ is ValueCellFull!9761) mapDefault!32549)) b!943913))

(assert (= b!943910 b!943911))

(assert (= start!80446 b!943910))

(declare-fun m!878633 () Bool)

(assert (=> b!943910 m!878633))

(declare-fun m!878635 () Bool)

(assert (=> b!943910 m!878635))

(declare-fun m!878637 () Bool)

(assert (=> b!943912 m!878637))

(declare-fun m!878639 () Bool)

(assert (=> start!80446 m!878639))

(declare-fun m!878641 () Bool)

(assert (=> b!943906 m!878641))

(declare-fun m!878643 () Bool)

(assert (=> b!943909 m!878643))

(declare-fun m!878645 () Bool)

(assert (=> b!943914 m!878645))

(declare-fun m!878647 () Bool)

(assert (=> mapNonEmpty!32549 m!878647))

(declare-fun m!878649 () Bool)

(assert (=> b!943908 m!878649))

(assert (=> b!943908 m!878649))

(declare-fun m!878651 () Bool)

(assert (=> b!943908 m!878651))

(check-sat (not mapNonEmpty!32549) (not b!943912) (not b!943908) (not b_next!17977) tp_is_empty!20485 b_and!29399 (not start!80446) (not b!943906) (not b!943909) (not b!943914) (not b!943910))
(check-sat b_and!29399 (not b_next!17977))
