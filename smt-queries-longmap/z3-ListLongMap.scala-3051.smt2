; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43090 () Bool)

(assert start!43090)

(declare-fun res!285229 () Bool)

(declare-fun e!280909 () Bool)

(assert (=> start!43090 (=> (not res!285229) (not e!280909))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43090 (= res!285229 (validMask!0 mask!2352))))

(assert (=> start!43090 e!280909))

(assert (=> start!43090 true))

(declare-datatypes ((V!19121 0))(
  ( (V!19122 (val!6816 Int)) )
))
(declare-datatypes ((ValueCell!6407 0))(
  ( (ValueCellFull!6407 (v!9098 V!19121)) (EmptyCell!6407) )
))
(declare-datatypes ((array!30737 0))(
  ( (array!30738 (arr!14781 (Array (_ BitVec 32) ValueCell!6407)) (size!15140 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30737)

(declare-fun e!280905 () Bool)

(declare-fun array_inv!10750 (array!30737) Bool)

(assert (=> start!43090 (and (array_inv!10750 _values!1516) e!280905)))

(declare-datatypes ((array!30739 0))(
  ( (array!30740 (arr!14782 (Array (_ BitVec 32) (_ BitVec 64))) (size!15141 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30739)

(declare-fun array_inv!10751 (array!30739) Bool)

(assert (=> start!43090 (array_inv!10751 _keys!1874)))

(declare-fun b!477935 () Bool)

(declare-fun e!280906 () Bool)

(declare-fun mapRes!21985 () Bool)

(assert (=> b!477935 (= e!280905 (and e!280906 mapRes!21985))))

(declare-fun condMapEmpty!21985 () Bool)

(declare-fun mapDefault!21985 () ValueCell!6407)

(assert (=> b!477935 (= condMapEmpty!21985 (= (arr!14781 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6407)) mapDefault!21985)))))

(declare-fun b!477936 () Bool)

(declare-fun e!280907 () Bool)

(declare-fun tp_is_empty!13537 () Bool)

(assert (=> b!477936 (= e!280907 tp_is_empty!13537)))

(declare-fun mapIsEmpty!21985 () Bool)

(assert (=> mapIsEmpty!21985 mapRes!21985))

(declare-fun mapNonEmpty!21985 () Bool)

(declare-fun tp!42460 () Bool)

(assert (=> mapNonEmpty!21985 (= mapRes!21985 (and tp!42460 e!280907))))

(declare-fun mapKey!21985 () (_ BitVec 32))

(declare-fun mapValue!21985 () ValueCell!6407)

(declare-fun mapRest!21985 () (Array (_ BitVec 32) ValueCell!6407))

(assert (=> mapNonEmpty!21985 (= (arr!14781 _values!1516) (store mapRest!21985 mapKey!21985 mapValue!21985))))

(declare-fun b!477937 () Bool)

(assert (=> b!477937 (= e!280906 tp_is_empty!13537)))

(declare-fun b!477938 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!477938 (= e!280909 (and (= (size!15140 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15141 _keys!1874) (size!15140 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (not (= (size!15141 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)))))))

(assert (= (and start!43090 res!285229) b!477938))

(assert (= (and b!477935 condMapEmpty!21985) mapIsEmpty!21985))

(assert (= (and b!477935 (not condMapEmpty!21985)) mapNonEmpty!21985))

(get-info :version)

(assert (= (and mapNonEmpty!21985 ((_ is ValueCellFull!6407) mapValue!21985)) b!477936))

(assert (= (and b!477935 ((_ is ValueCellFull!6407) mapDefault!21985)) b!477937))

(assert (= start!43090 b!477935))

(declare-fun m!459839 () Bool)

(assert (=> start!43090 m!459839))

(declare-fun m!459841 () Bool)

(assert (=> start!43090 m!459841))

(declare-fun m!459843 () Bool)

(assert (=> start!43090 m!459843))

(declare-fun m!459845 () Bool)

(assert (=> mapNonEmpty!21985 m!459845))

(check-sat (not start!43090) (not mapNonEmpty!21985) tp_is_empty!13537)
(check-sat)
