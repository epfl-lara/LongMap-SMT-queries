; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72730 () Bool)

(assert start!72730)

(declare-fun b!843269 () Bool)

(declare-fun e!470415 () Bool)

(assert (=> b!843269 (= e!470415 false)))

(declare-fun lt!381347 () Bool)

(declare-datatypes ((array!47519 0))(
  ( (array!47520 (arr!22786 (Array (_ BitVec 32) (_ BitVec 64))) (size!23227 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47519)

(declare-datatypes ((List!16131 0))(
  ( (Nil!16128) (Cons!16127 (h!17264 (_ BitVec 64)) (t!22494 List!16131)) )
))
(declare-fun arrayNoDuplicates!0 (array!47519 (_ BitVec 32) List!16131) Bool)

(assert (=> b!843269 (= lt!381347 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16128))))

(declare-fun b!843271 () Bool)

(declare-fun e!470416 () Bool)

(declare-fun e!470417 () Bool)

(declare-fun mapRes!25019 () Bool)

(assert (=> b!843271 (= e!470416 (and e!470417 mapRes!25019))))

(declare-fun condMapEmpty!25019 () Bool)

(declare-datatypes ((V!25865 0))(
  ( (V!25866 (val!7854 Int)) )
))
(declare-datatypes ((ValueCell!7367 0))(
  ( (ValueCellFull!7367 (v!10279 V!25865)) (EmptyCell!7367) )
))
(declare-datatypes ((array!47521 0))(
  ( (array!47522 (arr!22787 (Array (_ BitVec 32) ValueCell!7367)) (size!23228 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47521)

(declare-fun mapDefault!25019 () ValueCell!7367)

(assert (=> b!843271 (= condMapEmpty!25019 (= (arr!22787 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7367)) mapDefault!25019)))))

(declare-fun b!843272 () Bool)

(declare-fun res!572893 () Bool)

(assert (=> b!843272 (=> (not res!572893) (not e!470415))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47519 (_ BitVec 32)) Bool)

(assert (=> b!843272 (= res!572893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25019 () Bool)

(declare-fun tp!48338 () Bool)

(declare-fun e!470419 () Bool)

(assert (=> mapNonEmpty!25019 (= mapRes!25019 (and tp!48338 e!470419))))

(declare-fun mapKey!25019 () (_ BitVec 32))

(declare-fun mapRest!25019 () (Array (_ BitVec 32) ValueCell!7367))

(declare-fun mapValue!25019 () ValueCell!7367)

(assert (=> mapNonEmpty!25019 (= (arr!22787 _values!688) (store mapRest!25019 mapKey!25019 mapValue!25019))))

(declare-fun b!843273 () Bool)

(declare-fun res!572890 () Bool)

(assert (=> b!843273 (=> (not res!572890) (not e!470415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843273 (= res!572890 (validMask!0 mask!1196))))

(declare-fun b!843274 () Bool)

(declare-fun tp_is_empty!15613 () Bool)

(assert (=> b!843274 (= e!470419 tp_is_empty!15613)))

(declare-fun b!843270 () Bool)

(declare-fun res!572891 () Bool)

(assert (=> b!843270 (=> (not res!572891) (not e!470415))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843270 (= res!572891 (and (= (size!23228 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23227 _keys!868) (size!23228 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572892 () Bool)

(assert (=> start!72730 (=> (not res!572892) (not e!470415))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72730 (= res!572892 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23227 _keys!868))))))

(assert (=> start!72730 e!470415))

(assert (=> start!72730 true))

(declare-fun array_inv!18178 (array!47519) Bool)

(assert (=> start!72730 (array_inv!18178 _keys!868)))

(declare-fun array_inv!18179 (array!47521) Bool)

(assert (=> start!72730 (and (array_inv!18179 _values!688) e!470416)))

(declare-fun mapIsEmpty!25019 () Bool)

(assert (=> mapIsEmpty!25019 mapRes!25019))

(declare-fun b!843275 () Bool)

(assert (=> b!843275 (= e!470417 tp_is_empty!15613)))

(assert (= (and start!72730 res!572892) b!843273))

(assert (= (and b!843273 res!572890) b!843270))

(assert (= (and b!843270 res!572891) b!843272))

(assert (= (and b!843272 res!572893) b!843269))

(assert (= (and b!843271 condMapEmpty!25019) mapIsEmpty!25019))

(assert (= (and b!843271 (not condMapEmpty!25019)) mapNonEmpty!25019))

(get-info :version)

(assert (= (and mapNonEmpty!25019 ((_ is ValueCellFull!7367) mapValue!25019)) b!843274))

(assert (= (and b!843271 ((_ is ValueCellFull!7367) mapDefault!25019)) b!843275))

(assert (= start!72730 b!843271))

(declare-fun m!786797 () Bool)

(assert (=> b!843269 m!786797))

(declare-fun m!786799 () Bool)

(assert (=> mapNonEmpty!25019 m!786799))

(declare-fun m!786801 () Bool)

(assert (=> b!843273 m!786801))

(declare-fun m!786803 () Bool)

(assert (=> b!843272 m!786803))

(declare-fun m!786805 () Bool)

(assert (=> start!72730 m!786805))

(declare-fun m!786807 () Bool)

(assert (=> start!72730 m!786807))

(check-sat (not b!843272) (not mapNonEmpty!25019) (not b!843273) (not start!72730) tp_is_empty!15613 (not b!843269))
(check-sat)
