; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72594 () Bool)

(assert start!72594)

(declare-fun mapNonEmpty!25067 () Bool)

(declare-fun mapRes!25067 () Bool)

(declare-fun tp!48385 () Bool)

(declare-fun e!470073 () Bool)

(assert (=> mapNonEmpty!25067 (= mapRes!25067 (and tp!48385 e!470073))))

(declare-fun mapKey!25067 () (_ BitVec 32))

(declare-datatypes ((V!25907 0))(
  ( (V!25908 (val!7870 Int)) )
))
(declare-datatypes ((ValueCell!7383 0))(
  ( (ValueCellFull!7383 (v!10295 V!25907)) (EmptyCell!7383) )
))
(declare-fun mapValue!25067 () ValueCell!7383)

(declare-datatypes ((array!47558 0))(
  ( (array!47559 (arr!22810 (Array (_ BitVec 32) ValueCell!7383)) (size!23250 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47558)

(declare-fun mapRest!25067 () (Array (_ BitVec 32) ValueCell!7383))

(assert (=> mapNonEmpty!25067 (= (arr!22810 _values!688) (store mapRest!25067 mapKey!25067 mapValue!25067))))

(declare-fun b!842703 () Bool)

(declare-fun res!572741 () Bool)

(declare-fun e!470075 () Bool)

(assert (=> b!842703 (=> (not res!572741) (not e!470075))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47560 0))(
  ( (array!47561 (arr!22811 (Array (_ BitVec 32) (_ BitVec 64))) (size!23251 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47560)

(assert (=> b!842703 (= res!572741 (and (= (size!23250 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23251 _keys!868) (size!23250 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842704 () Bool)

(declare-fun e!470077 () Bool)

(declare-fun tp_is_empty!15645 () Bool)

(assert (=> b!842704 (= e!470077 tp_is_empty!15645)))

(declare-fun b!842705 () Bool)

(assert (=> b!842705 (= e!470075 false)))

(declare-fun lt!381034 () Bool)

(declare-datatypes ((List!16219 0))(
  ( (Nil!16216) (Cons!16215 (h!17346 (_ BitVec 64)) (t!22590 List!16219)) )
))
(declare-fun arrayNoDuplicates!0 (array!47560 (_ BitVec 32) List!16219) Bool)

(assert (=> b!842705 (= lt!381034 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16216))))

(declare-fun mapIsEmpty!25067 () Bool)

(assert (=> mapIsEmpty!25067 mapRes!25067))

(declare-fun b!842706 () Bool)

(declare-fun res!572740 () Bool)

(assert (=> b!842706 (=> (not res!572740) (not e!470075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842706 (= res!572740 (validMask!0 mask!1196))))

(declare-fun res!572738 () Bool)

(assert (=> start!72594 (=> (not res!572738) (not e!470075))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72594 (= res!572738 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23251 _keys!868))))))

(assert (=> start!72594 e!470075))

(assert (=> start!72594 true))

(declare-fun array_inv!18150 (array!47560) Bool)

(assert (=> start!72594 (array_inv!18150 _keys!868)))

(declare-fun e!470074 () Bool)

(declare-fun array_inv!18151 (array!47558) Bool)

(assert (=> start!72594 (and (array_inv!18151 _values!688) e!470074)))

(declare-fun b!842702 () Bool)

(assert (=> b!842702 (= e!470074 (and e!470077 mapRes!25067))))

(declare-fun condMapEmpty!25067 () Bool)

(declare-fun mapDefault!25067 () ValueCell!7383)

(assert (=> b!842702 (= condMapEmpty!25067 (= (arr!22810 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7383)) mapDefault!25067)))))

(declare-fun b!842707 () Bool)

(assert (=> b!842707 (= e!470073 tp_is_empty!15645)))

(declare-fun b!842708 () Bool)

(declare-fun res!572739 () Bool)

(assert (=> b!842708 (=> (not res!572739) (not e!470075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47560 (_ BitVec 32)) Bool)

(assert (=> b!842708 (= res!572739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72594 res!572738) b!842706))

(assert (= (and b!842706 res!572740) b!842703))

(assert (= (and b!842703 res!572741) b!842708))

(assert (= (and b!842708 res!572739) b!842705))

(assert (= (and b!842702 condMapEmpty!25067) mapIsEmpty!25067))

(assert (= (and b!842702 (not condMapEmpty!25067)) mapNonEmpty!25067))

(get-info :version)

(assert (= (and mapNonEmpty!25067 ((_ is ValueCellFull!7383) mapValue!25067)) b!842707))

(assert (= (and b!842702 ((_ is ValueCellFull!7383) mapDefault!25067)) b!842704))

(assert (= start!72594 b!842702))

(declare-fun m!785697 () Bool)

(assert (=> b!842708 m!785697))

(declare-fun m!785699 () Bool)

(assert (=> b!842705 m!785699))

(declare-fun m!785701 () Bool)

(assert (=> b!842706 m!785701))

(declare-fun m!785703 () Bool)

(assert (=> mapNonEmpty!25067 m!785703))

(declare-fun m!785705 () Bool)

(assert (=> start!72594 m!785705))

(declare-fun m!785707 () Bool)

(assert (=> start!72594 m!785707))

(check-sat (not b!842708) (not b!842706) tp_is_empty!15645 (not start!72594) (not mapNonEmpty!25067) (not b!842705))
(check-sat)
