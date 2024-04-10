; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92124 () Bool)

(assert start!92124)

(declare-fun b!1047970 () Bool)

(declare-fun b_free!21175 () Bool)

(declare-fun b_next!21175 () Bool)

(assert (=> b!1047970 (= b_free!21175 (not b_next!21175))))

(declare-fun tp!74791 () Bool)

(declare-fun b_and!33885 () Bool)

(assert (=> b!1047970 (= tp!74791 b_and!33885)))

(declare-fun b!1047965 () Bool)

(declare-fun e!594257 () Bool)

(declare-fun e!594255 () Bool)

(declare-fun mapRes!38992 () Bool)

(assert (=> b!1047965 (= e!594257 (and e!594255 mapRes!38992))))

(declare-fun condMapEmpty!38992 () Bool)

(declare-datatypes ((V!38067 0))(
  ( (V!38068 (val!12498 Int)) )
))
(declare-datatypes ((ValueCell!11744 0))(
  ( (ValueCellFull!11744 (v!15098 V!38067)) (EmptyCell!11744) )
))
(declare-datatypes ((array!65970 0))(
  ( (array!65971 (arr!31729 (Array (_ BitVec 32) (_ BitVec 64))) (size!32265 (_ BitVec 32))) )
))
(declare-datatypes ((array!65972 0))(
  ( (array!65973 (arr!31730 (Array (_ BitVec 32) ValueCell!11744)) (size!32266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6082 0))(
  ( (LongMapFixedSize!6083 (defaultEntry!6445 Int) (mask!30602 (_ BitVec 32)) (extraKeys!6173 (_ BitVec 32)) (zeroValue!6279 V!38067) (minValue!6279 V!38067) (_size!3096 (_ BitVec 32)) (_keys!11724 array!65970) (_values!6468 array!65972) (_vacant!3096 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6082)

(declare-fun mapDefault!38992 () ValueCell!11744)

