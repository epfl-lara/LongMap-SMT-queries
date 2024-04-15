; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112374 () Bool)

(assert start!112374)

(declare-fun b_free!30769 () Bool)

(declare-fun b_next!30769 () Bool)

(assert (=> start!112374 (= b_free!30769 (not b_next!30769))))

(declare-fun tp!107945 () Bool)

(declare-fun b_and!49575 () Bool)

(assert (=> start!112374 (= tp!107945 b_and!49575)))

(declare-fun b!1332103 () Bool)

(declare-fun res!884017 () Bool)

(declare-fun e!758936 () Bool)

(assert (=> b!1332103 (=> (not res!884017) (not e!758936))))

(declare-datatypes ((array!90177 0))(
  ( (array!90178 (arr!43555 (Array (_ BitVec 32) (_ BitVec 64))) (size!44107 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90177)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332103 (= res!884017 (validKeyInArray!0 (select (arr!43555 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56692 () Bool)

(declare-fun mapRes!56692 () Bool)

(assert (=> mapIsEmpty!56692 mapRes!56692))

(declare-fun b!1332104 () Bool)

(declare-fun e!758937 () Bool)

(declare-fun e!758938 () Bool)

(assert (=> b!1332104 (= e!758937 (and e!758938 mapRes!56692))))

(declare-fun condMapEmpty!56692 () Bool)

(declare-datatypes ((V!54009 0))(
  ( (V!54010 (val!18414 Int)) )
))
(declare-datatypes ((ValueCell!17441 0))(
  ( (ValueCellFull!17441 (v!21050 V!54009)) (EmptyCell!17441) )
))
(declare-datatypes ((array!90179 0))(
  ( (array!90180 (arr!43556 (Array (_ BitVec 32) ValueCell!17441)) (size!44108 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90179)

(declare-fun mapDefault!56692 () ValueCell!17441)

(assert (=> b!1332104 (= condMapEmpty!56692 (= (arr!43556 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17441)) mapDefault!56692)))))

(declare-fun b!1332105 () Bool)

(declare-fun res!884013 () Bool)

(assert (=> b!1332105 (=> (not res!884013) (not e!758936))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332105 (= res!884013 (not (= (select (arr!43555 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332107 () Bool)

(declare-fun res!884014 () Bool)

(assert (=> b!1332107 (=> (not res!884014) (not e!758936))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90177 (_ BitVec 32)) Bool)

(assert (=> b!1332107 (= res!884014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332108 () Bool)

(declare-fun res!884012 () Bool)

(assert (=> b!1332108 (=> (not res!884012) (not e!758936))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332108 (= res!884012 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332109 () Bool)

(declare-fun res!884015 () Bool)

(assert (=> b!1332109 (=> (not res!884015) (not e!758936))))

(declare-datatypes ((List!30932 0))(
  ( (Nil!30929) (Cons!30928 (h!32137 (_ BitVec 64)) (t!45106 List!30932)) )
))
(declare-fun arrayNoDuplicates!0 (array!90177 (_ BitVec 32) List!30932) Bool)

(assert (=> b!1332109 (= res!884015 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30929))))

(declare-fun mapNonEmpty!56692 () Bool)

(declare-fun tp!107944 () Bool)

(declare-fun e!758935 () Bool)

(assert (=> mapNonEmpty!56692 (= mapRes!56692 (and tp!107944 e!758935))))

(declare-fun mapValue!56692 () ValueCell!17441)

(declare-fun mapKey!56692 () (_ BitVec 32))

(declare-fun mapRest!56692 () (Array (_ BitVec 32) ValueCell!17441))

(assert (=> mapNonEmpty!56692 (= (arr!43556 _values!1320) (store mapRest!56692 mapKey!56692 mapValue!56692))))

(declare-fun b!1332110 () Bool)

(assert (=> b!1332110 (= e!758936 (not true))))

(declare-datatypes ((tuple2!23798 0))(
  ( (tuple2!23799 (_1!11910 (_ BitVec 64)) (_2!11910 V!54009)) )
))
(declare-datatypes ((List!30933 0))(
  ( (Nil!30930) (Cons!30929 (h!32138 tuple2!23798) (t!45107 List!30933)) )
))
(declare-datatypes ((ListLongMap!21455 0))(
  ( (ListLongMap!21456 (toList!10743 List!30933)) )
))
(declare-fun lt!591699 () ListLongMap!21455)

(declare-fun minValue!1262 () V!54009)

(declare-fun contains!8835 (ListLongMap!21455 (_ BitVec 64)) Bool)

(declare-fun +!4722 (ListLongMap!21455 tuple2!23798) ListLongMap!21455)

(assert (=> b!1332110 (contains!8835 (+!4722 lt!591699 (tuple2!23799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43656 0))(
  ( (Unit!43657) )
))
(declare-fun lt!591695 () Unit!43656)

(declare-fun addStillContains!1176 (ListLongMap!21455 (_ BitVec 64) V!54009 (_ BitVec 64)) Unit!43656)

(assert (=> b!1332110 (= lt!591695 (addStillContains!1176 lt!591699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332110 (contains!8835 lt!591699 k0!1153)))

(declare-fun lt!591696 () V!54009)

(declare-fun lt!591698 () Unit!43656)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!278 ((_ BitVec 64) (_ BitVec 64) V!54009 ListLongMap!21455) Unit!43656)

(assert (=> b!1332110 (= lt!591698 (lemmaInListMapAfterAddingDiffThenInBefore!278 k0!1153 (select (arr!43555 _keys!1590) from!1980) lt!591696 lt!591699))))

(declare-fun lt!591697 () ListLongMap!21455)

(assert (=> b!1332110 (contains!8835 lt!591697 k0!1153)))

(declare-fun lt!591700 () Unit!43656)

(assert (=> b!1332110 (= lt!591700 (lemmaInListMapAfterAddingDiffThenInBefore!278 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591697))))

(assert (=> b!1332110 (= lt!591697 (+!4722 lt!591699 (tuple2!23799 (select (arr!43555 _keys!1590) from!1980) lt!591696)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21975 (ValueCell!17441 V!54009) V!54009)

(declare-fun dynLambda!3652 (Int (_ BitVec 64)) V!54009)

(assert (=> b!1332110 (= lt!591696 (get!21975 (select (arr!43556 _values!1320) from!1980) (dynLambda!3652 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!54009)

(declare-fun getCurrentListMapNoExtraKeys!6360 (array!90177 array!90179 (_ BitVec 32) (_ BitVec 32) V!54009 V!54009 (_ BitVec 32) Int) ListLongMap!21455)

(assert (=> b!1332110 (= lt!591699 (getCurrentListMapNoExtraKeys!6360 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!884016 () Bool)

(assert (=> start!112374 (=> (not res!884016) (not e!758936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112374 (= res!884016 (validMask!0 mask!1998))))

(assert (=> start!112374 e!758936))

(declare-fun array_inv!33035 (array!90179) Bool)

(assert (=> start!112374 (and (array_inv!33035 _values!1320) e!758937)))

(assert (=> start!112374 true))

(declare-fun array_inv!33036 (array!90177) Bool)

(assert (=> start!112374 (array_inv!33036 _keys!1590)))

(assert (=> start!112374 tp!107945))

(declare-fun tp_is_empty!36679 () Bool)

(assert (=> start!112374 tp_is_empty!36679))

(declare-fun b!1332106 () Bool)

(assert (=> b!1332106 (= e!758938 tp_is_empty!36679)))

(declare-fun b!1332111 () Bool)

(declare-fun res!884009 () Bool)

(assert (=> b!1332111 (=> (not res!884009) (not e!758936))))

(assert (=> b!1332111 (= res!884009 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44107 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332112 () Bool)

(declare-fun res!884010 () Bool)

(assert (=> b!1332112 (=> (not res!884010) (not e!758936))))

(declare-fun getCurrentListMap!5603 (array!90177 array!90179 (_ BitVec 32) (_ BitVec 32) V!54009 V!54009 (_ BitVec 32) Int) ListLongMap!21455)

(assert (=> b!1332112 (= res!884010 (contains!8835 (getCurrentListMap!5603 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332113 () Bool)

(assert (=> b!1332113 (= e!758935 tp_is_empty!36679)))

(declare-fun b!1332114 () Bool)

(declare-fun res!884011 () Bool)

(assert (=> b!1332114 (=> (not res!884011) (not e!758936))))

(assert (=> b!1332114 (= res!884011 (and (= (size!44108 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44107 _keys!1590) (size!44108 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112374 res!884016) b!1332114))

(assert (= (and b!1332114 res!884011) b!1332107))

(assert (= (and b!1332107 res!884014) b!1332109))

(assert (= (and b!1332109 res!884015) b!1332111))

(assert (= (and b!1332111 res!884009) b!1332112))

(assert (= (and b!1332112 res!884010) b!1332105))

(assert (= (and b!1332105 res!884013) b!1332103))

(assert (= (and b!1332103 res!884017) b!1332108))

(assert (= (and b!1332108 res!884012) b!1332110))

(assert (= (and b!1332104 condMapEmpty!56692) mapIsEmpty!56692))

(assert (= (and b!1332104 (not condMapEmpty!56692)) mapNonEmpty!56692))

(get-info :version)

(assert (= (and mapNonEmpty!56692 ((_ is ValueCellFull!17441) mapValue!56692)) b!1332113))

(assert (= (and b!1332104 ((_ is ValueCellFull!17441) mapDefault!56692)) b!1332106))

(assert (= start!112374 b!1332104))

(declare-fun b_lambda!24019 () Bool)

(assert (=> (not b_lambda!24019) (not b!1332110)))

(declare-fun t!45105 () Bool)

(declare-fun tb!11977 () Bool)

(assert (=> (and start!112374 (= defaultEntry!1323 defaultEntry!1323) t!45105) tb!11977))

(declare-fun result!25033 () Bool)

(assert (=> tb!11977 (= result!25033 tp_is_empty!36679)))

(assert (=> b!1332110 t!45105))

(declare-fun b_and!49577 () Bool)

(assert (= b_and!49575 (and (=> t!45105 result!25033) b_and!49577)))

(declare-fun m!1220427 () Bool)

(assert (=> b!1332109 m!1220427))

(declare-fun m!1220429 () Bool)

(assert (=> b!1332103 m!1220429))

(assert (=> b!1332103 m!1220429))

(declare-fun m!1220431 () Bool)

(assert (=> b!1332103 m!1220431))

(declare-fun m!1220433 () Bool)

(assert (=> b!1332107 m!1220433))

(declare-fun m!1220435 () Bool)

(assert (=> mapNonEmpty!56692 m!1220435))

(declare-fun m!1220437 () Bool)

(assert (=> b!1332110 m!1220437))

(declare-fun m!1220439 () Bool)

(assert (=> b!1332110 m!1220439))

(declare-fun m!1220441 () Bool)

(assert (=> b!1332110 m!1220441))

(declare-fun m!1220443 () Bool)

(assert (=> b!1332110 m!1220443))

(declare-fun m!1220445 () Bool)

(assert (=> b!1332110 m!1220445))

(declare-fun m!1220447 () Bool)

(assert (=> b!1332110 m!1220447))

(declare-fun m!1220449 () Bool)

(assert (=> b!1332110 m!1220449))

(assert (=> b!1332110 m!1220439))

(declare-fun m!1220451 () Bool)

(assert (=> b!1332110 m!1220451))

(assert (=> b!1332110 m!1220429))

(declare-fun m!1220453 () Bool)

(assert (=> b!1332110 m!1220453))

(assert (=> b!1332110 m!1220441))

(assert (=> b!1332110 m!1220437))

(declare-fun m!1220455 () Bool)

(assert (=> b!1332110 m!1220455))

(declare-fun m!1220457 () Bool)

(assert (=> b!1332110 m!1220457))

(declare-fun m!1220459 () Bool)

(assert (=> b!1332110 m!1220459))

(assert (=> b!1332110 m!1220429))

(assert (=> b!1332105 m!1220429))

(declare-fun m!1220461 () Bool)

(assert (=> b!1332112 m!1220461))

(assert (=> b!1332112 m!1220461))

(declare-fun m!1220463 () Bool)

(assert (=> b!1332112 m!1220463))

(declare-fun m!1220465 () Bool)

(assert (=> start!112374 m!1220465))

(declare-fun m!1220467 () Bool)

(assert (=> start!112374 m!1220467))

(declare-fun m!1220469 () Bool)

(assert (=> start!112374 m!1220469))

(check-sat (not b!1332107) tp_is_empty!36679 (not b_lambda!24019) (not mapNonEmpty!56692) (not start!112374) b_and!49577 (not b!1332103) (not b!1332112) (not b_next!30769) (not b!1332110) (not b!1332109))
(check-sat b_and!49577 (not b_next!30769))
