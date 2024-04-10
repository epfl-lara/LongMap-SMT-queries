; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78680 () Bool)

(assert start!78680)

(declare-fun b_free!16893 () Bool)

(declare-fun b_next!16893 () Bool)

(assert (=> start!78680 (= b_free!16893 (not b_next!16893))))

(declare-fun tp!59120 () Bool)

(declare-fun b_and!27523 () Bool)

(assert (=> start!78680 (= tp!59120 b_and!27523)))

(declare-fun b!917386 () Bool)

(declare-fun res!618461 () Bool)

(declare-fun e!515038 () Bool)

(assert (=> b!917386 (=> (not res!618461) (not e!515038))))

(declare-datatypes ((array!54788 0))(
  ( (array!54789 (arr!26339 (Array (_ BitVec 32) (_ BitVec 64))) (size!26798 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54788)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54788 (_ BitVec 32)) Bool)

(assert (=> b!917386 (= res!618461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917387 () Bool)

(declare-fun res!618468 () Bool)

(declare-fun e!515040 () Bool)

(assert (=> b!917387 (=> (not res!618468) (not e!515040))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30833 0))(
  ( (V!30834 (val!9751 Int)) )
))
(declare-datatypes ((tuple2!12664 0))(
  ( (tuple2!12665 (_1!6343 (_ BitVec 64)) (_2!6343 V!30833)) )
))
(declare-datatypes ((List!18474 0))(
  ( (Nil!18471) (Cons!18470 (h!19616 tuple2!12664) (t!26097 List!18474)) )
))
(declare-datatypes ((ListLongMap!11361 0))(
  ( (ListLongMap!11362 (toList!5696 List!18474)) )
))
(declare-fun lt!412002 () ListLongMap!11361)

(declare-fun v!791 () V!30833)

(declare-fun apply!549 (ListLongMap!11361 (_ BitVec 64)) V!30833)

(assert (=> b!917387 (= res!618468 (= (apply!549 lt!412002 k0!1099) v!791))))

(declare-fun b!917388 () Bool)

(declare-fun res!618462 () Bool)

(assert (=> b!917388 (=> (not res!618462) (not e!515040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917388 (= res!618462 (validKeyInArray!0 k0!1099))))

(declare-fun b!917389 () Bool)

(declare-fun res!618467 () Bool)

(assert (=> b!917389 (=> (not res!618467) (not e!515040))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917389 (= res!618467 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917390 () Bool)

(declare-fun e!515036 () Bool)

(declare-fun tp_is_empty!19401 () Bool)

(assert (=> b!917390 (= e!515036 tp_is_empty!19401)))

(declare-fun b!917391 () Bool)

(declare-fun e!515041 () Bool)

(assert (=> b!917391 (= e!515040 e!515041)))

(declare-fun res!618465 () Bool)

(assert (=> b!917391 (=> (not res!618465) (not e!515041))))

(declare-fun lt!412003 () (_ BitVec 64))

(assert (=> b!917391 (= res!618465 (validKeyInArray!0 lt!412003))))

(assert (=> b!917391 (= lt!412003 (select (arr!26339 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917392 () Bool)

(declare-fun e!515037 () Bool)

(assert (=> b!917392 (= e!515037 tp_is_empty!19401)))

(declare-fun b!917393 () Bool)

(declare-fun e!515039 () Bool)

(declare-fun mapRes!30858 () Bool)

(assert (=> b!917393 (= e!515039 (and e!515037 mapRes!30858))))

(declare-fun condMapEmpty!30858 () Bool)

(declare-datatypes ((ValueCell!9219 0))(
  ( (ValueCellFull!9219 (v!12269 V!30833)) (EmptyCell!9219) )
))
(declare-datatypes ((array!54790 0))(
  ( (array!54791 (arr!26340 (Array (_ BitVec 32) ValueCell!9219)) (size!26799 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54790)

(declare-fun mapDefault!30858 () ValueCell!9219)

(assert (=> b!917393 (= condMapEmpty!30858 (= (arr!26340 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9219)) mapDefault!30858)))))

(declare-fun b!917395 () Bool)

(declare-fun res!618466 () Bool)

(assert (=> b!917395 (=> (not res!618466) (not e!515038))))

(declare-datatypes ((List!18475 0))(
  ( (Nil!18472) (Cons!18471 (h!19617 (_ BitVec 64)) (t!26098 List!18475)) )
))
(declare-fun arrayNoDuplicates!0 (array!54788 (_ BitVec 32) List!18475) Bool)

(assert (=> b!917395 (= res!618466 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18472))))

(declare-fun b!917396 () Bool)

(assert (=> b!917396 (= e!515038 e!515040)))

(declare-fun res!618469 () Bool)

(assert (=> b!917396 (=> (not res!618469) (not e!515040))))

(declare-fun contains!4748 (ListLongMap!11361 (_ BitVec 64)) Bool)

(assert (=> b!917396 (= res!618469 (contains!4748 lt!412002 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30833)

(declare-fun minValue!1173 () V!30833)

(declare-fun getCurrentListMap!2955 (array!54788 array!54790 (_ BitVec 32) (_ BitVec 32) V!30833 V!30833 (_ BitVec 32) Int) ListLongMap!11361)

(assert (=> b!917396 (= lt!412002 (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917397 () Bool)

(declare-fun res!618463 () Bool)

(assert (=> b!917397 (=> (not res!618463) (not e!515038))))

(assert (=> b!917397 (= res!618463 (and (= (size!26799 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26798 _keys!1487) (size!26799 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917398 () Bool)

(assert (=> b!917398 (= e!515041 (not true))))

(declare-fun +!2612 (ListLongMap!11361 tuple2!12664) ListLongMap!11361)

(declare-fun get!13799 (ValueCell!9219 V!30833) V!30833)

(declare-fun dynLambda!1401 (Int (_ BitVec 64)) V!30833)

(assert (=> b!917398 (= (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2612 (getCurrentListMap!2955 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12665 lt!412003 (get!13799 (select (arr!26340 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1401 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30972 0))(
  ( (Unit!30973) )
))
(declare-fun lt!412001 () Unit!30972)

(declare-fun lemmaListMapRecursiveValidKeyArray!2 (array!54788 array!54790 (_ BitVec 32) (_ BitVec 32) V!30833 V!30833 (_ BitVec 32) Int) Unit!30972)

(assert (=> b!917398 (= lt!412001 (lemmaListMapRecursiveValidKeyArray!2 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30858 () Bool)

(assert (=> mapIsEmpty!30858 mapRes!30858))

(declare-fun mapNonEmpty!30858 () Bool)

(declare-fun tp!59119 () Bool)

(assert (=> mapNonEmpty!30858 (= mapRes!30858 (and tp!59119 e!515036))))

(declare-fun mapValue!30858 () ValueCell!9219)

(declare-fun mapRest!30858 () (Array (_ BitVec 32) ValueCell!9219))

(declare-fun mapKey!30858 () (_ BitVec 32))

(assert (=> mapNonEmpty!30858 (= (arr!26340 _values!1231) (store mapRest!30858 mapKey!30858 mapValue!30858))))

(declare-fun b!917394 () Bool)

(declare-fun res!618464 () Bool)

(assert (=> b!917394 (=> (not res!618464) (not e!515038))))

(assert (=> b!917394 (= res!618464 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26798 _keys!1487))))))

(declare-fun res!618460 () Bool)

(assert (=> start!78680 (=> (not res!618460) (not e!515038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78680 (= res!618460 (validMask!0 mask!1881))))

(assert (=> start!78680 e!515038))

(assert (=> start!78680 true))

(assert (=> start!78680 tp_is_empty!19401))

(declare-fun array_inv!20540 (array!54790) Bool)

(assert (=> start!78680 (and (array_inv!20540 _values!1231) e!515039)))

(assert (=> start!78680 tp!59120))

(declare-fun array_inv!20541 (array!54788) Bool)

(assert (=> start!78680 (array_inv!20541 _keys!1487)))

(assert (= (and start!78680 res!618460) b!917397))

(assert (= (and b!917397 res!618463) b!917386))

(assert (= (and b!917386 res!618461) b!917395))

(assert (= (and b!917395 res!618466) b!917394))

(assert (= (and b!917394 res!618464) b!917396))

(assert (= (and b!917396 res!618469) b!917387))

(assert (= (and b!917387 res!618468) b!917389))

(assert (= (and b!917389 res!618467) b!917388))

(assert (= (and b!917388 res!618462) b!917391))

(assert (= (and b!917391 res!618465) b!917398))

(assert (= (and b!917393 condMapEmpty!30858) mapIsEmpty!30858))

(assert (= (and b!917393 (not condMapEmpty!30858)) mapNonEmpty!30858))

(get-info :version)

(assert (= (and mapNonEmpty!30858 ((_ is ValueCellFull!9219) mapValue!30858)) b!917390))

(assert (= (and b!917393 ((_ is ValueCellFull!9219) mapDefault!30858)) b!917392))

(assert (= start!78680 b!917393))

(declare-fun b_lambda!13395 () Bool)

(assert (=> (not b_lambda!13395) (not b!917398)))

(declare-fun t!26096 () Bool)

(declare-fun tb!5473 () Bool)

(assert (=> (and start!78680 (= defaultEntry!1235 defaultEntry!1235) t!26096) tb!5473))

(declare-fun result!10769 () Bool)

(assert (=> tb!5473 (= result!10769 tp_is_empty!19401)))

(assert (=> b!917398 t!26096))

(declare-fun b_and!27525 () Bool)

(assert (= b_and!27523 (and (=> t!26096 result!10769) b_and!27525)))

(declare-fun m!851135 () Bool)

(assert (=> start!78680 m!851135))

(declare-fun m!851137 () Bool)

(assert (=> start!78680 m!851137))

(declare-fun m!851139 () Bool)

(assert (=> start!78680 m!851139))

(declare-fun m!851141 () Bool)

(assert (=> b!917391 m!851141))

(declare-fun m!851143 () Bool)

(assert (=> b!917391 m!851143))

(declare-fun m!851145 () Bool)

(assert (=> mapNonEmpty!30858 m!851145))

(declare-fun m!851147 () Bool)

(assert (=> b!917386 m!851147))

(declare-fun m!851149 () Bool)

(assert (=> b!917396 m!851149))

(declare-fun m!851151 () Bool)

(assert (=> b!917396 m!851151))

(declare-fun m!851153 () Bool)

(assert (=> b!917395 m!851153))

(declare-fun m!851155 () Bool)

(assert (=> b!917387 m!851155))

(declare-fun m!851157 () Bool)

(assert (=> b!917398 m!851157))

(declare-fun m!851159 () Bool)

(assert (=> b!917398 m!851159))

(declare-fun m!851161 () Bool)

(assert (=> b!917398 m!851161))

(declare-fun m!851163 () Bool)

(assert (=> b!917398 m!851163))

(assert (=> b!917398 m!851161))

(assert (=> b!917398 m!851163))

(declare-fun m!851165 () Bool)

(assert (=> b!917398 m!851165))

(declare-fun m!851167 () Bool)

(assert (=> b!917398 m!851167))

(assert (=> b!917398 m!851157))

(declare-fun m!851169 () Bool)

(assert (=> b!917398 m!851169))

(declare-fun m!851171 () Bool)

(assert (=> b!917388 m!851171))

(check-sat (not b_lambda!13395) (not b!917396) (not start!78680) (not b!917395) tp_is_empty!19401 (not b!917398) (not b_next!16893) b_and!27525 (not mapNonEmpty!30858) (not b!917386) (not b!917388) (not b!917391) (not b!917387))
(check-sat b_and!27525 (not b_next!16893))
