; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83506 () Bool)

(assert start!83506)

(declare-fun b_free!19493 () Bool)

(declare-fun b_next!19493 () Bool)

(assert (=> start!83506 (= b_free!19493 (not b_next!19493))))

(declare-fun tp!67767 () Bool)

(declare-fun b_and!31095 () Bool)

(assert (=> start!83506 (= tp!67767 b_and!31095)))

(declare-fun b!975547 () Bool)

(declare-fun e!549803 () Bool)

(declare-fun tp_is_empty!22397 () Bool)

(assert (=> b!975547 (= e!549803 tp_is_empty!22397)))

(declare-fun res!653059 () Bool)

(declare-fun e!549805 () Bool)

(assert (=> start!83506 (=> (not res!653059) (not e!549805))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83506 (= res!653059 (validMask!0 mask!2147))))

(assert (=> start!83506 e!549805))

(assert (=> start!83506 true))

(declare-datatypes ((V!34845 0))(
  ( (V!34846 (val!11249 Int)) )
))
(declare-datatypes ((ValueCell!10717 0))(
  ( (ValueCellFull!10717 (v!13808 V!34845)) (EmptyCell!10717) )
))
(declare-datatypes ((array!60825 0))(
  ( (array!60826 (arr!29276 (Array (_ BitVec 32) ValueCell!10717)) (size!29755 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60825)

(declare-fun e!549804 () Bool)

(declare-fun array_inv!22641 (array!60825) Bool)

(assert (=> start!83506 (and (array_inv!22641 _values!1425) e!549804)))

(assert (=> start!83506 tp_is_empty!22397))

(assert (=> start!83506 tp!67767))

(declare-datatypes ((array!60827 0))(
  ( (array!60828 (arr!29277 (Array (_ BitVec 32) (_ BitVec 64))) (size!29756 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60827)

(declare-fun array_inv!22642 (array!60827) Bool)

(assert (=> start!83506 (array_inv!22642 _keys!1717)))

(declare-fun b!975548 () Bool)

(declare-fun mapRes!35605 () Bool)

(assert (=> b!975548 (= e!549804 (and e!549803 mapRes!35605))))

(declare-fun condMapEmpty!35605 () Bool)

(declare-fun mapDefault!35605 () ValueCell!10717)

