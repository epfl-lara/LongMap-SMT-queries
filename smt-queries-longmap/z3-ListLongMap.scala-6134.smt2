; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78914 () Bool)

(assert start!78914)

(declare-fun b_free!17127 () Bool)

(declare-fun b_next!17127 () Bool)

(assert (=> start!78914 (= b_free!17127 (not b_next!17127))))

(declare-fun tp!59821 () Bool)

(declare-fun b_and!27991 () Bool)

(assert (=> start!78914 (= tp!59821 b_and!27991)))

(declare-fun b!922706 () Bool)

(declare-fun e!517714 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922706 (= e!517714 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922707 () Bool)

(declare-fun e!517715 () Bool)

(declare-fun e!517713 () Bool)

(assert (=> b!922707 (= e!517715 e!517713)))

(declare-fun res!622213 () Bool)

(assert (=> b!922707 (=> (not res!622213) (not e!517713))))

(declare-datatypes ((V!31145 0))(
  ( (V!31146 (val!9868 Int)) )
))
(declare-datatypes ((tuple2!12838 0))(
  ( (tuple2!12839 (_1!6430 (_ BitVec 64)) (_2!6430 V!31145)) )
))
(declare-datatypes ((List!18643 0))(
  ( (Nil!18640) (Cons!18639 (h!19785 tuple2!12838) (t!26500 List!18643)) )
))
(declare-datatypes ((ListLongMap!11535 0))(
  ( (ListLongMap!11536 (toList!5783 List!18643)) )
))
(declare-fun lt!414392 () ListLongMap!11535)

(declare-fun contains!4846 (ListLongMap!11535 (_ BitVec 64)) Bool)

(assert (=> b!922707 (= res!622213 (contains!4846 lt!414392 k0!1099))))

(declare-datatypes ((array!55246 0))(
  ( (array!55247 (arr!26568 (Array (_ BitVec 32) (_ BitVec 64))) (size!27027 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55246)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9336 0))(
  ( (ValueCellFull!9336 (v!12386 V!31145)) (EmptyCell!9336) )
))
(declare-datatypes ((array!55248 0))(
  ( (array!55249 (arr!26569 (Array (_ BitVec 32) ValueCell!9336)) (size!27028 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55248)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31145)

(declare-fun minValue!1173 () V!31145)

(declare-fun getCurrentListMap!3037 (array!55246 array!55248 (_ BitVec 32) (_ BitVec 32) V!31145 V!31145 (_ BitVec 32) Int) ListLongMap!11535)

(assert (=> b!922707 (= lt!414392 (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922708 () Bool)

(declare-fun e!517720 () Bool)

(assert (=> b!922708 (= e!517713 e!517720)))

(declare-fun res!622217 () Bool)

(assert (=> b!922708 (=> (not res!622217) (not e!517720))))

(declare-fun lt!414393 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922708 (= res!622217 (validKeyInArray!0 lt!414393))))

(assert (=> b!922708 (= lt!414393 (select (arr!26568 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922709 () Bool)

(declare-fun res!622222 () Bool)

(assert (=> b!922709 (=> (not res!622222) (not e!517715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55246 (_ BitVec 32)) Bool)

(assert (=> b!922709 (= res!622222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922710 () Bool)

(declare-fun e!517716 () Bool)

(declare-fun tp_is_empty!19635 () Bool)

(assert (=> b!922710 (= e!517716 tp_is_empty!19635)))

(declare-fun b!922711 () Bool)

(declare-fun res!622218 () Bool)

(assert (=> b!922711 (=> (not res!622218) (not e!517715))))

(assert (=> b!922711 (= res!622218 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27027 _keys!1487))))))

(declare-fun b!922712 () Bool)

(declare-fun res!622214 () Bool)

(assert (=> b!922712 (=> (not res!622214) (not e!517715))))

(assert (=> b!922712 (= res!622214 (and (= (size!27028 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27027 _keys!1487) (size!27028 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922713 () Bool)

(declare-fun res!622220 () Bool)

(assert (=> b!922713 (=> (not res!622220) (not e!517713))))

(assert (=> b!922713 (= res!622220 (validKeyInArray!0 k0!1099))))

(declare-fun b!922714 () Bool)

(declare-fun res!622221 () Bool)

(assert (=> b!922714 (=> (not res!622221) (not e!517715))))

(declare-datatypes ((List!18644 0))(
  ( (Nil!18641) (Cons!18640 (h!19786 (_ BitVec 64)) (t!26501 List!18644)) )
))
(declare-fun arrayNoDuplicates!0 (array!55246 (_ BitVec 32) List!18644) Bool)

(assert (=> b!922714 (= res!622221 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18641))))

(declare-fun b!922715 () Bool)

(declare-fun arrayContainsKey!0 (array!55246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922715 (= e!517714 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922716 () Bool)

(declare-fun e!517718 () Bool)

(assert (=> b!922716 (= e!517718 tp_is_empty!19635)))

(declare-fun res!622215 () Bool)

(assert (=> start!78914 (=> (not res!622215) (not e!517715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78914 (= res!622215 (validMask!0 mask!1881))))

(assert (=> start!78914 e!517715))

(assert (=> start!78914 true))

(assert (=> start!78914 tp_is_empty!19635))

(declare-fun e!517717 () Bool)

(declare-fun array_inv!20694 (array!55248) Bool)

(assert (=> start!78914 (and (array_inv!20694 _values!1231) e!517717)))

(assert (=> start!78914 tp!59821))

(declare-fun array_inv!20695 (array!55246) Bool)

(assert (=> start!78914 (array_inv!20695 _keys!1487)))

(declare-fun mapIsEmpty!31209 () Bool)

(declare-fun mapRes!31209 () Bool)

(assert (=> mapIsEmpty!31209 mapRes!31209))

(declare-fun b!922717 () Bool)

(assert (=> b!922717 (= e!517720 (not true))))

(assert (=> b!922717 (not (= lt!414393 k0!1099))))

(declare-datatypes ((Unit!31124 0))(
  ( (Unit!31125) )
))
(declare-fun lt!414395 () Unit!31124)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55246 (_ BitVec 64) (_ BitVec 32) List!18644) Unit!31124)

(assert (=> b!922717 (= lt!414395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18641))))

(assert (=> b!922717 e!517714))

(declare-fun c!96192 () Bool)

(assert (=> b!922717 (= c!96192 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414390 () Unit!31124)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!195 (array!55246 array!55248 (_ BitVec 32) (_ BitVec 32) V!31145 V!31145 (_ BitVec 64) (_ BitVec 32) Int) Unit!31124)

(assert (=> b!922717 (= lt!414390 (lemmaListMapContainsThenArrayContainsFrom!195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922717 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18641)))

(declare-fun lt!414396 () Unit!31124)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55246 (_ BitVec 32) (_ BitVec 32)) Unit!31124)

(assert (=> b!922717 (= lt!414396 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414389 () tuple2!12838)

(declare-fun +!2688 (ListLongMap!11535 tuple2!12838) ListLongMap!11535)

(assert (=> b!922717 (contains!4846 (+!2688 lt!414392 lt!414389) k0!1099)))

(declare-fun lt!414394 () Unit!31124)

(declare-fun lt!414397 () V!31145)

(declare-fun addStillContains!412 (ListLongMap!11535 (_ BitVec 64) V!31145 (_ BitVec 64)) Unit!31124)

(assert (=> b!922717 (= lt!414394 (addStillContains!412 lt!414392 lt!414393 lt!414397 k0!1099))))

(assert (=> b!922717 (= (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2688 (getCurrentListMap!3037 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414389))))

(assert (=> b!922717 (= lt!414389 (tuple2!12839 lt!414393 lt!414397))))

(declare-fun get!13953 (ValueCell!9336 V!31145) V!31145)

(declare-fun dynLambda!1477 (Int (_ BitVec 64)) V!31145)

(assert (=> b!922717 (= lt!414397 (get!13953 (select (arr!26569 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1477 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414391 () Unit!31124)

(declare-fun lemmaListMapRecursiveValidKeyArray!78 (array!55246 array!55248 (_ BitVec 32) (_ BitVec 32) V!31145 V!31145 (_ BitVec 32) Int) Unit!31124)

(assert (=> b!922717 (= lt!414391 (lemmaListMapRecursiveValidKeyArray!78 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922718 () Bool)

(declare-fun res!622216 () Bool)

(assert (=> b!922718 (=> (not res!622216) (not e!517713))))

(declare-fun v!791 () V!31145)

(declare-fun apply!618 (ListLongMap!11535 (_ BitVec 64)) V!31145)

(assert (=> b!922718 (= res!622216 (= (apply!618 lt!414392 k0!1099) v!791))))

(declare-fun mapNonEmpty!31209 () Bool)

(declare-fun tp!59822 () Bool)

(assert (=> mapNonEmpty!31209 (= mapRes!31209 (and tp!59822 e!517716))))

(declare-fun mapKey!31209 () (_ BitVec 32))

(declare-fun mapRest!31209 () (Array (_ BitVec 32) ValueCell!9336))

(declare-fun mapValue!31209 () ValueCell!9336)

(assert (=> mapNonEmpty!31209 (= (arr!26569 _values!1231) (store mapRest!31209 mapKey!31209 mapValue!31209))))

(declare-fun b!922719 () Bool)

(declare-fun res!622219 () Bool)

(assert (=> b!922719 (=> (not res!622219) (not e!517713))))

(assert (=> b!922719 (= res!622219 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922720 () Bool)

(assert (=> b!922720 (= e!517717 (and e!517718 mapRes!31209))))

(declare-fun condMapEmpty!31209 () Bool)

(declare-fun mapDefault!31209 () ValueCell!9336)

(assert (=> b!922720 (= condMapEmpty!31209 (= (arr!26569 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9336)) mapDefault!31209)))))

(assert (= (and start!78914 res!622215) b!922712))

(assert (= (and b!922712 res!622214) b!922709))

(assert (= (and b!922709 res!622222) b!922714))

(assert (= (and b!922714 res!622221) b!922711))

(assert (= (and b!922711 res!622218) b!922707))

(assert (= (and b!922707 res!622213) b!922718))

(assert (= (and b!922718 res!622216) b!922719))

(assert (= (and b!922719 res!622219) b!922713))

(assert (= (and b!922713 res!622220) b!922708))

(assert (= (and b!922708 res!622217) b!922717))

(assert (= (and b!922717 c!96192) b!922715))

(assert (= (and b!922717 (not c!96192)) b!922706))

(assert (= (and b!922720 condMapEmpty!31209) mapIsEmpty!31209))

(assert (= (and b!922720 (not condMapEmpty!31209)) mapNonEmpty!31209))

(get-info :version)

(assert (= (and mapNonEmpty!31209 ((_ is ValueCellFull!9336) mapValue!31209)) b!922710))

(assert (= (and b!922720 ((_ is ValueCellFull!9336) mapDefault!31209)) b!922716))

(assert (= start!78914 b!922720))

(declare-fun b_lambda!13629 () Bool)

(assert (=> (not b_lambda!13629) (not b!922717)))

(declare-fun t!26499 () Bool)

(declare-fun tb!5707 () Bool)

(assert (=> (and start!78914 (= defaultEntry!1235 defaultEntry!1235) t!26499) tb!5707))

(declare-fun result!11237 () Bool)

(assert (=> tb!5707 (= result!11237 tp_is_empty!19635)))

(assert (=> b!922717 t!26499))

(declare-fun b_and!27993 () Bool)

(assert (= b_and!27991 (and (=> t!26499 result!11237) b_and!27993)))

(declare-fun m!856815 () Bool)

(assert (=> b!922714 m!856815))

(declare-fun m!856817 () Bool)

(assert (=> start!78914 m!856817))

(declare-fun m!856819 () Bool)

(assert (=> start!78914 m!856819))

(declare-fun m!856821 () Bool)

(assert (=> start!78914 m!856821))

(declare-fun m!856823 () Bool)

(assert (=> b!922709 m!856823))

(declare-fun m!856825 () Bool)

(assert (=> b!922718 m!856825))

(declare-fun m!856827 () Bool)

(assert (=> b!922707 m!856827))

(declare-fun m!856829 () Bool)

(assert (=> b!922707 m!856829))

(declare-fun m!856831 () Bool)

(assert (=> b!922715 m!856831))

(declare-fun m!856833 () Bool)

(assert (=> b!922713 m!856833))

(declare-fun m!856835 () Bool)

(assert (=> b!922717 m!856835))

(declare-fun m!856837 () Bool)

(assert (=> b!922717 m!856837))

(declare-fun m!856839 () Bool)

(assert (=> b!922717 m!856839))

(declare-fun m!856841 () Bool)

(assert (=> b!922717 m!856841))

(declare-fun m!856843 () Bool)

(assert (=> b!922717 m!856843))

(declare-fun m!856845 () Bool)

(assert (=> b!922717 m!856845))

(assert (=> b!922717 m!856843))

(assert (=> b!922717 m!856845))

(declare-fun m!856847 () Bool)

(assert (=> b!922717 m!856847))

(declare-fun m!856849 () Bool)

(assert (=> b!922717 m!856849))

(declare-fun m!856851 () Bool)

(assert (=> b!922717 m!856851))

(declare-fun m!856853 () Bool)

(assert (=> b!922717 m!856853))

(declare-fun m!856855 () Bool)

(assert (=> b!922717 m!856855))

(assert (=> b!922717 m!856835))

(declare-fun m!856857 () Bool)

(assert (=> b!922717 m!856857))

(assert (=> b!922717 m!856851))

(declare-fun m!856859 () Bool)

(assert (=> b!922717 m!856859))

(declare-fun m!856861 () Bool)

(assert (=> b!922717 m!856861))

(declare-fun m!856863 () Bool)

(assert (=> b!922708 m!856863))

(declare-fun m!856865 () Bool)

(assert (=> b!922708 m!856865))

(declare-fun m!856867 () Bool)

(assert (=> mapNonEmpty!31209 m!856867))

(check-sat (not b_lambda!13629) (not b!922718) (not b!922714) (not mapNonEmpty!31209) b_and!27993 (not b!922708) tp_is_empty!19635 (not b!922709) (not b!922715) (not b_next!17127) (not start!78914) (not b!922713) (not b!922717) (not b!922707))
(check-sat b_and!27993 (not b_next!17127))
