; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77910 () Bool)

(assert start!77910)

(declare-fun b_free!16327 () Bool)

(declare-fun b_next!16327 () Bool)

(assert (=> start!77910 (= b_free!16327 (not b_next!16327))))

(declare-fun tp!57244 () Bool)

(declare-fun b_and!26817 () Bool)

(assert (=> start!77910 (= tp!57244 b_and!26817)))

(declare-fun b!908117 () Bool)

(declare-fun e!509006 () Bool)

(declare-fun e!509004 () Bool)

(declare-fun mapRes!29830 () Bool)

(assert (=> b!908117 (= e!509006 (and e!509004 mapRes!29830))))

(declare-fun condMapEmpty!29830 () Bool)

(declare-datatypes ((V!29959 0))(
  ( (V!29960 (val!9423 Int)) )
))
(declare-datatypes ((ValueCell!8891 0))(
  ( (ValueCellFull!8891 (v!11925 V!29959)) (EmptyCell!8891) )
))
(declare-datatypes ((array!53565 0))(
  ( (array!53566 (arr!25737 (Array (_ BitVec 32) ValueCell!8891)) (size!26197 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53565)

(declare-fun mapDefault!29830 () ValueCell!8891)

(assert (=> b!908117 (= condMapEmpty!29830 (= (arr!25737 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8891)) mapDefault!29830)))))

(declare-fun b!908118 () Bool)

(declare-fun e!509001 () Bool)

(declare-fun e!509002 () Bool)

(assert (=> b!908118 (= e!509001 e!509002)))

(declare-fun res!612640 () Bool)

(assert (=> b!908118 (=> (not res!612640) (not e!509002))))

(declare-datatypes ((tuple2!12202 0))(
  ( (tuple2!12203 (_1!6112 (_ BitVec 64)) (_2!6112 V!29959)) )
))
(declare-datatypes ((List!18035 0))(
  ( (Nil!18032) (Cons!18031 (h!19183 tuple2!12202) (t!25526 List!18035)) )
))
(declare-datatypes ((ListLongMap!10901 0))(
  ( (ListLongMap!10902 (toList!5466 List!18035)) )
))
(declare-fun lt!409563 () ListLongMap!10901)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4519 (ListLongMap!10901 (_ BitVec 64)) Bool)

(assert (=> b!908118 (= res!612640 (contains!4519 lt!409563 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29959)

(declare-datatypes ((array!53567 0))(
  ( (array!53568 (arr!25738 (Array (_ BitVec 32) (_ BitVec 64))) (size!26198 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53567)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29959)

(declare-fun getCurrentListMap!2730 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 32) Int) ListLongMap!10901)

(assert (=> b!908118 (= lt!409563 (getCurrentListMap!2730 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908119 () Bool)

(declare-fun e!509005 () Bool)

(assert (=> b!908119 (= e!509005 true)))

(declare-fun lt!409564 () V!29959)

(declare-fun apply!485 (ListLongMap!10901 (_ BitVec 64)) V!29959)

(assert (=> b!908119 (= (apply!485 lt!409563 k0!1033) lt!409564)))

(declare-datatypes ((Unit!30782 0))(
  ( (Unit!30783) )
))
(declare-fun lt!409567 () Unit!30782)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun lemmaListMapApplyFromThenApplyFromZero!37 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) V!29959 (_ BitVec 32) Int) Unit!30782)

(assert (=> b!908119 (= lt!409567 (lemmaListMapApplyFromThenApplyFromZero!37 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409564 i!717 defaultEntry!1160))))

(declare-fun b!908120 () Bool)

(declare-fun e!509000 () Bool)

(assert (=> b!908120 (= e!509000 e!509005)))

(declare-fun res!612643 () Bool)

(assert (=> b!908120 (=> res!612643 e!509005)))

(declare-fun lt!409565 () ListLongMap!10901)

(assert (=> b!908120 (= res!612643 (not (contains!4519 lt!409565 k0!1033)))))

(assert (=> b!908120 (= lt!409565 (getCurrentListMap!2730 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29830 () Bool)

(declare-fun tp!57243 () Bool)

(declare-fun e!509007 () Bool)

(assert (=> mapNonEmpty!29830 (= mapRes!29830 (and tp!57243 e!509007))))

(declare-fun mapValue!29830 () ValueCell!8891)

(declare-fun mapKey!29830 () (_ BitVec 32))

(declare-fun mapRest!29830 () (Array (_ BitVec 32) ValueCell!8891))

(assert (=> mapNonEmpty!29830 (= (arr!25737 _values!1152) (store mapRest!29830 mapKey!29830 mapValue!29830))))

(declare-fun res!612641 () Bool)

(assert (=> start!77910 (=> (not res!612641) (not e!509001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77910 (= res!612641 (validMask!0 mask!1756))))

(assert (=> start!77910 e!509001))

(declare-fun array_inv!20210 (array!53565) Bool)

(assert (=> start!77910 (and (array_inv!20210 _values!1152) e!509006)))

(assert (=> start!77910 tp!57244))

(assert (=> start!77910 true))

(declare-fun tp_is_empty!18745 () Bool)

(assert (=> start!77910 tp_is_empty!18745))

(declare-fun array_inv!20211 (array!53567) Bool)

(assert (=> start!77910 (array_inv!20211 _keys!1386)))

(declare-fun b!908121 () Bool)

(declare-fun res!612634 () Bool)

(assert (=> b!908121 (=> (not res!612634) (not e!509001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53567 (_ BitVec 32)) Bool)

(assert (=> b!908121 (= res!612634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908122 () Bool)

(declare-fun res!612639 () Bool)

(assert (=> b!908122 (=> res!612639 e!509005)))

(assert (=> b!908122 (= res!612639 (not (= (apply!485 lt!409565 k0!1033) lt!409564)))))

(declare-fun b!908123 () Bool)

(declare-fun res!612642 () Bool)

(assert (=> b!908123 (=> (not res!612642) (not e!509002))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908123 (= res!612642 (inRange!0 i!717 mask!1756))))

(declare-fun b!908124 () Bool)

(declare-fun res!612638 () Bool)

(assert (=> b!908124 (=> (not res!612638) (not e!509001))))

(assert (=> b!908124 (= res!612638 (and (= (size!26197 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26198 _keys!1386) (size!26197 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908125 () Bool)

(assert (=> b!908125 (= e!509007 tp_is_empty!18745)))

(declare-fun b!908126 () Bool)

(declare-fun res!612636 () Bool)

(assert (=> b!908126 (=> (not res!612636) (not e!509002))))

(assert (=> b!908126 (= res!612636 (and (= (select (arr!25738 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908127 () Bool)

(declare-fun res!612635 () Bool)

(assert (=> b!908127 (=> (not res!612635) (not e!509001))))

(declare-datatypes ((List!18036 0))(
  ( (Nil!18033) (Cons!18032 (h!19184 (_ BitVec 64)) (t!25527 List!18036)) )
))
(declare-fun arrayNoDuplicates!0 (array!53567 (_ BitVec 32) List!18036) Bool)

(assert (=> b!908127 (= res!612635 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18033))))

(declare-fun b!908128 () Bool)

(assert (=> b!908128 (= e!509002 (not e!509000))))

(declare-fun res!612637 () Bool)

(assert (=> b!908128 (=> res!612637 e!509000)))

(assert (=> b!908128 (= res!612637 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26198 _keys!1386))))))

(declare-fun get!13548 (ValueCell!8891 V!29959) V!29959)

(declare-fun dynLambda!1374 (Int (_ BitVec 64)) V!29959)

(assert (=> b!908128 (= lt!409564 (get!13548 (select (arr!25737 _values!1152) i!717) (dynLambda!1374 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908128 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409566 () Unit!30782)

(declare-fun lemmaKeyInListMapIsInArray!233 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) Int) Unit!30782)

(assert (=> b!908128 (= lt!409566 (lemmaKeyInListMapIsInArray!233 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29830 () Bool)

(assert (=> mapIsEmpty!29830 mapRes!29830))

(declare-fun b!908129 () Bool)

(assert (=> b!908129 (= e!509004 tp_is_empty!18745)))

(assert (= (and start!77910 res!612641) b!908124))

(assert (= (and b!908124 res!612638) b!908121))

(assert (= (and b!908121 res!612634) b!908127))

(assert (= (and b!908127 res!612635) b!908118))

(assert (= (and b!908118 res!612640) b!908123))

(assert (= (and b!908123 res!612642) b!908126))

(assert (= (and b!908126 res!612636) b!908128))

(assert (= (and b!908128 (not res!612637)) b!908120))

(assert (= (and b!908120 (not res!612643)) b!908122))

(assert (= (and b!908122 (not res!612639)) b!908119))

(assert (= (and b!908117 condMapEmpty!29830) mapIsEmpty!29830))

(assert (= (and b!908117 (not condMapEmpty!29830)) mapNonEmpty!29830))

(get-info :version)

(assert (= (and mapNonEmpty!29830 ((_ is ValueCellFull!8891) mapValue!29830)) b!908125))

(assert (= (and b!908117 ((_ is ValueCellFull!8891) mapDefault!29830)) b!908129))

(assert (= start!77910 b!908117))

(declare-fun b_lambda!13215 () Bool)

(assert (=> (not b_lambda!13215) (not b!908128)))

(declare-fun t!25525 () Bool)

(declare-fun tb!5341 () Bool)

(assert (=> (and start!77910 (= defaultEntry!1160 defaultEntry!1160) t!25525) tb!5341))

(declare-fun result!10485 () Bool)

(assert (=> tb!5341 (= result!10485 tp_is_empty!18745)))

(assert (=> b!908128 t!25525))

(declare-fun b_and!26819 () Bool)

(assert (= b_and!26817 (and (=> t!25525 result!10485) b_and!26819)))

(declare-fun m!843869 () Bool)

(assert (=> b!908120 m!843869))

(declare-fun m!843871 () Bool)

(assert (=> b!908120 m!843871))

(declare-fun m!843873 () Bool)

(assert (=> start!77910 m!843873))

(declare-fun m!843875 () Bool)

(assert (=> start!77910 m!843875))

(declare-fun m!843877 () Bool)

(assert (=> start!77910 m!843877))

(declare-fun m!843879 () Bool)

(assert (=> b!908121 m!843879))

(declare-fun m!843881 () Bool)

(assert (=> b!908128 m!843881))

(declare-fun m!843883 () Bool)

(assert (=> b!908128 m!843883))

(declare-fun m!843885 () Bool)

(assert (=> b!908128 m!843885))

(declare-fun m!843887 () Bool)

(assert (=> b!908128 m!843887))

(assert (=> b!908128 m!843881))

(assert (=> b!908128 m!843885))

(declare-fun m!843889 () Bool)

(assert (=> b!908128 m!843889))

(declare-fun m!843891 () Bool)

(assert (=> b!908127 m!843891))

(declare-fun m!843893 () Bool)

(assert (=> b!908126 m!843893))

(declare-fun m!843895 () Bool)

(assert (=> b!908119 m!843895))

(declare-fun m!843897 () Bool)

(assert (=> b!908119 m!843897))

(declare-fun m!843899 () Bool)

(assert (=> b!908118 m!843899))

(declare-fun m!843901 () Bool)

(assert (=> b!908118 m!843901))

(declare-fun m!843903 () Bool)

(assert (=> b!908123 m!843903))

(declare-fun m!843905 () Bool)

(assert (=> b!908122 m!843905))

(declare-fun m!843907 () Bool)

(assert (=> mapNonEmpty!29830 m!843907))

(check-sat (not b_next!16327) (not b!908121) (not b!908123) (not b!908120) b_and!26819 (not b_lambda!13215) (not mapNonEmpty!29830) (not b!908122) (not b!908118) tp_is_empty!18745 (not b!908127) (not b!908119) (not b!908128) (not start!77910))
(check-sat b_and!26819 (not b_next!16327))
