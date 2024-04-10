; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78968 () Bool)

(assert start!78968)

(declare-fun b_free!17181 () Bool)

(declare-fun b_next!17181 () Bool)

(assert (=> start!78968 (= b_free!17181 (not b_next!17181))))

(declare-fun tp!59984 () Bool)

(declare-fun b_and!28099 () Bool)

(assert (=> start!78968 (= tp!59984 b_and!28099)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!924125 () Bool)

(declare-fun e!518567 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55350 0))(
  ( (array!55351 (arr!26620 (Array (_ BitVec 32) (_ BitVec 64))) (size!27079 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55350)

(declare-fun arrayContainsKey!0 (array!55350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924125 (= e!518567 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924126 () Bool)

(declare-fun e!518569 () Bool)

(declare-fun e!518571 () Bool)

(assert (=> b!924126 (= e!518569 e!518571)))

(declare-fun res!622977 () Bool)

(assert (=> b!924126 (=> (not res!622977) (not e!518571))))

(declare-datatypes ((V!31217 0))(
  ( (V!31218 (val!9895 Int)) )
))
(declare-datatypes ((tuple2!12888 0))(
  ( (tuple2!12889 (_1!6455 (_ BitVec 64)) (_2!6455 V!31217)) )
))
(declare-datatypes ((List!18691 0))(
  ( (Nil!18688) (Cons!18687 (h!19833 tuple2!12888) (t!26602 List!18691)) )
))
(declare-datatypes ((ListLongMap!11585 0))(
  ( (ListLongMap!11586 (toList!5808 List!18691)) )
))
(declare-fun lt!415432 () ListLongMap!11585)

(declare-fun contains!4869 (ListLongMap!11585 (_ BitVec 64)) Bool)

(assert (=> b!924126 (= res!622977 (contains!4869 lt!415432 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9363 0))(
  ( (ValueCellFull!9363 (v!12413 V!31217)) (EmptyCell!9363) )
))
(declare-datatypes ((array!55352 0))(
  ( (array!55353 (arr!26621 (Array (_ BitVec 32) ValueCell!9363)) (size!27080 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55352)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31217)

(declare-fun minValue!1173 () V!31217)

(declare-fun getCurrentListMap!3060 (array!55350 array!55352 (_ BitVec 32) (_ BitVec 32) V!31217 V!31217 (_ BitVec 32) Int) ListLongMap!11585)

(assert (=> b!924126 (= lt!415432 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924127 () Bool)

(declare-datatypes ((Unit!31191 0))(
  ( (Unit!31192) )
))
(declare-fun e!518565 () Unit!31191)

(declare-fun e!518562 () Unit!31191)

(assert (=> b!924127 (= e!518565 e!518562)))

(declare-fun lt!415426 () (_ BitVec 64))

(assert (=> b!924127 (= lt!415426 (select (arr!26620 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96375 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924127 (= c!96375 (validKeyInArray!0 lt!415426))))

(declare-fun b!924128 () Bool)

(declare-fun Unit!31193 () Unit!31191)

(assert (=> b!924128 (= e!518565 Unit!31193)))

(declare-fun b!924129 () Bool)

(declare-fun e!518563 () Bool)

(declare-fun e!518561 () Bool)

(declare-fun mapRes!31290 () Bool)

(assert (=> b!924129 (= e!518563 (and e!518561 mapRes!31290))))

(declare-fun condMapEmpty!31290 () Bool)

(declare-fun mapDefault!31290 () ValueCell!9363)

(assert (=> b!924129 (= condMapEmpty!31290 (= (arr!26621 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9363)) mapDefault!31290)))))

(declare-fun b!924130 () Bool)

(declare-fun e!518572 () Bool)

(declare-fun e!518570 () Bool)

(assert (=> b!924130 (= e!518572 e!518570)))

(declare-fun res!622978 () Bool)

(assert (=> b!924130 (=> (not res!622978) (not e!518570))))

(declare-fun v!791 () V!31217)

(declare-fun lt!415428 () V!31217)

(assert (=> b!924130 (= res!622978 (and (= lt!415428 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415430 () ListLongMap!11585)

(declare-fun apply!638 (ListLongMap!11585 (_ BitVec 64)) V!31217)

(assert (=> b!924130 (= lt!415428 (apply!638 lt!415430 k0!1099))))

(declare-fun res!622980 () Bool)

(declare-fun e!518566 () Bool)

(assert (=> start!78968 (=> (not res!622980) (not e!518566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78968 (= res!622980 (validMask!0 mask!1881))))

(assert (=> start!78968 e!518566))

(assert (=> start!78968 true))

(declare-fun tp_is_empty!19689 () Bool)

(assert (=> start!78968 tp_is_empty!19689))

(declare-fun array_inv!20734 (array!55352) Bool)

(assert (=> start!78968 (and (array_inv!20734 _values!1231) e!518563)))

(assert (=> start!78968 tp!59984))

(declare-fun array_inv!20735 (array!55350) Bool)

(assert (=> start!78968 (array_inv!20735 _keys!1487)))

(declare-fun b!924131 () Bool)

(declare-fun Unit!31194 () Unit!31191)

(assert (=> b!924131 (= e!518562 Unit!31194)))

(declare-fun b!924132 () Bool)

(assert (=> b!924132 (= e!518570 e!518569)))

(declare-fun res!622974 () Bool)

(assert (=> b!924132 (=> (not res!622974) (not e!518569))))

(assert (=> b!924132 (= res!622974 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27079 _keys!1487)))))

(declare-fun lt!415418 () Unit!31191)

(assert (=> b!924132 (= lt!415418 e!518565)))

(declare-fun c!96373 () Bool)

(assert (=> b!924132 (= c!96373 (validKeyInArray!0 k0!1099))))

(declare-fun b!924133 () Bool)

(assert (=> b!924133 (= e!518566 e!518572)))

(declare-fun res!622975 () Bool)

(assert (=> b!924133 (=> (not res!622975) (not e!518572))))

(assert (=> b!924133 (= res!622975 (contains!4869 lt!415430 k0!1099))))

(assert (=> b!924133 (= lt!415430 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924134 () Bool)

(declare-fun res!622981 () Bool)

(assert (=> b!924134 (=> (not res!622981) (not e!518566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55350 (_ BitVec 32)) Bool)

(assert (=> b!924134 (= res!622981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924135 () Bool)

(declare-fun e!518564 () Bool)

(assert (=> b!924135 (= e!518564 tp_is_empty!19689)))

(declare-fun b!924136 () Bool)

(assert (=> b!924136 (= e!518571 false)))

(declare-fun lt!415424 () V!31217)

(assert (=> b!924136 (= lt!415424 (apply!638 lt!415432 k0!1099))))

(declare-fun b!924137 () Bool)

(assert (=> b!924137 (= e!518561 tp_is_empty!19689)))

(declare-fun b!924138 () Bool)

(declare-fun res!622973 () Bool)

(assert (=> b!924138 (=> (not res!622973) (not e!518566))))

(assert (=> b!924138 (= res!622973 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27079 _keys!1487))))))

(declare-fun mapNonEmpty!31290 () Bool)

(declare-fun tp!59983 () Bool)

(assert (=> mapNonEmpty!31290 (= mapRes!31290 (and tp!59983 e!518564))))

(declare-fun mapKey!31290 () (_ BitVec 32))

(declare-fun mapRest!31290 () (Array (_ BitVec 32) ValueCell!9363))

(declare-fun mapValue!31290 () ValueCell!9363)

(assert (=> mapNonEmpty!31290 (= (arr!26621 _values!1231) (store mapRest!31290 mapKey!31290 mapValue!31290))))

(declare-fun mapIsEmpty!31290 () Bool)

(assert (=> mapIsEmpty!31290 mapRes!31290))

(declare-fun b!924139 () Bool)

(declare-fun res!622976 () Bool)

(assert (=> b!924139 (=> (not res!622976) (not e!518566))))

(declare-datatypes ((List!18692 0))(
  ( (Nil!18689) (Cons!18688 (h!19834 (_ BitVec 64)) (t!26603 List!18692)) )
))
(declare-fun arrayNoDuplicates!0 (array!55350 (_ BitVec 32) List!18692) Bool)

(assert (=> b!924139 (= res!622976 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18689))))

(declare-fun b!924140 () Bool)

(declare-fun lt!415431 () ListLongMap!11585)

(assert (=> b!924140 (= (apply!638 lt!415431 k0!1099) lt!415428)))

(declare-fun lt!415419 () Unit!31191)

(declare-fun lt!415422 () V!31217)

(declare-fun addApplyDifferent!362 (ListLongMap!11585 (_ BitVec 64) V!31217 (_ BitVec 64)) Unit!31191)

(assert (=> b!924140 (= lt!415419 (addApplyDifferent!362 lt!415430 lt!415426 lt!415422 k0!1099))))

(assert (=> b!924140 (not (= lt!415426 k0!1099))))

(declare-fun lt!415427 () Unit!31191)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55350 (_ BitVec 64) (_ BitVec 32) List!18692) Unit!31191)

(assert (=> b!924140 (= lt!415427 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18689))))

(assert (=> b!924140 e!518567))

(declare-fun c!96374 () Bool)

(assert (=> b!924140 (= c!96374 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415421 () Unit!31191)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!213 (array!55350 array!55352 (_ BitVec 32) (_ BitVec 32) V!31217 V!31217 (_ BitVec 64) (_ BitVec 32) Int) Unit!31191)

(assert (=> b!924140 (= lt!415421 (lemmaListMapContainsThenArrayContainsFrom!213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!924140 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18689)))

(declare-fun lt!415423 () Unit!31191)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55350 (_ BitVec 32) (_ BitVec 32)) Unit!31191)

(assert (=> b!924140 (= lt!415423 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924140 (contains!4869 lt!415431 k0!1099)))

(declare-fun lt!415420 () tuple2!12888)

(declare-fun +!2706 (ListLongMap!11585 tuple2!12888) ListLongMap!11585)

(assert (=> b!924140 (= lt!415431 (+!2706 lt!415430 lt!415420))))

(declare-fun lt!415429 () Unit!31191)

(declare-fun addStillContains!430 (ListLongMap!11585 (_ BitVec 64) V!31217 (_ BitVec 64)) Unit!31191)

(assert (=> b!924140 (= lt!415429 (addStillContains!430 lt!415430 lt!415426 lt!415422 k0!1099))))

(assert (=> b!924140 (= (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2706 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415420))))

(assert (=> b!924140 (= lt!415420 (tuple2!12889 lt!415426 lt!415422))))

(declare-fun get!13989 (ValueCell!9363 V!31217) V!31217)

(declare-fun dynLambda!1495 (Int (_ BitVec 64)) V!31217)

(assert (=> b!924140 (= lt!415422 (get!13989 (select (arr!26621 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1495 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415425 () Unit!31191)

(declare-fun lemmaListMapRecursiveValidKeyArray!96 (array!55350 array!55352 (_ BitVec 32) (_ BitVec 32) V!31217 V!31217 (_ BitVec 32) Int) Unit!31191)

(assert (=> b!924140 (= lt!415425 (lemmaListMapRecursiveValidKeyArray!96 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924140 (= e!518562 lt!415419)))

(declare-fun b!924141 () Bool)

(declare-fun res!622979 () Bool)

(assert (=> b!924141 (=> (not res!622979) (not e!518566))))

(assert (=> b!924141 (= res!622979 (and (= (size!27080 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27079 _keys!1487) (size!27080 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924142 () Bool)

(assert (=> b!924142 (= e!518567 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78968 res!622980) b!924141))

(assert (= (and b!924141 res!622979) b!924134))

(assert (= (and b!924134 res!622981) b!924139))

(assert (= (and b!924139 res!622976) b!924138))

(assert (= (and b!924138 res!622973) b!924133))

(assert (= (and b!924133 res!622975) b!924130))

(assert (= (and b!924130 res!622978) b!924132))

(assert (= (and b!924132 c!96373) b!924127))

(assert (= (and b!924132 (not c!96373)) b!924128))

(assert (= (and b!924127 c!96375) b!924140))

(assert (= (and b!924127 (not c!96375)) b!924131))

(assert (= (and b!924140 c!96374) b!924125))

(assert (= (and b!924140 (not c!96374)) b!924142))

(assert (= (and b!924132 res!622974) b!924126))

(assert (= (and b!924126 res!622977) b!924136))

(assert (= (and b!924129 condMapEmpty!31290) mapIsEmpty!31290))

(assert (= (and b!924129 (not condMapEmpty!31290)) mapNonEmpty!31290))

(get-info :version)

(assert (= (and mapNonEmpty!31290 ((_ is ValueCellFull!9363) mapValue!31290)) b!924135))

(assert (= (and b!924129 ((_ is ValueCellFull!9363) mapDefault!31290)) b!924137))

(assert (= start!78968 b!924129))

(declare-fun b_lambda!13683 () Bool)

(assert (=> (not b_lambda!13683) (not b!924140)))

(declare-fun t!26601 () Bool)

(declare-fun tb!5761 () Bool)

(assert (=> (and start!78968 (= defaultEntry!1235 defaultEntry!1235) t!26601) tb!5761))

(declare-fun result!11345 () Bool)

(assert (=> tb!5761 (= result!11345 tp_is_empty!19689)))

(assert (=> b!924140 t!26601))

(declare-fun b_and!28101 () Bool)

(assert (= b_and!28099 (and (=> t!26601 result!11345) b_and!28101)))

(declare-fun m!858401 () Bool)

(assert (=> b!924134 m!858401))

(declare-fun m!858403 () Bool)

(assert (=> b!924127 m!858403))

(declare-fun m!858405 () Bool)

(assert (=> b!924127 m!858405))

(declare-fun m!858407 () Bool)

(assert (=> b!924132 m!858407))

(declare-fun m!858409 () Bool)

(assert (=> b!924130 m!858409))

(declare-fun m!858411 () Bool)

(assert (=> b!924136 m!858411))

(declare-fun m!858413 () Bool)

(assert (=> start!78968 m!858413))

(declare-fun m!858415 () Bool)

(assert (=> start!78968 m!858415))

(declare-fun m!858417 () Bool)

(assert (=> start!78968 m!858417))

(declare-fun m!858419 () Bool)

(assert (=> mapNonEmpty!31290 m!858419))

(declare-fun m!858421 () Bool)

(assert (=> b!924139 m!858421))

(declare-fun m!858423 () Bool)

(assert (=> b!924125 m!858423))

(declare-fun m!858425 () Bool)

(assert (=> b!924133 m!858425))

(declare-fun m!858427 () Bool)

(assert (=> b!924133 m!858427))

(declare-fun m!858429 () Bool)

(assert (=> b!924126 m!858429))

(declare-fun m!858431 () Bool)

(assert (=> b!924126 m!858431))

(declare-fun m!858433 () Bool)

(assert (=> b!924140 m!858433))

(declare-fun m!858435 () Bool)

(assert (=> b!924140 m!858435))

(declare-fun m!858437 () Bool)

(assert (=> b!924140 m!858437))

(declare-fun m!858439 () Bool)

(assert (=> b!924140 m!858439))

(declare-fun m!858441 () Bool)

(assert (=> b!924140 m!858441))

(declare-fun m!858443 () Bool)

(assert (=> b!924140 m!858443))

(assert (=> b!924140 m!858439))

(declare-fun m!858445 () Bool)

(assert (=> b!924140 m!858445))

(declare-fun m!858447 () Bool)

(assert (=> b!924140 m!858447))

(assert (=> b!924140 m!858431))

(declare-fun m!858449 () Bool)

(assert (=> b!924140 m!858449))

(declare-fun m!858451 () Bool)

(assert (=> b!924140 m!858451))

(declare-fun m!858453 () Bool)

(assert (=> b!924140 m!858453))

(assert (=> b!924140 m!858445))

(declare-fun m!858455 () Bool)

(assert (=> b!924140 m!858455))

(declare-fun m!858457 () Bool)

(assert (=> b!924140 m!858457))

(declare-fun m!858459 () Bool)

(assert (=> b!924140 m!858459))

(assert (=> b!924140 m!858433))

(declare-fun m!858461 () Bool)

(assert (=> b!924140 m!858461))

(check-sat b_and!28101 (not b!924133) (not b!924132) (not mapNonEmpty!31290) (not b!924139) (not b!924136) (not b!924130) (not b!924125) (not b!924127) tp_is_empty!19689 (not b!924140) (not b_lambda!13683) (not b_next!17181) (not b!924126) (not start!78968) (not b!924134))
(check-sat b_and!28101 (not b_next!17181))
