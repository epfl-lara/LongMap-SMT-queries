; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79832 () Bool)

(assert start!79832)

(declare-fun b_free!17713 () Bool)

(declare-fun b_next!17713 () Bool)

(assert (=> start!79832 (= b_free!17713 (not b_next!17713))))

(declare-fun tp!61596 () Bool)

(declare-fun b_and!29027 () Bool)

(assert (=> start!79832 (= tp!61596 b_and!29027)))

(declare-fun b!937691 () Bool)

(declare-fun res!631028 () Bool)

(declare-fun e!526606 () Bool)

(assert (=> b!937691 (=> (not res!631028) (not e!526606))))

(declare-datatypes ((array!56435 0))(
  ( (array!56436 (arr!27153 (Array (_ BitVec 32) (_ BitVec 64))) (size!27613 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56435)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31927 0))(
  ( (V!31928 (val!10161 Int)) )
))
(declare-datatypes ((ValueCell!9629 0))(
  ( (ValueCellFull!9629 (v!12683 V!31927)) (EmptyCell!9629) )
))
(declare-datatypes ((array!56437 0))(
  ( (array!56438 (arr!27154 (Array (_ BitVec 32) ValueCell!9629)) (size!27614 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56437)

(assert (=> b!937691 (= res!631028 (and (= (size!27614 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27613 _keys!1487) (size!27614 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937692 () Bool)

(declare-fun e!526608 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!937692 (= e!526608 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937693 () Bool)

(declare-fun res!631023 () Bool)

(assert (=> b!937693 (=> (not res!631023) (not e!526606))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937693 (= res!631023 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487))))))

(declare-fun b!937694 () Bool)

(declare-fun arrayContainsKey!0 (array!56435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937694 (= e!526608 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937695 () Bool)

(declare-fun e!526602 () Bool)

(declare-fun e!526607 () Bool)

(declare-fun mapRes!32103 () Bool)

(assert (=> b!937695 (= e!526602 (and e!526607 mapRes!32103))))

(declare-fun condMapEmpty!32103 () Bool)

(declare-fun mapDefault!32103 () ValueCell!9629)

(assert (=> b!937695 (= condMapEmpty!32103 (= (arr!27154 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9629)) mapDefault!32103)))))

(declare-fun b!937696 () Bool)

(declare-datatypes ((Unit!31594 0))(
  ( (Unit!31595) )
))
(declare-fun e!526601 () Unit!31594)

(declare-fun e!526605 () Unit!31594)

(assert (=> b!937696 (= e!526601 e!526605)))

(declare-fun lt!422858 () (_ BitVec 64))

(assert (=> b!937696 (= lt!422858 (select (arr!27153 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97741 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937696 (= c!97741 (validKeyInArray!0 lt!422858))))

(declare-fun res!631029 () Bool)

(assert (=> start!79832 (=> (not res!631029) (not e!526606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79832 (= res!631029 (validMask!0 mask!1881))))

(assert (=> start!79832 e!526606))

(assert (=> start!79832 true))

(declare-fun tp_is_empty!20221 () Bool)

(assert (=> start!79832 tp_is_empty!20221))

(declare-fun array_inv!21206 (array!56437) Bool)

(assert (=> start!79832 (and (array_inv!21206 _values!1231) e!526602)))

(assert (=> start!79832 tp!61596))

(declare-fun array_inv!21207 (array!56435) Bool)

(assert (=> start!79832 (array_inv!21207 _keys!1487)))

(declare-fun b!937697 () Bool)

(declare-fun e!526600 () Bool)

(assert (=> b!937697 (= e!526600 tp_is_empty!20221)))

(declare-fun mapIsEmpty!32103 () Bool)

(assert (=> mapIsEmpty!32103 mapRes!32103))

(declare-fun b!937698 () Bool)

(declare-datatypes ((tuple2!13330 0))(
  ( (tuple2!13331 (_1!6676 (_ BitVec 64)) (_2!6676 V!31927)) )
))
(declare-datatypes ((List!19112 0))(
  ( (Nil!19109) (Cons!19108 (h!20260 tuple2!13330) (t!27361 List!19112)) )
))
(declare-datatypes ((ListLongMap!12029 0))(
  ( (ListLongMap!12030 (toList!6030 List!19112)) )
))
(declare-fun lt!422865 () ListLongMap!12029)

(declare-fun lt!422861 () V!31927)

(declare-fun apply!848 (ListLongMap!12029 (_ BitVec 64)) V!31927)

(assert (=> b!937698 (= (apply!848 lt!422865 k0!1099) lt!422861)))

(declare-fun lt!422857 () V!31927)

(declare-fun lt!422860 () ListLongMap!12029)

(declare-fun lt!422868 () Unit!31594)

(declare-fun addApplyDifferent!426 (ListLongMap!12029 (_ BitVec 64) V!31927 (_ BitVec 64)) Unit!31594)

(assert (=> b!937698 (= lt!422868 (addApplyDifferent!426 lt!422860 lt!422858 lt!422857 k0!1099))))

(assert (=> b!937698 (not (= lt!422858 k0!1099))))

(declare-fun lt!422859 () Unit!31594)

(declare-datatypes ((List!19113 0))(
  ( (Nil!19110) (Cons!19109 (h!20261 (_ BitVec 64)) (t!27362 List!19113)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56435 (_ BitVec 64) (_ BitVec 32) List!19113) Unit!31594)

(assert (=> b!937698 (= lt!422859 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19110))))

(assert (=> b!937698 e!526608))

(declare-fun c!97743 () Bool)

(assert (=> b!937698 (= c!97743 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422864 () Unit!31594)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31927)

(declare-fun minValue!1173 () V!31927)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!296 (array!56435 array!56437 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 64) (_ BitVec 32) Int) Unit!31594)

(assert (=> b!937698 (= lt!422864 (lemmaListMapContainsThenArrayContainsFrom!296 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56435 (_ BitVec 32) List!19113) Bool)

(assert (=> b!937698 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19110)))

(declare-fun lt!422863 () Unit!31594)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56435 (_ BitVec 32) (_ BitVec 32)) Unit!31594)

(assert (=> b!937698 (= lt!422863 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5102 (ListLongMap!12029 (_ BitVec 64)) Bool)

(assert (=> b!937698 (contains!5102 lt!422865 k0!1099)))

(declare-fun lt!422867 () tuple2!13330)

(declare-fun +!2842 (ListLongMap!12029 tuple2!13330) ListLongMap!12029)

(assert (=> b!937698 (= lt!422865 (+!2842 lt!422860 lt!422867))))

(declare-fun lt!422862 () Unit!31594)

(declare-fun addStillContains!545 (ListLongMap!12029 (_ BitVec 64) V!31927 (_ BitVec 64)) Unit!31594)

(assert (=> b!937698 (= lt!422862 (addStillContains!545 lt!422860 lt!422858 lt!422857 k0!1099))))

(declare-fun getCurrentListMap!3267 (array!56435 array!56437 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 32) Int) ListLongMap!12029)

(assert (=> b!937698 (= (getCurrentListMap!3267 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2842 (getCurrentListMap!3267 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422867))))

(assert (=> b!937698 (= lt!422867 (tuple2!13331 lt!422858 lt!422857))))

(declare-fun get!14330 (ValueCell!9629 V!31927) V!31927)

(declare-fun dynLambda!1639 (Int (_ BitVec 64)) V!31927)

(assert (=> b!937698 (= lt!422857 (get!14330 (select (arr!27154 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1639 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422866 () Unit!31594)

(declare-fun lemmaListMapRecursiveValidKeyArray!222 (array!56435 array!56437 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 32) Int) Unit!31594)

(assert (=> b!937698 (= lt!422866 (lemmaListMapRecursiveValidKeyArray!222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937698 (= e!526605 lt!422868)))

(declare-fun b!937699 () Bool)

(declare-fun Unit!31596 () Unit!31594)

(assert (=> b!937699 (= e!526601 Unit!31596)))

(declare-fun b!937700 () Bool)

(declare-fun res!631025 () Bool)

(assert (=> b!937700 (=> (not res!631025) (not e!526606))))

(assert (=> b!937700 (= res!631025 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19110))))

(declare-fun b!937701 () Bool)

(assert (=> b!937701 (= e!526607 tp_is_empty!20221)))

(declare-fun mapNonEmpty!32103 () Bool)

(declare-fun tp!61595 () Bool)

(assert (=> mapNonEmpty!32103 (= mapRes!32103 (and tp!61595 e!526600))))

(declare-fun mapValue!32103 () ValueCell!9629)

(declare-fun mapRest!32103 () (Array (_ BitVec 32) ValueCell!9629))

(declare-fun mapKey!32103 () (_ BitVec 32))

(assert (=> mapNonEmpty!32103 (= (arr!27154 _values!1231) (store mapRest!32103 mapKey!32103 mapValue!32103))))

(declare-fun b!937702 () Bool)

(declare-fun e!526599 () Bool)

(assert (=> b!937702 (= e!526599 false)))

(declare-fun lt!422856 () Unit!31594)

(assert (=> b!937702 (= lt!422856 e!526601)))

(declare-fun c!97742 () Bool)

(assert (=> b!937702 (= c!97742 (validKeyInArray!0 k0!1099))))

(declare-fun b!937703 () Bool)

(declare-fun e!526603 () Bool)

(assert (=> b!937703 (= e!526603 e!526599)))

(declare-fun res!631026 () Bool)

(assert (=> b!937703 (=> (not res!631026) (not e!526599))))

(declare-fun v!791 () V!31927)

(assert (=> b!937703 (= res!631026 (and (= lt!422861 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937703 (= lt!422861 (apply!848 lt!422860 k0!1099))))

(declare-fun b!937704 () Bool)

(declare-fun Unit!31597 () Unit!31594)

(assert (=> b!937704 (= e!526605 Unit!31597)))

(declare-fun b!937705 () Bool)

(declare-fun res!631027 () Bool)

(assert (=> b!937705 (=> (not res!631027) (not e!526606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56435 (_ BitVec 32)) Bool)

(assert (=> b!937705 (= res!631027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937706 () Bool)

(assert (=> b!937706 (= e!526606 e!526603)))

(declare-fun res!631024 () Bool)

(assert (=> b!937706 (=> (not res!631024) (not e!526603))))

(assert (=> b!937706 (= res!631024 (contains!5102 lt!422860 k0!1099))))

(assert (=> b!937706 (= lt!422860 (getCurrentListMap!3267 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79832 res!631029) b!937691))

(assert (= (and b!937691 res!631028) b!937705))

(assert (= (and b!937705 res!631027) b!937700))

(assert (= (and b!937700 res!631025) b!937693))

(assert (= (and b!937693 res!631023) b!937706))

(assert (= (and b!937706 res!631024) b!937703))

(assert (= (and b!937703 res!631026) b!937702))

(assert (= (and b!937702 c!97742) b!937696))

(assert (= (and b!937702 (not c!97742)) b!937699))

(assert (= (and b!937696 c!97741) b!937698))

(assert (= (and b!937696 (not c!97741)) b!937704))

(assert (= (and b!937698 c!97743) b!937694))

(assert (= (and b!937698 (not c!97743)) b!937692))

(assert (= (and b!937695 condMapEmpty!32103) mapIsEmpty!32103))

(assert (= (and b!937695 (not condMapEmpty!32103)) mapNonEmpty!32103))

(get-info :version)

(assert (= (and mapNonEmpty!32103 ((_ is ValueCellFull!9629) mapValue!32103)) b!937697))

(assert (= (and b!937695 ((_ is ValueCellFull!9629) mapDefault!32103)) b!937701))

(assert (= start!79832 b!937695))

(declare-fun b_lambda!14133 () Bool)

(assert (=> (not b_lambda!14133) (not b!937698)))

(declare-fun t!27360 () Bool)

(declare-fun tb!6099 () Bool)

(assert (=> (and start!79832 (= defaultEntry!1235 defaultEntry!1235) t!27360) tb!6099))

(declare-fun result!12039 () Bool)

(assert (=> tb!6099 (= result!12039 tp_is_empty!20221)))

(assert (=> b!937698 t!27360))

(declare-fun b_and!29029 () Bool)

(assert (= b_and!29027 (and (=> t!27360 result!12039) b_and!29029)))

(declare-fun m!872741 () Bool)

(assert (=> mapNonEmpty!32103 m!872741))

(declare-fun m!872743 () Bool)

(assert (=> b!937702 m!872743))

(declare-fun m!872745 () Bool)

(assert (=> b!937700 m!872745))

(declare-fun m!872747 () Bool)

(assert (=> b!937705 m!872747))

(declare-fun m!872749 () Bool)

(assert (=> b!937703 m!872749))

(declare-fun m!872751 () Bool)

(assert (=> b!937696 m!872751))

(declare-fun m!872753 () Bool)

(assert (=> b!937696 m!872753))

(declare-fun m!872755 () Bool)

(assert (=> b!937706 m!872755))

(declare-fun m!872757 () Bool)

(assert (=> b!937706 m!872757))

(declare-fun m!872759 () Bool)

(assert (=> b!937694 m!872759))

(declare-fun m!872761 () Bool)

(assert (=> start!79832 m!872761))

(declare-fun m!872763 () Bool)

(assert (=> start!79832 m!872763))

(declare-fun m!872765 () Bool)

(assert (=> start!79832 m!872765))

(declare-fun m!872767 () Bool)

(assert (=> b!937698 m!872767))

(declare-fun m!872769 () Bool)

(assert (=> b!937698 m!872769))

(declare-fun m!872771 () Bool)

(assert (=> b!937698 m!872771))

(declare-fun m!872773 () Bool)

(assert (=> b!937698 m!872773))

(declare-fun m!872775 () Bool)

(assert (=> b!937698 m!872775))

(declare-fun m!872777 () Bool)

(assert (=> b!937698 m!872777))

(declare-fun m!872779 () Bool)

(assert (=> b!937698 m!872779))

(declare-fun m!872781 () Bool)

(assert (=> b!937698 m!872781))

(declare-fun m!872783 () Bool)

(assert (=> b!937698 m!872783))

(declare-fun m!872785 () Bool)

(assert (=> b!937698 m!872785))

(declare-fun m!872787 () Bool)

(assert (=> b!937698 m!872787))

(assert (=> b!937698 m!872773))

(assert (=> b!937698 m!872775))

(declare-fun m!872789 () Bool)

(assert (=> b!937698 m!872789))

(declare-fun m!872791 () Bool)

(assert (=> b!937698 m!872791))

(declare-fun m!872793 () Bool)

(assert (=> b!937698 m!872793))

(declare-fun m!872795 () Bool)

(assert (=> b!937698 m!872795))

(assert (=> b!937698 m!872791))

(declare-fun m!872797 () Bool)

(assert (=> b!937698 m!872797))

(check-sat (not start!79832) (not b!937703) (not b_lambda!14133) b_and!29029 (not b!937698) (not b!937702) (not b!937696) (not b!937706) tp_is_empty!20221 (not b!937705) (not b_next!17713) (not mapNonEmpty!32103) (not b!937694) (not b!937700))
(check-sat b_and!29029 (not b_next!17713))
