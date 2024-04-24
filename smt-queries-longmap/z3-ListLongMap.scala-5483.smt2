; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72850 () Bool)

(assert start!72850)

(declare-fun b!844529 () Bool)

(declare-fun e!471319 () Bool)

(assert (=> b!844529 (= e!471319 false)))

(declare-fun lt!381527 () Bool)

(declare-datatypes ((array!47747 0))(
  ( (array!47748 (arr!22900 (Array (_ BitVec 32) (_ BitVec 64))) (size!23341 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47747)

(declare-datatypes ((List!16173 0))(
  ( (Nil!16170) (Cons!16169 (h!17306 (_ BitVec 64)) (t!22536 List!16173)) )
))
(declare-fun arrayNoDuplicates!0 (array!47747 (_ BitVec 32) List!16173) Bool)

(assert (=> b!844529 (= lt!381527 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16170))))

(declare-fun b!844530 () Bool)

(declare-fun res!573610 () Bool)

(assert (=> b!844530 (=> (not res!573610) (not e!471319))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26025 0))(
  ( (V!26026 (val!7914 Int)) )
))
(declare-datatypes ((ValueCell!7427 0))(
  ( (ValueCellFull!7427 (v!10339 V!26025)) (EmptyCell!7427) )
))
(declare-datatypes ((array!47749 0))(
  ( (array!47750 (arr!22901 (Array (_ BitVec 32) ValueCell!7427)) (size!23342 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47749)

(assert (=> b!844530 (= res!573610 (and (= (size!23342 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23341 _keys!868) (size!23342 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844531 () Bool)

(declare-fun res!573611 () Bool)

(assert (=> b!844531 (=> (not res!573611) (not e!471319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47747 (_ BitVec 32)) Bool)

(assert (=> b!844531 (= res!573611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844532 () Bool)

(declare-fun e!471315 () Bool)

(declare-fun tp_is_empty!15733 () Bool)

(assert (=> b!844532 (= e!471315 tp_is_empty!15733)))

(declare-fun mapNonEmpty!25199 () Bool)

(declare-fun mapRes!25199 () Bool)

(declare-fun tp!48518 () Bool)

(declare-fun e!471317 () Bool)

(assert (=> mapNonEmpty!25199 (= mapRes!25199 (and tp!48518 e!471317))))

(declare-fun mapValue!25199 () ValueCell!7427)

(declare-fun mapRest!25199 () (Array (_ BitVec 32) ValueCell!7427))

(declare-fun mapKey!25199 () (_ BitVec 32))

(assert (=> mapNonEmpty!25199 (= (arr!22901 _values!688) (store mapRest!25199 mapKey!25199 mapValue!25199))))

(declare-fun mapIsEmpty!25199 () Bool)

(assert (=> mapIsEmpty!25199 mapRes!25199))

(declare-fun res!573613 () Bool)

(assert (=> start!72850 (=> (not res!573613) (not e!471319))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72850 (= res!573613 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23341 _keys!868))))))

(assert (=> start!72850 e!471319))

(assert (=> start!72850 true))

(declare-fun array_inv!18266 (array!47747) Bool)

(assert (=> start!72850 (array_inv!18266 _keys!868)))

(declare-fun e!471318 () Bool)

(declare-fun array_inv!18267 (array!47749) Bool)

(assert (=> start!72850 (and (array_inv!18267 _values!688) e!471318)))

(declare-fun b!844533 () Bool)

(declare-fun res!573612 () Bool)

(assert (=> b!844533 (=> (not res!573612) (not e!471319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844533 (= res!573612 (validMask!0 mask!1196))))

(declare-fun b!844534 () Bool)

(assert (=> b!844534 (= e!471318 (and e!471315 mapRes!25199))))

(declare-fun condMapEmpty!25199 () Bool)

(declare-fun mapDefault!25199 () ValueCell!7427)

(assert (=> b!844534 (= condMapEmpty!25199 (= (arr!22901 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7427)) mapDefault!25199)))))

(declare-fun b!844535 () Bool)

(assert (=> b!844535 (= e!471317 tp_is_empty!15733)))

(assert (= (and start!72850 res!573613) b!844533))

(assert (= (and b!844533 res!573612) b!844530))

(assert (= (and b!844530 res!573610) b!844531))

(assert (= (and b!844531 res!573611) b!844529))

(assert (= (and b!844534 condMapEmpty!25199) mapIsEmpty!25199))

(assert (= (and b!844534 (not condMapEmpty!25199)) mapNonEmpty!25199))

(get-info :version)

(assert (= (and mapNonEmpty!25199 ((_ is ValueCellFull!7427) mapValue!25199)) b!844535))

(assert (= (and b!844534 ((_ is ValueCellFull!7427) mapDefault!25199)) b!844532))

(assert (= start!72850 b!844534))

(declare-fun m!787517 () Bool)

(assert (=> mapNonEmpty!25199 m!787517))

(declare-fun m!787519 () Bool)

(assert (=> b!844531 m!787519))

(declare-fun m!787521 () Bool)

(assert (=> start!72850 m!787521))

(declare-fun m!787523 () Bool)

(assert (=> start!72850 m!787523))

(declare-fun m!787525 () Bool)

(assert (=> b!844529 m!787525))

(declare-fun m!787527 () Bool)

(assert (=> b!844533 m!787527))

(check-sat (not b!844531) (not start!72850) (not b!844533) (not mapNonEmpty!25199) tp_is_empty!15733 (not b!844529))
(check-sat)
