; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112334 () Bool)

(assert start!112334)

(declare-fun b_free!30729 () Bool)

(declare-fun b_next!30729 () Bool)

(assert (=> start!112334 (= b_free!30729 (not b_next!30729))))

(declare-fun tp!107824 () Bool)

(declare-fun b_and!49513 () Bool)

(assert (=> start!112334 (= tp!107824 b_and!49513)))

(declare-fun b!1331413 () Bool)

(declare-fun e!758670 () Bool)

(declare-fun tp_is_empty!36639 () Bool)

(assert (=> b!1331413 (= e!758670 tp_is_empty!36639)))

(declare-fun b!1331414 () Bool)

(declare-fun res!883503 () Bool)

(declare-fun e!758671 () Bool)

(assert (=> b!1331414 (=> (not res!883503) (not e!758671))))

(declare-datatypes ((array!90158 0))(
  ( (array!90159 (arr!43545 (Array (_ BitVec 32) (_ BitVec 64))) (size!44095 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90158)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90158 (_ BitVec 32)) Bool)

(assert (=> b!1331414 (= res!883503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331415 () Bool)

(declare-fun e!758669 () Bool)

(assert (=> b!1331415 (= e!758669 tp_is_empty!36639)))

(declare-fun mapNonEmpty!56632 () Bool)

(declare-fun mapRes!56632 () Bool)

(declare-fun tp!107823 () Bool)

(assert (=> mapNonEmpty!56632 (= mapRes!56632 (and tp!107823 e!758670))))

(declare-datatypes ((V!53955 0))(
  ( (V!53956 (val!18394 Int)) )
))
(declare-datatypes ((ValueCell!17421 0))(
  ( (ValueCellFull!17421 (v!21031 V!53955)) (EmptyCell!17421) )
))
(declare-fun mapValue!56632 () ValueCell!17421)

(declare-datatypes ((array!90160 0))(
  ( (array!90161 (arr!43546 (Array (_ BitVec 32) ValueCell!17421)) (size!44096 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90160)

(declare-fun mapRest!56632 () (Array (_ BitVec 32) ValueCell!17421))

(declare-fun mapKey!56632 () (_ BitVec 32))

(assert (=> mapNonEmpty!56632 (= (arr!43546 _values!1320) (store mapRest!56632 mapKey!56632 mapValue!56632))))

(declare-fun b!1331416 () Bool)

(declare-fun res!883501 () Bool)

(assert (=> b!1331416 (=> (not res!883501) (not e!758671))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331416 (= res!883501 (validKeyInArray!0 (select (arr!43545 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56632 () Bool)

(assert (=> mapIsEmpty!56632 mapRes!56632))

(declare-fun b!1331417 () Bool)

(declare-fun res!883505 () Bool)

(assert (=> b!1331417 (=> (not res!883505) (not e!758671))))

(declare-datatypes ((List!30841 0))(
  ( (Nil!30838) (Cons!30837 (h!32046 (_ BitVec 64)) (t!44983 List!30841)) )
))
(declare-fun arrayNoDuplicates!0 (array!90158 (_ BitVec 32) List!30841) Bool)

(assert (=> b!1331417 (= res!883505 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30838))))

(declare-fun b!1331418 () Bool)

(declare-fun res!883504 () Bool)

(assert (=> b!1331418 (=> (not res!883504) (not e!758671))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331418 (= res!883504 (and (= (size!44096 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44095 _keys!1590) (size!44096 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331419 () Bool)

(declare-fun res!883506 () Bool)

(assert (=> b!1331419 (=> (not res!883506) (not e!758671))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331419 (= res!883506 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44095 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!883502 () Bool)

(assert (=> start!112334 (=> (not res!883502) (not e!758671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112334 (= res!883502 (validMask!0 mask!1998))))

(assert (=> start!112334 e!758671))

(declare-fun e!758668 () Bool)

(declare-fun array_inv!32845 (array!90160) Bool)

(assert (=> start!112334 (and (array_inv!32845 _values!1320) e!758668)))

(assert (=> start!112334 true))

(declare-fun array_inv!32846 (array!90158) Bool)

(assert (=> start!112334 (array_inv!32846 _keys!1590)))

(assert (=> start!112334 tp!107824))

(assert (=> start!112334 tp_is_empty!36639))

(declare-fun b!1331420 () Bool)

(assert (=> b!1331420 (= e!758671 (not true))))

(declare-datatypes ((tuple2!23692 0))(
  ( (tuple2!23693 (_1!11857 (_ BitVec 64)) (_2!11857 V!53955)) )
))
(declare-datatypes ((List!30842 0))(
  ( (Nil!30839) (Cons!30838 (h!32047 tuple2!23692) (t!44984 List!30842)) )
))
(declare-datatypes ((ListLongMap!21349 0))(
  ( (ListLongMap!21350 (toList!10690 List!30842)) )
))
(declare-fun lt!591526 () ListLongMap!21349)

(declare-fun contains!8854 (ListLongMap!21349 (_ BitVec 64)) Bool)

(assert (=> b!1331420 (contains!8854 lt!591526 k0!1153)))

(declare-datatypes ((Unit!43817 0))(
  ( (Unit!43818) )
))
(declare-fun lt!591527 () Unit!43817)

(declare-fun lt!591529 () V!53955)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!271 ((_ BitVec 64) (_ BitVec 64) V!53955 ListLongMap!21349) Unit!43817)

(assert (=> b!1331420 (= lt!591527 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 (select (arr!43545 _keys!1590) from!1980) lt!591529 lt!591526))))

(declare-fun lt!591528 () ListLongMap!21349)

(assert (=> b!1331420 (contains!8854 lt!591528 k0!1153)))

(declare-fun minValue!1262 () V!53955)

(declare-fun lt!591525 () Unit!43817)

(assert (=> b!1331420 (= lt!591525 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591528))))

(declare-fun +!4684 (ListLongMap!21349 tuple2!23692) ListLongMap!21349)

(assert (=> b!1331420 (= lt!591528 (+!4684 lt!591526 (tuple2!23693 (select (arr!43545 _keys!1590) from!1980) lt!591529)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21956 (ValueCell!17421 V!53955) V!53955)

(declare-fun dynLambda!3623 (Int (_ BitVec 64)) V!53955)

(assert (=> b!1331420 (= lt!591529 (get!21956 (select (arr!43546 _values!1320) from!1980) (dynLambda!3623 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53955)

(declare-fun getCurrentListMapNoExtraKeys!6322 (array!90158 array!90160 (_ BitVec 32) (_ BitVec 32) V!53955 V!53955 (_ BitVec 32) Int) ListLongMap!21349)

(assert (=> b!1331420 (= lt!591526 (getCurrentListMapNoExtraKeys!6322 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331421 () Bool)

(declare-fun res!883499 () Bool)

(assert (=> b!1331421 (=> (not res!883499) (not e!758671))))

(declare-fun getCurrentListMap!5675 (array!90158 array!90160 (_ BitVec 32) (_ BitVec 32) V!53955 V!53955 (_ BitVec 32) Int) ListLongMap!21349)

(assert (=> b!1331421 (= res!883499 (contains!8854 (getCurrentListMap!5675 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331422 () Bool)

(declare-fun res!883500 () Bool)

(assert (=> b!1331422 (=> (not res!883500) (not e!758671))))

(assert (=> b!1331422 (= res!883500 (not (= (select (arr!43545 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331423 () Bool)

(declare-fun res!883498 () Bool)

(assert (=> b!1331423 (=> (not res!883498) (not e!758671))))

(assert (=> b!1331423 (= res!883498 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331424 () Bool)

(assert (=> b!1331424 (= e!758668 (and e!758669 mapRes!56632))))

(declare-fun condMapEmpty!56632 () Bool)

(declare-fun mapDefault!56632 () ValueCell!17421)

(assert (=> b!1331424 (= condMapEmpty!56632 (= (arr!43546 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17421)) mapDefault!56632)))))

(assert (= (and start!112334 res!883502) b!1331418))

(assert (= (and b!1331418 res!883504) b!1331414))

(assert (= (and b!1331414 res!883503) b!1331417))

(assert (= (and b!1331417 res!883505) b!1331419))

(assert (= (and b!1331419 res!883506) b!1331421))

(assert (= (and b!1331421 res!883499) b!1331422))

(assert (= (and b!1331422 res!883500) b!1331416))

(assert (= (and b!1331416 res!883501) b!1331423))

(assert (= (and b!1331423 res!883498) b!1331420))

(assert (= (and b!1331424 condMapEmpty!56632) mapIsEmpty!56632))

(assert (= (and b!1331424 (not condMapEmpty!56632)) mapNonEmpty!56632))

(get-info :version)

(assert (= (and mapNonEmpty!56632 ((_ is ValueCellFull!17421) mapValue!56632)) b!1331413))

(assert (= (and b!1331424 ((_ is ValueCellFull!17421) mapDefault!56632)) b!1331415))

(assert (= start!112334 b!1331424))

(declare-fun b_lambda!23989 () Bool)

(assert (=> (not b_lambda!23989) (not b!1331420)))

(declare-fun t!44982 () Bool)

(declare-fun tb!11945 () Bool)

(assert (=> (and start!112334 (= defaultEntry!1323 defaultEntry!1323) t!44982) tb!11945))

(declare-fun result!24961 () Bool)

(assert (=> tb!11945 (= result!24961 tp_is_empty!36639)))

(assert (=> b!1331420 t!44982))

(declare-fun b_and!49515 () Bool)

(assert (= b_and!49513 (and (=> t!44982 result!24961) b_and!49515)))

(declare-fun m!1220075 () Bool)

(assert (=> b!1331414 m!1220075))

(declare-fun m!1220077 () Bool)

(assert (=> b!1331416 m!1220077))

(assert (=> b!1331416 m!1220077))

(declare-fun m!1220079 () Bool)

(assert (=> b!1331416 m!1220079))

(declare-fun m!1220081 () Bool)

(assert (=> b!1331417 m!1220081))

(declare-fun m!1220083 () Bool)

(assert (=> b!1331421 m!1220083))

(assert (=> b!1331421 m!1220083))

(declare-fun m!1220085 () Bool)

(assert (=> b!1331421 m!1220085))

(declare-fun m!1220087 () Bool)

(assert (=> mapNonEmpty!56632 m!1220087))

(declare-fun m!1220089 () Bool)

(assert (=> b!1331420 m!1220089))

(declare-fun m!1220091 () Bool)

(assert (=> b!1331420 m!1220091))

(assert (=> b!1331420 m!1220089))

(declare-fun m!1220093 () Bool)

(assert (=> b!1331420 m!1220093))

(declare-fun m!1220095 () Bool)

(assert (=> b!1331420 m!1220095))

(declare-fun m!1220097 () Bool)

(assert (=> b!1331420 m!1220097))

(declare-fun m!1220099 () Bool)

(assert (=> b!1331420 m!1220099))

(assert (=> b!1331420 m!1220091))

(assert (=> b!1331420 m!1220077))

(declare-fun m!1220101 () Bool)

(assert (=> b!1331420 m!1220101))

(assert (=> b!1331420 m!1220077))

(declare-fun m!1220103 () Bool)

(assert (=> b!1331420 m!1220103))

(declare-fun m!1220105 () Bool)

(assert (=> b!1331420 m!1220105))

(assert (=> b!1331422 m!1220077))

(declare-fun m!1220107 () Bool)

(assert (=> start!112334 m!1220107))

(declare-fun m!1220109 () Bool)

(assert (=> start!112334 m!1220109))

(declare-fun m!1220111 () Bool)

(assert (=> start!112334 m!1220111))

(check-sat (not b!1331417) (not b!1331421) (not b!1331420) tp_is_empty!36639 b_and!49515 (not b_lambda!23989) (not mapNonEmpty!56632) (not b!1331414) (not start!112334) (not b!1331416) (not b_next!30729))
(check-sat b_and!49515 (not b_next!30729))
