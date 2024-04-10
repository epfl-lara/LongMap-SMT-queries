; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81578 () Bool)

(assert start!81578)

(declare-fun b!952992 () Bool)

(declare-fun b_free!18305 () Bool)

(declare-fun b_next!18305 () Bool)

(assert (=> b!952992 (= b_free!18305 (not b_next!18305))))

(declare-fun tp!63542 () Bool)

(declare-fun b_and!29789 () Bool)

(assert (=> b!952992 (= tp!63542 b_and!29789)))

(declare-fun b!952990 () Bool)

(declare-fun res!638325 () Bool)

(declare-fun e!536736 () Bool)

(assert (=> b!952990 (=> (not res!638325) (not e!536736))))

(declare-datatypes ((V!32715 0))(
  ( (V!32716 (val!10457 Int)) )
))
(declare-datatypes ((ValueCell!9925 0))(
  ( (ValueCellFull!9925 (v!13010 V!32715)) (EmptyCell!9925) )
))
(declare-datatypes ((array!57664 0))(
  ( (array!57665 (arr!27722 (Array (_ BitVec 32) ValueCell!9925)) (size!28201 (_ BitVec 32))) )
))
(declare-datatypes ((array!57666 0))(
  ( (array!57667 (arr!27723 (Array (_ BitVec 32) (_ BitVec 64))) (size!28202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5000 0))(
  ( (LongMapFixedSize!5001 (defaultEntry!5835 Int) (mask!27696 (_ BitVec 32)) (extraKeys!5567 (_ BitVec 32)) (zeroValue!5671 V!32715) (minValue!5671 V!32715) (_size!2555 (_ BitVec 32)) (_keys!10794 array!57666) (_values!5858 array!57664) (_vacant!2555 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5000)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13594 0))(
  ( (tuple2!13595 (_1!6808 (_ BitVec 64)) (_2!6808 V!32715)) )
))
(declare-datatypes ((List!19372 0))(
  ( (Nil!19369) (Cons!19368 (h!20530 tuple2!13594) (t!27731 List!19372)) )
))
(declare-datatypes ((ListLongMap!12291 0))(
  ( (ListLongMap!12292 (toList!6161 List!19372)) )
))
(declare-fun contains!5256 (ListLongMap!12291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3394 (array!57666 array!57664 (_ BitVec 32) (_ BitVec 32) V!32715 V!32715 (_ BitVec 32) Int) ListLongMap!12291)

(assert (=> b!952990 (= res!638325 (contains!5256 (getCurrentListMap!3394 (_keys!10794 thiss!1141) (_values!5858 thiss!1141) (mask!27696 thiss!1141) (extraKeys!5567 thiss!1141) (zeroValue!5671 thiss!1141) (minValue!5671 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5835 thiss!1141)) key!756))))

(declare-fun b!952991 () Bool)

(declare-fun e!536738 () Bool)

(declare-fun e!536737 () Bool)

(declare-fun mapRes!33163 () Bool)

(assert (=> b!952991 (= e!536738 (and e!536737 mapRes!33163))))

(declare-fun condMapEmpty!33163 () Bool)

(declare-fun mapDefault!33163 () ValueCell!9925)

