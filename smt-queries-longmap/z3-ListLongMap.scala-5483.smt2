; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72684 () Bool)

(assert start!72684)

(declare-fun res!573280 () Bool)

(declare-fun e!470751 () Bool)

(assert (=> start!72684 (=> (not res!573280) (not e!470751))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47716 0))(
  ( (array!47717 (arr!22889 (Array (_ BitVec 32) (_ BitVec 64))) (size!23329 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47716)

(assert (=> start!72684 (= res!573280 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23329 _keys!868))))))

(assert (=> start!72684 e!470751))

(assert (=> start!72684 true))

(declare-fun array_inv!18202 (array!47716) Bool)

(assert (=> start!72684 (array_inv!18202 _keys!868)))

(declare-datatypes ((V!26027 0))(
  ( (V!26028 (val!7915 Int)) )
))
(declare-datatypes ((ValueCell!7428 0))(
  ( (ValueCellFull!7428 (v!10340 V!26027)) (EmptyCell!7428) )
))
(declare-datatypes ((array!47718 0))(
  ( (array!47719 (arr!22890 (Array (_ BitVec 32) ValueCell!7428)) (size!23330 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47718)

(declare-fun e!470749 () Bool)

(declare-fun array_inv!18203 (array!47718) Bool)

(assert (=> start!72684 (and (array_inv!18203 _values!688) e!470749)))

(declare-fun b!843647 () Bool)

(assert (=> b!843647 (= e!470751 false)))

(declare-fun lt!381169 () Bool)

(declare-datatypes ((List!16244 0))(
  ( (Nil!16241) (Cons!16240 (h!17371 (_ BitVec 64)) (t!22615 List!16244)) )
))
(declare-fun arrayNoDuplicates!0 (array!47716 (_ BitVec 32) List!16244) Bool)

(assert (=> b!843647 (= lt!381169 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16241))))

(declare-fun b!843648 () Bool)

(declare-fun res!573281 () Bool)

(assert (=> b!843648 (=> (not res!573281) (not e!470751))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!843648 (= res!573281 (and (= (size!23330 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23329 _keys!868) (size!23330 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843649 () Bool)

(declare-fun e!470752 () Bool)

(declare-fun tp_is_empty!15735 () Bool)

(assert (=> b!843649 (= e!470752 tp_is_empty!15735)))

(declare-fun b!843650 () Bool)

(declare-fun e!470748 () Bool)

(declare-fun mapRes!25202 () Bool)

(assert (=> b!843650 (= e!470749 (and e!470748 mapRes!25202))))

(declare-fun condMapEmpty!25202 () Bool)

(declare-fun mapDefault!25202 () ValueCell!7428)

(assert (=> b!843650 (= condMapEmpty!25202 (= (arr!22890 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7428)) mapDefault!25202)))))

(declare-fun mapIsEmpty!25202 () Bool)

(assert (=> mapIsEmpty!25202 mapRes!25202))

(declare-fun b!843651 () Bool)

(assert (=> b!843651 (= e!470748 tp_is_empty!15735)))

(declare-fun mapNonEmpty!25202 () Bool)

(declare-fun tp!48520 () Bool)

(assert (=> mapNonEmpty!25202 (= mapRes!25202 (and tp!48520 e!470752))))

(declare-fun mapRest!25202 () (Array (_ BitVec 32) ValueCell!7428))

(declare-fun mapValue!25202 () ValueCell!7428)

(declare-fun mapKey!25202 () (_ BitVec 32))

(assert (=> mapNonEmpty!25202 (= (arr!22890 _values!688) (store mapRest!25202 mapKey!25202 mapValue!25202))))

(declare-fun b!843652 () Bool)

(declare-fun res!573279 () Bool)

(assert (=> b!843652 (=> (not res!573279) (not e!470751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47716 (_ BitVec 32)) Bool)

(assert (=> b!843652 (= res!573279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843653 () Bool)

(declare-fun res!573278 () Bool)

(assert (=> b!843653 (=> (not res!573278) (not e!470751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843653 (= res!573278 (validMask!0 mask!1196))))

(assert (= (and start!72684 res!573280) b!843653))

(assert (= (and b!843653 res!573278) b!843648))

(assert (= (and b!843648 res!573281) b!843652))

(assert (= (and b!843652 res!573279) b!843647))

(assert (= (and b!843650 condMapEmpty!25202) mapIsEmpty!25202))

(assert (= (and b!843650 (not condMapEmpty!25202)) mapNonEmpty!25202))

(get-info :version)

(assert (= (and mapNonEmpty!25202 ((_ is ValueCellFull!7428) mapValue!25202)) b!843649))

(assert (= (and b!843650 ((_ is ValueCellFull!7428) mapDefault!25202)) b!843651))

(assert (= start!72684 b!843650))

(declare-fun m!786237 () Bool)

(assert (=> start!72684 m!786237))

(declare-fun m!786239 () Bool)

(assert (=> start!72684 m!786239))

(declare-fun m!786241 () Bool)

(assert (=> mapNonEmpty!25202 m!786241))

(declare-fun m!786243 () Bool)

(assert (=> b!843647 m!786243))

(declare-fun m!786245 () Bool)

(assert (=> b!843653 m!786245))

(declare-fun m!786247 () Bool)

(assert (=> b!843652 m!786247))

(check-sat (not b!843653) (not b!843652) (not mapNonEmpty!25202) (not b!843647) (not start!72684) tp_is_empty!15735)
(check-sat)
