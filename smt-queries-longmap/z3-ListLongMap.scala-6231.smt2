; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79640 () Bool)

(assert start!79640)

(declare-fun b_free!17707 () Bool)

(declare-fun b_next!17707 () Bool)

(assert (=> start!79640 (= b_free!17707 (not b_next!17707))))

(declare-fun tp!61577 () Bool)

(declare-fun b_and!28979 () Bool)

(assert (=> start!79640 (= tp!61577 b_and!28979)))

(declare-fun b!936399 () Bool)

(declare-datatypes ((Unit!31503 0))(
  ( (Unit!31504) )
))
(declare-fun e!525784 () Unit!31503)

(declare-fun Unit!31505 () Unit!31503)

(assert (=> b!936399 (= e!525784 Unit!31505)))

(declare-fun b!936400 () Bool)

(declare-fun res!630507 () Bool)

(declare-fun e!525781 () Bool)

(assert (=> b!936400 (=> (not res!630507) (not e!525781))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56339 0))(
  ( (array!56340 (arr!27110 (Array (_ BitVec 32) (_ BitVec 64))) (size!27571 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56339)

(assert (=> b!936400 (= res!630507 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27571 _keys!1487))))))

(declare-fun b!936401 () Bool)

(declare-fun e!525782 () Bool)

(declare-fun e!525779 () Bool)

(declare-fun mapRes!32094 () Bool)

(assert (=> b!936401 (= e!525782 (and e!525779 mapRes!32094))))

(declare-fun condMapEmpty!32094 () Bool)

