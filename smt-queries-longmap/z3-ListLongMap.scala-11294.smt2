; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131670 () Bool)

(assert start!131670)

(declare-fun b!1541985 () Bool)

(declare-fun e!857750 () Bool)

(declare-fun tp_is_empty!37659 () Bool)

(assert (=> b!1541985 (= e!857750 tp_is_empty!37659)))

(declare-fun b!1541986 () Bool)

(declare-fun res!1058266 () Bool)

(declare-fun e!857753 () Bool)

(assert (=> b!1541986 (=> (not res!1058266) (not e!857753))))

(declare-datatypes ((array!102552 0))(
  ( (array!102553 (arr!49478 (Array (_ BitVec 32) (_ BitVec 64))) (size!50028 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102552)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58655 0))(
  ( (V!58656 (val!18907 Int)) )
))
(declare-datatypes ((ValueCell!17919 0))(
  ( (ValueCellFull!17919 (v!21708 V!58655)) (EmptyCell!17919) )
))
(declare-datatypes ((array!102554 0))(
  ( (array!102555 (arr!49479 (Array (_ BitVec 32) ValueCell!17919)) (size!50029 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102554)

(assert (=> b!1541986 (= res!1058266 (and (= (size!50029 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50028 _keys!618) (size!50029 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058267 () Bool)

(assert (=> start!131670 (=> (not res!1058267) (not e!857753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131670 (= res!1058267 (validMask!0 mask!926))))

(assert (=> start!131670 e!857753))

(assert (=> start!131670 true))

(declare-fun e!857754 () Bool)

(declare-fun array_inv!38497 (array!102554) Bool)

(assert (=> start!131670 (and (array_inv!38497 _values!470) e!857754)))

(declare-fun array_inv!38498 (array!102552) Bool)

(assert (=> start!131670 (array_inv!38498 _keys!618)))

(declare-fun b!1541987 () Bool)

(declare-fun e!857752 () Bool)

(declare-fun mapRes!58192 () Bool)

(assert (=> b!1541987 (= e!857754 (and e!857752 mapRes!58192))))

(declare-fun condMapEmpty!58192 () Bool)

(declare-fun mapDefault!58192 () ValueCell!17919)

(assert (=> b!1541987 (= condMapEmpty!58192 (= (arr!49479 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17919)) mapDefault!58192)))))

(declare-fun b!1541988 () Bool)

(assert (=> b!1541988 (= e!857753 false)))

(declare-fun lt!665741 () Bool)

(declare-datatypes ((List!35858 0))(
  ( (Nil!35855) (Cons!35854 (h!37299 (_ BitVec 64)) (t!50552 List!35858)) )
))
(declare-fun arrayNoDuplicates!0 (array!102552 (_ BitVec 32) List!35858) Bool)

(assert (=> b!1541988 (= lt!665741 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35855))))

(declare-fun mapNonEmpty!58192 () Bool)

(declare-fun tp!110719 () Bool)

(assert (=> mapNonEmpty!58192 (= mapRes!58192 (and tp!110719 e!857750))))

(declare-fun mapKey!58192 () (_ BitVec 32))

(declare-fun mapRest!58192 () (Array (_ BitVec 32) ValueCell!17919))

(declare-fun mapValue!58192 () ValueCell!17919)

(assert (=> mapNonEmpty!58192 (= (arr!49479 _values!470) (store mapRest!58192 mapKey!58192 mapValue!58192))))

(declare-fun b!1541989 () Bool)

(assert (=> b!1541989 (= e!857752 tp_is_empty!37659)))

(declare-fun b!1541990 () Bool)

(declare-fun res!1058268 () Bool)

(assert (=> b!1541990 (=> (not res!1058268) (not e!857753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102552 (_ BitVec 32)) Bool)

(assert (=> b!1541990 (= res!1058268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58192 () Bool)

(assert (=> mapIsEmpty!58192 mapRes!58192))

(assert (= (and start!131670 res!1058267) b!1541986))

(assert (= (and b!1541986 res!1058266) b!1541990))

(assert (= (and b!1541990 res!1058268) b!1541988))

(assert (= (and b!1541987 condMapEmpty!58192) mapIsEmpty!58192))

(assert (= (and b!1541987 (not condMapEmpty!58192)) mapNonEmpty!58192))

(get-info :version)

(assert (= (and mapNonEmpty!58192 ((_ is ValueCellFull!17919) mapValue!58192)) b!1541985))

(assert (= (and b!1541987 ((_ is ValueCellFull!17919) mapDefault!58192)) b!1541989))

(assert (= start!131670 b!1541987))

(declare-fun m!1423777 () Bool)

(assert (=> start!131670 m!1423777))

(declare-fun m!1423779 () Bool)

(assert (=> start!131670 m!1423779))

(declare-fun m!1423781 () Bool)

(assert (=> start!131670 m!1423781))

(declare-fun m!1423783 () Bool)

(assert (=> b!1541988 m!1423783))

(declare-fun m!1423785 () Bool)

(assert (=> mapNonEmpty!58192 m!1423785))

(declare-fun m!1423787 () Bool)

(assert (=> b!1541990 m!1423787))

(check-sat (not start!131670) (not b!1541988) tp_is_empty!37659 (not mapNonEmpty!58192) (not b!1541990))
(check-sat)
