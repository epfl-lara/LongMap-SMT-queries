; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78792 () Bool)

(assert start!78792)

(declare-fun b_free!17023 () Bool)

(declare-fun b_next!17023 () Bool)

(assert (=> start!78792 (= b_free!17023 (not b_next!17023))))

(declare-fun tp!59510 () Bool)

(declare-fun b_and!27757 () Bool)

(assert (=> start!78792 (= tp!59510 b_and!27757)))

(declare-fun b!919812 () Bool)

(declare-fun res!620306 () Bool)

(declare-fun e!516254 () Bool)

(assert (=> b!919812 (=> (not res!620306) (not e!516254))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55021 0))(
  ( (array!55022 (arr!26456 (Array (_ BitVec 32) (_ BitVec 64))) (size!26917 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55021)

(assert (=> b!919812 (= res!620306 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26917 _keys!1487))))))

(declare-fun b!919813 () Bool)

(declare-fun res!620305 () Bool)

(assert (=> b!919813 (=> (not res!620305) (not e!516254))))

(declare-datatypes ((List!18597 0))(
  ( (Nil!18594) (Cons!18593 (h!19739 (_ BitVec 64)) (t!26341 List!18597)) )
))
(declare-fun arrayNoDuplicates!0 (array!55021 (_ BitVec 32) List!18597) Bool)

(assert (=> b!919813 (= res!620305 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18594))))

(declare-fun b!919814 () Bool)

(declare-fun e!516253 () Bool)

(assert (=> b!919814 (= e!516254 e!516253)))

(declare-fun res!620309 () Bool)

(assert (=> b!919814 (=> (not res!620309) (not e!516253))))

(declare-datatypes ((V!31007 0))(
  ( (V!31008 (val!9816 Int)) )
))
(declare-datatypes ((tuple2!12814 0))(
  ( (tuple2!12815 (_1!6418 (_ BitVec 64)) (_2!6418 V!31007)) )
))
(declare-datatypes ((List!18598 0))(
  ( (Nil!18595) (Cons!18594 (h!19740 tuple2!12814) (t!26342 List!18598)) )
))
(declare-datatypes ((ListLongMap!11501 0))(
  ( (ListLongMap!11502 (toList!5766 List!18598)) )
))
(declare-fun lt!412782 () ListLongMap!11501)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4765 (ListLongMap!11501 (_ BitVec 64)) Bool)

