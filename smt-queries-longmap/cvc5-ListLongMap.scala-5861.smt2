; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75696 () Bool)

(assert start!75696)

(declare-fun b!890013 () Bool)

(declare-fun b_free!15667 () Bool)

(declare-fun b_next!15667 () Bool)

(assert (=> b!890013 (= b_free!15667 (not b_next!15667))))

(declare-fun tp!54969 () Bool)

(declare-fun b_and!25907 () Bool)

(assert (=> b!890013 (= tp!54969 b_and!25907)))

(declare-fun b!890007 () Bool)

(declare-fun res!603097 () Bool)

(declare-fun e!496235 () Bool)

(assert (=> b!890007 (=> (not res!603097) (not e!496235))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890007 (= res!603097 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890008 () Bool)

(declare-fun e!496232 () Bool)

(declare-fun e!496231 () Bool)

(declare-fun mapRes!28547 () Bool)

(assert (=> b!890008 (= e!496232 (and e!496231 mapRes!28547))))

(declare-fun condMapEmpty!28547 () Bool)

(declare-datatypes ((array!51970 0))(
  ( (array!51971 (arr!24991 (Array (_ BitVec 32) (_ BitVec 64))) (size!25435 (_ BitVec 32))) )
))
(declare-datatypes ((V!28959 0))(
  ( (V!28960 (val!9048 Int)) )
))
(declare-datatypes ((ValueCell!8516 0))(
  ( (ValueCellFull!8516 (v!11526 V!28959)) (EmptyCell!8516) )
))
(declare-datatypes ((array!51972 0))(
  ( (array!51973 (arr!24992 (Array (_ BitVec 32) ValueCell!8516)) (size!25436 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4048 0))(
  ( (LongMapFixedSize!4049 (defaultEntry!5221 Int) (mask!25684 (_ BitVec 32)) (extraKeys!4915 (_ BitVec 32)) (zeroValue!5019 V!28959) (minValue!5019 V!28959) (_size!2079 (_ BitVec 32)) (_keys!9904 array!51970) (_values!5206 array!51972) (_vacant!2079 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4048)

(declare-fun mapDefault!28547 () ValueCell!8516)

