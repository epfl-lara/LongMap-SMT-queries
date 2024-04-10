; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79096 () Bool)

(assert start!79096)

(declare-fun b_free!17309 () Bool)

(declare-fun b_next!17309 () Bool)

(assert (=> start!79096 (= b_free!17309 (not b_next!17309))))

(declare-fun tp!60368 () Bool)

(declare-fun b_and!28355 () Bool)

(assert (=> start!79096 (= tp!60368 b_and!28355)))

(declare-fun b!927995 () Bool)

(declare-fun e!521008 () Bool)

(declare-fun e!521014 () Bool)

(assert (=> b!927995 (= e!521008 e!521014)))

(declare-fun res!624987 () Bool)

(assert (=> b!927995 (=> (not res!624987) (not e!521014))))

(declare-datatypes ((V!31387 0))(
  ( (V!31388 (val!9959 Int)) )
))
(declare-datatypes ((tuple2!13006 0))(
  ( (tuple2!13007 (_1!6514 (_ BitVec 64)) (_2!6514 V!31387)) )
))
(declare-datatypes ((List!18806 0))(
  ( (Nil!18803) (Cons!18802 (h!19948 tuple2!13006) (t!26845 List!18806)) )
))
(declare-datatypes ((ListLongMap!11703 0))(
  ( (ListLongMap!11704 (toList!5867 List!18806)) )
))
(declare-fun lt!418452 () ListLongMap!11703)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4925 (ListLongMap!11703 (_ BitVec 64)) Bool)

(assert (=> b!927995 (= res!624987 (contains!4925 lt!418452 k!1099))))

