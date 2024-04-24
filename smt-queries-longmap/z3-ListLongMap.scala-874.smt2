; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20344 () Bool)

(assert start!20344)

(declare-fun b_free!4999 () Bool)

(declare-fun b_next!4999 () Bool)

(assert (=> start!20344 (= b_free!4999 (not b_next!4999))))

(declare-fun tp!18028 () Bool)

(declare-fun b_and!11759 () Bool)

(assert (=> start!20344 (= tp!18028 b_and!11759)))

(declare-fun b!200657 () Bool)

(declare-fun e!131564 () Bool)

(declare-fun e!131563 () Bool)

(declare-fun mapRes!8351 () Bool)

(assert (=> b!200657 (= e!131564 (and e!131563 mapRes!8351))))

(declare-fun condMapEmpty!8351 () Bool)

(declare-datatypes ((V!6121 0))(
  ( (V!6122 (val!2472 Int)) )
))
(declare-datatypes ((ValueCell!2084 0))(
  ( (ValueCellFull!2084 (v!4443 V!6121)) (EmptyCell!2084) )
))
(declare-datatypes ((array!8935 0))(
  ( (array!8936 (arr!4218 (Array (_ BitVec 32) ValueCell!2084)) (size!4543 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8935)

(declare-fun mapDefault!8351 () ValueCell!2084)

(assert (=> b!200657 (= condMapEmpty!8351 (= (arr!4218 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2084)) mapDefault!8351)))))

(declare-fun b!200658 () Bool)

(declare-fun res!95654 () Bool)

(declare-fun e!131562 () Bool)

(assert (=> b!200658 (=> (not res!95654) (not e!131562))))

(declare-datatypes ((array!8937 0))(
  ( (array!8938 (arr!4219 (Array (_ BitVec 32) (_ BitVec 64))) (size!4544 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8937)

(declare-datatypes ((List!2590 0))(
  ( (Nil!2587) (Cons!2586 (h!3228 (_ BitVec 64)) (t!7513 List!2590)) )
))
(declare-fun arrayNoDuplicates!0 (array!8937 (_ BitVec 32) List!2590) Bool)

(assert (=> b!200658 (= res!95654 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2587))))

(declare-fun b!200659 () Bool)

(declare-fun e!131566 () Bool)

(assert (=> b!200659 (= e!131566 true)))

(declare-datatypes ((tuple2!3672 0))(
  ( (tuple2!3673 (_1!1847 (_ BitVec 64)) (_2!1847 V!6121)) )
))
(declare-fun lt!99338 () tuple2!3672)

(declare-datatypes ((List!2591 0))(
  ( (Nil!2588) (Cons!2587 (h!3229 tuple2!3672) (t!7514 List!2591)) )
))
(declare-datatypes ((ListLongMap!2587 0))(
  ( (ListLongMap!2588 (toList!1309 List!2591)) )
))
(declare-fun lt!99333 () ListLongMap!2587)

(declare-fun lt!99323 () tuple2!3672)

(declare-fun lt!99325 () ListLongMap!2587)

(declare-fun +!363 (ListLongMap!2587 tuple2!3672) ListLongMap!2587)

(assert (=> b!200659 (= (+!363 lt!99333 lt!99338) (+!363 lt!99325 lt!99323))))

(declare-datatypes ((Unit!6010 0))(
  ( (Unit!6011) )
))
(declare-fun lt!99334 () Unit!6010)

(declare-fun minValue!615 () V!6121)

(declare-fun v!520 () V!6121)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!99331 () ListLongMap!2587)

(declare-fun addCommutativeForDiffKeys!89 (ListLongMap!2587 (_ BitVec 64) V!6121 (_ BitVec 64) V!6121) Unit!6010)

(assert (=> b!200659 (= lt!99334 (addCommutativeForDiffKeys!89 lt!99331 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200660 () Bool)

(declare-fun tp_is_empty!4855 () Bool)

(assert (=> b!200660 (= e!131563 tp_is_empty!4855)))

(declare-fun b!200661 () Bool)

(declare-fun res!95652 () Bool)

(assert (=> b!200661 (=> (not res!95652) (not e!131562))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200661 (= res!95652 (= (select (arr!4219 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8351 () Bool)

(declare-fun tp!18029 () Bool)

(declare-fun e!131561 () Bool)

(assert (=> mapNonEmpty!8351 (= mapRes!8351 (and tp!18029 e!131561))))

(declare-fun mapValue!8351 () ValueCell!2084)

(declare-fun mapKey!8351 () (_ BitVec 32))

(declare-fun mapRest!8351 () (Array (_ BitVec 32) ValueCell!2084))

(assert (=> mapNonEmpty!8351 (= (arr!4218 _values!649) (store mapRest!8351 mapKey!8351 mapValue!8351))))

(declare-fun mapIsEmpty!8351 () Bool)

(assert (=> mapIsEmpty!8351 mapRes!8351))

(declare-fun res!95656 () Bool)

(assert (=> start!20344 (=> (not res!95656) (not e!131562))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20344 (= res!95656 (validMask!0 mask!1149))))

(assert (=> start!20344 e!131562))

(declare-fun array_inv!2751 (array!8935) Bool)

(assert (=> start!20344 (and (array_inv!2751 _values!649) e!131564)))

(assert (=> start!20344 true))

(assert (=> start!20344 tp_is_empty!4855))

(declare-fun array_inv!2752 (array!8937) Bool)

(assert (=> start!20344 (array_inv!2752 _keys!825)))

(assert (=> start!20344 tp!18028))

(declare-fun b!200662 () Bool)

(declare-fun res!95651 () Bool)

(assert (=> b!200662 (=> (not res!95651) (not e!131562))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200662 (= res!95651 (and (= (size!4543 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4544 _keys!825) (size!4543 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200663 () Bool)

(declare-fun res!95655 () Bool)

(assert (=> b!200663 (=> (not res!95655) (not e!131562))))

(assert (=> b!200663 (= res!95655 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4544 _keys!825))))))

(declare-fun b!200664 () Bool)

(declare-fun e!131565 () Bool)

(assert (=> b!200664 (= e!131565 e!131566)))

(declare-fun res!95659 () Bool)

(assert (=> b!200664 (=> res!95659 e!131566)))

(assert (=> b!200664 (= res!95659 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99328 () ListLongMap!2587)

(assert (=> b!200664 (= lt!99328 lt!99333)))

(assert (=> b!200664 (= lt!99333 (+!363 lt!99331 lt!99323))))

(declare-fun lt!99329 () Unit!6010)

(declare-fun zeroValue!615 () V!6121)

(declare-fun lt!99336 () ListLongMap!2587)

(assert (=> b!200664 (= lt!99329 (addCommutativeForDiffKeys!89 lt!99336 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99332 () ListLongMap!2587)

(assert (=> b!200664 (= lt!99332 (+!363 lt!99328 lt!99338))))

(declare-fun lt!99327 () ListLongMap!2587)

(declare-fun lt!99337 () tuple2!3672)

(assert (=> b!200664 (= lt!99328 (+!363 lt!99327 lt!99337))))

(declare-fun lt!99330 () ListLongMap!2587)

(assert (=> b!200664 (= lt!99330 lt!99325)))

(assert (=> b!200664 (= lt!99325 (+!363 lt!99331 lt!99338))))

(assert (=> b!200664 (= lt!99331 (+!363 lt!99336 lt!99337))))

(declare-fun lt!99324 () ListLongMap!2587)

(assert (=> b!200664 (= lt!99332 (+!363 (+!363 lt!99324 lt!99337) lt!99338))))

(assert (=> b!200664 (= lt!99338 (tuple2!3673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200664 (= lt!99337 (tuple2!3673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200665 () Bool)

(assert (=> b!200665 (= e!131562 (not e!131565))))

(declare-fun res!95653 () Bool)

(assert (=> b!200665 (=> res!95653 e!131565)))

(assert (=> b!200665 (= res!95653 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!904 (array!8937 array!8935 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2587)

(assert (=> b!200665 (= lt!99330 (getCurrentListMap!904 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99335 () array!8935)

(assert (=> b!200665 (= lt!99332 (getCurrentListMap!904 _keys!825 lt!99335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200665 (and (= lt!99324 lt!99327) (= lt!99327 lt!99324))))

(assert (=> b!200665 (= lt!99327 (+!363 lt!99336 lt!99323))))

(assert (=> b!200665 (= lt!99323 (tuple2!3673 k0!843 v!520))))

(declare-fun lt!99326 () Unit!6010)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 (array!8937 array!8935 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) (_ BitVec 64) V!6121 (_ BitVec 32) Int) Unit!6010)

(assert (=> b!200665 (= lt!99326 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!40 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!297 (array!8937 array!8935 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2587)

(assert (=> b!200665 (= lt!99324 (getCurrentListMapNoExtraKeys!297 _keys!825 lt!99335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200665 (= lt!99335 (array!8936 (store (arr!4218 _values!649) i!601 (ValueCellFull!2084 v!520)) (size!4543 _values!649)))))

(assert (=> b!200665 (= lt!99336 (getCurrentListMapNoExtraKeys!297 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200666 () Bool)

(declare-fun res!95657 () Bool)

(assert (=> b!200666 (=> (not res!95657) (not e!131562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200666 (= res!95657 (validKeyInArray!0 k0!843))))

(declare-fun b!200667 () Bool)

(declare-fun res!95658 () Bool)

(assert (=> b!200667 (=> (not res!95658) (not e!131562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8937 (_ BitVec 32)) Bool)

(assert (=> b!200667 (= res!95658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200668 () Bool)

(assert (=> b!200668 (= e!131561 tp_is_empty!4855)))

(assert (= (and start!20344 res!95656) b!200662))

(assert (= (and b!200662 res!95651) b!200667))

(assert (= (and b!200667 res!95658) b!200658))

(assert (= (and b!200658 res!95654) b!200663))

(assert (= (and b!200663 res!95655) b!200666))

(assert (= (and b!200666 res!95657) b!200661))

(assert (= (and b!200661 res!95652) b!200665))

(assert (= (and b!200665 (not res!95653)) b!200664))

(assert (= (and b!200664 (not res!95659)) b!200659))

(assert (= (and b!200657 condMapEmpty!8351) mapIsEmpty!8351))

(assert (= (and b!200657 (not condMapEmpty!8351)) mapNonEmpty!8351))

(get-info :version)

(assert (= (and mapNonEmpty!8351 ((_ is ValueCellFull!2084) mapValue!8351)) b!200668))

(assert (= (and b!200657 ((_ is ValueCellFull!2084) mapDefault!8351)) b!200660))

(assert (= start!20344 b!200657))

(declare-fun m!227349 () Bool)

(assert (=> b!200665 m!227349))

(declare-fun m!227351 () Bool)

(assert (=> b!200665 m!227351))

(declare-fun m!227353 () Bool)

(assert (=> b!200665 m!227353))

(declare-fun m!227355 () Bool)

(assert (=> b!200665 m!227355))

(declare-fun m!227357 () Bool)

(assert (=> b!200665 m!227357))

(declare-fun m!227359 () Bool)

(assert (=> b!200665 m!227359))

(declare-fun m!227361 () Bool)

(assert (=> b!200665 m!227361))

(declare-fun m!227363 () Bool)

(assert (=> b!200658 m!227363))

(declare-fun m!227365 () Bool)

(assert (=> b!200664 m!227365))

(declare-fun m!227367 () Bool)

(assert (=> b!200664 m!227367))

(declare-fun m!227369 () Bool)

(assert (=> b!200664 m!227369))

(declare-fun m!227371 () Bool)

(assert (=> b!200664 m!227371))

(declare-fun m!227373 () Bool)

(assert (=> b!200664 m!227373))

(declare-fun m!227375 () Bool)

(assert (=> b!200664 m!227375))

(declare-fun m!227377 () Bool)

(assert (=> b!200664 m!227377))

(declare-fun m!227379 () Bool)

(assert (=> b!200664 m!227379))

(assert (=> b!200664 m!227369))

(declare-fun m!227381 () Bool)

(assert (=> b!200661 m!227381))

(declare-fun m!227383 () Bool)

(assert (=> b!200666 m!227383))

(declare-fun m!227385 () Bool)

(assert (=> b!200667 m!227385))

(declare-fun m!227387 () Bool)

(assert (=> mapNonEmpty!8351 m!227387))

(declare-fun m!227389 () Bool)

(assert (=> start!20344 m!227389))

(declare-fun m!227391 () Bool)

(assert (=> start!20344 m!227391))

(declare-fun m!227393 () Bool)

(assert (=> start!20344 m!227393))

(declare-fun m!227395 () Bool)

(assert (=> b!200659 m!227395))

(declare-fun m!227397 () Bool)

(assert (=> b!200659 m!227397))

(declare-fun m!227399 () Bool)

(assert (=> b!200659 m!227399))

(check-sat (not b!200658) (not b!200667) (not b!200665) tp_is_empty!4855 (not b!200659) (not start!20344) (not b_next!4999) b_and!11759 (not mapNonEmpty!8351) (not b!200666) (not b!200664))
(check-sat b_and!11759 (not b_next!4999))
