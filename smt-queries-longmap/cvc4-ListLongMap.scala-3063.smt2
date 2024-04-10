; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43224 () Bool)

(assert start!43224)

(declare-fun b!479002 () Bool)

(declare-fun e!281745 () Bool)

(declare-fun tp_is_empty!13613 () Bool)

(assert (=> b!479002 (= e!281745 tp_is_empty!13613)))

(declare-fun b!479003 () Bool)

(declare-fun res!285748 () Bool)

(declare-fun e!281747 () Bool)

(assert (=> b!479003 (=> (not res!285748) (not e!281747))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30901 0))(
  ( (array!30902 (arr!14858 (Array (_ BitVec 32) (_ BitVec 64))) (size!15216 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30901)

(declare-datatypes ((V!19221 0))(
  ( (V!19222 (val!6854 Int)) )
))
(declare-datatypes ((ValueCell!6445 0))(
  ( (ValueCellFull!6445 (v!9143 V!19221)) (EmptyCell!6445) )
))
(declare-datatypes ((array!30903 0))(
  ( (array!30904 (arr!14859 (Array (_ BitVec 32) ValueCell!6445)) (size!15217 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30903)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479003 (= res!285748 (and (= (size!15217 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15216 _keys!1874) (size!15217 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22114 () Bool)

(declare-fun mapRes!22114 () Bool)

(declare-fun tp!42589 () Bool)

(assert (=> mapNonEmpty!22114 (= mapRes!22114 (and tp!42589 e!281745))))

(declare-fun mapKey!22114 () (_ BitVec 32))

(declare-fun mapValue!22114 () ValueCell!6445)

(declare-fun mapRest!22114 () (Array (_ BitVec 32) ValueCell!6445))

(assert (=> mapNonEmpty!22114 (= (arr!14859 _values!1516) (store mapRest!22114 mapKey!22114 mapValue!22114))))

(declare-fun b!479004 () Bool)

(assert (=> b!479004 (= e!281747 false)))

(declare-fun lt!217804 () Bool)

(declare-datatypes ((List!9079 0))(
  ( (Nil!9076) (Cons!9075 (h!9931 (_ BitVec 64)) (t!15285 List!9079)) )
))
(declare-fun arrayNoDuplicates!0 (array!30901 (_ BitVec 32) List!9079) Bool)

(assert (=> b!479004 (= lt!217804 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9076))))

(declare-fun b!479005 () Bool)

(declare-fun res!285749 () Bool)

(assert (=> b!479005 (=> (not res!285749) (not e!281747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30901 (_ BitVec 32)) Bool)

(assert (=> b!479005 (= res!285749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22114 () Bool)

(assert (=> mapIsEmpty!22114 mapRes!22114))

(declare-fun res!285750 () Bool)

(assert (=> start!43224 (=> (not res!285750) (not e!281747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43224 (= res!285750 (validMask!0 mask!2352))))

(assert (=> start!43224 e!281747))

(assert (=> start!43224 true))

(declare-fun e!281744 () Bool)

(declare-fun array_inv!10722 (array!30903) Bool)

(assert (=> start!43224 (and (array_inv!10722 _values!1516) e!281744)))

(declare-fun array_inv!10723 (array!30901) Bool)

(assert (=> start!43224 (array_inv!10723 _keys!1874)))

(declare-fun b!479006 () Bool)

(declare-fun e!281746 () Bool)

(assert (=> b!479006 (= e!281744 (and e!281746 mapRes!22114))))

(declare-fun condMapEmpty!22114 () Bool)

(declare-fun mapDefault!22114 () ValueCell!6445)