(declare-datatypes ((array!55594 0))(
  ( (array!55595 (arr!26742 (Array (_ BitVec 32) (_ BitVec 64))) (size!27201 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55594)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9427 0))(
  ( (ValueCellFull!9427 (v!12477 V!31387)) (EmptyCell!9427) )
))
(declare-datatypes ((array!55596 0))(
  ( (array!55597 (arr!26743 (Array (_ BitVec 32) ValueCell!9427)) (size!27202 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55596)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31387)

(declare-fun minValue!1173 () V!31387)

(declare-fun getCurrentListMap!3116 (array!55594 array!55596 (_ BitVec 32) (_ BitVec 32) V!31387 V!31387 (_ BitVec 32) Int) ListLongMap!11703)

(assert (=> b!927995 (= lt!418452 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927996 () Bool)

(declare-fun e!521017 () Bool)

(declare-fun tp_is_empty!19817 () Bool)

(assert (=> b!927996 (= e!521017 tp_is_empty!19817)))

(declare-fun b!927997 () Bool)

(declare-fun e!521020 () Bool)

(declare-fun e!521010 () Bool)

(assert (=> b!927997 (= e!521020 e!521010)))

(declare-fun res!624989 () Bool)

(assert (=> b!927997 (=> (not res!624989) (not e!521010))))

(declare-fun lt!418446 () ListLongMap!11703)

(assert (=> b!927997 (= res!624989 (contains!4925 lt!418446 k!1099))))

(assert (=> b!927997 (= lt!418446 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927998 () Bool)

(assert (=> b!927998 (= e!521010 (not true))))

(declare-fun e!521012 () Bool)

(assert (=> b!927998 e!521012))

(declare-fun res!624994 () Bool)

(assert (=> b!927998 (=> (not res!624994) (not e!521012))))

(declare-fun lt!418448 () ListLongMap!11703)

(assert (=> b!927998 (= res!624994 (contains!4925 lt!418448 k!1099))))

(assert (=> b!927998 (= lt!418448 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31398 0))(
  ( (Unit!31399) )
))
(declare-fun lt!418447 () Unit!31398)

(declare-fun v!791 () V!31387)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!96 (array!55594 array!55596 (_ BitVec 32) (_ BitVec 32) V!31387 V!31387 (_ BitVec 64) V!31387 (_ BitVec 32) Int) Unit!31398)

(assert (=> b!927998 (= lt!418447 (lemmaListMapApplyFromThenApplyFromZero!96 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927999 () Bool)

(declare-fun e!521011 () Bool)

(declare-fun arrayContainsKey!0 (array!55594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927999 (= e!521011 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!928000 () Bool)

(declare-fun e!521009 () Unit!31398)

(declare-fun e!521019 () Unit!31398)

(assert (=> b!928000 (= e!521009 e!521019)))

(declare-fun lt!418454 () (_ BitVec 64))

(assert (=> b!928000 (= lt!418454 (select (arr!26742 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96950 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928000 (= c!96950 (validKeyInArray!0 lt!418454))))

(declare-fun mapNonEmpty!31482 () Bool)

(declare-fun mapRes!31482 () Bool)

(declare-fun tp!60367 () Bool)

(declare-fun e!521018 () Bool)

(assert (=> mapNonEmpty!31482 (= mapRes!31482 (and tp!60367 e!521018))))

(declare-fun mapKey!31482 () (_ BitVec 32))

(declare-fun mapRest!31482 () (Array (_ BitVec 32) ValueCell!9427))

(declare-fun mapValue!31482 () ValueCell!9427)

(assert (=> mapNonEmpty!31482 (= (arr!26743 _values!1231) (store mapRest!31482 mapKey!31482 mapValue!31482))))

(declare-fun b!928001 () Bool)

(declare-fun res!624993 () Bool)

(assert (=> b!928001 (=> (not res!624993) (not e!521010))))

(declare-fun apply!697 (ListLongMap!11703 (_ BitVec 64)) V!31387)

(assert (=> b!928001 (= res!624993 (= (apply!697 lt!418446 k!1099) v!791))))

(declare-fun b!928002 () Bool)

(declare-fun Unit!31400 () Unit!31398)

(assert (=> b!928002 (= e!521019 Unit!31400)))

(declare-fun b!928003 () Bool)

(declare-fun lt!418450 () ListLongMap!11703)

(declare-fun lt!418443 () V!31387)

(assert (=> b!928003 (= (apply!697 lt!418450 k!1099) lt!418443)))

(declare-fun lt!418445 () V!31387)

(declare-fun lt!418442 () Unit!31398)

(declare-fun addApplyDifferent!411 (ListLongMap!11703 (_ BitVec 64) V!31387 (_ BitVec 64)) Unit!31398)

(assert (=> b!928003 (= lt!418442 (addApplyDifferent!411 lt!418452 lt!418454 lt!418445 k!1099))))

(assert (=> b!928003 (not (= lt!418454 k!1099))))

(declare-fun lt!418456 () Unit!31398)

(declare-datatypes ((List!18807 0))(
  ( (Nil!18804) (Cons!18803 (h!19949 (_ BitVec 64)) (t!26846 List!18807)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55594 (_ BitVec 64) (_ BitVec 32) List!18807) Unit!31398)

(assert (=> b!928003 (= lt!418456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18804))))

(assert (=> b!928003 e!521011))

(declare-fun c!96951 () Bool)

(assert (=> b!928003 (= c!96951 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418441 () Unit!31398)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!262 (array!55594 array!55596 (_ BitVec 32) (_ BitVec 32) V!31387 V!31387 (_ BitVec 64) (_ BitVec 32) Int) Unit!31398)

(assert (=> b!928003 (= lt!418441 (lemmaListMapContainsThenArrayContainsFrom!262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55594 (_ BitVec 32) List!18807) Bool)

(assert (=> b!928003 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18804)))

(declare-fun lt!418449 () Unit!31398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55594 (_ BitVec 32) (_ BitVec 32)) Unit!31398)

(assert (=> b!928003 (= lt!418449 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928003 (contains!4925 lt!418450 k!1099)))

(declare-fun lt!418451 () tuple2!13006)

(declare-fun +!2755 (ListLongMap!11703 tuple2!13006) ListLongMap!11703)

(assert (=> b!928003 (= lt!418450 (+!2755 lt!418452 lt!418451))))

(declare-fun lt!418444 () Unit!31398)

(declare-fun addStillContains!479 (ListLongMap!11703 (_ BitVec 64) V!31387 (_ BitVec 64)) Unit!31398)

(assert (=> b!928003 (= lt!418444 (addStillContains!479 lt!418452 lt!418454 lt!418445 k!1099))))

(assert (=> b!928003 (= (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2755 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418451))))

(assert (=> b!928003 (= lt!418451 (tuple2!13007 lt!418454 lt!418445))))

(declare-fun get!14080 (ValueCell!9427 V!31387) V!31387)

(declare-fun dynLambda!1544 (Int (_ BitVec 64)) V!31387)

(assert (=> b!928003 (= lt!418445 (get!14080 (select (arr!26743 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1544 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418453 () Unit!31398)

(declare-fun lemmaListMapRecursiveValidKeyArray!145 (array!55594 array!55596 (_ BitVec 32) (_ BitVec 32) V!31387 V!31387 (_ BitVec 32) Int) Unit!31398)

(assert (=> b!928003 (= lt!418453 (lemmaListMapRecursiveValidKeyArray!145 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928003 (= e!521019 lt!418442)))

(declare-fun b!928004 () Bool)

(declare-fun res!624990 () Bool)

(assert (=> b!928004 (=> (not res!624990) (not e!521008))))

(assert (=> b!928004 (= res!624990 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18804))))

(declare-fun b!928005 () Bool)

(assert (=> b!928005 (= e!521011 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928006 () Bool)

(declare-fun res!624992 () Bool)

(assert (=> b!928006 (=> (not res!624992) (not e!521008))))

(assert (=> b!928006 (= res!624992 (and (= (size!27202 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27201 _keys!1487) (size!27202 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928007 () Bool)

(declare-fun e!521015 () Bool)

(assert (=> b!928007 (= e!521014 e!521015)))

(declare-fun res!624997 () Bool)

(assert (=> b!928007 (=> (not res!624997) (not e!521015))))

(assert (=> b!928007 (= res!624997 (and (= lt!418443 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928007 (= lt!418443 (apply!697 lt!418452 k!1099))))

(declare-fun res!624995 () Bool)

(assert (=> start!79096 (=> (not res!624995) (not e!521008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79096 (= res!624995 (validMask!0 mask!1881))))

(assert (=> start!79096 e!521008))

(assert (=> start!79096 true))

(assert (=> start!79096 tp_is_empty!19817))

(declare-fun e!521013 () Bool)

(declare-fun array_inv!20822 (array!55596) Bool)

(assert (=> start!79096 (and (array_inv!20822 _values!1231) e!521013)))

(assert (=> start!79096 tp!60368))

(declare-fun array_inv!20823 (array!55594) Bool)

(assert (=> start!79096 (array_inv!20823 _keys!1487)))

(declare-fun mapIsEmpty!31482 () Bool)

(assert (=> mapIsEmpty!31482 mapRes!31482))

(declare-fun b!928008 () Bool)

(declare-fun res!624991 () Bool)

(assert (=> b!928008 (=> (not res!624991) (not e!521008))))

(assert (=> b!928008 (= res!624991 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27201 _keys!1487))))))

(declare-fun b!928009 () Bool)

(assert (=> b!928009 (= e!521013 (and e!521017 mapRes!31482))))

(declare-fun condMapEmpty!31482 () Bool)

(declare-fun mapDefault!31482 () ValueCell!9427)

