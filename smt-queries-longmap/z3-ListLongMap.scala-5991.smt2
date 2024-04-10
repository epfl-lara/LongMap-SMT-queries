; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77800 () Bool)

(assert start!77800)

(declare-fun b_free!16359 () Bool)

(declare-fun b_next!16359 () Bool)

(assert (=> start!77800 (= b_free!16359 (not b_next!16359))))

(declare-fun tp!57342 () Bool)

(declare-fun b_and!26875 () Bool)

(assert (=> start!77800 (= tp!57342 b_and!26875)))

(declare-fun mapIsEmpty!29881 () Bool)

(declare-fun mapRes!29881 () Bool)

(assert (=> mapIsEmpty!29881 mapRes!29881))

(declare-fun b!908022 () Bool)

(declare-fun res!612836 () Bool)

(declare-fun e!508909 () Bool)

(assert (=> b!908022 (=> (not res!612836) (not e!508909))))

(declare-datatypes ((V!30001 0))(
  ( (V!30002 (val!9439 Int)) )
))
(declare-datatypes ((ValueCell!8907 0))(
  ( (ValueCellFull!8907 (v!11946 V!30001)) (EmptyCell!8907) )
))
(declare-datatypes ((array!53588 0))(
  ( (array!53589 (arr!25752 (Array (_ BitVec 32) ValueCell!8907)) (size!26211 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53588)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53590 0))(
  ( (array!53591 (arr!25753 (Array (_ BitVec 32) (_ BitVec 64))) (size!26212 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53590)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!908022 (= res!612836 (and (= (size!26211 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26212 _keys!1386) (size!26211 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908023 () Bool)

(declare-fun e!508905 () Bool)

(declare-fun tp_is_empty!18777 () Bool)

(assert (=> b!908023 (= e!508905 tp_is_empty!18777)))

(declare-fun b!908024 () Bool)

(declare-fun res!612840 () Bool)

(assert (=> b!908024 (=> (not res!612840) (not e!508909))))

(declare-datatypes ((List!18092 0))(
  ( (Nil!18089) (Cons!18088 (h!19234 (_ BitVec 64)) (t!25623 List!18092)) )
))
(declare-fun arrayNoDuplicates!0 (array!53590 (_ BitVec 32) List!18092) Bool)

(assert (=> b!908024 (= res!612840 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18089))))

(declare-fun b!908025 () Bool)

(declare-fun res!612838 () Bool)

(declare-fun e!508910 () Bool)

(assert (=> b!908025 (=> res!612838 e!508910)))

(declare-datatypes ((tuple2!12294 0))(
  ( (tuple2!12295 (_1!6158 (_ BitVec 64)) (_2!6158 V!30001)) )
))
(declare-datatypes ((List!18093 0))(
  ( (Nil!18090) (Cons!18089 (h!19235 tuple2!12294) (t!25624 List!18093)) )
))
(declare-datatypes ((ListLongMap!10991 0))(
  ( (ListLongMap!10992 (toList!5511 List!18093)) )
))
(declare-fun lt!409563 () ListLongMap!10991)

(declare-fun lt!409561 () V!30001)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!495 (ListLongMap!10991 (_ BitVec 64)) V!30001)

(assert (=> b!908025 (= res!612838 (not (= (apply!495 lt!409563 k0!1033) lt!409561)))))

(declare-fun b!908026 () Bool)

(declare-fun e!508906 () Bool)

(declare-fun e!508911 () Bool)

(assert (=> b!908026 (= e!508906 (and e!508911 mapRes!29881))))

(declare-fun condMapEmpty!29881 () Bool)

(declare-fun mapDefault!29881 () ValueCell!8907)

(assert (=> b!908026 (= condMapEmpty!29881 (= (arr!25752 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8907)) mapDefault!29881)))))

(declare-fun b!908027 () Bool)

(assert (=> b!908027 (= e!508910 true)))

(declare-fun lt!409562 () ListLongMap!10991)

(assert (=> b!908027 (= (apply!495 lt!409562 k0!1033) lt!409561)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30820 0))(
  ( (Unit!30821) )
))
(declare-fun lt!409565 () Unit!30820)

(declare-fun zeroValue!1094 () V!30001)

(declare-fun minValue!1094 () V!30001)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!48 (array!53590 array!53588 (_ BitVec 32) (_ BitVec 32) V!30001 V!30001 (_ BitVec 64) V!30001 (_ BitVec 32) Int) Unit!30820)

(assert (=> b!908027 (= lt!409565 (lemmaListMapApplyFromThenApplyFromZero!48 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409561 i!717 defaultEntry!1160))))

(declare-fun res!612835 () Bool)

(assert (=> start!77800 (=> (not res!612835) (not e!508909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77800 (= res!612835 (validMask!0 mask!1756))))

(assert (=> start!77800 e!508909))

(declare-fun array_inv!20164 (array!53588) Bool)

(assert (=> start!77800 (and (array_inv!20164 _values!1152) e!508906)))

(assert (=> start!77800 tp!57342))

(assert (=> start!77800 true))

(assert (=> start!77800 tp_is_empty!18777))

(declare-fun array_inv!20165 (array!53590) Bool)

(assert (=> start!77800 (array_inv!20165 _keys!1386)))

(declare-fun b!908028 () Bool)

(declare-fun res!612839 () Bool)

(assert (=> b!908028 (=> (not res!612839) (not e!508909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53590 (_ BitVec 32)) Bool)

(assert (=> b!908028 (= res!612839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908029 () Bool)

(declare-fun res!612843 () Bool)

(declare-fun e!508904 () Bool)

(assert (=> b!908029 (=> (not res!612843) (not e!508904))))

(assert (=> b!908029 (= res!612843 (and (= (select (arr!25753 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908030 () Bool)

(assert (=> b!908030 (= e!508909 e!508904)))

(declare-fun res!612842 () Bool)

(assert (=> b!908030 (=> (not res!612842) (not e!508904))))

(declare-fun contains!4555 (ListLongMap!10991 (_ BitVec 64)) Bool)

(assert (=> b!908030 (= res!612842 (contains!4555 lt!409562 k0!1033))))

(declare-fun getCurrentListMap!2775 (array!53590 array!53588 (_ BitVec 32) (_ BitVec 32) V!30001 V!30001 (_ BitVec 32) Int) ListLongMap!10991)

(assert (=> b!908030 (= lt!409562 (getCurrentListMap!2775 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908031 () Bool)

(declare-fun e!508908 () Bool)

(assert (=> b!908031 (= e!508908 e!508910)))

(declare-fun res!612841 () Bool)

(assert (=> b!908031 (=> res!612841 e!508910)))

(assert (=> b!908031 (= res!612841 (not (contains!4555 lt!409563 k0!1033)))))

(assert (=> b!908031 (= lt!409563 (getCurrentListMap!2775 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908032 () Bool)

(assert (=> b!908032 (= e!508911 tp_is_empty!18777)))

(declare-fun mapNonEmpty!29881 () Bool)

(declare-fun tp!57341 () Bool)

(assert (=> mapNonEmpty!29881 (= mapRes!29881 (and tp!57341 e!508905))))

(declare-fun mapRest!29881 () (Array (_ BitVec 32) ValueCell!8907))

(declare-fun mapValue!29881 () ValueCell!8907)

(declare-fun mapKey!29881 () (_ BitVec 32))

(assert (=> mapNonEmpty!29881 (= (arr!25752 _values!1152) (store mapRest!29881 mapKey!29881 mapValue!29881))))

(declare-fun b!908033 () Bool)

(declare-fun res!612834 () Bool)

(assert (=> b!908033 (=> (not res!612834) (not e!508904))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908033 (= res!612834 (inRange!0 i!717 mask!1756))))

(declare-fun b!908034 () Bool)

(assert (=> b!908034 (= e!508904 (not e!508908))))

(declare-fun res!612837 () Bool)

(assert (=> b!908034 (=> res!612837 e!508908)))

(assert (=> b!908034 (= res!612837 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26212 _keys!1386))))))

(declare-fun get!13554 (ValueCell!8907 V!30001) V!30001)

(declare-fun dynLambda!1371 (Int (_ BitVec 64)) V!30001)

(assert (=> b!908034 (= lt!409561 (get!13554 (select (arr!25752 _values!1152) i!717) (dynLambda!1371 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908034 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409564 () Unit!30820)

(declare-fun lemmaKeyInListMapIsInArray!243 (array!53590 array!53588 (_ BitVec 32) (_ BitVec 32) V!30001 V!30001 (_ BitVec 64) Int) Unit!30820)

(assert (=> b!908034 (= lt!409564 (lemmaKeyInListMapIsInArray!243 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77800 res!612835) b!908022))

(assert (= (and b!908022 res!612836) b!908028))

(assert (= (and b!908028 res!612839) b!908024))

(assert (= (and b!908024 res!612840) b!908030))

(assert (= (and b!908030 res!612842) b!908033))

(assert (= (and b!908033 res!612834) b!908029))

(assert (= (and b!908029 res!612843) b!908034))

(assert (= (and b!908034 (not res!612837)) b!908031))

(assert (= (and b!908031 (not res!612841)) b!908025))

(assert (= (and b!908025 (not res!612838)) b!908027))

(assert (= (and b!908026 condMapEmpty!29881) mapIsEmpty!29881))

(assert (= (and b!908026 (not condMapEmpty!29881)) mapNonEmpty!29881))

(get-info :version)

(assert (= (and mapNonEmpty!29881 ((_ is ValueCellFull!8907) mapValue!29881)) b!908023))

(assert (= (and b!908026 ((_ is ValueCellFull!8907) mapDefault!29881)) b!908032))

(assert (= start!77800 b!908026))

(declare-fun b_lambda!13243 () Bool)

(assert (=> (not b_lambda!13243) (not b!908034)))

(declare-fun t!25622 () Bool)

(declare-fun tb!5381 () Bool)

(assert (=> (and start!77800 (= defaultEntry!1160 defaultEntry!1160) t!25622) tb!5381))

(declare-fun result!10559 () Bool)

(assert (=> tb!5381 (= result!10559 tp_is_empty!18777)))

(assert (=> b!908034 t!25622))

(declare-fun b_and!26877 () Bool)

(assert (= b_and!26875 (and (=> t!25622 result!10559) b_and!26877)))

(declare-fun m!843369 () Bool)

(assert (=> b!908029 m!843369))

(declare-fun m!843371 () Bool)

(assert (=> mapNonEmpty!29881 m!843371))

(declare-fun m!843373 () Bool)

(assert (=> b!908030 m!843373))

(declare-fun m!843375 () Bool)

(assert (=> b!908030 m!843375))

(declare-fun m!843377 () Bool)

(assert (=> b!908033 m!843377))

(declare-fun m!843379 () Bool)

(assert (=> b!908031 m!843379))

(declare-fun m!843381 () Bool)

(assert (=> b!908031 m!843381))

(declare-fun m!843383 () Bool)

(assert (=> b!908027 m!843383))

(declare-fun m!843385 () Bool)

(assert (=> b!908027 m!843385))

(declare-fun m!843387 () Bool)

(assert (=> b!908024 m!843387))

(declare-fun m!843389 () Bool)

(assert (=> b!908028 m!843389))

(declare-fun m!843391 () Bool)

(assert (=> b!908034 m!843391))

(declare-fun m!843393 () Bool)

(assert (=> b!908034 m!843393))

(declare-fun m!843395 () Bool)

(assert (=> b!908034 m!843395))

(declare-fun m!843397 () Bool)

(assert (=> b!908034 m!843397))

(assert (=> b!908034 m!843391))

(assert (=> b!908034 m!843395))

(declare-fun m!843399 () Bool)

(assert (=> b!908034 m!843399))

(declare-fun m!843401 () Bool)

(assert (=> b!908025 m!843401))

(declare-fun m!843403 () Bool)

(assert (=> start!77800 m!843403))

(declare-fun m!843405 () Bool)

(assert (=> start!77800 m!843405))

(declare-fun m!843407 () Bool)

(assert (=> start!77800 m!843407))

(check-sat (not b!908033) (not start!77800) b_and!26877 (not b_next!16359) (not b!908034) tp_is_empty!18777 (not b!908025) (not mapNonEmpty!29881) (not b!908027) (not b_lambda!13243) (not b!908024) (not b!908030) (not b!908031) (not b!908028))
(check-sat b_and!26877 (not b_next!16359))
