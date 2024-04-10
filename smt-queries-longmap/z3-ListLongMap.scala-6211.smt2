; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79402 () Bool)

(assert start!79402)

(declare-fun b_free!17589 () Bool)

(declare-fun b_next!17589 () Bool)

(assert (=> start!79402 (= b_free!17589 (not b_next!17589))))

(declare-fun tp!61210 () Bool)

(declare-fun b_and!28737 () Bool)

(assert (=> start!79402 (= tp!61210 b_and!28737)))

(declare-fun b!933061 () Bool)

(declare-fun res!628444 () Bool)

(declare-fun e!523953 () Bool)

(assert (=> b!933061 (=> (not res!628444) (not e!523953))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31761 0))(
  ( (V!31762 (val!10099 Int)) )
))
(declare-datatypes ((ValueCell!9567 0))(
  ( (ValueCellFull!9567 (v!12618 V!31761)) (EmptyCell!9567) )
))
(declare-datatypes ((array!56130 0))(
  ( (array!56131 (arr!27009 (Array (_ BitVec 32) ValueCell!9567)) (size!27468 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56130)

(declare-datatypes ((array!56132 0))(
  ( (array!56133 (arr!27010 (Array (_ BitVec 32) (_ BitVec 64))) (size!27469 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56132)

(assert (=> b!933061 (= res!628444 (and (= (size!27468 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27469 _keys!1487) (size!27468 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933062 () Bool)

(declare-fun e!523949 () Bool)

(assert (=> b!933062 (= e!523949 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19017 0))(
  ( (Nil!19014) (Cons!19013 (h!20159 (_ BitVec 64)) (t!27150 List!19017)) )
))
(declare-fun arrayNoDuplicates!0 (array!56132 (_ BitVec 32) List!19017) Bool)

(assert (=> b!933062 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19014)))

(declare-datatypes ((Unit!31485 0))(
  ( (Unit!31486) )
))
(declare-fun lt!420210 () Unit!31485)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56132 (_ BitVec 32) (_ BitVec 32)) Unit!31485)

(assert (=> b!933062 (= lt!420210 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13236 0))(
  ( (tuple2!13237 (_1!6629 (_ BitVec 64)) (_2!6629 V!31761)) )
))
(declare-datatypes ((List!19018 0))(
  ( (Nil!19015) (Cons!19014 (h!20160 tuple2!13236) (t!27151 List!19018)) )
))
(declare-datatypes ((ListLongMap!11933 0))(
  ( (ListLongMap!11934 (toList!5982 List!19018)) )
))
(declare-fun lt!420208 () ListLongMap!11933)

(declare-fun lt!420212 () tuple2!13236)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5031 (ListLongMap!11933 (_ BitVec 64)) Bool)

(declare-fun +!2785 (ListLongMap!11933 tuple2!13236) ListLongMap!11933)

(assert (=> b!933062 (contains!5031 (+!2785 lt!420208 lt!420212) k0!1099)))

(declare-fun lt!420207 () V!31761)

(declare-fun lt!420206 () (_ BitVec 64))

(declare-fun lt!420211 () Unit!31485)

(declare-fun addStillContains!504 (ListLongMap!11933 (_ BitVec 64) V!31761 (_ BitVec 64)) Unit!31485)

(assert (=> b!933062 (= lt!420211 (addStillContains!504 lt!420208 lt!420206 lt!420207 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31761)

(declare-fun minValue!1173 () V!31761)

(declare-fun getCurrentListMap!3220 (array!56132 array!56130 (_ BitVec 32) (_ BitVec 32) V!31761 V!31761 (_ BitVec 32) Int) ListLongMap!11933)

(assert (=> b!933062 (= (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2785 (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420212))))

(assert (=> b!933062 (= lt!420212 (tuple2!13237 lt!420206 lt!420207))))

(declare-fun get!14207 (ValueCell!9567 V!31761) V!31761)

(declare-fun dynLambda!1574 (Int (_ BitVec 64)) V!31761)

(assert (=> b!933062 (= lt!420207 (get!14207 (select (arr!27009 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1574 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420209 () Unit!31485)

(declare-fun lemmaListMapRecursiveValidKeyArray!175 (array!56132 array!56130 (_ BitVec 32) (_ BitVec 32) V!31761 V!31761 (_ BitVec 32) Int) Unit!31485)

(assert (=> b!933062 (= lt!420209 (lemmaListMapRecursiveValidKeyArray!175 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933063 () Bool)

(declare-fun e!523947 () Bool)

(declare-fun tp_is_empty!20097 () Bool)

(assert (=> b!933063 (= e!523947 tp_is_empty!20097)))

(declare-fun b!933064 () Bool)

(declare-fun e!523952 () Bool)

(assert (=> b!933064 (= e!523952 e!523949)))

(declare-fun res!628440 () Bool)

(assert (=> b!933064 (=> (not res!628440) (not e!523949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933064 (= res!628440 (validKeyInArray!0 lt!420206))))

(assert (=> b!933064 (= lt!420206 (select (arr!27010 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31905 () Bool)

(declare-fun mapRes!31905 () Bool)

(declare-fun tp!61211 () Bool)

(assert (=> mapNonEmpty!31905 (= mapRes!31905 (and tp!61211 e!523947))))

(declare-fun mapValue!31905 () ValueCell!9567)

(declare-fun mapRest!31905 () (Array (_ BitVec 32) ValueCell!9567))

(declare-fun mapKey!31905 () (_ BitVec 32))

(assert (=> mapNonEmpty!31905 (= (arr!27009 _values!1231) (store mapRest!31905 mapKey!31905 mapValue!31905))))

(declare-fun b!933065 () Bool)

(declare-fun res!628443 () Bool)

(assert (=> b!933065 (=> (not res!628443) (not e!523953))))

(assert (=> b!933065 (= res!628443 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27469 _keys!1487))))))

(declare-fun b!933066 () Bool)

(assert (=> b!933066 (= e!523953 e!523952)))

(declare-fun res!628438 () Bool)

(assert (=> b!933066 (=> (not res!628438) (not e!523952))))

(assert (=> b!933066 (= res!628438 (contains!5031 lt!420208 k0!1099))))

(assert (=> b!933066 (= lt!420208 (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933067 () Bool)

(declare-fun res!628436 () Bool)

(assert (=> b!933067 (=> (not res!628436) (not e!523953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56132 (_ BitVec 32)) Bool)

(assert (=> b!933067 (= res!628436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31905 () Bool)

(assert (=> mapIsEmpty!31905 mapRes!31905))

(declare-fun b!933068 () Bool)

(declare-fun res!628439 () Bool)

(assert (=> b!933068 (=> (not res!628439) (not e!523952))))

(declare-fun v!791 () V!31761)

(declare-fun apply!795 (ListLongMap!11933 (_ BitVec 64)) V!31761)

(assert (=> b!933068 (= res!628439 (= (apply!795 lt!420208 k0!1099) v!791))))

(declare-fun b!933060 () Bool)

(declare-fun e!523951 () Bool)

(assert (=> b!933060 (= e!523951 tp_is_empty!20097)))

(declare-fun res!628442 () Bool)

(assert (=> start!79402 (=> (not res!628442) (not e!523953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79402 (= res!628442 (validMask!0 mask!1881))))

(assert (=> start!79402 e!523953))

(assert (=> start!79402 true))

(assert (=> start!79402 tp_is_empty!20097))

(declare-fun e!523950 () Bool)

(declare-fun array_inv!21022 (array!56130) Bool)

(assert (=> start!79402 (and (array_inv!21022 _values!1231) e!523950)))

(assert (=> start!79402 tp!61210))

(declare-fun array_inv!21023 (array!56132) Bool)

(assert (=> start!79402 (array_inv!21023 _keys!1487)))

(declare-fun b!933069 () Bool)

(declare-fun res!628441 () Bool)

(assert (=> b!933069 (=> (not res!628441) (not e!523952))))

(assert (=> b!933069 (= res!628441 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933070 () Bool)

(declare-fun res!628437 () Bool)

(assert (=> b!933070 (=> (not res!628437) (not e!523953))))

(assert (=> b!933070 (= res!628437 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19014))))

(declare-fun b!933071 () Bool)

(declare-fun res!628435 () Bool)

(assert (=> b!933071 (=> (not res!628435) (not e!523952))))

(assert (=> b!933071 (= res!628435 (validKeyInArray!0 k0!1099))))

(declare-fun b!933072 () Bool)

(assert (=> b!933072 (= e!523950 (and e!523951 mapRes!31905))))

(declare-fun condMapEmpty!31905 () Bool)

(declare-fun mapDefault!31905 () ValueCell!9567)

(assert (=> b!933072 (= condMapEmpty!31905 (= (arr!27009 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9567)) mapDefault!31905)))))

(assert (= (and start!79402 res!628442) b!933061))

(assert (= (and b!933061 res!628444) b!933067))

(assert (= (and b!933067 res!628436) b!933070))

(assert (= (and b!933070 res!628437) b!933065))

(assert (= (and b!933065 res!628443) b!933066))

(assert (= (and b!933066 res!628438) b!933068))

(assert (= (and b!933068 res!628439) b!933069))

(assert (= (and b!933069 res!628441) b!933071))

(assert (= (and b!933071 res!628435) b!933064))

(assert (= (and b!933064 res!628440) b!933062))

(assert (= (and b!933072 condMapEmpty!31905) mapIsEmpty!31905))

(assert (= (and b!933072 (not condMapEmpty!31905)) mapNonEmpty!31905))

(get-info :version)

(assert (= (and mapNonEmpty!31905 ((_ is ValueCellFull!9567) mapValue!31905)) b!933063))

(assert (= (and b!933072 ((_ is ValueCellFull!9567) mapDefault!31905)) b!933060))

(assert (= start!79402 b!933072))

(declare-fun b_lambda!13923 () Bool)

(assert (=> (not b_lambda!13923) (not b!933062)))

(declare-fun t!27149 () Bool)

(declare-fun tb!5983 () Bool)

(assert (=> (and start!79402 (= defaultEntry!1235 defaultEntry!1235) t!27149) tb!5983))

(declare-fun result!11791 () Bool)

(assert (=> tb!5983 (= result!11791 tp_is_empty!20097)))

(assert (=> b!933062 t!27149))

(declare-fun b_and!28739 () Bool)

(assert (= b_and!28737 (and (=> t!27149 result!11791) b_and!28739)))

(declare-fun m!867127 () Bool)

(assert (=> b!933067 m!867127))

(declare-fun m!867129 () Bool)

(assert (=> b!933070 m!867129))

(declare-fun m!867131 () Bool)

(assert (=> b!933064 m!867131))

(declare-fun m!867133 () Bool)

(assert (=> b!933064 m!867133))

(declare-fun m!867135 () Bool)

(assert (=> mapNonEmpty!31905 m!867135))

(declare-fun m!867137 () Bool)

(assert (=> b!933068 m!867137))

(declare-fun m!867139 () Bool)

(assert (=> b!933066 m!867139))

(declare-fun m!867141 () Bool)

(assert (=> b!933066 m!867141))

(declare-fun m!867143 () Bool)

(assert (=> b!933062 m!867143))

(declare-fun m!867145 () Bool)

(assert (=> b!933062 m!867145))

(declare-fun m!867147 () Bool)

(assert (=> b!933062 m!867147))

(declare-fun m!867149 () Bool)

(assert (=> b!933062 m!867149))

(declare-fun m!867151 () Bool)

(assert (=> b!933062 m!867151))

(declare-fun m!867153 () Bool)

(assert (=> b!933062 m!867153))

(declare-fun m!867155 () Bool)

(assert (=> b!933062 m!867155))

(assert (=> b!933062 m!867143))

(assert (=> b!933062 m!867149))

(declare-fun m!867157 () Bool)

(assert (=> b!933062 m!867157))

(assert (=> b!933062 m!867151))

(declare-fun m!867159 () Bool)

(assert (=> b!933062 m!867159))

(declare-fun m!867161 () Bool)

(assert (=> b!933062 m!867161))

(assert (=> b!933062 m!867155))

(declare-fun m!867163 () Bool)

(assert (=> b!933062 m!867163))

(declare-fun m!867165 () Bool)

(assert (=> b!933062 m!867165))

(declare-fun m!867167 () Bool)

(assert (=> start!79402 m!867167))

(declare-fun m!867169 () Bool)

(assert (=> start!79402 m!867169))

(declare-fun m!867171 () Bool)

(assert (=> start!79402 m!867171))

(declare-fun m!867173 () Bool)

(assert (=> b!933071 m!867173))

(check-sat (not b!933066) tp_is_empty!20097 (not b!933064) (not mapNonEmpty!31905) (not b!933071) (not start!79402) (not b_next!17589) (not b_lambda!13923) (not b!933070) b_and!28739 (not b!933067) (not b!933062) (not b!933068))
(check-sat b_and!28739 (not b_next!17589))
