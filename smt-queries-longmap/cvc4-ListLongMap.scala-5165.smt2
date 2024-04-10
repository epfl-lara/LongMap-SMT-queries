; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69968 () Bool)

(assert start!69968)

(declare-fun b_free!12401 () Bool)

(declare-fun b_next!12401 () Bool)

(assert (=> start!69968 (= b_free!12401 (not b_next!12401))))

(declare-fun tp!43915 () Bool)

(declare-fun b_and!21169 () Bool)

(assert (=> start!69968 (= tp!43915 b_and!21169)))

(declare-fun b!813292 () Bool)

(declare-fun res!555637 () Bool)

(declare-fun e!450641 () Bool)

(assert (=> b!813292 (=> (not res!555637) (not e!450641))))

(declare-datatypes ((array!44432 0))(
  ( (array!44433 (arr!21277 (Array (_ BitVec 32) (_ BitVec 64))) (size!21698 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44432)

(declare-datatypes ((List!15134 0))(
  ( (Nil!15131) (Cons!15130 (h!16259 (_ BitVec 64)) (t!21449 List!15134)) )
))
(declare-fun arrayNoDuplicates!0 (array!44432 (_ BitVec 32) List!15134) Bool)

(assert (=> b!813292 (= res!555637 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15131))))

(declare-fun mapIsEmpty!22744 () Bool)

(declare-fun mapRes!22744 () Bool)

(assert (=> mapIsEmpty!22744 mapRes!22744))

(declare-fun b!813293 () Bool)

(declare-fun e!450643 () Bool)

(declare-fun tp_is_empty!14111 () Bool)

(assert (=> b!813293 (= e!450643 tp_is_empty!14111)))

(declare-fun mapNonEmpty!22744 () Bool)

(declare-fun tp!43914 () Bool)

(declare-fun e!450642 () Bool)

(assert (=> mapNonEmpty!22744 (= mapRes!22744 (and tp!43914 e!450642))))

(declare-datatypes ((V!23815 0))(
  ( (V!23816 (val!7103 Int)) )
))
(declare-datatypes ((ValueCell!6640 0))(
  ( (ValueCellFull!6640 (v!9530 V!23815)) (EmptyCell!6640) )
))
(declare-datatypes ((array!44434 0))(
  ( (array!44435 (arr!21278 (Array (_ BitVec 32) ValueCell!6640)) (size!21699 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44434)

(declare-fun mapValue!22744 () ValueCell!6640)

(declare-fun mapRest!22744 () (Array (_ BitVec 32) ValueCell!6640))

(declare-fun mapKey!22744 () (_ BitVec 32))

(assert (=> mapNonEmpty!22744 (= (arr!21278 _values!788) (store mapRest!22744 mapKey!22744 mapValue!22744))))

(declare-fun res!555638 () Bool)

(assert (=> start!69968 (=> (not res!555638) (not e!450641))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69968 (= res!555638 (validMask!0 mask!1312))))

(assert (=> start!69968 e!450641))

(assert (=> start!69968 tp_is_empty!14111))

(declare-fun array_inv!17039 (array!44432) Bool)

(assert (=> start!69968 (array_inv!17039 _keys!976)))

(assert (=> start!69968 true))

(declare-fun e!450644 () Bool)

(declare-fun array_inv!17040 (array!44434) Bool)

(assert (=> start!69968 (and (array_inv!17040 _values!788) e!450644)))

(assert (=> start!69968 tp!43915))

(declare-fun b!813294 () Bool)

(assert (=> b!813294 (= e!450644 (and e!450643 mapRes!22744))))

(declare-fun condMapEmpty!22744 () Bool)

(declare-fun mapDefault!22744 () ValueCell!6640)

