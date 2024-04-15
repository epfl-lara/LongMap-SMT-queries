; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74104 () Bool)

(assert start!74104)

(declare-fun b!871745 () Bool)

(declare-fun e!485363 () Bool)

(declare-fun tp_is_empty!17161 () Bool)

(assert (=> b!871745 (= e!485363 tp_is_empty!17161)))

(declare-fun b!871746 () Bool)

(declare-fun res!592584 () Bool)

(declare-fun e!485367 () Bool)

(assert (=> b!871746 (=> (not res!592584) (not e!485367))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871746 (= res!592584 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27344 () Bool)

(declare-fun mapRes!27344 () Bool)

(declare-fun tp!52544 () Bool)

(declare-fun e!485364 () Bool)

(assert (=> mapNonEmpty!27344 (= mapRes!27344 (and tp!52544 e!485364))))

(declare-datatypes ((V!27929 0))(
  ( (V!27930 (val!8628 Int)) )
))
(declare-datatypes ((ValueCell!8141 0))(
  ( (ValueCellFull!8141 (v!11047 V!27929)) (EmptyCell!8141) )
))
(declare-fun mapValue!27344 () ValueCell!8141)

(declare-fun mapKey!27344 () (_ BitVec 32))

(declare-fun mapRest!27344 () (Array (_ BitVec 32) ValueCell!8141))

(declare-datatypes ((array!50449 0))(
  ( (array!50450 (arr!24255 (Array (_ BitVec 32) ValueCell!8141)) (size!24697 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50449)

(assert (=> mapNonEmpty!27344 (= (arr!24255 _values!688) (store mapRest!27344 mapKey!27344 mapValue!27344))))

(declare-fun b!871747 () Bool)

(declare-fun e!485365 () Bool)

(assert (=> b!871747 (= e!485365 (and e!485363 mapRes!27344))))

(declare-fun condMapEmpty!27344 () Bool)

(declare-fun mapDefault!27344 () ValueCell!8141)

(assert (=> b!871747 (= condMapEmpty!27344 (= (arr!24255 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8141)) mapDefault!27344)))))

(declare-fun b!871748 () Bool)

(assert (=> b!871748 (= e!485364 tp_is_empty!17161)))

(declare-fun b!871749 () Bool)

(declare-fun res!592586 () Bool)

(assert (=> b!871749 (=> (not res!592586) (not e!485367))))

(declare-datatypes ((array!50451 0))(
  ( (array!50452 (arr!24256 (Array (_ BitVec 32) (_ BitVec 64))) (size!24698 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50451)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50451 (_ BitVec 32)) Bool)

(assert (=> b!871749 (= res!592586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871750 () Bool)

(declare-fun res!592585 () Bool)

(assert (=> b!871750 (=> (not res!592585) (not e!485367))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871750 (= res!592585 (and (= (size!24697 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24698 _keys!868) (size!24697 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871751 () Bool)

(assert (=> b!871751 (= e!485367 false)))

(declare-fun lt!395321 () Bool)

(declare-datatypes ((List!17254 0))(
  ( (Nil!17251) (Cons!17250 (h!18381 (_ BitVec 64)) (t!24282 List!17254)) )
))
(declare-fun arrayNoDuplicates!0 (array!50451 (_ BitVec 32) List!17254) Bool)

(assert (=> b!871751 (= lt!395321 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17251))))

(declare-fun mapIsEmpty!27344 () Bool)

(assert (=> mapIsEmpty!27344 mapRes!27344))

(declare-fun res!592587 () Bool)

(assert (=> start!74104 (=> (not res!592587) (not e!485367))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74104 (= res!592587 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24698 _keys!868))))))

(assert (=> start!74104 e!485367))

(assert (=> start!74104 true))

(declare-fun array_inv!19212 (array!50451) Bool)

(assert (=> start!74104 (array_inv!19212 _keys!868)))

(declare-fun array_inv!19213 (array!50449) Bool)

(assert (=> start!74104 (and (array_inv!19213 _values!688) e!485365)))

(assert (= (and start!74104 res!592587) b!871746))

(assert (= (and b!871746 res!592584) b!871750))

(assert (= (and b!871750 res!592585) b!871749))

(assert (= (and b!871749 res!592586) b!871751))

(assert (= (and b!871747 condMapEmpty!27344) mapIsEmpty!27344))

(assert (= (and b!871747 (not condMapEmpty!27344)) mapNonEmpty!27344))

(get-info :version)

(assert (= (and mapNonEmpty!27344 ((_ is ValueCellFull!8141) mapValue!27344)) b!871748))

(assert (= (and b!871747 ((_ is ValueCellFull!8141) mapDefault!27344)) b!871745))

(assert (= start!74104 b!871747))

(declare-fun m!812241 () Bool)

(assert (=> b!871746 m!812241))

(declare-fun m!812243 () Bool)

(assert (=> mapNonEmpty!27344 m!812243))

(declare-fun m!812245 () Bool)

(assert (=> b!871749 m!812245))

(declare-fun m!812247 () Bool)

(assert (=> b!871751 m!812247))

(declare-fun m!812249 () Bool)

(assert (=> start!74104 m!812249))

(declare-fun m!812251 () Bool)

(assert (=> start!74104 m!812251))

(check-sat tp_is_empty!17161 (not mapNonEmpty!27344) (not b!871749) (not start!74104) (not b!871751) (not b!871746))
(check-sat)
