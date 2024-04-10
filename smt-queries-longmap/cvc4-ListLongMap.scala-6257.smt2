; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80012 () Bool)

(assert start!80012)

(declare-fun b!940688 () Bool)

(declare-fun b_free!17867 () Bool)

(declare-fun b_next!17867 () Bool)

(assert (=> b!940688 (= b_free!17867 (not b_next!17867))))

(declare-fun tp!62075 () Bool)

(declare-fun b_and!29279 () Bool)

(assert (=> b!940688 (= tp!62075 b_and!29279)))

(declare-fun mapIsEmpty!32353 () Bool)

(declare-fun mapRes!32353 () Bool)

(assert (=> mapIsEmpty!32353 mapRes!32353))

(declare-fun b!940686 () Bool)

(declare-fun e!528695 () Bool)

(declare-fun tp_is_empty!20375 () Bool)

(assert (=> b!940686 (= e!528695 tp_is_empty!20375)))

(declare-fun b!940687 () Bool)

(declare-fun e!528700 () Bool)

(declare-fun e!528699 () Bool)

(assert (=> b!940687 (= e!528700 (not e!528699))))

(declare-fun res!632499 () Bool)

(assert (=> b!940687 (=> res!632499 e!528699)))

(declare-datatypes ((V!32131 0))(
  ( (V!32132 (val!10238 Int)) )
))
(declare-datatypes ((ValueCell!9706 0))(
  ( (ValueCellFull!9706 (v!12769 V!32131)) (EmptyCell!9706) )
))
(declare-datatypes ((array!56698 0))(
  ( (array!56699 (arr!27284 (Array (_ BitVec 32) ValueCell!9706)) (size!27745 (_ BitVec 32))) )
))
(declare-datatypes ((array!56700 0))(
  ( (array!56701 (arr!27285 (Array (_ BitVec 32) (_ BitVec 64))) (size!27746 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4562 0))(
  ( (LongMapFixedSize!4563 (defaultEntry!5572 Int) (mask!27117 (_ BitVec 32)) (extraKeys!5304 (_ BitVec 32)) (zeroValue!5408 V!32131) (minValue!5408 V!32131) (_size!2336 (_ BitVec 32)) (_keys!10422 array!56700) (_values!5595 array!56698) (_vacant!2336 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4562)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940687 (= res!632499 (not (validMask!0 (mask!27117 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940687 (arrayContainsKey!0 (_keys!10422 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31776 0))(
  ( (Unit!31777) )
))
(declare-fun lt!424784 () Unit!31776)

(declare-datatypes ((SeekEntryResult!9005 0))(
  ( (MissingZero!9005 (index!38391 (_ BitVec 32))) (Found!9005 (index!38392 (_ BitVec 32))) (Intermediate!9005 (undefined!9817 Bool) (index!38393 (_ BitVec 32)) (x!80682 (_ BitVec 32))) (Undefined!9005) (MissingVacant!9005 (index!38394 (_ BitVec 32))) )
))
(declare-fun lt!424786 () SeekEntryResult!9005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56700 (_ BitVec 64) (_ BitVec 32)) Unit!31776)

(assert (=> b!940687 (= lt!424784 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10422 thiss!1141) key!756 (index!38392 lt!424786)))))

(declare-fun e!528697 () Bool)

(declare-fun e!528698 () Bool)

(declare-fun array_inv!21208 (array!56700) Bool)

(declare-fun array_inv!21209 (array!56698) Bool)

(assert (=> b!940688 (= e!528697 (and tp!62075 tp_is_empty!20375 (array_inv!21208 (_keys!10422 thiss!1141)) (array_inv!21209 (_values!5595 thiss!1141)) e!528698))))

(declare-fun b!940689 () Bool)

(declare-fun res!632498 () Bool)

(declare-fun e!528693 () Bool)

(assert (=> b!940689 (=> (not res!632498) (not e!528693))))

(assert (=> b!940689 (= res!632498 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32353 () Bool)

(declare-fun tp!62076 () Bool)

(assert (=> mapNonEmpty!32353 (= mapRes!32353 (and tp!62076 e!528695))))

(declare-fun mapKey!32353 () (_ BitVec 32))

(declare-fun mapValue!32353 () ValueCell!9706)

(declare-fun mapRest!32353 () (Array (_ BitVec 32) ValueCell!9706))

(assert (=> mapNonEmpty!32353 (= (arr!27284 (_values!5595 thiss!1141)) (store mapRest!32353 mapKey!32353 mapValue!32353))))

(declare-fun b!940690 () Bool)

(assert (=> b!940690 (= e!528699 true)))

(declare-fun lt!424785 () Bool)

(declare-datatypes ((List!19194 0))(
  ( (Nil!19191) (Cons!19190 (h!20336 (_ BitVec 64)) (t!27509 List!19194)) )
))
(declare-fun arrayNoDuplicates!0 (array!56700 (_ BitVec 32) List!19194) Bool)

(assert (=> b!940690 (= lt!424785 (arrayNoDuplicates!0 (_keys!10422 thiss!1141) #b00000000000000000000000000000000 Nil!19191))))

(declare-fun res!632500 () Bool)

(assert (=> start!80012 (=> (not res!632500) (not e!528693))))

(declare-fun valid!1750 (LongMapFixedSize!4562) Bool)

(assert (=> start!80012 (= res!632500 (valid!1750 thiss!1141))))

(assert (=> start!80012 e!528693))

(assert (=> start!80012 e!528697))

(assert (=> start!80012 true))

(declare-fun b!940691 () Bool)

(declare-fun res!632501 () Bool)

(assert (=> b!940691 (=> res!632501 e!528699)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56700 (_ BitVec 32)) Bool)

(assert (=> b!940691 (= res!632501 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10422 thiss!1141) (mask!27117 thiss!1141))))))

(declare-fun b!940692 () Bool)

(declare-fun e!528696 () Bool)

(assert (=> b!940692 (= e!528696 tp_is_empty!20375)))

(declare-fun b!940693 () Bool)

(assert (=> b!940693 (= e!528698 (and e!528696 mapRes!32353))))

(declare-fun condMapEmpty!32353 () Bool)

(declare-fun mapDefault!32353 () ValueCell!9706)

