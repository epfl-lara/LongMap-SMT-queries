; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79378 () Bool)

(assert start!79378)

(declare-fun b_free!17565 () Bool)

(declare-fun b_next!17565 () Bool)

(assert (=> start!79378 (= b_free!17565 (not b_next!17565))))

(declare-fun tp!61139 () Bool)

(declare-fun b_and!28689 () Bool)

(assert (=> start!79378 (= tp!61139 b_and!28689)))

(declare-fun b!932568 () Bool)

(declare-fun e!523696 () Bool)

(declare-fun e!523700 () Bool)

(assert (=> b!932568 (= e!523696 e!523700)))

(declare-fun res!628081 () Bool)

(assert (=> b!932568 (=> (not res!628081) (not e!523700))))

(declare-fun lt!419954 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932568 (= res!628081 (validKeyInArray!0 lt!419954))))

(declare-datatypes ((array!56084 0))(
  ( (array!56085 (arr!26986 (Array (_ BitVec 32) (_ BitVec 64))) (size!27445 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56084)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932568 (= lt!419954 (select (arr!26986 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932569 () Bool)

(declare-fun res!628075 () Bool)

(declare-fun e!523701 () Bool)

(assert (=> b!932569 (=> (not res!628075) (not e!523701))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56084 (_ BitVec 32)) Bool)

(assert (=> b!932569 (= res!628075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932570 () Bool)

(declare-fun e!523699 () Bool)

(declare-fun tp_is_empty!20073 () Bool)

(assert (=> b!932570 (= e!523699 tp_is_empty!20073)))

(declare-fun mapNonEmpty!31869 () Bool)

(declare-fun mapRes!31869 () Bool)

(declare-fun tp!61138 () Bool)

(assert (=> mapNonEmpty!31869 (= mapRes!31869 (and tp!61138 e!523699))))

(declare-datatypes ((V!31729 0))(
  ( (V!31730 (val!10087 Int)) )
))
(declare-datatypes ((ValueCell!9555 0))(
  ( (ValueCellFull!9555 (v!12606 V!31729)) (EmptyCell!9555) )
))
(declare-fun mapRest!31869 () (Array (_ BitVec 32) ValueCell!9555))

(declare-fun mapKey!31869 () (_ BitVec 32))

(declare-fun mapValue!31869 () ValueCell!9555)

(declare-datatypes ((array!56086 0))(
  ( (array!56087 (arr!26987 (Array (_ BitVec 32) ValueCell!9555)) (size!27446 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56086)

(assert (=> mapNonEmpty!31869 (= (arr!26987 _values!1231) (store mapRest!31869 mapKey!31869 mapValue!31869))))

(declare-fun res!628079 () Bool)

(assert (=> start!79378 (=> (not res!628079) (not e!523701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79378 (= res!628079 (validMask!0 mask!1881))))

(assert (=> start!79378 e!523701))

(assert (=> start!79378 true))

(assert (=> start!79378 tp_is_empty!20073))

(declare-fun e!523697 () Bool)

(declare-fun array_inv!21004 (array!56086) Bool)

(assert (=> start!79378 (and (array_inv!21004 _values!1231) e!523697)))

(assert (=> start!79378 tp!61139))

(declare-fun array_inv!21005 (array!56084) Bool)

(assert (=> start!79378 (array_inv!21005 _keys!1487)))

(declare-fun b!932571 () Bool)

(declare-fun res!628083 () Bool)

(assert (=> b!932571 (=> (not res!628083) (not e!523696))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31729)

(declare-datatypes ((tuple2!13216 0))(
  ( (tuple2!13217 (_1!6619 (_ BitVec 64)) (_2!6619 V!31729)) )
))
(declare-datatypes ((List!18999 0))(
  ( (Nil!18996) (Cons!18995 (h!20141 tuple2!13216) (t!27108 List!18999)) )
))
(declare-datatypes ((ListLongMap!11913 0))(
  ( (ListLongMap!11914 (toList!5972 List!18999)) )
))
(declare-fun lt!419956 () ListLongMap!11913)

(declare-fun apply!785 (ListLongMap!11913 (_ BitVec 64)) V!31729)

(assert (=> b!932571 (= res!628083 (= (apply!785 lt!419956 k0!1099) v!791))))

(declare-fun b!932572 () Bool)

(declare-fun res!628078 () Bool)

(assert (=> b!932572 (=> (not res!628078) (not e!523696))))

(assert (=> b!932572 (= res!628078 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932573 () Bool)

(declare-fun e!523695 () Bool)

(assert (=> b!932573 (= e!523695 tp_is_empty!20073)))

(declare-fun b!932574 () Bool)

(declare-fun res!628082 () Bool)

(assert (=> b!932574 (=> (not res!628082) (not e!523701))))

(assert (=> b!932574 (= res!628082 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27445 _keys!1487))))))

(declare-fun b!932575 () Bool)

(assert (=> b!932575 (= e!523701 e!523696)))

(declare-fun res!628084 () Bool)

(assert (=> b!932575 (=> (not res!628084) (not e!523696))))

(declare-fun contains!5021 (ListLongMap!11913 (_ BitVec 64)) Bool)

(assert (=> b!932575 (= res!628084 (contains!5021 lt!419956 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31729)

(declare-fun minValue!1173 () V!31729)

(declare-fun getCurrentListMap!3210 (array!56084 array!56086 (_ BitVec 32) (_ BitVec 32) V!31729 V!31729 (_ BitVec 32) Int) ListLongMap!11913)

(assert (=> b!932575 (= lt!419956 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932576 () Bool)

(declare-fun res!628076 () Bool)

(assert (=> b!932576 (=> (not res!628076) (not e!523696))))

(assert (=> b!932576 (= res!628076 (validKeyInArray!0 k0!1099))))

(declare-fun b!932577 () Bool)

(declare-fun res!628077 () Bool)

(assert (=> b!932577 (=> (not res!628077) (not e!523701))))

(assert (=> b!932577 (= res!628077 (and (= (size!27446 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27445 _keys!1487) (size!27446 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31869 () Bool)

(assert (=> mapIsEmpty!31869 mapRes!31869))

(declare-fun b!932578 () Bool)

(declare-fun res!628080 () Bool)

(assert (=> b!932578 (=> (not res!628080) (not e!523701))))

(declare-datatypes ((List!19000 0))(
  ( (Nil!18997) (Cons!18996 (h!20142 (_ BitVec 64)) (t!27109 List!19000)) )
))
(declare-fun arrayNoDuplicates!0 (array!56084 (_ BitVec 32) List!19000) Bool)

(assert (=> b!932578 (= res!628080 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18997))))

(declare-fun b!932579 () Bool)

(assert (=> b!932579 (= e!523697 (and e!523695 mapRes!31869))))

(declare-fun condMapEmpty!31869 () Bool)

(declare-fun mapDefault!31869 () ValueCell!9555)

(assert (=> b!932579 (= condMapEmpty!31869 (= (arr!26987 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9555)) mapDefault!31869)))))

(declare-fun b!932580 () Bool)

(assert (=> b!932580 (= e!523700 (not true))))

(assert (=> b!932580 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18997)))

(declare-datatypes ((Unit!31469 0))(
  ( (Unit!31470) )
))
(declare-fun lt!419959 () Unit!31469)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56084 (_ BitVec 32) (_ BitVec 32)) Unit!31469)

(assert (=> b!932580 (= lt!419959 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419958 () tuple2!13216)

(declare-fun +!2777 (ListLongMap!11913 tuple2!13216) ListLongMap!11913)

(assert (=> b!932580 (contains!5021 (+!2777 lt!419956 lt!419958) k0!1099)))

(declare-fun lt!419960 () V!31729)

(declare-fun lt!419957 () Unit!31469)

(declare-fun addStillContains!496 (ListLongMap!11913 (_ BitVec 64) V!31729 (_ BitVec 64)) Unit!31469)

(assert (=> b!932580 (= lt!419957 (addStillContains!496 lt!419956 lt!419954 lt!419960 k0!1099))))

(assert (=> b!932580 (= (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2777 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419958))))

(assert (=> b!932580 (= lt!419958 (tuple2!13217 lt!419954 lt!419960))))

(declare-fun get!14191 (ValueCell!9555 V!31729) V!31729)

(declare-fun dynLambda!1566 (Int (_ BitVec 64)) V!31729)

(assert (=> b!932580 (= lt!419960 (get!14191 (select (arr!26987 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1566 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419955 () Unit!31469)

(declare-fun lemmaListMapRecursiveValidKeyArray!167 (array!56084 array!56086 (_ BitVec 32) (_ BitVec 32) V!31729 V!31729 (_ BitVec 32) Int) Unit!31469)

(assert (=> b!932580 (= lt!419955 (lemmaListMapRecursiveValidKeyArray!167 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79378 res!628079) b!932577))

(assert (= (and b!932577 res!628077) b!932569))

(assert (= (and b!932569 res!628075) b!932578))

(assert (= (and b!932578 res!628080) b!932574))

(assert (= (and b!932574 res!628082) b!932575))

(assert (= (and b!932575 res!628084) b!932571))

(assert (= (and b!932571 res!628083) b!932572))

(assert (= (and b!932572 res!628078) b!932576))

(assert (= (and b!932576 res!628076) b!932568))

(assert (= (and b!932568 res!628081) b!932580))

(assert (= (and b!932579 condMapEmpty!31869) mapIsEmpty!31869))

(assert (= (and b!932579 (not condMapEmpty!31869)) mapNonEmpty!31869))

(get-info :version)

(assert (= (and mapNonEmpty!31869 ((_ is ValueCellFull!9555) mapValue!31869)) b!932570))

(assert (= (and b!932579 ((_ is ValueCellFull!9555) mapDefault!31869)) b!932573))

(assert (= start!79378 b!932579))

(declare-fun b_lambda!13899 () Bool)

(assert (=> (not b_lambda!13899) (not b!932580)))

(declare-fun t!27107 () Bool)

(declare-fun tb!5959 () Bool)

(assert (=> (and start!79378 (= defaultEntry!1235 defaultEntry!1235) t!27107) tb!5959))

(declare-fun result!11743 () Bool)

(assert (=> tb!5959 (= result!11743 tp_is_empty!20073)))

(assert (=> b!932580 t!27107))

(declare-fun b_and!28691 () Bool)

(assert (= b_and!28689 (and (=> t!27107 result!11743) b_and!28691)))

(declare-fun m!866551 () Bool)

(assert (=> b!932580 m!866551))

(declare-fun m!866553 () Bool)

(assert (=> b!932580 m!866553))

(declare-fun m!866555 () Bool)

(assert (=> b!932580 m!866555))

(declare-fun m!866557 () Bool)

(assert (=> b!932580 m!866557))

(declare-fun m!866559 () Bool)

(assert (=> b!932580 m!866559))

(declare-fun m!866561 () Bool)

(assert (=> b!932580 m!866561))

(assert (=> b!932580 m!866557))

(assert (=> b!932580 m!866559))

(declare-fun m!866563 () Bool)

(assert (=> b!932580 m!866563))

(declare-fun m!866565 () Bool)

(assert (=> b!932580 m!866565))

(declare-fun m!866567 () Bool)

(assert (=> b!932580 m!866567))

(declare-fun m!866569 () Bool)

(assert (=> b!932580 m!866569))

(assert (=> b!932580 m!866551))

(declare-fun m!866571 () Bool)

(assert (=> b!932580 m!866571))

(assert (=> b!932580 m!866561))

(declare-fun m!866573 () Bool)

(assert (=> b!932580 m!866573))

(declare-fun m!866575 () Bool)

(assert (=> b!932575 m!866575))

(declare-fun m!866577 () Bool)

(assert (=> b!932575 m!866577))

(declare-fun m!866579 () Bool)

(assert (=> b!932576 m!866579))

(declare-fun m!866581 () Bool)

(assert (=> b!932568 m!866581))

(declare-fun m!866583 () Bool)

(assert (=> b!932568 m!866583))

(declare-fun m!866585 () Bool)

(assert (=> b!932571 m!866585))

(declare-fun m!866587 () Bool)

(assert (=> mapNonEmpty!31869 m!866587))

(declare-fun m!866589 () Bool)

(assert (=> b!932578 m!866589))

(declare-fun m!866591 () Bool)

(assert (=> b!932569 m!866591))

(declare-fun m!866593 () Bool)

(assert (=> start!79378 m!866593))

(declare-fun m!866595 () Bool)

(assert (=> start!79378 m!866595))

(declare-fun m!866597 () Bool)

(assert (=> start!79378 m!866597))

(check-sat (not mapNonEmpty!31869) tp_is_empty!20073 b_and!28691 (not b!932569) (not start!79378) (not b_lambda!13899) (not b!932568) (not b!932575) (not b!932576) (not b_next!17565) (not b!932571) (not b!932580) (not b!932578))
(check-sat b_and!28691 (not b_next!17565))
