; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72690 () Bool)

(assert start!72690)

(declare-fun res!573316 () Bool)

(declare-fun e!470797 () Bool)

(assert (=> start!72690 (=> (not res!573316) (not e!470797))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47728 0))(
  ( (array!47729 (arr!22895 (Array (_ BitVec 32) (_ BitVec 64))) (size!23335 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47728)

(assert (=> start!72690 (= res!573316 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23335 _keys!868))))))

(assert (=> start!72690 e!470797))

(assert (=> start!72690 true))

(declare-fun array_inv!18208 (array!47728) Bool)

(assert (=> start!72690 (array_inv!18208 _keys!868)))

(declare-datatypes ((V!26035 0))(
  ( (V!26036 (val!7918 Int)) )
))
(declare-datatypes ((ValueCell!7431 0))(
  ( (ValueCellFull!7431 (v!10343 V!26035)) (EmptyCell!7431) )
))
(declare-datatypes ((array!47730 0))(
  ( (array!47731 (arr!22896 (Array (_ BitVec 32) ValueCell!7431)) (size!23336 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47730)

(declare-fun e!470793 () Bool)

(declare-fun array_inv!18209 (array!47730) Bool)

(assert (=> start!72690 (and (array_inv!18209 _values!688) e!470793)))

(declare-fun b!843710 () Bool)

(assert (=> b!843710 (= e!470797 false)))

(declare-fun lt!381178 () Bool)

(declare-datatypes ((List!16246 0))(
  ( (Nil!16243) (Cons!16242 (h!17373 (_ BitVec 64)) (t!22617 List!16246)) )
))
(declare-fun arrayNoDuplicates!0 (array!47728 (_ BitVec 32) List!16246) Bool)

(assert (=> b!843710 (= lt!381178 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16243))))

(declare-fun b!843711 () Bool)

(declare-fun e!470795 () Bool)

(declare-fun tp_is_empty!15741 () Bool)

(assert (=> b!843711 (= e!470795 tp_is_empty!15741)))

(declare-fun mapIsEmpty!25211 () Bool)

(declare-fun mapRes!25211 () Bool)

(assert (=> mapIsEmpty!25211 mapRes!25211))

(declare-fun mapNonEmpty!25211 () Bool)

(declare-fun tp!48529 () Bool)

(assert (=> mapNonEmpty!25211 (= mapRes!25211 (and tp!48529 e!470795))))

(declare-fun mapValue!25211 () ValueCell!7431)

(declare-fun mapKey!25211 () (_ BitVec 32))

(declare-fun mapRest!25211 () (Array (_ BitVec 32) ValueCell!7431))

(assert (=> mapNonEmpty!25211 (= (arr!22896 _values!688) (store mapRest!25211 mapKey!25211 mapValue!25211))))

(declare-fun b!843712 () Bool)

(declare-fun res!573317 () Bool)

(assert (=> b!843712 (=> (not res!573317) (not e!470797))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47728 (_ BitVec 32)) Bool)

(assert (=> b!843712 (= res!573317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843713 () Bool)

(declare-fun res!573314 () Bool)

(assert (=> b!843713 (=> (not res!573314) (not e!470797))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843713 (= res!573314 (and (= (size!23336 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23335 _keys!868) (size!23336 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843714 () Bool)

(declare-fun res!573315 () Bool)

(assert (=> b!843714 (=> (not res!573315) (not e!470797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843714 (= res!573315 (validMask!0 mask!1196))))

(declare-fun b!843715 () Bool)

(declare-fun e!470796 () Bool)

(assert (=> b!843715 (= e!470793 (and e!470796 mapRes!25211))))

(declare-fun condMapEmpty!25211 () Bool)

(declare-fun mapDefault!25211 () ValueCell!7431)

(assert (=> b!843715 (= condMapEmpty!25211 (= (arr!22896 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7431)) mapDefault!25211)))))

(declare-fun b!843716 () Bool)

(assert (=> b!843716 (= e!470796 tp_is_empty!15741)))

(assert (= (and start!72690 res!573316) b!843714))

(assert (= (and b!843714 res!573315) b!843713))

(assert (= (and b!843713 res!573314) b!843712))

(assert (= (and b!843712 res!573317) b!843710))

(assert (= (and b!843715 condMapEmpty!25211) mapIsEmpty!25211))

(assert (= (and b!843715 (not condMapEmpty!25211)) mapNonEmpty!25211))

(get-info :version)

(assert (= (and mapNonEmpty!25211 ((_ is ValueCellFull!7431) mapValue!25211)) b!843711))

(assert (= (and b!843715 ((_ is ValueCellFull!7431) mapDefault!25211)) b!843716))

(assert (= start!72690 b!843715))

(declare-fun m!786273 () Bool)

(assert (=> b!843712 m!786273))

(declare-fun m!786275 () Bool)

(assert (=> b!843710 m!786275))

(declare-fun m!786277 () Bool)

(assert (=> mapNonEmpty!25211 m!786277))

(declare-fun m!786279 () Bool)

(assert (=> b!843714 m!786279))

(declare-fun m!786281 () Bool)

(assert (=> start!72690 m!786281))

(declare-fun m!786283 () Bool)

(assert (=> start!72690 m!786283))

(check-sat tp_is_empty!15741 (not b!843710) (not mapNonEmpty!25211) (not start!72690) (not b!843712) (not b!843714))
(check-sat)
