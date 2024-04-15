; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79954 () Bool)

(assert start!79954)

(declare-fun b!939878 () Bool)

(declare-fun b_free!17827 () Bool)

(declare-fun b_next!17827 () Bool)

(assert (=> b!939878 (= b_free!17827 (not b_next!17827))))

(declare-fun tp!61957 () Bool)

(declare-fun b_and!29213 () Bool)

(assert (=> b!939878 (= tp!61957 b_and!29213)))

(declare-fun b!939875 () Bool)

(declare-fun e!528082 () Bool)

(declare-fun tp_is_empty!20335 () Bool)

(assert (=> b!939875 (= e!528082 tp_is_empty!20335)))

(declare-fun b!939876 () Bool)

(declare-fun e!528084 () Bool)

(declare-fun e!528083 () Bool)

(declare-fun mapRes!32293 () Bool)

(assert (=> b!939876 (= e!528084 (and e!528083 mapRes!32293))))

(declare-fun condMapEmpty!32293 () Bool)

(declare-datatypes ((V!32079 0))(
  ( (V!32080 (val!10218 Int)) )
))
(declare-datatypes ((ValueCell!9686 0))(
  ( (ValueCellFull!9686 (v!12748 V!32079)) (EmptyCell!9686) )
))
(declare-datatypes ((array!56583 0))(
  ( (array!56584 (arr!27227 (Array (_ BitVec 32) ValueCell!9686)) (size!27690 (_ BitVec 32))) )
))
(declare-datatypes ((array!56585 0))(
  ( (array!56586 (arr!27228 (Array (_ BitVec 32) (_ BitVec 64))) (size!27691 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4522 0))(
  ( (LongMapFixedSize!4523 (defaultEntry!5552 Int) (mask!27078 (_ BitVec 32)) (extraKeys!5284 (_ BitVec 32)) (zeroValue!5388 V!32079) (minValue!5388 V!32079) (_size!2316 (_ BitVec 32)) (_keys!10397 array!56585) (_values!5575 array!56583) (_vacant!2316 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4522)

(declare-fun mapDefault!32293 () ValueCell!9686)

(assert (=> b!939876 (= condMapEmpty!32293 (= (arr!27227 (_values!5575 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9686)) mapDefault!32293)))))

(declare-fun b!939877 () Bool)

(declare-fun e!528081 () Bool)

(assert (=> b!939877 (= e!528081 false)))

(declare-datatypes ((SeekEntryResult!8991 0))(
  ( (MissingZero!8991 (index!38335 (_ BitVec 32))) (Found!8991 (index!38336 (_ BitVec 32))) (Intermediate!8991 (undefined!9803 Bool) (index!38337 (_ BitVec 32)) (x!80615 (_ BitVec 32))) (Undefined!8991) (MissingVacant!8991 (index!38338 (_ BitVec 32))) )
))
(declare-fun lt!424382 () SeekEntryResult!8991)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56585 (_ BitVec 32)) SeekEntryResult!8991)

(assert (=> b!939877 (= lt!424382 (seekEntry!0 key!756 (_keys!10397 thiss!1141) (mask!27078 thiss!1141)))))

(declare-fun e!528079 () Bool)

(declare-fun array_inv!21236 (array!56585) Bool)

(declare-fun array_inv!21237 (array!56583) Bool)

(assert (=> b!939878 (= e!528079 (and tp!61957 tp_is_empty!20335 (array_inv!21236 (_keys!10397 thiss!1141)) (array_inv!21237 (_values!5575 thiss!1141)) e!528084))))

(declare-fun mapIsEmpty!32293 () Bool)

(assert (=> mapIsEmpty!32293 mapRes!32293))

(declare-fun mapNonEmpty!32293 () Bool)

(declare-fun tp!61956 () Bool)

(assert (=> mapNonEmpty!32293 (= mapRes!32293 (and tp!61956 e!528082))))

(declare-fun mapValue!32293 () ValueCell!9686)

(declare-fun mapRest!32293 () (Array (_ BitVec 32) ValueCell!9686))

(declare-fun mapKey!32293 () (_ BitVec 32))

(assert (=> mapNonEmpty!32293 (= (arr!27227 (_values!5575 thiss!1141)) (store mapRest!32293 mapKey!32293 mapValue!32293))))

(declare-fun b!939880 () Bool)

(declare-fun res!632056 () Bool)

(assert (=> b!939880 (=> (not res!632056) (not e!528081))))

(assert (=> b!939880 (= res!632056 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632057 () Bool)

(assert (=> start!79954 (=> (not res!632057) (not e!528081))))

(declare-fun valid!1743 (LongMapFixedSize!4522) Bool)

(assert (=> start!79954 (= res!632057 (valid!1743 thiss!1141))))

(assert (=> start!79954 e!528081))

(assert (=> start!79954 e!528079))

(assert (=> start!79954 true))

(declare-fun b!939879 () Bool)

(assert (=> b!939879 (= e!528083 tp_is_empty!20335)))

(assert (= (and start!79954 res!632057) b!939880))

(assert (= (and b!939880 res!632056) b!939877))

(assert (= (and b!939876 condMapEmpty!32293) mapIsEmpty!32293))

(assert (= (and b!939876 (not condMapEmpty!32293)) mapNonEmpty!32293))

(get-info :version)

(assert (= (and mapNonEmpty!32293 ((_ is ValueCellFull!9686) mapValue!32293)) b!939875))

(assert (= (and b!939876 ((_ is ValueCellFull!9686) mapDefault!32293)) b!939879))

(assert (= b!939878 b!939876))

(assert (= start!79954 b!939878))

(declare-fun m!874925 () Bool)

(assert (=> b!939877 m!874925))

(declare-fun m!874927 () Bool)

(assert (=> b!939878 m!874927))

(declare-fun m!874929 () Bool)

(assert (=> b!939878 m!874929))

(declare-fun m!874931 () Bool)

(assert (=> mapNonEmpty!32293 m!874931))

(declare-fun m!874933 () Bool)

(assert (=> start!79954 m!874933))

(check-sat (not mapNonEmpty!32293) (not b_next!17827) (not b!939877) (not b!939878) tp_is_empty!20335 b_and!29213 (not start!79954))
(check-sat b_and!29213 (not b_next!17827))
