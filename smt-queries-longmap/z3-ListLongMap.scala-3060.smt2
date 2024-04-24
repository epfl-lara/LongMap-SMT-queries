; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43188 () Bool)

(assert start!43188)

(declare-fun b!478743 () Bool)

(declare-fun res!285643 () Bool)

(declare-fun e!281541 () Bool)

(assert (=> b!478743 (=> (not res!285643) (not e!281541))))

(declare-datatypes ((array!30846 0))(
  ( (array!30847 (arr!14830 (Array (_ BitVec 32) (_ BitVec 64))) (size!15188 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30846)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30846 (_ BitVec 32)) Bool)

(assert (=> b!478743 (= res!285643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478744 () Bool)

(declare-fun e!281543 () Bool)

(declare-fun tp_is_empty!13591 () Bool)

(assert (=> b!478744 (= e!281543 tp_is_empty!13591)))

(declare-fun b!478745 () Bool)

(declare-fun e!281544 () Bool)

(assert (=> b!478745 (= e!281544 tp_is_empty!13591)))

(declare-fun mapNonEmpty!22081 () Bool)

(declare-fun mapRes!22081 () Bool)

(declare-fun tp!42556 () Bool)

(assert (=> mapNonEmpty!22081 (= mapRes!22081 (and tp!42556 e!281543))))

(declare-datatypes ((V!19193 0))(
  ( (V!19194 (val!6843 Int)) )
))
(declare-datatypes ((ValueCell!6434 0))(
  ( (ValueCellFull!6434 (v!9133 V!19193)) (EmptyCell!6434) )
))
(declare-fun mapRest!22081 () (Array (_ BitVec 32) ValueCell!6434))

(declare-fun mapValue!22081 () ValueCell!6434)

(declare-datatypes ((array!30848 0))(
  ( (array!30849 (arr!14831 (Array (_ BitVec 32) ValueCell!6434)) (size!15189 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30848)

(declare-fun mapKey!22081 () (_ BitVec 32))

(assert (=> mapNonEmpty!22081 (= (arr!14831 _values!1516) (store mapRest!22081 mapKey!22081 mapValue!22081))))

(declare-fun b!478746 () Bool)

(declare-fun e!281542 () Bool)

(assert (=> b!478746 (= e!281542 (and e!281544 mapRes!22081))))

(declare-fun condMapEmpty!22081 () Bool)

(declare-fun mapDefault!22081 () ValueCell!6434)

(assert (=> b!478746 (= condMapEmpty!22081 (= (arr!14831 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6434)) mapDefault!22081)))))

(declare-fun b!478747 () Bool)

(declare-fun res!285644 () Bool)

(assert (=> b!478747 (=> (not res!285644) (not e!281541))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478747 (= res!285644 (and (= (size!15189 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15188 _keys!1874) (size!15189 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478748 () Bool)

(assert (=> b!478748 (= e!281541 false)))

(declare-fun lt!217783 () Bool)

(declare-datatypes ((List!8979 0))(
  ( (Nil!8976) (Cons!8975 (h!9831 (_ BitVec 64)) (t!15177 List!8979)) )
))
(declare-fun arrayNoDuplicates!0 (array!30846 (_ BitVec 32) List!8979) Bool)

(assert (=> b!478748 (= lt!217783 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8976))))

(declare-fun res!285642 () Bool)

(assert (=> start!43188 (=> (not res!285642) (not e!281541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43188 (= res!285642 (validMask!0 mask!2352))))

(assert (=> start!43188 e!281541))

(assert (=> start!43188 true))

(declare-fun array_inv!10778 (array!30848) Bool)

(assert (=> start!43188 (and (array_inv!10778 _values!1516) e!281542)))

(declare-fun array_inv!10779 (array!30846) Bool)

(assert (=> start!43188 (array_inv!10779 _keys!1874)))

(declare-fun mapIsEmpty!22081 () Bool)

(assert (=> mapIsEmpty!22081 mapRes!22081))

(assert (= (and start!43188 res!285642) b!478747))

(assert (= (and b!478747 res!285644) b!478743))

(assert (= (and b!478743 res!285643) b!478748))

(assert (= (and b!478746 condMapEmpty!22081) mapIsEmpty!22081))

(assert (= (and b!478746 (not condMapEmpty!22081)) mapNonEmpty!22081))

(get-info :version)

(assert (= (and mapNonEmpty!22081 ((_ is ValueCellFull!6434) mapValue!22081)) b!478744))

(assert (= (and b!478746 ((_ is ValueCellFull!6434) mapDefault!22081)) b!478745))

(assert (= start!43188 b!478746))

(declare-fun m!461131 () Bool)

(assert (=> b!478743 m!461131))

(declare-fun m!461133 () Bool)

(assert (=> mapNonEmpty!22081 m!461133))

(declare-fun m!461135 () Bool)

(assert (=> b!478748 m!461135))

(declare-fun m!461137 () Bool)

(assert (=> start!43188 m!461137))

(declare-fun m!461139 () Bool)

(assert (=> start!43188 m!461139))

(declare-fun m!461141 () Bool)

(assert (=> start!43188 m!461141))

(check-sat (not b!478748) (not start!43188) tp_is_empty!13591 (not b!478743) (not mapNonEmpty!22081))
(check-sat)
