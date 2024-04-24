; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79074 () Bool)

(assert start!79074)

(declare-fun b_free!17119 () Bool)

(declare-fun b_next!17119 () Bool)

(assert (=> start!79074 (= b_free!17119 (not b_next!17119))))

(declare-fun tp!59799 () Bool)

(declare-fun b_and!27985 () Bool)

(assert (=> start!79074 (= tp!59799 b_and!27985)))

(declare-fun b!923421 () Bool)

(declare-fun e!518201 () Bool)

(declare-fun tp_is_empty!19627 () Bool)

(assert (=> b!923421 (= e!518201 tp_is_empty!19627)))

(declare-fun b!923422 () Bool)

(declare-fun res!622443 () Bool)

(declare-fun e!518200 () Bool)

(assert (=> b!923422 (=> (not res!622443) (not e!518200))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923422 (= res!622443 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923423 () Bool)

(declare-fun res!622437 () Bool)

(declare-fun e!518199 () Bool)

(assert (=> b!923423 (=> (not res!622437) (not e!518199))))

(declare-datatypes ((array!55277 0))(
  ( (array!55278 (arr!26579 (Array (_ BitVec 32) (_ BitVec 64))) (size!27039 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55277)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31135 0))(
  ( (V!31136 (val!9864 Int)) )
))
(declare-datatypes ((ValueCell!9332 0))(
  ( (ValueCellFull!9332 (v!12379 V!31135)) (EmptyCell!9332) )
))
(declare-datatypes ((array!55279 0))(
  ( (array!55280 (arr!26580 (Array (_ BitVec 32) ValueCell!9332)) (size!27040 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55279)

(assert (=> b!923423 (= res!622437 (and (= (size!27040 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27039 _keys!1487) (size!27040 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31197 () Bool)

(declare-fun mapRes!31197 () Bool)

(declare-fun tp!59798 () Bool)

(declare-fun e!518202 () Bool)

(assert (=> mapNonEmpty!31197 (= mapRes!31197 (and tp!59798 e!518202))))

(declare-fun mapValue!31197 () ValueCell!9332)

(declare-fun mapRest!31197 () (Array (_ BitVec 32) ValueCell!9332))

(declare-fun mapKey!31197 () (_ BitVec 32))

(assert (=> mapNonEmpty!31197 (= (arr!26580 _values!1231) (store mapRest!31197 mapKey!31197 mapValue!31197))))

(declare-fun b!923424 () Bool)

(declare-fun res!622446 () Bool)

(assert (=> b!923424 (=> (not res!622446) (not e!518199))))

(declare-datatypes ((List!18640 0))(
  ( (Nil!18637) (Cons!18636 (h!19788 (_ BitVec 64)) (t!26481 List!18640)) )
))
(declare-fun arrayNoDuplicates!0 (array!55277 (_ BitVec 32) List!18640) Bool)

(assert (=> b!923424 (= res!622446 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18637))))

(declare-fun b!923425 () Bool)

(declare-fun e!518203 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!923425 (= e!518203 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923427 () Bool)

(declare-fun e!518206 () Bool)

(assert (=> b!923427 (= e!518200 e!518206)))

(declare-fun res!622440 () Bool)

(assert (=> b!923427 (=> (not res!622440) (not e!518206))))

(declare-fun lt!414644 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923427 (= res!622440 (validKeyInArray!0 lt!414644))))

(assert (=> b!923427 (= lt!414644 (select (arr!26579 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923428 () Bool)

(declare-fun res!622438 () Bool)

(assert (=> b!923428 (=> (not res!622438) (not e!518199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55277 (_ BitVec 32)) Bool)

(assert (=> b!923428 (= res!622438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923429 () Bool)

(declare-fun arrayContainsKey!0 (array!55277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923429 (= e!518203 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923430 () Bool)

(declare-fun e!518204 () Bool)

(assert (=> b!923430 (= e!518204 (and e!518201 mapRes!31197))))

(declare-fun condMapEmpty!31197 () Bool)

(declare-fun mapDefault!31197 () ValueCell!9332)

(assert (=> b!923430 (= condMapEmpty!31197 (= (arr!26580 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9332)) mapDefault!31197)))))

(declare-fun b!923431 () Bool)

(declare-fun res!622445 () Bool)

(assert (=> b!923431 (=> (not res!622445) (not e!518200))))

(assert (=> b!923431 (= res!622445 (validKeyInArray!0 k0!1099))))

(declare-fun b!923432 () Bool)

(assert (=> b!923432 (= e!518199 e!518200)))

(declare-fun res!622441 () Bool)

(assert (=> b!923432 (=> (not res!622441) (not e!518200))))

(declare-datatypes ((tuple2!12824 0))(
  ( (tuple2!12825 (_1!6423 (_ BitVec 64)) (_2!6423 V!31135)) )
))
(declare-datatypes ((List!18641 0))(
  ( (Nil!18638) (Cons!18637 (h!19789 tuple2!12824) (t!26482 List!18641)) )
))
(declare-datatypes ((ListLongMap!11523 0))(
  ( (ListLongMap!11524 (toList!5777 List!18641)) )
))
(declare-fun lt!414650 () ListLongMap!11523)

(declare-fun contains!4850 (ListLongMap!11523 (_ BitVec 64)) Bool)

(assert (=> b!923432 (= res!622441 (contains!4850 lt!414650 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31135)

(declare-fun minValue!1173 () V!31135)

(declare-fun getCurrentListMap!3028 (array!55277 array!55279 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 32) Int) ListLongMap!11523)

(assert (=> b!923432 (= lt!414650 (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923426 () Bool)

(declare-fun res!622439 () Bool)

(assert (=> b!923426 (=> (not res!622439) (not e!518200))))

(declare-fun v!791 () V!31135)

(declare-fun apply!635 (ListLongMap!11523 (_ BitVec 64)) V!31135)

(assert (=> b!923426 (= res!622439 (= (apply!635 lt!414650 k0!1099) v!791))))

(declare-fun res!622444 () Bool)

(assert (=> start!79074 (=> (not res!622444) (not e!518199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79074 (= res!622444 (validMask!0 mask!1881))))

(assert (=> start!79074 e!518199))

(assert (=> start!79074 true))

(assert (=> start!79074 tp_is_empty!19627))

(declare-fun array_inv!20802 (array!55279) Bool)

(assert (=> start!79074 (and (array_inv!20802 _values!1231) e!518204)))

(assert (=> start!79074 tp!59799))

(declare-fun array_inv!20803 (array!55277) Bool)

(assert (=> start!79074 (array_inv!20803 _keys!1487)))

(declare-fun b!923433 () Bool)

(assert (=> b!923433 (= e!518202 tp_is_empty!19627)))

(declare-fun mapIsEmpty!31197 () Bool)

(assert (=> mapIsEmpty!31197 mapRes!31197))

(declare-fun b!923434 () Bool)

(declare-fun res!622442 () Bool)

(assert (=> b!923434 (=> (not res!622442) (not e!518199))))

(assert (=> b!923434 (= res!622442 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27039 _keys!1487))))))

(declare-fun b!923435 () Bool)

(assert (=> b!923435 (= e!518206 (not true))))

(assert (=> b!923435 (not (= lt!414644 k0!1099))))

(declare-datatypes ((Unit!31118 0))(
  ( (Unit!31119) )
))
(declare-fun lt!414643 () Unit!31118)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55277 (_ BitVec 64) (_ BitVec 32) List!18640) Unit!31118)

(assert (=> b!923435 (= lt!414643 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18637))))

(assert (=> b!923435 e!518203))

(declare-fun c!96462 () Bool)

(assert (=> b!923435 (= c!96462 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414648 () Unit!31118)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!194 (array!55277 array!55279 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 64) (_ BitVec 32) Int) Unit!31118)

(assert (=> b!923435 (= lt!414648 (lemmaListMapContainsThenArrayContainsFrom!194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923435 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18637)))

(declare-fun lt!414649 () Unit!31118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55277 (_ BitVec 32) (_ BitVec 32)) Unit!31118)

(assert (=> b!923435 (= lt!414649 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414646 () tuple2!12824)

(declare-fun +!2703 (ListLongMap!11523 tuple2!12824) ListLongMap!11523)

(assert (=> b!923435 (contains!4850 (+!2703 lt!414650 lt!414646) k0!1099)))

(declare-fun lt!414642 () V!31135)

(declare-fun lt!414647 () Unit!31118)

(declare-fun addStillContains!412 (ListLongMap!11523 (_ BitVec 64) V!31135 (_ BitVec 64)) Unit!31118)

(assert (=> b!923435 (= lt!414647 (addStillContains!412 lt!414650 lt!414644 lt!414642 k0!1099))))

(assert (=> b!923435 (= (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2703 (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414646))))

(assert (=> b!923435 (= lt!414646 (tuple2!12825 lt!414644 lt!414642))))

(declare-fun get!13978 (ValueCell!9332 V!31135) V!31135)

(declare-fun dynLambda!1500 (Int (_ BitVec 64)) V!31135)

(assert (=> b!923435 (= lt!414642 (get!13978 (select (arr!26580 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1500 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414645 () Unit!31118)

(declare-fun lemmaListMapRecursiveValidKeyArray!83 (array!55277 array!55279 (_ BitVec 32) (_ BitVec 32) V!31135 V!31135 (_ BitVec 32) Int) Unit!31118)

(assert (=> b!923435 (= lt!414645 (lemmaListMapRecursiveValidKeyArray!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79074 res!622444) b!923423))

(assert (= (and b!923423 res!622437) b!923428))

(assert (= (and b!923428 res!622438) b!923424))

(assert (= (and b!923424 res!622446) b!923434))

(assert (= (and b!923434 res!622442) b!923432))

(assert (= (and b!923432 res!622441) b!923426))

(assert (= (and b!923426 res!622439) b!923422))

(assert (= (and b!923422 res!622443) b!923431))

(assert (= (and b!923431 res!622445) b!923427))

(assert (= (and b!923427 res!622440) b!923435))

(assert (= (and b!923435 c!96462) b!923429))

(assert (= (and b!923435 (not c!96462)) b!923425))

(assert (= (and b!923430 condMapEmpty!31197) mapIsEmpty!31197))

(assert (= (and b!923430 (not condMapEmpty!31197)) mapNonEmpty!31197))

(get-info :version)

(assert (= (and mapNonEmpty!31197 ((_ is ValueCellFull!9332) mapValue!31197)) b!923433))

(assert (= (and b!923430 ((_ is ValueCellFull!9332) mapDefault!31197)) b!923421))

(assert (= start!79074 b!923430))

(declare-fun b_lambda!13635 () Bool)

(assert (=> (not b_lambda!13635) (not b!923435)))

(declare-fun t!26480 () Bool)

(declare-fun tb!5691 () Bool)

(assert (=> (and start!79074 (= defaultEntry!1235 defaultEntry!1235) t!26480) tb!5691))

(declare-fun result!11213 () Bool)

(assert (=> tb!5691 (= result!11213 tp_is_empty!19627)))

(assert (=> b!923435 t!26480))

(declare-fun b_and!27987 () Bool)

(assert (= b_and!27985 (and (=> t!26480 result!11213) b_and!27987)))

(declare-fun m!857893 () Bool)

(assert (=> b!923424 m!857893))

(declare-fun m!857895 () Bool)

(assert (=> b!923432 m!857895))

(declare-fun m!857897 () Bool)

(assert (=> b!923432 m!857897))

(declare-fun m!857899 () Bool)

(assert (=> b!923426 m!857899))

(declare-fun m!857901 () Bool)

(assert (=> mapNonEmpty!31197 m!857901))

(declare-fun m!857903 () Bool)

(assert (=> start!79074 m!857903))

(declare-fun m!857905 () Bool)

(assert (=> start!79074 m!857905))

(declare-fun m!857907 () Bool)

(assert (=> start!79074 m!857907))

(declare-fun m!857909 () Bool)

(assert (=> b!923428 m!857909))

(declare-fun m!857911 () Bool)

(assert (=> b!923427 m!857911))

(declare-fun m!857913 () Bool)

(assert (=> b!923427 m!857913))

(declare-fun m!857915 () Bool)

(assert (=> b!923435 m!857915))

(declare-fun m!857917 () Bool)

(assert (=> b!923435 m!857917))

(declare-fun m!857919 () Bool)

(assert (=> b!923435 m!857919))

(declare-fun m!857921 () Bool)

(assert (=> b!923435 m!857921))

(declare-fun m!857923 () Bool)

(assert (=> b!923435 m!857923))

(declare-fun m!857925 () Bool)

(assert (=> b!923435 m!857925))

(assert (=> b!923435 m!857919))

(assert (=> b!923435 m!857923))

(assert (=> b!923435 m!857925))

(declare-fun m!857927 () Bool)

(assert (=> b!923435 m!857927))

(declare-fun m!857929 () Bool)

(assert (=> b!923435 m!857929))

(declare-fun m!857931 () Bool)

(assert (=> b!923435 m!857931))

(declare-fun m!857933 () Bool)

(assert (=> b!923435 m!857933))

(declare-fun m!857935 () Bool)

(assert (=> b!923435 m!857935))

(declare-fun m!857937 () Bool)

(assert (=> b!923435 m!857937))

(declare-fun m!857939 () Bool)

(assert (=> b!923435 m!857939))

(assert (=> b!923435 m!857933))

(declare-fun m!857941 () Bool)

(assert (=> b!923435 m!857941))

(declare-fun m!857943 () Bool)

(assert (=> b!923429 m!857943))

(declare-fun m!857945 () Bool)

(assert (=> b!923431 m!857945))

(check-sat (not mapNonEmpty!31197) (not b!923428) tp_is_empty!19627 (not b!923426) (not b!923435) (not b_next!17119) (not b!923432) b_and!27987 (not start!79074) (not b!923427) (not b!923424) (not b_lambda!13635) (not b!923429) (not b!923431))
(check-sat b_and!27987 (not b_next!17119))
