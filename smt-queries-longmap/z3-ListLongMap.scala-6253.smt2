; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80152 () Bool)

(assert start!80152)

(declare-fun b!941176 () Bool)

(declare-fun b_free!17839 () Bool)

(declare-fun b_next!17839 () Bool)

(assert (=> b!941176 (= b_free!17839 (not b_next!17839))))

(declare-fun tp!61993 () Bool)

(declare-fun b_and!29261 () Bool)

(assert (=> b!941176 (= tp!61993 b_and!29261)))

(declare-fun b!941169 () Bool)

(declare-fun e!528946 () Bool)

(declare-fun tp_is_empty!20347 () Bool)

(assert (=> b!941169 (= e!528946 tp_is_empty!20347)))

(declare-fun b!941170 () Bool)

(declare-fun e!528944 () Bool)

(assert (=> b!941170 (= e!528944 true)))

(declare-fun lt!425019 () Bool)

(declare-datatypes ((V!32095 0))(
  ( (V!32096 (val!10224 Int)) )
))
(declare-datatypes ((ValueCell!9692 0))(
  ( (ValueCellFull!9692 (v!12752 V!32095)) (EmptyCell!9692) )
))
(declare-datatypes ((array!56693 0))(
  ( (array!56694 (arr!27277 (Array (_ BitVec 32) ValueCell!9692)) (size!27739 (_ BitVec 32))) )
))
(declare-datatypes ((array!56695 0))(
  ( (array!56696 (arr!27278 (Array (_ BitVec 32) (_ BitVec 64))) (size!27740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4534 0))(
  ( (LongMapFixedSize!4535 (defaultEntry!5558 Int) (mask!27138 (_ BitVec 32)) (extraKeys!5290 (_ BitVec 32)) (zeroValue!5394 V!32095) (minValue!5394 V!32095) (_size!2322 (_ BitVec 32)) (_keys!10436 array!56695) (_values!5581 array!56693) (_vacant!2322 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4534)

(declare-datatypes ((List!19170 0))(
  ( (Nil!19167) (Cons!19166 (h!20318 (_ BitVec 64)) (t!27477 List!19170)) )
))
(declare-fun arrayNoDuplicates!0 (array!56695 (_ BitVec 32) List!19170) Bool)

(assert (=> b!941170 (= lt!425019 (arrayNoDuplicates!0 (_keys!10436 thiss!1141) #b00000000000000000000000000000000 Nil!19167))))

(declare-fun b!941171 () Bool)

(declare-fun e!528940 () Bool)

(declare-fun e!528941 () Bool)

(assert (=> b!941171 (= e!528940 e!528941)))

(declare-fun res!632593 () Bool)

(assert (=> b!941171 (=> (not res!632593) (not e!528941))))

(declare-datatypes ((SeekEntryResult!8950 0))(
  ( (MissingZero!8950 (index!38171 (_ BitVec 32))) (Found!8950 (index!38172 (_ BitVec 32))) (Intermediate!8950 (undefined!9762 Bool) (index!38173 (_ BitVec 32)) (x!80609 (_ BitVec 32))) (Undefined!8950) (MissingVacant!8950 (index!38174 (_ BitVec 32))) )
))
(declare-fun lt!425021 () SeekEntryResult!8950)

(get-info :version)

(assert (=> b!941171 (= res!632593 ((_ is Found!8950) lt!425021))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56695 (_ BitVec 32)) SeekEntryResult!8950)

(assert (=> b!941171 (= lt!425021 (seekEntry!0 key!756 (_keys!10436 thiss!1141) (mask!27138 thiss!1141)))))

(declare-fun mapIsEmpty!32311 () Bool)

(declare-fun mapRes!32311 () Bool)

(assert (=> mapIsEmpty!32311 mapRes!32311))

(declare-fun b!941172 () Bool)

(declare-fun res!632591 () Bool)

(assert (=> b!941172 (=> res!632591 e!528944)))

(assert (=> b!941172 (= res!632591 (or (not (= (size!27739 (_values!5581 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27138 thiss!1141)))) (not (= (size!27740 (_keys!10436 thiss!1141)) (size!27739 (_values!5581 thiss!1141)))) (bvslt (mask!27138 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941173 () Bool)

(declare-fun res!632594 () Bool)

(assert (=> b!941173 (=> res!632594 e!528944)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56695 (_ BitVec 32)) Bool)

(assert (=> b!941173 (= res!632594 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10436 thiss!1141) (mask!27138 thiss!1141))))))

(declare-fun b!941174 () Bool)

(assert (=> b!941174 (= e!528941 (not e!528944))))

(declare-fun res!632592 () Bool)

(assert (=> b!941174 (=> res!632592 e!528944)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941174 (= res!632592 (not (validMask!0 (mask!27138 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941174 (arrayContainsKey!0 (_keys!10436 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31740 0))(
  ( (Unit!31741) )
))
(declare-fun lt!425020 () Unit!31740)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56695 (_ BitVec 64) (_ BitVec 32)) Unit!31740)

(assert (=> b!941174 (= lt!425020 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10436 thiss!1141) key!756 (index!38172 lt!425021)))))

(declare-fun b!941175 () Bool)

(declare-fun res!632590 () Bool)

(assert (=> b!941175 (=> (not res!632590) (not e!528940))))

(assert (=> b!941175 (= res!632590 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!528942 () Bool)

(declare-fun e!528943 () Bool)

(declare-fun array_inv!21296 (array!56695) Bool)

(declare-fun array_inv!21297 (array!56693) Bool)

(assert (=> b!941176 (= e!528942 (and tp!61993 tp_is_empty!20347 (array_inv!21296 (_keys!10436 thiss!1141)) (array_inv!21297 (_values!5581 thiss!1141)) e!528943))))

(declare-fun mapNonEmpty!32311 () Bool)

(declare-fun tp!61992 () Bool)

(assert (=> mapNonEmpty!32311 (= mapRes!32311 (and tp!61992 e!528946))))

(declare-fun mapValue!32311 () ValueCell!9692)

(declare-fun mapRest!32311 () (Array (_ BitVec 32) ValueCell!9692))

(declare-fun mapKey!32311 () (_ BitVec 32))

(assert (=> mapNonEmpty!32311 (= (arr!27277 (_values!5581 thiss!1141)) (store mapRest!32311 mapKey!32311 mapValue!32311))))

(declare-fun res!632595 () Bool)

(assert (=> start!80152 (=> (not res!632595) (not e!528940))))

(declare-fun valid!1748 (LongMapFixedSize!4534) Bool)

(assert (=> start!80152 (= res!632595 (valid!1748 thiss!1141))))

(assert (=> start!80152 e!528940))

(assert (=> start!80152 e!528942))

(assert (=> start!80152 true))

(declare-fun b!941177 () Bool)

(declare-fun e!528945 () Bool)

(assert (=> b!941177 (= e!528943 (and e!528945 mapRes!32311))))

(declare-fun condMapEmpty!32311 () Bool)

(declare-fun mapDefault!32311 () ValueCell!9692)

(assert (=> b!941177 (= condMapEmpty!32311 (= (arr!27277 (_values!5581 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9692)) mapDefault!32311)))))

(declare-fun b!941178 () Bool)

(assert (=> b!941178 (= e!528945 tp_is_empty!20347)))

(assert (= (and start!80152 res!632595) b!941175))

(assert (= (and b!941175 res!632590) b!941171))

(assert (= (and b!941171 res!632593) b!941174))

(assert (= (and b!941174 (not res!632592)) b!941172))

(assert (= (and b!941172 (not res!632591)) b!941173))

(assert (= (and b!941173 (not res!632594)) b!941170))

(assert (= (and b!941177 condMapEmpty!32311) mapIsEmpty!32311))

(assert (= (and b!941177 (not condMapEmpty!32311)) mapNonEmpty!32311))

(assert (= (and mapNonEmpty!32311 ((_ is ValueCellFull!9692) mapValue!32311)) b!941169))

(assert (= (and b!941177 ((_ is ValueCellFull!9692) mapDefault!32311)) b!941178))

(assert (= b!941176 b!941177))

(assert (= start!80152 b!941176))

(declare-fun m!877067 () Bool)

(assert (=> b!941173 m!877067))

(declare-fun m!877069 () Bool)

(assert (=> b!941176 m!877069))

(declare-fun m!877071 () Bool)

(assert (=> b!941176 m!877071))

(declare-fun m!877073 () Bool)

(assert (=> start!80152 m!877073))

(declare-fun m!877075 () Bool)

(assert (=> b!941171 m!877075))

(declare-fun m!877077 () Bool)

(assert (=> b!941170 m!877077))

(declare-fun m!877079 () Bool)

(assert (=> mapNonEmpty!32311 m!877079))

(declare-fun m!877081 () Bool)

(assert (=> b!941174 m!877081))

(declare-fun m!877083 () Bool)

(assert (=> b!941174 m!877083))

(declare-fun m!877085 () Bool)

(assert (=> b!941174 m!877085))

(check-sat (not b!941173) b_and!29261 (not b!941174) (not b!941171) (not b!941170) tp_is_empty!20347 (not b_next!17839) (not mapNonEmpty!32311) (not start!80152) (not b!941176))
(check-sat b_and!29261 (not b_next!17839))
