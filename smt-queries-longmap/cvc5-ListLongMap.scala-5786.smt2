; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74658 () Bool)

(assert start!74658)

(declare-fun b_free!15307 () Bool)

(declare-fun b_next!15307 () Bool)

(assert (=> start!74658 (= b_free!15307 (not b_next!15307))))

(declare-fun tp!53609 () Bool)

(declare-fun b_and!25233 () Bool)

(assert (=> start!74658 (= tp!53609 b_and!25233)))

(declare-fun b!879800 () Bool)

(declare-fun e!489627 () Bool)

(declare-fun tp_is_empty!17551 () Bool)

(assert (=> b!879800 (= e!489627 tp_is_empty!17551)))

(declare-fun b!879801 () Bool)

(declare-fun res!597710 () Bool)

(declare-fun e!489621 () Bool)

(assert (=> b!879801 (=> (not res!597710) (not e!489621))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51232 0))(
  ( (array!51233 (arr!24640 (Array (_ BitVec 32) (_ BitVec 64))) (size!25080 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51232)

(assert (=> b!879801 (= res!597710 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25080 _keys!868))))))

(declare-fun b!879802 () Bool)

(declare-fun e!489622 () Bool)

(declare-fun e!489624 () Bool)

(declare-fun mapRes!27948 () Bool)

(assert (=> b!879802 (= e!489622 (and e!489624 mapRes!27948))))

(declare-fun condMapEmpty!27948 () Bool)

(declare-datatypes ((V!28449 0))(
  ( (V!28450 (val!8823 Int)) )
))
(declare-datatypes ((ValueCell!8336 0))(
  ( (ValueCellFull!8336 (v!11271 V!28449)) (EmptyCell!8336) )
))
(declare-datatypes ((array!51234 0))(
  ( (array!51235 (arr!24641 (Array (_ BitVec 32) ValueCell!8336)) (size!25081 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51234)

(declare-fun mapDefault!27948 () ValueCell!8336)

