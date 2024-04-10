; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78902 () Bool)

(assert start!78902)

(declare-fun b_free!17115 () Bool)

(declare-fun b_next!17115 () Bool)

(assert (=> start!78902 (= b_free!17115 (not b_next!17115))))

(declare-fun tp!59785 () Bool)

(declare-fun b_and!27967 () Bool)

(assert (=> start!78902 (= tp!59785 b_and!27967)))

(declare-fun b!922424 () Bool)

(declare-fun e!517569 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922424 (= e!517569 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922425 () Bool)

(declare-fun e!517571 () Bool)

(declare-fun tp_is_empty!19623 () Bool)

(assert (=> b!922425 (= e!517571 tp_is_empty!19623)))

(declare-fun b!922426 () Bool)

(declare-fun e!517570 () Bool)

(declare-fun e!517572 () Bool)

(assert (=> b!922426 (= e!517570 e!517572)))

(declare-fun res!622037 () Bool)

(assert (=> b!922426 (=> (not res!622037) (not e!517572))))

(declare-fun lt!414234 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922426 (= res!622037 (validKeyInArray!0 lt!414234))))

(declare-datatypes ((array!55222 0))(
  ( (array!55223 (arr!26556 (Array (_ BitVec 32) (_ BitVec 64))) (size!27015 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55222)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922426 (= lt!414234 (select (arr!26556 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922427 () Bool)

(assert (=> b!922427 (= e!517572 (not true))))

(assert (=> b!922427 (not (= lt!414234 k0!1099))))

(declare-datatypes ((Unit!31116 0))(
  ( (Unit!31117) )
))
(declare-fun lt!414229 () Unit!31116)

(declare-datatypes ((List!18634 0))(
  ( (Nil!18631) (Cons!18630 (h!19776 (_ BitVec 64)) (t!26479 List!18634)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55222 (_ BitVec 64) (_ BitVec 32) List!18634) Unit!31116)

(assert (=> b!922427 (= lt!414229 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18631))))

(assert (=> b!922427 e!517569))

(declare-fun c!96174 () Bool)

(assert (=> b!922427 (= c!96174 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!414235 () Unit!31116)

(declare-datatypes ((V!31129 0))(
  ( (V!31130 (val!9862 Int)) )
))
(declare-datatypes ((ValueCell!9330 0))(
  ( (ValueCellFull!9330 (v!12380 V!31129)) (EmptyCell!9330) )
))
(declare-datatypes ((array!55224 0))(
  ( (array!55225 (arr!26557 (Array (_ BitVec 32) ValueCell!9330)) (size!27016 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55224)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31129)

(declare-fun minValue!1173 () V!31129)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!191 (array!55222 array!55224 (_ BitVec 32) (_ BitVec 32) V!31129 V!31129 (_ BitVec 64) (_ BitVec 32) Int) Unit!31116)

(assert (=> b!922427 (= lt!414235 (lemmaListMapContainsThenArrayContainsFrom!191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55222 (_ BitVec 32) List!18634) Bool)

(assert (=> b!922427 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18631)))

(declare-fun lt!414232 () Unit!31116)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55222 (_ BitVec 32) (_ BitVec 32)) Unit!31116)

(assert (=> b!922427 (= lt!414232 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12830 0))(
  ( (tuple2!12831 (_1!6426 (_ BitVec 64)) (_2!6426 V!31129)) )
))
(declare-datatypes ((List!18635 0))(
  ( (Nil!18632) (Cons!18631 (h!19777 tuple2!12830) (t!26480 List!18635)) )
))
(declare-datatypes ((ListLongMap!11527 0))(
  ( (ListLongMap!11528 (toList!5779 List!18635)) )
))
(declare-fun lt!414233 () ListLongMap!11527)

(declare-fun lt!414227 () tuple2!12830)

(declare-fun contains!4842 (ListLongMap!11527 (_ BitVec 64)) Bool)

(declare-fun +!2684 (ListLongMap!11527 tuple2!12830) ListLongMap!11527)

(assert (=> b!922427 (contains!4842 (+!2684 lt!414233 lt!414227) k0!1099)))

(declare-fun lt!414230 () Unit!31116)

(declare-fun lt!414228 () V!31129)

(declare-fun addStillContains!408 (ListLongMap!11527 (_ BitVec 64) V!31129 (_ BitVec 64)) Unit!31116)

(assert (=> b!922427 (= lt!414230 (addStillContains!408 lt!414233 lt!414234 lt!414228 k0!1099))))

(declare-fun getCurrentListMap!3033 (array!55222 array!55224 (_ BitVec 32) (_ BitVec 32) V!31129 V!31129 (_ BitVec 32) Int) ListLongMap!11527)

(assert (=> b!922427 (= (getCurrentListMap!3033 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2684 (getCurrentListMap!3033 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414227))))

(assert (=> b!922427 (= lt!414227 (tuple2!12831 lt!414234 lt!414228))))

(declare-fun get!13945 (ValueCell!9330 V!31129) V!31129)

(declare-fun dynLambda!1473 (Int (_ BitVec 64)) V!31129)

(assert (=> b!922427 (= lt!414228 (get!13945 (select (arr!26557 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1473 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414231 () Unit!31116)

(declare-fun lemmaListMapRecursiveValidKeyArray!74 (array!55222 array!55224 (_ BitVec 32) (_ BitVec 32) V!31129 V!31129 (_ BitVec 32) Int) Unit!31116)

(assert (=> b!922427 (= lt!414231 (lemmaListMapRecursiveValidKeyArray!74 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922428 () Bool)

(declare-fun res!622038 () Bool)

(assert (=> b!922428 (=> (not res!622038) (not e!517570))))

(assert (=> b!922428 (= res!622038 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922429 () Bool)

(declare-fun res!622034 () Bool)

(declare-fun e!517575 () Bool)

(assert (=> b!922429 (=> (not res!622034) (not e!517575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55222 (_ BitVec 32)) Bool)

(assert (=> b!922429 (= res!622034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922430 () Bool)

(declare-fun e!517574 () Bool)

(declare-fun e!517573 () Bool)

(declare-fun mapRes!31191 () Bool)

(assert (=> b!922430 (= e!517574 (and e!517573 mapRes!31191))))

(declare-fun condMapEmpty!31191 () Bool)

(declare-fun mapDefault!31191 () ValueCell!9330)

(assert (=> b!922430 (= condMapEmpty!31191 (= (arr!26557 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9330)) mapDefault!31191)))))

(declare-fun b!922431 () Bool)

(assert (=> b!922431 (= e!517575 e!517570)))

(declare-fun res!622039 () Bool)

(assert (=> b!922431 (=> (not res!622039) (not e!517570))))

(assert (=> b!922431 (= res!622039 (contains!4842 lt!414233 k0!1099))))

(assert (=> b!922431 (= lt!414233 (getCurrentListMap!3033 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31191 () Bool)

(declare-fun tp!59786 () Bool)

(assert (=> mapNonEmpty!31191 (= mapRes!31191 (and tp!59786 e!517571))))

(declare-fun mapRest!31191 () (Array (_ BitVec 32) ValueCell!9330))

(declare-fun mapValue!31191 () ValueCell!9330)

(declare-fun mapKey!31191 () (_ BitVec 32))

(assert (=> mapNonEmpty!31191 (= (arr!26557 _values!1231) (store mapRest!31191 mapKey!31191 mapValue!31191))))

(declare-fun b!922432 () Bool)

(declare-fun res!622033 () Bool)

(assert (=> b!922432 (=> (not res!622033) (not e!517570))))

(assert (=> b!922432 (= res!622033 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31191 () Bool)

(assert (=> mapIsEmpty!31191 mapRes!31191))

(declare-fun b!922434 () Bool)

(declare-fun res!622041 () Bool)

(assert (=> b!922434 (=> (not res!622041) (not e!517575))))

(assert (=> b!922434 (= res!622041 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18631))))

(declare-fun b!922435 () Bool)

(assert (=> b!922435 (= e!517573 tp_is_empty!19623)))

(declare-fun b!922436 () Bool)

(declare-fun arrayContainsKey!0 (array!55222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922436 (= e!517569 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922437 () Bool)

(declare-fun res!622036 () Bool)

(assert (=> b!922437 (=> (not res!622036) (not e!517575))))

(assert (=> b!922437 (= res!622036 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27015 _keys!1487))))))

(declare-fun b!922438 () Bool)

(declare-fun res!622040 () Bool)

(assert (=> b!922438 (=> (not res!622040) (not e!517575))))

(assert (=> b!922438 (= res!622040 (and (= (size!27016 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27015 _keys!1487) (size!27016 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922433 () Bool)

(declare-fun res!622035 () Bool)

(assert (=> b!922433 (=> (not res!622035) (not e!517570))))

(declare-fun v!791 () V!31129)

(declare-fun apply!615 (ListLongMap!11527 (_ BitVec 64)) V!31129)

(assert (=> b!922433 (= res!622035 (= (apply!615 lt!414233 k0!1099) v!791))))

(declare-fun res!622042 () Bool)

(assert (=> start!78902 (=> (not res!622042) (not e!517575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78902 (= res!622042 (validMask!0 mask!1881))))

(assert (=> start!78902 e!517575))

(assert (=> start!78902 true))

(assert (=> start!78902 tp_is_empty!19623))

(declare-fun array_inv!20686 (array!55224) Bool)

(assert (=> start!78902 (and (array_inv!20686 _values!1231) e!517574)))

(assert (=> start!78902 tp!59785))

(declare-fun array_inv!20687 (array!55222) Bool)

(assert (=> start!78902 (array_inv!20687 _keys!1487)))

(assert (= (and start!78902 res!622042) b!922438))

(assert (= (and b!922438 res!622040) b!922429))

(assert (= (and b!922429 res!622034) b!922434))

(assert (= (and b!922434 res!622041) b!922437))

(assert (= (and b!922437 res!622036) b!922431))

(assert (= (and b!922431 res!622039) b!922433))

(assert (= (and b!922433 res!622035) b!922428))

(assert (= (and b!922428 res!622038) b!922432))

(assert (= (and b!922432 res!622033) b!922426))

(assert (= (and b!922426 res!622037) b!922427))

(assert (= (and b!922427 c!96174) b!922436))

(assert (= (and b!922427 (not c!96174)) b!922424))

(assert (= (and b!922430 condMapEmpty!31191) mapIsEmpty!31191))

(assert (= (and b!922430 (not condMapEmpty!31191)) mapNonEmpty!31191))

(get-info :version)

(assert (= (and mapNonEmpty!31191 ((_ is ValueCellFull!9330) mapValue!31191)) b!922425))

(assert (= (and b!922430 ((_ is ValueCellFull!9330) mapDefault!31191)) b!922435))

(assert (= start!78902 b!922430))

(declare-fun b_lambda!13617 () Bool)

(assert (=> (not b_lambda!13617) (not b!922427)))

(declare-fun t!26478 () Bool)

(declare-fun tb!5695 () Bool)

(assert (=> (and start!78902 (= defaultEntry!1235 defaultEntry!1235) t!26478) tb!5695))

(declare-fun result!11213 () Bool)

(assert (=> tb!5695 (= result!11213 tp_is_empty!19623)))

(assert (=> b!922427 t!26478))

(declare-fun b_and!27969 () Bool)

(assert (= b_and!27967 (and (=> t!26478 result!11213) b_and!27969)))

(declare-fun m!856491 () Bool)

(assert (=> b!922429 m!856491))

(declare-fun m!856493 () Bool)

(assert (=> b!922431 m!856493))

(declare-fun m!856495 () Bool)

(assert (=> b!922431 m!856495))

(declare-fun m!856497 () Bool)

(assert (=> mapNonEmpty!31191 m!856497))

(declare-fun m!856499 () Bool)

(assert (=> b!922434 m!856499))

(declare-fun m!856501 () Bool)

(assert (=> b!922426 m!856501))

(declare-fun m!856503 () Bool)

(assert (=> b!922426 m!856503))

(declare-fun m!856505 () Bool)

(assert (=> b!922436 m!856505))

(declare-fun m!856507 () Bool)

(assert (=> b!922433 m!856507))

(declare-fun m!856509 () Bool)

(assert (=> start!78902 m!856509))

(declare-fun m!856511 () Bool)

(assert (=> start!78902 m!856511))

(declare-fun m!856513 () Bool)

(assert (=> start!78902 m!856513))

(declare-fun m!856515 () Bool)

(assert (=> b!922432 m!856515))

(declare-fun m!856517 () Bool)

(assert (=> b!922427 m!856517))

(declare-fun m!856519 () Bool)

(assert (=> b!922427 m!856519))

(declare-fun m!856521 () Bool)

(assert (=> b!922427 m!856521))

(declare-fun m!856523 () Bool)

(assert (=> b!922427 m!856523))

(declare-fun m!856525 () Bool)

(assert (=> b!922427 m!856525))

(declare-fun m!856527 () Bool)

(assert (=> b!922427 m!856527))

(declare-fun m!856529 () Bool)

(assert (=> b!922427 m!856529))

(assert (=> b!922427 m!856521))

(assert (=> b!922427 m!856525))

(declare-fun m!856531 () Bool)

(assert (=> b!922427 m!856531))

(declare-fun m!856533 () Bool)

(assert (=> b!922427 m!856533))

(declare-fun m!856535 () Bool)

(assert (=> b!922427 m!856535))

(assert (=> b!922427 m!856519))

(declare-fun m!856537 () Bool)

(assert (=> b!922427 m!856537))

(declare-fun m!856539 () Bool)

(assert (=> b!922427 m!856539))

(declare-fun m!856541 () Bool)

(assert (=> b!922427 m!856541))

(assert (=> b!922427 m!856527))

(declare-fun m!856543 () Bool)

(assert (=> b!922427 m!856543))

(check-sat (not b!922436) (not b!922427) (not b_lambda!13617) (not b!922434) (not b_next!17115) (not start!78902) b_and!27969 (not b!922433) (not mapNonEmpty!31191) (not b!922431) (not b!922429) (not b!922432) (not b!922426) tp_is_empty!19623)
(check-sat b_and!27969 (not b_next!17115))
