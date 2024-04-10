; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74094 () Bool)

(assert start!74094)

(declare-fun b!871754 () Bool)

(declare-fun res!592557 () Bool)

(declare-fun e!485365 () Bool)

(assert (=> b!871754 (=> (not res!592557) (not e!485365))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50428 0))(
  ( (array!50429 (arr!24245 (Array (_ BitVec 32) (_ BitVec 64))) (size!24685 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50428)

(declare-datatypes ((V!27907 0))(
  ( (V!27908 (val!8620 Int)) )
))
(declare-datatypes ((ValueCell!8133 0))(
  ( (ValueCellFull!8133 (v!11045 V!27907)) (EmptyCell!8133) )
))
(declare-datatypes ((array!50430 0))(
  ( (array!50431 (arr!24246 (Array (_ BitVec 32) ValueCell!8133)) (size!24686 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50430)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!871754 (= res!592557 (and (= (size!24686 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24685 _keys!868) (size!24686 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27317 () Bool)

(declare-fun mapRes!27317 () Bool)

(assert (=> mapIsEmpty!27317 mapRes!27317))

(declare-fun b!871755 () Bool)

(declare-fun e!485364 () Bool)

(declare-fun tp_is_empty!17145 () Bool)

(assert (=> b!871755 (= e!485364 tp_is_empty!17145)))

(declare-fun mapNonEmpty!27317 () Bool)

(declare-fun tp!52516 () Bool)

(assert (=> mapNonEmpty!27317 (= mapRes!27317 (and tp!52516 e!485364))))

(declare-fun mapRest!27317 () (Array (_ BitVec 32) ValueCell!8133))

(declare-fun mapValue!27317 () ValueCell!8133)

(declare-fun mapKey!27317 () (_ BitVec 32))

(assert (=> mapNonEmpty!27317 (= (arr!24246 _values!688) (store mapRest!27317 mapKey!27317 mapValue!27317))))

(declare-fun b!871756 () Bool)

(declare-fun res!592558 () Bool)

(assert (=> b!871756 (=> (not res!592558) (not e!485365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871756 (= res!592558 (validMask!0 mask!1196))))

(declare-fun b!871757 () Bool)

(assert (=> b!871757 (= e!485365 false)))

(declare-fun lt!395533 () Bool)

(declare-datatypes ((List!17243 0))(
  ( (Nil!17240) (Cons!17239 (h!18370 (_ BitVec 64)) (t!24280 List!17243)) )
))
(declare-fun arrayNoDuplicates!0 (array!50428 (_ BitVec 32) List!17243) Bool)

(assert (=> b!871757 (= lt!395533 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17240))))

(declare-fun b!871758 () Bool)

(declare-fun e!485366 () Bool)

(declare-fun e!485367 () Bool)

(assert (=> b!871758 (= e!485366 (and e!485367 mapRes!27317))))

(declare-fun condMapEmpty!27317 () Bool)

(declare-fun mapDefault!27317 () ValueCell!8133)

(assert (=> b!871758 (= condMapEmpty!27317 (= (arr!24246 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8133)) mapDefault!27317)))))

(declare-fun b!871759 () Bool)

(assert (=> b!871759 (= e!485367 tp_is_empty!17145)))

(declare-fun res!592559 () Bool)

(assert (=> start!74094 (=> (not res!592559) (not e!485365))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74094 (= res!592559 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24685 _keys!868))))))

(assert (=> start!74094 e!485365))

(assert (=> start!74094 true))

(declare-fun array_inv!19142 (array!50428) Bool)

(assert (=> start!74094 (array_inv!19142 _keys!868)))

(declare-fun array_inv!19143 (array!50430) Bool)

(assert (=> start!74094 (and (array_inv!19143 _values!688) e!485366)))

(declare-fun b!871760 () Bool)

(declare-fun res!592556 () Bool)

(assert (=> b!871760 (=> (not res!592556) (not e!485365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50428 (_ BitVec 32)) Bool)

(assert (=> b!871760 (= res!592556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74094 res!592559) b!871756))

(assert (= (and b!871756 res!592558) b!871754))

(assert (= (and b!871754 res!592557) b!871760))

(assert (= (and b!871760 res!592556) b!871757))

(assert (= (and b!871758 condMapEmpty!27317) mapIsEmpty!27317))

(assert (= (and b!871758 (not condMapEmpty!27317)) mapNonEmpty!27317))

(get-info :version)

(assert (= (and mapNonEmpty!27317 ((_ is ValueCellFull!8133) mapValue!27317)) b!871755))

(assert (= (and b!871758 ((_ is ValueCellFull!8133) mapDefault!27317)) b!871759))

(assert (= start!74094 b!871758))

(declare-fun m!812873 () Bool)

(assert (=> b!871756 m!812873))

(declare-fun m!812875 () Bool)

(assert (=> start!74094 m!812875))

(declare-fun m!812877 () Bool)

(assert (=> start!74094 m!812877))

(declare-fun m!812879 () Bool)

(assert (=> b!871757 m!812879))

(declare-fun m!812881 () Bool)

(assert (=> b!871760 m!812881))

(declare-fun m!812883 () Bool)

(assert (=> mapNonEmpty!27317 m!812883))

(check-sat tp_is_empty!17145 (not mapNonEmpty!27317) (not b!871760) (not b!871757) (not start!74094) (not b!871756))
(check-sat)
