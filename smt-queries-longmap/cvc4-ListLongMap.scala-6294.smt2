; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80446 () Bool)

(assert start!80446)

(declare-fun b!945069 () Bool)

(declare-fun b_free!18089 () Bool)

(declare-fun b_next!18089 () Bool)

(assert (=> b!945069 (= b_free!18089 (not b_next!18089))))

(declare-fun tp!62777 () Bool)

(declare-fun b_and!29507 () Bool)

(assert (=> b!945069 (= tp!62777 b_and!29507)))

(declare-fun b!945064 () Bool)

(declare-fun e!531507 () Bool)

(declare-fun tp_is_empty!20597 () Bool)

(assert (=> b!945064 (= e!531507 tp_is_empty!20597)))

(declare-fun res!634824 () Bool)

(declare-fun e!531508 () Bool)

(assert (=> start!80446 (=> (not res!634824) (not e!531508))))

(declare-datatypes ((V!32427 0))(
  ( (V!32428 (val!10349 Int)) )
))
(declare-datatypes ((ValueCell!9817 0))(
  ( (ValueCellFull!9817 (v!12881 V!32427)) (EmptyCell!9817) )
))
(declare-datatypes ((array!57162 0))(
  ( (array!57163 (arr!27506 (Array (_ BitVec 32) ValueCell!9817)) (size!27972 (_ BitVec 32))) )
))
(declare-datatypes ((array!57164 0))(
  ( (array!57165 (arr!27507 (Array (_ BitVec 32) (_ BitVec 64))) (size!27973 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4784 0))(
  ( (LongMapFixedSize!4785 (defaultEntry!5687 Int) (mask!27349 (_ BitVec 32)) (extraKeys!5419 (_ BitVec 32)) (zeroValue!5523 V!32427) (minValue!5523 V!32427) (_size!2447 (_ BitVec 32)) (_keys!10565 array!57164) (_values!5710 array!57162) (_vacant!2447 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4784)

(declare-fun valid!1829 (LongMapFixedSize!4784) Bool)

(assert (=> start!80446 (= res!634824 (valid!1829 thiss!1141))))

(assert (=> start!80446 e!531508))

(declare-fun e!531504 () Bool)

(assert (=> start!80446 e!531504))

(assert (=> start!80446 true))

(declare-fun b!945065 () Bool)

(declare-fun e!531506 () Bool)

(declare-fun e!531503 () Bool)

(declare-fun mapRes!32721 () Bool)

(assert (=> b!945065 (= e!531506 (and e!531503 mapRes!32721))))

(declare-fun condMapEmpty!32721 () Bool)

(declare-fun mapDefault!32721 () ValueCell!9817)

