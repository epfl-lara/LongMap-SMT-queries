; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81988 () Bool)

(assert start!81988)

(declare-fun b!956275 () Bool)

(declare-fun res!640318 () Bool)

(declare-fun e!538809 () Bool)

(assert (=> b!956275 (=> (not res!640318) (not e!538809))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58153 0))(
  ( (array!58154 (arr!27956 (Array (_ BitVec 32) (_ BitVec 64))) (size!28435 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58153)

(declare-datatypes ((V!33019 0))(
  ( (V!33020 (val!10564 Int)) )
))
(declare-datatypes ((ValueCell!10032 0))(
  ( (ValueCellFull!10032 (v!13119 V!33019)) (EmptyCell!10032) )
))
(declare-datatypes ((array!58155 0))(
  ( (array!58156 (arr!27957 (Array (_ BitVec 32) ValueCell!10032)) (size!28436 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58155)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956275 (= res!640318 (and (= (size!28436 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28435 _keys!1441) (size!28436 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33502 () Bool)

(declare-fun mapRes!33502 () Bool)

(declare-fun tp!64080 () Bool)

(declare-fun e!538813 () Bool)

(assert (=> mapNonEmpty!33502 (= mapRes!33502 (and tp!64080 e!538813))))

(declare-fun mapValue!33502 () ValueCell!10032)

(declare-fun mapKey!33502 () (_ BitVec 32))

(declare-fun mapRest!33502 () (Array (_ BitVec 32) ValueCell!10032))

(assert (=> mapNonEmpty!33502 (= (arr!27957 _values!1197) (store mapRest!33502 mapKey!33502 mapValue!33502))))

(declare-fun b!956276 () Bool)

(declare-fun res!640320 () Bool)

(assert (=> b!956276 (=> (not res!640320) (not e!538809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58153 (_ BitVec 32)) Bool)

(assert (=> b!956276 (= res!640320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640319 () Bool)

(assert (=> start!81988 (=> (not res!640319) (not e!538809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81988 (= res!640319 (validMask!0 mask!1823))))

(assert (=> start!81988 e!538809))

(assert (=> start!81988 true))

(declare-fun e!538810 () Bool)

(declare-fun array_inv!21693 (array!58155) Bool)

(assert (=> start!81988 (and (array_inv!21693 _values!1197) e!538810)))

(declare-fun array_inv!21694 (array!58153) Bool)

(assert (=> start!81988 (array_inv!21694 _keys!1441)))

(declare-fun b!956277 () Bool)

(declare-fun e!538812 () Bool)

(assert (=> b!956277 (= e!538810 (and e!538812 mapRes!33502))))

(declare-fun condMapEmpty!33502 () Bool)

(declare-fun mapDefault!33502 () ValueCell!10032)

(assert (=> b!956277 (= condMapEmpty!33502 (= (arr!27957 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10032)) mapDefault!33502)))))

(declare-fun mapIsEmpty!33502 () Bool)

(assert (=> mapIsEmpty!33502 mapRes!33502))

(declare-fun b!956278 () Bool)

(declare-fun tp_is_empty!21027 () Bool)

(assert (=> b!956278 (= e!538812 tp_is_empty!21027)))

(declare-fun b!956279 () Bool)

(assert (=> b!956279 (= e!538809 false)))

(declare-fun lt!430118 () Bool)

(declare-datatypes ((List!19475 0))(
  ( (Nil!19472) (Cons!19471 (h!20633 (_ BitVec 64)) (t!27836 List!19475)) )
))
(declare-fun arrayNoDuplicates!0 (array!58153 (_ BitVec 32) List!19475) Bool)

(assert (=> b!956279 (= lt!430118 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19472))))

(declare-fun b!956280 () Bool)

(assert (=> b!956280 (= e!538813 tp_is_empty!21027)))

(assert (= (and start!81988 res!640319) b!956275))

(assert (= (and b!956275 res!640318) b!956276))

(assert (= (and b!956276 res!640320) b!956279))

(assert (= (and b!956277 condMapEmpty!33502) mapIsEmpty!33502))

(assert (= (and b!956277 (not condMapEmpty!33502)) mapNonEmpty!33502))

(get-info :version)

(assert (= (and mapNonEmpty!33502 ((_ is ValueCellFull!10032) mapValue!33502)) b!956280))

(assert (= (and b!956277 ((_ is ValueCellFull!10032) mapDefault!33502)) b!956278))

(assert (= start!81988 b!956277))

(declare-fun m!887609 () Bool)

(assert (=> mapNonEmpty!33502 m!887609))

(declare-fun m!887611 () Bool)

(assert (=> b!956276 m!887611))

(declare-fun m!887613 () Bool)

(assert (=> start!81988 m!887613))

(declare-fun m!887615 () Bool)

(assert (=> start!81988 m!887615))

(declare-fun m!887617 () Bool)

(assert (=> start!81988 m!887617))

(declare-fun m!887619 () Bool)

(assert (=> b!956279 m!887619))

(check-sat (not b!956279) (not b!956276) tp_is_empty!21027 (not mapNonEmpty!33502) (not start!81988))
(check-sat)
