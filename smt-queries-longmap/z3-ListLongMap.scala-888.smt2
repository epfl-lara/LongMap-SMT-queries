; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20426 () Bool)

(assert start!20426)

(declare-fun b_free!5085 () Bool)

(declare-fun b_next!5085 () Bool)

(assert (=> start!20426 (= b_free!5085 (not b_next!5085))))

(declare-fun tp!18286 () Bool)

(declare-fun b_and!11831 () Bool)

(assert (=> start!20426 (= tp!18286 b_and!11831)))

(declare-fun b!202158 () Bool)

(declare-fun res!96798 () Bool)

(declare-fun e!132444 () Bool)

(assert (=> b!202158 (=> (not res!96798) (not e!132444))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202158 (= res!96798 (validKeyInArray!0 k0!843))))

(declare-fun b!202159 () Bool)

(declare-fun e!132446 () Bool)

(assert (=> b!202159 (= e!132444 (not e!132446))))

(declare-fun res!96793 () Bool)

(assert (=> b!202159 (=> res!96793 e!132446)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202159 (= res!96793 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6235 0))(
  ( (V!6236 (val!2515 Int)) )
))
(declare-fun zeroValue!615 () V!6235)

(declare-datatypes ((array!9107 0))(
  ( (array!9108 (arr!4304 (Array (_ BitVec 32) (_ BitVec 64))) (size!4629 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9107)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6235)

(declare-datatypes ((ValueCell!2127 0))(
  ( (ValueCellFull!2127 (v!4485 V!6235)) (EmptyCell!2127) )
))
(declare-datatypes ((array!9109 0))(
  ( (array!9110 (arr!4305 (Array (_ BitVec 32) ValueCell!2127)) (size!4630 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9109)

(declare-datatypes ((tuple2!3810 0))(
  ( (tuple2!3811 (_1!1916 (_ BitVec 64)) (_2!1916 V!6235)) )
))
(declare-datatypes ((List!2719 0))(
  ( (Nil!2716) (Cons!2715 (h!3357 tuple2!3810) (t!7650 List!2719)) )
))
(declare-datatypes ((ListLongMap!2723 0))(
  ( (ListLongMap!2724 (toList!1377 List!2719)) )
))
(declare-fun lt!101330 () ListLongMap!2723)

(declare-fun getCurrentListMap!960 (array!9107 array!9109 (_ BitVec 32) (_ BitVec 32) V!6235 V!6235 (_ BitVec 32) Int) ListLongMap!2723)

(assert (=> b!202159 (= lt!101330 (getCurrentListMap!960 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101343 () array!9109)

(declare-fun lt!101332 () ListLongMap!2723)

(assert (=> b!202159 (= lt!101332 (getCurrentListMap!960 _keys!825 lt!101343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101333 () ListLongMap!2723)

(declare-fun lt!101331 () ListLongMap!2723)

(assert (=> b!202159 (and (= lt!101333 lt!101331) (= lt!101331 lt!101333))))

(declare-fun lt!101334 () ListLongMap!2723)

(declare-fun lt!101339 () tuple2!3810)

(declare-fun +!404 (ListLongMap!2723 tuple2!3810) ListLongMap!2723)

(assert (=> b!202159 (= lt!101331 (+!404 lt!101334 lt!101339))))

(declare-fun v!520 () V!6235)

(assert (=> b!202159 (= lt!101339 (tuple2!3811 k0!843 v!520))))

(declare-datatypes ((Unit!6108 0))(
  ( (Unit!6109) )
))
(declare-fun lt!101335 () Unit!6108)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 (array!9107 array!9109 (_ BitVec 32) (_ BitVec 32) V!6235 V!6235 (_ BitVec 32) (_ BitVec 64) V!6235 (_ BitVec 32) Int) Unit!6108)

(assert (=> b!202159 (= lt!101335 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!334 (array!9107 array!9109 (_ BitVec 32) (_ BitVec 32) V!6235 V!6235 (_ BitVec 32) Int) ListLongMap!2723)

(assert (=> b!202159 (= lt!101333 (getCurrentListMapNoExtraKeys!334 _keys!825 lt!101343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202159 (= lt!101343 (array!9110 (store (arr!4305 _values!649) i!601 (ValueCellFull!2127 v!520)) (size!4630 _values!649)))))

(assert (=> b!202159 (= lt!101334 (getCurrentListMapNoExtraKeys!334 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202160 () Bool)

(declare-fun e!132442 () Bool)

(declare-fun tp_is_empty!4941 () Bool)

(assert (=> b!202160 (= e!132442 tp_is_empty!4941)))

(declare-fun b!202161 () Bool)

(declare-fun res!96796 () Bool)

(assert (=> b!202161 (=> (not res!96796) (not e!132444))))

(assert (=> b!202161 (= res!96796 (and (= (size!4630 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4629 _keys!825) (size!4630 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202162 () Bool)

(declare-fun e!132441 () Bool)

(assert (=> b!202162 (= e!132441 true)))

(declare-fun lt!101336 () ListLongMap!2723)

(declare-fun lt!101329 () ListLongMap!2723)

(declare-fun lt!101337 () tuple2!3810)

(assert (=> b!202162 (= (+!404 lt!101329 lt!101337) (+!404 lt!101336 lt!101339))))

(declare-fun lt!101341 () ListLongMap!2723)

(declare-fun lt!101340 () Unit!6108)

(declare-fun addCommutativeForDiffKeys!125 (ListLongMap!2723 (_ BitVec 64) V!6235 (_ BitVec 64) V!6235) Unit!6108)

(assert (=> b!202162 (= lt!101340 (addCommutativeForDiffKeys!125 lt!101341 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8480 () Bool)

(declare-fun mapRes!8480 () Bool)

(assert (=> mapIsEmpty!8480 mapRes!8480))

(declare-fun b!202163 () Bool)

(declare-fun e!132440 () Bool)

(assert (=> b!202163 (= e!132440 tp_is_empty!4941)))

(declare-fun b!202164 () Bool)

(declare-fun e!132443 () Bool)

(assert (=> b!202164 (= e!132443 (and e!132440 mapRes!8480))))

(declare-fun condMapEmpty!8480 () Bool)

(declare-fun mapDefault!8480 () ValueCell!2127)

(assert (=> b!202164 (= condMapEmpty!8480 (= (arr!4305 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2127)) mapDefault!8480)))))

(declare-fun b!202165 () Bool)

(assert (=> b!202165 (= e!132446 e!132441)))

(declare-fun res!96795 () Bool)

(assert (=> b!202165 (=> res!96795 e!132441)))

(assert (=> b!202165 (= res!96795 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101338 () ListLongMap!2723)

(assert (=> b!202165 (= lt!101338 lt!101329)))

(assert (=> b!202165 (= lt!101329 (+!404 lt!101341 lt!101339))))

(declare-fun lt!101342 () Unit!6108)

(assert (=> b!202165 (= lt!101342 (addCommutativeForDiffKeys!125 lt!101334 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!202165 (= lt!101332 (+!404 lt!101338 lt!101337))))

(declare-fun lt!101328 () tuple2!3810)

(assert (=> b!202165 (= lt!101338 (+!404 lt!101331 lt!101328))))

(assert (=> b!202165 (= lt!101330 lt!101336)))

(assert (=> b!202165 (= lt!101336 (+!404 lt!101341 lt!101337))))

(assert (=> b!202165 (= lt!101341 (+!404 lt!101334 lt!101328))))

(assert (=> b!202165 (= lt!101332 (+!404 (+!404 lt!101333 lt!101328) lt!101337))))

(assert (=> b!202165 (= lt!101337 (tuple2!3811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202165 (= lt!101328 (tuple2!3811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8480 () Bool)

(declare-fun tp!18287 () Bool)

(assert (=> mapNonEmpty!8480 (= mapRes!8480 (and tp!18287 e!132442))))

(declare-fun mapValue!8480 () ValueCell!2127)

(declare-fun mapRest!8480 () (Array (_ BitVec 32) ValueCell!2127))

(declare-fun mapKey!8480 () (_ BitVec 32))

(assert (=> mapNonEmpty!8480 (= (arr!4305 _values!649) (store mapRest!8480 mapKey!8480 mapValue!8480))))

(declare-fun b!202166 () Bool)

(declare-fun res!96794 () Bool)

(assert (=> b!202166 (=> (not res!96794) (not e!132444))))

(declare-datatypes ((List!2720 0))(
  ( (Nil!2717) (Cons!2716 (h!3358 (_ BitVec 64)) (t!7651 List!2720)) )
))
(declare-fun arrayNoDuplicates!0 (array!9107 (_ BitVec 32) List!2720) Bool)

(assert (=> b!202166 (= res!96794 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2717))))

(declare-fun b!202167 () Bool)

(declare-fun res!96797 () Bool)

(assert (=> b!202167 (=> (not res!96797) (not e!132444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9107 (_ BitVec 32)) Bool)

(assert (=> b!202167 (= res!96797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202168 () Bool)

(declare-fun res!96791 () Bool)

(assert (=> b!202168 (=> (not res!96791) (not e!132444))))

(assert (=> b!202168 (= res!96791 (= (select (arr!4304 _keys!825) i!601) k0!843))))

(declare-fun res!96799 () Bool)

(assert (=> start!20426 (=> (not res!96799) (not e!132444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20426 (= res!96799 (validMask!0 mask!1149))))

(assert (=> start!20426 e!132444))

(declare-fun array_inv!2841 (array!9109) Bool)

(assert (=> start!20426 (and (array_inv!2841 _values!649) e!132443)))

(assert (=> start!20426 true))

(assert (=> start!20426 tp_is_empty!4941))

(declare-fun array_inv!2842 (array!9107) Bool)

(assert (=> start!20426 (array_inv!2842 _keys!825)))

(assert (=> start!20426 tp!18286))

(declare-fun b!202169 () Bool)

(declare-fun res!96792 () Bool)

(assert (=> b!202169 (=> (not res!96792) (not e!132444))))

(assert (=> b!202169 (= res!96792 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4629 _keys!825))))))

(assert (= (and start!20426 res!96799) b!202161))

(assert (= (and b!202161 res!96796) b!202167))

(assert (= (and b!202167 res!96797) b!202166))

(assert (= (and b!202166 res!96794) b!202169))

(assert (= (and b!202169 res!96792) b!202158))

(assert (= (and b!202158 res!96798) b!202168))

(assert (= (and b!202168 res!96791) b!202159))

(assert (= (and b!202159 (not res!96793)) b!202165))

(assert (= (and b!202165 (not res!96795)) b!202162))

(assert (= (and b!202164 condMapEmpty!8480) mapIsEmpty!8480))

(assert (= (and b!202164 (not condMapEmpty!8480)) mapNonEmpty!8480))

(get-info :version)

(assert (= (and mapNonEmpty!8480 ((_ is ValueCellFull!2127) mapValue!8480)) b!202160))

(assert (= (and b!202164 ((_ is ValueCellFull!2127) mapDefault!8480)) b!202163))

(assert (= start!20426 b!202164))

(declare-fun m!229403 () Bool)

(assert (=> b!202158 m!229403))

(declare-fun m!229405 () Bool)

(assert (=> b!202166 m!229405))

(declare-fun m!229407 () Bool)

(assert (=> start!20426 m!229407))

(declare-fun m!229409 () Bool)

(assert (=> start!20426 m!229409))

(declare-fun m!229411 () Bool)

(assert (=> start!20426 m!229411))

(declare-fun m!229413 () Bool)

(assert (=> b!202168 m!229413))

(declare-fun m!229415 () Bool)

(assert (=> mapNonEmpty!8480 m!229415))

(declare-fun m!229417 () Bool)

(assert (=> b!202159 m!229417))

(declare-fun m!229419 () Bool)

(assert (=> b!202159 m!229419))

(declare-fun m!229421 () Bool)

(assert (=> b!202159 m!229421))

(declare-fun m!229423 () Bool)

(assert (=> b!202159 m!229423))

(declare-fun m!229425 () Bool)

(assert (=> b!202159 m!229425))

(declare-fun m!229427 () Bool)

(assert (=> b!202159 m!229427))

(declare-fun m!229429 () Bool)

(assert (=> b!202159 m!229429))

(declare-fun m!229431 () Bool)

(assert (=> b!202165 m!229431))

(declare-fun m!229433 () Bool)

(assert (=> b!202165 m!229433))

(declare-fun m!229435 () Bool)

(assert (=> b!202165 m!229435))

(declare-fun m!229437 () Bool)

(assert (=> b!202165 m!229437))

(declare-fun m!229439 () Bool)

(assert (=> b!202165 m!229439))

(declare-fun m!229441 () Bool)

(assert (=> b!202165 m!229441))

(declare-fun m!229443 () Bool)

(assert (=> b!202165 m!229443))

(assert (=> b!202165 m!229443))

(declare-fun m!229445 () Bool)

(assert (=> b!202165 m!229445))

(declare-fun m!229447 () Bool)

(assert (=> b!202167 m!229447))

(declare-fun m!229449 () Bool)

(assert (=> b!202162 m!229449))

(declare-fun m!229451 () Bool)

(assert (=> b!202162 m!229451))

(declare-fun m!229453 () Bool)

(assert (=> b!202162 m!229453))

(check-sat (not mapNonEmpty!8480) (not b!202159) (not start!20426) b_and!11831 tp_is_empty!4941 (not b!202165) (not b_next!5085) (not b!202166) (not b!202167) (not b!202158) (not b!202162))
(check-sat b_and!11831 (not b_next!5085))
