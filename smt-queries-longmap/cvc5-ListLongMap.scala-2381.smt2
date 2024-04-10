; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37748 () Bool)

(assert start!37748)

(declare-fun b_free!8851 () Bool)

(declare-fun b_next!8851 () Bool)

(assert (=> start!37748 (= b_free!8851 (not b_next!8851))))

(declare-fun tp!31304 () Bool)

(declare-fun b_and!16093 () Bool)

(assert (=> start!37748 (= tp!31304 b_and!16093)))

(declare-fun b!387299 () Bool)

(declare-fun e!234829 () Bool)

(declare-fun tp_is_empty!9523 () Bool)

(assert (=> b!387299 (= e!234829 tp_is_empty!9523)))

(declare-fun mapIsEmpty!15849 () Bool)

(declare-fun mapRes!15849 () Bool)

(assert (=> mapIsEmpty!15849 mapRes!15849))

(declare-fun b!387300 () Bool)

(declare-fun res!221272 () Bool)

(declare-fun e!234830 () Bool)

(assert (=> b!387300 (=> (not res!221272) (not e!234830))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22939 0))(
  ( (array!22940 (arr!10938 (Array (_ BitVec 32) (_ BitVec 64))) (size!11290 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22939)

(assert (=> b!387300 (= res!221272 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11290 _keys!658))))))

(declare-fun b!387301 () Bool)

(declare-fun e!234826 () Bool)

(assert (=> b!387301 (= e!234830 e!234826)))

(declare-fun res!221276 () Bool)

(assert (=> b!387301 (=> (not res!221276) (not e!234826))))

(declare-fun lt!182005 () array!22939)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22939 (_ BitVec 32)) Bool)

(assert (=> b!387301 (= res!221276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182005 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!387301 (= lt!182005 (array!22940 (store (arr!10938 _keys!658) i!548 k!778) (size!11290 _keys!658)))))

(declare-fun mapNonEmpty!15849 () Bool)

(declare-fun tp!31305 () Bool)

(declare-fun e!234827 () Bool)

(assert (=> mapNonEmpty!15849 (= mapRes!15849 (and tp!31305 e!234827))))

(declare-datatypes ((V!13803 0))(
  ( (V!13804 (val!4806 Int)) )
))
(declare-datatypes ((ValueCell!4418 0))(
  ( (ValueCellFull!4418 (v!7003 V!13803)) (EmptyCell!4418) )
))
(declare-fun mapValue!15849 () ValueCell!4418)

(declare-datatypes ((array!22941 0))(
  ( (array!22942 (arr!10939 (Array (_ BitVec 32) ValueCell!4418)) (size!11291 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22941)

(declare-fun mapRest!15849 () (Array (_ BitVec 32) ValueCell!4418))

(declare-fun mapKey!15849 () (_ BitVec 32))

(assert (=> mapNonEmpty!15849 (= (arr!10939 _values!506) (store mapRest!15849 mapKey!15849 mapValue!15849))))

(declare-fun b!387302 () Bool)

(assert (=> b!387302 (= e!234827 tp_is_empty!9523)))

(declare-fun b!387303 () Bool)

(declare-fun e!234825 () Bool)

(assert (=> b!387303 (= e!234825 (and e!234829 mapRes!15849))))

(declare-fun condMapEmpty!15849 () Bool)

(declare-fun mapDefault!15849 () ValueCell!4418)

