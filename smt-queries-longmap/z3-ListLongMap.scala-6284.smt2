; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80384 () Bool)

(assert start!80384)

(declare-fun b!944086 () Bool)

(declare-fun b_free!18027 () Bool)

(declare-fun b_next!18027 () Bool)

(assert (=> b!944086 (= b_free!18027 (not b_next!18027))))

(declare-fun tp!62590 () Bool)

(declare-fun b_and!29445 () Bool)

(assert (=> b!944086 (= tp!62590 b_and!29445)))

(declare-fun b!944085 () Bool)

(declare-fun res!634235 () Bool)

(declare-fun e!530864 () Bool)

(assert (=> b!944085 (=> (not res!634235) (not e!530864))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32345 0))(
  ( (V!32346 (val!10318 Int)) )
))
(declare-datatypes ((ValueCell!9786 0))(
  ( (ValueCellFull!9786 (v!12850 V!32345)) (EmptyCell!9786) )
))
(declare-datatypes ((array!57038 0))(
  ( (array!57039 (arr!27444 (Array (_ BitVec 32) ValueCell!9786)) (size!27910 (_ BitVec 32))) )
))
(declare-datatypes ((array!57040 0))(
  ( (array!57041 (arr!27445 (Array (_ BitVec 32) (_ BitVec 64))) (size!27911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4722 0))(
  ( (LongMapFixedSize!4723 (defaultEntry!5656 Int) (mask!27298 (_ BitVec 32)) (extraKeys!5388 (_ BitVec 32)) (zeroValue!5492 V!32345) (minValue!5492 V!32345) (_size!2416 (_ BitVec 32)) (_keys!10534 array!57040) (_values!5679 array!57038) (_vacant!2416 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4722)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9059 0))(
  ( (MissingZero!9059 (index!38607 (_ BitVec 32))) (Found!9059 (index!38608 (_ BitVec 32))) (Intermediate!9059 (undefined!9871 Bool) (index!38609 (_ BitVec 32)) (x!81078 (_ BitVec 32))) (Undefined!9059) (MissingVacant!9059 (index!38610 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57040 (_ BitVec 32)) SeekEntryResult!9059)

(assert (=> b!944085 (= res!634235 (not ((_ is Found!9059) (seekEntry!0 key!756 (_keys!10534 thiss!1141) (mask!27298 thiss!1141)))))))

(declare-fun e!530863 () Bool)

(declare-fun e!530860 () Bool)

(declare-fun tp_is_empty!20535 () Bool)

(declare-fun array_inv!21324 (array!57040) Bool)

(declare-fun array_inv!21325 (array!57038) Bool)

(assert (=> b!944086 (= e!530860 (and tp!62590 tp_is_empty!20535 (array_inv!21324 (_keys!10534 thiss!1141)) (array_inv!21325 (_values!5679 thiss!1141)) e!530863))))

(declare-fun b!944087 () Bool)

(declare-fun e!530866 () Bool)

(assert (=> b!944087 (= e!530866 tp_is_empty!20535)))

(declare-fun b!944088 () Bool)

(declare-fun e!530861 () Bool)

(declare-fun mapRes!32628 () Bool)

(assert (=> b!944088 (= e!530863 (and e!530861 mapRes!32628))))

(declare-fun condMapEmpty!32628 () Bool)

(declare-fun mapDefault!32628 () ValueCell!9786)

(assert (=> b!944088 (= condMapEmpty!32628 (= (arr!27444 (_values!5679 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9786)) mapDefault!32628)))))

(declare-fun b!944089 () Bool)

(declare-fun e!530862 () Bool)

(assert (=> b!944089 (= e!530862 true)))

(declare-fun lt!425522 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57040 (_ BitVec 32)) Bool)

(assert (=> b!944089 (= lt!425522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10534 thiss!1141) (mask!27298 thiss!1141)))))

(declare-fun b!944090 () Bool)

(assert (=> b!944090 (= e!530864 (not e!530862))))

(declare-fun res!634234 () Bool)

(assert (=> b!944090 (=> res!634234 e!530862)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944090 (= res!634234 (not (validMask!0 (mask!27298 thiss!1141))))))

(declare-fun lt!425523 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57040 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944090 (= lt!425523 (arrayScanForKey!0 (_keys!10534 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944090 (arrayContainsKey!0 (_keys!10534 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31832 0))(
  ( (Unit!31833) )
))
(declare-fun lt!425521 () Unit!31832)

(declare-fun lemmaKeyInListMapIsInArray!296 (array!57040 array!57038 (_ BitVec 32) (_ BitVec 32) V!32345 V!32345 (_ BitVec 64) Int) Unit!31832)

(assert (=> b!944090 (= lt!425521 (lemmaKeyInListMapIsInArray!296 (_keys!10534 thiss!1141) (_values!5679 thiss!1141) (mask!27298 thiss!1141) (extraKeys!5388 thiss!1141) (zeroValue!5492 thiss!1141) (minValue!5492 thiss!1141) key!756 (defaultEntry!5656 thiss!1141)))))

(declare-fun b!944091 () Bool)

(declare-fun res!634236 () Bool)

(assert (=> b!944091 (=> (not res!634236) (not e!530864))))

(assert (=> b!944091 (= res!634236 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!634239 () Bool)

(assert (=> start!80384 (=> (not res!634239) (not e!530864))))

(declare-fun valid!1804 (LongMapFixedSize!4722) Bool)

(assert (=> start!80384 (= res!634239 (valid!1804 thiss!1141))))

(assert (=> start!80384 e!530864))

(assert (=> start!80384 e!530860))

(assert (=> start!80384 true))

(declare-fun mapNonEmpty!32628 () Bool)

(declare-fun tp!62591 () Bool)

(assert (=> mapNonEmpty!32628 (= mapRes!32628 (and tp!62591 e!530866))))

(declare-fun mapValue!32628 () ValueCell!9786)

(declare-fun mapKey!32628 () (_ BitVec 32))

(declare-fun mapRest!32628 () (Array (_ BitVec 32) ValueCell!9786))

(assert (=> mapNonEmpty!32628 (= (arr!27444 (_values!5679 thiss!1141)) (store mapRest!32628 mapKey!32628 mapValue!32628))))

(declare-fun b!944092 () Bool)

(assert (=> b!944092 (= e!530861 tp_is_empty!20535)))

(declare-fun b!944093 () Bool)

(declare-fun res!634238 () Bool)

(assert (=> b!944093 (=> res!634238 e!530862)))

(assert (=> b!944093 (= res!634238 (or (not (= (size!27911 (_keys!10534 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27298 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27911 (_keys!10534 thiss!1141))) (bvslt lt!425523 #b00000000000000000000000000000000) (bvsgt lt!425523 (size!27911 (_keys!10534 thiss!1141)))))))

(declare-fun mapIsEmpty!32628 () Bool)

(assert (=> mapIsEmpty!32628 mapRes!32628))

(declare-fun b!944094 () Bool)

(declare-fun res!634237 () Bool)

(assert (=> b!944094 (=> (not res!634237) (not e!530864))))

(declare-datatypes ((tuple2!13458 0))(
  ( (tuple2!13459 (_1!6740 (_ BitVec 64)) (_2!6740 V!32345)) )
))
(declare-datatypes ((List!19263 0))(
  ( (Nil!19260) (Cons!19259 (h!20410 tuple2!13458) (t!27580 List!19263)) )
))
(declare-datatypes ((ListLongMap!12155 0))(
  ( (ListLongMap!12156 (toList!6093 List!19263)) )
))
(declare-fun contains!5165 (ListLongMap!12155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3327 (array!57040 array!57038 (_ BitVec 32) (_ BitVec 32) V!32345 V!32345 (_ BitVec 32) Int) ListLongMap!12155)

(assert (=> b!944094 (= res!634237 (contains!5165 (getCurrentListMap!3327 (_keys!10534 thiss!1141) (_values!5679 thiss!1141) (mask!27298 thiss!1141) (extraKeys!5388 thiss!1141) (zeroValue!5492 thiss!1141) (minValue!5492 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5656 thiss!1141)) key!756))))

(assert (= (and start!80384 res!634239) b!944091))

(assert (= (and b!944091 res!634236) b!944085))

(assert (= (and b!944085 res!634235) b!944094))

(assert (= (and b!944094 res!634237) b!944090))

(assert (= (and b!944090 (not res!634234)) b!944093))

(assert (= (and b!944093 (not res!634238)) b!944089))

(assert (= (and b!944088 condMapEmpty!32628) mapIsEmpty!32628))

(assert (= (and b!944088 (not condMapEmpty!32628)) mapNonEmpty!32628))

(assert (= (and mapNonEmpty!32628 ((_ is ValueCellFull!9786) mapValue!32628)) b!944087))

(assert (= (and b!944088 ((_ is ValueCellFull!9786) mapDefault!32628)) b!944092))

(assert (= b!944086 b!944088))

(assert (= start!80384 b!944086))

(declare-fun m!878157 () Bool)

(assert (=> b!944089 m!878157))

(declare-fun m!878159 () Bool)

(assert (=> start!80384 m!878159))

(declare-fun m!878161 () Bool)

(assert (=> b!944085 m!878161))

(declare-fun m!878163 () Bool)

(assert (=> b!944094 m!878163))

(assert (=> b!944094 m!878163))

(declare-fun m!878165 () Bool)

(assert (=> b!944094 m!878165))

(declare-fun m!878167 () Bool)

(assert (=> b!944086 m!878167))

(declare-fun m!878169 () Bool)

(assert (=> b!944086 m!878169))

(declare-fun m!878171 () Bool)

(assert (=> b!944090 m!878171))

(declare-fun m!878173 () Bool)

(assert (=> b!944090 m!878173))

(declare-fun m!878175 () Bool)

(assert (=> b!944090 m!878175))

(declare-fun m!878177 () Bool)

(assert (=> b!944090 m!878177))

(declare-fun m!878179 () Bool)

(assert (=> mapNonEmpty!32628 m!878179))

(check-sat (not b!944090) b_and!29445 (not b!944085) (not mapNonEmpty!32628) (not b_next!18027) (not b!944086) (not start!80384) (not b!944089) tp_is_empty!20535 (not b!944094))
(check-sat b_and!29445 (not b_next!18027))
