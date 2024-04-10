; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81206 () Bool)

(assert start!81206)

(declare-fun b!950294 () Bool)

(declare-fun b_free!18241 () Bool)

(declare-fun b_next!18241 () Bool)

(assert (=> b!950294 (= b_free!18241 (not b_next!18241))))

(declare-fun tp!63318 () Bool)

(declare-fun b_and!29697 () Bool)

(assert (=> b!950294 (= tp!63318 b_and!29697)))

(declare-fun b!950287 () Bool)

(declare-fun res!637142 () Bool)

(declare-fun e!535016 () Bool)

(assert (=> b!950287 (=> (not res!637142) (not e!535016))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32631 0))(
  ( (V!32632 (val!10425 Int)) )
))
(declare-datatypes ((ValueCell!9893 0))(
  ( (ValueCellFull!9893 (v!12968 V!32631)) (EmptyCell!9893) )
))
(declare-datatypes ((array!57516 0))(
  ( (array!57517 (arr!27658 (Array (_ BitVec 32) ValueCell!9893)) (size!28135 (_ BitVec 32))) )
))
(declare-datatypes ((array!57518 0))(
  ( (array!57519 (arr!27659 (Array (_ BitVec 32) (_ BitVec 64))) (size!28136 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4936 0))(
  ( (LongMapFixedSize!4937 (defaultEntry!5779 Int) (mask!27579 (_ BitVec 32)) (extraKeys!5511 (_ BitVec 32)) (zeroValue!5615 V!32631) (minValue!5615 V!32631) (_size!2523 (_ BitVec 32)) (_keys!10715 array!57518) (_values!5802 array!57516) (_vacant!2523 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4936)

(declare-datatypes ((SeekEntryResult!9140 0))(
  ( (MissingZero!9140 (index!38931 (_ BitVec 32))) (Found!9140 (index!38932 (_ BitVec 32))) (Intermediate!9140 (undefined!9952 Bool) (index!38933 (_ BitVec 32)) (x!81758 (_ BitVec 32))) (Undefined!9140) (MissingVacant!9140 (index!38934 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57518 (_ BitVec 32)) SeekEntryResult!9140)

(assert (=> b!950287 (= res!637142 (not (is-Found!9140 (seekEntry!0 key!756 (_keys!10715 thiss!1141) (mask!27579 thiss!1141)))))))

(declare-fun b!950288 () Bool)

(declare-fun res!637144 () Bool)

(assert (=> b!950288 (=> (not res!637144) (not e!535016))))

(declare-datatypes ((tuple2!13548 0))(
  ( (tuple2!13549 (_1!6785 (_ BitVec 64)) (_2!6785 V!32631)) )
))
(declare-datatypes ((List!19339 0))(
  ( (Nil!19336) (Cons!19335 (h!20495 tuple2!13548) (t!27678 List!19339)) )
))
(declare-datatypes ((ListLongMap!12245 0))(
  ( (ListLongMap!12246 (toList!6138 List!19339)) )
))
(declare-fun contains!5229 (ListLongMap!12245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3371 (array!57518 array!57516 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 32) Int) ListLongMap!12245)

(assert (=> b!950288 (= res!637144 (contains!5229 (getCurrentListMap!3371 (_keys!10715 thiss!1141) (_values!5802 thiss!1141) (mask!27579 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) key!756))))

(declare-fun b!950289 () Bool)

(declare-fun e!535014 () Bool)

(declare-fun e!535012 () Bool)

(declare-fun mapRes!33035 () Bool)

(assert (=> b!950289 (= e!535014 (and e!535012 mapRes!33035))))

(declare-fun condMapEmpty!33035 () Bool)

(declare-fun mapDefault!33035 () ValueCell!9893)

