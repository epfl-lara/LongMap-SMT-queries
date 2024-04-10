; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79088 () Bool)

(assert start!79088)

(declare-fun b_free!17301 () Bool)

(declare-fun b_next!17301 () Bool)

(assert (=> start!79088 (= b_free!17301 (not b_next!17301))))

(declare-fun tp!60344 () Bool)

(declare-fun b_and!28339 () Bool)

(assert (=> start!79088 (= tp!60344 b_and!28339)))

(declare-fun b!927747 () Bool)

(declare-fun e!520854 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927747 (= e!520854 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927748 () Bool)

(declare-fun res!624855 () Bool)

(declare-fun e!520859 () Bool)

(assert (=> b!927748 (=> (not res!624855) (not e!520859))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55578 0))(
  ( (array!55579 (arr!26734 (Array (_ BitVec 32) (_ BitVec 64))) (size!27193 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55578)

(assert (=> b!927748 (= res!624855 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27193 _keys!1487))))))

(declare-fun b!927749 () Bool)

(declare-datatypes ((Unit!31386 0))(
  ( (Unit!31387) )
))
(declare-fun e!520855 () Unit!31386)

(declare-fun Unit!31388 () Unit!31386)

(assert (=> b!927749 (= e!520855 Unit!31388)))

(declare-fun mapNonEmpty!31470 () Bool)

(declare-fun mapRes!31470 () Bool)

(declare-fun tp!60343 () Bool)

(declare-fun e!520857 () Bool)

(assert (=> mapNonEmpty!31470 (= mapRes!31470 (and tp!60343 e!520857))))

(declare-fun mapKey!31470 () (_ BitVec 32))

(declare-datatypes ((V!31377 0))(
  ( (V!31378 (val!9955 Int)) )
))
(declare-datatypes ((ValueCell!9423 0))(
  ( (ValueCellFull!9423 (v!12473 V!31377)) (EmptyCell!9423) )
))
(declare-datatypes ((array!55580 0))(
  ( (array!55581 (arr!26735 (Array (_ BitVec 32) ValueCell!9423)) (size!27194 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55580)

(declare-fun mapRest!31470 () (Array (_ BitVec 32) ValueCell!9423))

(declare-fun mapValue!31470 () ValueCell!9423)

(assert (=> mapNonEmpty!31470 (= (arr!26735 _values!1231) (store mapRest!31470 mapKey!31470 mapValue!31470))))

(declare-fun b!927750 () Bool)

(declare-fun e!520864 () Bool)

(assert (=> b!927750 (= e!520859 e!520864)))

(declare-fun res!624856 () Bool)

(assert (=> b!927750 (=> (not res!624856) (not e!520864))))

(declare-datatypes ((tuple2!12998 0))(
  ( (tuple2!12999 (_1!6510 (_ BitVec 64)) (_2!6510 V!31377)) )
))
(declare-datatypes ((List!18799 0))(
  ( (Nil!18796) (Cons!18795 (h!19941 tuple2!12998) (t!26830 List!18799)) )
))
(declare-datatypes ((ListLongMap!11695 0))(
  ( (ListLongMap!11696 (toList!5863 List!18799)) )
))
(declare-fun lt!418255 () ListLongMap!11695)

(declare-fun contains!4921 (ListLongMap!11695 (_ BitVec 64)) Bool)

(assert (=> b!927750 (= res!624856 (contains!4921 lt!418255 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31377)

(declare-fun minValue!1173 () V!31377)

(declare-fun getCurrentListMap!3112 (array!55578 array!55580 (_ BitVec 32) (_ BitVec 32) V!31377 V!31377 (_ BitVec 32) Int) ListLongMap!11695)

(assert (=> b!927750 (= lt!418255 (getCurrentListMap!3112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927751 () Bool)

(declare-fun e!520858 () Unit!31386)

(declare-fun Unit!31389 () Unit!31386)

(assert (=> b!927751 (= e!520858 Unit!31389)))

(declare-fun b!927752 () Bool)

(declare-fun lt!418253 () ListLongMap!11695)

(declare-fun lt!418261 () V!31377)

(declare-fun apply!693 (ListLongMap!11695 (_ BitVec 64)) V!31377)

(assert (=> b!927752 (= (apply!693 lt!418253 k0!1099) lt!418261)))

(declare-fun lt!418260 () V!31377)

(declare-fun lt!418259 () (_ BitVec 64))

(declare-fun lt!418254 () Unit!31386)

(declare-fun addApplyDifferent!408 (ListLongMap!11695 (_ BitVec 64) V!31377 (_ BitVec 64)) Unit!31386)

(assert (=> b!927752 (= lt!418254 (addApplyDifferent!408 lt!418255 lt!418259 lt!418260 k0!1099))))

(assert (=> b!927752 (not (= lt!418259 k0!1099))))

(declare-fun lt!418257 () Unit!31386)

(declare-datatypes ((List!18800 0))(
  ( (Nil!18797) (Cons!18796 (h!19942 (_ BitVec 64)) (t!26831 List!18800)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55578 (_ BitVec 64) (_ BitVec 32) List!18800) Unit!31386)

(assert (=> b!927752 (= lt!418257 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18797))))

(assert (=> b!927752 e!520854))

(declare-fun c!96915 () Bool)

(assert (=> b!927752 (= c!96915 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418263 () Unit!31386)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!259 (array!55578 array!55580 (_ BitVec 32) (_ BitVec 32) V!31377 V!31377 (_ BitVec 64) (_ BitVec 32) Int) Unit!31386)

(assert (=> b!927752 (= lt!418263 (lemmaListMapContainsThenArrayContainsFrom!259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55578 (_ BitVec 32) List!18800) Bool)

(assert (=> b!927752 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18797)))

(declare-fun lt!418256 () Unit!31386)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55578 (_ BitVec 32) (_ BitVec 32)) Unit!31386)

(assert (=> b!927752 (= lt!418256 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927752 (contains!4921 lt!418253 k0!1099)))

(declare-fun lt!418252 () tuple2!12998)

(declare-fun +!2752 (ListLongMap!11695 tuple2!12998) ListLongMap!11695)

(assert (=> b!927752 (= lt!418253 (+!2752 lt!418255 lt!418252))))

(declare-fun lt!418249 () Unit!31386)

(declare-fun addStillContains!476 (ListLongMap!11695 (_ BitVec 64) V!31377 (_ BitVec 64)) Unit!31386)

(assert (=> b!927752 (= lt!418249 (addStillContains!476 lt!418255 lt!418259 lt!418260 k0!1099))))

(assert (=> b!927752 (= (getCurrentListMap!3112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2752 (getCurrentListMap!3112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418252))))

(assert (=> b!927752 (= lt!418252 (tuple2!12999 lt!418259 lt!418260))))

(declare-fun get!14075 (ValueCell!9423 V!31377) V!31377)

(declare-fun dynLambda!1541 (Int (_ BitVec 64)) V!31377)

(assert (=> b!927752 (= lt!418260 (get!14075 (select (arr!26735 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1541 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418264 () Unit!31386)

(declare-fun lemmaListMapRecursiveValidKeyArray!142 (array!55578 array!55580 (_ BitVec 32) (_ BitVec 32) V!31377 V!31377 (_ BitVec 32) Int) Unit!31386)

(assert (=> b!927752 (= lt!418264 (lemmaListMapRecursiveValidKeyArray!142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927752 (= e!520858 lt!418254)))

(declare-fun b!927753 () Bool)

(declare-fun tp_is_empty!19809 () Bool)

(assert (=> b!927753 (= e!520857 tp_is_empty!19809)))

(declare-fun b!927754 () Bool)

(declare-fun e!520853 () Bool)

(assert (=> b!927754 (= e!520853 (not true))))

(declare-fun e!520856 () Bool)

(assert (=> b!927754 e!520856))

(declare-fun res!624860 () Bool)

(assert (=> b!927754 (=> (not res!624860) (not e!520856))))

(declare-fun lt!418250 () ListLongMap!11695)

(assert (=> b!927754 (= res!624860 (contains!4921 lt!418250 k0!1099))))

(assert (=> b!927754 (= lt!418250 (getCurrentListMap!3112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418251 () Unit!31386)

(declare-fun v!791 () V!31377)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!93 (array!55578 array!55580 (_ BitVec 32) (_ BitVec 32) V!31377 V!31377 (_ BitVec 64) V!31377 (_ BitVec 32) Int) Unit!31386)

(assert (=> b!927754 (= lt!418251 (lemmaListMapApplyFromThenApplyFromZero!93 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927755 () Bool)

(declare-fun res!624857 () Bool)

(assert (=> b!927755 (=> (not res!624857) (not e!520859))))

(assert (=> b!927755 (= res!624857 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18797))))

(declare-fun mapIsEmpty!31470 () Bool)

(assert (=> mapIsEmpty!31470 mapRes!31470))

(declare-fun b!927756 () Bool)

(declare-fun e!520861 () Bool)

(assert (=> b!927756 (= e!520861 tp_is_empty!19809)))

(declare-fun b!927757 () Bool)

(declare-fun res!624864 () Bool)

(assert (=> b!927757 (=> (not res!624864) (not e!520859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55578 (_ BitVec 32)) Bool)

(assert (=> b!927757 (= res!624864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927758 () Bool)

(declare-fun e!520860 () Bool)

(assert (=> b!927758 (= e!520864 e!520860)))

(declare-fun res!624865 () Bool)

(assert (=> b!927758 (=> (not res!624865) (not e!520860))))

(assert (=> b!927758 (= res!624865 (and (= lt!418261 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927758 (= lt!418261 (apply!693 lt!418255 k0!1099))))

(declare-fun b!927759 () Bool)

(declare-fun e!520863 () Bool)

(assert (=> b!927759 (= e!520860 e!520863)))

(declare-fun res!624859 () Bool)

(assert (=> b!927759 (=> (not res!624859) (not e!520863))))

(assert (=> b!927759 (= res!624859 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27193 _keys!1487)))))

(declare-fun lt!418262 () Unit!31386)

(assert (=> b!927759 (= lt!418262 e!520855)))

(declare-fun c!96914 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927759 (= c!96914 (validKeyInArray!0 k0!1099))))

(declare-fun b!927760 () Bool)

(declare-fun res!624861 () Bool)

(assert (=> b!927760 (=> (not res!624861) (not e!520859))))

(assert (=> b!927760 (= res!624861 (and (= (size!27194 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27193 _keys!1487) (size!27194 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!624863 () Bool)

(assert (=> start!79088 (=> (not res!624863) (not e!520859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79088 (= res!624863 (validMask!0 mask!1881))))

(assert (=> start!79088 e!520859))

(assert (=> start!79088 true))

(assert (=> start!79088 tp_is_empty!19809))

(declare-fun e!520852 () Bool)

(declare-fun array_inv!20816 (array!55580) Bool)

(assert (=> start!79088 (and (array_inv!20816 _values!1231) e!520852)))

(assert (=> start!79088 tp!60344))

(declare-fun array_inv!20817 (array!55578) Bool)

(assert (=> start!79088 (array_inv!20817 _keys!1487)))

(declare-fun b!927761 () Bool)

(declare-fun res!624862 () Bool)

(assert (=> b!927761 (=> (not res!624862) (not e!520853))))

(declare-fun lt!418258 () ListLongMap!11695)

(assert (=> b!927761 (= res!624862 (= (apply!693 lt!418258 k0!1099) v!791))))

(declare-fun b!927762 () Bool)

(assert (=> b!927762 (= e!520852 (and e!520861 mapRes!31470))))

(declare-fun condMapEmpty!31470 () Bool)

(declare-fun mapDefault!31470 () ValueCell!9423)

(assert (=> b!927762 (= condMapEmpty!31470 (= (arr!26735 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9423)) mapDefault!31470)))))

(declare-fun b!927763 () Bool)

(assert (=> b!927763 (= e!520855 e!520858)))

(assert (=> b!927763 (= lt!418259 (select (arr!26734 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96913 () Bool)

(assert (=> b!927763 (= c!96913 (validKeyInArray!0 lt!418259))))

(declare-fun b!927764 () Bool)

(declare-fun arrayContainsKey!0 (array!55578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927764 (= e!520854 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927765 () Bool)

(assert (=> b!927765 (= e!520863 e!520853)))

(declare-fun res!624858 () Bool)

(assert (=> b!927765 (=> (not res!624858) (not e!520853))))

(assert (=> b!927765 (= res!624858 (contains!4921 lt!418258 k0!1099))))

(assert (=> b!927765 (= lt!418258 (getCurrentListMap!3112 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927766 () Bool)

(assert (=> b!927766 (= e!520856 (= (apply!693 lt!418250 k0!1099) v!791))))

(assert (= (and start!79088 res!624863) b!927760))

(assert (= (and b!927760 res!624861) b!927757))

(assert (= (and b!927757 res!624864) b!927755))

(assert (= (and b!927755 res!624857) b!927748))

(assert (= (and b!927748 res!624855) b!927750))

(assert (= (and b!927750 res!624856) b!927758))

(assert (= (and b!927758 res!624865) b!927759))

(assert (= (and b!927759 c!96914) b!927763))

(assert (= (and b!927759 (not c!96914)) b!927749))

(assert (= (and b!927763 c!96913) b!927752))

(assert (= (and b!927763 (not c!96913)) b!927751))

(assert (= (and b!927752 c!96915) b!927764))

(assert (= (and b!927752 (not c!96915)) b!927747))

(assert (= (and b!927759 res!624859) b!927765))

(assert (= (and b!927765 res!624858) b!927761))

(assert (= (and b!927761 res!624862) b!927754))

(assert (= (and b!927754 res!624860) b!927766))

(assert (= (and b!927762 condMapEmpty!31470) mapIsEmpty!31470))

(assert (= (and b!927762 (not condMapEmpty!31470)) mapNonEmpty!31470))

(get-info :version)

(assert (= (and mapNonEmpty!31470 ((_ is ValueCellFull!9423) mapValue!31470)) b!927753))

(assert (= (and b!927762 ((_ is ValueCellFull!9423) mapDefault!31470)) b!927756))

(assert (= start!79088 b!927762))

(declare-fun b_lambda!13803 () Bool)

(assert (=> (not b_lambda!13803) (not b!927752)))

(declare-fun t!26829 () Bool)

(declare-fun tb!5881 () Bool)

(assert (=> (and start!79088 (= defaultEntry!1235 defaultEntry!1235) t!26829) tb!5881))

(declare-fun result!11585 () Bool)

(assert (=> tb!5881 (= result!11585 tp_is_empty!19809)))

(assert (=> b!927752 t!26829))

(declare-fun b_and!28341 () Bool)

(assert (= b_and!28339 (and (=> t!26829 result!11585) b_and!28341)))

(declare-fun m!862465 () Bool)

(assert (=> b!927759 m!862465))

(declare-fun m!862467 () Bool)

(assert (=> b!927763 m!862467))

(declare-fun m!862469 () Bool)

(assert (=> b!927763 m!862469))

(declare-fun m!862471 () Bool)

(assert (=> b!927752 m!862471))

(declare-fun m!862473 () Bool)

(assert (=> b!927752 m!862473))

(declare-fun m!862475 () Bool)

(assert (=> b!927752 m!862475))

(assert (=> b!927752 m!862473))

(declare-fun m!862477 () Bool)

(assert (=> b!927752 m!862477))

(declare-fun m!862479 () Bool)

(assert (=> b!927752 m!862479))

(declare-fun m!862481 () Bool)

(assert (=> b!927752 m!862481))

(declare-fun m!862483 () Bool)

(assert (=> b!927752 m!862483))

(declare-fun m!862485 () Bool)

(assert (=> b!927752 m!862485))

(declare-fun m!862487 () Bool)

(assert (=> b!927752 m!862487))

(declare-fun m!862489 () Bool)

(assert (=> b!927752 m!862489))

(declare-fun m!862491 () Bool)

(assert (=> b!927752 m!862491))

(declare-fun m!862493 () Bool)

(assert (=> b!927752 m!862493))

(assert (=> b!927752 m!862477))

(declare-fun m!862495 () Bool)

(assert (=> b!927752 m!862495))

(assert (=> b!927752 m!862487))

(declare-fun m!862497 () Bool)

(assert (=> b!927752 m!862497))

(declare-fun m!862499 () Bool)

(assert (=> b!927752 m!862499))

(declare-fun m!862501 () Bool)

(assert (=> b!927752 m!862501))

(declare-fun m!862503 () Bool)

(assert (=> b!927754 m!862503))

(declare-fun m!862505 () Bool)

(assert (=> b!927754 m!862505))

(declare-fun m!862507 () Bool)

(assert (=> b!927754 m!862507))

(declare-fun m!862509 () Bool)

(assert (=> b!927750 m!862509))

(declare-fun m!862511 () Bool)

(assert (=> b!927750 m!862511))

(declare-fun m!862513 () Bool)

(assert (=> b!927765 m!862513))

(assert (=> b!927765 m!862481))

(declare-fun m!862515 () Bool)

(assert (=> b!927761 m!862515))

(declare-fun m!862517 () Bool)

(assert (=> b!927755 m!862517))

(declare-fun m!862519 () Bool)

(assert (=> b!927766 m!862519))

(declare-fun m!862521 () Bool)

(assert (=> mapNonEmpty!31470 m!862521))

(declare-fun m!862523 () Bool)

(assert (=> start!79088 m!862523))

(declare-fun m!862525 () Bool)

(assert (=> start!79088 m!862525))

(declare-fun m!862527 () Bool)

(assert (=> start!79088 m!862527))

(declare-fun m!862529 () Bool)

(assert (=> b!927764 m!862529))

(declare-fun m!862531 () Bool)

(assert (=> b!927758 m!862531))

(declare-fun m!862533 () Bool)

(assert (=> b!927757 m!862533))

(check-sat (not b!927759) (not b!927764) (not b!927763) (not b_lambda!13803) (not b!927755) (not b!927757) b_and!28341 (not start!79088) (not mapNonEmpty!31470) (not b!927752) (not b!927761) (not b!927765) (not b!927754) (not b!927750) tp_is_empty!19809 (not b!927766) (not b!927758) (not b_next!17301))
(check-sat b_and!28341 (not b_next!17301))
