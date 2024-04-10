; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80028 () Bool)

(assert start!80028)

(declare-fun b!940926 () Bool)

(declare-fun b_free!17883 () Bool)

(declare-fun b_next!17883 () Bool)

(assert (=> b!940926 (= b_free!17883 (not b_next!17883))))

(declare-fun tp!62124 () Bool)

(declare-fun b_and!29295 () Bool)

(assert (=> b!940926 (= tp!62124 b_and!29295)))

(declare-fun tp_is_empty!20391 () Bool)

(declare-fun e!528891 () Bool)

(declare-fun e!528886 () Bool)

(declare-datatypes ((V!32153 0))(
  ( (V!32154 (val!10246 Int)) )
))
(declare-datatypes ((ValueCell!9714 0))(
  ( (ValueCellFull!9714 (v!12777 V!32153)) (EmptyCell!9714) )
))
(declare-datatypes ((array!56730 0))(
  ( (array!56731 (arr!27300 (Array (_ BitVec 32) ValueCell!9714)) (size!27761 (_ BitVec 32))) )
))
(declare-datatypes ((array!56732 0))(
  ( (array!56733 (arr!27301 (Array (_ BitVec 32) (_ BitVec 64))) (size!27762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4578 0))(
  ( (LongMapFixedSize!4579 (defaultEntry!5580 Int) (mask!27131 (_ BitVec 32)) (extraKeys!5312 (_ BitVec 32)) (zeroValue!5416 V!32153) (minValue!5416 V!32153) (_size!2344 (_ BitVec 32)) (_keys!10430 array!56732) (_values!5603 array!56730) (_vacant!2344 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4578)

(declare-fun array_inv!21220 (array!56732) Bool)

(declare-fun array_inv!21221 (array!56730) Bool)

(assert (=> b!940926 (= e!528891 (and tp!62124 tp_is_empty!20391 (array_inv!21220 (_keys!10430 thiss!1141)) (array_inv!21221 (_values!5603 thiss!1141)) e!528886))))

(declare-fun mapIsEmpty!32377 () Bool)

(declare-fun mapRes!32377 () Bool)

(assert (=> mapIsEmpty!32377 mapRes!32377))

(declare-fun b!940927 () Bool)

(declare-fun e!528888 () Bool)

(assert (=> b!940927 (= e!528888 tp_is_empty!20391)))

(declare-fun b!940928 () Bool)

(declare-fun e!528889 () Bool)

(assert (=> b!940928 (= e!528889 true)))

(declare-fun lt!424858 () Bool)

(declare-datatypes ((List!19199 0))(
  ( (Nil!19196) (Cons!19195 (h!20341 (_ BitVec 64)) (t!27514 List!19199)) )
))
(declare-fun arrayNoDuplicates!0 (array!56732 (_ BitVec 32) List!19199) Bool)

(assert (=> b!940928 (= lt!424858 (arrayNoDuplicates!0 (_keys!10430 thiss!1141) #b00000000000000000000000000000000 Nil!19196))))

(declare-fun mapNonEmpty!32377 () Bool)

(declare-fun tp!62123 () Bool)

(assert (=> mapNonEmpty!32377 (= mapRes!32377 (and tp!62123 e!528888))))

(declare-fun mapRest!32377 () (Array (_ BitVec 32) ValueCell!9714))

(declare-fun mapValue!32377 () ValueCell!9714)

(declare-fun mapKey!32377 () (_ BitVec 32))

(assert (=> mapNonEmpty!32377 (= (arr!27300 (_values!5603 thiss!1141)) (store mapRest!32377 mapKey!32377 mapValue!32377))))

(declare-fun b!940929 () Bool)

(declare-fun e!528892 () Bool)

(declare-fun e!528890 () Bool)

(assert (=> b!940929 (= e!528892 e!528890)))

(declare-fun res!632646 () Bool)

(assert (=> b!940929 (=> (not res!632646) (not e!528890))))

(declare-datatypes ((SeekEntryResult!9012 0))(
  ( (MissingZero!9012 (index!38419 (_ BitVec 32))) (Found!9012 (index!38420 (_ BitVec 32))) (Intermediate!9012 (undefined!9824 Bool) (index!38421 (_ BitVec 32)) (x!80713 (_ BitVec 32))) (Undefined!9012) (MissingVacant!9012 (index!38422 (_ BitVec 32))) )
))
(declare-fun lt!424856 () SeekEntryResult!9012)

(get-info :version)

(assert (=> b!940929 (= res!632646 ((_ is Found!9012) lt!424856))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56732 (_ BitVec 32)) SeekEntryResult!9012)

(assert (=> b!940929 (= lt!424856 (seekEntry!0 key!756 (_keys!10430 thiss!1141) (mask!27131 thiss!1141)))))

(declare-fun b!940930 () Bool)

(declare-fun res!632645 () Bool)

(assert (=> b!940930 (=> (not res!632645) (not e!528892))))

(assert (=> b!940930 (= res!632645 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940931 () Bool)

(declare-fun res!632643 () Bool)

(assert (=> b!940931 (=> res!632643 e!528889)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56732 (_ BitVec 32)) Bool)

(assert (=> b!940931 (= res!632643 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10430 thiss!1141) (mask!27131 thiss!1141))))))

(declare-fun b!940933 () Bool)

(declare-fun e!528885 () Bool)

(assert (=> b!940933 (= e!528886 (and e!528885 mapRes!32377))))

(declare-fun condMapEmpty!32377 () Bool)

(declare-fun mapDefault!32377 () ValueCell!9714)

(assert (=> b!940933 (= condMapEmpty!32377 (= (arr!27300 (_values!5603 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9714)) mapDefault!32377)))))

(declare-fun b!940934 () Bool)

(declare-fun res!632644 () Bool)

(assert (=> b!940934 (=> res!632644 e!528889)))

(assert (=> b!940934 (= res!632644 (or (not (= (size!27761 (_values!5603 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27131 thiss!1141)))) (not (= (size!27762 (_keys!10430 thiss!1141)) (size!27761 (_values!5603 thiss!1141)))) (bvslt (mask!27131 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5312 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5312 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940935 () Bool)

(assert (=> b!940935 (= e!528885 tp_is_empty!20391)))

(declare-fun res!632647 () Bool)

(assert (=> start!80028 (=> (not res!632647) (not e!528892))))

(declare-fun valid!1756 (LongMapFixedSize!4578) Bool)

(assert (=> start!80028 (= res!632647 (valid!1756 thiss!1141))))

(assert (=> start!80028 e!528892))

(assert (=> start!80028 e!528891))

(assert (=> start!80028 true))

(declare-fun b!940932 () Bool)

(assert (=> b!940932 (= e!528890 (not e!528889))))

(declare-fun res!632642 () Bool)

(assert (=> b!940932 (=> res!632642 e!528889)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940932 (= res!632642 (not (validMask!0 (mask!27131 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940932 (arrayContainsKey!0 (_keys!10430 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31790 0))(
  ( (Unit!31791) )
))
(declare-fun lt!424857 () Unit!31790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56732 (_ BitVec 64) (_ BitVec 32)) Unit!31790)

(assert (=> b!940932 (= lt!424857 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10430 thiss!1141) key!756 (index!38420 lt!424856)))))

(assert (= (and start!80028 res!632647) b!940930))

(assert (= (and b!940930 res!632645) b!940929))

(assert (= (and b!940929 res!632646) b!940932))

(assert (= (and b!940932 (not res!632642)) b!940934))

(assert (= (and b!940934 (not res!632644)) b!940931))

(assert (= (and b!940931 (not res!632643)) b!940928))

(assert (= (and b!940933 condMapEmpty!32377) mapIsEmpty!32377))

(assert (= (and b!940933 (not condMapEmpty!32377)) mapNonEmpty!32377))

(assert (= (and mapNonEmpty!32377 ((_ is ValueCellFull!9714) mapValue!32377)) b!940927))

(assert (= (and b!940933 ((_ is ValueCellFull!9714) mapDefault!32377)) b!940935))

(assert (= b!940926 b!940933))

(assert (= start!80028 b!940926))

(declare-fun m!876213 () Bool)

(assert (=> b!940932 m!876213))

(declare-fun m!876215 () Bool)

(assert (=> b!940932 m!876215))

(declare-fun m!876217 () Bool)

(assert (=> b!940932 m!876217))

(declare-fun m!876219 () Bool)

(assert (=> start!80028 m!876219))

(declare-fun m!876221 () Bool)

(assert (=> b!940926 m!876221))

(declare-fun m!876223 () Bool)

(assert (=> b!940926 m!876223))

(declare-fun m!876225 () Bool)

(assert (=> b!940928 m!876225))

(declare-fun m!876227 () Bool)

(assert (=> mapNonEmpty!32377 m!876227))

(declare-fun m!876229 () Bool)

(assert (=> b!940931 m!876229))

(declare-fun m!876231 () Bool)

(assert (=> b!940929 m!876231))

(check-sat tp_is_empty!20391 (not start!80028) (not mapNonEmpty!32377) (not b_next!17883) (not b!940928) (not b!940931) (not b!940932) (not b!940926) (not b!940929) b_and!29295)
(check-sat b_and!29295 (not b_next!17883))
