; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69950 () Bool)

(assert start!69950)

(declare-fun b_free!12383 () Bool)

(declare-fun b_next!12383 () Bool)

(assert (=> start!69950 (= b_free!12383 (not b_next!12383))))

(declare-fun tp!43861 () Bool)

(declare-fun b_and!21151 () Bool)

(assert (=> start!69950 (= tp!43861 b_and!21151)))

(declare-fun b!813103 () Bool)

(declare-fun res!555528 () Bool)

(declare-fun e!450509 () Bool)

(assert (=> b!813103 (=> (not res!555528) (not e!450509))))

(declare-datatypes ((array!44398 0))(
  ( (array!44399 (arr!21260 (Array (_ BitVec 32) (_ BitVec 64))) (size!21681 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44398)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44398 (_ BitVec 32)) Bool)

(assert (=> b!813103 (= res!555528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813104 () Bool)

(declare-fun e!450506 () Bool)

(declare-fun tp_is_empty!14093 () Bool)

(assert (=> b!813104 (= e!450506 tp_is_empty!14093)))

(declare-fun mapNonEmpty!22717 () Bool)

(declare-fun mapRes!22717 () Bool)

(declare-fun tp!43860 () Bool)

(assert (=> mapNonEmpty!22717 (= mapRes!22717 (and tp!43860 e!450506))))

(declare-datatypes ((V!23791 0))(
  ( (V!23792 (val!7094 Int)) )
))
(declare-datatypes ((ValueCell!6631 0))(
  ( (ValueCellFull!6631 (v!9521 V!23791)) (EmptyCell!6631) )
))
(declare-fun mapValue!22717 () ValueCell!6631)

(declare-datatypes ((array!44400 0))(
  ( (array!44401 (arr!21261 (Array (_ BitVec 32) ValueCell!6631)) (size!21682 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44400)

(declare-fun mapRest!22717 () (Array (_ BitVec 32) ValueCell!6631))

(declare-fun mapKey!22717 () (_ BitVec 32))

(assert (=> mapNonEmpty!22717 (= (arr!21261 _values!788) (store mapRest!22717 mapKey!22717 mapValue!22717))))

(declare-fun b!813105 () Bool)

(declare-fun res!555531 () Bool)

(assert (=> b!813105 (=> (not res!555531) (not e!450509))))

(declare-datatypes ((List!15122 0))(
  ( (Nil!15119) (Cons!15118 (h!16247 (_ BitVec 64)) (t!21437 List!15122)) )
))
(declare-fun arrayNoDuplicates!0 (array!44398 (_ BitVec 32) List!15122) Bool)

(assert (=> b!813105 (= res!555531 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15119))))

(declare-fun b!813106 () Bool)

(declare-fun e!450510 () Bool)

(declare-fun e!450508 () Bool)

(assert (=> b!813106 (= e!450510 (and e!450508 mapRes!22717))))

(declare-fun condMapEmpty!22717 () Bool)

(declare-fun mapDefault!22717 () ValueCell!6631)

