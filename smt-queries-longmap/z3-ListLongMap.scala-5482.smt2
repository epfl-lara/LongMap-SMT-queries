; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72678 () Bool)

(assert start!72678)

(declare-fun res!573244 () Bool)

(declare-fun e!470705 () Bool)

(assert (=> start!72678 (=> (not res!573244) (not e!470705))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47704 0))(
  ( (array!47705 (arr!22883 (Array (_ BitVec 32) (_ BitVec 64))) (size!23323 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47704)

(assert (=> start!72678 (= res!573244 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23323 _keys!868))))))

(assert (=> start!72678 e!470705))

(assert (=> start!72678 true))

(declare-fun array_inv!18198 (array!47704) Bool)

(assert (=> start!72678 (array_inv!18198 _keys!868)))

(declare-datatypes ((V!26019 0))(
  ( (V!26020 (val!7912 Int)) )
))
(declare-datatypes ((ValueCell!7425 0))(
  ( (ValueCellFull!7425 (v!10337 V!26019)) (EmptyCell!7425) )
))
(declare-datatypes ((array!47706 0))(
  ( (array!47707 (arr!22884 (Array (_ BitVec 32) ValueCell!7425)) (size!23324 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47706)

(declare-fun e!470703 () Bool)

(declare-fun array_inv!18199 (array!47706) Bool)

(assert (=> start!72678 (and (array_inv!18199 _values!688) e!470703)))

(declare-fun b!843584 () Bool)

(declare-fun e!470707 () Bool)

(declare-fun tp_is_empty!15729 () Bool)

(assert (=> b!843584 (= e!470707 tp_is_empty!15729)))

(declare-fun b!843585 () Bool)

(declare-fun res!573243 () Bool)

(assert (=> b!843585 (=> (not res!573243) (not e!470705))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!843585 (= res!573243 (and (= (size!23324 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23323 _keys!868) (size!23324 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25193 () Bool)

(declare-fun mapRes!25193 () Bool)

(declare-fun tp!48511 () Bool)

(declare-fun e!470704 () Bool)

(assert (=> mapNonEmpty!25193 (= mapRes!25193 (and tp!48511 e!470704))))

(declare-fun mapRest!25193 () (Array (_ BitVec 32) ValueCell!7425))

(declare-fun mapKey!25193 () (_ BitVec 32))

(declare-fun mapValue!25193 () ValueCell!7425)

(assert (=> mapNonEmpty!25193 (= (arr!22884 _values!688) (store mapRest!25193 mapKey!25193 mapValue!25193))))

(declare-fun b!843586 () Bool)

(declare-fun res!573242 () Bool)

(assert (=> b!843586 (=> (not res!573242) (not e!470705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47704 (_ BitVec 32)) Bool)

(assert (=> b!843586 (= res!573242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843587 () Bool)

(assert (=> b!843587 (= e!470705 false)))

(declare-fun lt!381160 () Bool)

(declare-datatypes ((List!16242 0))(
  ( (Nil!16239) (Cons!16238 (h!17369 (_ BitVec 64)) (t!22613 List!16242)) )
))
(declare-fun arrayNoDuplicates!0 (array!47704 (_ BitVec 32) List!16242) Bool)

(assert (=> b!843587 (= lt!381160 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16239))))

(declare-fun mapIsEmpty!25193 () Bool)

(assert (=> mapIsEmpty!25193 mapRes!25193))

(declare-fun b!843588 () Bool)

(assert (=> b!843588 (= e!470703 (and e!470707 mapRes!25193))))

(declare-fun condMapEmpty!25193 () Bool)

(declare-fun mapDefault!25193 () ValueCell!7425)

(assert (=> b!843588 (= condMapEmpty!25193 (= (arr!22884 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7425)) mapDefault!25193)))))

(declare-fun b!843589 () Bool)

(declare-fun res!573245 () Bool)

(assert (=> b!843589 (=> (not res!573245) (not e!470705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843589 (= res!573245 (validMask!0 mask!1196))))

(declare-fun b!843590 () Bool)

(assert (=> b!843590 (= e!470704 tp_is_empty!15729)))

(assert (= (and start!72678 res!573244) b!843589))

(assert (= (and b!843589 res!573245) b!843585))

(assert (= (and b!843585 res!573243) b!843586))

(assert (= (and b!843586 res!573242) b!843587))

(assert (= (and b!843588 condMapEmpty!25193) mapIsEmpty!25193))

(assert (= (and b!843588 (not condMapEmpty!25193)) mapNonEmpty!25193))

(get-info :version)

(assert (= (and mapNonEmpty!25193 ((_ is ValueCellFull!7425) mapValue!25193)) b!843590))

(assert (= (and b!843588 ((_ is ValueCellFull!7425) mapDefault!25193)) b!843584))

(assert (= start!72678 b!843588))

(declare-fun m!786201 () Bool)

(assert (=> b!843589 m!786201))

(declare-fun m!786203 () Bool)

(assert (=> mapNonEmpty!25193 m!786203))

(declare-fun m!786205 () Bool)

(assert (=> b!843586 m!786205))

(declare-fun m!786207 () Bool)

(assert (=> b!843587 m!786207))

(declare-fun m!786209 () Bool)

(assert (=> start!72678 m!786209))

(declare-fun m!786211 () Bool)

(assert (=> start!72678 m!786211))

(check-sat (not b!843586) (not b!843587) (not mapNonEmpty!25193) (not b!843589) (not start!72678) tp_is_empty!15729)
(check-sat)
