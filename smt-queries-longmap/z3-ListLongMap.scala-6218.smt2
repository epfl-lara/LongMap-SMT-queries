; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79456 () Bool)

(assert start!79456)

(declare-fun b_free!17629 () Bool)

(declare-fun b_next!17629 () Bool)

(assert (=> start!79456 (= b_free!17629 (not b_next!17629))))

(declare-fun tp!61335 () Bool)

(declare-fun b_and!28799 () Bool)

(assert (=> start!79456 (= tp!61335 b_and!28799)))

(declare-fun b!933850 () Bool)

(declare-fun res!629009 () Bool)

(declare-fun e!524357 () Bool)

(assert (=> b!933850 (=> (not res!629009) (not e!524357))))

(declare-datatypes ((array!56177 0))(
  ( (array!56178 (arr!27032 (Array (_ BitVec 32) (_ BitVec 64))) (size!27493 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56177)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31815 0))(
  ( (V!31816 (val!10119 Int)) )
))
(declare-datatypes ((ValueCell!9587 0))(
  ( (ValueCellFull!9587 (v!12638 V!31815)) (EmptyCell!9587) )
))
(declare-datatypes ((array!56179 0))(
  ( (array!56180 (arr!27033 (Array (_ BitVec 32) ValueCell!9587)) (size!27494 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56179)

(assert (=> b!933850 (= res!629009 (and (= (size!27494 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27493 _keys!1487) (size!27494 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933851 () Bool)

(declare-fun res!629010 () Bool)

(declare-fun e!524360 () Bool)

(assert (=> b!933851 (=> (not res!629010) (not e!524360))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933851 (= res!629010 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933852 () Bool)

(declare-fun e!524355 () Bool)

(assert (=> b!933852 (= e!524355 (not true))))

(declare-fun e!524356 () Bool)

(assert (=> b!933852 e!524356))

(declare-fun c!97069 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!933852 (= c!97069 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31431 0))(
  ( (Unit!31432) )
))
(declare-fun lt!420566 () Unit!31431)

(declare-fun zeroValue!1173 () V!31815)

(declare-fun minValue!1173 () V!31815)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!275 (array!56177 array!56179 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 64) (_ BitVec 32) Int) Unit!31431)

(assert (=> b!933852 (= lt!420566 (lemmaListMapContainsThenArrayContainsFrom!275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19077 0))(
  ( (Nil!19074) (Cons!19073 (h!20219 (_ BitVec 64)) (t!27241 List!19077)) )
))
(declare-fun arrayNoDuplicates!0 (array!56177 (_ BitVec 32) List!19077) Bool)

(assert (=> b!933852 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19074)))

(declare-fun lt!420565 () Unit!31431)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56177 (_ BitVec 32) (_ BitVec 32)) Unit!31431)

(assert (=> b!933852 (= lt!420565 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13328 0))(
  ( (tuple2!13329 (_1!6675 (_ BitVec 64)) (_2!6675 V!31815)) )
))
(declare-datatypes ((List!19078 0))(
  ( (Nil!19075) (Cons!19074 (h!20220 tuple2!13328) (t!27242 List!19078)) )
))
(declare-datatypes ((ListLongMap!12015 0))(
  ( (ListLongMap!12016 (toList!6023 List!19078)) )
))
(declare-fun lt!420564 () ListLongMap!12015)

(declare-fun lt!420570 () tuple2!13328)

(declare-fun contains!5021 (ListLongMap!12015 (_ BitVec 64)) Bool)

(declare-fun +!2828 (ListLongMap!12015 tuple2!13328) ListLongMap!12015)

(assert (=> b!933852 (contains!5021 (+!2828 lt!420564 lt!420570) k0!1099)))

(declare-fun lt!420571 () (_ BitVec 64))

(declare-fun lt!420569 () V!31815)

(declare-fun lt!420567 () Unit!31431)

(declare-fun addStillContains!517 (ListLongMap!12015 (_ BitVec 64) V!31815 (_ BitVec 64)) Unit!31431)

(assert (=> b!933852 (= lt!420567 (addStillContains!517 lt!420564 lt!420571 lt!420569 k0!1099))))

(declare-fun getCurrentListMap!3194 (array!56177 array!56179 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) ListLongMap!12015)

(assert (=> b!933852 (= (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2828 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420570))))

(assert (=> b!933852 (= lt!420570 (tuple2!13329 lt!420571 lt!420569))))

(declare-fun get!14239 (ValueCell!9587 V!31815) V!31815)

(declare-fun dynLambda!1584 (Int (_ BitVec 64)) V!31815)

(assert (=> b!933852 (= lt!420569 (get!14239 (select (arr!27033 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1584 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420568 () Unit!31431)

(declare-fun lemmaListMapRecursiveValidKeyArray!192 (array!56177 array!56179 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) Unit!31431)

(assert (=> b!933852 (= lt!420568 (lemmaListMapRecursiveValidKeyArray!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933853 () Bool)

(declare-fun e!524353 () Bool)

(declare-fun tp_is_empty!20137 () Bool)

(assert (=> b!933853 (= e!524353 tp_is_empty!20137)))

(declare-fun b!933854 () Bool)

(declare-fun res!629014 () Bool)

(assert (=> b!933854 (=> (not res!629014) (not e!524360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933854 (= res!629014 (validKeyInArray!0 k0!1099))))

(declare-fun b!933855 () Bool)

(declare-fun res!629018 () Bool)

(assert (=> b!933855 (=> (not res!629018) (not e!524357))))

(assert (=> b!933855 (= res!629018 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27493 _keys!1487))))))

(declare-fun res!629013 () Bool)

(assert (=> start!79456 (=> (not res!629013) (not e!524357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79456 (= res!629013 (validMask!0 mask!1881))))

(assert (=> start!79456 e!524357))

(assert (=> start!79456 true))

(assert (=> start!79456 tp_is_empty!20137))

(declare-fun e!524359 () Bool)

(declare-fun array_inv!21104 (array!56179) Bool)

(assert (=> start!79456 (and (array_inv!21104 _values!1231) e!524359)))

(assert (=> start!79456 tp!61335))

(declare-fun array_inv!21105 (array!56177) Bool)

(assert (=> start!79456 (array_inv!21105 _keys!1487)))

(declare-fun b!933856 () Bool)

(declare-fun e!524354 () Bool)

(assert (=> b!933856 (= e!524354 tp_is_empty!20137)))

(declare-fun b!933857 () Bool)

(assert (=> b!933857 (= e!524357 e!524360)))

(declare-fun res!629015 () Bool)

(assert (=> b!933857 (=> (not res!629015) (not e!524360))))

(assert (=> b!933857 (= res!629015 (contains!5021 lt!420564 k0!1099))))

(assert (=> b!933857 (= lt!420564 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933858 () Bool)

(declare-fun arrayContainsKey!0 (array!56177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!933858 (= e!524356 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31968 () Bool)

(declare-fun mapRes!31968 () Bool)

(assert (=> mapIsEmpty!31968 mapRes!31968))

(declare-fun b!933859 () Bool)

(assert (=> b!933859 (= e!524359 (and e!524354 mapRes!31968))))

(declare-fun condMapEmpty!31968 () Bool)

(declare-fun mapDefault!31968 () ValueCell!9587)

(assert (=> b!933859 (= condMapEmpty!31968 (= (arr!27033 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9587)) mapDefault!31968)))))

(declare-fun b!933860 () Bool)

(assert (=> b!933860 (= e!524360 e!524355)))

(declare-fun res!629012 () Bool)

(assert (=> b!933860 (=> (not res!629012) (not e!524355))))

(assert (=> b!933860 (= res!629012 (validKeyInArray!0 lt!420571))))

(assert (=> b!933860 (= lt!420571 (select (arr!27032 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933861 () Bool)

(declare-fun res!629017 () Bool)

(assert (=> b!933861 (=> (not res!629017) (not e!524357))))

(assert (=> b!933861 (= res!629017 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19074))))

(declare-fun mapNonEmpty!31968 () Bool)

(declare-fun tp!61334 () Bool)

(assert (=> mapNonEmpty!31968 (= mapRes!31968 (and tp!61334 e!524353))))

(declare-fun mapRest!31968 () (Array (_ BitVec 32) ValueCell!9587))

(declare-fun mapKey!31968 () (_ BitVec 32))

(declare-fun mapValue!31968 () ValueCell!9587)

(assert (=> mapNonEmpty!31968 (= (arr!27033 _values!1231) (store mapRest!31968 mapKey!31968 mapValue!31968))))

(declare-fun b!933862 () Bool)

(declare-fun res!629011 () Bool)

(assert (=> b!933862 (=> (not res!629011) (not e!524360))))

(declare-fun v!791 () V!31815)

(declare-fun apply!807 (ListLongMap!12015 (_ BitVec 64)) V!31815)

(assert (=> b!933862 (= res!629011 (= (apply!807 lt!420564 k0!1099) v!791))))

(declare-fun b!933863 () Bool)

(declare-fun res!629016 () Bool)

(assert (=> b!933863 (=> (not res!629016) (not e!524357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56177 (_ BitVec 32)) Bool)

(assert (=> b!933863 (= res!629016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933864 () Bool)

(assert (=> b!933864 (= e!524356 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!79456 res!629013) b!933850))

(assert (= (and b!933850 res!629009) b!933863))

(assert (= (and b!933863 res!629016) b!933861))

(assert (= (and b!933861 res!629017) b!933855))

(assert (= (and b!933855 res!629018) b!933857))

(assert (= (and b!933857 res!629015) b!933862))

(assert (= (and b!933862 res!629011) b!933851))

(assert (= (and b!933851 res!629010) b!933854))

(assert (= (and b!933854 res!629014) b!933860))

(assert (= (and b!933860 res!629012) b!933852))

(assert (= (and b!933852 c!97069) b!933858))

(assert (= (and b!933852 (not c!97069)) b!933864))

(assert (= (and b!933859 condMapEmpty!31968) mapIsEmpty!31968))

(assert (= (and b!933859 (not condMapEmpty!31968)) mapNonEmpty!31968))

(get-info :version)

(assert (= (and mapNonEmpty!31968 ((_ is ValueCellFull!9587) mapValue!31968)) b!933853))

(assert (= (and b!933859 ((_ is ValueCellFull!9587) mapDefault!31968)) b!933856))

(assert (= start!79456 b!933859))

(declare-fun b_lambda!13963 () Bool)

(assert (=> (not b_lambda!13963) (not b!933852)))

(declare-fun t!27240 () Bool)

(declare-fun tb!6015 () Bool)

(assert (=> (and start!79456 (= defaultEntry!1235 defaultEntry!1235) t!27240) tb!6015))

(declare-fun result!11865 () Bool)

(assert (=> tb!6015 (= result!11865 tp_is_empty!20137)))

(assert (=> b!933852 t!27240))

(declare-fun b_and!28801 () Bool)

(assert (= b_and!28799 (and (=> t!27240 result!11865) b_and!28801)))

(declare-fun m!867589 () Bool)

(assert (=> b!933860 m!867589))

(declare-fun m!867591 () Bool)

(assert (=> b!933860 m!867591))

(declare-fun m!867593 () Bool)

(assert (=> b!933862 m!867593))

(declare-fun m!867595 () Bool)

(assert (=> b!933854 m!867595))

(declare-fun m!867597 () Bool)

(assert (=> b!933857 m!867597))

(declare-fun m!867599 () Bool)

(assert (=> b!933857 m!867599))

(declare-fun m!867601 () Bool)

(assert (=> b!933861 m!867601))

(declare-fun m!867603 () Bool)

(assert (=> b!933858 m!867603))

(declare-fun m!867605 () Bool)

(assert (=> b!933852 m!867605))

(declare-fun m!867607 () Bool)

(assert (=> b!933852 m!867607))

(declare-fun m!867609 () Bool)

(assert (=> b!933852 m!867609))

(declare-fun m!867611 () Bool)

(assert (=> b!933852 m!867611))

(declare-fun m!867613 () Bool)

(assert (=> b!933852 m!867613))

(assert (=> b!933852 m!867605))

(declare-fun m!867615 () Bool)

(assert (=> b!933852 m!867615))

(assert (=> b!933852 m!867609))

(declare-fun m!867617 () Bool)

(assert (=> b!933852 m!867617))

(declare-fun m!867619 () Bool)

(assert (=> b!933852 m!867619))

(declare-fun m!867621 () Bool)

(assert (=> b!933852 m!867621))

(declare-fun m!867623 () Bool)

(assert (=> b!933852 m!867623))

(declare-fun m!867625 () Bool)

(assert (=> b!933852 m!867625))

(assert (=> b!933852 m!867617))

(declare-fun m!867627 () Bool)

(assert (=> b!933852 m!867627))

(assert (=> b!933852 m!867611))

(declare-fun m!867629 () Bool)

(assert (=> b!933852 m!867629))

(declare-fun m!867631 () Bool)

(assert (=> start!79456 m!867631))

(declare-fun m!867633 () Bool)

(assert (=> start!79456 m!867633))

(declare-fun m!867635 () Bool)

(assert (=> start!79456 m!867635))

(declare-fun m!867637 () Bool)

(assert (=> b!933863 m!867637))

(declare-fun m!867639 () Bool)

(assert (=> mapNonEmpty!31968 m!867639))

(check-sat (not b!933854) b_and!28801 (not b!933852) (not b!933862) tp_is_empty!20137 (not b!933858) (not b!933857) (not start!79456) (not b!933861) (not mapNonEmpty!31968) (not b_lambda!13963) (not b_next!17629) (not b!933860) (not b!933863))
(check-sat b_and!28801 (not b_next!17629))
