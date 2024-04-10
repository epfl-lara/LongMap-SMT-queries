; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77794 () Bool)

(assert start!77794)

(declare-fun b_free!16353 () Bool)

(declare-fun b_next!16353 () Bool)

(assert (=> start!77794 (= b_free!16353 (not b_next!16353))))

(declare-fun tp!57324 () Bool)

(declare-fun b_and!26863 () Bool)

(assert (=> start!77794 (= tp!57324 b_and!26863)))

(declare-fun b!907899 () Bool)

(declare-fun res!612749 () Bool)

(declare-fun e!508835 () Bool)

(assert (=> b!907899 (=> res!612749 e!508835)))

(declare-datatypes ((V!29993 0))(
  ( (V!29994 (val!9436 Int)) )
))
(declare-fun lt!409516 () V!29993)

(declare-datatypes ((tuple2!12288 0))(
  ( (tuple2!12289 (_1!6155 (_ BitVec 64)) (_2!6155 V!29993)) )
))
(declare-datatypes ((List!18088 0))(
  ( (Nil!18085) (Cons!18084 (h!19230 tuple2!12288) (t!25613 List!18088)) )
))
(declare-datatypes ((ListLongMap!10985 0))(
  ( (ListLongMap!10986 (toList!5508 List!18088)) )
))
(declare-fun lt!409519 () ListLongMap!10985)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!492 (ListLongMap!10985 (_ BitVec 64)) V!29993)

(assert (=> b!907899 (= res!612749 (not (= (apply!492 lt!409519 k0!1033) lt!409516)))))

(declare-fun b!907900 () Bool)

(declare-fun e!508832 () Bool)

(declare-fun e!508836 () Bool)

(declare-fun mapRes!29872 () Bool)

(assert (=> b!907900 (= e!508832 (and e!508836 mapRes!29872))))

(declare-fun condMapEmpty!29872 () Bool)

