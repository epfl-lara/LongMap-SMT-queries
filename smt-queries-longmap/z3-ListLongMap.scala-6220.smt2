; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79488 () Bool)

(assert start!79488)

(declare-fun b_free!17643 () Bool)

(declare-fun b_next!17643 () Bool)

(assert (=> start!79488 (= b_free!17643 (not b_next!17643))))

(declare-fun tp!61376 () Bool)

(declare-fun b_and!28853 () Bool)

(assert (=> start!79488 (= tp!61376 b_and!28853)))

(declare-fun b!934418 () Bool)

(declare-fun e!524676 () Bool)

(declare-fun e!524673 () Bool)

(assert (=> b!934418 (= e!524676 e!524673)))

(declare-fun res!629338 () Bool)

(assert (=> b!934418 (=> (not res!629338) (not e!524673))))

(declare-datatypes ((V!31833 0))(
  ( (V!31834 (val!10126 Int)) )
))
(declare-datatypes ((tuple2!13282 0))(
  ( (tuple2!13283 (_1!6652 (_ BitVec 64)) (_2!6652 V!31833)) )
))
(declare-datatypes ((List!19062 0))(
  ( (Nil!19059) (Cons!19058 (h!20204 tuple2!13282) (t!27249 List!19062)) )
))
(declare-datatypes ((ListLongMap!11979 0))(
  ( (ListLongMap!11980 (toList!6005 List!19062)) )
))
(declare-fun lt!420972 () ListLongMap!11979)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5055 (ListLongMap!11979 (_ BitVec 64)) Bool)

(assert (=> b!934418 (= res!629338 (contains!5055 lt!420972 k0!1099))))

