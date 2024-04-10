; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72648 () Bool)

(assert start!72648)

(declare-fun b!843269 () Bool)

(declare-fun e!470478 () Bool)

(declare-fun tp_is_empty!15699 () Bool)

(assert (=> b!843269 (= e!470478 tp_is_empty!15699)))

(declare-fun b!843270 () Bool)

(declare-fun e!470480 () Bool)

(assert (=> b!843270 (= e!470480 false)))

(declare-fun lt!381115 () Bool)

(declare-datatypes ((array!47654 0))(
  ( (array!47655 (arr!22858 (Array (_ BitVec 32) (_ BitVec 64))) (size!23298 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47654)

(declare-datatypes ((List!16234 0))(
  ( (Nil!16231) (Cons!16230 (h!17361 (_ BitVec 64)) (t!22605 List!16234)) )
))
(declare-fun arrayNoDuplicates!0 (array!47654 (_ BitVec 32) List!16234) Bool)

(assert (=> b!843270 (= lt!381115 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16231))))

(declare-fun b!843271 () Bool)

(declare-fun res!573064 () Bool)

(assert (=> b!843271 (=> (not res!573064) (not e!470480))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843271 (= res!573064 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25148 () Bool)

(declare-fun mapRes!25148 () Bool)

(assert (=> mapIsEmpty!25148 mapRes!25148))

(declare-fun b!843272 () Bool)

(declare-fun e!470482 () Bool)

(assert (=> b!843272 (= e!470482 (and e!470478 mapRes!25148))))

(declare-fun condMapEmpty!25148 () Bool)

(declare-datatypes ((V!25979 0))(
  ( (V!25980 (val!7897 Int)) )
))
(declare-datatypes ((ValueCell!7410 0))(
  ( (ValueCellFull!7410 (v!10322 V!25979)) (EmptyCell!7410) )
))
(declare-datatypes ((array!47656 0))(
  ( (array!47657 (arr!22859 (Array (_ BitVec 32) ValueCell!7410)) (size!23299 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47656)

(declare-fun mapDefault!25148 () ValueCell!7410)

(assert (=> b!843272 (= condMapEmpty!25148 (= (arr!22859 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7410)) mapDefault!25148)))))

(declare-fun b!843273 () Bool)

(declare-fun res!573063 () Bool)

(assert (=> b!843273 (=> (not res!573063) (not e!470480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47654 (_ BitVec 32)) Bool)

(assert (=> b!843273 (= res!573063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573062 () Bool)

(assert (=> start!72648 (=> (not res!573062) (not e!470480))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72648 (= res!573062 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23298 _keys!868))))))

(assert (=> start!72648 e!470480))

(assert (=> start!72648 true))

(declare-fun array_inv!18180 (array!47654) Bool)

(assert (=> start!72648 (array_inv!18180 _keys!868)))

(declare-fun array_inv!18181 (array!47656) Bool)

(assert (=> start!72648 (and (array_inv!18181 _values!688) e!470482)))

(declare-fun b!843274 () Bool)

(declare-fun e!470479 () Bool)

(assert (=> b!843274 (= e!470479 tp_is_empty!15699)))

(declare-fun mapNonEmpty!25148 () Bool)

(declare-fun tp!48466 () Bool)

(assert (=> mapNonEmpty!25148 (= mapRes!25148 (and tp!48466 e!470479))))

(declare-fun mapKey!25148 () (_ BitVec 32))

(declare-fun mapRest!25148 () (Array (_ BitVec 32) ValueCell!7410))

(declare-fun mapValue!25148 () ValueCell!7410)

(assert (=> mapNonEmpty!25148 (= (arr!22859 _values!688) (store mapRest!25148 mapKey!25148 mapValue!25148))))

(declare-fun b!843275 () Bool)

(declare-fun res!573065 () Bool)

(assert (=> b!843275 (=> (not res!573065) (not e!470480))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843275 (= res!573065 (and (= (size!23299 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23298 _keys!868) (size!23299 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72648 res!573062) b!843271))

(assert (= (and b!843271 res!573064) b!843275))

(assert (= (and b!843275 res!573065) b!843273))

(assert (= (and b!843273 res!573063) b!843270))

(assert (= (and b!843272 condMapEmpty!25148) mapIsEmpty!25148))

(assert (= (and b!843272 (not condMapEmpty!25148)) mapNonEmpty!25148))

(get-info :version)

(assert (= (and mapNonEmpty!25148 ((_ is ValueCellFull!7410) mapValue!25148)) b!843274))

(assert (= (and b!843272 ((_ is ValueCellFull!7410) mapDefault!25148)) b!843269))

(assert (= start!72648 b!843272))

(declare-fun m!786021 () Bool)

(assert (=> b!843273 m!786021))

(declare-fun m!786023 () Bool)

(assert (=> mapNonEmpty!25148 m!786023))

(declare-fun m!786025 () Bool)

(assert (=> b!843271 m!786025))

(declare-fun m!786027 () Bool)

(assert (=> b!843270 m!786027))

(declare-fun m!786029 () Bool)

(assert (=> start!72648 m!786029))

(declare-fun m!786031 () Bool)

(assert (=> start!72648 m!786031))

(check-sat (not mapNonEmpty!25148) (not b!843271) tp_is_empty!15699 (not b!843270) (not start!72648) (not b!843273))
(check-sat)
