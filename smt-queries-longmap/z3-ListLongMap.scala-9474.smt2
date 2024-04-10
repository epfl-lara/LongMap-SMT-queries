; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112454 () Bool)

(assert start!112454)

(declare-fun b_free!30849 () Bool)

(declare-fun b_next!30849 () Bool)

(assert (=> start!112454 (= b_free!30849 (not b_next!30849))))

(declare-fun tp!108184 () Bool)

(declare-fun b_and!49699 () Bool)

(assert (=> start!112454 (= tp!108184 b_and!49699)))

(declare-fun mapIsEmpty!56812 () Bool)

(declare-fun mapRes!56812 () Bool)

(assert (=> mapIsEmpty!56812 mapRes!56812))

(declare-fun b!1333342 () Bool)

(declare-fun e!759567 () Bool)

(declare-fun tp_is_empty!36759 () Bool)

(assert (=> b!1333342 (= e!759567 tp_is_empty!36759)))

(declare-fun b!1333343 () Bool)

(declare-fun res!884826 () Bool)

(declare-fun e!759568 () Bool)

(assert (=> b!1333343 (=> (not res!884826) (not e!759568))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90392 0))(
  ( (array!90393 (arr!43662 (Array (_ BitVec 32) (_ BitVec 64))) (size!44212 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90392)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333343 (= res!884826 (not (= (select (arr!43662 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333344 () Bool)

(declare-fun e!759569 () Bool)

(declare-fun e!759570 () Bool)

(assert (=> b!1333344 (= e!759569 (and e!759570 mapRes!56812))))

(declare-fun condMapEmpty!56812 () Bool)

(declare-datatypes ((V!54115 0))(
  ( (V!54116 (val!18454 Int)) )
))
(declare-datatypes ((ValueCell!17481 0))(
  ( (ValueCellFull!17481 (v!21091 V!54115)) (EmptyCell!17481) )
))
(declare-datatypes ((array!90394 0))(
  ( (array!90395 (arr!43663 (Array (_ BitVec 32) ValueCell!17481)) (size!44213 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90394)

(declare-fun mapDefault!56812 () ValueCell!17481)

(assert (=> b!1333344 (= condMapEmpty!56812 (= (arr!43663 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17481)) mapDefault!56812)))))

(declare-fun b!1333345 () Bool)

(assert (=> b!1333345 (= e!759568 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54115)

(declare-fun zeroValue!1262 () V!54115)

(declare-fun lt!592117 () Bool)

(declare-datatypes ((tuple2!23786 0))(
  ( (tuple2!23787 (_1!11904 (_ BitVec 64)) (_2!11904 V!54115)) )
))
(declare-datatypes ((List!30931 0))(
  ( (Nil!30928) (Cons!30927 (h!32136 tuple2!23786) (t!45139 List!30931)) )
))
(declare-datatypes ((ListLongMap!21443 0))(
  ( (ListLongMap!21444 (toList!10737 List!30931)) )
))
(declare-fun contains!8901 (ListLongMap!21443 (_ BitVec 64)) Bool)

(declare-fun +!4711 (ListLongMap!21443 tuple2!23786) ListLongMap!21443)

(declare-fun getCurrentListMapNoExtraKeys!6349 (array!90392 array!90394 (_ BitVec 32) (_ BitVec 32) V!54115 V!54115 (_ BitVec 32) Int) ListLongMap!21443)

(declare-fun get!22023 (ValueCell!17481 V!54115) V!54115)

(declare-fun dynLambda!3650 (Int (_ BitVec 64)) V!54115)

(assert (=> b!1333345 (= lt!592117 (contains!8901 (+!4711 (getCurrentListMapNoExtraKeys!6349 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23787 (select (arr!43662 _keys!1590) from!1980) (get!22023 (select (arr!43663 _values!1320) from!1980) (dynLambda!3650 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1333346 () Bool)

(declare-fun res!884825 () Bool)

(assert (=> b!1333346 (=> (not res!884825) (not e!759568))))

(assert (=> b!1333346 (= res!884825 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333347 () Bool)

(declare-fun res!884827 () Bool)

(assert (=> b!1333347 (=> (not res!884827) (not e!759568))))

(assert (=> b!1333347 (= res!884827 (and (= (size!44213 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44212 _keys!1590) (size!44213 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333348 () Bool)

(declare-fun res!884822 () Bool)

(assert (=> b!1333348 (=> (not res!884822) (not e!759568))))

(declare-fun getCurrentListMap!5718 (array!90392 array!90394 (_ BitVec 32) (_ BitVec 32) V!54115 V!54115 (_ BitVec 32) Int) ListLongMap!21443)

(assert (=> b!1333348 (= res!884822 (contains!8901 (getCurrentListMap!5718 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333349 () Bool)

(assert (=> b!1333349 (= e!759570 tp_is_empty!36759)))

(declare-fun b!1333350 () Bool)

(declare-fun res!884828 () Bool)

(assert (=> b!1333350 (=> (not res!884828) (not e!759568))))

(declare-datatypes ((List!30932 0))(
  ( (Nil!30929) (Cons!30928 (h!32137 (_ BitVec 64)) (t!45140 List!30932)) )
))
(declare-fun arrayNoDuplicates!0 (array!90392 (_ BitVec 32) List!30932) Bool)

(assert (=> b!1333350 (= res!884828 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30929))))

(declare-fun b!1333351 () Bool)

(declare-fun res!884823 () Bool)

(assert (=> b!1333351 (=> (not res!884823) (not e!759568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90392 (_ BitVec 32)) Bool)

(assert (=> b!1333351 (= res!884823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333352 () Bool)

(declare-fun res!884829 () Bool)

(assert (=> b!1333352 (=> (not res!884829) (not e!759568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333352 (= res!884829 (validKeyInArray!0 (select (arr!43662 _keys!1590) from!1980)))))

(declare-fun b!1333353 () Bool)

(declare-fun res!884824 () Bool)

(assert (=> b!1333353 (=> (not res!884824) (not e!759568))))

(assert (=> b!1333353 (= res!884824 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44212 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!884821 () Bool)

(assert (=> start!112454 (=> (not res!884821) (not e!759568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112454 (= res!884821 (validMask!0 mask!1998))))

(assert (=> start!112454 e!759568))

(declare-fun array_inv!32931 (array!90394) Bool)

(assert (=> start!112454 (and (array_inv!32931 _values!1320) e!759569)))

(assert (=> start!112454 true))

(declare-fun array_inv!32932 (array!90392) Bool)

(assert (=> start!112454 (array_inv!32932 _keys!1590)))

(assert (=> start!112454 tp!108184))

(assert (=> start!112454 tp_is_empty!36759))

(declare-fun mapNonEmpty!56812 () Bool)

(declare-fun tp!108183 () Bool)

(assert (=> mapNonEmpty!56812 (= mapRes!56812 (and tp!108183 e!759567))))

(declare-fun mapValue!56812 () ValueCell!17481)

(declare-fun mapKey!56812 () (_ BitVec 32))

(declare-fun mapRest!56812 () (Array (_ BitVec 32) ValueCell!17481))

(assert (=> mapNonEmpty!56812 (= (arr!43663 _values!1320) (store mapRest!56812 mapKey!56812 mapValue!56812))))

(assert (= (and start!112454 res!884821) b!1333347))

(assert (= (and b!1333347 res!884827) b!1333351))

(assert (= (and b!1333351 res!884823) b!1333350))

(assert (= (and b!1333350 res!884828) b!1333353))

(assert (= (and b!1333353 res!884824) b!1333348))

(assert (= (and b!1333348 res!884822) b!1333343))

(assert (= (and b!1333343 res!884826) b!1333352))

(assert (= (and b!1333352 res!884829) b!1333346))

(assert (= (and b!1333346 res!884825) b!1333345))

(assert (= (and b!1333344 condMapEmpty!56812) mapIsEmpty!56812))

(assert (= (and b!1333344 (not condMapEmpty!56812)) mapNonEmpty!56812))

(get-info :version)

(assert (= (and mapNonEmpty!56812 ((_ is ValueCellFull!17481) mapValue!56812)) b!1333342))

(assert (= (and b!1333344 ((_ is ValueCellFull!17481) mapDefault!56812)) b!1333349))

(assert (= start!112454 b!1333344))

(declare-fun b_lambda!24055 () Bool)

(assert (=> (not b_lambda!24055) (not b!1333345)))

(declare-fun t!45138 () Bool)

(declare-fun tb!12011 () Bool)

(assert (=> (and start!112454 (= defaultEntry!1323 defaultEntry!1323) t!45138) tb!12011))

(declare-fun result!25093 () Bool)

(assert (=> tb!12011 (= result!25093 tp_is_empty!36759)))

(assert (=> b!1333345 t!45138))

(declare-fun b_and!49701 () Bool)

(assert (= b_and!49699 (and (=> t!45138 result!25093) b_and!49701)))

(declare-fun m!1221911 () Bool)

(assert (=> b!1333351 m!1221911))

(declare-fun m!1221913 () Bool)

(assert (=> mapNonEmpty!56812 m!1221913))

(declare-fun m!1221915 () Bool)

(assert (=> b!1333348 m!1221915))

(assert (=> b!1333348 m!1221915))

(declare-fun m!1221917 () Bool)

(assert (=> b!1333348 m!1221917))

(declare-fun m!1221919 () Bool)

(assert (=> b!1333345 m!1221919))

(declare-fun m!1221921 () Bool)

(assert (=> b!1333345 m!1221921))

(declare-fun m!1221923 () Bool)

(assert (=> b!1333345 m!1221923))

(declare-fun m!1221925 () Bool)

(assert (=> b!1333345 m!1221925))

(assert (=> b!1333345 m!1221919))

(declare-fun m!1221927 () Bool)

(assert (=> b!1333345 m!1221927))

(assert (=> b!1333345 m!1221923))

(declare-fun m!1221929 () Bool)

(assert (=> b!1333345 m!1221929))

(assert (=> b!1333345 m!1221921))

(assert (=> b!1333345 m!1221925))

(declare-fun m!1221931 () Bool)

(assert (=> b!1333345 m!1221931))

(assert (=> b!1333343 m!1221931))

(declare-fun m!1221933 () Bool)

(assert (=> start!112454 m!1221933))

(declare-fun m!1221935 () Bool)

(assert (=> start!112454 m!1221935))

(declare-fun m!1221937 () Bool)

(assert (=> start!112454 m!1221937))

(assert (=> b!1333352 m!1221931))

(assert (=> b!1333352 m!1221931))

(declare-fun m!1221939 () Bool)

(assert (=> b!1333352 m!1221939))

(declare-fun m!1221941 () Bool)

(assert (=> b!1333350 m!1221941))

(check-sat (not b!1333352) (not b!1333350) (not b_next!30849) (not mapNonEmpty!56812) (not start!112454) b_and!49701 (not b!1333351) (not b_lambda!24055) (not b!1333348) tp_is_empty!36759 (not b!1333345))
(check-sat b_and!49701 (not b_next!30849))
