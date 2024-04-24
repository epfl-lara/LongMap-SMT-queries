; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43090 () Bool)

(assert start!43090)

(declare-fun b!478145 () Bool)

(declare-fun e!281044 () Bool)

(declare-fun e!281040 () Bool)

(declare-fun mapRes!21985 () Bool)

(assert (=> b!478145 (= e!281044 (and e!281040 mapRes!21985))))

(declare-fun condMapEmpty!21985 () Bool)

(declare-datatypes ((V!19121 0))(
  ( (V!19122 (val!6816 Int)) )
))
(declare-datatypes ((ValueCell!6407 0))(
  ( (ValueCellFull!6407 (v!9105 V!19121)) (EmptyCell!6407) )
))
(declare-datatypes ((array!30734 0))(
  ( (array!30735 (arr!14779 (Array (_ BitVec 32) ValueCell!6407)) (size!15137 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30734)

(declare-fun mapDefault!21985 () ValueCell!6407)

(assert (=> b!478145 (= condMapEmpty!21985 (= (arr!14779 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6407)) mapDefault!21985)))))

(declare-fun mapIsEmpty!21985 () Bool)

(assert (=> mapIsEmpty!21985 mapRes!21985))

(declare-fun res!285351 () Bool)

(declare-fun e!281041 () Bool)

(assert (=> start!43090 (=> (not res!285351) (not e!281041))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43090 (= res!285351 (validMask!0 mask!2352))))

(assert (=> start!43090 e!281041))

(assert (=> start!43090 true))

(declare-fun array_inv!10742 (array!30734) Bool)

(assert (=> start!43090 (and (array_inv!10742 _values!1516) e!281044)))

(declare-datatypes ((array!30736 0))(
  ( (array!30737 (arr!14780 (Array (_ BitVec 32) (_ BitVec 64))) (size!15138 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30736)

(declare-fun array_inv!10743 (array!30736) Bool)

(assert (=> start!43090 (array_inv!10743 _keys!1874)))

(declare-fun b!478146 () Bool)

(declare-fun e!281042 () Bool)

(declare-fun tp_is_empty!13537 () Bool)

(assert (=> b!478146 (= e!281042 tp_is_empty!13537)))

(declare-fun b!478147 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478147 (= e!281041 (and (= (size!15137 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15138 _keys!1874) (size!15137 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (not (= (size!15138 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)))))))

(declare-fun mapNonEmpty!21985 () Bool)

(declare-fun tp!42460 () Bool)

(assert (=> mapNonEmpty!21985 (= mapRes!21985 (and tp!42460 e!281042))))

(declare-fun mapRest!21985 () (Array (_ BitVec 32) ValueCell!6407))

(declare-fun mapValue!21985 () ValueCell!6407)

(declare-fun mapKey!21985 () (_ BitVec 32))

(assert (=> mapNonEmpty!21985 (= (arr!14779 _values!1516) (store mapRest!21985 mapKey!21985 mapValue!21985))))

(declare-fun b!478148 () Bool)

(assert (=> b!478148 (= e!281040 tp_is_empty!13537)))

(assert (= (and start!43090 res!285351) b!478147))

(assert (= (and b!478145 condMapEmpty!21985) mapIsEmpty!21985))

(assert (= (and b!478145 (not condMapEmpty!21985)) mapNonEmpty!21985))

(get-info :version)

(assert (= (and mapNonEmpty!21985 ((_ is ValueCellFull!6407) mapValue!21985)) b!478146))

(assert (= (and b!478145 ((_ is ValueCellFull!6407) mapDefault!21985)) b!478148))

(assert (= start!43090 b!478145))

(declare-fun m!460755 () Bool)

(assert (=> start!43090 m!460755))

(declare-fun m!460757 () Bool)

(assert (=> start!43090 m!460757))

(declare-fun m!460759 () Bool)

(assert (=> start!43090 m!460759))

(declare-fun m!460761 () Bool)

(assert (=> mapNonEmpty!21985 m!460761))

(check-sat (not start!43090) (not mapNonEmpty!21985) tp_is_empty!13537)
(check-sat)