(declare-datatypes ((array!56240 0))(
  ( (array!56241 (arr!27063 (Array (_ BitVec 32) (_ BitVec 64))) (size!27522 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56240)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9594 0))(
  ( (ValueCellFull!9594 (v!12646 V!31833)) (EmptyCell!9594) )
))
(declare-datatypes ((array!56242 0))(
  ( (array!56243 (arr!27064 (Array (_ BitVec 32) ValueCell!9594)) (size!27523 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56242)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31833)

(declare-fun minValue!1173 () V!31833)

(declare-fun getCurrentListMap!3242 (array!56240 array!56242 (_ BitVec 32) (_ BitVec 32) V!31833 V!31833 (_ BitVec 32) Int) ListLongMap!11979)

(assert (=> b!934418 (= lt!420972 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934419 () Bool)

(declare-fun res!629333 () Bool)

(assert (=> b!934419 (=> (not res!629333) (not e!524676))))

(declare-datatypes ((List!19063 0))(
  ( (Nil!19060) (Cons!19059 (h!20205 (_ BitVec 64)) (t!27250 List!19063)) )
))
(declare-fun arrayNoDuplicates!0 (array!56240 (_ BitVec 32) List!19063) Bool)

(assert (=> b!934419 (= res!629333 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19060))))

(declare-fun b!934420 () Bool)

(declare-fun e!524675 () Bool)

(assert (=> b!934420 (= e!524673 e!524675)))

(declare-fun res!629334 () Bool)

(assert (=> b!934420 (=> (not res!629334) (not e!524675))))

(declare-fun lt!420973 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934420 (= res!629334 (validKeyInArray!0 lt!420973))))

(assert (=> b!934420 (= lt!420973 (select (arr!27063 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934421 () Bool)

(assert (=> b!934421 (= e!524675 (not true))))

(declare-fun e!524671 () Bool)

(assert (=> b!934421 e!524671))

(declare-fun c!97155 () Bool)

(assert (=> b!934421 (= c!97155 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31526 0))(
  ( (Unit!31527) )
))
(declare-fun lt!420975 () Unit!31526)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!275 (array!56240 array!56242 (_ BitVec 32) (_ BitVec 32) V!31833 V!31833 (_ BitVec 64) (_ BitVec 32) Int) Unit!31526)

(assert (=> b!934421 (= lt!420975 (lemmaListMapContainsThenArrayContainsFrom!275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934421 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19060)))

(declare-fun lt!420974 () Unit!31526)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56240 (_ BitVec 32) (_ BitVec 32)) Unit!31526)

(assert (=> b!934421 (= lt!420974 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420969 () tuple2!13282)

(declare-fun +!2803 (ListLongMap!11979 tuple2!13282) ListLongMap!11979)

(assert (=> b!934421 (contains!5055 (+!2803 lt!420972 lt!420969) k0!1099)))

(declare-fun lt!420971 () Unit!31526)

(declare-fun lt!420968 () V!31833)

(declare-fun addStillContains!522 (ListLongMap!11979 (_ BitVec 64) V!31833 (_ BitVec 64)) Unit!31526)

(assert (=> b!934421 (= lt!420971 (addStillContains!522 lt!420972 lt!420973 lt!420968 k0!1099))))

(assert (=> b!934421 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2803 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420969))))

(assert (=> b!934421 (= lt!420969 (tuple2!13283 lt!420973 lt!420968))))

(declare-fun get!14246 (ValueCell!9594 V!31833) V!31833)

(declare-fun dynLambda!1592 (Int (_ BitVec 64)) V!31833)

(assert (=> b!934421 (= lt!420968 (get!14246 (select (arr!27064 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420970 () Unit!31526)

(declare-fun lemmaListMapRecursiveValidKeyArray!193 (array!56240 array!56242 (_ BitVec 32) (_ BitVec 32) V!31833 V!31833 (_ BitVec 32) Int) Unit!31526)

(assert (=> b!934421 (= lt!420970 (lemmaListMapRecursiveValidKeyArray!193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934422 () Bool)

(declare-fun res!629330 () Bool)

(assert (=> b!934422 (=> (not res!629330) (not e!524673))))

(assert (=> b!934422 (= res!629330 (validKeyInArray!0 k0!1099))))

(declare-fun b!934423 () Bool)

(declare-fun e!524669 () Bool)

(declare-fun tp_is_empty!20151 () Bool)

(assert (=> b!934423 (= e!524669 tp_is_empty!20151)))

(declare-fun b!934424 () Bool)

(declare-fun res!629332 () Bool)

(assert (=> b!934424 (=> (not res!629332) (not e!524673))))

(declare-fun v!791 () V!31833)

(declare-fun apply!810 (ListLongMap!11979 (_ BitVec 64)) V!31833)

(assert (=> b!934424 (= res!629332 (= (apply!810 lt!420972 k0!1099) v!791))))

(declare-fun res!629331 () Bool)

(assert (=> start!79488 (=> (not res!629331) (not e!524676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79488 (= res!629331 (validMask!0 mask!1881))))

(assert (=> start!79488 e!524676))

(assert (=> start!79488 true))

(assert (=> start!79488 tp_is_empty!20151))

(declare-fun e!524672 () Bool)

(declare-fun array_inv!21062 (array!56242) Bool)

(assert (=> start!79488 (and (array_inv!21062 _values!1231) e!524672)))

(assert (=> start!79488 tp!61376))

(declare-fun array_inv!21063 (array!56240) Bool)

(assert (=> start!79488 (array_inv!21063 _keys!1487)))

(declare-fun b!934425 () Bool)

(declare-fun res!629335 () Bool)

(assert (=> b!934425 (=> (not res!629335) (not e!524676))))

(assert (=> b!934425 (= res!629335 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27522 _keys!1487))))))

(declare-fun mapNonEmpty!31989 () Bool)

(declare-fun mapRes!31989 () Bool)

(declare-fun tp!61375 () Bool)

(assert (=> mapNonEmpty!31989 (= mapRes!31989 (and tp!61375 e!524669))))

(declare-fun mapValue!31989 () ValueCell!9594)

(declare-fun mapRest!31989 () (Array (_ BitVec 32) ValueCell!9594))

(declare-fun mapKey!31989 () (_ BitVec 32))

(assert (=> mapNonEmpty!31989 (= (arr!27064 _values!1231) (store mapRest!31989 mapKey!31989 mapValue!31989))))

(declare-fun b!934426 () Bool)

(assert (=> b!934426 (= e!524671 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934427 () Bool)

(declare-fun res!629329 () Bool)

(assert (=> b!934427 (=> (not res!629329) (not e!524676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56240 (_ BitVec 32)) Bool)

(assert (=> b!934427 (= res!629329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934428 () Bool)

(declare-fun res!629336 () Bool)

(assert (=> b!934428 (=> (not res!629336) (not e!524673))))

(assert (=> b!934428 (= res!629336 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31989 () Bool)

(assert (=> mapIsEmpty!31989 mapRes!31989))

(declare-fun b!934429 () Bool)

(declare-fun e!524670 () Bool)

(assert (=> b!934429 (= e!524670 tp_is_empty!20151)))

(declare-fun b!934430 () Bool)

(declare-fun res!629337 () Bool)

(assert (=> b!934430 (=> (not res!629337) (not e!524676))))

(assert (=> b!934430 (= res!629337 (and (= (size!27523 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27522 _keys!1487) (size!27523 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934431 () Bool)

(declare-fun arrayContainsKey!0 (array!56240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934431 (= e!524671 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934432 () Bool)

(assert (=> b!934432 (= e!524672 (and e!524670 mapRes!31989))))

(declare-fun condMapEmpty!31989 () Bool)

(declare-fun mapDefault!31989 () ValueCell!9594)

(assert (=> b!934432 (= condMapEmpty!31989 (= (arr!27064 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9594)) mapDefault!31989)))))

(assert (= (and start!79488 res!629331) b!934430))

(assert (= (and b!934430 res!629337) b!934427))

(assert (= (and b!934427 res!629329) b!934419))

(assert (= (and b!934419 res!629333) b!934425))

(assert (= (and b!934425 res!629335) b!934418))

(assert (= (and b!934418 res!629338) b!934424))

(assert (= (and b!934424 res!629332) b!934428))

(assert (= (and b!934428 res!629336) b!934422))

(assert (= (and b!934422 res!629330) b!934420))

(assert (= (and b!934420 res!629334) b!934421))

(assert (= (and b!934421 c!97155) b!934431))

(assert (= (and b!934421 (not c!97155)) b!934426))

(assert (= (and b!934432 condMapEmpty!31989) mapIsEmpty!31989))

(assert (= (and b!934432 (not condMapEmpty!31989)) mapNonEmpty!31989))

(get-info :version)

(assert (= (and mapNonEmpty!31989 ((_ is ValueCellFull!9594) mapValue!31989)) b!934423))

(assert (= (and b!934432 ((_ is ValueCellFull!9594) mapDefault!31989)) b!934429))

(assert (= start!79488 b!934432))

(declare-fun b_lambda!13995 () Bool)

(assert (=> (not b_lambda!13995) (not b!934421)))

(declare-fun t!27248 () Bool)

(declare-fun tb!6037 () Bool)

(assert (=> (and start!79488 (= defaultEntry!1235 defaultEntry!1235) t!27248) tb!6037))

(declare-fun result!11901 () Bool)

(assert (=> tb!6037 (= result!11901 tp_is_empty!20151)))

(assert (=> b!934421 t!27248))

(declare-fun b_and!28855 () Bool)

(assert (= b_and!28853 (and (=> t!27248 result!11901) b_and!28855)))

(declare-fun m!868711 () Bool)

(assert (=> b!934424 m!868711))

(declare-fun m!868713 () Bool)

(assert (=> b!934419 m!868713))

(declare-fun m!868715 () Bool)

(assert (=> start!79488 m!868715))

(declare-fun m!868717 () Bool)

(assert (=> start!79488 m!868717))

(declare-fun m!868719 () Bool)

(assert (=> start!79488 m!868719))

(declare-fun m!868721 () Bool)

(assert (=> b!934422 m!868721))

(declare-fun m!868723 () Bool)

(assert (=> b!934418 m!868723))

(declare-fun m!868725 () Bool)

(assert (=> b!934418 m!868725))

(declare-fun m!868727 () Bool)

(assert (=> b!934431 m!868727))

(declare-fun m!868729 () Bool)

(assert (=> mapNonEmpty!31989 m!868729))

(declare-fun m!868731 () Bool)

(assert (=> b!934420 m!868731))

(declare-fun m!868733 () Bool)

(assert (=> b!934420 m!868733))

(declare-fun m!868735 () Bool)

(assert (=> b!934427 m!868735))

(declare-fun m!868737 () Bool)

(assert (=> b!934421 m!868737))

(declare-fun m!868739 () Bool)

(assert (=> b!934421 m!868739))

(declare-fun m!868741 () Bool)

(assert (=> b!934421 m!868741))

(declare-fun m!868743 () Bool)

(assert (=> b!934421 m!868743))

(assert (=> b!934421 m!868741))

(assert (=> b!934421 m!868743))

(declare-fun m!868745 () Bool)

(assert (=> b!934421 m!868745))

(declare-fun m!868747 () Bool)

(assert (=> b!934421 m!868747))

(declare-fun m!868749 () Bool)

(assert (=> b!934421 m!868749))

(declare-fun m!868751 () Bool)

(assert (=> b!934421 m!868751))

(declare-fun m!868753 () Bool)

(assert (=> b!934421 m!868753))

(assert (=> b!934421 m!868737))

(declare-fun m!868755 () Bool)

(assert (=> b!934421 m!868755))

(declare-fun m!868757 () Bool)

(assert (=> b!934421 m!868757))

(declare-fun m!868759 () Bool)

(assert (=> b!934421 m!868759))

(assert (=> b!934421 m!868757))

(declare-fun m!868761 () Bool)

(assert (=> b!934421 m!868761))

(check-sat (not b!934422) (not b_lambda!13995) (not b!934424) b_and!28855 (not start!79488) (not b!934420) (not mapNonEmpty!31989) (not b!934419) (not b!934421) (not b_next!17643) (not b!934427) (not b!934431) (not b!934418) tp_is_empty!20151)
(check-sat b_and!28855 (not b_next!17643))
