; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3664 () Bool)

(assert start!3664)

(declare-fun mapIsEmpty!1060 () Bool)

(declare-fun mapRes!1060 () Bool)

(assert (=> mapIsEmpty!1060 mapRes!1060))

(declare-fun b!25690 () Bool)

(declare-fun e!16598 () Bool)

(declare-fun tp_is_empty!1039 () Bool)

(assert (=> b!25690 (= e!16598 tp_is_empty!1039)))

(declare-fun mapNonEmpty!1060 () Bool)

(declare-fun tp!3580 () Bool)

(declare-fun e!16597 () Bool)

(assert (=> mapNonEmpty!1060 (= mapRes!1060 (and tp!3580 e!16597))))

(declare-datatypes ((V!1211 0))(
  ( (V!1212 (val!546 Int)) )
))
(declare-datatypes ((ValueCell!320 0))(
  ( (ValueCellFull!320 (v!1630 V!1211)) (EmptyCell!320) )
))
(declare-fun mapValue!1060 () ValueCell!320)

(declare-fun mapKey!1060 () (_ BitVec 32))

(declare-fun mapRest!1060 () (Array (_ BitVec 32) ValueCell!320))

(declare-datatypes ((array!1303 0))(
  ( (array!1304 (arr!614 (Array (_ BitVec 32) ValueCell!320)) (size!715 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1303)

(assert (=> mapNonEmpty!1060 (= (arr!614 _values!1501) (store mapRest!1060 mapKey!1060 mapValue!1060))))

(declare-fun b!25691 () Bool)

(assert (=> b!25691 (= e!16597 tp_is_empty!1039)))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun e!16600 () Bool)

(declare-datatypes ((array!1305 0))(
  ( (array!1306 (arr!615 (Array (_ BitVec 32) (_ BitVec 64))) (size!716 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1305)

(declare-fun b!25692 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!25692 (= e!16600 (and (= (size!715 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!716 _keys!1833) (size!715 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (not (= (size!716 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)))))))

(declare-fun res!15323 () Bool)

(assert (=> start!3664 (=> (not res!15323) (not e!16600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3664 (= res!15323 (validMask!0 mask!2294))))

(assert (=> start!3664 e!16600))

(assert (=> start!3664 true))

(declare-fun e!16599 () Bool)

(declare-fun array_inv!431 (array!1303) Bool)

(assert (=> start!3664 (and (array_inv!431 _values!1501) e!16599)))

(declare-fun array_inv!432 (array!1305) Bool)

(assert (=> start!3664 (array_inv!432 _keys!1833)))

(declare-fun b!25693 () Bool)

(assert (=> b!25693 (= e!16599 (and e!16598 mapRes!1060))))

(declare-fun condMapEmpty!1060 () Bool)

(declare-fun mapDefault!1060 () ValueCell!320)

(assert (=> b!25693 (= condMapEmpty!1060 (= (arr!614 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!320)) mapDefault!1060)))))

(assert (= (and start!3664 res!15323) b!25692))

(assert (= (and b!25693 condMapEmpty!1060) mapIsEmpty!1060))

(assert (= (and b!25693 (not condMapEmpty!1060)) mapNonEmpty!1060))

(get-info :version)

(assert (= (and mapNonEmpty!1060 ((_ is ValueCellFull!320) mapValue!1060)) b!25691))

(assert (= (and b!25693 ((_ is ValueCellFull!320) mapDefault!1060)) b!25690))

(assert (= start!3664 b!25693))

(declare-fun m!20703 () Bool)

(assert (=> mapNonEmpty!1060 m!20703))

(declare-fun m!20705 () Bool)

(assert (=> start!3664 m!20705))

(declare-fun m!20707 () Bool)

(assert (=> start!3664 m!20707))

(declare-fun m!20709 () Bool)

(assert (=> start!3664 m!20709))

(check-sat (not start!3664) (not mapNonEmpty!1060) tp_is_empty!1039)
(check-sat)
