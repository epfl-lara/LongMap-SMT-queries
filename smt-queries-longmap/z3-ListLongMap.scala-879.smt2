; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20374 () Bool)

(assert start!20374)

(declare-fun b_free!5029 () Bool)

(declare-fun b_next!5029 () Bool)

(assert (=> start!20374 (= b_free!5029 (not b_next!5029))))

(declare-fun tp!18118 () Bool)

(declare-fun b_and!11749 () Bool)

(assert (=> start!20374 (= tp!18118 b_and!11749)))

(declare-fun b!201003 () Bool)

(declare-fun e!131751 () Bool)

(declare-fun e!131756 () Bool)

(assert (=> b!201003 (= e!131751 (not e!131756))))

(declare-fun res!95944 () Bool)

(assert (=> b!201003 (=> res!95944 e!131756)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201003 (= res!95944 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6161 0))(
  ( (V!6162 (val!2487 Int)) )
))
(declare-datatypes ((ValueCell!2099 0))(
  ( (ValueCellFull!2099 (v!4451 V!6161)) (EmptyCell!2099) )
))
(declare-datatypes ((array!8987 0))(
  ( (array!8988 (arr!4243 (Array (_ BitVec 32) ValueCell!2099)) (size!4569 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8987)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3740 0))(
  ( (tuple2!3741 (_1!1881 (_ BitVec 64)) (_2!1881 V!6161)) )
))
(declare-datatypes ((List!2660 0))(
  ( (Nil!2657) (Cons!2656 (h!3298 tuple2!3740) (t!7582 List!2660)) )
))
(declare-datatypes ((ListLongMap!2643 0))(
  ( (ListLongMap!2644 (toList!1337 List!2660)) )
))
(declare-fun lt!99811 () ListLongMap!2643)

(declare-fun zeroValue!615 () V!6161)

(declare-datatypes ((array!8989 0))(
  ( (array!8990 (arr!4244 (Array (_ BitVec 32) (_ BitVec 64))) (size!4570 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8989)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6161)

(declare-fun getCurrentListMap!901 (array!8989 array!8987 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) Int) ListLongMap!2643)

(assert (=> b!201003 (= lt!99811 (getCurrentListMap!901 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99813 () ListLongMap!2643)

(declare-fun lt!99810 () array!8987)

(assert (=> b!201003 (= lt!99813 (getCurrentListMap!901 _keys!825 lt!99810 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99809 () ListLongMap!2643)

(declare-fun lt!99815 () ListLongMap!2643)

(assert (=> b!201003 (and (= lt!99809 lt!99815) (= lt!99815 lt!99809))))

(declare-fun lt!99804 () ListLongMap!2643)

(declare-fun lt!99814 () tuple2!3740)

(declare-fun +!386 (ListLongMap!2643 tuple2!3740) ListLongMap!2643)

(assert (=> b!201003 (= lt!99815 (+!386 lt!99804 lt!99814))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6161)

(assert (=> b!201003 (= lt!99814 (tuple2!3741 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6024 0))(
  ( (Unit!6025) )
))
(declare-fun lt!99816 () Unit!6024)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 (array!8989 array!8987 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) (_ BitVec 64) V!6161 (_ BitVec 32) Int) Unit!6024)

(assert (=> b!201003 (= lt!99816 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!60 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!311 (array!8989 array!8987 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) Int) ListLongMap!2643)

(assert (=> b!201003 (= lt!99809 (getCurrentListMapNoExtraKeys!311 _keys!825 lt!99810 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201003 (= lt!99810 (array!8988 (store (arr!4243 _values!649) i!601 (ValueCellFull!2099 v!520)) (size!4569 _values!649)))))

(assert (=> b!201003 (= lt!99804 (getCurrentListMapNoExtraKeys!311 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201004 () Bool)

(declare-fun e!131752 () Bool)

(declare-fun e!131755 () Bool)

(declare-fun mapRes!8396 () Bool)

(assert (=> b!201004 (= e!131752 (and e!131755 mapRes!8396))))

(declare-fun condMapEmpty!8396 () Bool)

(declare-fun mapDefault!8396 () ValueCell!2099)

(assert (=> b!201004 (= condMapEmpty!8396 (= (arr!4243 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2099)) mapDefault!8396)))))

(declare-fun b!201005 () Bool)

(declare-fun e!131753 () Bool)

(assert (=> b!201005 (= e!131753 true)))

(declare-fun lt!99805 () ListLongMap!2643)

(declare-fun lt!99818 () tuple2!3740)

(declare-fun lt!99807 () ListLongMap!2643)

(assert (=> b!201005 (= (+!386 lt!99807 lt!99818) (+!386 lt!99805 lt!99814))))

(declare-fun lt!99812 () ListLongMap!2643)

(declare-fun lt!99803 () Unit!6024)

(declare-fun addCommutativeForDiffKeys!95 (ListLongMap!2643 (_ BitVec 64) V!6161 (_ BitVec 64) V!6161) Unit!6024)

(assert (=> b!201005 (= lt!99803 (addCommutativeForDiffKeys!95 lt!99812 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8396 () Bool)

(assert (=> mapIsEmpty!8396 mapRes!8396))

(declare-fun b!201006 () Bool)

(declare-fun res!95945 () Bool)

(assert (=> b!201006 (=> (not res!95945) (not e!131751))))

(assert (=> b!201006 (= res!95945 (and (= (size!4569 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4570 _keys!825) (size!4569 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201007 () Bool)

(declare-fun res!95943 () Bool)

(assert (=> b!201007 (=> (not res!95943) (not e!131751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8989 (_ BitVec 32)) Bool)

(assert (=> b!201007 (= res!95943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201008 () Bool)

(declare-fun tp_is_empty!4885 () Bool)

(assert (=> b!201008 (= e!131755 tp_is_empty!4885)))

(declare-fun res!95940 () Bool)

(assert (=> start!20374 (=> (not res!95940) (not e!131751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20374 (= res!95940 (validMask!0 mask!1149))))

(assert (=> start!20374 e!131751))

(declare-fun array_inv!2771 (array!8987) Bool)

(assert (=> start!20374 (and (array_inv!2771 _values!649) e!131752)))

(assert (=> start!20374 true))

(assert (=> start!20374 tp_is_empty!4885))

(declare-fun array_inv!2772 (array!8989) Bool)

(assert (=> start!20374 (array_inv!2772 _keys!825)))

(assert (=> start!20374 tp!18118))

(declare-fun mapNonEmpty!8396 () Bool)

(declare-fun tp!18119 () Bool)

(declare-fun e!131754 () Bool)

(assert (=> mapNonEmpty!8396 (= mapRes!8396 (and tp!18119 e!131754))))

(declare-fun mapRest!8396 () (Array (_ BitVec 32) ValueCell!2099))

(declare-fun mapValue!8396 () ValueCell!2099)

(declare-fun mapKey!8396 () (_ BitVec 32))

(assert (=> mapNonEmpty!8396 (= (arr!4243 _values!649) (store mapRest!8396 mapKey!8396 mapValue!8396))))

(declare-fun b!201009 () Bool)

(declare-fun res!95948 () Bool)

(assert (=> b!201009 (=> (not res!95948) (not e!131751))))

(assert (=> b!201009 (= res!95948 (= (select (arr!4244 _keys!825) i!601) k0!843))))

(declare-fun b!201010 () Bool)

(declare-fun res!95942 () Bool)

(assert (=> b!201010 (=> (not res!95942) (not e!131751))))

(declare-datatypes ((List!2661 0))(
  ( (Nil!2658) (Cons!2657 (h!3299 (_ BitVec 64)) (t!7583 List!2661)) )
))
(declare-fun arrayNoDuplicates!0 (array!8989 (_ BitVec 32) List!2661) Bool)

(assert (=> b!201010 (= res!95942 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2658))))

(declare-fun b!201011 () Bool)

(declare-fun res!95947 () Bool)

(assert (=> b!201011 (=> (not res!95947) (not e!131751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201011 (= res!95947 (validKeyInArray!0 k0!843))))

(declare-fun b!201012 () Bool)

(assert (=> b!201012 (= e!131756 e!131753)))

(declare-fun res!95946 () Bool)

(assert (=> b!201012 (=> res!95946 e!131753)))

(assert (=> b!201012 (= res!95946 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99806 () ListLongMap!2643)

(assert (=> b!201012 (= lt!99806 lt!99807)))

(assert (=> b!201012 (= lt!99807 (+!386 lt!99812 lt!99814))))

(declare-fun lt!99817 () Unit!6024)

(assert (=> b!201012 (= lt!99817 (addCommutativeForDiffKeys!95 lt!99804 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201012 (= lt!99813 (+!386 lt!99806 lt!99818))))

(declare-fun lt!99808 () tuple2!3740)

(assert (=> b!201012 (= lt!99806 (+!386 lt!99815 lt!99808))))

(assert (=> b!201012 (= lt!99811 lt!99805)))

(assert (=> b!201012 (= lt!99805 (+!386 lt!99812 lt!99818))))

(assert (=> b!201012 (= lt!99812 (+!386 lt!99804 lt!99808))))

(assert (=> b!201012 (= lt!99813 (+!386 (+!386 lt!99809 lt!99808) lt!99818))))

(assert (=> b!201012 (= lt!99818 (tuple2!3741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201012 (= lt!99808 (tuple2!3741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201013 () Bool)

(assert (=> b!201013 (= e!131754 tp_is_empty!4885)))

(declare-fun b!201014 () Bool)

(declare-fun res!95941 () Bool)

(assert (=> b!201014 (=> (not res!95941) (not e!131751))))

(assert (=> b!201014 (= res!95941 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4570 _keys!825))))))

(assert (= (and start!20374 res!95940) b!201006))

(assert (= (and b!201006 res!95945) b!201007))

(assert (= (and b!201007 res!95943) b!201010))

(assert (= (and b!201010 res!95942) b!201014))

(assert (= (and b!201014 res!95941) b!201011))

(assert (= (and b!201011 res!95947) b!201009))

(assert (= (and b!201009 res!95948) b!201003))

(assert (= (and b!201003 (not res!95944)) b!201012))

(assert (= (and b!201012 (not res!95946)) b!201005))

(assert (= (and b!201004 condMapEmpty!8396) mapIsEmpty!8396))

(assert (= (and b!201004 (not condMapEmpty!8396)) mapNonEmpty!8396))

(get-info :version)

(assert (= (and mapNonEmpty!8396 ((_ is ValueCellFull!2099) mapValue!8396)) b!201013))

(assert (= (and b!201004 ((_ is ValueCellFull!2099) mapDefault!8396)) b!201008))

(assert (= start!20374 b!201004))

(declare-fun m!227331 () Bool)

(assert (=> b!201010 m!227331))

(declare-fun m!227333 () Bool)

(assert (=> b!201007 m!227333))

(declare-fun m!227335 () Bool)

(assert (=> start!20374 m!227335))

(declare-fun m!227337 () Bool)

(assert (=> start!20374 m!227337))

(declare-fun m!227339 () Bool)

(assert (=> start!20374 m!227339))

(declare-fun m!227341 () Bool)

(assert (=> b!201009 m!227341))

(declare-fun m!227343 () Bool)

(assert (=> b!201012 m!227343))

(assert (=> b!201012 m!227343))

(declare-fun m!227345 () Bool)

(assert (=> b!201012 m!227345))

(declare-fun m!227347 () Bool)

(assert (=> b!201012 m!227347))

(declare-fun m!227349 () Bool)

(assert (=> b!201012 m!227349))

(declare-fun m!227351 () Bool)

(assert (=> b!201012 m!227351))

(declare-fun m!227353 () Bool)

(assert (=> b!201012 m!227353))

(declare-fun m!227355 () Bool)

(assert (=> b!201012 m!227355))

(declare-fun m!227357 () Bool)

(assert (=> b!201012 m!227357))

(declare-fun m!227359 () Bool)

(assert (=> b!201011 m!227359))

(declare-fun m!227361 () Bool)

(assert (=> mapNonEmpty!8396 m!227361))

(declare-fun m!227363 () Bool)

(assert (=> b!201003 m!227363))

(declare-fun m!227365 () Bool)

(assert (=> b!201003 m!227365))

(declare-fun m!227367 () Bool)

(assert (=> b!201003 m!227367))

(declare-fun m!227369 () Bool)

(assert (=> b!201003 m!227369))

(declare-fun m!227371 () Bool)

(assert (=> b!201003 m!227371))

(declare-fun m!227373 () Bool)

(assert (=> b!201003 m!227373))

(declare-fun m!227375 () Bool)

(assert (=> b!201003 m!227375))

(declare-fun m!227377 () Bool)

(assert (=> b!201005 m!227377))

(declare-fun m!227379 () Bool)

(assert (=> b!201005 m!227379))

(declare-fun m!227381 () Bool)

(assert (=> b!201005 m!227381))

(check-sat (not start!20374) tp_is_empty!4885 (not b!201007) (not b!201011) (not mapNonEmpty!8396) (not b!201003) (not b!201012) (not b_next!5029) (not b!201005) b_and!11749 (not b!201010))
(check-sat b_and!11749 (not b_next!5029))
