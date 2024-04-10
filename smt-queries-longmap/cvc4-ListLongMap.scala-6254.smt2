; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79994 () Bool)

(assert start!79994)

(declare-fun b!940425 () Bool)

(declare-fun b_free!17849 () Bool)

(declare-fun b_next!17849 () Bool)

(assert (=> b!940425 (= b_free!17849 (not b_next!17849))))

(declare-fun tp!62022 () Bool)

(declare-fun b_and!29261 () Bool)

(assert (=> b!940425 (= tp!62022 b_and!29261)))

(declare-fun b!940416 () Bool)

(declare-fun e!528478 () Bool)

(assert (=> b!940416 (= e!528478 true)))

(declare-fun lt!424703 () Bool)

(declare-datatypes ((V!32107 0))(
  ( (V!32108 (val!10229 Int)) )
))
(declare-datatypes ((ValueCell!9697 0))(
  ( (ValueCellFull!9697 (v!12760 V!32107)) (EmptyCell!9697) )
))
(declare-datatypes ((array!56662 0))(
  ( (array!56663 (arr!27266 (Array (_ BitVec 32) ValueCell!9697)) (size!27727 (_ BitVec 32))) )
))
(declare-datatypes ((array!56664 0))(
  ( (array!56665 (arr!27267 (Array (_ BitVec 32) (_ BitVec 64))) (size!27728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4544 0))(
  ( (LongMapFixedSize!4545 (defaultEntry!5563 Int) (mask!27102 (_ BitVec 32)) (extraKeys!5295 (_ BitVec 32)) (zeroValue!5399 V!32107) (minValue!5399 V!32107) (_size!2327 (_ BitVec 32)) (_keys!10413 array!56664) (_values!5586 array!56662) (_vacant!2327 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4544)

(declare-datatypes ((List!19187 0))(
  ( (Nil!19184) (Cons!19183 (h!20329 (_ BitVec 64)) (t!27502 List!19187)) )
))
(declare-fun arrayNoDuplicates!0 (array!56664 (_ BitVec 32) List!19187) Bool)

(assert (=> b!940416 (= lt!424703 (arrayNoDuplicates!0 (_keys!10413 thiss!1141) #b00000000000000000000000000000000 Nil!19184))))

(declare-fun b!940417 () Bool)

(declare-fun res!632336 () Bool)

(declare-fun e!528480 () Bool)

(assert (=> b!940417 (=> (not res!632336) (not e!528480))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940417 (= res!632336 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940418 () Bool)

(declare-fun res!632339 () Bool)

(assert (=> b!940418 (=> res!632339 e!528478)))

(assert (=> b!940418 (= res!632339 (or (not (= (size!27727 (_values!5586 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27102 thiss!1141)))) (not (= (size!27728 (_keys!10413 thiss!1141)) (size!27727 (_values!5586 thiss!1141)))) (bvslt (mask!27102 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5295 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5295 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32326 () Bool)

(declare-fun mapRes!32326 () Bool)

(assert (=> mapIsEmpty!32326 mapRes!32326))

(declare-fun mapNonEmpty!32326 () Bool)

(declare-fun tp!62021 () Bool)

(declare-fun e!528481 () Bool)

(assert (=> mapNonEmpty!32326 (= mapRes!32326 (and tp!62021 e!528481))))

(declare-fun mapRest!32326 () (Array (_ BitVec 32) ValueCell!9697))

(declare-fun mapKey!32326 () (_ BitVec 32))

(declare-fun mapValue!32326 () ValueCell!9697)

(assert (=> mapNonEmpty!32326 (= (arr!27266 (_values!5586 thiss!1141)) (store mapRest!32326 mapKey!32326 mapValue!32326))))

(declare-fun b!940419 () Bool)

(declare-fun e!528482 () Bool)

(declare-fun tp_is_empty!20357 () Bool)

(assert (=> b!940419 (= e!528482 tp_is_empty!20357)))

(declare-fun res!632340 () Bool)

(assert (=> start!79994 (=> (not res!632340) (not e!528480))))

(declare-fun valid!1743 (LongMapFixedSize!4544) Bool)

(assert (=> start!79994 (= res!632340 (valid!1743 thiss!1141))))

(assert (=> start!79994 e!528480))

(declare-fun e!528483 () Bool)

(assert (=> start!79994 e!528483))

(assert (=> start!79994 true))

(declare-fun b!940420 () Bool)

(declare-fun res!632341 () Bool)

(assert (=> b!940420 (=> res!632341 e!528478)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56664 (_ BitVec 32)) Bool)

(assert (=> b!940420 (= res!632341 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10413 thiss!1141) (mask!27102 thiss!1141))))))

(declare-fun b!940421 () Bool)

(declare-fun e!528484 () Bool)

(assert (=> b!940421 (= e!528484 (and e!528482 mapRes!32326))))

(declare-fun condMapEmpty!32326 () Bool)

(declare-fun mapDefault!32326 () ValueCell!9697)

