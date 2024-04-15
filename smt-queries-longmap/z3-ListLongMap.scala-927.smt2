; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20662 () Bool)

(assert start!20662)

(declare-fun b_free!5317 () Bool)

(declare-fun b_next!5317 () Bool)

(assert (=> start!20662 (= b_free!5317 (not b_next!5317))))

(declare-fun tp!18983 () Bool)

(declare-fun b_and!12037 () Bool)

(assert (=> start!20662 (= tp!18983 b_and!12037)))

(declare-fun b!206205 () Bool)

(declare-fun res!99854 () Bool)

(declare-fun e!134775 () Bool)

(assert (=> b!206205 (=> (not res!99854) (not e!134775))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9543 0))(
  ( (array!9544 (arr!4521 (Array (_ BitVec 32) (_ BitVec 64))) (size!4847 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9543)

(assert (=> b!206205 (= res!99854 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4847 _keys!825))))))

(declare-fun b!206206 () Bool)

(declare-fun e!134779 () Bool)

(declare-fun e!134776 () Bool)

(declare-fun mapRes!8828 () Bool)

(assert (=> b!206206 (= e!134779 (and e!134776 mapRes!8828))))

(declare-fun condMapEmpty!8828 () Bool)

(declare-datatypes ((V!6545 0))(
  ( (V!6546 (val!2631 Int)) )
))
(declare-datatypes ((ValueCell!2243 0))(
  ( (ValueCellFull!2243 (v!4595 V!6545)) (EmptyCell!2243) )
))
(declare-datatypes ((array!9545 0))(
  ( (array!9546 (arr!4522 (Array (_ BitVec 32) ValueCell!2243)) (size!4848 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9545)

(declare-fun mapDefault!8828 () ValueCell!2243)

(assert (=> b!206206 (= condMapEmpty!8828 (= (arr!4522 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2243)) mapDefault!8828)))))

(declare-fun res!99846 () Bool)

(assert (=> start!20662 (=> (not res!99846) (not e!134775))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20662 (= res!99846 (validMask!0 mask!1149))))

(assert (=> start!20662 e!134775))

(declare-fun array_inv!2969 (array!9545) Bool)

(assert (=> start!20662 (and (array_inv!2969 _values!649) e!134779)))

(assert (=> start!20662 true))

(declare-fun tp_is_empty!5173 () Bool)

(assert (=> start!20662 tp_is_empty!5173))

(declare-fun array_inv!2970 (array!9543) Bool)

(assert (=> start!20662 (array_inv!2970 _keys!825)))

(assert (=> start!20662 tp!18983))

(declare-fun mapNonEmpty!8828 () Bool)

(declare-fun tp!18982 () Bool)

(declare-fun e!134778 () Bool)

(assert (=> mapNonEmpty!8828 (= mapRes!8828 (and tp!18982 e!134778))))

(declare-fun mapRest!8828 () (Array (_ BitVec 32) ValueCell!2243))

(declare-fun mapKey!8828 () (_ BitVec 32))

(declare-fun mapValue!8828 () ValueCell!2243)

(assert (=> mapNonEmpty!8828 (= (arr!4522 _values!649) (store mapRest!8828 mapKey!8828 mapValue!8828))))

(declare-fun b!206207 () Bool)

(declare-fun e!134780 () Bool)

(assert (=> b!206207 (= e!134775 (not e!134780))))

(declare-fun res!99853 () Bool)

(assert (=> b!206207 (=> res!99853 e!134780)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206207 (= res!99853 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3980 0))(
  ( (tuple2!3981 (_1!2001 (_ BitVec 64)) (_2!2001 V!6545)) )
))
(declare-datatypes ((List!2881 0))(
  ( (Nil!2878) (Cons!2877 (h!3519 tuple2!3980) (t!7803 List!2881)) )
))
(declare-datatypes ((ListLongMap!2883 0))(
  ( (ListLongMap!2884 (toList!1457 List!2881)) )
))
(declare-fun lt!105304 () ListLongMap!2883)

(declare-fun zeroValue!615 () V!6545)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6545)

(declare-fun getCurrentListMap!998 (array!9543 array!9545 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2883)

(assert (=> b!206207 (= lt!105304 (getCurrentListMap!998 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105303 () ListLongMap!2883)

(declare-fun lt!105312 () array!9545)

(assert (=> b!206207 (= lt!105303 (getCurrentListMap!998 _keys!825 lt!105312 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105313 () ListLongMap!2883)

(declare-fun lt!105306 () ListLongMap!2883)

(assert (=> b!206207 (and (= lt!105313 lt!105306) (= lt!105306 lt!105313))))

(declare-fun lt!105311 () ListLongMap!2883)

(declare-fun lt!105305 () tuple2!3980)

(declare-fun +!506 (ListLongMap!2883 tuple2!3980) ListLongMap!2883)

(assert (=> b!206207 (= lt!105306 (+!506 lt!105311 lt!105305))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6545)

(assert (=> b!206207 (= lt!105305 (tuple2!3981 k0!843 v!520))))

(declare-datatypes ((Unit!6252 0))(
  ( (Unit!6253) )
))
(declare-fun lt!105309 () Unit!6252)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 (array!9543 array!9545 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) (_ BitVec 64) V!6545 (_ BitVec 32) Int) Unit!6252)

(assert (=> b!206207 (= lt!105309 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!408 (array!9543 array!9545 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2883)

(assert (=> b!206207 (= lt!105313 (getCurrentListMapNoExtraKeys!408 _keys!825 lt!105312 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206207 (= lt!105312 (array!9546 (store (arr!4522 _values!649) i!601 (ValueCellFull!2243 v!520)) (size!4848 _values!649)))))

(assert (=> b!206207 (= lt!105311 (getCurrentListMapNoExtraKeys!408 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206208 () Bool)

(declare-fun res!99849 () Bool)

(assert (=> b!206208 (=> (not res!99849) (not e!134775))))

(declare-datatypes ((List!2882 0))(
  ( (Nil!2879) (Cons!2878 (h!3520 (_ BitVec 64)) (t!7804 List!2882)) )
))
(declare-fun arrayNoDuplicates!0 (array!9543 (_ BitVec 32) List!2882) Bool)

(assert (=> b!206208 (= res!99849 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2879))))

(declare-fun b!206209 () Bool)

(declare-fun e!134777 () Bool)

(assert (=> b!206209 (= e!134777 (bvsle #b00000000000000000000000000000000 (size!4847 _keys!825)))))

(declare-fun lt!105308 () ListLongMap!2883)

(declare-fun lt!105314 () ListLongMap!2883)

(assert (=> b!206209 (= lt!105308 (+!506 lt!105314 lt!105305))))

(declare-fun lt!105307 () Unit!6252)

(declare-fun addCommutativeForDiffKeys!190 (ListLongMap!2883 (_ BitVec 64) V!6545 (_ BitVec 64) V!6545) Unit!6252)

(assert (=> b!206209 (= lt!105307 (addCommutativeForDiffKeys!190 lt!105311 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206210 () Bool)

(declare-fun res!99852 () Bool)

(assert (=> b!206210 (=> (not res!99852) (not e!134775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206210 (= res!99852 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8828 () Bool)

(assert (=> mapIsEmpty!8828 mapRes!8828))

(declare-fun b!206211 () Bool)

(assert (=> b!206211 (= e!134780 e!134777)))

(declare-fun res!99847 () Bool)

(assert (=> b!206211 (=> res!99847 e!134777)))

(assert (=> b!206211 (= res!99847 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!206211 (= lt!105304 lt!105314)))

(declare-fun lt!105310 () tuple2!3980)

(assert (=> b!206211 (= lt!105314 (+!506 lt!105311 lt!105310))))

(assert (=> b!206211 (= lt!105303 lt!105308)))

(assert (=> b!206211 (= lt!105308 (+!506 lt!105306 lt!105310))))

(assert (=> b!206211 (= lt!105303 (+!506 lt!105313 lt!105310))))

(assert (=> b!206211 (= lt!105310 (tuple2!3981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206212 () Bool)

(declare-fun res!99848 () Bool)

(assert (=> b!206212 (=> (not res!99848) (not e!134775))))

(assert (=> b!206212 (= res!99848 (= (select (arr!4521 _keys!825) i!601) k0!843))))

(declare-fun b!206213 () Bool)

(assert (=> b!206213 (= e!134778 tp_is_empty!5173)))

(declare-fun b!206214 () Bool)

(declare-fun res!99850 () Bool)

(assert (=> b!206214 (=> (not res!99850) (not e!134775))))

(assert (=> b!206214 (= res!99850 (and (= (size!4848 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4847 _keys!825) (size!4848 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206215 () Bool)

(declare-fun res!99851 () Bool)

(assert (=> b!206215 (=> (not res!99851) (not e!134775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9543 (_ BitVec 32)) Bool)

(assert (=> b!206215 (= res!99851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206216 () Bool)

(assert (=> b!206216 (= e!134776 tp_is_empty!5173)))

(assert (= (and start!20662 res!99846) b!206214))

(assert (= (and b!206214 res!99850) b!206215))

(assert (= (and b!206215 res!99851) b!206208))

(assert (= (and b!206208 res!99849) b!206205))

(assert (= (and b!206205 res!99854) b!206210))

(assert (= (and b!206210 res!99852) b!206212))

(assert (= (and b!206212 res!99848) b!206207))

(assert (= (and b!206207 (not res!99853)) b!206211))

(assert (= (and b!206211 (not res!99847)) b!206209))

(assert (= (and b!206206 condMapEmpty!8828) mapIsEmpty!8828))

(assert (= (and b!206206 (not condMapEmpty!8828)) mapNonEmpty!8828))

(get-info :version)

(assert (= (and mapNonEmpty!8828 ((_ is ValueCellFull!2243) mapValue!8828)) b!206213))

(assert (= (and b!206206 ((_ is ValueCellFull!2243) mapDefault!8828)) b!206216))

(assert (= start!20662 b!206206))

(declare-fun m!233463 () Bool)

(assert (=> b!206215 m!233463))

(declare-fun m!233465 () Bool)

(assert (=> mapNonEmpty!8828 m!233465))

(declare-fun m!233467 () Bool)

(assert (=> b!206208 m!233467))

(declare-fun m!233469 () Bool)

(assert (=> b!206212 m!233469))

(declare-fun m!233471 () Bool)

(assert (=> start!20662 m!233471))

(declare-fun m!233473 () Bool)

(assert (=> start!20662 m!233473))

(declare-fun m!233475 () Bool)

(assert (=> start!20662 m!233475))

(declare-fun m!233477 () Bool)

(assert (=> b!206209 m!233477))

(declare-fun m!233479 () Bool)

(assert (=> b!206209 m!233479))

(declare-fun m!233481 () Bool)

(assert (=> b!206210 m!233481))

(declare-fun m!233483 () Bool)

(assert (=> b!206207 m!233483))

(declare-fun m!233485 () Bool)

(assert (=> b!206207 m!233485))

(declare-fun m!233487 () Bool)

(assert (=> b!206207 m!233487))

(declare-fun m!233489 () Bool)

(assert (=> b!206207 m!233489))

(declare-fun m!233491 () Bool)

(assert (=> b!206207 m!233491))

(declare-fun m!233493 () Bool)

(assert (=> b!206207 m!233493))

(declare-fun m!233495 () Bool)

(assert (=> b!206207 m!233495))

(declare-fun m!233497 () Bool)

(assert (=> b!206211 m!233497))

(declare-fun m!233499 () Bool)

(assert (=> b!206211 m!233499))

(declare-fun m!233501 () Bool)

(assert (=> b!206211 m!233501))

(check-sat (not start!20662) (not b!206215) tp_is_empty!5173 b_and!12037 (not b!206209) (not b!206208) (not mapNonEmpty!8828) (not b!206211) (not b!206210) (not b!206207) (not b_next!5317))
(check-sat b_and!12037 (not b_next!5317))