(assert (=> b!919814 (= res!620309 (contains!4765 lt!412782 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9284 0))(
  ( (ValueCellFull!9284 (v!12333 V!31007)) (EmptyCell!9284) )
))
(declare-datatypes ((array!55023 0))(
  ( (array!55024 (arr!26457 (Array (_ BitVec 32) ValueCell!9284)) (size!26918 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55023)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31007)

(declare-fun minValue!1173 () V!31007)

(declare-fun getCurrentListMap!2957 (array!55021 array!55023 (_ BitVec 32) (_ BitVec 32) V!31007 V!31007 (_ BitVec 32) Int) ListLongMap!11501)

(assert (=> b!919814 (= lt!412782 (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919815 () Bool)

(declare-fun e!516255 () Bool)

(declare-fun tp_is_empty!19531 () Bool)

(assert (=> b!919815 (= e!516255 tp_is_empty!19531)))

(declare-fun b!919816 () Bool)

(declare-fun res!620301 () Bool)

(assert (=> b!919816 (=> (not res!620301) (not e!516254))))

(assert (=> b!919816 (= res!620301 (and (= (size!26918 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26917 _keys!1487) (size!26918 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919817 () Bool)

(declare-fun e!516257 () Bool)

(declare-fun mapRes!31053 () Bool)

(assert (=> b!919817 (= e!516257 (and e!516255 mapRes!31053))))

(declare-fun condMapEmpty!31053 () Bool)

(declare-fun mapDefault!31053 () ValueCell!9284)

(assert (=> b!919817 (= condMapEmpty!31053 (= (arr!26457 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9284)) mapDefault!31053)))))

(declare-fun b!919818 () Bool)

(declare-fun res!620307 () Bool)

(assert (=> b!919818 (=> (not res!620307) (not e!516253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919818 (= res!620307 (validKeyInArray!0 k0!1099))))

(declare-fun b!919819 () Bool)

(declare-fun res!620303 () Bool)

(assert (=> b!919819 (=> (not res!620303) (not e!516253))))

(declare-fun v!791 () V!31007)

(declare-fun apply!591 (ListLongMap!11501 (_ BitVec 64)) V!31007)

(assert (=> b!919819 (= res!620303 (= (apply!591 lt!412782 k0!1099) v!791))))

(declare-fun res!620302 () Bool)

(assert (=> start!78792 (=> (not res!620302) (not e!516254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78792 (= res!620302 (validMask!0 mask!1881))))

(assert (=> start!78792 e!516254))

(assert (=> start!78792 true))

(assert (=> start!78792 tp_is_empty!19531))

(declare-fun array_inv!20700 (array!55023) Bool)

(assert (=> start!78792 (and (array_inv!20700 _values!1231) e!516257)))

(assert (=> start!78792 tp!59510))

(declare-fun array_inv!20701 (array!55021) Bool)

(assert (=> start!78792 (array_inv!20701 _keys!1487)))

(declare-fun b!919820 () Bool)

(declare-fun res!620304 () Bool)

(assert (=> b!919820 (=> (not res!620304) (not e!516253))))

(assert (=> b!919820 (= res!620304 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919821 () Bool)

(declare-fun e!516258 () Bool)

(assert (=> b!919821 (= e!516253 e!516258)))

(declare-fun res!620308 () Bool)

(assert (=> b!919821 (=> (not res!620308) (not e!516258))))

(declare-fun lt!412784 () (_ BitVec 64))

(assert (=> b!919821 (= res!620308 (validKeyInArray!0 lt!412784))))

(assert (=> b!919821 (= lt!412784 (select (arr!26456 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919822 () Bool)

(declare-fun res!620300 () Bool)

(assert (=> b!919822 (=> (not res!620300) (not e!516254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55021 (_ BitVec 32)) Bool)

(assert (=> b!919822 (= res!620300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919823 () Bool)

(assert (=> b!919823 (= e!516258 (not true))))

(assert (=> b!919823 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18594)))

(declare-datatypes ((Unit!30972 0))(
  ( (Unit!30973) )
))
(declare-fun lt!412781 () Unit!30972)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55021 (_ BitVec 32) (_ BitVec 32)) Unit!30972)

(assert (=> b!919823 (= lt!412781 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412787 () tuple2!12814)

(declare-fun +!2680 (ListLongMap!11501 tuple2!12814) ListLongMap!11501)

(assert (=> b!919823 (contains!4765 (+!2680 lt!412782 lt!412787) k0!1099)))

(declare-fun lt!412783 () V!31007)

(declare-fun lt!412785 () Unit!30972)

(declare-fun addStillContains!377 (ListLongMap!11501 (_ BitVec 64) V!31007 (_ BitVec 64)) Unit!30972)

(assert (=> b!919823 (= lt!412785 (addStillContains!377 lt!412782 lt!412784 lt!412783 k0!1099))))

(assert (=> b!919823 (= (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2680 (getCurrentListMap!2957 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412787))))

(assert (=> b!919823 (= lt!412787 (tuple2!12815 lt!412784 lt!412783))))

(declare-fun get!13883 (ValueCell!9284 V!31007) V!31007)

(declare-fun dynLambda!1436 (Int (_ BitVec 64)) V!31007)

(assert (=> b!919823 (= lt!412783 (get!13883 (select (arr!26457 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1436 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412786 () Unit!30972)

(declare-fun lemmaListMapRecursiveValidKeyArray!44 (array!55021 array!55023 (_ BitVec 32) (_ BitVec 32) V!31007 V!31007 (_ BitVec 32) Int) Unit!30972)

(assert (=> b!919823 (= lt!412786 (lemmaListMapRecursiveValidKeyArray!44 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31053 () Bool)

(assert (=> mapIsEmpty!31053 mapRes!31053))

(declare-fun mapNonEmpty!31053 () Bool)

(declare-fun tp!59511 () Bool)

(declare-fun e!516256 () Bool)

(assert (=> mapNonEmpty!31053 (= mapRes!31053 (and tp!59511 e!516256))))

(declare-fun mapKey!31053 () (_ BitVec 32))

(declare-fun mapValue!31053 () ValueCell!9284)

(declare-fun mapRest!31053 () (Array (_ BitVec 32) ValueCell!9284))

(assert (=> mapNonEmpty!31053 (= (arr!26457 _values!1231) (store mapRest!31053 mapKey!31053 mapValue!31053))))

(declare-fun b!919824 () Bool)

(assert (=> b!919824 (= e!516256 tp_is_empty!19531)))

(assert (= (and start!78792 res!620302) b!919816))

(assert (= (and b!919816 res!620301) b!919822))

(assert (= (and b!919822 res!620300) b!919813))

(assert (= (and b!919813 res!620305) b!919812))

(assert (= (and b!919812 res!620306) b!919814))

(assert (= (and b!919814 res!620309) b!919819))

(assert (= (and b!919819 res!620303) b!919820))

(assert (= (and b!919820 res!620304) b!919818))

(assert (= (and b!919818 res!620307) b!919821))

(assert (= (and b!919821 res!620308) b!919823))

(assert (= (and b!919817 condMapEmpty!31053) mapIsEmpty!31053))

(assert (= (and b!919817 (not condMapEmpty!31053)) mapNonEmpty!31053))

(get-info :version)

(assert (= (and mapNonEmpty!31053 ((_ is ValueCellFull!9284) mapValue!31053)) b!919824))

(assert (= (and b!919817 ((_ is ValueCellFull!9284) mapDefault!31053)) b!919815))

(assert (= start!78792 b!919817))

(declare-fun b_lambda!13507 () Bool)

(assert (=> (not b_lambda!13507) (not b!919823)))

(declare-fun t!26340 () Bool)

(declare-fun tb!5595 () Bool)

(assert (=> (and start!78792 (= defaultEntry!1235 defaultEntry!1235) t!26340) tb!5595))

(declare-fun result!11021 () Bool)

(assert (=> tb!5595 (= result!11021 tp_is_empty!19531)))

(assert (=> b!919823 t!26340))

(declare-fun b_and!27759 () Bool)

(assert (= b_and!27757 (and (=> t!26340 result!11021) b_and!27759)))

(declare-fun m!853177 () Bool)

(assert (=> b!919814 m!853177))

(declare-fun m!853179 () Bool)

(assert (=> b!919814 m!853179))

(declare-fun m!853181 () Bool)

(assert (=> b!919822 m!853181))

(declare-fun m!853183 () Bool)

(assert (=> b!919813 m!853183))

(declare-fun m!853185 () Bool)

(assert (=> start!78792 m!853185))

(declare-fun m!853187 () Bool)

(assert (=> start!78792 m!853187))

(declare-fun m!853189 () Bool)

(assert (=> start!78792 m!853189))

(declare-fun m!853191 () Bool)

(assert (=> b!919818 m!853191))

(declare-fun m!853193 () Bool)

(assert (=> b!919819 m!853193))

(declare-fun m!853195 () Bool)

(assert (=> b!919821 m!853195))

(declare-fun m!853197 () Bool)

(assert (=> b!919821 m!853197))

(declare-fun m!853199 () Bool)

(assert (=> b!919823 m!853199))

(declare-fun m!853201 () Bool)

(assert (=> b!919823 m!853201))

(declare-fun m!853203 () Bool)

(assert (=> b!919823 m!853203))

(declare-fun m!853205 () Bool)

(assert (=> b!919823 m!853205))

(declare-fun m!853207 () Bool)

(assert (=> b!919823 m!853207))

(declare-fun m!853209 () Bool)

(assert (=> b!919823 m!853209))

(declare-fun m!853211 () Bool)

(assert (=> b!919823 m!853211))

(declare-fun m!853213 () Bool)

(assert (=> b!919823 m!853213))

(declare-fun m!853215 () Bool)

(assert (=> b!919823 m!853215))

(assert (=> b!919823 m!853205))

(assert (=> b!919823 m!853207))

(declare-fun m!853217 () Bool)

(assert (=> b!919823 m!853217))

(assert (=> b!919823 m!853201))

(declare-fun m!853219 () Bool)

(assert (=> b!919823 m!853219))

(assert (=> b!919823 m!853199))

(declare-fun m!853221 () Bool)

(assert (=> b!919823 m!853221))

(declare-fun m!853223 () Bool)

(assert (=> mapNonEmpty!31053 m!853223))

(check-sat (not b!919821) (not b!919823) (not b_lambda!13507) b_and!27759 (not b!919814) (not b!919818) (not start!78792) (not b!919822) tp_is_empty!19531 (not b_next!17023) (not b!919819) (not mapNonEmpty!31053) (not b!919813))
(check-sat b_and!27759 (not b_next!17023))
