; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79544 () Bool)

(assert start!79544)

(declare-fun b_free!17563 () Bool)

(declare-fun b_next!17563 () Bool)

(assert (=> start!79544 (= b_free!17563 (not b_next!17563))))

(declare-fun tp!61133 () Bool)

(declare-fun b_and!28695 () Bool)

(assert (=> start!79544 (= tp!61133 b_and!28695)))

(declare-fun b!933430 () Bool)

(declare-fun e!524258 () Bool)

(declare-fun e!524259 () Bool)

(declare-fun mapRes!31866 () Bool)

(assert (=> b!933430 (= e!524258 (and e!524259 mapRes!31866))))

(declare-fun condMapEmpty!31866 () Bool)

(declare-datatypes ((V!31727 0))(
  ( (V!31728 (val!10086 Int)) )
))
(declare-datatypes ((ValueCell!9554 0))(
  ( (ValueCellFull!9554 (v!12602 V!31727)) (EmptyCell!9554) )
))
(declare-datatypes ((array!56135 0))(
  ( (array!56136 (arr!27007 (Array (_ BitVec 32) ValueCell!9554)) (size!27467 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56135)

(declare-fun mapDefault!31866 () ValueCell!9554)

(assert (=> b!933430 (= condMapEmpty!31866 (= (arr!27007 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9554)) mapDefault!31866)))))

(declare-fun b!933431 () Bool)

(declare-fun e!524260 () Bool)

(declare-fun e!524256 () Bool)

(assert (=> b!933431 (= e!524260 e!524256)))

(declare-fun res!628395 () Bool)

(assert (=> b!933431 (=> (not res!628395) (not e!524256))))

(declare-datatypes ((tuple2!13202 0))(
  ( (tuple2!13203 (_1!6612 (_ BitVec 64)) (_2!6612 V!31727)) )
))
(declare-datatypes ((List!18984 0))(
  ( (Nil!18981) (Cons!18980 (h!20132 tuple2!13202) (t!27083 List!18984)) )
))
(declare-datatypes ((ListLongMap!11901 0))(
  ( (ListLongMap!11902 (toList!5966 List!18984)) )
))
(declare-fun lt!420297 () ListLongMap!11901)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5031 (ListLongMap!11901 (_ BitVec 64)) Bool)

(assert (=> b!933431 (= res!628395 (contains!5031 lt!420297 k0!1099))))

(declare-datatypes ((array!56137 0))(
  ( (array!56138 (arr!27008 (Array (_ BitVec 32) (_ BitVec 64))) (size!27468 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56137)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31727)

(declare-fun minValue!1173 () V!31727)

(declare-fun getCurrentListMap!3208 (array!56137 array!56135 (_ BitVec 32) (_ BitVec 32) V!31727 V!31727 (_ BitVec 32) Int) ListLongMap!11901)

(assert (=> b!933431 (= lt!420297 (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31866 () Bool)

(assert (=> mapIsEmpty!31866 mapRes!31866))

(declare-fun mapNonEmpty!31866 () Bool)

(declare-fun tp!61134 () Bool)

(declare-fun e!524262 () Bool)

(assert (=> mapNonEmpty!31866 (= mapRes!31866 (and tp!61134 e!524262))))

(declare-fun mapKey!31866 () (_ BitVec 32))

(declare-fun mapRest!31866 () (Array (_ BitVec 32) ValueCell!9554))

(declare-fun mapValue!31866 () ValueCell!9554)

(assert (=> mapNonEmpty!31866 (= (arr!27007 _values!1231) (store mapRest!31866 mapKey!31866 mapValue!31866))))

(declare-fun b!933432 () Bool)

(declare-fun res!628393 () Bool)

(assert (=> b!933432 (=> (not res!628393) (not e!524260))))

(declare-datatypes ((List!18985 0))(
  ( (Nil!18982) (Cons!18981 (h!20133 (_ BitVec 64)) (t!27084 List!18985)) )
))
(declare-fun arrayNoDuplicates!0 (array!56137 (_ BitVec 32) List!18985) Bool)

(assert (=> b!933432 (= res!628393 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18982))))

(declare-fun res!628397 () Bool)

(assert (=> start!79544 (=> (not res!628397) (not e!524260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79544 (= res!628397 (validMask!0 mask!1881))))

(assert (=> start!79544 e!524260))

(assert (=> start!79544 true))

(declare-fun tp_is_empty!20071 () Bool)

(assert (=> start!79544 tp_is_empty!20071))

(declare-fun array_inv!21106 (array!56135) Bool)

(assert (=> start!79544 (and (array_inv!21106 _values!1231) e!524258)))

(assert (=> start!79544 tp!61133))

(declare-fun array_inv!21107 (array!56137) Bool)

(assert (=> start!79544 (array_inv!21107 _keys!1487)))

(declare-fun b!933433 () Bool)

(declare-fun res!628392 () Bool)

(assert (=> b!933433 (=> (not res!628392) (not e!524256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933433 (= res!628392 (validKeyInArray!0 k0!1099))))

(declare-fun b!933434 () Bool)

(declare-fun res!628396 () Bool)

(assert (=> b!933434 (=> (not res!628396) (not e!524260))))

(assert (=> b!933434 (= res!628396 (and (= (size!27467 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27468 _keys!1487) (size!27467 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933435 () Bool)

(assert (=> b!933435 (= e!524259 tp_is_empty!20071)))

(declare-fun b!933436 () Bool)

(declare-fun res!628389 () Bool)

(assert (=> b!933436 (=> (not res!628389) (not e!524260))))

(assert (=> b!933436 (= res!628389 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27468 _keys!1487))))))

(declare-fun b!933437 () Bool)

(declare-fun res!628398 () Bool)

(assert (=> b!933437 (=> (not res!628398) (not e!524260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56137 (_ BitVec 32)) Bool)

(assert (=> b!933437 (= res!628398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933438 () Bool)

(declare-fun e!524257 () Bool)

(assert (=> b!933438 (= e!524257 (not true))))

(assert (=> b!933438 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18982)))

(declare-datatypes ((Unit!31458 0))(
  ( (Unit!31459) )
))
(declare-fun lt!420300 () Unit!31458)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56137 (_ BitVec 32) (_ BitVec 32)) Unit!31458)

(assert (=> b!933438 (= lt!420300 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420299 () tuple2!13202)

(declare-fun +!2794 (ListLongMap!11901 tuple2!13202) ListLongMap!11901)

(assert (=> b!933438 (contains!5031 (+!2794 lt!420297 lt!420299) k0!1099)))

(declare-fun lt!420298 () (_ BitVec 64))

(declare-fun lt!420296 () Unit!31458)

(declare-fun lt!420295 () V!31727)

(declare-fun addStillContains!497 (ListLongMap!11901 (_ BitVec 64) V!31727 (_ BitVec 64)) Unit!31458)

(assert (=> b!933438 (= lt!420296 (addStillContains!497 lt!420297 lt!420298 lt!420295 k0!1099))))

(assert (=> b!933438 (= (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2794 (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420299))))

(assert (=> b!933438 (= lt!420299 (tuple2!13203 lt!420298 lt!420295))))

(declare-fun get!14220 (ValueCell!9554 V!31727) V!31727)

(declare-fun dynLambda!1591 (Int (_ BitVec 64)) V!31727)

(assert (=> b!933438 (= lt!420295 (get!14220 (select (arr!27007 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1591 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420294 () Unit!31458)

(declare-fun lemmaListMapRecursiveValidKeyArray!174 (array!56137 array!56135 (_ BitVec 32) (_ BitVec 32) V!31727 V!31727 (_ BitVec 32) Int) Unit!31458)

(assert (=> b!933438 (= lt!420294 (lemmaListMapRecursiveValidKeyArray!174 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933439 () Bool)

(assert (=> b!933439 (= e!524256 e!524257)))

(declare-fun res!628390 () Bool)

(assert (=> b!933439 (=> (not res!628390) (not e!524257))))

(assert (=> b!933439 (= res!628390 (validKeyInArray!0 lt!420298))))

(assert (=> b!933439 (= lt!420298 (select (arr!27008 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933440 () Bool)

(declare-fun res!628391 () Bool)

(assert (=> b!933440 (=> (not res!628391) (not e!524256))))

(declare-fun v!791 () V!31727)

(declare-fun apply!794 (ListLongMap!11901 (_ BitVec 64)) V!31727)

(assert (=> b!933440 (= res!628391 (= (apply!794 lt!420297 k0!1099) v!791))))

(declare-fun b!933441 () Bool)

(assert (=> b!933441 (= e!524262 tp_is_empty!20071)))

(declare-fun b!933442 () Bool)

(declare-fun res!628394 () Bool)

(assert (=> b!933442 (=> (not res!628394) (not e!524256))))

(assert (=> b!933442 (= res!628394 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79544 res!628397) b!933434))

(assert (= (and b!933434 res!628396) b!933437))

(assert (= (and b!933437 res!628398) b!933432))

(assert (= (and b!933432 res!628393) b!933436))

(assert (= (and b!933436 res!628389) b!933431))

(assert (= (and b!933431 res!628395) b!933440))

(assert (= (and b!933440 res!628391) b!933442))

(assert (= (and b!933442 res!628394) b!933433))

(assert (= (and b!933433 res!628392) b!933439))

(assert (= (and b!933439 res!628390) b!933438))

(assert (= (and b!933430 condMapEmpty!31866) mapIsEmpty!31866))

(assert (= (and b!933430 (not condMapEmpty!31866)) mapNonEmpty!31866))

(get-info :version)

(assert (= (and mapNonEmpty!31866 ((_ is ValueCellFull!9554) mapValue!31866)) b!933441))

(assert (= (and b!933430 ((_ is ValueCellFull!9554) mapDefault!31866)) b!933435))

(assert (= start!79544 b!933430))

(declare-fun b_lambda!13911 () Bool)

(assert (=> (not b_lambda!13911) (not b!933438)))

(declare-fun t!27082 () Bool)

(declare-fun tb!5949 () Bool)

(assert (=> (and start!79544 (= defaultEntry!1235 defaultEntry!1235) t!27082) tb!5949))

(declare-fun result!11731 () Bool)

(assert (=> tb!5949 (= result!11731 tp_is_empty!20071)))

(assert (=> b!933438 t!27082))

(declare-fun b_and!28697 () Bool)

(assert (= b_and!28695 (and (=> t!27082 result!11731) b_and!28697)))

(declare-fun m!867797 () Bool)

(assert (=> b!933431 m!867797))

(declare-fun m!867799 () Bool)

(assert (=> b!933431 m!867799))

(declare-fun m!867801 () Bool)

(assert (=> mapNonEmpty!31866 m!867801))

(declare-fun m!867803 () Bool)

(assert (=> b!933433 m!867803))

(declare-fun m!867805 () Bool)

(assert (=> b!933438 m!867805))

(assert (=> b!933438 m!867805))

(declare-fun m!867807 () Bool)

(assert (=> b!933438 m!867807))

(declare-fun m!867809 () Bool)

(assert (=> b!933438 m!867809))

(declare-fun m!867811 () Bool)

(assert (=> b!933438 m!867811))

(declare-fun m!867813 () Bool)

(assert (=> b!933438 m!867813))

(declare-fun m!867815 () Bool)

(assert (=> b!933438 m!867815))

(declare-fun m!867817 () Bool)

(assert (=> b!933438 m!867817))

(assert (=> b!933438 m!867809))

(assert (=> b!933438 m!867813))

(declare-fun m!867819 () Bool)

(assert (=> b!933438 m!867819))

(declare-fun m!867821 () Bool)

(assert (=> b!933438 m!867821))

(declare-fun m!867823 () Bool)

(assert (=> b!933438 m!867823))

(declare-fun m!867825 () Bool)

(assert (=> b!933438 m!867825))

(assert (=> b!933438 m!867815))

(declare-fun m!867827 () Bool)

(assert (=> b!933438 m!867827))

(declare-fun m!867829 () Bool)

(assert (=> b!933440 m!867829))

(declare-fun m!867831 () Bool)

(assert (=> b!933432 m!867831))

(declare-fun m!867833 () Bool)

(assert (=> b!933439 m!867833))

(declare-fun m!867835 () Bool)

(assert (=> b!933439 m!867835))

(declare-fun m!867837 () Bool)

(assert (=> start!79544 m!867837))

(declare-fun m!867839 () Bool)

(assert (=> start!79544 m!867839))

(declare-fun m!867841 () Bool)

(assert (=> start!79544 m!867841))

(declare-fun m!867843 () Bool)

(assert (=> b!933437 m!867843))

(check-sat (not b!933432) b_and!28697 (not b!933438) (not b_next!17563) (not b!933431) (not b!933433) tp_is_empty!20071 (not b!933437) (not mapNonEmpty!31866) (not b!933439) (not b!933440) (not b_lambda!13911) (not start!79544))
(check-sat b_and!28697 (not b_next!17563))
