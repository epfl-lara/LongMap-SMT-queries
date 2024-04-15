; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79942 () Bool)

(assert start!79942)

(declare-fun b!939771 () Bool)

(declare-fun b_free!17815 () Bool)

(declare-fun b_next!17815 () Bool)

(assert (=> b!939771 (= b_free!17815 (not b_next!17815))))

(declare-fun tp!61920 () Bool)

(declare-fun b_and!29201 () Bool)

(assert (=> b!939771 (= tp!61920 b_and!29201)))

(declare-fun b!939767 () Bool)

(declare-fun e!527975 () Bool)

(assert (=> b!939767 (= e!527975 false)))

(declare-datatypes ((SeekEntryResult!8987 0))(
  ( (MissingZero!8987 (index!38319 (_ BitVec 32))) (Found!8987 (index!38320 (_ BitVec 32))) (Intermediate!8987 (undefined!9799 Bool) (index!38321 (_ BitVec 32)) (x!80595 (_ BitVec 32))) (Undefined!8987) (MissingVacant!8987 (index!38322 (_ BitVec 32))) )
))
(declare-fun lt!424364 () SeekEntryResult!8987)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32063 0))(
  ( (V!32064 (val!10212 Int)) )
))
(declare-datatypes ((ValueCell!9680 0))(
  ( (ValueCellFull!9680 (v!12742 V!32063)) (EmptyCell!9680) )
))
(declare-datatypes ((array!56559 0))(
  ( (array!56560 (arr!27215 (Array (_ BitVec 32) ValueCell!9680)) (size!27678 (_ BitVec 32))) )
))
(declare-datatypes ((array!56561 0))(
  ( (array!56562 (arr!27216 (Array (_ BitVec 32) (_ BitVec 64))) (size!27679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4510 0))(
  ( (LongMapFixedSize!4511 (defaultEntry!5546 Int) (mask!27068 (_ BitVec 32)) (extraKeys!5278 (_ BitVec 32)) (zeroValue!5382 V!32063) (minValue!5382 V!32063) (_size!2310 (_ BitVec 32)) (_keys!10391 array!56561) (_values!5569 array!56559) (_vacant!2310 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4510)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56561 (_ BitVec 32)) SeekEntryResult!8987)

(assert (=> b!939767 (= lt!424364 (seekEntry!0 key!756 (_keys!10391 thiss!1141) (mask!27068 thiss!1141)))))

(declare-fun b!939768 () Bool)

(declare-fun e!527973 () Bool)

(declare-fun e!527972 () Bool)

(declare-fun mapRes!32275 () Bool)

(assert (=> b!939768 (= e!527973 (and e!527972 mapRes!32275))))

(declare-fun condMapEmpty!32275 () Bool)

(declare-fun mapDefault!32275 () ValueCell!9680)

(assert (=> b!939768 (= condMapEmpty!32275 (= (arr!27215 (_values!5569 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9680)) mapDefault!32275)))))

(declare-fun b!939769 () Bool)

(declare-fun res!632021 () Bool)

(assert (=> b!939769 (=> (not res!632021) (not e!527975))))

(assert (=> b!939769 (= res!632021 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939770 () Bool)

(declare-fun tp_is_empty!20323 () Bool)

(assert (=> b!939770 (= e!527972 tp_is_empty!20323)))

(declare-fun e!527974 () Bool)

(declare-fun array_inv!21228 (array!56561) Bool)

(declare-fun array_inv!21229 (array!56559) Bool)

(assert (=> b!939771 (= e!527974 (and tp!61920 tp_is_empty!20323 (array_inv!21228 (_keys!10391 thiss!1141)) (array_inv!21229 (_values!5569 thiss!1141)) e!527973))))

(declare-fun res!632020 () Bool)

(assert (=> start!79942 (=> (not res!632020) (not e!527975))))

(declare-fun valid!1740 (LongMapFixedSize!4510) Bool)

(assert (=> start!79942 (= res!632020 (valid!1740 thiss!1141))))

(assert (=> start!79942 e!527975))

(assert (=> start!79942 e!527974))

(assert (=> start!79942 true))

(declare-fun mapNonEmpty!32275 () Bool)

(declare-fun tp!61921 () Bool)

(declare-fun e!527976 () Bool)

(assert (=> mapNonEmpty!32275 (= mapRes!32275 (and tp!61921 e!527976))))

(declare-fun mapValue!32275 () ValueCell!9680)

(declare-fun mapRest!32275 () (Array (_ BitVec 32) ValueCell!9680))

(declare-fun mapKey!32275 () (_ BitVec 32))

(assert (=> mapNonEmpty!32275 (= (arr!27215 (_values!5569 thiss!1141)) (store mapRest!32275 mapKey!32275 mapValue!32275))))

(declare-fun mapIsEmpty!32275 () Bool)

(assert (=> mapIsEmpty!32275 mapRes!32275))

(declare-fun b!939772 () Bool)

(assert (=> b!939772 (= e!527976 tp_is_empty!20323)))

(assert (= (and start!79942 res!632020) b!939769))

(assert (= (and b!939769 res!632021) b!939767))

(assert (= (and b!939768 condMapEmpty!32275) mapIsEmpty!32275))

(assert (= (and b!939768 (not condMapEmpty!32275)) mapNonEmpty!32275))

(get-info :version)

(assert (= (and mapNonEmpty!32275 ((_ is ValueCellFull!9680) mapValue!32275)) b!939772))

(assert (= (and b!939768 ((_ is ValueCellFull!9680) mapDefault!32275)) b!939770))

(assert (= b!939771 b!939768))

(assert (= start!79942 b!939771))

(declare-fun m!874865 () Bool)

(assert (=> b!939767 m!874865))

(declare-fun m!874867 () Bool)

(assert (=> b!939771 m!874867))

(declare-fun m!874869 () Bool)

(assert (=> b!939771 m!874869))

(declare-fun m!874871 () Bool)

(assert (=> start!79942 m!874871))

(declare-fun m!874873 () Bool)

(assert (=> mapNonEmpty!32275 m!874873))

(check-sat (not b_next!17815) b_and!29201 (not b!939767) (not mapNonEmpty!32275) (not b!939771) tp_is_empty!20323 (not start!79942))
(check-sat b_and!29201 (not b_next!17815))
