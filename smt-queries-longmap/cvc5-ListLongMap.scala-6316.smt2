; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81098 () Bool)

(assert start!81098)

(declare-fun b!949365 () Bool)

(declare-fun b_free!18217 () Bool)

(declare-fun b_next!18217 () Bool)

(assert (=> b!949365 (= b_free!18217 (not b_next!18217))))

(declare-fun tp!63237 () Bool)

(declare-fun b_and!29663 () Bool)

(assert (=> b!949365 (= tp!63237 b_and!29663)))

(declare-fun b!949358 () Bool)

(declare-fun e!534462 () Bool)

(declare-datatypes ((V!32599 0))(
  ( (V!32600 (val!10413 Int)) )
))
(declare-datatypes ((ValueCell!9881 0))(
  ( (ValueCellFull!9881 (v!12953 V!32599)) (EmptyCell!9881) )
))
(declare-datatypes ((array!57462 0))(
  ( (array!57463 (arr!27634 (Array (_ BitVec 32) ValueCell!9881)) (size!28110 (_ BitVec 32))) )
))
(declare-datatypes ((array!57464 0))(
  ( (array!57465 (arr!27635 (Array (_ BitVec 32) (_ BitVec 64))) (size!28111 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4912 0))(
  ( (LongMapFixedSize!4913 (defaultEntry!5763 Int) (mask!27543 (_ BitVec 32)) (extraKeys!5495 (_ BitVec 32)) (zeroValue!5599 V!32599) (minValue!5599 V!32599) (_size!2511 (_ BitVec 32)) (_keys!10691 array!57464) (_values!5786 array!57462) (_vacant!2511 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4912)

(assert (=> b!949358 (= e!534462 (and (= (size!28110 (_values!5786 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27543 thiss!1141))) (= (size!28111 (_keys!10691 thiss!1141)) (size!28110 (_values!5786 thiss!1141))) (bvsge (mask!27543 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5495 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5495 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949359 () Bool)

(declare-fun res!636697 () Bool)

(assert (=> b!949359 (=> (not res!636697) (not e!534462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949359 (= res!636697 (validMask!0 (mask!27543 thiss!1141)))))

(declare-fun b!949360 () Bool)

(declare-fun e!534464 () Bool)

(declare-fun tp_is_empty!20725 () Bool)

(assert (=> b!949360 (= e!534464 tp_is_empty!20725)))

(declare-fun b!949361 () Bool)

(declare-fun e!534465 () Bool)

(declare-fun mapRes!32989 () Bool)

(assert (=> b!949361 (= e!534465 (and e!534464 mapRes!32989))))

(declare-fun condMapEmpty!32989 () Bool)

(declare-fun mapDefault!32989 () ValueCell!9881)

