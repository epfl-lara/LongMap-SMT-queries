; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80000 () Bool)

(assert start!80000)

(declare-fun b!940507 () Bool)

(declare-fun b_free!17855 () Bool)

(declare-fun b_next!17855 () Bool)

(assert (=> b!940507 (= b_free!17855 (not b_next!17855))))

(declare-fun tp!62040 () Bool)

(declare-fun b_and!29267 () Bool)

(assert (=> b!940507 (= tp!62040 b_and!29267)))

(declare-fun b!940506 () Bool)

(declare-fun e!528556 () Bool)

(declare-fun e!528554 () Bool)

(assert (=> b!940506 (= e!528556 e!528554)))

(declare-fun res!632392 () Bool)

(assert (=> b!940506 (=> (not res!632392) (not e!528554))))

(declare-datatypes ((SeekEntryResult!9000 0))(
  ( (MissingZero!9000 (index!38371 (_ BitVec 32))) (Found!9000 (index!38372 (_ BitVec 32))) (Intermediate!9000 (undefined!9812 Bool) (index!38373 (_ BitVec 32)) (x!80661 (_ BitVec 32))) (Undefined!9000) (MissingVacant!9000 (index!38374 (_ BitVec 32))) )
))
(declare-fun lt!424730 () SeekEntryResult!9000)

(assert (=> b!940506 (= res!632392 (is-Found!9000 lt!424730))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32115 0))(
  ( (V!32116 (val!10232 Int)) )
))
(declare-datatypes ((ValueCell!9700 0))(
  ( (ValueCellFull!9700 (v!12763 V!32115)) (EmptyCell!9700) )
))
(declare-datatypes ((array!56674 0))(
  ( (array!56675 (arr!27272 (Array (_ BitVec 32) ValueCell!9700)) (size!27733 (_ BitVec 32))) )
))
(declare-datatypes ((array!56676 0))(
  ( (array!56677 (arr!27273 (Array (_ BitVec 32) (_ BitVec 64))) (size!27734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4550 0))(
  ( (LongMapFixedSize!4551 (defaultEntry!5566 Int) (mask!27107 (_ BitVec 32)) (extraKeys!5298 (_ BitVec 32)) (zeroValue!5402 V!32115) (minValue!5402 V!32115) (_size!2330 (_ BitVec 32)) (_keys!10416 array!56676) (_values!5589 array!56674) (_vacant!2330 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4550)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56676 (_ BitVec 32)) SeekEntryResult!9000)

(assert (=> b!940506 (= lt!424730 (seekEntry!0 key!756 (_keys!10416 thiss!1141) (mask!27107 thiss!1141)))))

(declare-fun e!528551 () Bool)

(declare-fun tp_is_empty!20363 () Bool)

(declare-fun e!528550 () Bool)

(declare-fun array_inv!21198 (array!56676) Bool)

(declare-fun array_inv!21199 (array!56674) Bool)

(assert (=> b!940507 (= e!528550 (and tp!62040 tp_is_empty!20363 (array_inv!21198 (_keys!10416 thiss!1141)) (array_inv!21199 (_values!5589 thiss!1141)) e!528551))))

(declare-fun b!940508 () Bool)

(declare-fun res!632395 () Bool)

(declare-fun e!528553 () Bool)

(assert (=> b!940508 (=> res!632395 e!528553)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56676 (_ BitVec 32)) Bool)

(assert (=> b!940508 (= res!632395 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10416 thiss!1141) (mask!27107 thiss!1141))))))

(declare-fun mapIsEmpty!32335 () Bool)

(declare-fun mapRes!32335 () Bool)

(assert (=> mapIsEmpty!32335 mapRes!32335))

(declare-fun b!940509 () Bool)

(declare-fun e!528552 () Bool)

(assert (=> b!940509 (= e!528551 (and e!528552 mapRes!32335))))

(declare-fun condMapEmpty!32335 () Bool)

(declare-fun mapDefault!32335 () ValueCell!9700)

