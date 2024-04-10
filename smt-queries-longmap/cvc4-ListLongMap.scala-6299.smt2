; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80572 () Bool)

(assert start!80572)

(declare-fun b!945880 () Bool)

(declare-fun b_free!18119 () Bool)

(declare-fun b_next!18119 () Bool)

(assert (=> b!945880 (= b_free!18119 (not b_next!18119))))

(declare-fun tp!62885 () Bool)

(declare-fun b_and!29541 () Bool)

(assert (=> b!945880 (= tp!62885 b_and!29541)))

(declare-fun b!945875 () Bool)

(declare-fun e!532093 () Bool)

(declare-fun tp_is_empty!20627 () Bool)

(assert (=> b!945875 (= e!532093 tp_is_empty!20627)))

(declare-fun b!945876 () Bool)

(declare-fun e!532094 () Bool)

(assert (=> b!945876 (= e!532094 tp_is_empty!20627)))

(declare-fun mapIsEmpty!32784 () Bool)

(declare-fun mapRes!32784 () Bool)

(assert (=> mapIsEmpty!32784 mapRes!32784))

(declare-fun res!635136 () Bool)

(declare-fun e!532097 () Bool)

(assert (=> start!80572 (=> (not res!635136) (not e!532097))))

(declare-datatypes ((V!32467 0))(
  ( (V!32468 (val!10364 Int)) )
))
(declare-datatypes ((ValueCell!9832 0))(
  ( (ValueCellFull!9832 (v!12898 V!32467)) (EmptyCell!9832) )
))
(declare-datatypes ((array!57232 0))(
  ( (array!57233 (arr!27536 (Array (_ BitVec 32) ValueCell!9832)) (size!28005 (_ BitVec 32))) )
))
(declare-datatypes ((array!57234 0))(
  ( (array!57235 (arr!27537 (Array (_ BitVec 32) (_ BitVec 64))) (size!28006 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4814 0))(
  ( (LongMapFixedSize!4815 (defaultEntry!5704 Int) (mask!27386 (_ BitVec 32)) (extraKeys!5436 (_ BitVec 32)) (zeroValue!5540 V!32467) (minValue!5540 V!32467) (_size!2462 (_ BitVec 32)) (_keys!10590 array!57234) (_values!5727 array!57232) (_vacant!2462 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4814)

(declare-fun valid!1839 (LongMapFixedSize!4814) Bool)

(assert (=> start!80572 (= res!635136 (valid!1839 thiss!1141))))

(assert (=> start!80572 e!532097))

(declare-fun e!532098 () Bool)

(assert (=> start!80572 e!532098))

(assert (=> start!80572 true))

(declare-fun b!945877 () Bool)

(declare-fun e!532095 () Bool)

(assert (=> b!945877 (= e!532095 (and e!532094 mapRes!32784))))

(declare-fun condMapEmpty!32784 () Bool)

(declare-fun mapDefault!32784 () ValueCell!9832)

