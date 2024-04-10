; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80372 () Bool)

(assert start!80372)

(declare-fun b!943919 () Bool)

(declare-fun b_free!18015 () Bool)

(declare-fun b_next!18015 () Bool)

(assert (=> b!943919 (= b_free!18015 (not b_next!18015))))

(declare-fun tp!62554 () Bool)

(declare-fun b_and!29433 () Bool)

(assert (=> b!943919 (= tp!62554 b_and!29433)))

(declare-fun b!943913 () Bool)

(declare-fun e!530742 () Bool)

(declare-fun tp_is_empty!20523 () Bool)

(assert (=> b!943913 (= e!530742 tp_is_empty!20523)))

(declare-fun b!943914 () Bool)

(declare-fun e!530738 () Bool)

(assert (=> b!943914 (= e!530738 (not true))))

(declare-datatypes ((V!32329 0))(
  ( (V!32330 (val!10312 Int)) )
))
(declare-datatypes ((ValueCell!9780 0))(
  ( (ValueCellFull!9780 (v!12844 V!32329)) (EmptyCell!9780) )
))
(declare-datatypes ((array!57014 0))(
  ( (array!57015 (arr!27432 (Array (_ BitVec 32) ValueCell!9780)) (size!27898 (_ BitVec 32))) )
))
(declare-datatypes ((array!57016 0))(
  ( (array!57017 (arr!27433 (Array (_ BitVec 32) (_ BitVec 64))) (size!27899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4710 0))(
  ( (LongMapFixedSize!4711 (defaultEntry!5650 Int) (mask!27288 (_ BitVec 32)) (extraKeys!5382 (_ BitVec 32)) (zeroValue!5486 V!32329) (minValue!5486 V!32329) (_size!2410 (_ BitVec 32)) (_keys!10528 array!57016) (_values!5673 array!57014) (_vacant!2410 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4710)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943914 (arrayContainsKey!0 (_keys!10528 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31826 0))(
  ( (Unit!31827) )
))
(declare-fun lt!425475 () Unit!31826)

(declare-fun lemmaKeyInListMapIsInArray!293 (array!57016 array!57014 (_ BitVec 32) (_ BitVec 32) V!32329 V!32329 (_ BitVec 64) Int) Unit!31826)

(assert (=> b!943914 (= lt!425475 (lemmaKeyInListMapIsInArray!293 (_keys!10528 thiss!1141) (_values!5673 thiss!1141) (mask!27288 thiss!1141) (extraKeys!5382 thiss!1141) (zeroValue!5486 thiss!1141) (minValue!5486 thiss!1141) key!756 (defaultEntry!5650 thiss!1141)))))

(declare-fun mapIsEmpty!32610 () Bool)

(declare-fun mapRes!32610 () Bool)

(assert (=> mapIsEmpty!32610 mapRes!32610))

(declare-fun b!943915 () Bool)

(declare-fun res!634134 () Bool)

(assert (=> b!943915 (=> (not res!634134) (not e!530738))))

(declare-datatypes ((tuple2!13450 0))(
  ( (tuple2!13451 (_1!6736 (_ BitVec 64)) (_2!6736 V!32329)) )
))
(declare-datatypes ((List!19259 0))(
  ( (Nil!19256) (Cons!19255 (h!20406 tuple2!13450) (t!27576 List!19259)) )
))
(declare-datatypes ((ListLongMap!12147 0))(
  ( (ListLongMap!12148 (toList!6089 List!19259)) )
))
(declare-fun contains!5161 (ListLongMap!12147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3323 (array!57016 array!57014 (_ BitVec 32) (_ BitVec 32) V!32329 V!32329 (_ BitVec 32) Int) ListLongMap!12147)

(assert (=> b!943915 (= res!634134 (contains!5161 (getCurrentListMap!3323 (_keys!10528 thiss!1141) (_values!5673 thiss!1141) (mask!27288 thiss!1141) (extraKeys!5382 thiss!1141) (zeroValue!5486 thiss!1141) (minValue!5486 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5650 thiss!1141)) key!756))))

(declare-fun b!943916 () Bool)

(declare-fun e!530741 () Bool)

(assert (=> b!943916 (= e!530741 (and e!530742 mapRes!32610))))

(declare-fun condMapEmpty!32610 () Bool)

(declare-fun mapDefault!32610 () ValueCell!9780)

(assert (=> b!943916 (= condMapEmpty!32610 (= (arr!27432 (_values!5673 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9780)) mapDefault!32610)))))

(declare-fun b!943917 () Bool)

(declare-fun res!634135 () Bool)

(assert (=> b!943917 (=> (not res!634135) (not e!530738))))

(assert (=> b!943917 (= res!634135 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!530743 () Bool)

(declare-fun array_inv!21316 (array!57016) Bool)

(declare-fun array_inv!21317 (array!57014) Bool)

(assert (=> b!943919 (= e!530743 (and tp!62554 tp_is_empty!20523 (array_inv!21316 (_keys!10528 thiss!1141)) (array_inv!21317 (_values!5673 thiss!1141)) e!530741))))

(declare-fun b!943920 () Bool)

(declare-fun e!530739 () Bool)

(assert (=> b!943920 (= e!530739 tp_is_empty!20523)))

(declare-fun mapNonEmpty!32610 () Bool)

(declare-fun tp!62555 () Bool)

(assert (=> mapNonEmpty!32610 (= mapRes!32610 (and tp!62555 e!530739))))

(declare-fun mapKey!32610 () (_ BitVec 32))

(declare-fun mapRest!32610 () (Array (_ BitVec 32) ValueCell!9780))

(declare-fun mapValue!32610 () ValueCell!9780)

(assert (=> mapNonEmpty!32610 (= (arr!27432 (_values!5673 thiss!1141)) (store mapRest!32610 mapKey!32610 mapValue!32610))))

(declare-fun b!943918 () Bool)

(declare-fun res!634137 () Bool)

(assert (=> b!943918 (=> (not res!634137) (not e!530738))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9056 0))(
  ( (MissingZero!9056 (index!38595 (_ BitVec 32))) (Found!9056 (index!38596 (_ BitVec 32))) (Intermediate!9056 (undefined!9868 Bool) (index!38597 (_ BitVec 32)) (x!81059 (_ BitVec 32))) (Undefined!9056) (MissingVacant!9056 (index!38598 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57016 (_ BitVec 32)) SeekEntryResult!9056)

(assert (=> b!943918 (= res!634137 (not ((_ is Found!9056) (seekEntry!0 key!756 (_keys!10528 thiss!1141) (mask!27288 thiss!1141)))))))

(declare-fun res!634136 () Bool)

(assert (=> start!80372 (=> (not res!634136) (not e!530738))))

(declare-fun valid!1801 (LongMapFixedSize!4710) Bool)

(assert (=> start!80372 (= res!634136 (valid!1801 thiss!1141))))

(assert (=> start!80372 e!530738))

(assert (=> start!80372 e!530743))

(assert (=> start!80372 true))

(assert (= (and start!80372 res!634136) b!943917))

(assert (= (and b!943917 res!634135) b!943918))

(assert (= (and b!943918 res!634137) b!943915))

(assert (= (and b!943915 res!634134) b!943914))

(assert (= (and b!943916 condMapEmpty!32610) mapIsEmpty!32610))

(assert (= (and b!943916 (not condMapEmpty!32610)) mapNonEmpty!32610))

(assert (= (and mapNonEmpty!32610 ((_ is ValueCellFull!9780) mapValue!32610)) b!943920))

(assert (= (and b!943916 ((_ is ValueCellFull!9780) mapDefault!32610)) b!943913))

(assert (= b!943919 b!943916))

(assert (= start!80372 b!943919))

(declare-fun m!878025 () Bool)

(assert (=> b!943919 m!878025))

(declare-fun m!878027 () Bool)

(assert (=> b!943919 m!878027))

(declare-fun m!878029 () Bool)

(assert (=> start!80372 m!878029))

(declare-fun m!878031 () Bool)

(assert (=> b!943914 m!878031))

(declare-fun m!878033 () Bool)

(assert (=> b!943914 m!878033))

(declare-fun m!878035 () Bool)

(assert (=> mapNonEmpty!32610 m!878035))

(declare-fun m!878037 () Bool)

(assert (=> b!943918 m!878037))

(declare-fun m!878039 () Bool)

(assert (=> b!943915 m!878039))

(assert (=> b!943915 m!878039))

(declare-fun m!878041 () Bool)

(assert (=> b!943915 m!878041))

(check-sat (not b!943915) (not b!943918) (not b!943914) (not mapNonEmpty!32610) tp_is_empty!20523 (not b_next!18015) (not b!943919) b_and!29433 (not start!80372))
(check-sat b_and!29433 (not b_next!18015))
