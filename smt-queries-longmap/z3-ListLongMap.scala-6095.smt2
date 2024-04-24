; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78846 () Bool)

(assert start!78846)

(declare-fun b_free!16891 () Bool)

(declare-fun b_next!16891 () Bool)

(assert (=> start!78846 (= b_free!16891 (not b_next!16891))))

(declare-fun tp!59115 () Bool)

(declare-fun b_and!27529 () Bool)

(assert (=> start!78846 (= tp!59115 b_and!27529)))

(declare-fun b!918248 () Bool)

(declare-fun e!515598 () Bool)

(declare-fun e!515596 () Bool)

(assert (=> b!918248 (= e!515598 e!515596)))

(declare-fun res!618777 () Bool)

(assert (=> b!918248 (=> (not res!618777) (not e!515596))))

(declare-fun lt!412353 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918248 (= res!618777 (validKeyInArray!0 lt!412353))))

(declare-datatypes ((array!54831 0))(
  ( (array!54832 (arr!26356 (Array (_ BitVec 32) (_ BitVec 64))) (size!26816 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54831)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918248 (= lt!412353 (select (arr!26356 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918249 () Bool)

(assert (=> b!918249 (= e!515596 (not true))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30831 0))(
  ( (V!30832 (val!9750 Int)) )
))
(declare-datatypes ((ValueCell!9218 0))(
  ( (ValueCellFull!9218 (v!12265 V!30831)) (EmptyCell!9218) )
))
(declare-datatypes ((array!54833 0))(
  ( (array!54834 (arr!26357 (Array (_ BitVec 32) ValueCell!9218)) (size!26817 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54833)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30831)

(declare-fun minValue!1173 () V!30831)

(declare-datatypes ((tuple2!12626 0))(
  ( (tuple2!12627 (_1!6324 (_ BitVec 64)) (_2!6324 V!30831)) )
))
(declare-datatypes ((List!18448 0))(
  ( (Nil!18445) (Cons!18444 (h!19596 tuple2!12626) (t!26061 List!18448)) )
))
(declare-datatypes ((ListLongMap!11325 0))(
  ( (ListLongMap!11326 (toList!5678 List!18448)) )
))
(declare-fun getCurrentListMap!2933 (array!54831 array!54833 (_ BitVec 32) (_ BitVec 32) V!30831 V!30831 (_ BitVec 32) Int) ListLongMap!11325)

(declare-fun +!2623 (ListLongMap!11325 tuple2!12626) ListLongMap!11325)

(declare-fun get!13822 (ValueCell!9218 V!30831) V!30831)

(declare-fun dynLambda!1420 (Int (_ BitVec 64)) V!30831)

(assert (=> b!918249 (= (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2623 (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12627 lt!412353 (get!13822 (select (arr!26357 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1420 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30958 0))(
  ( (Unit!30959) )
))
(declare-fun lt!412355 () Unit!30958)

(declare-fun lemmaListMapRecursiveValidKeyArray!3 (array!54831 array!54833 (_ BitVec 32) (_ BitVec 32) V!30831 V!30831 (_ BitVec 32) Int) Unit!30958)

(assert (=> b!918249 (= lt!412355 (lemmaListMapRecursiveValidKeyArray!3 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918250 () Bool)

(declare-fun e!515600 () Bool)

(declare-fun e!515601 () Bool)

(declare-fun mapRes!30855 () Bool)

(assert (=> b!918250 (= e!515600 (and e!515601 mapRes!30855))))

(declare-fun condMapEmpty!30855 () Bool)

(declare-fun mapDefault!30855 () ValueCell!9218)

(assert (=> b!918250 (= condMapEmpty!30855 (= (arr!26357 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9218)) mapDefault!30855)))))

(declare-fun b!918251 () Bool)

(declare-fun res!618782 () Bool)

(declare-fun e!515602 () Bool)

(assert (=> b!918251 (=> (not res!618782) (not e!515602))))

(declare-datatypes ((List!18449 0))(
  ( (Nil!18446) (Cons!18445 (h!19597 (_ BitVec 64)) (t!26062 List!18449)) )
))
(declare-fun arrayNoDuplicates!0 (array!54831 (_ BitVec 32) List!18449) Bool)

(assert (=> b!918251 (= res!618782 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18446))))

(declare-fun b!918252 () Bool)

(declare-fun tp_is_empty!19399 () Bool)

(assert (=> b!918252 (= e!515601 tp_is_empty!19399)))

(declare-fun b!918253 () Bool)

(declare-fun res!618779 () Bool)

(assert (=> b!918253 (=> (not res!618779) (not e!515598))))

(assert (=> b!918253 (= res!618779 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918254 () Bool)

(assert (=> b!918254 (= e!515602 e!515598)))

(declare-fun res!618783 () Bool)

(assert (=> b!918254 (=> (not res!618783) (not e!515598))))

(declare-fun lt!412354 () ListLongMap!11325)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4736 (ListLongMap!11325 (_ BitVec 64)) Bool)

(assert (=> b!918254 (= res!618783 (contains!4736 lt!412354 k0!1099))))

(assert (=> b!918254 (= lt!412354 (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30855 () Bool)

(assert (=> mapIsEmpty!30855 mapRes!30855))

(declare-fun b!918255 () Bool)

(declare-fun res!618780 () Bool)

(assert (=> b!918255 (=> (not res!618780) (not e!515602))))

(assert (=> b!918255 (= res!618780 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26816 _keys!1487))))))

(declare-fun b!918256 () Bool)

(declare-fun res!618781 () Bool)

(assert (=> b!918256 (=> (not res!618781) (not e!515602))))

(assert (=> b!918256 (= res!618781 (and (= (size!26817 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26816 _keys!1487) (size!26817 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!618776 () Bool)

(assert (=> start!78846 (=> (not res!618776) (not e!515602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78846 (= res!618776 (validMask!0 mask!1881))))

(assert (=> start!78846 e!515602))

(assert (=> start!78846 true))

(assert (=> start!78846 tp_is_empty!19399))

(declare-fun array_inv!20652 (array!54833) Bool)

(assert (=> start!78846 (and (array_inv!20652 _values!1231) e!515600)))

(assert (=> start!78846 tp!59115))

(declare-fun array_inv!20653 (array!54831) Bool)

(assert (=> start!78846 (array_inv!20653 _keys!1487)))

(declare-fun b!918257 () Bool)

(declare-fun res!618778 () Bool)

(assert (=> b!918257 (=> (not res!618778) (not e!515602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54831 (_ BitVec 32)) Bool)

(assert (=> b!918257 (= res!618778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918258 () Bool)

(declare-fun e!515597 () Bool)

(assert (=> b!918258 (= e!515597 tp_is_empty!19399)))

(declare-fun b!918259 () Bool)

(declare-fun res!618774 () Bool)

(assert (=> b!918259 (=> (not res!618774) (not e!515598))))

(declare-fun v!791 () V!30831)

(declare-fun apply!558 (ListLongMap!11325 (_ BitVec 64)) V!30831)

(assert (=> b!918259 (= res!618774 (= (apply!558 lt!412354 k0!1099) v!791))))

(declare-fun b!918260 () Bool)

(declare-fun res!618775 () Bool)

(assert (=> b!918260 (=> (not res!618775) (not e!515598))))

(assert (=> b!918260 (= res!618775 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!30855 () Bool)

(declare-fun tp!59114 () Bool)

(assert (=> mapNonEmpty!30855 (= mapRes!30855 (and tp!59114 e!515597))))

(declare-fun mapKey!30855 () (_ BitVec 32))

(declare-fun mapValue!30855 () ValueCell!9218)

(declare-fun mapRest!30855 () (Array (_ BitVec 32) ValueCell!9218))

(assert (=> mapNonEmpty!30855 (= (arr!26357 _values!1231) (store mapRest!30855 mapKey!30855 mapValue!30855))))

(assert (= (and start!78846 res!618776) b!918256))

(assert (= (and b!918256 res!618781) b!918257))

(assert (= (and b!918257 res!618778) b!918251))

(assert (= (and b!918251 res!618782) b!918255))

(assert (= (and b!918255 res!618780) b!918254))

(assert (= (and b!918254 res!618783) b!918259))

(assert (= (and b!918259 res!618774) b!918253))

(assert (= (and b!918253 res!618779) b!918260))

(assert (= (and b!918260 res!618775) b!918248))

(assert (= (and b!918248 res!618777) b!918249))

(assert (= (and b!918250 condMapEmpty!30855) mapIsEmpty!30855))

(assert (= (and b!918250 (not condMapEmpty!30855)) mapNonEmpty!30855))

(get-info :version)

(assert (= (and mapNonEmpty!30855 ((_ is ValueCellFull!9218) mapValue!30855)) b!918258))

(assert (= (and b!918250 ((_ is ValueCellFull!9218) mapDefault!30855)) b!918252))

(assert (= start!78846 b!918250))

(declare-fun b_lambda!13407 () Bool)

(assert (=> (not b_lambda!13407) (not b!918249)))

(declare-fun t!26060 () Bool)

(declare-fun tb!5463 () Bool)

(assert (=> (and start!78846 (= defaultEntry!1235 defaultEntry!1235) t!26060) tb!5463))

(declare-fun result!10757 () Bool)

(assert (=> tb!5463 (= result!10757 tp_is_empty!19399)))

(assert (=> b!918249 t!26060))

(declare-fun b_and!27531 () Bool)

(assert (= b_and!27529 (and (=> t!26060 result!10757) b_and!27531)))

(declare-fun m!852391 () Bool)

(assert (=> b!918254 m!852391))

(declare-fun m!852393 () Bool)

(assert (=> b!918254 m!852393))

(declare-fun m!852395 () Bool)

(assert (=> b!918257 m!852395))

(declare-fun m!852397 () Bool)

(assert (=> start!78846 m!852397))

(declare-fun m!852399 () Bool)

(assert (=> start!78846 m!852399))

(declare-fun m!852401 () Bool)

(assert (=> start!78846 m!852401))

(declare-fun m!852403 () Bool)

(assert (=> b!918248 m!852403))

(declare-fun m!852405 () Bool)

(assert (=> b!918248 m!852405))

(declare-fun m!852407 () Bool)

(assert (=> b!918251 m!852407))

(declare-fun m!852409 () Bool)

(assert (=> mapNonEmpty!30855 m!852409))

(declare-fun m!852411 () Bool)

(assert (=> b!918259 m!852411))

(declare-fun m!852413 () Bool)

(assert (=> b!918260 m!852413))

(declare-fun m!852415 () Bool)

(assert (=> b!918249 m!852415))

(declare-fun m!852417 () Bool)

(assert (=> b!918249 m!852417))

(declare-fun m!852419 () Bool)

(assert (=> b!918249 m!852419))

(declare-fun m!852421 () Bool)

(assert (=> b!918249 m!852421))

(assert (=> b!918249 m!852419))

(assert (=> b!918249 m!852421))

(declare-fun m!852423 () Bool)

(assert (=> b!918249 m!852423))

(declare-fun m!852425 () Bool)

(assert (=> b!918249 m!852425))

(assert (=> b!918249 m!852415))

(declare-fun m!852427 () Bool)

(assert (=> b!918249 m!852427))

(check-sat (not b!918248) tp_is_empty!19399 (not start!78846) (not b!918251) (not b!918260) (not b!918257) (not b!918259) (not b_lambda!13407) b_and!27531 (not b!918249) (not b_next!16891) (not b!918254) (not mapNonEmpty!30855))
(check-sat b_and!27531 (not b_next!16891))
