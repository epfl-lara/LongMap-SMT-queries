; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74148 () Bool)

(assert start!74148)

(declare-fun mapIsEmpty!27383 () Bool)

(declare-fun mapRes!27383 () Bool)

(assert (=> mapIsEmpty!27383 mapRes!27383))

(declare-fun b!872257 () Bool)

(declare-fun e!485709 () Bool)

(declare-fun tp_is_empty!17187 () Bool)

(assert (=> b!872257 (= e!485709 tp_is_empty!17187)))

(declare-fun b!872258 () Bool)

(declare-fun e!485710 () Bool)

(declare-fun e!485708 () Bool)

(assert (=> b!872258 (= e!485710 (and e!485708 mapRes!27383))))

(declare-fun condMapEmpty!27383 () Bool)

(declare-datatypes ((V!27963 0))(
  ( (V!27964 (val!8641 Int)) )
))
(declare-datatypes ((ValueCell!8154 0))(
  ( (ValueCellFull!8154 (v!11066 V!27963)) (EmptyCell!8154) )
))
(declare-datatypes ((array!50508 0))(
  ( (array!50509 (arr!24284 (Array (_ BitVec 32) ValueCell!8154)) (size!24724 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50508)

(declare-fun mapDefault!27383 () ValueCell!8154)

(assert (=> b!872258 (= condMapEmpty!27383 (= (arr!24284 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8154)) mapDefault!27383)))))

(declare-fun mapNonEmpty!27383 () Bool)

(declare-fun tp!52582 () Bool)

(assert (=> mapNonEmpty!27383 (= mapRes!27383 (and tp!52582 e!485709))))

(declare-fun mapRest!27383 () (Array (_ BitVec 32) ValueCell!8154))

(declare-fun mapKey!27383 () (_ BitVec 32))

(declare-fun mapValue!27383 () ValueCell!8154)

(assert (=> mapNonEmpty!27383 (= (arr!24284 _values!688) (store mapRest!27383 mapKey!27383 mapValue!27383))))

(declare-fun b!872260 () Bool)

(declare-fun res!592852 () Bool)

(declare-fun e!485707 () Bool)

(assert (=> b!872260 (=> (not res!592852) (not e!485707))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50510 0))(
  ( (array!50511 (arr!24285 (Array (_ BitVec 32) (_ BitVec 64))) (size!24725 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50510)

(assert (=> b!872260 (= res!592852 (and (= (size!24724 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24725 _keys!868) (size!24724 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872261 () Bool)

(declare-fun res!592850 () Bool)

(assert (=> b!872261 (=> (not res!592850) (not e!485707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872261 (= res!592850 (validMask!0 mask!1196))))

(declare-fun b!872262 () Bool)

(assert (=> b!872262 (= e!485707 false)))

(declare-fun lt!395596 () Bool)

(declare-datatypes ((List!17257 0))(
  ( (Nil!17254) (Cons!17253 (h!18384 (_ BitVec 64)) (t!24294 List!17257)) )
))
(declare-fun arrayNoDuplicates!0 (array!50510 (_ BitVec 32) List!17257) Bool)

(assert (=> b!872262 (= lt!395596 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17254))))

(declare-fun b!872263 () Bool)

(assert (=> b!872263 (= e!485708 tp_is_empty!17187)))

(declare-fun b!872259 () Bool)

(declare-fun res!592851 () Bool)

(assert (=> b!872259 (=> (not res!592851) (not e!485707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50510 (_ BitVec 32)) Bool)

(assert (=> b!872259 (= res!592851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592853 () Bool)

(assert (=> start!74148 (=> (not res!592853) (not e!485707))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74148 (= res!592853 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24725 _keys!868))))))

(assert (=> start!74148 e!485707))

(assert (=> start!74148 true))

(declare-fun array_inv!19174 (array!50510) Bool)

(assert (=> start!74148 (array_inv!19174 _keys!868)))

(declare-fun array_inv!19175 (array!50508) Bool)

(assert (=> start!74148 (and (array_inv!19175 _values!688) e!485710)))

(assert (= (and start!74148 res!592853) b!872261))

(assert (= (and b!872261 res!592850) b!872260))

(assert (= (and b!872260 res!592852) b!872259))

(assert (= (and b!872259 res!592851) b!872262))

(assert (= (and b!872258 condMapEmpty!27383) mapIsEmpty!27383))

(assert (= (and b!872258 (not condMapEmpty!27383)) mapNonEmpty!27383))

(get-info :version)

(assert (= (and mapNonEmpty!27383 ((_ is ValueCellFull!8154) mapValue!27383)) b!872257))

(assert (= (and b!872258 ((_ is ValueCellFull!8154) mapDefault!27383)) b!872263))

(assert (= start!74148 b!872258))

(declare-fun m!813155 () Bool)

(assert (=> mapNonEmpty!27383 m!813155))

(declare-fun m!813157 () Bool)

(assert (=> b!872259 m!813157))

(declare-fun m!813159 () Bool)

(assert (=> b!872262 m!813159))

(declare-fun m!813161 () Bool)

(assert (=> b!872261 m!813161))

(declare-fun m!813163 () Bool)

(assert (=> start!74148 m!813163))

(declare-fun m!813165 () Bool)

(assert (=> start!74148 m!813165))

(check-sat (not b!872259) (not start!74148) (not mapNonEmpty!27383) (not b!872261) (not b!872262) tp_is_empty!17187)
(check-sat)
