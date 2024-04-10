; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74858 () Bool)

(assert start!74858)

(declare-fun b_free!15407 () Bool)

(declare-fun b_next!15407 () Bool)

(assert (=> start!74858 (= b_free!15407 (not b_next!15407))))

(declare-fun tp!53921 () Bool)

(declare-fun b_and!25497 () Bool)

(assert (=> start!74858 (= tp!53921 b_and!25497)))

(declare-fun b!882572 () Bool)

(declare-fun e!491194 () Bool)

(declare-fun e!491196 () Bool)

(declare-fun mapRes!28110 () Bool)

(assert (=> b!882572 (= e!491194 (and e!491196 mapRes!28110))))

(declare-fun condMapEmpty!28110 () Bool)

(declare-datatypes ((V!28581 0))(
  ( (V!28582 (val!8873 Int)) )
))
(declare-datatypes ((ValueCell!8386 0))(
  ( (ValueCellFull!8386 (v!11337 V!28581)) (EmptyCell!8386) )
))
(declare-datatypes ((array!51430 0))(
  ( (array!51431 (arr!24735 (Array (_ BitVec 32) ValueCell!8386)) (size!25175 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51430)

(declare-fun mapDefault!28110 () ValueCell!8386)

