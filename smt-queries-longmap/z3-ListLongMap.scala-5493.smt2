; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72910 () Bool)

(assert start!72910)

(declare-fun mapNonEmpty!25289 () Bool)

(declare-fun mapRes!25289 () Bool)

(declare-fun tp!48608 () Bool)

(declare-fun e!471765 () Bool)

(assert (=> mapNonEmpty!25289 (= mapRes!25289 (and tp!48608 e!471765))))

(declare-datatypes ((V!26105 0))(
  ( (V!26106 (val!7944 Int)) )
))
(declare-datatypes ((ValueCell!7457 0))(
  ( (ValueCellFull!7457 (v!10369 V!26105)) (EmptyCell!7457) )
))
(declare-fun mapValue!25289 () ValueCell!7457)

(declare-fun mapRest!25289 () (Array (_ BitVec 32) ValueCell!7457))

(declare-fun mapKey!25289 () (_ BitVec 32))

(declare-datatypes ((array!47861 0))(
  ( (array!47862 (arr!22957 (Array (_ BitVec 32) ValueCell!7457)) (size!23398 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47861)

(assert (=> mapNonEmpty!25289 (= (arr!22957 _values!688) (store mapRest!25289 mapKey!25289 mapValue!25289))))

(declare-fun res!573971 () Bool)

(declare-fun e!471768 () Bool)

(assert (=> start!72910 (=> (not res!573971) (not e!471768))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47863 0))(
  ( (array!47864 (arr!22958 (Array (_ BitVec 32) (_ BitVec 64))) (size!23399 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47863)

(assert (=> start!72910 (= res!573971 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23399 _keys!868))))))

(assert (=> start!72910 e!471768))

(assert (=> start!72910 true))

(declare-fun array_inv!18302 (array!47863) Bool)

(assert (=> start!72910 (array_inv!18302 _keys!868)))

(declare-fun e!471766 () Bool)

(declare-fun array_inv!18303 (array!47861) Bool)

(assert (=> start!72910 (and (array_inv!18303 _values!688) e!471766)))

(declare-fun b!845159 () Bool)

(declare-fun tp_is_empty!15793 () Bool)

(assert (=> b!845159 (= e!471765 tp_is_empty!15793)))

(declare-fun b!845160 () Bool)

(declare-fun res!573973 () Bool)

(assert (=> b!845160 (=> (not res!573973) (not e!471768))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!845160 (= res!573973 (and (= (size!23398 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23399 _keys!868) (size!23398 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25289 () Bool)

(assert (=> mapIsEmpty!25289 mapRes!25289))

(declare-fun b!845161 () Bool)

(declare-fun res!573970 () Bool)

(assert (=> b!845161 (=> (not res!573970) (not e!471768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845161 (= res!573970 (validMask!0 mask!1196))))

(declare-fun b!845162 () Bool)

(declare-fun res!573972 () Bool)

(assert (=> b!845162 (=> (not res!573972) (not e!471768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47863 (_ BitVec 32)) Bool)

(assert (=> b!845162 (= res!573972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845163 () Bool)

(assert (=> b!845163 (= e!471768 false)))

(declare-fun lt!381617 () Bool)

(declare-datatypes ((List!16193 0))(
  ( (Nil!16190) (Cons!16189 (h!17326 (_ BitVec 64)) (t!22556 List!16193)) )
))
(declare-fun arrayNoDuplicates!0 (array!47863 (_ BitVec 32) List!16193) Bool)

(assert (=> b!845163 (= lt!381617 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16190))))

(declare-fun b!845164 () Bool)

(declare-fun e!471767 () Bool)

(assert (=> b!845164 (= e!471766 (and e!471767 mapRes!25289))))

(declare-fun condMapEmpty!25289 () Bool)

(declare-fun mapDefault!25289 () ValueCell!7457)

(assert (=> b!845164 (= condMapEmpty!25289 (= (arr!22957 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7457)) mapDefault!25289)))))

(declare-fun b!845165 () Bool)

(assert (=> b!845165 (= e!471767 tp_is_empty!15793)))

(assert (= (and start!72910 res!573971) b!845161))

(assert (= (and b!845161 res!573970) b!845160))

(assert (= (and b!845160 res!573973) b!845162))

(assert (= (and b!845162 res!573972) b!845163))

(assert (= (and b!845164 condMapEmpty!25289) mapIsEmpty!25289))

(assert (= (and b!845164 (not condMapEmpty!25289)) mapNonEmpty!25289))

(get-info :version)

(assert (= (and mapNonEmpty!25289 ((_ is ValueCellFull!7457) mapValue!25289)) b!845159))

(assert (= (and b!845164 ((_ is ValueCellFull!7457) mapDefault!25289)) b!845165))

(assert (= start!72910 b!845164))

(declare-fun m!787877 () Bool)

(assert (=> b!845162 m!787877))

(declare-fun m!787879 () Bool)

(assert (=> b!845163 m!787879))

(declare-fun m!787881 () Bool)

(assert (=> mapNonEmpty!25289 m!787881))

(declare-fun m!787883 () Bool)

(assert (=> b!845161 m!787883))

(declare-fun m!787885 () Bool)

(assert (=> start!72910 m!787885))

(declare-fun m!787887 () Bool)

(assert (=> start!72910 m!787887))

(check-sat (not b!845161) tp_is_empty!15793 (not mapNonEmpty!25289) (not b!845162) (not b!845163) (not start!72910))
(check-sat)
