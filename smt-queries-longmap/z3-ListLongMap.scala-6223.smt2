; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79540 () Bool)

(assert start!79540)

(declare-fun b_free!17661 () Bool)

(declare-fun b_next!17661 () Bool)

(assert (=> start!79540 (= b_free!17661 (not b_next!17661))))

(declare-fun tp!61432 () Bool)

(declare-fun b_and!28897 () Bool)

(assert (=> start!79540 (= tp!61432 b_and!28897)))

(declare-fun b!935058 () Bool)

(declare-fun e!525040 () Bool)

(declare-fun e!525039 () Bool)

(assert (=> b!935058 (= e!525040 e!525039)))

(declare-fun res!629715 () Bool)

(assert (=> b!935058 (=> (not res!629715) (not e!525039))))

(declare-datatypes ((List!19080 0))(
  ( (Nil!19077) (Cons!19076 (h!20222 (_ BitVec 64)) (t!27285 List!19080)) )
))
(declare-fun contains!5067 (List!19080 (_ BitVec 64)) Bool)

(assert (=> b!935058 (= res!629715 (not (contains!5067 Nil!19077 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!629721 () Bool)

(declare-fun e!525038 () Bool)

(assert (=> start!79540 (=> (not res!629721) (not e!525038))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79540 (= res!629721 (validMask!0 mask!1881))))

(assert (=> start!79540 e!525038))

(assert (=> start!79540 true))

(declare-fun tp_is_empty!20169 () Bool)

(assert (=> start!79540 tp_is_empty!20169))

(declare-datatypes ((V!31857 0))(
  ( (V!31858 (val!10135 Int)) )
))
(declare-datatypes ((ValueCell!9603 0))(
  ( (ValueCellFull!9603 (v!12656 V!31857)) (EmptyCell!9603) )
))
(declare-datatypes ((array!56278 0))(
  ( (array!56279 (arr!27081 (Array (_ BitVec 32) ValueCell!9603)) (size!27540 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56278)

(declare-fun e!525041 () Bool)

(declare-fun array_inv!21076 (array!56278) Bool)

(assert (=> start!79540 (and (array_inv!21076 _values!1231) e!525041)))

(assert (=> start!79540 tp!61432))

(declare-datatypes ((array!56280 0))(
  ( (array!56281 (arr!27082 (Array (_ BitVec 32) (_ BitVec 64))) (size!27541 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56280)

(declare-fun array_inv!21077 (array!56280) Bool)

(assert (=> start!79540 (array_inv!21077 _keys!1487)))

(declare-fun b!935059 () Bool)

(declare-fun e!525036 () Bool)

(declare-fun mapRes!32019 () Bool)

(assert (=> b!935059 (= e!525041 (and e!525036 mapRes!32019))))

(declare-fun condMapEmpty!32019 () Bool)

(declare-fun mapDefault!32019 () ValueCell!9603)

(assert (=> b!935059 (= condMapEmpty!32019 (= (arr!27081 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9603)) mapDefault!32019)))))

(declare-fun b!935060 () Bool)

(assert (=> b!935060 (= e!525039 (not (contains!5067 Nil!19077 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935061 () Bool)

(declare-fun res!629714 () Bool)

(assert (=> b!935061 (=> (not res!629714) (not e!525038))))

(declare-fun arrayNoDuplicates!0 (array!56280 (_ BitVec 32) List!19080) Bool)

(assert (=> b!935061 (= res!629714 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19077))))

(declare-fun b!935062 () Bool)

(declare-fun res!629716 () Bool)

(assert (=> b!935062 (=> (not res!629716) (not e!525038))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935062 (= res!629716 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27541 _keys!1487))))))

(declare-fun b!935063 () Bool)

(declare-fun e!525037 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935063 (= e!525037 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935064 () Bool)

(assert (=> b!935064 (= e!525036 tp_is_empty!20169)))

(declare-fun b!935065 () Bool)

(declare-fun e!525042 () Bool)

(assert (=> b!935065 (= e!525042 (not e!525040))))

(declare-fun res!629720 () Bool)

(assert (=> b!935065 (=> res!629720 e!525040)))

(assert (=> b!935065 (= res!629720 (or (bvsge (size!27541 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487))))))

(assert (=> b!935065 e!525037))

(declare-fun c!97229 () Bool)

(assert (=> b!935065 (= c!97229 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31545 0))(
  ( (Unit!31546) )
))
(declare-fun lt!421352 () Unit!31545)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31857)

(declare-fun minValue!1173 () V!31857)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!282 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 64) (_ BitVec 32) Int) Unit!31545)

(assert (=> b!935065 (= lt!421352 (lemmaListMapContainsThenArrayContainsFrom!282 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!935065 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19077)))

(declare-fun lt!421349 () Unit!31545)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56280 (_ BitVec 32) (_ BitVec 32)) Unit!31545)

(assert (=> b!935065 (= lt!421349 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13300 0))(
  ( (tuple2!13301 (_1!6661 (_ BitVec 64)) (_2!6661 V!31857)) )
))
(declare-datatypes ((List!19081 0))(
  ( (Nil!19078) (Cons!19077 (h!20223 tuple2!13300) (t!27286 List!19081)) )
))
(declare-datatypes ((ListLongMap!11997 0))(
  ( (ListLongMap!11998 (toList!6014 List!19081)) )
))
(declare-fun lt!421354 () ListLongMap!11997)

(declare-fun lt!421353 () tuple2!13300)

(declare-fun contains!5068 (ListLongMap!11997 (_ BitVec 64)) Bool)

(declare-fun +!2810 (ListLongMap!11997 tuple2!13300) ListLongMap!11997)

(assert (=> b!935065 (contains!5068 (+!2810 lt!421354 lt!421353) k0!1099)))

(declare-fun lt!421351 () V!31857)

(declare-fun lt!421348 () (_ BitVec 64))

(declare-fun lt!421350 () Unit!31545)

(declare-fun addStillContains!529 (ListLongMap!11997 (_ BitVec 64) V!31857 (_ BitVec 64)) Unit!31545)

(assert (=> b!935065 (= lt!421350 (addStillContains!529 lt!421354 lt!421348 lt!421351 k0!1099))))

(declare-fun getCurrentListMap!3251 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 32) Int) ListLongMap!11997)

(assert (=> b!935065 (= (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2810 (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421353))))

(assert (=> b!935065 (= lt!421353 (tuple2!13301 lt!421348 lt!421351))))

(declare-fun get!14262 (ValueCell!9603 V!31857) V!31857)

(declare-fun dynLambda!1599 (Int (_ BitVec 64)) V!31857)

(assert (=> b!935065 (= lt!421351 (get!14262 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421347 () Unit!31545)

(declare-fun lemmaListMapRecursiveValidKeyArray!200 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 32) Int) Unit!31545)

(assert (=> b!935065 (= lt!421347 (lemmaListMapRecursiveValidKeyArray!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935066 () Bool)

(declare-fun res!629722 () Bool)

(assert (=> b!935066 (=> (not res!629722) (not e!525038))))

(assert (=> b!935066 (= res!629722 (and (= (size!27540 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27541 _keys!1487) (size!27540 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935067 () Bool)

(declare-fun e!525035 () Bool)

(assert (=> b!935067 (= e!525035 e!525042)))

(declare-fun res!629724 () Bool)

(assert (=> b!935067 (=> (not res!629724) (not e!525042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935067 (= res!629724 (validKeyInArray!0 lt!421348))))

(assert (=> b!935067 (= lt!421348 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935068 () Bool)

(declare-fun res!629723 () Bool)

(assert (=> b!935068 (=> res!629723 e!525040)))

(declare-fun noDuplicate!1351 (List!19080) Bool)

(assert (=> b!935068 (= res!629723 (not (noDuplicate!1351 Nil!19077)))))

(declare-fun mapNonEmpty!32019 () Bool)

(declare-fun tp!61433 () Bool)

(declare-fun e!525034 () Bool)

(assert (=> mapNonEmpty!32019 (= mapRes!32019 (and tp!61433 e!525034))))

(declare-fun mapKey!32019 () (_ BitVec 32))

(declare-fun mapRest!32019 () (Array (_ BitVec 32) ValueCell!9603))

(declare-fun mapValue!32019 () ValueCell!9603)

(assert (=> mapNonEmpty!32019 (= (arr!27081 _values!1231) (store mapRest!32019 mapKey!32019 mapValue!32019))))

(declare-fun b!935069 () Bool)

(declare-fun res!629718 () Bool)

(assert (=> b!935069 (=> (not res!629718) (not e!525035))))

(declare-fun v!791 () V!31857)

(declare-fun apply!817 (ListLongMap!11997 (_ BitVec 64)) V!31857)

(assert (=> b!935069 (= res!629718 (= (apply!817 lt!421354 k0!1099) v!791))))

(declare-fun b!935070 () Bool)

(declare-fun res!629725 () Bool)

(assert (=> b!935070 (=> (not res!629725) (not e!525035))))

(assert (=> b!935070 (= res!629725 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935071 () Bool)

(declare-fun res!629719 () Bool)

(assert (=> b!935071 (=> (not res!629719) (not e!525035))))

(assert (=> b!935071 (= res!629719 (validKeyInArray!0 k0!1099))))

(declare-fun b!935072 () Bool)

(declare-fun res!629713 () Bool)

(assert (=> b!935072 (=> (not res!629713) (not e!525038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56280 (_ BitVec 32)) Bool)

(assert (=> b!935072 (= res!629713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935073 () Bool)

(assert (=> b!935073 (= e!525034 tp_is_empty!20169)))

(declare-fun b!935074 () Bool)

(declare-fun arrayContainsKey!0 (array!56280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935074 (= e!525037 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!32019 () Bool)

(assert (=> mapIsEmpty!32019 mapRes!32019))

(declare-fun b!935075 () Bool)

(assert (=> b!935075 (= e!525038 e!525035)))

(declare-fun res!629717 () Bool)

(assert (=> b!935075 (=> (not res!629717) (not e!525035))))

(assert (=> b!935075 (= res!629717 (contains!5068 lt!421354 k0!1099))))

(assert (=> b!935075 (= lt!421354 (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79540 res!629721) b!935066))

(assert (= (and b!935066 res!629722) b!935072))

(assert (= (and b!935072 res!629713) b!935061))

(assert (= (and b!935061 res!629714) b!935062))

(assert (= (and b!935062 res!629716) b!935075))

(assert (= (and b!935075 res!629717) b!935069))

(assert (= (and b!935069 res!629718) b!935070))

(assert (= (and b!935070 res!629725) b!935071))

(assert (= (and b!935071 res!629719) b!935067))

(assert (= (and b!935067 res!629724) b!935065))

(assert (= (and b!935065 c!97229) b!935074))

(assert (= (and b!935065 (not c!97229)) b!935063))

(assert (= (and b!935065 (not res!629720)) b!935068))

(assert (= (and b!935068 (not res!629723)) b!935058))

(assert (= (and b!935058 res!629715) b!935060))

(assert (= (and b!935059 condMapEmpty!32019) mapIsEmpty!32019))

(assert (= (and b!935059 (not condMapEmpty!32019)) mapNonEmpty!32019))

(get-info :version)

(assert (= (and mapNonEmpty!32019 ((_ is ValueCellFull!9603) mapValue!32019)) b!935073))

(assert (= (and b!935059 ((_ is ValueCellFull!9603) mapDefault!32019)) b!935064))

(assert (= start!79540 b!935059))

(declare-fun b_lambda!14031 () Bool)

(assert (=> (not b_lambda!14031) (not b!935065)))

(declare-fun t!27284 () Bool)

(declare-fun tb!6055 () Bool)

(assert (=> (and start!79540 (= defaultEntry!1235 defaultEntry!1235) t!27284) tb!6055))

(declare-fun result!11939 () Bool)

(assert (=> tb!6055 (= result!11939 tp_is_empty!20169)))

(assert (=> b!935065 t!27284))

(declare-fun b_and!28899 () Bool)

(assert (= b_and!28897 (and (=> t!27284 result!11939) b_and!28899)))

(declare-fun m!869443 () Bool)

(assert (=> b!935069 m!869443))

(declare-fun m!869445 () Bool)

(assert (=> b!935067 m!869445))

(declare-fun m!869447 () Bool)

(assert (=> b!935067 m!869447))

(declare-fun m!869449 () Bool)

(assert (=> b!935075 m!869449))

(declare-fun m!869451 () Bool)

(assert (=> b!935075 m!869451))

(declare-fun m!869453 () Bool)

(assert (=> b!935065 m!869453))

(declare-fun m!869455 () Bool)

(assert (=> b!935065 m!869455))

(declare-fun m!869457 () Bool)

(assert (=> b!935065 m!869457))

(declare-fun m!869459 () Bool)

(assert (=> b!935065 m!869459))

(declare-fun m!869461 () Bool)

(assert (=> b!935065 m!869461))

(declare-fun m!869463 () Bool)

(assert (=> b!935065 m!869463))

(assert (=> b!935065 m!869459))

(declare-fun m!869465 () Bool)

(assert (=> b!935065 m!869465))

(declare-fun m!869467 () Bool)

(assert (=> b!935065 m!869467))

(declare-fun m!869469 () Bool)

(assert (=> b!935065 m!869469))

(declare-fun m!869471 () Bool)

(assert (=> b!935065 m!869471))

(declare-fun m!869473 () Bool)

(assert (=> b!935065 m!869473))

(assert (=> b!935065 m!869465))

(assert (=> b!935065 m!869453))

(declare-fun m!869475 () Bool)

(assert (=> b!935065 m!869475))

(assert (=> b!935065 m!869461))

(declare-fun m!869477 () Bool)

(assert (=> b!935065 m!869477))

(declare-fun m!869479 () Bool)

(assert (=> b!935060 m!869479))

(declare-fun m!869481 () Bool)

(assert (=> b!935071 m!869481))

(declare-fun m!869483 () Bool)

(assert (=> b!935072 m!869483))

(declare-fun m!869485 () Bool)

(assert (=> mapNonEmpty!32019 m!869485))

(declare-fun m!869487 () Bool)

(assert (=> b!935058 m!869487))

(declare-fun m!869489 () Bool)

(assert (=> b!935061 m!869489))

(declare-fun m!869491 () Bool)

(assert (=> start!79540 m!869491))

(declare-fun m!869493 () Bool)

(assert (=> start!79540 m!869493))

(declare-fun m!869495 () Bool)

(assert (=> start!79540 m!869495))

(declare-fun m!869497 () Bool)

(assert (=> b!935074 m!869497))

(declare-fun m!869499 () Bool)

(assert (=> b!935068 m!869499))

(check-sat (not b_next!17661) (not b!935061) (not b!935071) b_and!28899 (not b!935068) (not b!935060) (not b!935075) (not b!935058) (not b!935074) (not b!935067) (not b_lambda!14031) (not start!79540) tp_is_empty!20169 (not b!935069) (not b!935065) (not mapNonEmpty!32019) (not b!935072))
(check-sat b_and!28899 (not b_next!17661))
(get-model)

(declare-fun b_lambda!14035 () Bool)

(assert (= b_lambda!14031 (or (and start!79540 b_free!17661) b_lambda!14035)))

(check-sat (not b_next!17661) (not b!935061) b_and!28899 (not b!935068) (not b!935060) (not b!935075) (not b!935058) (not b!935074) (not b!935067) (not start!79540) tp_is_empty!20169 (not b!935069) (not b!935065) (not b_lambda!14035) (not b!935071) (not mapNonEmpty!32019) (not b!935072))
(check-sat b_and!28899 (not b_next!17661))
(get-model)

(declare-fun d!113195 () Bool)

(assert (=> d!113195 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935071 d!113195))

(declare-fun b!935144 () Bool)

(declare-fun e!525083 () Bool)

(declare-fun e!525084 () Bool)

(assert (=> b!935144 (= e!525083 e!525084)))

(declare-fun c!97235 () Bool)

(assert (=> b!935144 (= c!97235 (validKeyInArray!0 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935145 () Bool)

(declare-fun call!40677 () Bool)

(assert (=> b!935145 (= e!525084 call!40677)))

(declare-fun d!113197 () Bool)

(declare-fun res!629773 () Bool)

(declare-fun e!525082 () Bool)

(assert (=> d!113197 (=> res!629773 e!525082)))

(assert (=> d!113197 (= res!629773 (bvsge #b00000000000000000000000000000000 (size!27541 _keys!1487)))))

(assert (=> d!113197 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19077) e!525082)))

(declare-fun b!935146 () Bool)

(assert (=> b!935146 (= e!525084 call!40677)))

(declare-fun b!935147 () Bool)

(declare-fun e!525081 () Bool)

(assert (=> b!935147 (= e!525081 (contains!5067 Nil!19077 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935148 () Bool)

(assert (=> b!935148 (= e!525082 e!525083)))

(declare-fun res!629771 () Bool)

(assert (=> b!935148 (=> (not res!629771) (not e!525083))))

(assert (=> b!935148 (= res!629771 (not e!525081))))

(declare-fun res!629772 () Bool)

(assert (=> b!935148 (=> (not res!629772) (not e!525081))))

(assert (=> b!935148 (= res!629772 (validKeyInArray!0 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40674 () Bool)

(assert (=> bm!40674 (= call!40677 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97235 (Cons!19076 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000) Nil!19077) Nil!19077)))))

(assert (= (and d!113197 (not res!629773)) b!935148))

(assert (= (and b!935148 res!629772) b!935147))

(assert (= (and b!935148 res!629771) b!935144))

(assert (= (and b!935144 c!97235) b!935146))

(assert (= (and b!935144 (not c!97235)) b!935145))

(assert (= (or b!935146 b!935145) bm!40674))

(declare-fun m!869559 () Bool)

(assert (=> b!935144 m!869559))

(assert (=> b!935144 m!869559))

(declare-fun m!869561 () Bool)

(assert (=> b!935144 m!869561))

(assert (=> b!935147 m!869559))

(assert (=> b!935147 m!869559))

(declare-fun m!869563 () Bool)

(assert (=> b!935147 m!869563))

(assert (=> b!935148 m!869559))

(assert (=> b!935148 m!869559))

(assert (=> b!935148 m!869561))

(assert (=> bm!40674 m!869559))

(declare-fun m!869565 () Bool)

(assert (=> bm!40674 m!869565))

(assert (=> b!935061 d!113197))

(declare-fun d!113199 () Bool)

(declare-fun res!629778 () Bool)

(declare-fun e!525091 () Bool)

(assert (=> d!113199 (=> res!629778 e!525091)))

(assert (=> d!113199 (= res!629778 (bvsge #b00000000000000000000000000000000 (size!27541 _keys!1487)))))

(assert (=> d!113199 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525091)))

(declare-fun b!935157 () Bool)

(declare-fun e!525092 () Bool)

(declare-fun e!525093 () Bool)

(assert (=> b!935157 (= e!525092 e!525093)))

(declare-fun lt!421386 () (_ BitVec 64))

(assert (=> b!935157 (= lt!421386 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421387 () Unit!31545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56280 (_ BitVec 64) (_ BitVec 32)) Unit!31545)

(assert (=> b!935157 (= lt!421387 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421386 #b00000000000000000000000000000000))))

(assert (=> b!935157 (arrayContainsKey!0 _keys!1487 lt!421386 #b00000000000000000000000000000000)))

(declare-fun lt!421385 () Unit!31545)

(assert (=> b!935157 (= lt!421385 lt!421387)))

(declare-fun res!629779 () Bool)

(declare-datatypes ((SeekEntryResult!8979 0))(
  ( (MissingZero!8979 (index!38287 (_ BitVec 32))) (Found!8979 (index!38288 (_ BitVec 32))) (Intermediate!8979 (undefined!9791 Bool) (index!38289 (_ BitVec 32)) (x!80200 (_ BitVec 32))) (Undefined!8979) (MissingVacant!8979 (index!38290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56280 (_ BitVec 32)) SeekEntryResult!8979)

(assert (=> b!935157 (= res!629779 (= (seekEntryOrOpen!0 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8979 #b00000000000000000000000000000000)))))

(assert (=> b!935157 (=> (not res!629779) (not e!525093))))

(declare-fun b!935158 () Bool)

(assert (=> b!935158 (= e!525091 e!525092)))

(declare-fun c!97238 () Bool)

(assert (=> b!935158 (= c!97238 (validKeyInArray!0 (select (arr!27082 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935159 () Bool)

(declare-fun call!40680 () Bool)

(assert (=> b!935159 (= e!525093 call!40680)))

(declare-fun bm!40677 () Bool)

(assert (=> bm!40677 (= call!40680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!935160 () Bool)

(assert (=> b!935160 (= e!525092 call!40680)))

(assert (= (and d!113199 (not res!629778)) b!935158))

(assert (= (and b!935158 c!97238) b!935157))

(assert (= (and b!935158 (not c!97238)) b!935160))

(assert (= (and b!935157 res!629779) b!935159))

(assert (= (or b!935159 b!935160) bm!40677))

(assert (=> b!935157 m!869559))

(declare-fun m!869567 () Bool)

(assert (=> b!935157 m!869567))

(declare-fun m!869569 () Bool)

(assert (=> b!935157 m!869569))

(assert (=> b!935157 m!869559))

(declare-fun m!869571 () Bool)

(assert (=> b!935157 m!869571))

(assert (=> b!935158 m!869559))

(assert (=> b!935158 m!869559))

(assert (=> b!935158 m!869561))

(declare-fun m!869573 () Bool)

(assert (=> bm!40677 m!869573))

(assert (=> b!935072 d!113199))

(declare-fun d!113201 () Bool)

(declare-fun res!629784 () Bool)

(declare-fun e!525098 () Bool)

(assert (=> d!113201 (=> res!629784 e!525098)))

(assert (=> d!113201 (= res!629784 (= (select (arr!27082 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113201 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525098)))

(declare-fun b!935165 () Bool)

(declare-fun e!525099 () Bool)

(assert (=> b!935165 (= e!525098 e!525099)))

(declare-fun res!629785 () Bool)

(assert (=> b!935165 (=> (not res!629785) (not e!525099))))

(assert (=> b!935165 (= res!629785 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(declare-fun b!935166 () Bool)

(assert (=> b!935166 (= e!525099 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113201 (not res!629784)) b!935165))

(assert (= (and b!935165 res!629785) b!935166))

(declare-fun m!869575 () Bool)

(assert (=> d!113201 m!869575))

(declare-fun m!869577 () Bool)

(assert (=> b!935166 m!869577))

(assert (=> b!935074 d!113201))

(declare-fun d!113203 () Bool)

(assert (=> d!113203 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79540 d!113203))

(declare-fun d!113205 () Bool)

(assert (=> d!113205 (= (array_inv!21076 _values!1231) (bvsge (size!27540 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79540 d!113205))

(declare-fun d!113207 () Bool)

(assert (=> d!113207 (= (array_inv!21077 _keys!1487) (bvsge (size!27541 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79540 d!113207))

(declare-fun d!113209 () Bool)

(assert (=> d!113209 (contains!5068 (+!2810 lt!421354 (tuple2!13301 lt!421348 lt!421351)) k0!1099)))

(declare-fun lt!421390 () Unit!31545)

(declare-fun choose!1547 (ListLongMap!11997 (_ BitVec 64) V!31857 (_ BitVec 64)) Unit!31545)

(assert (=> d!113209 (= lt!421390 (choose!1547 lt!421354 lt!421348 lt!421351 k0!1099))))

(assert (=> d!113209 (contains!5068 lt!421354 k0!1099)))

(assert (=> d!113209 (= (addStillContains!529 lt!421354 lt!421348 lt!421351 k0!1099) lt!421390)))

(declare-fun bs!26251 () Bool)

(assert (= bs!26251 d!113209))

(declare-fun m!869579 () Bool)

(assert (=> bs!26251 m!869579))

(assert (=> bs!26251 m!869579))

(declare-fun m!869581 () Bool)

(assert (=> bs!26251 m!869581))

(declare-fun m!869583 () Bool)

(assert (=> bs!26251 m!869583))

(assert (=> bs!26251 m!869449))

(assert (=> b!935065 d!113209))

(declare-fun b!935210 () Bool)

(declare-fun e!525126 () Bool)

(assert (=> b!935210 (= e!525126 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935211 () Bool)

(declare-fun e!525133 () ListLongMap!11997)

(declare-fun call!40700 () ListLongMap!11997)

(assert (=> b!935211 (= e!525133 call!40700)))

(declare-fun b!935212 () Bool)

(declare-fun res!629807 () Bool)

(declare-fun e!525131 () Bool)

(assert (=> b!935212 (=> (not res!629807) (not e!525131))))

(declare-fun e!525129 () Bool)

(assert (=> b!935212 (= res!629807 e!525129)))

(declare-fun c!97251 () Bool)

(assert (=> b!935212 (= c!97251 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935213 () Bool)

(declare-fun c!97254 () Bool)

(assert (=> b!935213 (= c!97254 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525134 () ListLongMap!11997)

(assert (=> b!935213 (= e!525134 e!525133)))

(declare-fun b!935214 () Bool)

(declare-fun e!525138 () Bool)

(declare-fun lt!421445 () ListLongMap!11997)

(assert (=> b!935214 (= e!525138 (= (apply!817 lt!421445 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935215 () Bool)

(assert (=> b!935215 (= e!525129 e!525138)))

(declare-fun res!629805 () Bool)

(declare-fun call!40701 () Bool)

(assert (=> b!935215 (= res!629805 call!40701)))

(assert (=> b!935215 (=> (not res!629805) (not e!525138))))

(declare-fun b!935216 () Bool)

(declare-fun call!40695 () ListLongMap!11997)

(assert (=> b!935216 (= e!525134 call!40695)))

(declare-fun call!40697 () ListLongMap!11997)

(declare-fun bm!40692 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3301 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 32) Int) ListLongMap!11997)

(assert (=> bm!40692 (= call!40697 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935217 () Bool)

(declare-fun e!525130 () Bool)

(declare-fun e!525128 () Bool)

(assert (=> b!935217 (= e!525130 e!525128)))

(declare-fun res!629806 () Bool)

(assert (=> b!935217 (=> (not res!629806) (not e!525128))))

(assert (=> b!935217 (= res!629806 (contains!5068 lt!421445 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935217 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(declare-fun bm!40693 () Bool)

(declare-fun call!40699 () Bool)

(assert (=> bm!40693 (= call!40699 (contains!5068 lt!421445 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935218 () Bool)

(assert (=> b!935218 (= e!525133 call!40695)))

(declare-fun b!935219 () Bool)

(declare-fun res!629810 () Bool)

(assert (=> b!935219 (=> (not res!629810) (not e!525131))))

(assert (=> b!935219 (= res!629810 e!525130)))

(declare-fun res!629808 () Bool)

(assert (=> b!935219 (=> res!629808 e!525130)))

(assert (=> b!935219 (= res!629808 (not e!525126))))

(declare-fun res!629812 () Bool)

(assert (=> b!935219 (=> (not res!629812) (not e!525126))))

(assert (=> b!935219 (= res!629812 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(declare-fun b!935220 () Bool)

(declare-fun e!525136 () Bool)

(assert (=> b!935220 (= e!525136 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40694 () Bool)

(declare-fun call!40698 () ListLongMap!11997)

(assert (=> bm!40694 (= call!40700 call!40698)))

(declare-fun b!935221 () Bool)

(assert (=> b!935221 (= e!525128 (= (apply!817 lt!421445 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14262 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935221 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27540 _values!1231)))))

(assert (=> b!935221 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(declare-fun b!935222 () Bool)

(declare-fun e!525137 () Bool)

(assert (=> b!935222 (= e!525131 e!525137)))

(declare-fun c!97256 () Bool)

(assert (=> b!935222 (= c!97256 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!113211 () Bool)

(assert (=> d!113211 e!525131))

(declare-fun res!629811 () Bool)

(assert (=> d!113211 (=> (not res!629811) (not e!525131))))

(assert (=> d!113211 (= res!629811 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))))

(declare-fun lt!421450 () ListLongMap!11997)

(assert (=> d!113211 (= lt!421445 lt!421450)))

(declare-fun lt!421454 () Unit!31545)

(declare-fun e!525132 () Unit!31545)

(assert (=> d!113211 (= lt!421454 e!525132)))

(declare-fun c!97253 () Bool)

(assert (=> d!113211 (= c!97253 e!525136)))

(declare-fun res!629804 () Bool)

(assert (=> d!113211 (=> (not res!629804) (not e!525136))))

(assert (=> d!113211 (= res!629804 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(declare-fun e!525135 () ListLongMap!11997)

(assert (=> d!113211 (= lt!421450 e!525135)))

(declare-fun c!97255 () Bool)

(assert (=> d!113211 (= c!97255 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113211 (validMask!0 mask!1881)))

(assert (=> d!113211 (= (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421445)))

(declare-fun bm!40695 () Bool)

(declare-fun call!40696 () ListLongMap!11997)

(assert (=> bm!40695 (= call!40695 call!40696)))

(declare-fun b!935223 () Bool)

(declare-fun e!525127 () Bool)

(assert (=> b!935223 (= e!525127 (= (apply!817 lt!421445 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun c!97252 () Bool)

(declare-fun bm!40696 () Bool)

(assert (=> bm!40696 (= call!40696 (+!2810 (ite c!97255 call!40697 (ite c!97252 call!40698 call!40700)) (ite (or c!97255 c!97252) (tuple2!13301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935224 () Bool)

(declare-fun lt!421449 () Unit!31545)

(assert (=> b!935224 (= e!525132 lt!421449)))

(declare-fun lt!421443 () ListLongMap!11997)

(assert (=> b!935224 (= lt!421443 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421452 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421451 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421451 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421435 () Unit!31545)

(assert (=> b!935224 (= lt!421435 (addStillContains!529 lt!421443 lt!421452 zeroValue!1173 lt!421451))))

(assert (=> b!935224 (contains!5068 (+!2810 lt!421443 (tuple2!13301 lt!421452 zeroValue!1173)) lt!421451)))

(declare-fun lt!421436 () Unit!31545)

(assert (=> b!935224 (= lt!421436 lt!421435)))

(declare-fun lt!421442 () ListLongMap!11997)

(assert (=> b!935224 (= lt!421442 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421439 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421439 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421437 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421437 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421455 () Unit!31545)

(declare-fun addApplyDifferent!420 (ListLongMap!11997 (_ BitVec 64) V!31857 (_ BitVec 64)) Unit!31545)

(assert (=> b!935224 (= lt!421455 (addApplyDifferent!420 lt!421442 lt!421439 minValue!1173 lt!421437))))

(assert (=> b!935224 (= (apply!817 (+!2810 lt!421442 (tuple2!13301 lt!421439 minValue!1173)) lt!421437) (apply!817 lt!421442 lt!421437))))

(declare-fun lt!421447 () Unit!31545)

(assert (=> b!935224 (= lt!421447 lt!421455)))

(declare-fun lt!421446 () ListLongMap!11997)

(assert (=> b!935224 (= lt!421446 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421440 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421456 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421456 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421438 () Unit!31545)

(assert (=> b!935224 (= lt!421438 (addApplyDifferent!420 lt!421446 lt!421440 zeroValue!1173 lt!421456))))

(assert (=> b!935224 (= (apply!817 (+!2810 lt!421446 (tuple2!13301 lt!421440 zeroValue!1173)) lt!421456) (apply!817 lt!421446 lt!421456))))

(declare-fun lt!421448 () Unit!31545)

(assert (=> b!935224 (= lt!421448 lt!421438)))

(declare-fun lt!421453 () ListLongMap!11997)

(assert (=> b!935224 (= lt!421453 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421441 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421444 () (_ BitVec 64))

(assert (=> b!935224 (= lt!421444 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!935224 (= lt!421449 (addApplyDifferent!420 lt!421453 lt!421441 minValue!1173 lt!421444))))

(assert (=> b!935224 (= (apply!817 (+!2810 lt!421453 (tuple2!13301 lt!421441 minValue!1173)) lt!421444) (apply!817 lt!421453 lt!421444))))

(declare-fun b!935225 () Bool)

(assert (=> b!935225 (= e!525137 (not call!40699))))

(declare-fun b!935226 () Bool)

(assert (=> b!935226 (= e!525135 e!525134)))

(assert (=> b!935226 (= c!97252 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40697 () Bool)

(assert (=> bm!40697 (= call!40701 (contains!5068 lt!421445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935227 () Bool)

(assert (=> b!935227 (= e!525129 (not call!40701))))

(declare-fun bm!40698 () Bool)

(assert (=> bm!40698 (= call!40698 call!40697)))

(declare-fun b!935228 () Bool)

(assert (=> b!935228 (= e!525135 (+!2810 call!40696 (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935229 () Bool)

(declare-fun Unit!31547 () Unit!31545)

(assert (=> b!935229 (= e!525132 Unit!31547)))

(declare-fun b!935230 () Bool)

(assert (=> b!935230 (= e!525137 e!525127)))

(declare-fun res!629809 () Bool)

(assert (=> b!935230 (= res!629809 call!40699)))

(assert (=> b!935230 (=> (not res!629809) (not e!525127))))

(assert (= (and d!113211 c!97255) b!935228))

(assert (= (and d!113211 (not c!97255)) b!935226))

(assert (= (and b!935226 c!97252) b!935216))

(assert (= (and b!935226 (not c!97252)) b!935213))

(assert (= (and b!935213 c!97254) b!935218))

(assert (= (and b!935213 (not c!97254)) b!935211))

(assert (= (or b!935218 b!935211) bm!40694))

(assert (= (or b!935216 bm!40694) bm!40698))

(assert (= (or b!935216 b!935218) bm!40695))

(assert (= (or b!935228 bm!40698) bm!40692))

(assert (= (or b!935228 bm!40695) bm!40696))

(assert (= (and d!113211 res!629804) b!935220))

(assert (= (and d!113211 c!97253) b!935224))

(assert (= (and d!113211 (not c!97253)) b!935229))

(assert (= (and d!113211 res!629811) b!935219))

(assert (= (and b!935219 res!629812) b!935210))

(assert (= (and b!935219 (not res!629808)) b!935217))

(assert (= (and b!935217 res!629806) b!935221))

(assert (= (and b!935219 res!629810) b!935212))

(assert (= (and b!935212 c!97251) b!935215))

(assert (= (and b!935212 (not c!97251)) b!935227))

(assert (= (and b!935215 res!629805) b!935214))

(assert (= (or b!935215 b!935227) bm!40697))

(assert (= (and b!935212 res!629807) b!935222))

(assert (= (and b!935222 c!97256) b!935230))

(assert (= (and b!935222 (not c!97256)) b!935225))

(assert (= (and b!935230 res!629809) b!935223))

(assert (= (or b!935230 b!935225) bm!40693))

(declare-fun b_lambda!14037 () Bool)

(assert (=> (not b_lambda!14037) (not b!935221)))

(assert (=> b!935221 t!27284))

(declare-fun b_and!28905 () Bool)

(assert (= b_and!28899 (and (=> t!27284 result!11939) b_and!28905)))

(assert (=> b!935220 m!869447))

(assert (=> b!935220 m!869447))

(declare-fun m!869585 () Bool)

(assert (=> b!935220 m!869585))

(declare-fun m!869587 () Bool)

(assert (=> b!935214 m!869587))

(assert (=> d!113211 m!869491))

(declare-fun m!869589 () Bool)

(assert (=> b!935223 m!869589))

(assert (=> b!935217 m!869447))

(assert (=> b!935217 m!869447))

(declare-fun m!869591 () Bool)

(assert (=> b!935217 m!869591))

(declare-fun m!869593 () Bool)

(assert (=> b!935228 m!869593))

(declare-fun m!869595 () Bool)

(assert (=> bm!40697 m!869595))

(assert (=> b!935210 m!869447))

(assert (=> b!935210 m!869447))

(assert (=> b!935210 m!869585))

(declare-fun m!869597 () Bool)

(assert (=> b!935224 m!869597))

(declare-fun m!869599 () Bool)

(assert (=> b!935224 m!869599))

(declare-fun m!869601 () Bool)

(assert (=> b!935224 m!869601))

(declare-fun m!869603 () Bool)

(assert (=> b!935224 m!869603))

(declare-fun m!869605 () Bool)

(assert (=> b!935224 m!869605))

(declare-fun m!869607 () Bool)

(assert (=> b!935224 m!869607))

(assert (=> b!935224 m!869599))

(declare-fun m!869609 () Bool)

(assert (=> b!935224 m!869609))

(declare-fun m!869611 () Bool)

(assert (=> b!935224 m!869611))

(assert (=> b!935224 m!869447))

(declare-fun m!869613 () Bool)

(assert (=> b!935224 m!869613))

(declare-fun m!869615 () Bool)

(assert (=> b!935224 m!869615))

(declare-fun m!869617 () Bool)

(assert (=> b!935224 m!869617))

(assert (=> b!935224 m!869601))

(declare-fun m!869619 () Bool)

(assert (=> b!935224 m!869619))

(declare-fun m!869621 () Bool)

(assert (=> b!935224 m!869621))

(declare-fun m!869623 () Bool)

(assert (=> b!935224 m!869623))

(declare-fun m!869625 () Bool)

(assert (=> b!935224 m!869625))

(assert (=> b!935224 m!869621))

(assert (=> b!935224 m!869597))

(declare-fun m!869627 () Bool)

(assert (=> b!935224 m!869627))

(declare-fun m!869629 () Bool)

(assert (=> bm!40693 m!869629))

(assert (=> b!935221 m!869459))

(assert (=> b!935221 m!869447))

(declare-fun m!869631 () Bool)

(assert (=> b!935221 m!869631))

(assert (=> b!935221 m!869459))

(assert (=> b!935221 m!869465))

(assert (=> b!935221 m!869467))

(assert (=> b!935221 m!869465))

(assert (=> b!935221 m!869447))

(assert (=> bm!40692 m!869615))

(declare-fun m!869633 () Bool)

(assert (=> bm!40696 m!869633))

(assert (=> b!935065 d!113211))

(declare-fun d!113213 () Bool)

(declare-fun e!525141 () Bool)

(assert (=> d!113213 e!525141))

(declare-fun res!629818 () Bool)

(assert (=> d!113213 (=> (not res!629818) (not e!525141))))

(declare-fun lt!421467 () ListLongMap!11997)

(assert (=> d!113213 (= res!629818 (contains!5068 lt!421467 (_1!6661 lt!421353)))))

(declare-fun lt!421466 () List!19081)

(assert (=> d!113213 (= lt!421467 (ListLongMap!11998 lt!421466))))

(declare-fun lt!421468 () Unit!31545)

(declare-fun lt!421465 () Unit!31545)

(assert (=> d!113213 (= lt!421468 lt!421465)))

(declare-datatypes ((Option!487 0))(
  ( (Some!486 (v!12659 V!31857)) (None!485) )
))
(declare-fun getValueByKey!481 (List!19081 (_ BitVec 64)) Option!487)

(assert (=> d!113213 (= (getValueByKey!481 lt!421466 (_1!6661 lt!421353)) (Some!486 (_2!6661 lt!421353)))))

(declare-fun lemmaContainsTupThenGetReturnValue!257 (List!19081 (_ BitVec 64) V!31857) Unit!31545)

(assert (=> d!113213 (= lt!421465 (lemmaContainsTupThenGetReturnValue!257 lt!421466 (_1!6661 lt!421353) (_2!6661 lt!421353)))))

(declare-fun insertStrictlySorted!314 (List!19081 (_ BitVec 64) V!31857) List!19081)

(assert (=> d!113213 (= lt!421466 (insertStrictlySorted!314 (toList!6014 (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6661 lt!421353) (_2!6661 lt!421353)))))

(assert (=> d!113213 (= (+!2810 (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421353) lt!421467)))

(declare-fun b!935235 () Bool)

(declare-fun res!629817 () Bool)

(assert (=> b!935235 (=> (not res!629817) (not e!525141))))

(assert (=> b!935235 (= res!629817 (= (getValueByKey!481 (toList!6014 lt!421467) (_1!6661 lt!421353)) (Some!486 (_2!6661 lt!421353))))))

(declare-fun b!935236 () Bool)

(declare-fun contains!5071 (List!19081 tuple2!13300) Bool)

(assert (=> b!935236 (= e!525141 (contains!5071 (toList!6014 lt!421467) lt!421353))))

(assert (= (and d!113213 res!629818) b!935235))

(assert (= (and b!935235 res!629817) b!935236))

(declare-fun m!869635 () Bool)

(assert (=> d!113213 m!869635))

(declare-fun m!869637 () Bool)

(assert (=> d!113213 m!869637))

(declare-fun m!869639 () Bool)

(assert (=> d!113213 m!869639))

(declare-fun m!869641 () Bool)

(assert (=> d!113213 m!869641))

(declare-fun m!869643 () Bool)

(assert (=> b!935235 m!869643))

(declare-fun m!869645 () Bool)

(assert (=> b!935236 m!869645))

(assert (=> b!935065 d!113213))

(declare-fun b!935237 () Bool)

(declare-fun e!525142 () Bool)

(assert (=> b!935237 (= e!525142 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!935238 () Bool)

(declare-fun e!525149 () ListLongMap!11997)

(declare-fun call!40707 () ListLongMap!11997)

(assert (=> b!935238 (= e!525149 call!40707)))

(declare-fun b!935239 () Bool)

(declare-fun res!629822 () Bool)

(declare-fun e!525147 () Bool)

(assert (=> b!935239 (=> (not res!629822) (not e!525147))))

(declare-fun e!525145 () Bool)

(assert (=> b!935239 (= res!629822 e!525145)))

(declare-fun c!97257 () Bool)

(assert (=> b!935239 (= c!97257 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935240 () Bool)

(declare-fun c!97260 () Bool)

(assert (=> b!935240 (= c!97260 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525150 () ListLongMap!11997)

(assert (=> b!935240 (= e!525150 e!525149)))

(declare-fun b!935241 () Bool)

(declare-fun e!525154 () Bool)

(declare-fun lt!421479 () ListLongMap!11997)

(assert (=> b!935241 (= e!525154 (= (apply!817 lt!421479 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935242 () Bool)

(assert (=> b!935242 (= e!525145 e!525154)))

(declare-fun res!629820 () Bool)

(declare-fun call!40708 () Bool)

(assert (=> b!935242 (= res!629820 call!40708)))

(assert (=> b!935242 (=> (not res!629820) (not e!525154))))

(declare-fun b!935243 () Bool)

(declare-fun call!40702 () ListLongMap!11997)

(assert (=> b!935243 (= e!525150 call!40702)))

(declare-fun call!40704 () ListLongMap!11997)

(declare-fun bm!40699 () Bool)

(assert (=> bm!40699 (= call!40704 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!935244 () Bool)

(declare-fun e!525146 () Bool)

(declare-fun e!525144 () Bool)

(assert (=> b!935244 (= e!525146 e!525144)))

(declare-fun res!629821 () Bool)

(assert (=> b!935244 (=> (not res!629821) (not e!525144))))

(assert (=> b!935244 (= res!629821 (contains!5068 lt!421479 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!935244 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)))))

(declare-fun bm!40700 () Bool)

(declare-fun call!40706 () Bool)

(assert (=> bm!40700 (= call!40706 (contains!5068 lt!421479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935245 () Bool)

(assert (=> b!935245 (= e!525149 call!40702)))

(declare-fun b!935246 () Bool)

(declare-fun res!629825 () Bool)

(assert (=> b!935246 (=> (not res!629825) (not e!525147))))

(assert (=> b!935246 (= res!629825 e!525146)))

(declare-fun res!629823 () Bool)

(assert (=> b!935246 (=> res!629823 e!525146)))

(assert (=> b!935246 (= res!629823 (not e!525142))))

(declare-fun res!629827 () Bool)

(assert (=> b!935246 (=> (not res!629827) (not e!525142))))

(assert (=> b!935246 (= res!629827 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)))))

(declare-fun b!935247 () Bool)

(declare-fun e!525152 () Bool)

(assert (=> b!935247 (= e!525152 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40701 () Bool)

(declare-fun call!40705 () ListLongMap!11997)

(assert (=> bm!40701 (= call!40707 call!40705)))

(declare-fun b!935248 () Bool)

(assert (=> b!935248 (= e!525144 (= (apply!817 lt!421479 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14262 (select (arr!27081 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935248 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27540 _values!1231)))))

(assert (=> b!935248 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)))))

(declare-fun b!935249 () Bool)

(declare-fun e!525153 () Bool)

(assert (=> b!935249 (= e!525147 e!525153)))

(declare-fun c!97262 () Bool)

(assert (=> b!935249 (= c!97262 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!113215 () Bool)

(assert (=> d!113215 e!525147))

(declare-fun res!629826 () Bool)

(assert (=> d!113215 (=> (not res!629826) (not e!525147))))

(assert (=> d!113215 (= res!629826 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)))))))

(declare-fun lt!421484 () ListLongMap!11997)

(assert (=> d!113215 (= lt!421479 lt!421484)))

(declare-fun lt!421488 () Unit!31545)

(declare-fun e!525148 () Unit!31545)

(assert (=> d!113215 (= lt!421488 e!525148)))

(declare-fun c!97259 () Bool)

(assert (=> d!113215 (= c!97259 e!525152)))

(declare-fun res!629819 () Bool)

(assert (=> d!113215 (=> (not res!629819) (not e!525152))))

(assert (=> d!113215 (= res!629819 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27541 _keys!1487)))))

(declare-fun e!525151 () ListLongMap!11997)

(assert (=> d!113215 (= lt!421484 e!525151)))

(declare-fun c!97261 () Bool)

(assert (=> d!113215 (= c!97261 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113215 (validMask!0 mask!1881)))

(assert (=> d!113215 (= (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421479)))

(declare-fun bm!40702 () Bool)

(declare-fun call!40703 () ListLongMap!11997)

(assert (=> bm!40702 (= call!40702 call!40703)))

(declare-fun b!935250 () Bool)

(declare-fun e!525143 () Bool)

(assert (=> b!935250 (= e!525143 (= (apply!817 lt!421479 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun c!97258 () Bool)

(declare-fun bm!40703 () Bool)

(assert (=> bm!40703 (= call!40703 (+!2810 (ite c!97261 call!40704 (ite c!97258 call!40705 call!40707)) (ite (or c!97261 c!97258) (tuple2!13301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935251 () Bool)

(declare-fun lt!421483 () Unit!31545)

(assert (=> b!935251 (= e!525148 lt!421483)))

(declare-fun lt!421477 () ListLongMap!11997)

(assert (=> b!935251 (= lt!421477 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421486 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421485 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421485 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421469 () Unit!31545)

(assert (=> b!935251 (= lt!421469 (addStillContains!529 lt!421477 lt!421486 zeroValue!1173 lt!421485))))

(assert (=> b!935251 (contains!5068 (+!2810 lt!421477 (tuple2!13301 lt!421486 zeroValue!1173)) lt!421485)))

(declare-fun lt!421470 () Unit!31545)

(assert (=> b!935251 (= lt!421470 lt!421469)))

(declare-fun lt!421476 () ListLongMap!11997)

(assert (=> b!935251 (= lt!421476 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421473 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421471 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421471 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421489 () Unit!31545)

(assert (=> b!935251 (= lt!421489 (addApplyDifferent!420 lt!421476 lt!421473 minValue!1173 lt!421471))))

(assert (=> b!935251 (= (apply!817 (+!2810 lt!421476 (tuple2!13301 lt!421473 minValue!1173)) lt!421471) (apply!817 lt!421476 lt!421471))))

(declare-fun lt!421481 () Unit!31545)

(assert (=> b!935251 (= lt!421481 lt!421489)))

(declare-fun lt!421480 () ListLongMap!11997)

(assert (=> b!935251 (= lt!421480 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421474 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421490 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421490 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421472 () Unit!31545)

(assert (=> b!935251 (= lt!421472 (addApplyDifferent!420 lt!421480 lt!421474 zeroValue!1173 lt!421490))))

(assert (=> b!935251 (= (apply!817 (+!2810 lt!421480 (tuple2!13301 lt!421474 zeroValue!1173)) lt!421490) (apply!817 lt!421480 lt!421490))))

(declare-fun lt!421482 () Unit!31545)

(assert (=> b!935251 (= lt!421482 lt!421472)))

(declare-fun lt!421487 () ListLongMap!11997)

(assert (=> b!935251 (= lt!421487 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421475 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421475 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421478 () (_ BitVec 64))

(assert (=> b!935251 (= lt!421478 (select (arr!27082 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935251 (= lt!421483 (addApplyDifferent!420 lt!421487 lt!421475 minValue!1173 lt!421478))))

(assert (=> b!935251 (= (apply!817 (+!2810 lt!421487 (tuple2!13301 lt!421475 minValue!1173)) lt!421478) (apply!817 lt!421487 lt!421478))))

(declare-fun b!935252 () Bool)

(assert (=> b!935252 (= e!525153 (not call!40706))))

(declare-fun b!935253 () Bool)

(assert (=> b!935253 (= e!525151 e!525150)))

(assert (=> b!935253 (= c!97258 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40704 () Bool)

(assert (=> bm!40704 (= call!40708 (contains!5068 lt!421479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935254 () Bool)

(assert (=> b!935254 (= e!525145 (not call!40708))))

(declare-fun bm!40705 () Bool)

(assert (=> bm!40705 (= call!40705 call!40704)))

(declare-fun b!935255 () Bool)

(assert (=> b!935255 (= e!525151 (+!2810 call!40703 (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935256 () Bool)

(declare-fun Unit!31548 () Unit!31545)

(assert (=> b!935256 (= e!525148 Unit!31548)))

(declare-fun b!935257 () Bool)

(assert (=> b!935257 (= e!525153 e!525143)))

(declare-fun res!629824 () Bool)

(assert (=> b!935257 (= res!629824 call!40706)))

(assert (=> b!935257 (=> (not res!629824) (not e!525143))))

(assert (= (and d!113215 c!97261) b!935255))

(assert (= (and d!113215 (not c!97261)) b!935253))

(assert (= (and b!935253 c!97258) b!935243))

(assert (= (and b!935253 (not c!97258)) b!935240))

(assert (= (and b!935240 c!97260) b!935245))

(assert (= (and b!935240 (not c!97260)) b!935238))

(assert (= (or b!935245 b!935238) bm!40701))

(assert (= (or b!935243 bm!40701) bm!40705))

(assert (= (or b!935243 b!935245) bm!40702))

(assert (= (or b!935255 bm!40705) bm!40699))

(assert (= (or b!935255 bm!40702) bm!40703))

(assert (= (and d!113215 res!629819) b!935247))

(assert (= (and d!113215 c!97259) b!935251))

(assert (= (and d!113215 (not c!97259)) b!935256))

(assert (= (and d!113215 res!629826) b!935246))

(assert (= (and b!935246 res!629827) b!935237))

(assert (= (and b!935246 (not res!629823)) b!935244))

(assert (= (and b!935244 res!629821) b!935248))

(assert (= (and b!935246 res!629825) b!935239))

(assert (= (and b!935239 c!97257) b!935242))

(assert (= (and b!935239 (not c!97257)) b!935254))

(assert (= (and b!935242 res!629820) b!935241))

(assert (= (or b!935242 b!935254) bm!40704))

(assert (= (and b!935239 res!629822) b!935249))

(assert (= (and b!935249 c!97262) b!935257))

(assert (= (and b!935249 (not c!97262)) b!935252))

(assert (= (and b!935257 res!629824) b!935250))

(assert (= (or b!935257 b!935252) bm!40700))

(declare-fun b_lambda!14039 () Bool)

(assert (=> (not b_lambda!14039) (not b!935248)))

(assert (=> b!935248 t!27284))

(declare-fun b_and!28907 () Bool)

(assert (= b_and!28905 (and (=> t!27284 result!11939) b_and!28907)))

(declare-fun m!869647 () Bool)

(assert (=> b!935247 m!869647))

(assert (=> b!935247 m!869647))

(declare-fun m!869649 () Bool)

(assert (=> b!935247 m!869649))

(declare-fun m!869651 () Bool)

(assert (=> b!935241 m!869651))

(assert (=> d!113215 m!869491))

(declare-fun m!869653 () Bool)

(assert (=> b!935250 m!869653))

(assert (=> b!935244 m!869647))

(assert (=> b!935244 m!869647))

(declare-fun m!869655 () Bool)

(assert (=> b!935244 m!869655))

(declare-fun m!869657 () Bool)

(assert (=> b!935255 m!869657))

(declare-fun m!869659 () Bool)

(assert (=> bm!40704 m!869659))

(assert (=> b!935237 m!869647))

(assert (=> b!935237 m!869647))

(assert (=> b!935237 m!869649))

(declare-fun m!869661 () Bool)

(assert (=> b!935251 m!869661))

(declare-fun m!869663 () Bool)

(assert (=> b!935251 m!869663))

(declare-fun m!869665 () Bool)

(assert (=> b!935251 m!869665))

(declare-fun m!869667 () Bool)

(assert (=> b!935251 m!869667))

(declare-fun m!869669 () Bool)

(assert (=> b!935251 m!869669))

(declare-fun m!869671 () Bool)

(assert (=> b!935251 m!869671))

(assert (=> b!935251 m!869663))

(declare-fun m!869673 () Bool)

(assert (=> b!935251 m!869673))

(declare-fun m!869675 () Bool)

(assert (=> b!935251 m!869675))

(assert (=> b!935251 m!869647))

(declare-fun m!869677 () Bool)

(assert (=> b!935251 m!869677))

(declare-fun m!869679 () Bool)

(assert (=> b!935251 m!869679))

(declare-fun m!869681 () Bool)

(assert (=> b!935251 m!869681))

(assert (=> b!935251 m!869665))

(declare-fun m!869683 () Bool)

(assert (=> b!935251 m!869683))

(declare-fun m!869685 () Bool)

(assert (=> b!935251 m!869685))

(declare-fun m!869687 () Bool)

(assert (=> b!935251 m!869687))

(declare-fun m!869689 () Bool)

(assert (=> b!935251 m!869689))

(assert (=> b!935251 m!869685))

(assert (=> b!935251 m!869661))

(declare-fun m!869691 () Bool)

(assert (=> b!935251 m!869691))

(declare-fun m!869693 () Bool)

(assert (=> bm!40700 m!869693))

(declare-fun m!869695 () Bool)

(assert (=> b!935248 m!869695))

(assert (=> b!935248 m!869647))

(declare-fun m!869697 () Bool)

(assert (=> b!935248 m!869697))

(assert (=> b!935248 m!869695))

(assert (=> b!935248 m!869465))

(declare-fun m!869699 () Bool)

(assert (=> b!935248 m!869699))

(assert (=> b!935248 m!869465))

(assert (=> b!935248 m!869647))

(assert (=> bm!40699 m!869679))

(declare-fun m!869701 () Bool)

(assert (=> bm!40703 m!869701))

(assert (=> b!935065 d!113215))

(declare-fun d!113217 () Bool)

(declare-fun e!525155 () Bool)

(assert (=> d!113217 e!525155))

(declare-fun res!629829 () Bool)

(assert (=> d!113217 (=> (not res!629829) (not e!525155))))

(declare-fun lt!421493 () ListLongMap!11997)

(assert (=> d!113217 (= res!629829 (contains!5068 lt!421493 (_1!6661 lt!421353)))))

(declare-fun lt!421492 () List!19081)

(assert (=> d!113217 (= lt!421493 (ListLongMap!11998 lt!421492))))

(declare-fun lt!421494 () Unit!31545)

(declare-fun lt!421491 () Unit!31545)

(assert (=> d!113217 (= lt!421494 lt!421491)))

(assert (=> d!113217 (= (getValueByKey!481 lt!421492 (_1!6661 lt!421353)) (Some!486 (_2!6661 lt!421353)))))

(assert (=> d!113217 (= lt!421491 (lemmaContainsTupThenGetReturnValue!257 lt!421492 (_1!6661 lt!421353) (_2!6661 lt!421353)))))

(assert (=> d!113217 (= lt!421492 (insertStrictlySorted!314 (toList!6014 lt!421354) (_1!6661 lt!421353) (_2!6661 lt!421353)))))

(assert (=> d!113217 (= (+!2810 lt!421354 lt!421353) lt!421493)))

(declare-fun b!935258 () Bool)

(declare-fun res!629828 () Bool)

(assert (=> b!935258 (=> (not res!629828) (not e!525155))))

(assert (=> b!935258 (= res!629828 (= (getValueByKey!481 (toList!6014 lt!421493) (_1!6661 lt!421353)) (Some!486 (_2!6661 lt!421353))))))

(declare-fun b!935259 () Bool)

(assert (=> b!935259 (= e!525155 (contains!5071 (toList!6014 lt!421493) lt!421353))))

(assert (= (and d!113217 res!629829) b!935258))

(assert (= (and b!935258 res!629828) b!935259))

(declare-fun m!869703 () Bool)

(assert (=> d!113217 m!869703))

(declare-fun m!869705 () Bool)

(assert (=> d!113217 m!869705))

(declare-fun m!869707 () Bool)

(assert (=> d!113217 m!869707))

(declare-fun m!869709 () Bool)

(assert (=> d!113217 m!869709))

(declare-fun m!869711 () Bool)

(assert (=> b!935258 m!869711))

(declare-fun m!869713 () Bool)

(assert (=> b!935259 m!869713))

(assert (=> b!935065 d!113217))

(declare-fun d!113219 () Bool)

(declare-fun e!525158 () Bool)

(assert (=> d!113219 e!525158))

(declare-fun res!629832 () Bool)

(assert (=> d!113219 (=> (not res!629832) (not e!525158))))

(assert (=> d!113219 (= res!629832 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27540 _values!1231))))))

(declare-fun lt!421497 () Unit!31545)

(declare-fun choose!1548 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 32) Int) Unit!31545)

(assert (=> d!113219 (= lt!421497 (choose!1548 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113219 (validMask!0 mask!1881)))

(assert (=> d!113219 (= (lemmaListMapRecursiveValidKeyArray!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421497)))

(declare-fun b!935262 () Bool)

(assert (=> b!935262 (= e!525158 (= (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2810 (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13301 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14262 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113219 res!629832) b!935262))

(declare-fun b_lambda!14041 () Bool)

(assert (=> (not b_lambda!14041) (not b!935262)))

(assert (=> b!935262 t!27284))

(declare-fun b_and!28909 () Bool)

(assert (= b_and!28907 (and (=> t!27284 result!11939) b_and!28909)))

(declare-fun m!869715 () Bool)

(assert (=> d!113219 m!869715))

(assert (=> d!113219 m!869491))

(assert (=> b!935262 m!869459))

(assert (=> b!935262 m!869465))

(assert (=> b!935262 m!869467))

(assert (=> b!935262 m!869465))

(assert (=> b!935262 m!869469))

(assert (=> b!935262 m!869459))

(declare-fun m!869717 () Bool)

(assert (=> b!935262 m!869717))

(declare-fun m!869719 () Bool)

(assert (=> b!935262 m!869719))

(assert (=> b!935262 m!869447))

(assert (=> b!935262 m!869717))

(assert (=> b!935065 d!113219))

(declare-fun b!935263 () Bool)

(declare-fun e!525161 () Bool)

(declare-fun e!525162 () Bool)

(assert (=> b!935263 (= e!525161 e!525162)))

(declare-fun c!97263 () Bool)

(assert (=> b!935263 (= c!97263 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935264 () Bool)

(declare-fun call!40709 () Bool)

(assert (=> b!935264 (= e!525162 call!40709)))

(declare-fun d!113221 () Bool)

(declare-fun res!629835 () Bool)

(declare-fun e!525160 () Bool)

(assert (=> d!113221 (=> res!629835 e!525160)))

(assert (=> d!113221 (= res!629835 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487)))))

(assert (=> d!113221 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19077) e!525160)))

(declare-fun b!935265 () Bool)

(assert (=> b!935265 (= e!525162 call!40709)))

(declare-fun b!935266 () Bool)

(declare-fun e!525159 () Bool)

(assert (=> b!935266 (= e!525159 (contains!5067 Nil!19077 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935267 () Bool)

(assert (=> b!935267 (= e!525160 e!525161)))

(declare-fun res!629833 () Bool)

(assert (=> b!935267 (=> (not res!629833) (not e!525161))))

(assert (=> b!935267 (= res!629833 (not e!525159))))

(declare-fun res!629834 () Bool)

(assert (=> b!935267 (=> (not res!629834) (not e!525159))))

(assert (=> b!935267 (= res!629834 (validKeyInArray!0 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40706 () Bool)

(assert (=> bm!40706 (= call!40709 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97263 (Cons!19076 (select (arr!27082 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19077) Nil!19077)))))

(assert (= (and d!113221 (not res!629835)) b!935267))

(assert (= (and b!935267 res!629834) b!935266))

(assert (= (and b!935267 res!629833) b!935263))

(assert (= (and b!935263 c!97263) b!935265))

(assert (= (and b!935263 (not c!97263)) b!935264))

(assert (= (or b!935265 b!935264) bm!40706))

(assert (=> b!935263 m!869447))

(assert (=> b!935263 m!869447))

(assert (=> b!935263 m!869585))

(assert (=> b!935266 m!869447))

(assert (=> b!935266 m!869447))

(declare-fun m!869721 () Bool)

(assert (=> b!935266 m!869721))

(assert (=> b!935267 m!869447))

(assert (=> b!935267 m!869447))

(assert (=> b!935267 m!869585))

(assert (=> bm!40706 m!869447))

(declare-fun m!869723 () Bool)

(assert (=> bm!40706 m!869723))

(assert (=> b!935065 d!113221))

(declare-fun d!113223 () Bool)

(declare-fun e!525165 () Bool)

(assert (=> d!113223 e!525165))

(declare-fun c!97266 () Bool)

(assert (=> d!113223 (= c!97266 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421500 () Unit!31545)

(declare-fun choose!1549 (array!56280 array!56278 (_ BitVec 32) (_ BitVec 32) V!31857 V!31857 (_ BitVec 64) (_ BitVec 32) Int) Unit!31545)

(assert (=> d!113223 (= lt!421500 (choose!1549 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113223 (validMask!0 mask!1881)))

(assert (=> d!113223 (= (lemmaListMapContainsThenArrayContainsFrom!282 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421500)))

(declare-fun b!935272 () Bool)

(assert (=> b!935272 (= e!525165 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935273 () Bool)

(assert (=> b!935273 (= e!525165 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113223 c!97266) b!935272))

(assert (= (and d!113223 (not c!97266)) b!935273))

(declare-fun m!869725 () Bool)

(assert (=> d!113223 m!869725))

(assert (=> d!113223 m!869491))

(assert (=> b!935272 m!869497))

(assert (=> b!935065 d!113223))

(declare-fun d!113225 () Bool)

(declare-fun e!525171 () Bool)

(assert (=> d!113225 e!525171))

(declare-fun res!629838 () Bool)

(assert (=> d!113225 (=> res!629838 e!525171)))

(declare-fun lt!421509 () Bool)

(assert (=> d!113225 (= res!629838 (not lt!421509))))

(declare-fun lt!421512 () Bool)

(assert (=> d!113225 (= lt!421509 lt!421512)))

(declare-fun lt!421510 () Unit!31545)

(declare-fun e!525170 () Unit!31545)

(assert (=> d!113225 (= lt!421510 e!525170)))

(declare-fun c!97269 () Bool)

(assert (=> d!113225 (= c!97269 lt!421512)))

(declare-fun containsKey!448 (List!19081 (_ BitVec 64)) Bool)

(assert (=> d!113225 (= lt!421512 (containsKey!448 (toList!6014 (+!2810 lt!421354 lt!421353)) k0!1099))))

(assert (=> d!113225 (= (contains!5068 (+!2810 lt!421354 lt!421353) k0!1099) lt!421509)))

(declare-fun b!935280 () Bool)

(declare-fun lt!421511 () Unit!31545)

(assert (=> b!935280 (= e!525170 lt!421511)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!344 (List!19081 (_ BitVec 64)) Unit!31545)

(assert (=> b!935280 (= lt!421511 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6014 (+!2810 lt!421354 lt!421353)) k0!1099))))

(declare-fun isDefined!353 (Option!487) Bool)

(assert (=> b!935280 (isDefined!353 (getValueByKey!481 (toList!6014 (+!2810 lt!421354 lt!421353)) k0!1099))))

(declare-fun b!935281 () Bool)

(declare-fun Unit!31549 () Unit!31545)

(assert (=> b!935281 (= e!525170 Unit!31549)))

(declare-fun b!935282 () Bool)

(assert (=> b!935282 (= e!525171 (isDefined!353 (getValueByKey!481 (toList!6014 (+!2810 lt!421354 lt!421353)) k0!1099)))))

(assert (= (and d!113225 c!97269) b!935280))

(assert (= (and d!113225 (not c!97269)) b!935281))

(assert (= (and d!113225 (not res!629838)) b!935282))

(declare-fun m!869727 () Bool)

(assert (=> d!113225 m!869727))

(declare-fun m!869729 () Bool)

(assert (=> b!935280 m!869729))

(declare-fun m!869731 () Bool)

(assert (=> b!935280 m!869731))

(assert (=> b!935280 m!869731))

(declare-fun m!869733 () Bool)

(assert (=> b!935280 m!869733))

(assert (=> b!935282 m!869731))

(assert (=> b!935282 m!869731))

(assert (=> b!935282 m!869733))

(assert (=> b!935065 d!113225))

(declare-fun d!113227 () Bool)

(declare-fun c!97272 () Bool)

(assert (=> d!113227 (= c!97272 ((_ is ValueCellFull!9603) (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525174 () V!31857)

(assert (=> d!113227 (= (get!14262 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525174)))

(declare-fun b!935287 () Bool)

(declare-fun get!14263 (ValueCell!9603 V!31857) V!31857)

(assert (=> b!935287 (= e!525174 (get!14263 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935288 () Bool)

(declare-fun get!14264 (ValueCell!9603 V!31857) V!31857)

(assert (=> b!935288 (= e!525174 (get!14264 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113227 c!97272) b!935287))

(assert (= (and d!113227 (not c!97272)) b!935288))

(assert (=> b!935287 m!869459))

(assert (=> b!935287 m!869465))

(declare-fun m!869735 () Bool)

(assert (=> b!935287 m!869735))

(assert (=> b!935288 m!869459))

(assert (=> b!935288 m!869465))

(declare-fun m!869737 () Bool)

(assert (=> b!935288 m!869737))

(assert (=> b!935065 d!113227))

(declare-fun d!113229 () Bool)

(assert (=> d!113229 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19077)))

(declare-fun lt!421515 () Unit!31545)

(declare-fun choose!39 (array!56280 (_ BitVec 32) (_ BitVec 32)) Unit!31545)

(assert (=> d!113229 (= lt!421515 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113229 (bvslt (size!27541 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113229 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421515)))

(declare-fun bs!26252 () Bool)

(assert (= bs!26252 d!113229))

(assert (=> bs!26252 m!869471))

(declare-fun m!869739 () Bool)

(assert (=> bs!26252 m!869739))

(assert (=> b!935065 d!113229))

(declare-fun d!113231 () Bool)

(assert (=> d!113231 (= (validKeyInArray!0 lt!421348) (and (not (= lt!421348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935067 d!113231))

(declare-fun d!113233 () Bool)

(declare-fun e!525176 () Bool)

(assert (=> d!113233 e!525176))

(declare-fun res!629839 () Bool)

(assert (=> d!113233 (=> res!629839 e!525176)))

(declare-fun lt!421516 () Bool)

(assert (=> d!113233 (= res!629839 (not lt!421516))))

(declare-fun lt!421519 () Bool)

(assert (=> d!113233 (= lt!421516 lt!421519)))

(declare-fun lt!421517 () Unit!31545)

(declare-fun e!525175 () Unit!31545)

(assert (=> d!113233 (= lt!421517 e!525175)))

(declare-fun c!97273 () Bool)

(assert (=> d!113233 (= c!97273 lt!421519)))

(assert (=> d!113233 (= lt!421519 (containsKey!448 (toList!6014 lt!421354) k0!1099))))

(assert (=> d!113233 (= (contains!5068 lt!421354 k0!1099) lt!421516)))

(declare-fun b!935289 () Bool)

(declare-fun lt!421518 () Unit!31545)

(assert (=> b!935289 (= e!525175 lt!421518)))

(assert (=> b!935289 (= lt!421518 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6014 lt!421354) k0!1099))))

(assert (=> b!935289 (isDefined!353 (getValueByKey!481 (toList!6014 lt!421354) k0!1099))))

(declare-fun b!935290 () Bool)

(declare-fun Unit!31550 () Unit!31545)

(assert (=> b!935290 (= e!525175 Unit!31550)))

(declare-fun b!935291 () Bool)

(assert (=> b!935291 (= e!525176 (isDefined!353 (getValueByKey!481 (toList!6014 lt!421354) k0!1099)))))

(assert (= (and d!113233 c!97273) b!935289))

(assert (= (and d!113233 (not c!97273)) b!935290))

(assert (= (and d!113233 (not res!629839)) b!935291))

(declare-fun m!869741 () Bool)

(assert (=> d!113233 m!869741))

(declare-fun m!869743 () Bool)

(assert (=> b!935289 m!869743))

(declare-fun m!869745 () Bool)

(assert (=> b!935289 m!869745))

(assert (=> b!935289 m!869745))

(declare-fun m!869747 () Bool)

(assert (=> b!935289 m!869747))

(assert (=> b!935291 m!869745))

(assert (=> b!935291 m!869745))

(assert (=> b!935291 m!869747))

(assert (=> b!935075 d!113233))

(declare-fun b!935292 () Bool)

(declare-fun e!525177 () Bool)

(assert (=> b!935292 (= e!525177 (validKeyInArray!0 (select (arr!27082 _keys!1487) from!1844)))))

(declare-fun b!935293 () Bool)

(declare-fun e!525184 () ListLongMap!11997)

(declare-fun call!40715 () ListLongMap!11997)

(assert (=> b!935293 (= e!525184 call!40715)))

(declare-fun b!935294 () Bool)

(declare-fun res!629843 () Bool)

(declare-fun e!525182 () Bool)

(assert (=> b!935294 (=> (not res!629843) (not e!525182))))

(declare-fun e!525180 () Bool)

(assert (=> b!935294 (= res!629843 e!525180)))

(declare-fun c!97274 () Bool)

(assert (=> b!935294 (= c!97274 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935295 () Bool)

(declare-fun c!97277 () Bool)

(assert (=> b!935295 (= c!97277 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525185 () ListLongMap!11997)

(assert (=> b!935295 (= e!525185 e!525184)))

(declare-fun b!935296 () Bool)

(declare-fun e!525189 () Bool)

(declare-fun lt!421530 () ListLongMap!11997)

(assert (=> b!935296 (= e!525189 (= (apply!817 lt!421530 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935297 () Bool)

(assert (=> b!935297 (= e!525180 e!525189)))

(declare-fun res!629841 () Bool)

(declare-fun call!40716 () Bool)

(assert (=> b!935297 (= res!629841 call!40716)))

(assert (=> b!935297 (=> (not res!629841) (not e!525189))))

(declare-fun b!935298 () Bool)

(declare-fun call!40710 () ListLongMap!11997)

(assert (=> b!935298 (= e!525185 call!40710)))

(declare-fun bm!40707 () Bool)

(declare-fun call!40712 () ListLongMap!11997)

(assert (=> bm!40707 (= call!40712 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935299 () Bool)

(declare-fun e!525181 () Bool)

(declare-fun e!525179 () Bool)

(assert (=> b!935299 (= e!525181 e!525179)))

(declare-fun res!629842 () Bool)

(assert (=> b!935299 (=> (not res!629842) (not e!525179))))

(assert (=> b!935299 (= res!629842 (contains!5068 lt!421530 (select (arr!27082 _keys!1487) from!1844)))))

(assert (=> b!935299 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27541 _keys!1487)))))

(declare-fun bm!40708 () Bool)

(declare-fun call!40714 () Bool)

(assert (=> bm!40708 (= call!40714 (contains!5068 lt!421530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935300 () Bool)

(assert (=> b!935300 (= e!525184 call!40710)))

(declare-fun b!935301 () Bool)

(declare-fun res!629846 () Bool)

(assert (=> b!935301 (=> (not res!629846) (not e!525182))))

(assert (=> b!935301 (= res!629846 e!525181)))

(declare-fun res!629844 () Bool)

(assert (=> b!935301 (=> res!629844 e!525181)))

(assert (=> b!935301 (= res!629844 (not e!525177))))

(declare-fun res!629848 () Bool)

(assert (=> b!935301 (=> (not res!629848) (not e!525177))))

(assert (=> b!935301 (= res!629848 (bvslt from!1844 (size!27541 _keys!1487)))))

(declare-fun b!935302 () Bool)

(declare-fun e!525187 () Bool)

(assert (=> b!935302 (= e!525187 (validKeyInArray!0 (select (arr!27082 _keys!1487) from!1844)))))

(declare-fun bm!40709 () Bool)

(declare-fun call!40713 () ListLongMap!11997)

(assert (=> bm!40709 (= call!40715 call!40713)))

(declare-fun b!935303 () Bool)

(assert (=> b!935303 (= e!525179 (= (apply!817 lt!421530 (select (arr!27082 _keys!1487) from!1844)) (get!14262 (select (arr!27081 _values!1231) from!1844) (dynLambda!1599 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935303 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27540 _values!1231)))))

(assert (=> b!935303 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27541 _keys!1487)))))

(declare-fun b!935304 () Bool)

(declare-fun e!525188 () Bool)

(assert (=> b!935304 (= e!525182 e!525188)))

(declare-fun c!97279 () Bool)

(assert (=> b!935304 (= c!97279 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!113235 () Bool)

(assert (=> d!113235 e!525182))

(declare-fun res!629847 () Bool)

(assert (=> d!113235 (=> (not res!629847) (not e!525182))))

(assert (=> d!113235 (= res!629847 (or (bvsge from!1844 (size!27541 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27541 _keys!1487)))))))

(declare-fun lt!421535 () ListLongMap!11997)

(assert (=> d!113235 (= lt!421530 lt!421535)))

(declare-fun lt!421539 () Unit!31545)

(declare-fun e!525183 () Unit!31545)

(assert (=> d!113235 (= lt!421539 e!525183)))

(declare-fun c!97276 () Bool)

(assert (=> d!113235 (= c!97276 e!525187)))

(declare-fun res!629840 () Bool)

(assert (=> d!113235 (=> (not res!629840) (not e!525187))))

(assert (=> d!113235 (= res!629840 (bvslt from!1844 (size!27541 _keys!1487)))))

(declare-fun e!525186 () ListLongMap!11997)

(assert (=> d!113235 (= lt!421535 e!525186)))

(declare-fun c!97278 () Bool)

(assert (=> d!113235 (= c!97278 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113235 (validMask!0 mask!1881)))

(assert (=> d!113235 (= (getCurrentListMap!3251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421530)))

(declare-fun bm!40710 () Bool)

(declare-fun call!40711 () ListLongMap!11997)

(assert (=> bm!40710 (= call!40710 call!40711)))

(declare-fun b!935305 () Bool)

(declare-fun e!525178 () Bool)

(assert (=> b!935305 (= e!525178 (= (apply!817 lt!421530 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun c!97275 () Bool)

(declare-fun bm!40711 () Bool)

(assert (=> bm!40711 (= call!40711 (+!2810 (ite c!97278 call!40712 (ite c!97275 call!40713 call!40715)) (ite (or c!97278 c!97275) (tuple2!13301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935306 () Bool)

(declare-fun lt!421534 () Unit!31545)

(assert (=> b!935306 (= e!525183 lt!421534)))

(declare-fun lt!421528 () ListLongMap!11997)

(assert (=> b!935306 (= lt!421528 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421537 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421536 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421536 (select (arr!27082 _keys!1487) from!1844))))

(declare-fun lt!421520 () Unit!31545)

(assert (=> b!935306 (= lt!421520 (addStillContains!529 lt!421528 lt!421537 zeroValue!1173 lt!421536))))

(assert (=> b!935306 (contains!5068 (+!2810 lt!421528 (tuple2!13301 lt!421537 zeroValue!1173)) lt!421536)))

(declare-fun lt!421521 () Unit!31545)

(assert (=> b!935306 (= lt!421521 lt!421520)))

(declare-fun lt!421527 () ListLongMap!11997)

(assert (=> b!935306 (= lt!421527 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421524 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421524 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421522 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421522 (select (arr!27082 _keys!1487) from!1844))))

(declare-fun lt!421540 () Unit!31545)

(assert (=> b!935306 (= lt!421540 (addApplyDifferent!420 lt!421527 lt!421524 minValue!1173 lt!421522))))

(assert (=> b!935306 (= (apply!817 (+!2810 lt!421527 (tuple2!13301 lt!421524 minValue!1173)) lt!421522) (apply!817 lt!421527 lt!421522))))

(declare-fun lt!421532 () Unit!31545)

(assert (=> b!935306 (= lt!421532 lt!421540)))

(declare-fun lt!421531 () ListLongMap!11997)

(assert (=> b!935306 (= lt!421531 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421525 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421541 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421541 (select (arr!27082 _keys!1487) from!1844))))

(declare-fun lt!421523 () Unit!31545)

(assert (=> b!935306 (= lt!421523 (addApplyDifferent!420 lt!421531 lt!421525 zeroValue!1173 lt!421541))))

(assert (=> b!935306 (= (apply!817 (+!2810 lt!421531 (tuple2!13301 lt!421525 zeroValue!1173)) lt!421541) (apply!817 lt!421531 lt!421541))))

(declare-fun lt!421533 () Unit!31545)

(assert (=> b!935306 (= lt!421533 lt!421523)))

(declare-fun lt!421538 () ListLongMap!11997)

(assert (=> b!935306 (= lt!421538 (getCurrentListMapNoExtraKeys!3301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421526 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421526 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421529 () (_ BitVec 64))

(assert (=> b!935306 (= lt!421529 (select (arr!27082 _keys!1487) from!1844))))

(assert (=> b!935306 (= lt!421534 (addApplyDifferent!420 lt!421538 lt!421526 minValue!1173 lt!421529))))

(assert (=> b!935306 (= (apply!817 (+!2810 lt!421538 (tuple2!13301 lt!421526 minValue!1173)) lt!421529) (apply!817 lt!421538 lt!421529))))

(declare-fun b!935307 () Bool)

(assert (=> b!935307 (= e!525188 (not call!40714))))

(declare-fun b!935308 () Bool)

(assert (=> b!935308 (= e!525186 e!525185)))

(assert (=> b!935308 (= c!97275 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40712 () Bool)

(assert (=> bm!40712 (= call!40716 (contains!5068 lt!421530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935309 () Bool)

(assert (=> b!935309 (= e!525180 (not call!40716))))

(declare-fun bm!40713 () Bool)

(assert (=> bm!40713 (= call!40713 call!40712)))

(declare-fun b!935310 () Bool)

(assert (=> b!935310 (= e!525186 (+!2810 call!40711 (tuple2!13301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935311 () Bool)

(declare-fun Unit!31551 () Unit!31545)

(assert (=> b!935311 (= e!525183 Unit!31551)))

(declare-fun b!935312 () Bool)

(assert (=> b!935312 (= e!525188 e!525178)))

(declare-fun res!629845 () Bool)

(assert (=> b!935312 (= res!629845 call!40714)))

(assert (=> b!935312 (=> (not res!629845) (not e!525178))))

(assert (= (and d!113235 c!97278) b!935310))

(assert (= (and d!113235 (not c!97278)) b!935308))

(assert (= (and b!935308 c!97275) b!935298))

(assert (= (and b!935308 (not c!97275)) b!935295))

(assert (= (and b!935295 c!97277) b!935300))

(assert (= (and b!935295 (not c!97277)) b!935293))

(assert (= (or b!935300 b!935293) bm!40709))

(assert (= (or b!935298 bm!40709) bm!40713))

(assert (= (or b!935298 b!935300) bm!40710))

(assert (= (or b!935310 bm!40713) bm!40707))

(assert (= (or b!935310 bm!40710) bm!40711))

(assert (= (and d!113235 res!629840) b!935302))

(assert (= (and d!113235 c!97276) b!935306))

(assert (= (and d!113235 (not c!97276)) b!935311))

(assert (= (and d!113235 res!629847) b!935301))

(assert (= (and b!935301 res!629848) b!935292))

(assert (= (and b!935301 (not res!629844)) b!935299))

(assert (= (and b!935299 res!629842) b!935303))

(assert (= (and b!935301 res!629846) b!935294))

(assert (= (and b!935294 c!97274) b!935297))

(assert (= (and b!935294 (not c!97274)) b!935309))

(assert (= (and b!935297 res!629841) b!935296))

(assert (= (or b!935297 b!935309) bm!40712))

(assert (= (and b!935294 res!629843) b!935304))

(assert (= (and b!935304 c!97279) b!935312))

(assert (= (and b!935304 (not c!97279)) b!935307))

(assert (= (and b!935312 res!629845) b!935305))

(assert (= (or b!935312 b!935307) bm!40708))

(declare-fun b_lambda!14043 () Bool)

(assert (=> (not b_lambda!14043) (not b!935303)))

(assert (=> b!935303 t!27284))

(declare-fun b_and!28911 () Bool)

(assert (= b_and!28909 (and (=> t!27284 result!11939) b_and!28911)))

(assert (=> b!935302 m!869575))

(assert (=> b!935302 m!869575))

(declare-fun m!869749 () Bool)

(assert (=> b!935302 m!869749))

(declare-fun m!869751 () Bool)

(assert (=> b!935296 m!869751))

(assert (=> d!113235 m!869491))

(declare-fun m!869753 () Bool)

(assert (=> b!935305 m!869753))

(assert (=> b!935299 m!869575))

(assert (=> b!935299 m!869575))

(declare-fun m!869755 () Bool)

(assert (=> b!935299 m!869755))

(declare-fun m!869757 () Bool)

(assert (=> b!935310 m!869757))

(declare-fun m!869759 () Bool)

(assert (=> bm!40712 m!869759))

(assert (=> b!935292 m!869575))

(assert (=> b!935292 m!869575))

(assert (=> b!935292 m!869749))

(declare-fun m!869761 () Bool)

(assert (=> b!935306 m!869761))

(declare-fun m!869763 () Bool)

(assert (=> b!935306 m!869763))

(declare-fun m!869765 () Bool)

(assert (=> b!935306 m!869765))

(declare-fun m!869767 () Bool)

(assert (=> b!935306 m!869767))

(declare-fun m!869769 () Bool)

(assert (=> b!935306 m!869769))

(declare-fun m!869771 () Bool)

(assert (=> b!935306 m!869771))

(assert (=> b!935306 m!869763))

(declare-fun m!869773 () Bool)

(assert (=> b!935306 m!869773))

(declare-fun m!869775 () Bool)

(assert (=> b!935306 m!869775))

(assert (=> b!935306 m!869575))

(declare-fun m!869777 () Bool)

(assert (=> b!935306 m!869777))

(declare-fun m!869779 () Bool)

(assert (=> b!935306 m!869779))

(declare-fun m!869781 () Bool)

(assert (=> b!935306 m!869781))

(assert (=> b!935306 m!869765))

(declare-fun m!869783 () Bool)

(assert (=> b!935306 m!869783))

(declare-fun m!869785 () Bool)

(assert (=> b!935306 m!869785))

(declare-fun m!869787 () Bool)

(assert (=> b!935306 m!869787))

(declare-fun m!869789 () Bool)

(assert (=> b!935306 m!869789))

(assert (=> b!935306 m!869785))

(assert (=> b!935306 m!869761))

(declare-fun m!869791 () Bool)

(assert (=> b!935306 m!869791))

(declare-fun m!869793 () Bool)

(assert (=> bm!40708 m!869793))

(declare-fun m!869795 () Bool)

(assert (=> b!935303 m!869795))

(assert (=> b!935303 m!869575))

(declare-fun m!869797 () Bool)

(assert (=> b!935303 m!869797))

(assert (=> b!935303 m!869795))

(assert (=> b!935303 m!869465))

(declare-fun m!869799 () Bool)

(assert (=> b!935303 m!869799))

(assert (=> b!935303 m!869465))

(assert (=> b!935303 m!869575))

(assert (=> bm!40707 m!869779))

(declare-fun m!869801 () Bool)

(assert (=> bm!40711 m!869801))

(assert (=> b!935075 d!113235))

(declare-fun d!113237 () Bool)

(declare-fun res!629853 () Bool)

(declare-fun e!525194 () Bool)

(assert (=> d!113237 (=> res!629853 e!525194)))

(assert (=> d!113237 (= res!629853 ((_ is Nil!19077) Nil!19077))))

(assert (=> d!113237 (= (noDuplicate!1351 Nil!19077) e!525194)))

(declare-fun b!935317 () Bool)

(declare-fun e!525195 () Bool)

(assert (=> b!935317 (= e!525194 e!525195)))

(declare-fun res!629854 () Bool)

(assert (=> b!935317 (=> (not res!629854) (not e!525195))))

(assert (=> b!935317 (= res!629854 (not (contains!5067 (t!27285 Nil!19077) (h!20222 Nil!19077))))))

(declare-fun b!935318 () Bool)

(assert (=> b!935318 (= e!525195 (noDuplicate!1351 (t!27285 Nil!19077)))))

(assert (= (and d!113237 (not res!629853)) b!935317))

(assert (= (and b!935317 res!629854) b!935318))

(declare-fun m!869803 () Bool)

(assert (=> b!935317 m!869803))

(declare-fun m!869805 () Bool)

(assert (=> b!935318 m!869805))

(assert (=> b!935068 d!113237))

(declare-fun d!113239 () Bool)

(declare-fun lt!421544 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!406 (List!19080) (InoxSet (_ BitVec 64)))

(assert (=> d!113239 (= lt!421544 (select (content!406 Nil!19077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525201 () Bool)

(assert (=> d!113239 (= lt!421544 e!525201)))

(declare-fun res!629860 () Bool)

(assert (=> d!113239 (=> (not res!629860) (not e!525201))))

(assert (=> d!113239 (= res!629860 ((_ is Cons!19076) Nil!19077))))

(assert (=> d!113239 (= (contains!5067 Nil!19077 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421544)))

(declare-fun b!935323 () Bool)

(declare-fun e!525200 () Bool)

(assert (=> b!935323 (= e!525201 e!525200)))

(declare-fun res!629859 () Bool)

(assert (=> b!935323 (=> res!629859 e!525200)))

(assert (=> b!935323 (= res!629859 (= (h!20222 Nil!19077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935324 () Bool)

(assert (=> b!935324 (= e!525200 (contains!5067 (t!27285 Nil!19077) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113239 res!629860) b!935323))

(assert (= (and b!935323 (not res!629859)) b!935324))

(declare-fun m!869807 () Bool)

(assert (=> d!113239 m!869807))

(declare-fun m!869809 () Bool)

(assert (=> d!113239 m!869809))

(declare-fun m!869811 () Bool)

(assert (=> b!935324 m!869811))

(assert (=> b!935058 d!113239))

(declare-fun d!113241 () Bool)

(declare-fun lt!421545 () Bool)

(assert (=> d!113241 (= lt!421545 (select (content!406 Nil!19077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525203 () Bool)

(assert (=> d!113241 (= lt!421545 e!525203)))

(declare-fun res!629862 () Bool)

(assert (=> d!113241 (=> (not res!629862) (not e!525203))))

(assert (=> d!113241 (= res!629862 ((_ is Cons!19076) Nil!19077))))

(assert (=> d!113241 (= (contains!5067 Nil!19077 #b1000000000000000000000000000000000000000000000000000000000000000) lt!421545)))

(declare-fun b!935325 () Bool)

(declare-fun e!525202 () Bool)

(assert (=> b!935325 (= e!525203 e!525202)))

(declare-fun res!629861 () Bool)

(assert (=> b!935325 (=> res!629861 e!525202)))

(assert (=> b!935325 (= res!629861 (= (h!20222 Nil!19077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935326 () Bool)

(assert (=> b!935326 (= e!525202 (contains!5067 (t!27285 Nil!19077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113241 res!629862) b!935325))

(assert (= (and b!935325 (not res!629861)) b!935326))

(assert (=> d!113241 m!869807))

(declare-fun m!869813 () Bool)

(assert (=> d!113241 m!869813))

(declare-fun m!869815 () Bool)

(assert (=> b!935326 m!869815))

(assert (=> b!935060 d!113241))

(declare-fun d!113243 () Bool)

(declare-fun get!14265 (Option!487) V!31857)

(assert (=> d!113243 (= (apply!817 lt!421354 k0!1099) (get!14265 (getValueByKey!481 (toList!6014 lt!421354) k0!1099)))))

(declare-fun bs!26253 () Bool)

(assert (= bs!26253 d!113243))

(assert (=> bs!26253 m!869745))

(assert (=> bs!26253 m!869745))

(declare-fun m!869817 () Bool)

(assert (=> bs!26253 m!869817))

(assert (=> b!935069 d!113243))

(declare-fun mapNonEmpty!32025 () Bool)

(declare-fun mapRes!32025 () Bool)

(declare-fun tp!61442 () Bool)

(declare-fun e!525208 () Bool)

(assert (=> mapNonEmpty!32025 (= mapRes!32025 (and tp!61442 e!525208))))

(declare-fun mapValue!32025 () ValueCell!9603)

(declare-fun mapKey!32025 () (_ BitVec 32))

(declare-fun mapRest!32025 () (Array (_ BitVec 32) ValueCell!9603))

(assert (=> mapNonEmpty!32025 (= mapRest!32019 (store mapRest!32025 mapKey!32025 mapValue!32025))))

(declare-fun b!935334 () Bool)

(declare-fun e!525209 () Bool)

(assert (=> b!935334 (= e!525209 tp_is_empty!20169)))

(declare-fun condMapEmpty!32025 () Bool)

(declare-fun mapDefault!32025 () ValueCell!9603)

(assert (=> mapNonEmpty!32019 (= condMapEmpty!32025 (= mapRest!32019 ((as const (Array (_ BitVec 32) ValueCell!9603)) mapDefault!32025)))))

(assert (=> mapNonEmpty!32019 (= tp!61433 (and e!525209 mapRes!32025))))

(declare-fun b!935333 () Bool)

(assert (=> b!935333 (= e!525208 tp_is_empty!20169)))

(declare-fun mapIsEmpty!32025 () Bool)

(assert (=> mapIsEmpty!32025 mapRes!32025))

(assert (= (and mapNonEmpty!32019 condMapEmpty!32025) mapIsEmpty!32025))

(assert (= (and mapNonEmpty!32019 (not condMapEmpty!32025)) mapNonEmpty!32025))

(assert (= (and mapNonEmpty!32025 ((_ is ValueCellFull!9603) mapValue!32025)) b!935333))

(assert (= (and mapNonEmpty!32019 ((_ is ValueCellFull!9603) mapDefault!32025)) b!935334))

(declare-fun m!869819 () Bool)

(assert (=> mapNonEmpty!32025 m!869819))

(declare-fun b_lambda!14045 () Bool)

(assert (= b_lambda!14039 (or (and start!79540 b_free!17661) b_lambda!14045)))

(declare-fun b_lambda!14047 () Bool)

(assert (= b_lambda!14041 (or (and start!79540 b_free!17661) b_lambda!14047)))

(declare-fun b_lambda!14049 () Bool)

(assert (= b_lambda!14043 (or (and start!79540 b_free!17661) b_lambda!14049)))

(declare-fun b_lambda!14051 () Bool)

(assert (= b_lambda!14037 (or (and start!79540 b_free!17661) b_lambda!14051)))

(check-sat (not d!113217) (not b!935166) (not b!935217) (not b!935220) (not bm!40677) (not b!935318) (not d!113213) (not b!935296) (not bm!40699) (not b!935288) (not b!935299) tp_is_empty!20169 (not b!935272) (not d!113223) (not b!935303) (not b!935292) (not b!935147) (not d!113225) (not b!935248) (not b!935158) (not b!935221) (not b!935282) (not b_next!17661) (not b!935305) (not d!113211) (not b!935223) (not bm!40708) (not b!935210) (not b!935310) (not b!935259) (not d!113241) (not bm!40696) (not bm!40704) (not b!935255) (not b!935267) (not b_lambda!14045) (not b!935258) (not mapNonEmpty!32025) (not b!935236) (not d!113235) (not b!935251) (not bm!40700) (not d!113229) (not b!935247) (not bm!40692) (not b!935237) (not b!935326) (not b!935157) (not b!935302) (not d!113219) (not b!935241) (not bm!40703) (not bm!40693) (not b!935262) (not b_lambda!14035) (not b_lambda!14049) (not bm!40707) b_and!28911 (not bm!40674) (not b!935266) (not b!935306) (not b_lambda!14047) (not bm!40706) (not b!935263) (not d!113209) (not b!935291) (not b!935280) (not b!935244) (not bm!40697) (not d!113243) (not bm!40712) (not b!935144) (not d!113239) (not b!935324) (not bm!40711) (not d!113233) (not d!113215) (not b!935250) (not b!935224) (not b!935148) (not b!935235) (not b_lambda!14051) (not b!935228) (not b!935287) (not b!935214) (not b!935289) (not b!935317))
(check-sat b_and!28911 (not b_next!17661))
