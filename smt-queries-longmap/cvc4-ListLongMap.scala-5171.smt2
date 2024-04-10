; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70016 () Bool)

(assert start!70016)

(declare-fun b_free!12437 () Bool)

(declare-fun b_next!12437 () Bool)

(assert (=> start!70016 (= b_free!12437 (not b_next!12437))))

(declare-fun tp!44025 () Bool)

(declare-fun b_and!21209 () Bool)

(assert (=> start!70016 (= tp!44025 b_and!21209)))

(declare-fun b!813743 () Bool)

(declare-fun e!450963 () Bool)

(declare-fun tp_is_empty!14147 () Bool)

(assert (=> b!813743 (= e!450963 tp_is_empty!14147)))

(declare-fun b!813744 () Bool)

(declare-fun res!555882 () Bool)

(declare-fun e!450959 () Bool)

(assert (=> b!813744 (=> (not res!555882) (not e!450959))))

(declare-datatypes ((array!44502 0))(
  ( (array!44503 (arr!21311 (Array (_ BitVec 32) (_ BitVec 64))) (size!21732 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44502)

(declare-datatypes ((List!15160 0))(
  ( (Nil!15157) (Cons!15156 (h!16285 (_ BitVec 64)) (t!21477 List!15160)) )
))
(declare-fun arrayNoDuplicates!0 (array!44502 (_ BitVec 32) List!15160) Bool)

(assert (=> b!813744 (= res!555882 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15157))))

(declare-fun res!555879 () Bool)

(assert (=> start!70016 (=> (not res!555879) (not e!450959))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70016 (= res!555879 (validMask!0 mask!1312))))

(assert (=> start!70016 e!450959))

(assert (=> start!70016 tp_is_empty!14147))

(declare-fun array_inv!17065 (array!44502) Bool)

(assert (=> start!70016 (array_inv!17065 _keys!976)))

(assert (=> start!70016 true))

(declare-datatypes ((V!23863 0))(
  ( (V!23864 (val!7121 Int)) )
))
(declare-datatypes ((ValueCell!6658 0))(
  ( (ValueCellFull!6658 (v!9548 V!23863)) (EmptyCell!6658) )
))
(declare-datatypes ((array!44504 0))(
  ( (array!44505 (arr!21312 (Array (_ BitVec 32) ValueCell!6658)) (size!21733 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44504)

(declare-fun e!450960 () Bool)

(declare-fun array_inv!17066 (array!44504) Bool)

(assert (=> start!70016 (and (array_inv!17066 _values!788) e!450960)))

(assert (=> start!70016 tp!44025))

(declare-fun b!813745 () Bool)

(declare-fun e!450961 () Bool)

(assert (=> b!813745 (= e!450961 tp_is_empty!14147)))

(declare-fun b!813746 () Bool)

(declare-fun mapRes!22801 () Bool)

(assert (=> b!813746 (= e!450960 (and e!450961 mapRes!22801))))

(declare-fun condMapEmpty!22801 () Bool)

(declare-fun mapDefault!22801 () ValueCell!6658)