(declare-datatypes ((ValueCell!8904 0))(
  ( (ValueCellFull!8904 (v!11943 V!29993)) (EmptyCell!8904) )
))
(declare-datatypes ((array!53576 0))(
  ( (array!53577 (arr!25746 (Array (_ BitVec 32) ValueCell!8904)) (size!26205 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53576)

(declare-fun mapDefault!29872 () ValueCell!8904)

(assert (=> b!907900 (= condMapEmpty!29872 (= (arr!25746 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8904)) mapDefault!29872)))))

(declare-fun b!907901 () Bool)

(declare-fun e!508834 () Bool)

(declare-fun tp_is_empty!18771 () Bool)

(assert (=> b!907901 (= e!508834 tp_is_empty!18771)))

(declare-fun b!907902 () Bool)

(declare-fun res!612752 () Bool)

(declare-fun e!508839 () Bool)

(assert (=> b!907902 (=> (not res!612752) (not e!508839))))

(declare-datatypes ((array!53578 0))(
  ( (array!53579 (arr!25747 (Array (_ BitVec 32) (_ BitVec 64))) (size!26206 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53578)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53578 (_ BitVec 32)) Bool)

(assert (=> b!907902 (= res!612752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!612745 () Bool)

(assert (=> start!77794 (=> (not res!612745) (not e!508839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77794 (= res!612745 (validMask!0 mask!1756))))

(assert (=> start!77794 e!508839))

(declare-fun array_inv!20158 (array!53576) Bool)

(assert (=> start!77794 (and (array_inv!20158 _values!1152) e!508832)))

(assert (=> start!77794 tp!57324))

(assert (=> start!77794 true))

(assert (=> start!77794 tp_is_empty!18771))

(declare-fun array_inv!20159 (array!53578) Bool)

(assert (=> start!77794 (array_inv!20159 _keys!1386)))

(declare-fun b!907903 () Bool)

(assert (=> b!907903 (= e!508836 tp_is_empty!18771)))

(declare-fun b!907904 () Bool)

(declare-fun res!612744 () Bool)

(declare-fun e!508837 () Bool)

(assert (=> b!907904 (=> (not res!612744) (not e!508837))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907904 (= res!612744 (inRange!0 i!717 mask!1756))))

(declare-fun b!907905 () Bool)

(declare-fun e!508833 () Bool)

(assert (=> b!907905 (= e!508833 e!508835)))

(declare-fun res!612753 () Bool)

(assert (=> b!907905 (=> res!612753 e!508835)))

(declare-fun contains!4552 (ListLongMap!10985 (_ BitVec 64)) Bool)

(assert (=> b!907905 (= res!612753 (not (contains!4552 lt!409519 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29993)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29993)

(declare-fun getCurrentListMap!2772 (array!53578 array!53576 (_ BitVec 32) (_ BitVec 32) V!29993 V!29993 (_ BitVec 32) Int) ListLongMap!10985)

(assert (=> b!907905 (= lt!409519 (getCurrentListMap!2772 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907906 () Bool)

(assert (=> b!907906 (= e!508839 e!508837)))

(declare-fun res!612747 () Bool)

(assert (=> b!907906 (=> (not res!612747) (not e!508837))))

(declare-fun lt!409518 () ListLongMap!10985)

(assert (=> b!907906 (= res!612747 (contains!4552 lt!409518 k0!1033))))

(assert (=> b!907906 (= lt!409518 (getCurrentListMap!2772 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907907 () Bool)

(declare-fun res!612746 () Bool)

(assert (=> b!907907 (=> (not res!612746) (not e!508837))))

(assert (=> b!907907 (= res!612746 (and (= (select (arr!25747 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907908 () Bool)

(assert (=> b!907908 (= e!508835 true)))

(assert (=> b!907908 (= (apply!492 lt!409518 k0!1033) lt!409516)))

(declare-datatypes ((Unit!30814 0))(
  ( (Unit!30815) )
))
(declare-fun lt!409520 () Unit!30814)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!45 (array!53578 array!53576 (_ BitVec 32) (_ BitVec 32) V!29993 V!29993 (_ BitVec 64) V!29993 (_ BitVec 32) Int) Unit!30814)

(assert (=> b!907908 (= lt!409520 (lemmaListMapApplyFromThenApplyFromZero!45 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409516 i!717 defaultEntry!1160))))

(declare-fun b!907909 () Bool)

(declare-fun res!612751 () Bool)

(assert (=> b!907909 (=> (not res!612751) (not e!508839))))

(assert (=> b!907909 (= res!612751 (and (= (size!26205 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26206 _keys!1386) (size!26205 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907910 () Bool)

(assert (=> b!907910 (= e!508837 (not e!508833))))

(declare-fun res!612748 () Bool)

(assert (=> b!907910 (=> res!612748 e!508833)))

(assert (=> b!907910 (= res!612748 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26206 _keys!1386))))))

(declare-fun get!13550 (ValueCell!8904 V!29993) V!29993)

(declare-fun dynLambda!1369 (Int (_ BitVec 64)) V!29993)

(assert (=> b!907910 (= lt!409516 (get!13550 (select (arr!25746 _values!1152) i!717) (dynLambda!1369 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907910 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409517 () Unit!30814)

(declare-fun lemmaKeyInListMapIsInArray!241 (array!53578 array!53576 (_ BitVec 32) (_ BitVec 32) V!29993 V!29993 (_ BitVec 64) Int) Unit!30814)

(assert (=> b!907910 (= lt!409517 (lemmaKeyInListMapIsInArray!241 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29872 () Bool)

(assert (=> mapIsEmpty!29872 mapRes!29872))

(declare-fun b!907911 () Bool)

(declare-fun res!612750 () Bool)

(assert (=> b!907911 (=> (not res!612750) (not e!508839))))

(declare-datatypes ((List!18089 0))(
  ( (Nil!18086) (Cons!18085 (h!19231 (_ BitVec 64)) (t!25614 List!18089)) )
))
(declare-fun arrayNoDuplicates!0 (array!53578 (_ BitVec 32) List!18089) Bool)

(assert (=> b!907911 (= res!612750 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18086))))

(declare-fun mapNonEmpty!29872 () Bool)

(declare-fun tp!57323 () Bool)

(assert (=> mapNonEmpty!29872 (= mapRes!29872 (and tp!57323 e!508834))))

(declare-fun mapRest!29872 () (Array (_ BitVec 32) ValueCell!8904))

(declare-fun mapKey!29872 () (_ BitVec 32))

(declare-fun mapValue!29872 () ValueCell!8904)

(assert (=> mapNonEmpty!29872 (= (arr!25746 _values!1152) (store mapRest!29872 mapKey!29872 mapValue!29872))))

(assert (= (and start!77794 res!612745) b!907909))

(assert (= (and b!907909 res!612751) b!907902))

(assert (= (and b!907902 res!612752) b!907911))

(assert (= (and b!907911 res!612750) b!907906))

(assert (= (and b!907906 res!612747) b!907904))

(assert (= (and b!907904 res!612744) b!907907))

(assert (= (and b!907907 res!612746) b!907910))

(assert (= (and b!907910 (not res!612748)) b!907905))

(assert (= (and b!907905 (not res!612753)) b!907899))

(assert (= (and b!907899 (not res!612749)) b!907908))

(assert (= (and b!907900 condMapEmpty!29872) mapIsEmpty!29872))

(assert (= (and b!907900 (not condMapEmpty!29872)) mapNonEmpty!29872))

(get-info :version)

(assert (= (and mapNonEmpty!29872 ((_ is ValueCellFull!8904) mapValue!29872)) b!907901))

(assert (= (and b!907900 ((_ is ValueCellFull!8904) mapDefault!29872)) b!907903))

(assert (= start!77794 b!907900))

(declare-fun b_lambda!13237 () Bool)

(assert (=> (not b_lambda!13237) (not b!907910)))

(declare-fun t!25612 () Bool)

(declare-fun tb!5375 () Bool)

(assert (=> (and start!77794 (= defaultEntry!1160 defaultEntry!1160) t!25612) tb!5375))

(declare-fun result!10547 () Bool)

(assert (=> tb!5375 (= result!10547 tp_is_empty!18771)))

(assert (=> b!907910 t!25612))

(declare-fun b_and!26865 () Bool)

(assert (= b_and!26863 (and (=> t!25612 result!10547) b_and!26865)))

(declare-fun m!843249 () Bool)

(assert (=> b!907902 m!843249))

(declare-fun m!843251 () Bool)

(assert (=> b!907911 m!843251))

(declare-fun m!843253 () Bool)

(assert (=> b!907899 m!843253))

(declare-fun m!843255 () Bool)

(assert (=> b!907905 m!843255))

(declare-fun m!843257 () Bool)

(assert (=> b!907905 m!843257))

(declare-fun m!843259 () Bool)

(assert (=> mapNonEmpty!29872 m!843259))

(declare-fun m!843261 () Bool)

(assert (=> b!907907 m!843261))

(declare-fun m!843263 () Bool)

(assert (=> b!907906 m!843263))

(declare-fun m!843265 () Bool)

(assert (=> b!907906 m!843265))

(declare-fun m!843267 () Bool)

(assert (=> b!907908 m!843267))

(declare-fun m!843269 () Bool)

(assert (=> b!907908 m!843269))

(declare-fun m!843271 () Bool)

(assert (=> b!907904 m!843271))

(declare-fun m!843273 () Bool)

(assert (=> b!907910 m!843273))

(declare-fun m!843275 () Bool)

(assert (=> b!907910 m!843275))

(declare-fun m!843277 () Bool)

(assert (=> b!907910 m!843277))

(declare-fun m!843279 () Bool)

(assert (=> b!907910 m!843279))

(assert (=> b!907910 m!843273))

(assert (=> b!907910 m!843277))

(declare-fun m!843281 () Bool)

(assert (=> b!907910 m!843281))

(declare-fun m!843283 () Bool)

(assert (=> start!77794 m!843283))

(declare-fun m!843285 () Bool)

(assert (=> start!77794 m!843285))

(declare-fun m!843287 () Bool)

(assert (=> start!77794 m!843287))

(check-sat (not start!77794) (not b_lambda!13237) (not b_next!16353) (not b!907911) (not mapNonEmpty!29872) b_and!26865 (not b!907905) (not b!907904) (not b!907910) (not b!907908) (not b!907899) tp_is_empty!18771 (not b!907902) (not b!907906))
(check-sat b_and!26865 (not b_next!16353))
