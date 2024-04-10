; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72642 () Bool)

(assert start!72642)

(declare-fun b!843206 () Bool)

(declare-fun res!573028 () Bool)

(declare-fun e!470435 () Bool)

(assert (=> b!843206 (=> (not res!573028) (not e!470435))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843206 (= res!573028 (validMask!0 mask!1196))))

(declare-fun b!843207 () Bool)

(declare-fun e!470437 () Bool)

(declare-fun tp_is_empty!15693 () Bool)

(assert (=> b!843207 (= e!470437 tp_is_empty!15693)))

(declare-fun res!573027 () Bool)

(assert (=> start!72642 (=> (not res!573027) (not e!470435))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47644 0))(
  ( (array!47645 (arr!22853 (Array (_ BitVec 32) (_ BitVec 64))) (size!23293 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47644)

(assert (=> start!72642 (= res!573027 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23293 _keys!868))))))

(assert (=> start!72642 e!470435))

(assert (=> start!72642 true))

(declare-fun array_inv!18178 (array!47644) Bool)

(assert (=> start!72642 (array_inv!18178 _keys!868)))

(declare-datatypes ((V!25971 0))(
  ( (V!25972 (val!7894 Int)) )
))
(declare-datatypes ((ValueCell!7407 0))(
  ( (ValueCellFull!7407 (v!10319 V!25971)) (EmptyCell!7407) )
))
(declare-datatypes ((array!47646 0))(
  ( (array!47647 (arr!22854 (Array (_ BitVec 32) ValueCell!7407)) (size!23294 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47646)

(declare-fun e!470433 () Bool)

(declare-fun array_inv!18179 (array!47646) Bool)

(assert (=> start!72642 (and (array_inv!18179 _values!688) e!470433)))

(declare-fun mapIsEmpty!25139 () Bool)

(declare-fun mapRes!25139 () Bool)

(assert (=> mapIsEmpty!25139 mapRes!25139))

(declare-fun b!843208 () Bool)

(declare-fun e!470434 () Bool)

(assert (=> b!843208 (= e!470434 tp_is_empty!15693)))

(declare-fun mapNonEmpty!25139 () Bool)

(declare-fun tp!48457 () Bool)

(assert (=> mapNonEmpty!25139 (= mapRes!25139 (and tp!48457 e!470434))))

(declare-fun mapValue!25139 () ValueCell!7407)

(declare-fun mapKey!25139 () (_ BitVec 32))

(declare-fun mapRest!25139 () (Array (_ BitVec 32) ValueCell!7407))

(assert (=> mapNonEmpty!25139 (= (arr!22854 _values!688) (store mapRest!25139 mapKey!25139 mapValue!25139))))

(declare-fun b!843209 () Bool)

(assert (=> b!843209 (= e!470433 (and e!470437 mapRes!25139))))

(declare-fun condMapEmpty!25139 () Bool)

(declare-fun mapDefault!25139 () ValueCell!7407)

(assert (=> b!843209 (= condMapEmpty!25139 (= (arr!22854 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7407)) mapDefault!25139)))))

(declare-fun b!843210 () Bool)

(assert (=> b!843210 (= e!470435 false)))

(declare-fun lt!381106 () Bool)

(declare-datatypes ((List!16233 0))(
  ( (Nil!16230) (Cons!16229 (h!17360 (_ BitVec 64)) (t!22604 List!16233)) )
))
(declare-fun arrayNoDuplicates!0 (array!47644 (_ BitVec 32) List!16233) Bool)

(assert (=> b!843210 (= lt!381106 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16230))))

(declare-fun b!843211 () Bool)

(declare-fun res!573029 () Bool)

(assert (=> b!843211 (=> (not res!573029) (not e!470435))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843211 (= res!573029 (and (= (size!23294 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23293 _keys!868) (size!23294 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843212 () Bool)

(declare-fun res!573026 () Bool)

(assert (=> b!843212 (=> (not res!573026) (not e!470435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47644 (_ BitVec 32)) Bool)

(assert (=> b!843212 (= res!573026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72642 res!573027) b!843206))

(assert (= (and b!843206 res!573028) b!843211))

(assert (= (and b!843211 res!573029) b!843212))

(assert (= (and b!843212 res!573026) b!843210))

(assert (= (and b!843209 condMapEmpty!25139) mapIsEmpty!25139))

(assert (= (and b!843209 (not condMapEmpty!25139)) mapNonEmpty!25139))

(get-info :version)

(assert (= (and mapNonEmpty!25139 ((_ is ValueCellFull!7407) mapValue!25139)) b!843208))

(assert (= (and b!843209 ((_ is ValueCellFull!7407) mapDefault!25139)) b!843207))

(assert (= start!72642 b!843209))

(declare-fun m!785985 () Bool)

(assert (=> start!72642 m!785985))

(declare-fun m!785987 () Bool)

(assert (=> start!72642 m!785987))

(declare-fun m!785989 () Bool)

(assert (=> b!843206 m!785989))

(declare-fun m!785991 () Bool)

(assert (=> b!843212 m!785991))

(declare-fun m!785993 () Bool)

(assert (=> mapNonEmpty!25139 m!785993))

(declare-fun m!785995 () Bool)

(assert (=> b!843210 m!785995))

(check-sat tp_is_empty!15693 (not mapNonEmpty!25139) (not b!843210) (not b!843206) (not b!843212) (not start!72642))
(check-sat)
