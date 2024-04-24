; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80128 () Bool)

(assert start!80128)

(declare-fun b!940911 () Bool)

(declare-fun b_free!17815 () Bool)

(declare-fun b_next!17815 () Bool)

(assert (=> b!940911 (= b_free!17815 (not b_next!17815))))

(declare-fun tp!61920 () Bool)

(declare-fun b_and!29237 () Bool)

(assert (=> b!940911 (= tp!61920 b_and!29237)))

(declare-fun mapNonEmpty!32275 () Bool)

(declare-fun mapRes!32275 () Bool)

(declare-fun tp!61921 () Bool)

(declare-fun e!528701 () Bool)

(assert (=> mapNonEmpty!32275 (= mapRes!32275 (and tp!61921 e!528701))))

(declare-datatypes ((V!32063 0))(
  ( (V!32064 (val!10212 Int)) )
))
(declare-datatypes ((ValueCell!9680 0))(
  ( (ValueCellFull!9680 (v!12740 V!32063)) (EmptyCell!9680) )
))
(declare-fun mapValue!32275 () ValueCell!9680)

(declare-fun mapRest!32275 () (Array (_ BitVec 32) ValueCell!9680))

(declare-fun mapKey!32275 () (_ BitVec 32))

(declare-datatypes ((array!56645 0))(
  ( (array!56646 (arr!27253 (Array (_ BitVec 32) ValueCell!9680)) (size!27715 (_ BitVec 32))) )
))
(declare-datatypes ((array!56647 0))(
  ( (array!56648 (arr!27254 (Array (_ BitVec 32) (_ BitVec 64))) (size!27716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4510 0))(
  ( (LongMapFixedSize!4511 (defaultEntry!5546 Int) (mask!27118 (_ BitVec 32)) (extraKeys!5278 (_ BitVec 32)) (zeroValue!5382 V!32063) (minValue!5382 V!32063) (_size!2310 (_ BitVec 32)) (_keys!10424 array!56647) (_values!5569 array!56645) (_vacant!2310 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4510)

(assert (=> mapNonEmpty!32275 (= (arr!27253 (_values!5569 thiss!1141)) (store mapRest!32275 mapKey!32275 mapValue!32275))))

(declare-fun b!940909 () Bool)

(declare-fun e!528704 () Bool)

(assert (=> b!940909 (= e!528704 false)))

(declare-datatypes ((SeekEntryResult!8941 0))(
  ( (MissingZero!8941 (index!38135 (_ BitVec 32))) (Found!8941 (index!38136 (_ BitVec 32))) (Intermediate!8941 (undefined!9753 Bool) (index!38137 (_ BitVec 32)) (x!80568 (_ BitVec 32))) (Undefined!8941) (MissingVacant!8941 (index!38138 (_ BitVec 32))) )
))
(declare-fun lt!424961 () SeekEntryResult!8941)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56647 (_ BitVec 32)) SeekEntryResult!8941)

(assert (=> b!940909 (= lt!424961 (seekEntry!0 key!756 (_keys!10424 thiss!1141) (mask!27118 thiss!1141)))))

(declare-fun res!632475 () Bool)

(assert (=> start!80128 (=> (not res!632475) (not e!528704))))

(declare-fun valid!1739 (LongMapFixedSize!4510) Bool)

(assert (=> start!80128 (= res!632475 (valid!1739 thiss!1141))))

(assert (=> start!80128 e!528704))

(declare-fun e!528702 () Bool)

(assert (=> start!80128 e!528702))

(assert (=> start!80128 true))

(declare-fun b!940910 () Bool)

(declare-fun res!632474 () Bool)

(assert (=> b!940910 (=> (not res!632474) (not e!528704))))

(assert (=> b!940910 (= res!632474 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!20323 () Bool)

(declare-fun e!528705 () Bool)

(declare-fun array_inv!21276 (array!56647) Bool)

(declare-fun array_inv!21277 (array!56645) Bool)

(assert (=> b!940911 (= e!528702 (and tp!61920 tp_is_empty!20323 (array_inv!21276 (_keys!10424 thiss!1141)) (array_inv!21277 (_values!5569 thiss!1141)) e!528705))))

(declare-fun b!940912 () Bool)

(assert (=> b!940912 (= e!528701 tp_is_empty!20323)))

(declare-fun b!940913 () Bool)

(declare-fun e!528706 () Bool)

(assert (=> b!940913 (= e!528706 tp_is_empty!20323)))

(declare-fun b!940914 () Bool)

(assert (=> b!940914 (= e!528705 (and e!528706 mapRes!32275))))

(declare-fun condMapEmpty!32275 () Bool)

(declare-fun mapDefault!32275 () ValueCell!9680)

(assert (=> b!940914 (= condMapEmpty!32275 (= (arr!27253 (_values!5569 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9680)) mapDefault!32275)))))

(declare-fun mapIsEmpty!32275 () Bool)

(assert (=> mapIsEmpty!32275 mapRes!32275))

(assert (= (and start!80128 res!632475) b!940910))

(assert (= (and b!940910 res!632474) b!940909))

(assert (= (and b!940914 condMapEmpty!32275) mapIsEmpty!32275))

(assert (= (and b!940914 (not condMapEmpty!32275)) mapNonEmpty!32275))

(get-info :version)

(assert (= (and mapNonEmpty!32275 ((_ is ValueCellFull!9680) mapValue!32275)) b!940912))

(assert (= (and b!940914 ((_ is ValueCellFull!9680) mapDefault!32275)) b!940913))

(assert (= b!940911 b!940914))

(assert (= start!80128 b!940911))

(declare-fun m!876917 () Bool)

(assert (=> mapNonEmpty!32275 m!876917))

(declare-fun m!876919 () Bool)

(assert (=> b!940909 m!876919))

(declare-fun m!876921 () Bool)

(assert (=> start!80128 m!876921))

(declare-fun m!876923 () Bool)

(assert (=> b!940911 m!876923))

(declare-fun m!876925 () Bool)

(assert (=> b!940911 m!876925))

(check-sat tp_is_empty!20323 b_and!29237 (not start!80128) (not b!940911) (not b!940909) (not b_next!17815) (not mapNonEmpty!32275))
(check-sat b_and!29237 (not b_next!17815))
