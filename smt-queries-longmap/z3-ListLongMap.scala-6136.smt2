; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78926 () Bool)

(assert start!78926)

(declare-fun b_free!17139 () Bool)

(declare-fun b_next!17139 () Bool)

(assert (=> start!78926 (= b_free!17139 (not b_next!17139))))

(declare-fun tp!59857 () Bool)

(declare-fun b_and!28015 () Bool)

(assert (=> start!78926 (= tp!59857 b_and!28015)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!517861 () Bool)

(declare-fun b!922988 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55270 0))(
  ( (array!55271 (arr!26580 (Array (_ BitVec 32) (_ BitVec 64))) (size!27039 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55270)

(declare-fun arrayContainsKey!0 (array!55270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922988 (= e!517861 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922989 () Bool)

(declare-fun res!622399 () Bool)

(declare-fun e!517862 () Bool)

(assert (=> b!922989 (=> (not res!622399) (not e!517862))))

(declare-datatypes ((List!18654 0))(
  ( (Nil!18651) (Cons!18650 (h!19796 (_ BitVec 64)) (t!26523 List!18654)) )
))
(declare-fun arrayNoDuplicates!0 (array!55270 (_ BitVec 32) List!18654) Bool)

(assert (=> b!922989 (= res!622399 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18651))))

(declare-fun b!922990 () Bool)

(declare-fun res!622402 () Bool)

(assert (=> b!922990 (=> (not res!622402) (not e!517862))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55270 (_ BitVec 32)) Bool)

(assert (=> b!922990 (= res!622402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922991 () Bool)

(declare-fun e!517857 () Bool)

(declare-fun e!517863 () Bool)

(assert (=> b!922991 (= e!517857 e!517863)))

(declare-fun res!622394 () Bool)

(assert (=> b!922991 (=> (not res!622394) (not e!517863))))

(declare-fun lt!414554 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922991 (= res!622394 (validKeyInArray!0 lt!414554))))

(assert (=> b!922991 (= lt!414554 (select (arr!26580 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922992 () Bool)

(assert (=> b!922992 (= e!517863 (not (bvsle from!1844 (size!27039 _keys!1487))))))

(assert (=> b!922992 (not (= lt!414554 k0!1099))))

(declare-datatypes ((Unit!31132 0))(
  ( (Unit!31133) )
))
(declare-fun lt!414553 () Unit!31132)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55270 (_ BitVec 64) (_ BitVec 32) List!18654) Unit!31132)

(assert (=> b!922992 (= lt!414553 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18651))))

(assert (=> b!922992 e!517861))

(declare-fun c!96210 () Bool)

(assert (=> b!922992 (= c!96210 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31161 0))(
  ( (V!31162 (val!9874 Int)) )
))
(declare-datatypes ((ValueCell!9342 0))(
  ( (ValueCellFull!9342 (v!12392 V!31161)) (EmptyCell!9342) )
))
(declare-datatypes ((array!55272 0))(
  ( (array!55273 (arr!26581 (Array (_ BitVec 32) ValueCell!9342)) (size!27040 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55272)

(declare-fun lt!414558 () Unit!31132)

(declare-fun zeroValue!1173 () V!31161)

(declare-fun minValue!1173 () V!31161)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!199 (array!55270 array!55272 (_ BitVec 32) (_ BitVec 32) V!31161 V!31161 (_ BitVec 64) (_ BitVec 32) Int) Unit!31132)

(assert (=> b!922992 (= lt!414558 (lemmaListMapContainsThenArrayContainsFrom!199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922992 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18651)))

(declare-fun lt!414552 () Unit!31132)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55270 (_ BitVec 32) (_ BitVec 32)) Unit!31132)

(assert (=> b!922992 (= lt!414552 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12848 0))(
  ( (tuple2!12849 (_1!6435 (_ BitVec 64)) (_2!6435 V!31161)) )
))
(declare-datatypes ((List!18655 0))(
  ( (Nil!18652) (Cons!18651 (h!19797 tuple2!12848) (t!26524 List!18655)) )
))
(declare-datatypes ((ListLongMap!11545 0))(
  ( (ListLongMap!11546 (toList!5788 List!18655)) )
))
(declare-fun lt!414557 () ListLongMap!11545)

(declare-fun lt!414559 () tuple2!12848)

(declare-fun contains!4851 (ListLongMap!11545 (_ BitVec 64)) Bool)

(declare-fun +!2692 (ListLongMap!11545 tuple2!12848) ListLongMap!11545)

(assert (=> b!922992 (contains!4851 (+!2692 lt!414557 lt!414559) k0!1099)))

(declare-fun lt!414555 () Unit!31132)

(declare-fun lt!414551 () V!31161)

(declare-fun addStillContains!416 (ListLongMap!11545 (_ BitVec 64) V!31161 (_ BitVec 64)) Unit!31132)

(assert (=> b!922992 (= lt!414555 (addStillContains!416 lt!414557 lt!414554 lt!414551 k0!1099))))

(declare-fun getCurrentListMap!3042 (array!55270 array!55272 (_ BitVec 32) (_ BitVec 32) V!31161 V!31161 (_ BitVec 32) Int) ListLongMap!11545)

(assert (=> b!922992 (= (getCurrentListMap!3042 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2692 (getCurrentListMap!3042 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414559))))

(assert (=> b!922992 (= lt!414559 (tuple2!12849 lt!414554 lt!414551))))

(declare-fun get!13961 (ValueCell!9342 V!31161) V!31161)

(declare-fun dynLambda!1481 (Int (_ BitVec 64)) V!31161)

(assert (=> b!922992 (= lt!414551 (get!13961 (select (arr!26581 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1481 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414556 () Unit!31132)

(declare-fun lemmaListMapRecursiveValidKeyArray!82 (array!55270 array!55272 (_ BitVec 32) (_ BitVec 32) V!31161 V!31161 (_ BitVec 32) Int) Unit!31132)

(assert (=> b!922992 (= lt!414556 (lemmaListMapRecursiveValidKeyArray!82 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31227 () Bool)

(declare-fun mapRes!31227 () Bool)

(assert (=> mapIsEmpty!31227 mapRes!31227))

(declare-fun b!922993 () Bool)

(declare-fun e!517859 () Bool)

(declare-fun tp_is_empty!19647 () Bool)

(assert (=> b!922993 (= e!517859 tp_is_empty!19647)))

(declare-fun b!922994 () Bool)

(declare-fun e!517858 () Bool)

(assert (=> b!922994 (= e!517858 tp_is_empty!19647)))

(declare-fun b!922995 () Bool)

(declare-fun res!622393 () Bool)

(assert (=> b!922995 (=> (not res!622393) (not e!517862))))

(assert (=> b!922995 (= res!622393 (and (= (size!27040 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27039 _keys!1487) (size!27040 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31227 () Bool)

(declare-fun tp!59858 () Bool)

(assert (=> mapNonEmpty!31227 (= mapRes!31227 (and tp!59858 e!517859))))

(declare-fun mapValue!31227 () ValueCell!9342)

(declare-fun mapRest!31227 () (Array (_ BitVec 32) ValueCell!9342))

(declare-fun mapKey!31227 () (_ BitVec 32))

(assert (=> mapNonEmpty!31227 (= (arr!26581 _values!1231) (store mapRest!31227 mapKey!31227 mapValue!31227))))

(declare-fun b!922996 () Bool)

(declare-fun e!517864 () Bool)

(assert (=> b!922996 (= e!517864 (and e!517858 mapRes!31227))))

(declare-fun condMapEmpty!31227 () Bool)

(declare-fun mapDefault!31227 () ValueCell!9342)

(assert (=> b!922996 (= condMapEmpty!31227 (= (arr!26581 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9342)) mapDefault!31227)))))

(declare-fun b!922997 () Bool)

(declare-fun res!622400 () Bool)

(assert (=> b!922997 (=> (not res!622400) (not e!517857))))

(declare-fun v!791 () V!31161)

(declare-fun apply!620 (ListLongMap!11545 (_ BitVec 64)) V!31161)

(assert (=> b!922997 (= res!622400 (= (apply!620 lt!414557 k0!1099) v!791))))

(declare-fun b!922998 () Bool)

(assert (=> b!922998 (= e!517861 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!622396 () Bool)

(assert (=> start!78926 (=> (not res!622396) (not e!517862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78926 (= res!622396 (validMask!0 mask!1881))))

(assert (=> start!78926 e!517862))

(assert (=> start!78926 true))

(assert (=> start!78926 tp_is_empty!19647))

(declare-fun array_inv!20704 (array!55272) Bool)

(assert (=> start!78926 (and (array_inv!20704 _values!1231) e!517864)))

(assert (=> start!78926 tp!59857))

(declare-fun array_inv!20705 (array!55270) Bool)

(assert (=> start!78926 (array_inv!20705 _keys!1487)))

(declare-fun b!922999 () Bool)

(declare-fun res!622398 () Bool)

(assert (=> b!922999 (=> (not res!622398) (not e!517857))))

(assert (=> b!922999 (= res!622398 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923000 () Bool)

(assert (=> b!923000 (= e!517862 e!517857)))

(declare-fun res!622395 () Bool)

(assert (=> b!923000 (=> (not res!622395) (not e!517857))))

(assert (=> b!923000 (= res!622395 (contains!4851 lt!414557 k0!1099))))

(assert (=> b!923000 (= lt!414557 (getCurrentListMap!3042 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923001 () Bool)

(declare-fun res!622397 () Bool)

(assert (=> b!923001 (=> (not res!622397) (not e!517857))))

(assert (=> b!923001 (= res!622397 (validKeyInArray!0 k0!1099))))

(declare-fun b!923002 () Bool)

(declare-fun res!622401 () Bool)

(assert (=> b!923002 (=> (not res!622401) (not e!517862))))

(assert (=> b!923002 (= res!622401 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27039 _keys!1487))))))

(assert (= (and start!78926 res!622396) b!922995))

(assert (= (and b!922995 res!622393) b!922990))

(assert (= (and b!922990 res!622402) b!922989))

(assert (= (and b!922989 res!622399) b!923002))

(assert (= (and b!923002 res!622401) b!923000))

(assert (= (and b!923000 res!622395) b!922997))

(assert (= (and b!922997 res!622400) b!922999))

(assert (= (and b!922999 res!622398) b!923001))

(assert (= (and b!923001 res!622397) b!922991))

(assert (= (and b!922991 res!622394) b!922992))

(assert (= (and b!922992 c!96210) b!922988))

(assert (= (and b!922992 (not c!96210)) b!922998))

(assert (= (and b!922996 condMapEmpty!31227) mapIsEmpty!31227))

(assert (= (and b!922996 (not condMapEmpty!31227)) mapNonEmpty!31227))

(get-info :version)

(assert (= (and mapNonEmpty!31227 ((_ is ValueCellFull!9342) mapValue!31227)) b!922993))

(assert (= (and b!922996 ((_ is ValueCellFull!9342) mapDefault!31227)) b!922994))

(assert (= start!78926 b!922996))

(declare-fun b_lambda!13641 () Bool)

(assert (=> (not b_lambda!13641) (not b!922992)))

(declare-fun t!26522 () Bool)

(declare-fun tb!5719 () Bool)

(assert (=> (and start!78926 (= defaultEntry!1235 defaultEntry!1235) t!26522) tb!5719))

(declare-fun result!11261 () Bool)

(assert (=> tb!5719 (= result!11261 tp_is_empty!19647)))

(assert (=> b!922992 t!26522))

(declare-fun b_and!28017 () Bool)

(assert (= b_and!28015 (and (=> t!26522 result!11261) b_and!28017)))

(declare-fun m!857139 () Bool)

(assert (=> b!923000 m!857139))

(declare-fun m!857141 () Bool)

(assert (=> b!923000 m!857141))

(declare-fun m!857143 () Bool)

(assert (=> mapNonEmpty!31227 m!857143))

(declare-fun m!857145 () Bool)

(assert (=> b!922989 m!857145))

(declare-fun m!857147 () Bool)

(assert (=> b!922997 m!857147))

(declare-fun m!857149 () Bool)

(assert (=> b!922992 m!857149))

(declare-fun m!857151 () Bool)

(assert (=> b!922992 m!857151))

(declare-fun m!857153 () Bool)

(assert (=> b!922992 m!857153))

(declare-fun m!857155 () Bool)

(assert (=> b!922992 m!857155))

(declare-fun m!857157 () Bool)

(assert (=> b!922992 m!857157))

(declare-fun m!857159 () Bool)

(assert (=> b!922992 m!857159))

(declare-fun m!857161 () Bool)

(assert (=> b!922992 m!857161))

(declare-fun m!857163 () Bool)

(assert (=> b!922992 m!857163))

(assert (=> b!922992 m!857153))

(assert (=> b!922992 m!857155))

(declare-fun m!857165 () Bool)

(assert (=> b!922992 m!857165))

(assert (=> b!922992 m!857151))

(declare-fun m!857167 () Bool)

(assert (=> b!922992 m!857167))

(declare-fun m!857169 () Bool)

(assert (=> b!922992 m!857169))

(assert (=> b!922992 m!857161))

(declare-fun m!857171 () Bool)

(assert (=> b!922992 m!857171))

(declare-fun m!857173 () Bool)

(assert (=> b!922992 m!857173))

(declare-fun m!857175 () Bool)

(assert (=> b!922992 m!857175))

(declare-fun m!857177 () Bool)

(assert (=> b!923001 m!857177))

(declare-fun m!857179 () Bool)

(assert (=> start!78926 m!857179))

(declare-fun m!857181 () Bool)

(assert (=> start!78926 m!857181))

(declare-fun m!857183 () Bool)

(assert (=> start!78926 m!857183))

(declare-fun m!857185 () Bool)

(assert (=> b!922988 m!857185))

(declare-fun m!857187 () Bool)

(assert (=> b!922991 m!857187))

(declare-fun m!857189 () Bool)

(assert (=> b!922991 m!857189))

(declare-fun m!857191 () Bool)

(assert (=> b!922990 m!857191))

(check-sat (not b!922997) (not b!922991) (not b_next!17139) (not b!922992) (not b_lambda!13641) (not b!922990) (not b!923000) (not b!922988) (not b!923001) b_and!28017 tp_is_empty!19647 (not mapNonEmpty!31227) (not b!922989) (not start!78926))
(check-sat b_and!28017 (not b_next!17139))
