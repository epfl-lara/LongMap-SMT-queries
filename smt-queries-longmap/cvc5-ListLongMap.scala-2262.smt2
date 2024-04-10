; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37034 () Bool)

(assert start!37034)

(declare-fun b_free!8161 () Bool)

(declare-fun b_next!8161 () Bool)

(assert (=> start!37034 (= b_free!8161 (not b_next!8161))))

(declare-fun tp!29199 () Bool)

(declare-fun b_and!15403 () Bool)

(assert (=> start!37034 (= tp!29199 b_and!15403)))

(declare-fun b!372179 () Bool)

(declare-fun res!209365 () Bool)

(declare-fun e!227059 () Bool)

(assert (=> b!372179 (=> (not res!209365) (not e!227059))))

(declare-datatypes ((array!21559 0))(
  ( (array!21560 (arr!10248 (Array (_ BitVec 32) (_ BitVec 64))) (size!10600 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21559)

(declare-datatypes ((List!5747 0))(
  ( (Nil!5744) (Cons!5743 (h!6599 (_ BitVec 64)) (t!10897 List!5747)) )
))
(declare-fun arrayNoDuplicates!0 (array!21559 (_ BitVec 32) List!5747) Bool)

(assert (=> b!372179 (= res!209365 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5744))))

(declare-fun mapNonEmpty!14778 () Bool)

(declare-fun mapRes!14778 () Bool)

(declare-fun tp!29198 () Bool)

(declare-fun e!227060 () Bool)

(assert (=> mapNonEmpty!14778 (= mapRes!14778 (and tp!29198 e!227060))))

(declare-fun mapKey!14778 () (_ BitVec 32))

(declare-datatypes ((V!12851 0))(
  ( (V!12852 (val!4449 Int)) )
))
(declare-datatypes ((ValueCell!4061 0))(
  ( (ValueCellFull!4061 (v!6646 V!12851)) (EmptyCell!4061) )
))
(declare-datatypes ((array!21561 0))(
  ( (array!21562 (arr!10249 (Array (_ BitVec 32) ValueCell!4061)) (size!10601 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21561)

(declare-fun mapValue!14778 () ValueCell!4061)

(declare-fun mapRest!14778 () (Array (_ BitVec 32) ValueCell!4061))

(assert (=> mapNonEmpty!14778 (= (arr!10249 _values!506) (store mapRest!14778 mapKey!14778 mapValue!14778))))

(declare-fun b!372180 () Bool)

(declare-fun e!227062 () Bool)

(declare-fun e!227063 () Bool)

(assert (=> b!372180 (= e!227062 (and e!227063 mapRes!14778))))

(declare-fun condMapEmpty!14778 () Bool)

(declare-fun mapDefault!14778 () ValueCell!4061)

