; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80214 () Bool)

(assert start!80214)

(declare-fun b!942297 () Bool)

(declare-fun b_free!17941 () Bool)

(declare-fun b_next!17941 () Bool)

(assert (=> b!942297 (= b_free!17941 (not b_next!17941))))

(declare-fun tp!62322 () Bool)

(declare-fun b_and!29353 () Bool)

(assert (=> b!942297 (= tp!62322 b_and!29353)))

(declare-fun b!942292 () Bool)

(declare-fun e!529805 () Bool)

(declare-fun tp_is_empty!20449 () Bool)

(assert (=> b!942292 (= e!529805 tp_is_empty!20449)))

(declare-fun res!633229 () Bool)

(declare-fun e!529802 () Bool)

(assert (=> start!80214 (=> (not res!633229) (not e!529802))))

(declare-datatypes ((V!32231 0))(
  ( (V!32232 (val!10275 Int)) )
))
(declare-datatypes ((ValueCell!9743 0))(
  ( (ValueCellFull!9743 (v!12806 V!32231)) (EmptyCell!9743) )
))
(declare-datatypes ((array!56860 0))(
  ( (array!56861 (arr!27358 (Array (_ BitVec 32) ValueCell!9743)) (size!27823 (_ BitVec 32))) )
))
(declare-datatypes ((array!56862 0))(
  ( (array!56863 (arr!27359 (Array (_ BitVec 32) (_ BitVec 64))) (size!27824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4636 0))(
  ( (LongMapFixedSize!4637 (defaultEntry!5609 Int) (mask!27211 (_ BitVec 32)) (extraKeys!5341 (_ BitVec 32)) (zeroValue!5445 V!32231) (minValue!5445 V!32231) (_size!2373 (_ BitVec 32)) (_keys!10479 array!56862) (_values!5632 array!56860) (_vacant!2373 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4636)

(declare-fun valid!1774 (LongMapFixedSize!4636) Bool)

(assert (=> start!80214 (= res!633229 (valid!1774 thiss!1141))))

(assert (=> start!80214 e!529802))

(declare-fun e!529804 () Bool)

(assert (=> start!80214 e!529804))

(assert (=> start!80214 true))

(declare-fun b!942293 () Bool)

(declare-fun res!633230 () Bool)

(assert (=> b!942293 (=> (not res!633230) (not e!529802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942293 (= res!633230 (validMask!0 (mask!27211 thiss!1141)))))

(declare-fun b!942294 () Bool)

(declare-fun res!633232 () Bool)

(assert (=> b!942294 (=> (not res!633232) (not e!529802))))

(assert (=> b!942294 (= res!633232 (and (= (size!27823 (_values!5632 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27211 thiss!1141))) (= (size!27824 (_keys!10479 thiss!1141)) (size!27823 (_values!5632 thiss!1141))) (bvsge (mask!27211 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5341 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5341 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32489 () Bool)

(declare-fun mapRes!32489 () Bool)

(declare-fun tp!62323 () Bool)

(declare-fun e!529801 () Bool)

(assert (=> mapNonEmpty!32489 (= mapRes!32489 (and tp!62323 e!529801))))

(declare-fun mapKey!32489 () (_ BitVec 32))

(declare-fun mapValue!32489 () ValueCell!9743)

(declare-fun mapRest!32489 () (Array (_ BitVec 32) ValueCell!9743))

(assert (=> mapNonEmpty!32489 (= (arr!27358 (_values!5632 thiss!1141)) (store mapRest!32489 mapKey!32489 mapValue!32489))))

(declare-fun b!942295 () Bool)

(declare-datatypes ((List!19211 0))(
  ( (Nil!19208) (Cons!19207 (h!20357 (_ BitVec 64)) (t!27526 List!19211)) )
))
(declare-fun arrayNoDuplicates!0 (array!56862 (_ BitVec 32) List!19211) Bool)

(assert (=> b!942295 (= e!529802 (not (arrayNoDuplicates!0 (_keys!10479 thiss!1141) #b00000000000000000000000000000000 Nil!19208)))))

(declare-fun b!942296 () Bool)

(declare-fun res!633231 () Bool)

(assert (=> b!942296 (=> (not res!633231) (not e!529802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56862 (_ BitVec 32)) Bool)

(assert (=> b!942296 (= res!633231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10479 thiss!1141) (mask!27211 thiss!1141)))))

(declare-fun e!529803 () Bool)

(declare-fun array_inv!21258 (array!56862) Bool)

(declare-fun array_inv!21259 (array!56860) Bool)

(assert (=> b!942297 (= e!529804 (and tp!62322 tp_is_empty!20449 (array_inv!21258 (_keys!10479 thiss!1141)) (array_inv!21259 (_values!5632 thiss!1141)) e!529803))))

(declare-fun b!942298 () Bool)

(declare-fun res!633233 () Bool)

(assert (=> b!942298 (=> (not res!633233) (not e!529802))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942298 (= res!633233 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32489 () Bool)

(assert (=> mapIsEmpty!32489 mapRes!32489))

(declare-fun b!942299 () Bool)

(assert (=> b!942299 (= e!529801 tp_is_empty!20449)))

(declare-fun b!942300 () Bool)

(assert (=> b!942300 (= e!529803 (and e!529805 mapRes!32489))))

(declare-fun condMapEmpty!32489 () Bool)

(declare-fun mapDefault!32489 () ValueCell!9743)

