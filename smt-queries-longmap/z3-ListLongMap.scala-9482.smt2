; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112502 () Bool)

(assert start!112502)

(declare-fun b_free!30897 () Bool)

(declare-fun b_next!30897 () Bool)

(assert (=> start!112502 (= b_free!30897 (not b_next!30897))))

(declare-fun tp!108327 () Bool)

(declare-fun b_and!49795 () Bool)

(assert (=> start!112502 (= tp!108327 b_and!49795)))

(declare-fun b!1334390 () Bool)

(declare-fun res!885615 () Bool)

(declare-fun e!759999 () Bool)

(assert (=> b!1334390 (=> (not res!885615) (not e!759999))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90480 0))(
  ( (array!90481 (arr!43706 (Array (_ BitVec 32) (_ BitVec 64))) (size!44256 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90480)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334390 (= res!885615 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44256 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334391 () Bool)

(declare-fun res!885605 () Bool)

(assert (=> b!1334391 (=> (not res!885605) (not e!759999))))

(assert (=> b!1334391 (= res!885605 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334392 () Bool)

(declare-fun res!885607 () Bool)

(assert (=> b!1334392 (=> (not res!885607) (not e!759999))))

(declare-datatypes ((List!30965 0))(
  ( (Nil!30962) (Cons!30961 (h!32170 (_ BitVec 64)) (t!45221 List!30965)) )
))
(declare-fun arrayNoDuplicates!0 (array!90480 (_ BitVec 32) List!30965) Bool)

(assert (=> b!1334392 (= res!885607 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30962))))

(declare-fun b!1334393 () Bool)

(declare-fun e!759996 () Bool)

(assert (=> b!1334393 (= e!759999 e!759996)))

(declare-fun res!885611 () Bool)

(assert (=> b!1334393 (=> (not res!885611) (not e!759996))))

(declare-datatypes ((V!54179 0))(
  ( (V!54180 (val!18478 Int)) )
))
(declare-fun lt!592327 () V!54179)

(declare-datatypes ((tuple2!23826 0))(
  ( (tuple2!23827 (_1!11924 (_ BitVec 64)) (_2!11924 V!54179)) )
))
(declare-datatypes ((List!30966 0))(
  ( (Nil!30963) (Cons!30962 (h!32171 tuple2!23826) (t!45222 List!30966)) )
))
(declare-datatypes ((ListLongMap!21483 0))(
  ( (ListLongMap!21484 (toList!10757 List!30966)) )
))
(declare-fun lt!592326 () ListLongMap!21483)

(declare-fun contains!8921 (ListLongMap!21483 (_ BitVec 64)) Bool)

(declare-fun +!4726 (ListLongMap!21483 tuple2!23826) ListLongMap!21483)

(assert (=> b!1334393 (= res!885611 (contains!8921 (+!4726 lt!592326 (tuple2!23827 (select (arr!43706 _keys!1590) from!1980) lt!592327)) k0!1153))))

(declare-datatypes ((ValueCell!17505 0))(
  ( (ValueCellFull!17505 (v!21115 V!54179)) (EmptyCell!17505) )
))
(declare-datatypes ((array!90482 0))(
  ( (array!90483 (arr!43707 (Array (_ BitVec 32) ValueCell!17505)) (size!44257 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90482)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54179)

(declare-fun minValue!1262 () V!54179)

(declare-fun getCurrentListMapNoExtraKeys!6364 (array!90480 array!90482 (_ BitVec 32) (_ BitVec 32) V!54179 V!54179 (_ BitVec 32) Int) ListLongMap!21483)

(assert (=> b!1334393 (= lt!592326 (getCurrentListMapNoExtraKeys!6364 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22054 (ValueCell!17505 V!54179) V!54179)

(declare-fun dynLambda!3665 (Int (_ BitVec 64)) V!54179)

(assert (=> b!1334393 (= lt!592327 (get!22054 (select (arr!43707 _values!1320) from!1980) (dynLambda!3665 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334394 () Bool)

(declare-fun res!885610 () Bool)

(assert (=> b!1334394 (=> (not res!885610) (not e!759999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334394 (= res!885610 (validKeyInArray!0 (select (arr!43706 _keys!1590) from!1980)))))

(declare-fun b!1334395 () Bool)

(declare-fun e!759995 () Bool)

(declare-fun tp_is_empty!36807 () Bool)

(assert (=> b!1334395 (= e!759995 tp_is_empty!36807)))

(declare-fun res!885613 () Bool)

(assert (=> start!112502 (=> (not res!885613) (not e!759999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112502 (= res!885613 (validMask!0 mask!1998))))

(assert (=> start!112502 e!759999))

(declare-fun e!759998 () Bool)

(declare-fun array_inv!32961 (array!90482) Bool)

(assert (=> start!112502 (and (array_inv!32961 _values!1320) e!759998)))

(assert (=> start!112502 true))

(declare-fun array_inv!32962 (array!90480) Bool)

(assert (=> start!112502 (array_inv!32962 _keys!1590)))

(assert (=> start!112502 tp!108327))

(assert (=> start!112502 tp_is_empty!36807))

(declare-fun mapNonEmpty!56884 () Bool)

(declare-fun mapRes!56884 () Bool)

(declare-fun tp!108328 () Bool)

(assert (=> mapNonEmpty!56884 (= mapRes!56884 (and tp!108328 e!759995))))

(declare-fun mapRest!56884 () (Array (_ BitVec 32) ValueCell!17505))

(declare-fun mapValue!56884 () ValueCell!17505)

(declare-fun mapKey!56884 () (_ BitVec 32))

(assert (=> mapNonEmpty!56884 (= (arr!43707 _values!1320) (store mapRest!56884 mapKey!56884 mapValue!56884))))

(declare-fun b!1334396 () Bool)

(declare-fun res!885614 () Bool)

(assert (=> b!1334396 (=> (not res!885614) (not e!759996))))

(assert (=> b!1334396 (= res!885614 (not (= k0!1153 (select (arr!43706 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56884 () Bool)

(assert (=> mapIsEmpty!56884 mapRes!56884))

(declare-fun b!1334397 () Bool)

(declare-fun res!885608 () Bool)

(assert (=> b!1334397 (=> (not res!885608) (not e!759999))))

(assert (=> b!1334397 (= res!885608 (not (= (select (arr!43706 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334398 () Bool)

(declare-fun res!885609 () Bool)

(assert (=> b!1334398 (=> (not res!885609) (not e!759999))))

(declare-fun getCurrentListMap!5732 (array!90480 array!90482 (_ BitVec 32) (_ BitVec 32) V!54179 V!54179 (_ BitVec 32) Int) ListLongMap!21483)

(assert (=> b!1334398 (= res!885609 (contains!8921 (getCurrentListMap!5732 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334399 () Bool)

(declare-fun e!759997 () Bool)

(assert (=> b!1334399 (= e!759998 (and e!759997 mapRes!56884))))

(declare-fun condMapEmpty!56884 () Bool)

(declare-fun mapDefault!56884 () ValueCell!17505)

(assert (=> b!1334399 (= condMapEmpty!56884 (= (arr!43707 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17505)) mapDefault!56884)))))

(declare-fun b!1334400 () Bool)

(declare-fun res!885612 () Bool)

(assert (=> b!1334400 (=> (not res!885612) (not e!759999))))

(assert (=> b!1334400 (= res!885612 (and (= (size!44257 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44256 _keys!1590) (size!44257 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334401 () Bool)

(assert (=> b!1334401 (= e!759996 (not true))))

(assert (=> b!1334401 (contains!8921 lt!592326 k0!1153)))

(declare-datatypes ((Unit!43895 0))(
  ( (Unit!43896) )
))
(declare-fun lt!592325 () Unit!43895)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!310 ((_ BitVec 64) (_ BitVec 64) V!54179 ListLongMap!21483) Unit!43895)

(assert (=> b!1334401 (= lt!592325 (lemmaInListMapAfterAddingDiffThenInBefore!310 k0!1153 (select (arr!43706 _keys!1590) from!1980) lt!592327 lt!592326))))

(declare-fun b!1334402 () Bool)

(assert (=> b!1334402 (= e!759997 tp_is_empty!36807)))

(declare-fun b!1334403 () Bool)

(declare-fun res!885606 () Bool)

(assert (=> b!1334403 (=> (not res!885606) (not e!759999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90480 (_ BitVec 32)) Bool)

(assert (=> b!1334403 (= res!885606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112502 res!885613) b!1334400))

(assert (= (and b!1334400 res!885612) b!1334403))

(assert (= (and b!1334403 res!885606) b!1334392))

(assert (= (and b!1334392 res!885607) b!1334390))

(assert (= (and b!1334390 res!885615) b!1334398))

(assert (= (and b!1334398 res!885609) b!1334397))

(assert (= (and b!1334397 res!885608) b!1334394))

(assert (= (and b!1334394 res!885610) b!1334391))

(assert (= (and b!1334391 res!885605) b!1334393))

(assert (= (and b!1334393 res!885611) b!1334396))

(assert (= (and b!1334396 res!885614) b!1334401))

(assert (= (and b!1334399 condMapEmpty!56884) mapIsEmpty!56884))

(assert (= (and b!1334399 (not condMapEmpty!56884)) mapNonEmpty!56884))

(get-info :version)

(assert (= (and mapNonEmpty!56884 ((_ is ValueCellFull!17505) mapValue!56884)) b!1334395))

(assert (= (and b!1334399 ((_ is ValueCellFull!17505) mapDefault!56884)) b!1334402))

(assert (= start!112502 b!1334399))

(declare-fun b_lambda!24103 () Bool)

(assert (=> (not b_lambda!24103) (not b!1334393)))

(declare-fun t!45220 () Bool)

(declare-fun tb!12059 () Bool)

(assert (=> (and start!112502 (= defaultEntry!1323 defaultEntry!1323) t!45220) tb!12059))

(declare-fun result!25189 () Bool)

(assert (=> tb!12059 (= result!25189 tp_is_empty!36807)))

(assert (=> b!1334393 t!45220))

(declare-fun b_and!49797 () Bool)

(assert (= b_and!49795 (and (=> t!45220 result!25189) b_and!49797)))

(declare-fun m!1222767 () Bool)

(assert (=> b!1334396 m!1222767))

(declare-fun m!1222769 () Bool)

(assert (=> start!112502 m!1222769))

(declare-fun m!1222771 () Bool)

(assert (=> start!112502 m!1222771))

(declare-fun m!1222773 () Bool)

(assert (=> start!112502 m!1222773))

(assert (=> b!1334394 m!1222767))

(assert (=> b!1334394 m!1222767))

(declare-fun m!1222775 () Bool)

(assert (=> b!1334394 m!1222775))

(declare-fun m!1222777 () Bool)

(assert (=> b!1334403 m!1222777))

(assert (=> b!1334397 m!1222767))

(declare-fun m!1222779 () Bool)

(assert (=> b!1334398 m!1222779))

(assert (=> b!1334398 m!1222779))

(declare-fun m!1222781 () Bool)

(assert (=> b!1334398 m!1222781))

(declare-fun m!1222783 () Bool)

(assert (=> b!1334392 m!1222783))

(declare-fun m!1222785 () Bool)

(assert (=> mapNonEmpty!56884 m!1222785))

(declare-fun m!1222787 () Bool)

(assert (=> b!1334393 m!1222787))

(declare-fun m!1222789 () Bool)

(assert (=> b!1334393 m!1222789))

(assert (=> b!1334393 m!1222787))

(declare-fun m!1222791 () Bool)

(assert (=> b!1334393 m!1222791))

(declare-fun m!1222793 () Bool)

(assert (=> b!1334393 m!1222793))

(assert (=> b!1334393 m!1222789))

(declare-fun m!1222795 () Bool)

(assert (=> b!1334393 m!1222795))

(assert (=> b!1334393 m!1222795))

(declare-fun m!1222797 () Bool)

(assert (=> b!1334393 m!1222797))

(assert (=> b!1334393 m!1222767))

(declare-fun m!1222799 () Bool)

(assert (=> b!1334401 m!1222799))

(assert (=> b!1334401 m!1222767))

(assert (=> b!1334401 m!1222767))

(declare-fun m!1222801 () Bool)

(assert (=> b!1334401 m!1222801))

(check-sat (not b!1334401) b_and!49797 (not b!1334392) (not b!1334403) (not b_lambda!24103) (not b!1334398) tp_is_empty!36807 (not start!112502) (not b!1334394) (not b_next!30897) (not b!1334393) (not mapNonEmpty!56884))
(check-sat b_and!49797 (not b_next!30897))
