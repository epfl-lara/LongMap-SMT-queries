; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78894 () Bool)

(assert start!78894)

(declare-fun b_free!16939 () Bool)

(declare-fun b_next!16939 () Bool)

(assert (=> start!78894 (= b_free!16939 (not b_next!16939))))

(declare-fun tp!59259 () Bool)

(declare-fun b_and!27625 () Bool)

(assert (=> start!78894 (= tp!59259 b_and!27625)))

(declare-fun b!919232 () Bool)

(declare-fun res!619498 () Bool)

(declare-fun e!516104 () Bool)

(assert (=> b!919232 (=> (not res!619498) (not e!516104))))

(declare-datatypes ((array!54925 0))(
  ( (array!54926 (arr!26403 (Array (_ BitVec 32) (_ BitVec 64))) (size!26863 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54925)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54925 (_ BitVec 32)) Bool)

(assert (=> b!919232 (= res!619498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919233 () Bool)

(declare-fun e!516100 () Bool)

(declare-fun tp_is_empty!19447 () Bool)

(assert (=> b!919233 (= e!516100 tp_is_empty!19447)))

(declare-fun b!919234 () Bool)

(declare-fun e!516103 () Bool)

(assert (=> b!919234 (= e!516103 tp_is_empty!19447)))

(declare-fun b!919235 () Bool)

(declare-fun res!619495 () Bool)

(declare-fun e!516105 () Bool)

(assert (=> b!919235 (=> (not res!619495) (not e!516105))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919235 (= res!619495 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919236 () Bool)

(declare-fun res!619499 () Bool)

(assert (=> b!919236 (=> (not res!619499) (not e!516104))))

(assert (=> b!919236 (= res!619499 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26863 _keys!1487))))))

(declare-fun b!919237 () Bool)

(declare-fun e!516101 () Bool)

(assert (=> b!919237 (= e!516105 e!516101)))

(declare-fun res!619496 () Bool)

(assert (=> b!919237 (=> (not res!619496) (not e!516101))))

(declare-fun lt!412571 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919237 (= res!619496 (validKeyInArray!0 lt!412571))))

(assert (=> b!919237 (= lt!412571 (select (arr!26403 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919238 () Bool)

(assert (=> b!919238 (= e!516104 e!516105)))

(declare-fun res!619502 () Bool)

(assert (=> b!919238 (=> (not res!619502) (not e!516105))))

(declare-datatypes ((V!30895 0))(
  ( (V!30896 (val!9774 Int)) )
))
(declare-datatypes ((tuple2!12668 0))(
  ( (tuple2!12669 (_1!6345 (_ BitVec 64)) (_2!6345 V!30895)) )
))
(declare-datatypes ((List!18488 0))(
  ( (Nil!18485) (Cons!18484 (h!19636 tuple2!12668) (t!26149 List!18488)) )
))
(declare-datatypes ((ListLongMap!11367 0))(
  ( (ListLongMap!11368 (toList!5699 List!18488)) )
))
(declare-fun lt!412569 () ListLongMap!11367)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4753 (ListLongMap!11367 (_ BitVec 64)) Bool)

(assert (=> b!919238 (= res!619502 (contains!4753 lt!412569 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9242 0))(
  ( (ValueCellFull!9242 (v!12289 V!30895)) (EmptyCell!9242) )
))
(declare-datatypes ((array!54927 0))(
  ( (array!54928 (arr!26404 (Array (_ BitVec 32) ValueCell!9242)) (size!26864 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54927)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30895)

(declare-fun minValue!1173 () V!30895)

(declare-fun getCurrentListMap!2953 (array!54925 array!54927 (_ BitVec 32) (_ BitVec 32) V!30895 V!30895 (_ BitVec 32) Int) ListLongMap!11367)

(assert (=> b!919238 (= lt!412569 (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919239 () Bool)

(declare-fun res!619494 () Bool)

(assert (=> b!919239 (=> (not res!619494) (not e!516104))))

(declare-datatypes ((List!18489 0))(
  ( (Nil!18486) (Cons!18485 (h!19637 (_ BitVec 64)) (t!26150 List!18489)) )
))
(declare-fun arrayNoDuplicates!0 (array!54925 (_ BitVec 32) List!18489) Bool)

(assert (=> b!919239 (= res!619494 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18486))))

(declare-fun b!919240 () Bool)

(assert (=> b!919240 (= e!516101 (not true))))

(declare-fun +!2641 (ListLongMap!11367 tuple2!12668) ListLongMap!11367)

(declare-fun get!13856 (ValueCell!9242 V!30895) V!30895)

(declare-fun dynLambda!1438 (Int (_ BitVec 64)) V!30895)

(assert (=> b!919240 (= (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2641 (getCurrentListMap!2953 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12669 lt!412571 (get!13856 (select (arr!26404 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1438 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30994 0))(
  ( (Unit!30995) )
))
(declare-fun lt!412570 () Unit!30994)

(declare-fun lemmaListMapRecursiveValidKeyArray!21 (array!54925 array!54927 (_ BitVec 32) (_ BitVec 32) V!30895 V!30895 (_ BitVec 32) Int) Unit!30994)

(assert (=> b!919240 (= lt!412570 (lemmaListMapRecursiveValidKeyArray!21 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619497 () Bool)

(assert (=> start!78894 (=> (not res!619497) (not e!516104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78894 (= res!619497 (validMask!0 mask!1881))))

(assert (=> start!78894 e!516104))

(assert (=> start!78894 true))

(assert (=> start!78894 tp_is_empty!19447))

(declare-fun e!516106 () Bool)

(declare-fun array_inv!20678 (array!54927) Bool)

(assert (=> start!78894 (and (array_inv!20678 _values!1231) e!516106)))

(assert (=> start!78894 tp!59259))

(declare-fun array_inv!20679 (array!54925) Bool)

(assert (=> start!78894 (array_inv!20679 _keys!1487)))

(declare-fun mapNonEmpty!30927 () Bool)

(declare-fun mapRes!30927 () Bool)

(declare-fun tp!59258 () Bool)

(assert (=> mapNonEmpty!30927 (= mapRes!30927 (and tp!59258 e!516100))))

(declare-fun mapRest!30927 () (Array (_ BitVec 32) ValueCell!9242))

(declare-fun mapKey!30927 () (_ BitVec 32))

(declare-fun mapValue!30927 () ValueCell!9242)

(assert (=> mapNonEmpty!30927 (= (arr!26404 _values!1231) (store mapRest!30927 mapKey!30927 mapValue!30927))))

(declare-fun b!919241 () Bool)

(assert (=> b!919241 (= e!516106 (and e!516103 mapRes!30927))))

(declare-fun condMapEmpty!30927 () Bool)

(declare-fun mapDefault!30927 () ValueCell!9242)

(assert (=> b!919241 (= condMapEmpty!30927 (= (arr!26404 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9242)) mapDefault!30927)))))

(declare-fun b!919242 () Bool)

(declare-fun res!619500 () Bool)

(assert (=> b!919242 (=> (not res!619500) (not e!516105))))

(declare-fun v!791 () V!30895)

(declare-fun apply!575 (ListLongMap!11367 (_ BitVec 64)) V!30895)

(assert (=> b!919242 (= res!619500 (= (apply!575 lt!412569 k0!1099) v!791))))

(declare-fun mapIsEmpty!30927 () Bool)

(assert (=> mapIsEmpty!30927 mapRes!30927))

(declare-fun b!919243 () Bool)

(declare-fun res!619503 () Bool)

(assert (=> b!919243 (=> (not res!619503) (not e!516105))))

(assert (=> b!919243 (= res!619503 (validKeyInArray!0 k0!1099))))

(declare-fun b!919244 () Bool)

(declare-fun res!619501 () Bool)

(assert (=> b!919244 (=> (not res!619501) (not e!516104))))

(assert (=> b!919244 (= res!619501 (and (= (size!26864 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26863 _keys!1487) (size!26864 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78894 res!619497) b!919244))

(assert (= (and b!919244 res!619501) b!919232))

(assert (= (and b!919232 res!619498) b!919239))

(assert (= (and b!919239 res!619494) b!919236))

(assert (= (and b!919236 res!619499) b!919238))

(assert (= (and b!919238 res!619502) b!919242))

(assert (= (and b!919242 res!619500) b!919235))

(assert (= (and b!919235 res!619495) b!919243))

(assert (= (and b!919243 res!619503) b!919237))

(assert (= (and b!919237 res!619496) b!919240))

(assert (= (and b!919241 condMapEmpty!30927) mapIsEmpty!30927))

(assert (= (and b!919241 (not condMapEmpty!30927)) mapNonEmpty!30927))

(get-info :version)

(assert (= (and mapNonEmpty!30927 ((_ is ValueCellFull!9242) mapValue!30927)) b!919233))

(assert (= (and b!919241 ((_ is ValueCellFull!9242) mapDefault!30927)) b!919234))

(assert (= start!78894 b!919241))

(declare-fun b_lambda!13455 () Bool)

(assert (=> (not b_lambda!13455) (not b!919240)))

(declare-fun t!26148 () Bool)

(declare-fun tb!5511 () Bool)

(assert (=> (and start!78894 (= defaultEntry!1235 defaultEntry!1235) t!26148) tb!5511))

(declare-fun result!10853 () Bool)

(assert (=> tb!5511 (= result!10853 tp_is_empty!19447)))

(assert (=> b!919240 t!26148))

(declare-fun b_and!27627 () Bool)

(assert (= b_and!27625 (and (=> t!26148 result!10853) b_and!27627)))

(declare-fun m!853303 () Bool)

(assert (=> b!919237 m!853303))

(declare-fun m!853305 () Bool)

(assert (=> b!919237 m!853305))

(declare-fun m!853307 () Bool)

(assert (=> start!78894 m!853307))

(declare-fun m!853309 () Bool)

(assert (=> start!78894 m!853309))

(declare-fun m!853311 () Bool)

(assert (=> start!78894 m!853311))

(declare-fun m!853313 () Bool)

(assert (=> b!919239 m!853313))

(declare-fun m!853315 () Bool)

(assert (=> b!919240 m!853315))

(declare-fun m!853317 () Bool)

(assert (=> b!919240 m!853317))

(assert (=> b!919240 m!853315))

(assert (=> b!919240 m!853317))

(declare-fun m!853319 () Bool)

(assert (=> b!919240 m!853319))

(declare-fun m!853321 () Bool)

(assert (=> b!919240 m!853321))

(declare-fun m!853323 () Bool)

(assert (=> b!919240 m!853323))

(declare-fun m!853325 () Bool)

(assert (=> b!919240 m!853325))

(assert (=> b!919240 m!853323))

(declare-fun m!853327 () Bool)

(assert (=> b!919240 m!853327))

(declare-fun m!853329 () Bool)

(assert (=> b!919232 m!853329))

(declare-fun m!853331 () Bool)

(assert (=> b!919238 m!853331))

(declare-fun m!853333 () Bool)

(assert (=> b!919238 m!853333))

(declare-fun m!853335 () Bool)

(assert (=> b!919243 m!853335))

(declare-fun m!853337 () Bool)

(assert (=> mapNonEmpty!30927 m!853337))

(declare-fun m!853339 () Bool)

(assert (=> b!919242 m!853339))

(check-sat (not mapNonEmpty!30927) (not b_next!16939) (not b_lambda!13455) (not b!919232) b_and!27627 (not start!78894) (not b!919243) (not b!919238) (not b!919242) (not b!919237) (not b!919239) tp_is_empty!19447 (not b!919240))
(check-sat b_and!27627 (not b_next!16939))
