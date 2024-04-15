; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74146 () Bool)

(assert start!74146)

(declare-fun b!872186 () Bool)

(declare-fun res!592838 () Bool)

(declare-fun e!485680 () Bool)

(assert (=> b!872186 (=> (not res!592838) (not e!485680))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50525 0))(
  ( (array!50526 (arr!24293 (Array (_ BitVec 32) (_ BitVec 64))) (size!24735 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50525)

(declare-datatypes ((V!27985 0))(
  ( (V!27986 (val!8649 Int)) )
))
(declare-datatypes ((ValueCell!8162 0))(
  ( (ValueCellFull!8162 (v!11068 V!27985)) (EmptyCell!8162) )
))
(declare-datatypes ((array!50527 0))(
  ( (array!50528 (arr!24294 (Array (_ BitVec 32) ValueCell!8162)) (size!24736 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50527)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872186 (= res!592838 (and (= (size!24736 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24735 _keys!868) (size!24736 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872187 () Bool)

(declare-fun res!592836 () Bool)

(assert (=> b!872187 (=> (not res!592836) (not e!485680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872187 (= res!592836 (validMask!0 mask!1196))))

(declare-fun b!872188 () Bool)

(declare-fun res!592837 () Bool)

(assert (=> b!872188 (=> (not res!592837) (not e!485680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50525 (_ BitVec 32)) Bool)

(assert (=> b!872188 (= res!592837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27407 () Bool)

(declare-fun mapRes!27407 () Bool)

(declare-fun tp!52607 () Bool)

(declare-fun e!485678 () Bool)

(assert (=> mapNonEmpty!27407 (= mapRes!27407 (and tp!52607 e!485678))))

(declare-fun mapRest!27407 () (Array (_ BitVec 32) ValueCell!8162))

(declare-fun mapValue!27407 () ValueCell!8162)

(declare-fun mapKey!27407 () (_ BitVec 32))

(assert (=> mapNonEmpty!27407 (= (arr!24294 _values!688) (store mapRest!27407 mapKey!27407 mapValue!27407))))

(declare-fun res!592839 () Bool)

(assert (=> start!74146 (=> (not res!592839) (not e!485680))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74146 (= res!592839 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24735 _keys!868))))))

(assert (=> start!74146 e!485680))

(assert (=> start!74146 true))

(declare-fun array_inv!19240 (array!50525) Bool)

(assert (=> start!74146 (array_inv!19240 _keys!868)))

(declare-fun e!485679 () Bool)

(declare-fun array_inv!19241 (array!50527) Bool)

(assert (=> start!74146 (and (array_inv!19241 _values!688) e!485679)))

(declare-fun mapIsEmpty!27407 () Bool)

(assert (=> mapIsEmpty!27407 mapRes!27407))

(declare-fun b!872189 () Bool)

(declare-fun e!485682 () Bool)

(assert (=> b!872189 (= e!485679 (and e!485682 mapRes!27407))))

(declare-fun condMapEmpty!27407 () Bool)

(declare-fun mapDefault!27407 () ValueCell!8162)

(assert (=> b!872189 (= condMapEmpty!27407 (= (arr!24294 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8162)) mapDefault!27407)))))

(declare-fun b!872190 () Bool)

(declare-fun tp_is_empty!17203 () Bool)

(assert (=> b!872190 (= e!485678 tp_is_empty!17203)))

(declare-fun b!872191 () Bool)

(assert (=> b!872191 (= e!485682 tp_is_empty!17203)))

(declare-fun b!872192 () Bool)

(assert (=> b!872192 (= e!485680 false)))

(declare-fun lt!395384 () Bool)

(declare-datatypes ((List!17267 0))(
  ( (Nil!17264) (Cons!17263 (h!18394 (_ BitVec 64)) (t!24295 List!17267)) )
))
(declare-fun arrayNoDuplicates!0 (array!50525 (_ BitVec 32) List!17267) Bool)

(assert (=> b!872192 (= lt!395384 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17264))))

(assert (= (and start!74146 res!592839) b!872187))

(assert (= (and b!872187 res!592836) b!872186))

(assert (= (and b!872186 res!592838) b!872188))

(assert (= (and b!872188 res!592837) b!872192))

(assert (= (and b!872189 condMapEmpty!27407) mapIsEmpty!27407))

(assert (= (and b!872189 (not condMapEmpty!27407)) mapNonEmpty!27407))

(get-info :version)

(assert (= (and mapNonEmpty!27407 ((_ is ValueCellFull!8162) mapValue!27407)) b!872190))

(assert (= (and b!872189 ((_ is ValueCellFull!8162) mapDefault!27407)) b!872191))

(assert (= start!74146 b!872189))

(declare-fun m!812493 () Bool)

(assert (=> b!872192 m!812493))

(declare-fun m!812495 () Bool)

(assert (=> b!872188 m!812495))

(declare-fun m!812497 () Bool)

(assert (=> b!872187 m!812497))

(declare-fun m!812499 () Bool)

(assert (=> mapNonEmpty!27407 m!812499))

(declare-fun m!812501 () Bool)

(assert (=> start!74146 m!812501))

(declare-fun m!812503 () Bool)

(assert (=> start!74146 m!812503))

(check-sat (not b!872187) (not mapNonEmpty!27407) tp_is_empty!17203 (not start!74146) (not b!872188) (not b!872192))
(check-sat)
