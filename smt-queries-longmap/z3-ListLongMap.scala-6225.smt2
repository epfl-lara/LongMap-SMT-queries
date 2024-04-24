; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79790 () Bool)

(assert start!79790)

(declare-fun b_free!17671 () Bool)

(declare-fun b_next!17671 () Bool)

(assert (=> start!79790 (= b_free!17671 (not b_next!17671))))

(declare-fun tp!61469 () Bool)

(declare-fun b_and!28943 () Bool)

(assert (=> start!79790 (= tp!61469 b_and!28943)))

(declare-fun b!936654 () Bool)

(declare-fun res!630462 () Bool)

(declare-fun e!526038 () Bool)

(assert (=> b!936654 (=> (not res!630462) (not e!526038))))

(declare-datatypes ((array!56351 0))(
  ( (array!56352 (arr!27111 (Array (_ BitVec 32) (_ BitVec 64))) (size!27571 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56351)

(declare-datatypes ((List!19073 0))(
  ( (Nil!19070) (Cons!19069 (h!20221 (_ BitVec 64)) (t!27280 List!19073)) )
))
(declare-fun arrayNoDuplicates!0 (array!56351 (_ BitVec 32) List!19073) Bool)

(assert (=> b!936654 (= res!630462 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19070))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!526033 () Bool)

(declare-fun b!936655 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936655 (= e!526033 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!32040 () Bool)

(declare-fun mapRes!32040 () Bool)

(assert (=> mapIsEmpty!32040 mapRes!32040))

(declare-fun b!936656 () Bool)

(declare-fun res!630469 () Bool)

(declare-fun e!526036 () Bool)

(assert (=> b!936656 (=> (not res!630469) (not e!526036))))

(assert (=> b!936656 (= res!630469 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936657 () Bool)

(declare-fun e!526037 () Bool)

(declare-fun tp_is_empty!20179 () Bool)

(assert (=> b!936657 (= e!526037 tp_is_empty!20179)))

(declare-fun b!936658 () Bool)

(declare-fun e!526031 () Bool)

(assert (=> b!936658 (= e!526031 (and e!526037 mapRes!32040))))

(declare-fun condMapEmpty!32040 () Bool)

(declare-datatypes ((V!31871 0))(
  ( (V!31872 (val!10140 Int)) )
))
(declare-datatypes ((ValueCell!9608 0))(
  ( (ValueCellFull!9608 (v!12662 V!31871)) (EmptyCell!9608) )
))
(declare-datatypes ((array!56353 0))(
  ( (array!56354 (arr!27112 (Array (_ BitVec 32) ValueCell!9608)) (size!27572 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56353)

(declare-fun mapDefault!32040 () ValueCell!9608)

(assert (=> b!936658 (= condMapEmpty!32040 (= (arr!27112 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9608)) mapDefault!32040)))))

(declare-fun b!936659 () Bool)

(assert (=> b!936659 (= e!526038 e!526036)))

(declare-fun res!630461 () Bool)

(assert (=> b!936659 (=> (not res!630461) (not e!526036))))

(declare-datatypes ((tuple2!13292 0))(
  ( (tuple2!13293 (_1!6657 (_ BitVec 64)) (_2!6657 V!31871)) )
))
(declare-datatypes ((List!19074 0))(
  ( (Nil!19071) (Cons!19070 (h!20222 tuple2!13292) (t!27281 List!19074)) )
))
(declare-datatypes ((ListLongMap!11991 0))(
  ( (ListLongMap!11992 (toList!6011 List!19074)) )
))
(declare-fun lt!422177 () ListLongMap!11991)

(declare-fun contains!5082 (ListLongMap!11991 (_ BitVec 64)) Bool)

(assert (=> b!936659 (= res!630461 (contains!5082 lt!422177 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31871)

(declare-fun minValue!1173 () V!31871)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3249 (array!56351 array!56353 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 32) Int) ListLongMap!11991)

(assert (=> b!936659 (= lt!422177 (getCurrentListMap!3249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936660 () Bool)

(declare-fun e!526034 () Bool)

(assert (=> b!936660 (= e!526034 tp_is_empty!20179)))

(declare-fun res!630459 () Bool)

(assert (=> start!79790 (=> (not res!630459) (not e!526038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79790 (= res!630459 (validMask!0 mask!1881))))

(assert (=> start!79790 e!526038))

(assert (=> start!79790 true))

(assert (=> start!79790 tp_is_empty!20179))

(declare-fun array_inv!21176 (array!56353) Bool)

(assert (=> start!79790 (and (array_inv!21176 _values!1231) e!526031)))

(assert (=> start!79790 tp!61469))

(declare-fun array_inv!21177 (array!56351) Bool)

(assert (=> start!79790 (array_inv!21177 _keys!1487)))

(declare-fun b!936661 () Bool)

(declare-fun res!630466 () Bool)

(assert (=> b!936661 (=> (not res!630466) (not e!526038))))

(assert (=> b!936661 (= res!630466 (and (= (size!27572 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27571 _keys!1487) (size!27572 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936662 () Bool)

(declare-fun res!630465 () Bool)

(assert (=> b!936662 (=> (not res!630465) (not e!526036))))

(declare-fun v!791 () V!31871)

(declare-fun apply!832 (ListLongMap!11991 (_ BitVec 64)) V!31871)

(assert (=> b!936662 (= res!630465 (= (apply!832 lt!422177 k0!1099) v!791))))

(declare-fun b!936663 () Bool)

(assert (=> b!936663 (= e!526033 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32040 () Bool)

(declare-fun tp!61470 () Bool)

(assert (=> mapNonEmpty!32040 (= mapRes!32040 (and tp!61470 e!526034))))

(declare-fun mapKey!32040 () (_ BitVec 32))

(declare-fun mapValue!32040 () ValueCell!9608)

(declare-fun mapRest!32040 () (Array (_ BitVec 32) ValueCell!9608))

(assert (=> mapNonEmpty!32040 (= (arr!27112 _values!1231) (store mapRest!32040 mapKey!32040 mapValue!32040))))

(declare-fun b!936664 () Bool)

(declare-fun e!526030 () Bool)

(assert (=> b!936664 (= e!526036 e!526030)))

(declare-fun res!630470 () Bool)

(assert (=> b!936664 (=> (not res!630470) (not e!526030))))

(declare-fun lt!422175 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936664 (= res!630470 (validKeyInArray!0 lt!422175))))

(assert (=> b!936664 (= lt!422175 (select (arr!27111 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936665 () Bool)

(declare-fun e!526032 () Bool)

(assert (=> b!936665 (= e!526030 (not e!526032))))

(declare-fun res!630464 () Bool)

(assert (=> b!936665 (=> res!630464 e!526032)))

(assert (=> b!936665 (= res!630464 (or (bvsge (size!27571 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27571 _keys!1487))))))

(assert (=> b!936665 e!526033))

(declare-fun c!97620 () Bool)

(assert (=> b!936665 (= c!97620 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31552 0))(
  ( (Unit!31553) )
))
(declare-fun lt!422180 () Unit!31552)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!285 (array!56351 array!56353 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 64) (_ BitVec 32) Int) Unit!31552)

(assert (=> b!936665 (= lt!422180 (lemmaListMapContainsThenArrayContainsFrom!285 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936665 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19070)))

(declare-fun lt!422174 () Unit!31552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56351 (_ BitVec 32) (_ BitVec 32)) Unit!31552)

(assert (=> b!936665 (= lt!422174 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422179 () tuple2!13292)

(declare-fun +!2831 (ListLongMap!11991 tuple2!13292) ListLongMap!11991)

(assert (=> b!936665 (contains!5082 (+!2831 lt!422177 lt!422179) k0!1099)))

(declare-fun lt!422176 () V!31871)

(declare-fun lt!422173 () Unit!31552)

(declare-fun addStillContains!534 (ListLongMap!11991 (_ BitVec 64) V!31871 (_ BitVec 64)) Unit!31552)

(assert (=> b!936665 (= lt!422173 (addStillContains!534 lt!422177 lt!422175 lt!422176 k0!1099))))

(assert (=> b!936665 (= (getCurrentListMap!3249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2831 (getCurrentListMap!3249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422179))))

(assert (=> b!936665 (= lt!422179 (tuple2!13293 lt!422175 lt!422176))))

(declare-fun get!14305 (ValueCell!9608 V!31871) V!31871)

(declare-fun dynLambda!1628 (Int (_ BitVec 64)) V!31871)

(assert (=> b!936665 (= lt!422176 (get!14305 (select (arr!27112 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1628 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422178 () Unit!31552)

(declare-fun lemmaListMapRecursiveValidKeyArray!211 (array!56351 array!56353 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 32) Int) Unit!31552)

(assert (=> b!936665 (= lt!422178 (lemmaListMapRecursiveValidKeyArray!211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936666 () Bool)

(declare-fun res!630468 () Bool)

(assert (=> b!936666 (=> res!630468 e!526032)))

(declare-fun contains!5083 (List!19073 (_ BitVec 64)) Bool)

(assert (=> b!936666 (= res!630468 (contains!5083 Nil!19070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936667 () Bool)

(declare-fun res!630460 () Bool)

(assert (=> b!936667 (=> (not res!630460) (not e!526036))))

(assert (=> b!936667 (= res!630460 (validKeyInArray!0 k0!1099))))

(declare-fun b!936668 () Bool)

(declare-fun res!630463 () Bool)

(assert (=> b!936668 (=> (not res!630463) (not e!526038))))

(assert (=> b!936668 (= res!630463 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27571 _keys!1487))))))

(declare-fun b!936669 () Bool)

(declare-fun res!630471 () Bool)

(assert (=> b!936669 (=> res!630471 e!526032)))

(declare-fun noDuplicate!1364 (List!19073) Bool)

(assert (=> b!936669 (= res!630471 (not (noDuplicate!1364 Nil!19070)))))

(declare-fun b!936670 () Bool)

(declare-fun res!630467 () Bool)

(assert (=> b!936670 (=> (not res!630467) (not e!526038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56351 (_ BitVec 32)) Bool)

(assert (=> b!936670 (= res!630467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936671 () Bool)

(assert (=> b!936671 (= e!526032 true)))

(declare-fun lt!422181 () Bool)

(assert (=> b!936671 (= lt!422181 (contains!5083 Nil!19070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!79790 res!630459) b!936661))

(assert (= (and b!936661 res!630466) b!936670))

(assert (= (and b!936670 res!630467) b!936654))

(assert (= (and b!936654 res!630462) b!936668))

(assert (= (and b!936668 res!630463) b!936659))

(assert (= (and b!936659 res!630461) b!936662))

(assert (= (and b!936662 res!630465) b!936656))

(assert (= (and b!936656 res!630469) b!936667))

(assert (= (and b!936667 res!630460) b!936664))

(assert (= (and b!936664 res!630470) b!936665))

(assert (= (and b!936665 c!97620) b!936655))

(assert (= (and b!936665 (not c!97620)) b!936663))

(assert (= (and b!936665 (not res!630464)) b!936669))

(assert (= (and b!936669 (not res!630471)) b!936666))

(assert (= (and b!936666 (not res!630468)) b!936671))

(assert (= (and b!936658 condMapEmpty!32040) mapIsEmpty!32040))

(assert (= (and b!936658 (not condMapEmpty!32040)) mapNonEmpty!32040))

(get-info :version)

(assert (= (and mapNonEmpty!32040 ((_ is ValueCellFull!9608) mapValue!32040)) b!936660))

(assert (= (and b!936658 ((_ is ValueCellFull!9608) mapDefault!32040)) b!936657))

(assert (= start!79790 b!936658))

(declare-fun b_lambda!14091 () Bool)

(assert (=> (not b_lambda!14091) (not b!936665)))

(declare-fun t!27279 () Bool)

(declare-fun tb!6057 () Bool)

(assert (=> (and start!79790 (= defaultEntry!1235 defaultEntry!1235) t!27279) tb!6057))

(declare-fun result!11955 () Bool)

(assert (=> tb!6057 (= result!11955 tp_is_empty!20179)))

(assert (=> b!936665 t!27279))

(declare-fun b_and!28945 () Bool)

(assert (= b_and!28943 (and (=> t!27279 result!11955) b_and!28945)))

(declare-fun m!871559 () Bool)

(assert (=> b!936669 m!871559))

(declare-fun m!871561 () Bool)

(assert (=> mapNonEmpty!32040 m!871561))

(declare-fun m!871563 () Bool)

(assert (=> b!936655 m!871563))

(declare-fun m!871565 () Bool)

(assert (=> b!936671 m!871565))

(declare-fun m!871567 () Bool)

(assert (=> b!936659 m!871567))

(declare-fun m!871569 () Bool)

(assert (=> b!936659 m!871569))

(declare-fun m!871571 () Bool)

(assert (=> start!79790 m!871571))

(declare-fun m!871573 () Bool)

(assert (=> start!79790 m!871573))

(declare-fun m!871575 () Bool)

(assert (=> start!79790 m!871575))

(declare-fun m!871577 () Bool)

(assert (=> b!936654 m!871577))

(declare-fun m!871579 () Bool)

(assert (=> b!936665 m!871579))

(declare-fun m!871581 () Bool)

(assert (=> b!936665 m!871581))

(declare-fun m!871583 () Bool)

(assert (=> b!936665 m!871583))

(declare-fun m!871585 () Bool)

(assert (=> b!936665 m!871585))

(declare-fun m!871587 () Bool)

(assert (=> b!936665 m!871587))

(assert (=> b!936665 m!871581))

(declare-fun m!871589 () Bool)

(assert (=> b!936665 m!871589))

(declare-fun m!871591 () Bool)

(assert (=> b!936665 m!871591))

(declare-fun m!871593 () Bool)

(assert (=> b!936665 m!871593))

(declare-fun m!871595 () Bool)

(assert (=> b!936665 m!871595))

(declare-fun m!871597 () Bool)

(assert (=> b!936665 m!871597))

(declare-fun m!871599 () Bool)

(assert (=> b!936665 m!871599))

(assert (=> b!936665 m!871587))

(assert (=> b!936665 m!871593))

(declare-fun m!871601 () Bool)

(assert (=> b!936665 m!871601))

(declare-fun m!871603 () Bool)

(assert (=> b!936665 m!871603))

(assert (=> b!936665 m!871583))

(declare-fun m!871605 () Bool)

(assert (=> b!936662 m!871605))

(declare-fun m!871607 () Bool)

(assert (=> b!936670 m!871607))

(declare-fun m!871609 () Bool)

(assert (=> b!936664 m!871609))

(declare-fun m!871611 () Bool)

(assert (=> b!936664 m!871611))

(declare-fun m!871613 () Bool)

(assert (=> b!936667 m!871613))

(declare-fun m!871615 () Bool)

(assert (=> b!936666 m!871615))

(check-sat (not b!936667) (not b!936662) (not b!936664) (not b!936666) (not mapNonEmpty!32040) b_and!28945 (not b_lambda!14091) (not b!936655) (not b!936665) tp_is_empty!20179 (not b!936654) (not b!936659) (not b!936670) (not start!79790) (not b!936669) (not b_next!17671) (not b!936671))
(check-sat b_and!28945 (not b_next!17671))