(declare-datatypes ((V!31919 0))(
  ( (V!31920 (val!10158 Int)) )
))
(declare-datatypes ((ValueCell!9626 0))(
  ( (ValueCellFull!9626 (v!12682 V!31919)) (EmptyCell!9626) )
))
(declare-datatypes ((array!56341 0))(
  ( (array!56342 (arr!27111 (Array (_ BitVec 32) ValueCell!9626)) (size!27572 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56341)

(declare-fun mapDefault!32094 () ValueCell!9626)

(assert (=> b!936401 (= condMapEmpty!32094 (= (arr!27111 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9626)) mapDefault!32094)))))

(declare-fun b!936402 () Bool)

(declare-fun e!525788 () Bool)

(declare-fun e!525787 () Bool)

(assert (=> b!936402 (= e!525788 e!525787)))

(declare-fun res!630509 () Bool)

(assert (=> b!936402 (=> (not res!630509) (not e!525787))))

(declare-fun lt!422149 () V!31919)

(declare-fun v!791 () V!31919)

(assert (=> b!936402 (= res!630509 (and (= lt!422149 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13396 0))(
  ( (tuple2!13397 (_1!6709 (_ BitVec 64)) (_2!6709 V!31919)) )
))
(declare-datatypes ((List!19142 0))(
  ( (Nil!19139) (Cons!19138 (h!20284 tuple2!13396) (t!27384 List!19142)) )
))
(declare-datatypes ((ListLongMap!12083 0))(
  ( (ListLongMap!12084 (toList!6057 List!19142)) )
))
(declare-fun lt!422153 () ListLongMap!12083)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!832 (ListLongMap!12083 (_ BitVec 64)) V!31919)

(assert (=> b!936402 (= lt!422149 (apply!832 lt!422153 k0!1099))))

(declare-fun b!936403 () Bool)

(declare-fun res!630510 () Bool)

(assert (=> b!936403 (=> (not res!630510) (not e!525781))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936403 (= res!630510 (and (= (size!27572 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27571 _keys!1487) (size!27572 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936404 () Bool)

(declare-fun lt!422152 () ListLongMap!12083)

(assert (=> b!936404 (= (apply!832 lt!422152 k0!1099) lt!422149)))

(declare-fun lt!422151 () Unit!31503)

(declare-fun lt!422150 () (_ BitVec 64))

(declare-fun lt!422148 () V!31919)

(declare-fun addApplyDifferent!419 (ListLongMap!12083 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31503)

(assert (=> b!936404 (= lt!422151 (addApplyDifferent!419 lt!422153 lt!422150 lt!422148 k0!1099))))

(assert (=> b!936404 (not (= lt!422150 k0!1099))))

(declare-fun lt!422146 () Unit!31503)

(declare-datatypes ((List!19143 0))(
  ( (Nil!19140) (Cons!19139 (h!20285 (_ BitVec 64)) (t!27385 List!19143)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56339 (_ BitVec 64) (_ BitVec 32) List!19143) Unit!31503)

(assert (=> b!936404 (= lt!422146 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19140))))

(declare-fun e!525785 () Bool)

(assert (=> b!936404 e!525785))

(declare-fun c!97368 () Bool)

(assert (=> b!936404 (= c!97368 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422154 () Unit!31503)

(declare-fun zeroValue!1173 () V!31919)

(declare-fun minValue!1173 () V!31919)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!297 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 64) (_ BitVec 32) Int) Unit!31503)

(assert (=> b!936404 (= lt!422154 (lemmaListMapContainsThenArrayContainsFrom!297 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56339 (_ BitVec 32) List!19143) Bool)

(assert (=> b!936404 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19140)))

(declare-fun lt!422145 () Unit!31503)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56339 (_ BitVec 32) (_ BitVec 32)) Unit!31503)

(assert (=> b!936404 (= lt!422145 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5061 (ListLongMap!12083 (_ BitVec 64)) Bool)

(assert (=> b!936404 (contains!5061 lt!422152 k0!1099)))

(declare-fun lt!422143 () tuple2!13396)

(declare-fun +!2850 (ListLongMap!12083 tuple2!13396) ListLongMap!12083)

(assert (=> b!936404 (= lt!422152 (+!2850 lt!422153 lt!422143))))

(declare-fun lt!422147 () Unit!31503)

(declare-fun addStillContains!539 (ListLongMap!12083 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31503)

(assert (=> b!936404 (= lt!422147 (addStillContains!539 lt!422153 lt!422150 lt!422148 k0!1099))))

(declare-fun getCurrentListMap!3223 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) ListLongMap!12083)

(assert (=> b!936404 (= (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2850 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422143))))

(assert (=> b!936404 (= lt!422143 (tuple2!13397 lt!422150 lt!422148))))

(declare-fun get!14296 (ValueCell!9626 V!31919) V!31919)

(declare-fun dynLambda!1606 (Int (_ BitVec 64)) V!31919)

(assert (=> b!936404 (= lt!422148 (get!14296 (select (arr!27111 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1606 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422142 () Unit!31503)

(declare-fun lemmaListMapRecursiveValidKeyArray!214 (array!56339 array!56341 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) Unit!31503)

(assert (=> b!936404 (= lt!422142 (lemmaListMapRecursiveValidKeyArray!214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936404 (= e!525784 lt!422151)))

(declare-fun b!936405 () Bool)

(declare-fun res!630508 () Bool)

(assert (=> b!936405 (=> (not res!630508) (not e!525781))))

(assert (=> b!936405 (= res!630508 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19140))))

(declare-fun b!936406 () Bool)

(declare-fun tp_is_empty!20215 () Bool)

(assert (=> b!936406 (= e!525779 tp_is_empty!20215)))

(declare-fun mapIsEmpty!32094 () Bool)

(assert (=> mapIsEmpty!32094 mapRes!32094))

(declare-fun mapNonEmpty!32094 () Bool)

(declare-fun tp!61578 () Bool)

(declare-fun e!525786 () Bool)

(assert (=> mapNonEmpty!32094 (= mapRes!32094 (and tp!61578 e!525786))))

(declare-fun mapValue!32094 () ValueCell!9626)

(declare-fun mapRest!32094 () (Array (_ BitVec 32) ValueCell!9626))

(declare-fun mapKey!32094 () (_ BitVec 32))

(assert (=> mapNonEmpty!32094 (= (arr!27111 _values!1231) (store mapRest!32094 mapKey!32094 mapValue!32094))))

(declare-fun b!936408 () Bool)

(assert (=> b!936408 (= e!525787 false)))

(declare-fun lt!422144 () Unit!31503)

(declare-fun e!525783 () Unit!31503)

(assert (=> b!936408 (= lt!422144 e!525783)))

(declare-fun c!97367 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936408 (= c!97367 (validKeyInArray!0 k0!1099))))

(declare-fun b!936409 () Bool)

(declare-fun Unit!31506 () Unit!31503)

(assert (=> b!936409 (= e!525783 Unit!31506)))

(declare-fun b!936410 () Bool)

(declare-fun res!630506 () Bool)

(assert (=> b!936410 (=> (not res!630506) (not e!525781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56339 (_ BitVec 32)) Bool)

(assert (=> b!936410 (= res!630506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936411 () Bool)

(assert (=> b!936411 (= e!525785 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936412 () Bool)

(assert (=> b!936412 (= e!525781 e!525788)))

(declare-fun res!630512 () Bool)

(assert (=> b!936412 (=> (not res!630512) (not e!525788))))

(assert (=> b!936412 (= res!630512 (contains!5061 lt!422153 k0!1099))))

(assert (=> b!936412 (= lt!422153 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936413 () Bool)

(assert (=> b!936413 (= e!525783 e!525784)))

(assert (=> b!936413 (= lt!422150 (select (arr!27110 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97369 () Bool)

(assert (=> b!936413 (= c!97369 (validKeyInArray!0 lt!422150))))

(declare-fun b!936414 () Bool)

(declare-fun arrayContainsKey!0 (array!56339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936414 (= e!525785 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!630511 () Bool)

(assert (=> start!79640 (=> (not res!630511) (not e!525781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79640 (= res!630511 (validMask!0 mask!1881))))

(assert (=> start!79640 e!525781))

(assert (=> start!79640 true))

(assert (=> start!79640 tp_is_empty!20215))

(declare-fun array_inv!21158 (array!56341) Bool)

(assert (=> start!79640 (and (array_inv!21158 _values!1231) e!525782)))

(assert (=> start!79640 tp!61577))

(declare-fun array_inv!21159 (array!56339) Bool)

(assert (=> start!79640 (array_inv!21159 _keys!1487)))

(declare-fun b!936407 () Bool)

(assert (=> b!936407 (= e!525786 tp_is_empty!20215)))

(assert (= (and start!79640 res!630511) b!936403))

(assert (= (and b!936403 res!630510) b!936410))

(assert (= (and b!936410 res!630506) b!936405))

(assert (= (and b!936405 res!630508) b!936400))

(assert (= (and b!936400 res!630507) b!936412))

(assert (= (and b!936412 res!630512) b!936402))

(assert (= (and b!936402 res!630509) b!936408))

(assert (= (and b!936408 c!97367) b!936413))

(assert (= (and b!936408 (not c!97367)) b!936409))

(assert (= (and b!936413 c!97369) b!936404))

(assert (= (and b!936413 (not c!97369)) b!936399))

(assert (= (and b!936404 c!97368) b!936414))

(assert (= (and b!936404 (not c!97368)) b!936411))

(assert (= (and b!936401 condMapEmpty!32094) mapIsEmpty!32094))

(assert (= (and b!936401 (not condMapEmpty!32094)) mapNonEmpty!32094))

(get-info :version)

(assert (= (and mapNonEmpty!32094 ((_ is ValueCellFull!9626) mapValue!32094)) b!936407))

(assert (= (and b!936401 ((_ is ValueCellFull!9626) mapDefault!32094)) b!936406))

(assert (= start!79640 b!936401))

(declare-fun b_lambda!14095 () Bool)

(assert (=> (not b_lambda!14095) (not b!936404)))

(declare-fun t!27383 () Bool)

(declare-fun tb!6093 () Bool)

(assert (=> (and start!79640 (= defaultEntry!1235 defaultEntry!1235) t!27383) tb!6093))

(declare-fun result!12027 () Bool)

(assert (=> tb!6093 (= result!12027 tp_is_empty!20215)))

(assert (=> b!936404 t!27383))

(declare-fun b_and!28981 () Bool)

(assert (= b_and!28979 (and (=> t!27383 result!12027) b_and!28981)))

(declare-fun m!870515 () Bool)

(assert (=> b!936402 m!870515))

(declare-fun m!870517 () Bool)

(assert (=> b!936413 m!870517))

(declare-fun m!870519 () Bool)

(assert (=> b!936413 m!870519))

(declare-fun m!870521 () Bool)

(assert (=> b!936404 m!870521))

(declare-fun m!870523 () Bool)

(assert (=> b!936404 m!870523))

(declare-fun m!870525 () Bool)

(assert (=> b!936404 m!870525))

(declare-fun m!870527 () Bool)

(assert (=> b!936404 m!870527))

(declare-fun m!870529 () Bool)

(assert (=> b!936404 m!870529))

(declare-fun m!870531 () Bool)

(assert (=> b!936404 m!870531))

(declare-fun m!870533 () Bool)

(assert (=> b!936404 m!870533))

(declare-fun m!870535 () Bool)

(assert (=> b!936404 m!870535))

(declare-fun m!870537 () Bool)

(assert (=> b!936404 m!870537))

(declare-fun m!870539 () Bool)

(assert (=> b!936404 m!870539))

(declare-fun m!870541 () Bool)

(assert (=> b!936404 m!870541))

(assert (=> b!936404 m!870525))

(assert (=> b!936404 m!870527))

(declare-fun m!870543 () Bool)

(assert (=> b!936404 m!870543))

(declare-fun m!870545 () Bool)

(assert (=> b!936404 m!870545))

(declare-fun m!870547 () Bool)

(assert (=> b!936404 m!870547))

(declare-fun m!870549 () Bool)

(assert (=> b!936404 m!870549))

(assert (=> b!936404 m!870543))

(declare-fun m!870551 () Bool)

(assert (=> b!936404 m!870551))

(declare-fun m!870553 () Bool)

(assert (=> b!936405 m!870553))

(declare-fun m!870555 () Bool)

(assert (=> b!936408 m!870555))

(declare-fun m!870557 () Bool)

(assert (=> b!936410 m!870557))

(declare-fun m!870559 () Bool)

(assert (=> start!79640 m!870559))

(declare-fun m!870561 () Bool)

(assert (=> start!79640 m!870561))

(declare-fun m!870563 () Bool)

(assert (=> start!79640 m!870563))

(declare-fun m!870565 () Bool)

(assert (=> b!936414 m!870565))

(declare-fun m!870567 () Bool)

(assert (=> mapNonEmpty!32094 m!870567))

(declare-fun m!870569 () Bool)

(assert (=> b!936412 m!870569))

(declare-fun m!870571 () Bool)

(assert (=> b!936412 m!870571))

(check-sat (not start!79640) (not b!936408) (not b_lambda!14095) (not b!936413) (not b_next!17707) (not b!936410) (not b!936404) b_and!28981 (not b!936414) (not b!936405) (not mapNonEmpty!32094) (not b!936402) tp_is_empty!20215 (not b!936412))
(check-sat b_and!28981 (not b_next!17707))
