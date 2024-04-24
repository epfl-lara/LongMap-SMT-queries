; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79826 () Bool)

(assert start!79826)

(declare-fun b_free!17707 () Bool)

(declare-fun b_next!17707 () Bool)

(assert (=> start!79826 (= b_free!17707 (not b_next!17707))))

(declare-fun tp!61577 () Bool)

(declare-fun b_and!29015 () Bool)

(assert (=> start!79826 (= tp!61577 b_and!29015)))

(declare-fun mapNonEmpty!32094 () Bool)

(declare-fun mapRes!32094 () Bool)

(declare-fun tp!61578 () Bool)

(declare-fun e!526517 () Bool)

(assert (=> mapNonEmpty!32094 (= mapRes!32094 (and tp!61578 e!526517))))

(declare-datatypes ((V!31919 0))(
  ( (V!31920 (val!10158 Int)) )
))
(declare-datatypes ((ValueCell!9626 0))(
  ( (ValueCellFull!9626 (v!12680 V!31919)) (EmptyCell!9626) )
))
(declare-fun mapValue!32094 () ValueCell!9626)

(declare-fun mapRest!32094 () (Array (_ BitVec 32) ValueCell!9626))

(declare-fun mapKey!32094 () (_ BitVec 32))

(declare-datatypes ((array!56423 0))(
  ( (array!56424 (arr!27147 (Array (_ BitVec 32) ValueCell!9626)) (size!27607 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56423)

(assert (=> mapNonEmpty!32094 (= (arr!27147 _values!1231) (store mapRest!32094 mapKey!32094 mapValue!32094))))

(declare-fun b!937541 () Bool)

(declare-fun e!526514 () Bool)

(declare-fun e!526513 () Bool)

(assert (=> b!937541 (= e!526514 e!526513)))

(declare-fun res!630961 () Bool)

(assert (=> b!937541 (=> (not res!630961) (not e!526513))))

(declare-datatypes ((tuple2!13326 0))(
  ( (tuple2!13327 (_1!6674 (_ BitVec 64)) (_2!6674 V!31919)) )
))
(declare-datatypes ((List!19107 0))(
  ( (Nil!19104) (Cons!19103 (h!20255 tuple2!13326) (t!27350 List!19107)) )
))
(declare-datatypes ((ListLongMap!12025 0))(
  ( (ListLongMap!12026 (toList!6028 List!19107)) )
))
(declare-fun lt!422739 () ListLongMap!12025)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5100 (ListLongMap!12025 (_ BitVec 64)) Bool)

(assert (=> b!937541 (= res!630961 (contains!5100 lt!422739 k0!1099))))

(declare-datatypes ((array!56425 0))(
  ( (array!56426 (arr!27148 (Array (_ BitVec 32) (_ BitVec 64))) (size!27608 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56425)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31919)

(declare-fun minValue!1173 () V!31919)

(declare-fun getCurrentListMap!3265 (array!56425 array!56423 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) ListLongMap!12025)

(assert (=> b!937541 (= lt!422739 (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937542 () Bool)

(declare-datatypes ((Unit!31586 0))(
  ( (Unit!31587) )
))
(declare-fun e!526512 () Unit!31586)

(declare-fun Unit!31588 () Unit!31586)

(assert (=> b!937542 (= e!526512 Unit!31588)))

(declare-fun b!937543 () Bool)

(declare-fun e!526510 () Bool)

(declare-fun tp_is_empty!20215 () Bool)

(assert (=> b!937543 (= e!526510 tp_is_empty!20215)))

(declare-fun b!937544 () Bool)

(declare-fun res!630962 () Bool)

(assert (=> b!937544 (=> (not res!630962) (not e!526514))))

(assert (=> b!937544 (= res!630962 (and (= (size!27607 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27608 _keys!1487) (size!27607 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937545 () Bool)

(declare-fun e!526509 () Unit!31586)

(assert (=> b!937545 (= e!526509 e!526512)))

(declare-fun lt!422741 () (_ BitVec 64))

(assert (=> b!937545 (= lt!422741 (select (arr!27148 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97716 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937545 (= c!97716 (validKeyInArray!0 lt!422741))))

(declare-fun b!937546 () Bool)

(declare-fun e!526516 () Bool)

(assert (=> b!937546 (= e!526513 e!526516)))

(declare-fun res!630960 () Bool)

(assert (=> b!937546 (=> (not res!630960) (not e!526516))))

(declare-fun v!791 () V!31919)

(declare-fun lt!422749 () V!31919)

(assert (=> b!937546 (= res!630960 (and (= lt!422749 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!846 (ListLongMap!12025 (_ BitVec 64)) V!31919)

(assert (=> b!937546 (= lt!422749 (apply!846 lt!422739 k0!1099))))

(declare-fun b!937547 () Bool)

(declare-fun Unit!31589 () Unit!31586)

(assert (=> b!937547 (= e!526509 Unit!31589)))

(declare-fun b!937548 () Bool)

(assert (=> b!937548 (= e!526516 false)))

(declare-fun lt!422740 () Unit!31586)

(assert (=> b!937548 (= lt!422740 e!526509)))

(declare-fun c!97714 () Bool)

(assert (=> b!937548 (= c!97714 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!32094 () Bool)

(assert (=> mapIsEmpty!32094 mapRes!32094))

(declare-fun b!937549 () Bool)

(declare-fun res!630964 () Bool)

(assert (=> b!937549 (=> (not res!630964) (not e!526514))))

(assert (=> b!937549 (= res!630964 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27608 _keys!1487))))))

(declare-fun b!937550 () Bool)

(declare-fun res!630966 () Bool)

(assert (=> b!937550 (=> (not res!630966) (not e!526514))))

(declare-datatypes ((List!19108 0))(
  ( (Nil!19105) (Cons!19104 (h!20256 (_ BitVec 64)) (t!27351 List!19108)) )
))
(declare-fun arrayNoDuplicates!0 (array!56425 (_ BitVec 32) List!19108) Bool)

(assert (=> b!937550 (= res!630966 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19105))))

(declare-fun b!937551 () Bool)

(declare-fun e!526515 () Bool)

(assert (=> b!937551 (= e!526515 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937552 () Bool)

(declare-fun lt!422744 () ListLongMap!12025)

(assert (=> b!937552 (= (apply!846 lt!422744 k0!1099) lt!422749)))

(declare-fun lt!422750 () Unit!31586)

(declare-fun lt!422743 () V!31919)

(declare-fun addApplyDifferent!425 (ListLongMap!12025 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31586)

(assert (=> b!937552 (= lt!422750 (addApplyDifferent!425 lt!422739 lt!422741 lt!422743 k0!1099))))

(assert (=> b!937552 (not (= lt!422741 k0!1099))))

(declare-fun lt!422751 () Unit!31586)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56425 (_ BitVec 64) (_ BitVec 32) List!19108) Unit!31586)

(assert (=> b!937552 (= lt!422751 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19105))))

(assert (=> b!937552 e!526515))

(declare-fun c!97715 () Bool)

(assert (=> b!937552 (= c!97715 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422747 () Unit!31586)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!295 (array!56425 array!56423 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 64) (_ BitVec 32) Int) Unit!31586)

(assert (=> b!937552 (= lt!422747 (lemmaListMapContainsThenArrayContainsFrom!295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937552 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19105)))

(declare-fun lt!422745 () Unit!31586)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56425 (_ BitVec 32) (_ BitVec 32)) Unit!31586)

(assert (=> b!937552 (= lt!422745 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937552 (contains!5100 lt!422744 k0!1099)))

(declare-fun lt!422742 () tuple2!13326)

(declare-fun +!2841 (ListLongMap!12025 tuple2!13326) ListLongMap!12025)

(assert (=> b!937552 (= lt!422744 (+!2841 lt!422739 lt!422742))))

(declare-fun lt!422746 () Unit!31586)

(declare-fun addStillContains!544 (ListLongMap!12025 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31586)

(assert (=> b!937552 (= lt!422746 (addStillContains!544 lt!422739 lt!422741 lt!422743 k0!1099))))

(assert (=> b!937552 (= (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2841 (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422742))))

(assert (=> b!937552 (= lt!422742 (tuple2!13327 lt!422741 lt!422743))))

(declare-fun get!14327 (ValueCell!9626 V!31919) V!31919)

(declare-fun dynLambda!1638 (Int (_ BitVec 64)) V!31919)

(assert (=> b!937552 (= lt!422743 (get!14327 (select (arr!27147 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1638 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422748 () Unit!31586)

(declare-fun lemmaListMapRecursiveValidKeyArray!221 (array!56425 array!56423 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) Unit!31586)

(assert (=> b!937552 (= lt!422748 (lemmaListMapRecursiveValidKeyArray!221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937552 (= e!526512 lt!422750)))

(declare-fun res!630963 () Bool)

(assert (=> start!79826 (=> (not res!630963) (not e!526514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79826 (= res!630963 (validMask!0 mask!1881))))

(assert (=> start!79826 e!526514))

(assert (=> start!79826 true))

(assert (=> start!79826 tp_is_empty!20215))

(declare-fun e!526511 () Bool)

(declare-fun array_inv!21200 (array!56423) Bool)

(assert (=> start!79826 (and (array_inv!21200 _values!1231) e!526511)))

(assert (=> start!79826 tp!61577))

(declare-fun array_inv!21201 (array!56425) Bool)

(assert (=> start!79826 (array_inv!21201 _keys!1487)))

(declare-fun b!937553 () Bool)

(assert (=> b!937553 (= e!526511 (and e!526510 mapRes!32094))))

(declare-fun condMapEmpty!32094 () Bool)

(declare-fun mapDefault!32094 () ValueCell!9626)

(assert (=> b!937553 (= condMapEmpty!32094 (= (arr!27147 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9626)) mapDefault!32094)))))

(declare-fun b!937554 () Bool)

(declare-fun arrayContainsKey!0 (array!56425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937554 (= e!526515 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937555 () Bool)

(declare-fun res!630965 () Bool)

(assert (=> b!937555 (=> (not res!630965) (not e!526514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56425 (_ BitVec 32)) Bool)

(assert (=> b!937555 (= res!630965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937556 () Bool)

(assert (=> b!937556 (= e!526517 tp_is_empty!20215)))

(assert (= (and start!79826 res!630963) b!937544))

(assert (= (and b!937544 res!630962) b!937555))

(assert (= (and b!937555 res!630965) b!937550))

(assert (= (and b!937550 res!630966) b!937549))

(assert (= (and b!937549 res!630964) b!937541))

(assert (= (and b!937541 res!630961) b!937546))

(assert (= (and b!937546 res!630960) b!937548))

(assert (= (and b!937548 c!97714) b!937545))

(assert (= (and b!937548 (not c!97714)) b!937547))

(assert (= (and b!937545 c!97716) b!937552))

(assert (= (and b!937545 (not c!97716)) b!937542))

(assert (= (and b!937552 c!97715) b!937554))

(assert (= (and b!937552 (not c!97715)) b!937551))

(assert (= (and b!937553 condMapEmpty!32094) mapIsEmpty!32094))

(assert (= (and b!937553 (not condMapEmpty!32094)) mapNonEmpty!32094))

(get-info :version)

(assert (= (and mapNonEmpty!32094 ((_ is ValueCellFull!9626) mapValue!32094)) b!937556))

(assert (= (and b!937553 ((_ is ValueCellFull!9626) mapDefault!32094)) b!937543))

(assert (= start!79826 b!937553))

(declare-fun b_lambda!14127 () Bool)

(assert (=> (not b_lambda!14127) (not b!937552)))

(declare-fun t!27349 () Bool)

(declare-fun tb!6093 () Bool)

(assert (=> (and start!79826 (= defaultEntry!1235 defaultEntry!1235) t!27349) tb!6093))

(declare-fun result!12027 () Bool)

(assert (=> tb!6093 (= result!12027 tp_is_empty!20215)))

(assert (=> b!937552 t!27349))

(declare-fun b_and!29017 () Bool)

(assert (= b_and!29015 (and (=> t!27349 result!12027) b_and!29017)))

(declare-fun m!872567 () Bool)

(assert (=> b!937545 m!872567))

(declare-fun m!872569 () Bool)

(assert (=> b!937545 m!872569))

(declare-fun m!872571 () Bool)

(assert (=> b!937552 m!872571))

(declare-fun m!872573 () Bool)

(assert (=> b!937552 m!872573))

(declare-fun m!872575 () Bool)

(assert (=> b!937552 m!872575))

(declare-fun m!872577 () Bool)

(assert (=> b!937552 m!872577))

(declare-fun m!872579 () Bool)

(assert (=> b!937552 m!872579))

(declare-fun m!872581 () Bool)

(assert (=> b!937552 m!872581))

(declare-fun m!872583 () Bool)

(assert (=> b!937552 m!872583))

(declare-fun m!872585 () Bool)

(assert (=> b!937552 m!872585))

(declare-fun m!872587 () Bool)

(assert (=> b!937552 m!872587))

(declare-fun m!872589 () Bool)

(assert (=> b!937552 m!872589))

(declare-fun m!872591 () Bool)

(assert (=> b!937552 m!872591))

(declare-fun m!872593 () Bool)

(assert (=> b!937552 m!872593))

(declare-fun m!872595 () Bool)

(assert (=> b!937552 m!872595))

(declare-fun m!872597 () Bool)

(assert (=> b!937552 m!872597))

(assert (=> b!937552 m!872579))

(assert (=> b!937552 m!872581))

(declare-fun m!872599 () Bool)

(assert (=> b!937552 m!872599))

(assert (=> b!937552 m!872595))

(declare-fun m!872601 () Bool)

(assert (=> b!937552 m!872601))

(declare-fun m!872603 () Bool)

(assert (=> b!937546 m!872603))

(declare-fun m!872605 () Bool)

(assert (=> start!79826 m!872605))

(declare-fun m!872607 () Bool)

(assert (=> start!79826 m!872607))

(declare-fun m!872609 () Bool)

(assert (=> start!79826 m!872609))

(declare-fun m!872611 () Bool)

(assert (=> b!937554 m!872611))

(declare-fun m!872613 () Bool)

(assert (=> b!937555 m!872613))

(declare-fun m!872615 () Bool)

(assert (=> b!937548 m!872615))

(declare-fun m!872617 () Bool)

(assert (=> b!937550 m!872617))

(declare-fun m!872619 () Bool)

(assert (=> mapNonEmpty!32094 m!872619))

(declare-fun m!872621 () Bool)

(assert (=> b!937541 m!872621))

(declare-fun m!872623 () Bool)

(assert (=> b!937541 m!872623))

(check-sat (not b!937550) b_and!29017 tp_is_empty!20215 (not b!937554) (not b!937552) (not start!79826) (not b!937555) (not mapNonEmpty!32094) (not b!937548) (not b!937546) (not b!937541) (not b_next!17707) (not b_lambda!14127) (not b!937545))
(check-sat b_and!29017 (not b_next!17707))
