; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89378 () Bool)

(assert start!89378)

(declare-fun b!1024596 () Bool)

(declare-fun b_free!20377 () Bool)

(declare-fun b_next!20377 () Bool)

(assert (=> b!1024596 (= b_free!20377 (not b_next!20377))))

(declare-fun tp!72177 () Bool)

(declare-fun b_and!32623 () Bool)

(assert (=> b!1024596 (= tp!72177 b_and!32623)))

(declare-fun b!1024594 () Bool)

(declare-fun res!685997 () Bool)

(declare-fun e!577577 () Bool)

(assert (=> b!1024594 (=> (not res!685997) (not e!577577))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024594 (= res!685997 (not (= key!909 (bvneg key!909))))))

(declare-fun res!685999 () Bool)

(assert (=> start!89378 (=> (not res!685999) (not e!577577))))

(declare-datatypes ((V!37003 0))(
  ( (V!37004 (val!12099 Int)) )
))
(declare-datatypes ((ValueCell!11345 0))(
  ( (ValueCellFull!11345 (v!14668 V!37003)) (EmptyCell!11345) )
))
(declare-datatypes ((array!64244 0))(
  ( (array!64245 (arr!30931 (Array (_ BitVec 32) (_ BitVec 64))) (size!31444 (_ BitVec 32))) )
))
(declare-datatypes ((array!64246 0))(
  ( (array!64247 (arr!30932 (Array (_ BitVec 32) ValueCell!11345)) (size!31445 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5284 0))(
  ( (LongMapFixedSize!5285 (defaultEntry!5994 Int) (mask!29648 (_ BitVec 32)) (extraKeys!5726 (_ BitVec 32)) (zeroValue!5830 V!37003) (minValue!5830 V!37003) (_size!2697 (_ BitVec 32)) (_keys!11141 array!64244) (_values!6017 array!64246) (_vacant!2697 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5284)

(declare-fun valid!2011 (LongMapFixedSize!5284) Bool)

(assert (=> start!89378 (= res!685999 (valid!2011 thiss!1427))))

(assert (=> start!89378 e!577577))

(declare-fun e!577576 () Bool)

(assert (=> start!89378 e!577576))

(assert (=> start!89378 true))

(declare-fun b!1024595 () Bool)

(declare-fun e!577575 () Bool)

(declare-fun e!577580 () Bool)

(declare-fun mapRes!37574 () Bool)

(assert (=> b!1024595 (= e!577575 (and e!577580 mapRes!37574))))

(declare-fun condMapEmpty!37574 () Bool)

(declare-fun mapDefault!37574 () ValueCell!11345)

