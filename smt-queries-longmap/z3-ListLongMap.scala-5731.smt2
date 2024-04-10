; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74184 () Bool)

(assert start!74184)

(declare-fun res!593069 () Bool)

(declare-fun e!485976 () Bool)

(assert (=> start!74184 (=> (not res!593069) (not e!485976))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50576 0))(
  ( (array!50577 (arr!24318 (Array (_ BitVec 32) (_ BitVec 64))) (size!24758 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50576)

(assert (=> start!74184 (= res!593069 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24758 _keys!868))))))

(assert (=> start!74184 e!485976))

(assert (=> start!74184 true))

(declare-fun array_inv!19192 (array!50576) Bool)

(assert (=> start!74184 (array_inv!19192 _keys!868)))

(declare-datatypes ((V!28011 0))(
  ( (V!28012 (val!8659 Int)) )
))
(declare-datatypes ((ValueCell!8172 0))(
  ( (ValueCellFull!8172 (v!11084 V!28011)) (EmptyCell!8172) )
))
(declare-datatypes ((array!50578 0))(
  ( (array!50579 (arr!24319 (Array (_ BitVec 32) ValueCell!8172)) (size!24759 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50578)

(declare-fun e!485977 () Bool)

(declare-fun array_inv!19193 (array!50578) Bool)

(assert (=> start!74184 (and (array_inv!19193 _values!688) e!485977)))

(declare-fun b!872635 () Bool)

(declare-fun e!485978 () Bool)

(declare-fun tp_is_empty!17223 () Bool)

(assert (=> b!872635 (= e!485978 tp_is_empty!17223)))

(declare-fun b!872636 () Bool)

(assert (=> b!872636 (= e!485976 false)))

(declare-fun lt!395650 () Bool)

(declare-datatypes ((List!17269 0))(
  ( (Nil!17266) (Cons!17265 (h!18396 (_ BitVec 64)) (t!24306 List!17269)) )
))
(declare-fun arrayNoDuplicates!0 (array!50576 (_ BitVec 32) List!17269) Bool)

(assert (=> b!872636 (= lt!395650 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17266))))

(declare-fun b!872637 () Bool)

(declare-fun res!593067 () Bool)

(assert (=> b!872637 (=> (not res!593067) (not e!485976))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872637 (= res!593067 (and (= (size!24759 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24758 _keys!868) (size!24759 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872638 () Bool)

(declare-fun e!485980 () Bool)

(assert (=> b!872638 (= e!485980 tp_is_empty!17223)))

(declare-fun b!872639 () Bool)

(declare-fun mapRes!27437 () Bool)

(assert (=> b!872639 (= e!485977 (and e!485980 mapRes!27437))))

(declare-fun condMapEmpty!27437 () Bool)

(declare-fun mapDefault!27437 () ValueCell!8172)

(assert (=> b!872639 (= condMapEmpty!27437 (= (arr!24319 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8172)) mapDefault!27437)))))

(declare-fun b!872640 () Bool)

(declare-fun res!593068 () Bool)

(assert (=> b!872640 (=> (not res!593068) (not e!485976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50576 (_ BitVec 32)) Bool)

(assert (=> b!872640 (= res!593068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27437 () Bool)

(assert (=> mapIsEmpty!27437 mapRes!27437))

(declare-fun b!872641 () Bool)

(declare-fun res!593066 () Bool)

(assert (=> b!872641 (=> (not res!593066) (not e!485976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872641 (= res!593066 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27437 () Bool)

(declare-fun tp!52636 () Bool)

(assert (=> mapNonEmpty!27437 (= mapRes!27437 (and tp!52636 e!485978))))

(declare-fun mapKey!27437 () (_ BitVec 32))

(declare-fun mapRest!27437 () (Array (_ BitVec 32) ValueCell!8172))

(declare-fun mapValue!27437 () ValueCell!8172)

(assert (=> mapNonEmpty!27437 (= (arr!24319 _values!688) (store mapRest!27437 mapKey!27437 mapValue!27437))))

(assert (= (and start!74184 res!593069) b!872641))

(assert (= (and b!872641 res!593066) b!872637))

(assert (= (and b!872637 res!593067) b!872640))

(assert (= (and b!872640 res!593068) b!872636))

(assert (= (and b!872639 condMapEmpty!27437) mapIsEmpty!27437))

(assert (= (and b!872639 (not condMapEmpty!27437)) mapNonEmpty!27437))

(get-info :version)

(assert (= (and mapNonEmpty!27437 ((_ is ValueCellFull!8172) mapValue!27437)) b!872635))

(assert (= (and b!872639 ((_ is ValueCellFull!8172) mapDefault!27437)) b!872638))

(assert (= start!74184 b!872639))

(declare-fun m!813371 () Bool)

(assert (=> b!872636 m!813371))

(declare-fun m!813373 () Bool)

(assert (=> b!872641 m!813373))

(declare-fun m!813375 () Bool)

(assert (=> mapNonEmpty!27437 m!813375))

(declare-fun m!813377 () Bool)

(assert (=> b!872640 m!813377))

(declare-fun m!813379 () Bool)

(assert (=> start!74184 m!813379))

(declare-fun m!813381 () Bool)

(assert (=> start!74184 m!813381))

(check-sat (not b!872641) (not b!872640) (not mapNonEmpty!27437) (not b!872636) tp_is_empty!17223 (not start!74184))
(check-sat)
