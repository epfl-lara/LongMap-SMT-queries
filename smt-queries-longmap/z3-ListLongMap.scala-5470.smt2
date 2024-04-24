; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72772 () Bool)

(assert start!72772)

(declare-fun b!843710 () Bool)

(declare-fun res!573142 () Bool)

(declare-fun e!470734 () Bool)

(assert (=> b!843710 (=> (not res!573142) (not e!470734))))

(declare-datatypes ((array!47601 0))(
  ( (array!47602 (arr!22827 (Array (_ BitVec 32) (_ BitVec 64))) (size!23268 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47601)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47601 (_ BitVec 32)) Bool)

(assert (=> b!843710 (= res!573142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843711 () Bool)

(declare-fun e!470733 () Bool)

(declare-fun tp_is_empty!15655 () Bool)

(assert (=> b!843711 (= e!470733 tp_is_empty!15655)))

(declare-fun mapIsEmpty!25082 () Bool)

(declare-fun mapRes!25082 () Bool)

(assert (=> mapIsEmpty!25082 mapRes!25082))

(declare-fun mapNonEmpty!25082 () Bool)

(declare-fun tp!48401 () Bool)

(assert (=> mapNonEmpty!25082 (= mapRes!25082 (and tp!48401 e!470733))))

(declare-datatypes ((V!25921 0))(
  ( (V!25922 (val!7875 Int)) )
))
(declare-datatypes ((ValueCell!7388 0))(
  ( (ValueCellFull!7388 (v!10300 V!25921)) (EmptyCell!7388) )
))
(declare-fun mapRest!25082 () (Array (_ BitVec 32) ValueCell!7388))

(declare-fun mapKey!25082 () (_ BitVec 32))

(declare-fun mapValue!25082 () ValueCell!7388)

(declare-datatypes ((array!47603 0))(
  ( (array!47604 (arr!22828 (Array (_ BitVec 32) ValueCell!7388)) (size!23269 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47603)

(assert (=> mapNonEmpty!25082 (= (arr!22828 _values!688) (store mapRest!25082 mapKey!25082 mapValue!25082))))

(declare-fun b!843712 () Bool)

(declare-fun res!573143 () Bool)

(assert (=> b!843712 (=> (not res!573143) (not e!470734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843712 (= res!573143 (validMask!0 mask!1196))))

(declare-fun b!843713 () Bool)

(declare-fun e!470731 () Bool)

(assert (=> b!843713 (= e!470731 tp_is_empty!15655)))

(declare-fun res!573144 () Bool)

(assert (=> start!72772 (=> (not res!573144) (not e!470734))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72772 (= res!573144 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23268 _keys!868))))))

(assert (=> start!72772 e!470734))

(assert (=> start!72772 true))

(declare-fun array_inv!18210 (array!47601) Bool)

(assert (=> start!72772 (array_inv!18210 _keys!868)))

(declare-fun e!470730 () Bool)

(declare-fun array_inv!18211 (array!47603) Bool)

(assert (=> start!72772 (and (array_inv!18211 _values!688) e!470730)))

(declare-fun b!843714 () Bool)

(assert (=> b!843714 (= e!470730 (and e!470731 mapRes!25082))))

(declare-fun condMapEmpty!25082 () Bool)

(declare-fun mapDefault!25082 () ValueCell!7388)

(assert (=> b!843714 (= condMapEmpty!25082 (= (arr!22828 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7388)) mapDefault!25082)))))

(declare-fun b!843715 () Bool)

(assert (=> b!843715 (= e!470734 false)))

(declare-fun lt!381410 () Bool)

(declare-datatypes ((List!16147 0))(
  ( (Nil!16144) (Cons!16143 (h!17280 (_ BitVec 64)) (t!22510 List!16147)) )
))
(declare-fun arrayNoDuplicates!0 (array!47601 (_ BitVec 32) List!16147) Bool)

(assert (=> b!843715 (= lt!381410 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16144))))

(declare-fun b!843716 () Bool)

(declare-fun res!573145 () Bool)

(assert (=> b!843716 (=> (not res!573145) (not e!470734))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843716 (= res!573145 (and (= (size!23269 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23268 _keys!868) (size!23269 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72772 res!573144) b!843712))

(assert (= (and b!843712 res!573143) b!843716))

(assert (= (and b!843716 res!573145) b!843710))

(assert (= (and b!843710 res!573142) b!843715))

(assert (= (and b!843714 condMapEmpty!25082) mapIsEmpty!25082))

(assert (= (and b!843714 (not condMapEmpty!25082)) mapNonEmpty!25082))

(get-info :version)

(assert (= (and mapNonEmpty!25082 ((_ is ValueCellFull!7388) mapValue!25082)) b!843711))

(assert (= (and b!843714 ((_ is ValueCellFull!7388) mapDefault!25082)) b!843713))

(assert (= start!72772 b!843714))

(declare-fun m!787049 () Bool)

(assert (=> b!843715 m!787049))

(declare-fun m!787051 () Bool)

(assert (=> b!843710 m!787051))

(declare-fun m!787053 () Bool)

(assert (=> start!72772 m!787053))

(declare-fun m!787055 () Bool)

(assert (=> start!72772 m!787055))

(declare-fun m!787057 () Bool)

(assert (=> mapNonEmpty!25082 m!787057))

(declare-fun m!787059 () Bool)

(assert (=> b!843712 m!787059))

(check-sat (not b!843715) tp_is_empty!15655 (not start!72772) (not b!843712) (not b!843710) (not mapNonEmpty!25082))
(check-sat)
