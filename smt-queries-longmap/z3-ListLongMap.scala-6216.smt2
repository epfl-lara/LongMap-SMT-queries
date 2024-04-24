; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79598 () Bool)

(assert start!79598)

(declare-fun b_free!17617 () Bool)

(declare-fun b_next!17617 () Bool)

(assert (=> start!79598 (= b_free!17617 (not b_next!17617))))

(declare-fun tp!61295 () Bool)

(declare-fun b_and!28803 () Bool)

(assert (=> start!79598 (= tp!61295 b_and!28803)))

(declare-fun b!934537 () Bool)

(declare-fun res!629202 () Bool)

(declare-fun e!524828 () Bool)

(assert (=> b!934537 (=> (not res!629202) (not e!524828))))

(declare-datatypes ((array!56241 0))(
  ( (array!56242 (arr!27060 (Array (_ BitVec 32) (_ BitVec 64))) (size!27520 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56241)

(declare-datatypes ((List!19031 0))(
  ( (Nil!19028) (Cons!19027 (h!20179 (_ BitVec 64)) (t!27184 List!19031)) )
))
(declare-fun arrayNoDuplicates!0 (array!56241 (_ BitVec 32) List!19031) Bool)

(assert (=> b!934537 (= res!629202 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19028))))

(declare-fun b!934538 () Bool)

(declare-fun res!629206 () Bool)

(declare-fun e!524827 () Bool)

(assert (=> b!934538 (=> (not res!629206) (not e!524827))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31799 0))(
  ( (V!31800 (val!10113 Int)) )
))
(declare-fun v!791 () V!31799)

(declare-datatypes ((tuple2!13248 0))(
  ( (tuple2!13249 (_1!6635 (_ BitVec 64)) (_2!6635 V!31799)) )
))
(declare-datatypes ((List!19032 0))(
  ( (Nil!19029) (Cons!19028 (h!20180 tuple2!13248) (t!27185 List!19032)) )
))
(declare-datatypes ((ListLongMap!11947 0))(
  ( (ListLongMap!11948 (toList!5989 List!19032)) )
))
(declare-fun lt!420865 () ListLongMap!11947)

(declare-fun apply!815 (ListLongMap!11947 (_ BitVec 64)) V!31799)

(assert (=> b!934538 (= res!629206 (= (apply!815 lt!420865 k0!1099) v!791))))

(declare-fun b!934539 () Bool)

(declare-fun e!524826 () Bool)

(declare-fun tp_is_empty!20125 () Bool)

(assert (=> b!934539 (= e!524826 tp_is_empty!20125)))

(declare-fun b!934540 () Bool)

(declare-fun res!629207 () Bool)

(assert (=> b!934540 (=> (not res!629207) (not e!524828))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9581 0))(
  ( (ValueCellFull!9581 (v!12629 V!31799)) (EmptyCell!9581) )
))
(declare-datatypes ((array!56243 0))(
  ( (array!56244 (arr!27061 (Array (_ BitVec 32) ValueCell!9581)) (size!27521 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56243)

(assert (=> b!934540 (= res!629207 (and (= (size!27521 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27520 _keys!1487) (size!27521 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934541 () Bool)

(declare-fun e!524825 () Bool)

(assert (=> b!934541 (= e!524827 e!524825)))

(declare-fun res!629201 () Bool)

(assert (=> b!934541 (=> (not res!629201) (not e!524825))))

(declare-fun lt!420863 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934541 (= res!629201 (validKeyInArray!0 lt!420863))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934541 (= lt!420863 (select (arr!27060 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934542 () Bool)

(declare-fun res!629208 () Bool)

(assert (=> b!934542 (=> (not res!629208) (not e!524827))))

(assert (=> b!934542 (= res!629208 (validKeyInArray!0 k0!1099))))

(declare-fun b!934544 () Bool)

(declare-fun e!524823 () Bool)

(declare-fun e!524829 () Bool)

(declare-fun mapRes!31947 () Bool)

(assert (=> b!934544 (= e!524823 (and e!524829 mapRes!31947))))

(declare-fun condMapEmpty!31947 () Bool)

(declare-fun mapDefault!31947 () ValueCell!9581)

(assert (=> b!934544 (= condMapEmpty!31947 (= (arr!27061 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9581)) mapDefault!31947)))))

(declare-fun b!934545 () Bool)

(assert (=> b!934545 (= e!524828 e!524827)))

(declare-fun res!629204 () Bool)

(assert (=> b!934545 (=> (not res!629204) (not e!524827))))

(declare-fun contains!5053 (ListLongMap!11947 (_ BitVec 64)) Bool)

(assert (=> b!934545 (= res!629204 (contains!5053 lt!420865 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31799)

(declare-fun minValue!1173 () V!31799)

(declare-fun getCurrentListMap!3230 (array!56241 array!56243 (_ BitVec 32) (_ BitVec 32) V!31799 V!31799 (_ BitVec 32) Int) ListLongMap!11947)

(assert (=> b!934545 (= lt!420865 (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31947 () Bool)

(declare-fun tp!61296 () Bool)

(assert (=> mapNonEmpty!31947 (= mapRes!31947 (and tp!61296 e!524826))))

(declare-fun mapKey!31947 () (_ BitVec 32))

(declare-fun mapValue!31947 () ValueCell!9581)

(declare-fun mapRest!31947 () (Array (_ BitVec 32) ValueCell!9581))

(assert (=> mapNonEmpty!31947 (= (arr!27061 _values!1231) (store mapRest!31947 mapKey!31947 mapValue!31947))))

(declare-fun mapIsEmpty!31947 () Bool)

(assert (=> mapIsEmpty!31947 mapRes!31947))

(declare-fun b!934546 () Bool)

(declare-fun res!629200 () Bool)

(assert (=> b!934546 (=> (not res!629200) (not e!524828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56241 (_ BitVec 32)) Bool)

(assert (=> b!934546 (= res!629200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934547 () Bool)

(assert (=> b!934547 (= e!524825 (not true))))

(assert (=> b!934547 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19028)))

(declare-datatypes ((Unit!31498 0))(
  ( (Unit!31499) )
))
(declare-fun lt!420864 () Unit!31498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56241 (_ BitVec 32) (_ BitVec 32)) Unit!31498)

(assert (=> b!934547 (= lt!420864 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420867 () tuple2!13248)

(declare-fun +!2814 (ListLongMap!11947 tuple2!13248) ListLongMap!11947)

(assert (=> b!934547 (contains!5053 (+!2814 lt!420865 lt!420867) k0!1099)))

(declare-fun lt!420862 () Unit!31498)

(declare-fun lt!420866 () V!31799)

(declare-fun addStillContains!517 (ListLongMap!11947 (_ BitVec 64) V!31799 (_ BitVec 64)) Unit!31498)

(assert (=> b!934547 (= lt!420862 (addStillContains!517 lt!420865 lt!420863 lt!420866 k0!1099))))

(assert (=> b!934547 (= (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2814 (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420867))))

(assert (=> b!934547 (= lt!420867 (tuple2!13249 lt!420863 lt!420866))))

(declare-fun get!14258 (ValueCell!9581 V!31799) V!31799)

(declare-fun dynLambda!1611 (Int (_ BitVec 64)) V!31799)

(assert (=> b!934547 (= lt!420866 (get!14258 (select (arr!27061 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1611 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420861 () Unit!31498)

(declare-fun lemmaListMapRecursiveValidKeyArray!194 (array!56241 array!56243 (_ BitVec 32) (_ BitVec 32) V!31799 V!31799 (_ BitVec 32) Int) Unit!31498)

(assert (=> b!934547 (= lt!420861 (lemmaListMapRecursiveValidKeyArray!194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934543 () Bool)

(declare-fun res!629205 () Bool)

(assert (=> b!934543 (=> (not res!629205) (not e!524827))))

(assert (=> b!934543 (= res!629205 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!629199 () Bool)

(assert (=> start!79598 (=> (not res!629199) (not e!524828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79598 (= res!629199 (validMask!0 mask!1881))))

(assert (=> start!79598 e!524828))

(assert (=> start!79598 true))

(assert (=> start!79598 tp_is_empty!20125))

(declare-fun array_inv!21148 (array!56243) Bool)

(assert (=> start!79598 (and (array_inv!21148 _values!1231) e!524823)))

(assert (=> start!79598 tp!61295))

(declare-fun array_inv!21149 (array!56241) Bool)

(assert (=> start!79598 (array_inv!21149 _keys!1487)))

(declare-fun b!934548 () Bool)

(assert (=> b!934548 (= e!524829 tp_is_empty!20125)))

(declare-fun b!934549 () Bool)

(declare-fun res!629203 () Bool)

(assert (=> b!934549 (=> (not res!629203) (not e!524828))))

(assert (=> b!934549 (= res!629203 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27520 _keys!1487))))))

(assert (= (and start!79598 res!629199) b!934540))

(assert (= (and b!934540 res!629207) b!934546))

(assert (= (and b!934546 res!629200) b!934537))

(assert (= (and b!934537 res!629202) b!934549))

(assert (= (and b!934549 res!629203) b!934545))

(assert (= (and b!934545 res!629204) b!934538))

(assert (= (and b!934538 res!629206) b!934543))

(assert (= (and b!934543 res!629205) b!934542))

(assert (= (and b!934542 res!629208) b!934541))

(assert (= (and b!934541 res!629201) b!934547))

(assert (= (and b!934544 condMapEmpty!31947) mapIsEmpty!31947))

(assert (= (and b!934544 (not condMapEmpty!31947)) mapNonEmpty!31947))

(get-info :version)

(assert (= (and mapNonEmpty!31947 ((_ is ValueCellFull!9581) mapValue!31947)) b!934539))

(assert (= (and b!934544 ((_ is ValueCellFull!9581) mapDefault!31947)) b!934548))

(assert (= start!79598 b!934544))

(declare-fun b_lambda!13965 () Bool)

(assert (=> (not b_lambda!13965) (not b!934547)))

(declare-fun t!27183 () Bool)

(declare-fun tb!6003 () Bool)

(assert (=> (and start!79598 (= defaultEntry!1235 defaultEntry!1235) t!27183) tb!6003))

(declare-fun result!11839 () Bool)

(assert (=> tb!6003 (= result!11839 tp_is_empty!20125)))

(assert (=> b!934547 t!27183))

(declare-fun b_and!28805 () Bool)

(assert (= b_and!28803 (and (=> t!27183 result!11839) b_and!28805)))

(declare-fun m!869093 () Bool)

(assert (=> start!79598 m!869093))

(declare-fun m!869095 () Bool)

(assert (=> start!79598 m!869095))

(declare-fun m!869097 () Bool)

(assert (=> start!79598 m!869097))

(declare-fun m!869099 () Bool)

(assert (=> b!934537 m!869099))

(declare-fun m!869101 () Bool)

(assert (=> b!934547 m!869101))

(declare-fun m!869103 () Bool)

(assert (=> b!934547 m!869103))

(declare-fun m!869105 () Bool)

(assert (=> b!934547 m!869105))

(declare-fun m!869107 () Bool)

(assert (=> b!934547 m!869107))

(assert (=> b!934547 m!869105))

(assert (=> b!934547 m!869107))

(declare-fun m!869109 () Bool)

(assert (=> b!934547 m!869109))

(declare-fun m!869111 () Bool)

(assert (=> b!934547 m!869111))

(assert (=> b!934547 m!869101))

(declare-fun m!869113 () Bool)

(assert (=> b!934547 m!869113))

(declare-fun m!869115 () Bool)

(assert (=> b!934547 m!869115))

(declare-fun m!869117 () Bool)

(assert (=> b!934547 m!869117))

(declare-fun m!869119 () Bool)

(assert (=> b!934547 m!869119))

(declare-fun m!869121 () Bool)

(assert (=> b!934547 m!869121))

(assert (=> b!934547 m!869117))

(declare-fun m!869123 () Bool)

(assert (=> b!934547 m!869123))

(declare-fun m!869125 () Bool)

(assert (=> mapNonEmpty!31947 m!869125))

(declare-fun m!869127 () Bool)

(assert (=> b!934541 m!869127))

(declare-fun m!869129 () Bool)

(assert (=> b!934541 m!869129))

(declare-fun m!869131 () Bool)

(assert (=> b!934542 m!869131))

(declare-fun m!869133 () Bool)

(assert (=> b!934546 m!869133))

(declare-fun m!869135 () Bool)

(assert (=> b!934545 m!869135))

(declare-fun m!869137 () Bool)

(assert (=> b!934545 m!869137))

(declare-fun m!869139 () Bool)

(assert (=> b!934538 m!869139))

(check-sat b_and!28805 (not b_lambda!13965) (not start!79598) (not b!934542) (not mapNonEmpty!31947) (not b_next!17617) (not b!934545) (not b!934546) tp_is_empty!20125 (not b!934541) (not b!934537) (not b!934538) (not b!934547))
(check-sat b_and!28805 (not b_next!17617))
