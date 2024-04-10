; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79636 () Bool)

(assert start!79636)

(declare-fun b_free!17685 () Bool)

(declare-fun b_next!17685 () Bool)

(assert (=> start!79636 (= b_free!17685 (not b_next!17685))))

(declare-fun tp!61511 () Bool)

(declare-fun b_and!28961 () Bool)

(assert (=> start!79636 (= tp!61511 b_and!28961)))

(declare-fun b!936101 () Bool)

(declare-fun e!525628 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31889 0))(
  ( (V!31890 (val!10147 Int)) )
))
(declare-datatypes ((ValueCell!9615 0))(
  ( (ValueCellFull!9615 (v!12672 V!31889)) (EmptyCell!9615) )
))
(declare-datatypes ((array!56328 0))(
  ( (array!56329 (arr!27104 (Array (_ BitVec 32) ValueCell!9615)) (size!27563 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56328)

(assert (=> b!936101 (= e!525628 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27563 _values!1231))))))

(declare-fun lt!422005 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!936101 (not (= lt!422005 k0!1099))))

(declare-datatypes ((Unit!31573 0))(
  ( (Unit!31574) )
))
(declare-fun lt!422009 () Unit!31573)

(declare-datatypes ((array!56330 0))(
  ( (array!56331 (arr!27105 (Array (_ BitVec 32) (_ BitVec 64))) (size!27564 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56330)

(declare-datatypes ((List!19103 0))(
  ( (Nil!19100) (Cons!19099 (h!20245 (_ BitVec 64)) (t!27332 List!19103)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56330 (_ BitVec 64) (_ BitVec 32) List!19103) Unit!31573)

(assert (=> b!936101 (= lt!422009 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19100))))

(declare-fun e!525626 () Bool)

(assert (=> b!936101 e!525626))

(declare-fun c!97359 () Bool)

(assert (=> b!936101 (= c!97359 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!422003 () Unit!31573)

(declare-fun zeroValue!1173 () V!31889)

(declare-fun minValue!1173 () V!31889)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!291 (array!56330 array!56328 (_ BitVec 32) (_ BitVec 32) V!31889 V!31889 (_ BitVec 64) (_ BitVec 32) Int) Unit!31573)

(assert (=> b!936101 (= lt!422003 (lemmaListMapContainsThenArrayContainsFrom!291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56330 (_ BitVec 32) List!19103) Bool)

(assert (=> b!936101 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19100)))

(declare-fun lt!422004 () Unit!31573)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56330 (_ BitVec 32) (_ BitVec 32)) Unit!31573)

(assert (=> b!936101 (= lt!422004 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13322 0))(
  ( (tuple2!13323 (_1!6672 (_ BitVec 64)) (_2!6672 V!31889)) )
))
(declare-datatypes ((List!19104 0))(
  ( (Nil!19101) (Cons!19100 (h!20246 tuple2!13322) (t!27333 List!19104)) )
))
(declare-datatypes ((ListLongMap!12019 0))(
  ( (ListLongMap!12020 (toList!6025 List!19104)) )
))
(declare-fun lt!422001 () ListLongMap!12019)

(declare-fun lt!422007 () tuple2!13322)

(declare-fun contains!5086 (ListLongMap!12019 (_ BitVec 64)) Bool)

(declare-fun +!2819 (ListLongMap!12019 tuple2!13322) ListLongMap!12019)

(assert (=> b!936101 (contains!5086 (+!2819 lt!422001 lt!422007) k0!1099)))

(declare-fun lt!422002 () Unit!31573)

(declare-fun lt!422006 () V!31889)

(declare-fun addStillContains!538 (ListLongMap!12019 (_ BitVec 64) V!31889 (_ BitVec 64)) Unit!31573)

(assert (=> b!936101 (= lt!422002 (addStillContains!538 lt!422001 lt!422005 lt!422006 k0!1099))))

(declare-fun getCurrentListMap!3262 (array!56330 array!56328 (_ BitVec 32) (_ BitVec 32) V!31889 V!31889 (_ BitVec 32) Int) ListLongMap!12019)

(assert (=> b!936101 (= (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2819 (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422007))))

(assert (=> b!936101 (= lt!422007 (tuple2!13323 lt!422005 lt!422006))))

(declare-fun get!14285 (ValueCell!9615 V!31889) V!31889)

(declare-fun dynLambda!1608 (Int (_ BitVec 64)) V!31889)

(assert (=> b!936101 (= lt!422006 (get!14285 (select (arr!27104 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1608 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422008 () Unit!31573)

(declare-fun lemmaListMapRecursiveValidKeyArray!209 (array!56330 array!56328 (_ BitVec 32) (_ BitVec 32) V!31889 V!31889 (_ BitVec 32) Int) Unit!31573)

(assert (=> b!936101 (= lt!422008 (lemmaListMapRecursiveValidKeyArray!209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936102 () Bool)

(declare-fun res!630346 () Bool)

(declare-fun e!525629 () Bool)

(assert (=> b!936102 (=> (not res!630346) (not e!525629))))

(declare-fun v!791 () V!31889)

(declare-fun apply!827 (ListLongMap!12019 (_ BitVec 64)) V!31889)

(assert (=> b!936102 (= res!630346 (= (apply!827 lt!422001 k0!1099) v!791))))

(declare-fun mapIsEmpty!32061 () Bool)

(declare-fun mapRes!32061 () Bool)

(assert (=> mapIsEmpty!32061 mapRes!32061))

(declare-fun res!630351 () Bool)

(declare-fun e!525624 () Bool)

(assert (=> start!79636 (=> (not res!630351) (not e!525624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79636 (= res!630351 (validMask!0 mask!1881))))

(assert (=> start!79636 e!525624))

(assert (=> start!79636 true))

(declare-fun tp_is_empty!20193 () Bool)

(assert (=> start!79636 tp_is_empty!20193))

(declare-fun e!525625 () Bool)

(declare-fun array_inv!21090 (array!56328) Bool)

(assert (=> start!79636 (and (array_inv!21090 _values!1231) e!525625)))

(assert (=> start!79636 tp!61511))

(declare-fun array_inv!21091 (array!56330) Bool)

(assert (=> start!79636 (array_inv!21091 _keys!1487)))

(declare-fun b!936103 () Bool)

(declare-fun res!630349 () Bool)

(assert (=> b!936103 (=> (not res!630349) (not e!525629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936103 (= res!630349 (validKeyInArray!0 k0!1099))))

(declare-fun b!936104 () Bool)

(declare-fun res!630352 () Bool)

(assert (=> b!936104 (=> (not res!630352) (not e!525624))))

(assert (=> b!936104 (= res!630352 (and (= (size!27563 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27564 _keys!1487) (size!27563 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936105 () Bool)

(declare-fun res!630347 () Bool)

(assert (=> b!936105 (=> (not res!630347) (not e!525624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56330 (_ BitVec 32)) Bool)

(assert (=> b!936105 (= res!630347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936106 () Bool)

(assert (=> b!936106 (= e!525629 e!525628)))

(declare-fun res!630353 () Bool)

(assert (=> b!936106 (=> (not res!630353) (not e!525628))))

(assert (=> b!936106 (= res!630353 (validKeyInArray!0 lt!422005))))

(assert (=> b!936106 (= lt!422005 (select (arr!27105 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936107 () Bool)

(declare-fun arrayContainsKey!0 (array!56330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936107 (= e!525626 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936108 () Bool)

(assert (=> b!936108 (= e!525624 e!525629)))

(declare-fun res!630348 () Bool)

(assert (=> b!936108 (=> (not res!630348) (not e!525629))))

(assert (=> b!936108 (= res!630348 (contains!5086 lt!422001 k0!1099))))

(assert (=> b!936108 (= lt!422001 (getCurrentListMap!3262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936109 () Bool)

(assert (=> b!936109 (= e!525626 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936110 () Bool)

(declare-fun res!630355 () Bool)

(assert (=> b!936110 (=> (not res!630355) (not e!525624))))

(assert (=> b!936110 (= res!630355 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19100))))

(declare-fun b!936111 () Bool)

(declare-fun e!525630 () Bool)

(assert (=> b!936111 (= e!525630 tp_is_empty!20193)))

(declare-fun mapNonEmpty!32061 () Bool)

(declare-fun tp!61510 () Bool)

(assert (=> mapNonEmpty!32061 (= mapRes!32061 (and tp!61510 e!525630))))

(declare-fun mapRest!32061 () (Array (_ BitVec 32) ValueCell!9615))

(declare-fun mapValue!32061 () ValueCell!9615)

(declare-fun mapKey!32061 () (_ BitVec 32))

(assert (=> mapNonEmpty!32061 (= (arr!27104 _values!1231) (store mapRest!32061 mapKey!32061 mapValue!32061))))

(declare-fun b!936112 () Bool)

(declare-fun e!525627 () Bool)

(assert (=> b!936112 (= e!525625 (and e!525627 mapRes!32061))))

(declare-fun condMapEmpty!32061 () Bool)

(declare-fun mapDefault!32061 () ValueCell!9615)

(assert (=> b!936112 (= condMapEmpty!32061 (= (arr!27104 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9615)) mapDefault!32061)))))

(declare-fun b!936113 () Bool)

(assert (=> b!936113 (= e!525627 tp_is_empty!20193)))

(declare-fun b!936114 () Bool)

(declare-fun res!630354 () Bool)

(assert (=> b!936114 (=> (not res!630354) (not e!525629))))

(assert (=> b!936114 (= res!630354 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936115 () Bool)

(declare-fun res!630350 () Bool)

(assert (=> b!936115 (=> (not res!630350) (not e!525624))))

(assert (=> b!936115 (= res!630350 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27564 _keys!1487))))))

(assert (= (and start!79636 res!630351) b!936104))

(assert (= (and b!936104 res!630352) b!936105))

(assert (= (and b!936105 res!630347) b!936110))

(assert (= (and b!936110 res!630355) b!936115))

(assert (= (and b!936115 res!630350) b!936108))

(assert (= (and b!936108 res!630348) b!936102))

(assert (= (and b!936102 res!630346) b!936114))

(assert (= (and b!936114 res!630354) b!936103))

(assert (= (and b!936103 res!630349) b!936106))

(assert (= (and b!936106 res!630353) b!936101))

(assert (= (and b!936101 c!97359) b!936107))

(assert (= (and b!936101 (not c!97359)) b!936109))

(assert (= (and b!936112 condMapEmpty!32061) mapIsEmpty!32061))

(assert (= (and b!936112 (not condMapEmpty!32061)) mapNonEmpty!32061))

(get-info :version)

(assert (= (and mapNonEmpty!32061 ((_ is ValueCellFull!9615) mapValue!32061)) b!936111))

(assert (= (and b!936112 ((_ is ValueCellFull!9615) mapDefault!32061)) b!936113))

(assert (= start!79636 b!936112))

(declare-fun b_lambda!14091 () Bool)

(assert (=> (not b_lambda!14091) (not b!936101)))

(declare-fun t!27331 () Bool)

(declare-fun tb!6079 () Bool)

(assert (=> (and start!79636 (= defaultEntry!1235 defaultEntry!1235) t!27331) tb!6079))

(declare-fun result!11991 () Bool)

(assert (=> tb!6079 (= result!11991 tp_is_empty!20193)))

(assert (=> b!936101 t!27331))

(declare-fun b_and!28963 () Bool)

(assert (= b_and!28961 (and (=> t!27331 result!11991) b_and!28963)))

(declare-fun m!870655 () Bool)

(assert (=> b!936110 m!870655))

(declare-fun m!870657 () Bool)

(assert (=> start!79636 m!870657))

(declare-fun m!870659 () Bool)

(assert (=> start!79636 m!870659))

(declare-fun m!870661 () Bool)

(assert (=> start!79636 m!870661))

(declare-fun m!870663 () Bool)

(assert (=> mapNonEmpty!32061 m!870663))

(declare-fun m!870665 () Bool)

(assert (=> b!936102 m!870665))

(declare-fun m!870667 () Bool)

(assert (=> b!936106 m!870667))

(declare-fun m!870669 () Bool)

(assert (=> b!936106 m!870669))

(declare-fun m!870671 () Bool)

(assert (=> b!936108 m!870671))

(declare-fun m!870673 () Bool)

(assert (=> b!936108 m!870673))

(declare-fun m!870675 () Bool)

(assert (=> b!936101 m!870675))

(declare-fun m!870677 () Bool)

(assert (=> b!936101 m!870677))

(declare-fun m!870679 () Bool)

(assert (=> b!936101 m!870679))

(declare-fun m!870681 () Bool)

(assert (=> b!936101 m!870681))

(declare-fun m!870683 () Bool)

(assert (=> b!936101 m!870683))

(declare-fun m!870685 () Bool)

(assert (=> b!936101 m!870685))

(assert (=> b!936101 m!870679))

(assert (=> b!936101 m!870681))

(declare-fun m!870687 () Bool)

(assert (=> b!936101 m!870687))

(declare-fun m!870689 () Bool)

(assert (=> b!936101 m!870689))

(declare-fun m!870691 () Bool)

(assert (=> b!936101 m!870691))

(assert (=> b!936101 m!870683))

(declare-fun m!870693 () Bool)

(assert (=> b!936101 m!870693))

(declare-fun m!870695 () Bool)

(assert (=> b!936101 m!870695))

(declare-fun m!870697 () Bool)

(assert (=> b!936101 m!870697))

(declare-fun m!870699 () Bool)

(assert (=> b!936101 m!870699))

(assert (=> b!936101 m!870697))

(declare-fun m!870701 () Bool)

(assert (=> b!936101 m!870701))

(declare-fun m!870703 () Bool)

(assert (=> b!936103 m!870703))

(declare-fun m!870705 () Bool)

(assert (=> b!936107 m!870705))

(declare-fun m!870707 () Bool)

(assert (=> b!936105 m!870707))

(check-sat (not b_next!17685) (not mapNonEmpty!32061) (not start!79636) (not b!936105) tp_is_empty!20193 b_and!28963 (not b!936101) (not b!936106) (not b!936103) (not b_lambda!14091) (not b!936108) (not b!936110) (not b!936107) (not b!936102))
(check-sat b_and!28963 (not b_next!17685))
