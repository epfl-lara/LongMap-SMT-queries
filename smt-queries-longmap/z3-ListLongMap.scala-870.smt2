; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20318 () Bool)

(assert start!20318)

(declare-fun b_free!4977 () Bool)

(declare-fun b_next!4977 () Bool)

(assert (=> start!20318 (= b_free!4977 (not b_next!4977))))

(declare-fun tp!17963 () Bool)

(declare-fun b_and!11723 () Bool)

(assert (=> start!20318 (= tp!17963 b_and!11723)))

(declare-fun b!200219 () Bool)

(declare-fun res!95345 () Bool)

(declare-fun e!131316 () Bool)

(assert (=> b!200219 (=> (not res!95345) (not e!131316))))

(declare-datatypes ((array!8901 0))(
  ( (array!8902 (arr!4201 (Array (_ BitVec 32) (_ BitVec 64))) (size!4526 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8901)

(declare-datatypes ((List!2635 0))(
  ( (Nil!2632) (Cons!2631 (h!3273 (_ BitVec 64)) (t!7566 List!2635)) )
))
(declare-fun arrayNoDuplicates!0 (array!8901 (_ BitVec 32) List!2635) Bool)

(assert (=> b!200219 (= res!95345 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2632))))

(declare-fun b!200220 () Bool)

(declare-fun e!131318 () Bool)

(declare-fun e!131320 () Bool)

(declare-fun mapRes!8318 () Bool)

(assert (=> b!200220 (= e!131318 (and e!131320 mapRes!8318))))

(declare-fun condMapEmpty!8318 () Bool)

(declare-datatypes ((V!6091 0))(
  ( (V!6092 (val!2461 Int)) )
))
(declare-datatypes ((ValueCell!2073 0))(
  ( (ValueCellFull!2073 (v!4431 V!6091)) (EmptyCell!2073) )
))
(declare-datatypes ((array!8903 0))(
  ( (array!8904 (arr!4202 (Array (_ BitVec 32) ValueCell!2073)) (size!4527 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8903)

(declare-fun mapDefault!8318 () ValueCell!2073)

(assert (=> b!200220 (= condMapEmpty!8318 (= (arr!4202 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2073)) mapDefault!8318)))))

(declare-fun mapNonEmpty!8318 () Bool)

(declare-fun tp!17962 () Bool)

(declare-fun e!131315 () Bool)

(assert (=> mapNonEmpty!8318 (= mapRes!8318 (and tp!17962 e!131315))))

(declare-fun mapRest!8318 () (Array (_ BitVec 32) ValueCell!2073))

(declare-fun mapValue!8318 () ValueCell!2073)

(declare-fun mapKey!8318 () (_ BitVec 32))

(assert (=> mapNonEmpty!8318 (= (arr!4202 _values!649) (store mapRest!8318 mapKey!8318 mapValue!8318))))

(declare-fun b!200221 () Bool)

(declare-fun res!95347 () Bool)

(assert (=> b!200221 (=> (not res!95347) (not e!131316))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200221 (= res!95347 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4526 _keys!825))))))

(declare-fun e!131317 () Bool)

(declare-datatypes ((tuple2!3718 0))(
  ( (tuple2!3719 (_1!1870 (_ BitVec 64)) (_2!1870 V!6091)) )
))
(declare-datatypes ((List!2636 0))(
  ( (Nil!2633) (Cons!2632 (h!3274 tuple2!3718) (t!7567 List!2636)) )
))
(declare-datatypes ((ListLongMap!2631 0))(
  ( (ListLongMap!2632 (toList!1331 List!2636)) )
))
(declare-fun lt!98798 () ListLongMap!2631)

(declare-fun lt!98799 () tuple2!3718)

(declare-fun lt!98795 () tuple2!3718)

(declare-fun lt!98794 () ListLongMap!2631)

(declare-fun b!200222 () Bool)

(declare-fun +!358 (ListLongMap!2631 tuple2!3718) ListLongMap!2631)

(assert (=> b!200222 (= e!131317 (= lt!98798 (+!358 (+!358 lt!98794 lt!98795) lt!98799)))))

(declare-fun b!200223 () Bool)

(declare-fun res!95341 () Bool)

(assert (=> b!200223 (=> (not res!95341) (not e!131317))))

(declare-fun lt!98792 () ListLongMap!2631)

(declare-fun lt!98796 () ListLongMap!2631)

(assert (=> b!200223 (= res!95341 (= lt!98792 (+!358 (+!358 lt!98796 lt!98795) lt!98799)))))

(declare-fun b!200224 () Bool)

(declare-fun res!95342 () Bool)

(assert (=> b!200224 (=> (not res!95342) (not e!131316))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!200224 (= res!95342 (= (select (arr!4201 _keys!825) i!601) k0!843))))

(declare-fun res!95343 () Bool)

(assert (=> start!20318 (=> (not res!95343) (not e!131316))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20318 (= res!95343 (validMask!0 mask!1149))))

(assert (=> start!20318 e!131316))

(declare-fun array_inv!2765 (array!8903) Bool)

(assert (=> start!20318 (and (array_inv!2765 _values!649) e!131318)))

(assert (=> start!20318 true))

(declare-fun tp_is_empty!4833 () Bool)

(assert (=> start!20318 tp_is_empty!4833))

(declare-fun array_inv!2766 (array!8901) Bool)

(assert (=> start!20318 (array_inv!2766 _keys!825)))

(assert (=> start!20318 tp!17963))

(declare-fun b!200225 () Bool)

(declare-fun res!95340 () Bool)

(assert (=> b!200225 (=> (not res!95340) (not e!131316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200225 (= res!95340 (validKeyInArray!0 k0!843))))

(declare-fun b!200226 () Bool)

(declare-fun res!95344 () Bool)

(assert (=> b!200226 (=> (not res!95344) (not e!131316))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200226 (= res!95344 (and (= (size!4527 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4526 _keys!825) (size!4527 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200227 () Bool)

(assert (=> b!200227 (= e!131320 tp_is_empty!4833)))

(declare-fun b!200228 () Bool)

(declare-fun e!131319 () Bool)

(assert (=> b!200228 (= e!131316 (not e!131319))))

(declare-fun res!95339 () Bool)

(assert (=> b!200228 (=> res!95339 e!131319)))

(assert (=> b!200228 (= res!95339 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6091)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6091)

(declare-fun getCurrentListMap!922 (array!8901 array!8903 (_ BitVec 32) (_ BitVec 32) V!6091 V!6091 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!200228 (= lt!98792 (getCurrentListMap!922 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98791 () array!8903)

(assert (=> b!200228 (= lt!98798 (getCurrentListMap!922 _keys!825 lt!98791 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98793 () ListLongMap!2631)

(assert (=> b!200228 (and (= lt!98793 lt!98794) (= lt!98794 lt!98793))))

(declare-fun v!520 () V!6091)

(assert (=> b!200228 (= lt!98794 (+!358 lt!98796 (tuple2!3719 k0!843 v!520)))))

(declare-datatypes ((Unit!6018 0))(
  ( (Unit!6019) )
))
(declare-fun lt!98797 () Unit!6018)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!35 (array!8901 array!8903 (_ BitVec 32) (_ BitVec 32) V!6091 V!6091 (_ BitVec 32) (_ BitVec 64) V!6091 (_ BitVec 32) Int) Unit!6018)

(assert (=> b!200228 (= lt!98797 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!35 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!296 (array!8901 array!8903 (_ BitVec 32) (_ BitVec 32) V!6091 V!6091 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!200228 (= lt!98793 (getCurrentListMapNoExtraKeys!296 _keys!825 lt!98791 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200228 (= lt!98791 (array!8904 (store (arr!4202 _values!649) i!601 (ValueCellFull!2073 v!520)) (size!4527 _values!649)))))

(assert (=> b!200228 (= lt!98796 (getCurrentListMapNoExtraKeys!296 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200229 () Bool)

(declare-fun res!95338 () Bool)

(assert (=> b!200229 (=> (not res!95338) (not e!131316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8901 (_ BitVec 32)) Bool)

(assert (=> b!200229 (= res!95338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8318 () Bool)

(assert (=> mapIsEmpty!8318 mapRes!8318))

(declare-fun b!200230 () Bool)

(assert (=> b!200230 (= e!131315 tp_is_empty!4833)))

(declare-fun b!200231 () Bool)

(assert (=> b!200231 (= e!131319 true)))

(assert (=> b!200231 e!131317))

(declare-fun res!95346 () Bool)

(assert (=> b!200231 (=> (not res!95346) (not e!131317))))

(assert (=> b!200231 (= res!95346 (= lt!98798 (+!358 (+!358 lt!98793 lt!98795) lt!98799)))))

(assert (=> b!200231 (= lt!98799 (tuple2!3719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200231 (= lt!98795 (tuple2!3719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20318 res!95343) b!200226))

(assert (= (and b!200226 res!95344) b!200229))

(assert (= (and b!200229 res!95338) b!200219))

(assert (= (and b!200219 res!95345) b!200221))

(assert (= (and b!200221 res!95347) b!200225))

(assert (= (and b!200225 res!95340) b!200224))

(assert (= (and b!200224 res!95342) b!200228))

(assert (= (and b!200228 (not res!95339)) b!200231))

(assert (= (and b!200231 res!95346) b!200223))

(assert (= (and b!200223 res!95341) b!200222))

(assert (= (and b!200220 condMapEmpty!8318) mapIsEmpty!8318))

(assert (= (and b!200220 (not condMapEmpty!8318)) mapNonEmpty!8318))

(get-info :version)

(assert (= (and mapNonEmpty!8318 ((_ is ValueCellFull!2073) mapValue!8318)) b!200230))

(assert (= (and b!200220 ((_ is ValueCellFull!2073) mapDefault!8318)) b!200227))

(assert (= start!20318 b!200220))

(declare-fun m!226633 () Bool)

(assert (=> b!200229 m!226633))

(declare-fun m!226635 () Bool)

(assert (=> b!200228 m!226635))

(declare-fun m!226637 () Bool)

(assert (=> b!200228 m!226637))

(declare-fun m!226639 () Bool)

(assert (=> b!200228 m!226639))

(declare-fun m!226641 () Bool)

(assert (=> b!200228 m!226641))

(declare-fun m!226643 () Bool)

(assert (=> b!200228 m!226643))

(declare-fun m!226645 () Bool)

(assert (=> b!200228 m!226645))

(declare-fun m!226647 () Bool)

(assert (=> b!200228 m!226647))

(declare-fun m!226649 () Bool)

(assert (=> b!200219 m!226649))

(declare-fun m!226651 () Bool)

(assert (=> b!200231 m!226651))

(assert (=> b!200231 m!226651))

(declare-fun m!226653 () Bool)

(assert (=> b!200231 m!226653))

(declare-fun m!226655 () Bool)

(assert (=> b!200224 m!226655))

(declare-fun m!226657 () Bool)

(assert (=> b!200222 m!226657))

(assert (=> b!200222 m!226657))

(declare-fun m!226659 () Bool)

(assert (=> b!200222 m!226659))

(declare-fun m!226661 () Bool)

(assert (=> start!20318 m!226661))

(declare-fun m!226663 () Bool)

(assert (=> start!20318 m!226663))

(declare-fun m!226665 () Bool)

(assert (=> start!20318 m!226665))

(declare-fun m!226667 () Bool)

(assert (=> mapNonEmpty!8318 m!226667))

(declare-fun m!226669 () Bool)

(assert (=> b!200225 m!226669))

(declare-fun m!226671 () Bool)

(assert (=> b!200223 m!226671))

(assert (=> b!200223 m!226671))

(declare-fun m!226673 () Bool)

(assert (=> b!200223 m!226673))

(check-sat (not b!200222) tp_is_empty!4833 (not b!200228) b_and!11723 (not b!200225) (not b!200231) (not b_next!4977) (not b!200219) (not b!200223) (not mapNonEmpty!8318) (not start!20318) (not b!200229))
(check-sat b_and!11723 (not b_next!4977))
