; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80434 () Bool)

(assert start!80434)

(declare-fun b!944929 () Bool)

(declare-fun b_free!18077 () Bool)

(declare-fun b_next!18077 () Bool)

(assert (=> b!944929 (= b_free!18077 (not b_next!18077))))

(declare-fun tp!62740 () Bool)

(declare-fun b_and!29495 () Bool)

(assert (=> b!944929 (= tp!62740 b_and!29495)))

(declare-fun b!944923 () Bool)

(declare-fun res!634775 () Bool)

(declare-fun e!531388 () Bool)

(assert (=> b!944923 (=> (not res!634775) (not e!531388))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944923 (= res!634775 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944924 () Bool)

(declare-fun e!531389 () Bool)

(declare-fun tp_is_empty!20585 () Bool)

(assert (=> b!944924 (= e!531389 tp_is_empty!20585)))

(declare-fun b!944925 () Bool)

(declare-fun res!634772 () Bool)

(declare-fun e!531390 () Bool)

(assert (=> b!944925 (=> res!634772 e!531390)))

(declare-datatypes ((V!32411 0))(
  ( (V!32412 (val!10343 Int)) )
))
(declare-datatypes ((ValueCell!9811 0))(
  ( (ValueCellFull!9811 (v!12875 V!32411)) (EmptyCell!9811) )
))
(declare-datatypes ((array!57138 0))(
  ( (array!57139 (arr!27494 (Array (_ BitVec 32) ValueCell!9811)) (size!27960 (_ BitVec 32))) )
))
(declare-datatypes ((array!57140 0))(
  ( (array!57141 (arr!27495 (Array (_ BitVec 32) (_ BitVec 64))) (size!27961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4772 0))(
  ( (LongMapFixedSize!4773 (defaultEntry!5681 Int) (mask!27339 (_ BitVec 32)) (extraKeys!5413 (_ BitVec 32)) (zeroValue!5517 V!32411) (minValue!5517 V!32411) (_size!2441 (_ BitVec 32)) (_keys!10559 array!57140) (_values!5704 array!57138) (_vacant!2441 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4772)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57140 (_ BitVec 32)) Bool)

(assert (=> b!944925 (= res!634772 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10559 thiss!1141) (mask!27339 thiss!1141))))))

(declare-fun b!944926 () Bool)

(assert (=> b!944926 (= e!531390 true)))

(declare-datatypes ((SeekEntryResult!9080 0))(
  ( (MissingZero!9080 (index!38691 (_ BitVec 32))) (Found!9080 (index!38692 (_ BitVec 32))) (Intermediate!9080 (undefined!9892 Bool) (index!38693 (_ BitVec 32)) (x!81163 (_ BitVec 32))) (Undefined!9080) (MissingVacant!9080 (index!38694 (_ BitVec 32))) )
))
(declare-fun lt!425793 () SeekEntryResult!9080)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57140 (_ BitVec 32)) SeekEntryResult!9080)

(assert (=> b!944926 (= lt!425793 (seekEntryOrOpen!0 key!756 (_keys!10559 thiss!1141) (mask!27339 thiss!1141)))))

(declare-fun b!944927 () Bool)

(declare-fun e!531387 () Bool)

(declare-fun e!531385 () Bool)

(declare-fun mapRes!32703 () Bool)

(assert (=> b!944927 (= e!531387 (and e!531385 mapRes!32703))))

(declare-fun condMapEmpty!32703 () Bool)

(declare-fun mapDefault!32703 () ValueCell!9811)

