; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112694 () Bool)

(assert start!112694)

(declare-fun b_free!30865 () Bool)

(declare-fun b_next!30865 () Bool)

(assert (=> start!112694 (= b_free!30865 (not b_next!30865))))

(declare-fun tp!108231 () Bool)

(declare-fun b_and!49733 () Bool)

(assert (=> start!112694 (= tp!108231 b_and!49733)))

(declare-fun b!1334985 () Bool)

(declare-fun res!885605 () Bool)

(declare-fun e!760552 () Bool)

(assert (=> b!1334985 (=> (not res!885605) (not e!760552))))

(declare-datatypes ((V!54137 0))(
  ( (V!54138 (val!18462 Int)) )
))
(declare-datatypes ((ValueCell!17489 0))(
  ( (ValueCellFull!17489 (v!21094 V!54137)) (EmptyCell!17489) )
))
(declare-datatypes ((array!90523 0))(
  ( (array!90524 (arr!43723 (Array (_ BitVec 32) ValueCell!17489)) (size!44274 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90523)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90525 0))(
  ( (array!90526 (arr!43724 (Array (_ BitVec 32) (_ BitVec 64))) (size!44275 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90525)

(assert (=> b!1334985 (= res!885605 (and (= (size!44274 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44275 _keys!1590) (size!44274 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334986 () Bool)

(declare-fun res!885603 () Bool)

(assert (=> b!1334986 (=> (not res!885603) (not e!760552))))

(declare-datatypes ((List!30979 0))(
  ( (Nil!30976) (Cons!30975 (h!32193 (_ BitVec 64)) (t!45195 List!30979)) )
))
(declare-fun arrayNoDuplicates!0 (array!90525 (_ BitVec 32) List!30979) Bool)

(assert (=> b!1334986 (= res!885603 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30976))))

(declare-fun b!1334987 () Bool)

(declare-fun e!760555 () Bool)

(assert (=> b!1334987 (= e!760552 e!760555)))

(declare-fun res!885597 () Bool)

(assert (=> b!1334987 (=> (not res!885597) (not e!760555))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592658 () V!54137)

(declare-datatypes ((tuple2!23824 0))(
  ( (tuple2!23825 (_1!11923 (_ BitVec 64)) (_2!11923 V!54137)) )
))
(declare-datatypes ((List!30980 0))(
  ( (Nil!30977) (Cons!30976 (h!32194 tuple2!23824) (t!45196 List!30980)) )
))
(declare-datatypes ((ListLongMap!21489 0))(
  ( (ListLongMap!21490 (toList!10760 List!30980)) )
))
(declare-fun lt!592657 () ListLongMap!21489)

(declare-fun contains!8936 (ListLongMap!21489 (_ BitVec 64)) Bool)

(declare-fun +!4752 (ListLongMap!21489 tuple2!23824) ListLongMap!21489)

(assert (=> b!1334987 (= res!885597 (contains!8936 (+!4752 lt!592657 (tuple2!23825 (select (arr!43724 _keys!1590) from!1980) lt!592658)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54137)

(declare-fun zeroValue!1262 () V!54137)

(declare-fun getCurrentListMapNoExtraKeys!6396 (array!90525 array!90523 (_ BitVec 32) (_ BitVec 32) V!54137 V!54137 (_ BitVec 32) Int) ListLongMap!21489)

(assert (=> b!1334987 (= lt!592657 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22073 (ValueCell!17489 V!54137) V!54137)

(declare-fun dynLambda!3706 (Int (_ BitVec 64)) V!54137)

(assert (=> b!1334987 (= lt!592658 (get!22073 (select (arr!43723 _values!1320) from!1980) (dynLambda!3706 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334988 () Bool)

(declare-fun res!885599 () Bool)

(assert (=> b!1334988 (=> (not res!885599) (not e!760552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334988 (= res!885599 (validKeyInArray!0 (select (arr!43724 _keys!1590) from!1980)))))

(declare-fun b!1334989 () Bool)

(assert (=> b!1334989 (= e!760555 (not true))))

(assert (=> b!1334989 (contains!8936 lt!592657 k0!1153)))

(declare-datatypes ((Unit!43806 0))(
  ( (Unit!43807) )
))
(declare-fun lt!592659 () Unit!43806)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!291 ((_ BitVec 64) (_ BitVec 64) V!54137 ListLongMap!21489) Unit!43806)

(assert (=> b!1334989 (= lt!592659 (lemmaInListMapAfterAddingDiffThenInBefore!291 k0!1153 (select (arr!43724 _keys!1590) from!1980) lt!592658 lt!592657))))

(declare-fun b!1334990 () Bool)

(declare-fun res!885602 () Bool)

(assert (=> b!1334990 (=> (not res!885602) (not e!760552))))

(assert (=> b!1334990 (= res!885602 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56836 () Bool)

(declare-fun mapRes!56836 () Bool)

(assert (=> mapIsEmpty!56836 mapRes!56836))

(declare-fun b!1334991 () Bool)

(declare-fun res!885595 () Bool)

(assert (=> b!1334991 (=> (not res!885595) (not e!760552))))

(assert (=> b!1334991 (= res!885595 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44275 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334992 () Bool)

(declare-fun res!885596 () Bool)

(assert (=> b!1334992 (=> (not res!885596) (not e!760555))))

(assert (=> b!1334992 (= res!885596 (not (= k0!1153 (select (arr!43724 _keys!1590) from!1980))))))

(declare-fun res!885601 () Bool)

(assert (=> start!112694 (=> (not res!885601) (not e!760552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112694 (= res!885601 (validMask!0 mask!1998))))

(assert (=> start!112694 e!760552))

(declare-fun e!760551 () Bool)

(declare-fun array_inv!33249 (array!90523) Bool)

(assert (=> start!112694 (and (array_inv!33249 _values!1320) e!760551)))

(assert (=> start!112694 true))

(declare-fun array_inv!33250 (array!90525) Bool)

(assert (=> start!112694 (array_inv!33250 _keys!1590)))

(assert (=> start!112694 tp!108231))

(declare-fun tp_is_empty!36775 () Bool)

(assert (=> start!112694 tp_is_empty!36775))

(declare-fun b!1334993 () Bool)

(declare-fun res!885604 () Bool)

(assert (=> b!1334993 (=> (not res!885604) (not e!760552))))

(assert (=> b!1334993 (= res!885604 (not (= (select (arr!43724 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56836 () Bool)

(declare-fun tp!108232 () Bool)

(declare-fun e!760554 () Bool)

(assert (=> mapNonEmpty!56836 (= mapRes!56836 (and tp!108232 e!760554))))

(declare-fun mapValue!56836 () ValueCell!17489)

(declare-fun mapKey!56836 () (_ BitVec 32))

(declare-fun mapRest!56836 () (Array (_ BitVec 32) ValueCell!17489))

(assert (=> mapNonEmpty!56836 (= (arr!43723 _values!1320) (store mapRest!56836 mapKey!56836 mapValue!56836))))

(declare-fun b!1334994 () Bool)

(declare-fun res!885600 () Bool)

(assert (=> b!1334994 (=> (not res!885600) (not e!760552))))

(declare-fun getCurrentListMap!5724 (array!90525 array!90523 (_ BitVec 32) (_ BitVec 32) V!54137 V!54137 (_ BitVec 32) Int) ListLongMap!21489)

(assert (=> b!1334994 (= res!885600 (contains!8936 (getCurrentListMap!5724 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334995 () Bool)

(assert (=> b!1334995 (= e!760554 tp_is_empty!36775)))

(declare-fun b!1334996 () Bool)

(declare-fun e!760550 () Bool)

(assert (=> b!1334996 (= e!760551 (and e!760550 mapRes!56836))))

(declare-fun condMapEmpty!56836 () Bool)

(declare-fun mapDefault!56836 () ValueCell!17489)

(assert (=> b!1334996 (= condMapEmpty!56836 (= (arr!43723 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17489)) mapDefault!56836)))))

(declare-fun b!1334997 () Bool)

(assert (=> b!1334997 (= e!760550 tp_is_empty!36775)))

(declare-fun b!1334998 () Bool)

(declare-fun res!885598 () Bool)

(assert (=> b!1334998 (=> (not res!885598) (not e!760552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90525 (_ BitVec 32)) Bool)

(assert (=> b!1334998 (= res!885598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112694 res!885601) b!1334985))

(assert (= (and b!1334985 res!885605) b!1334998))

(assert (= (and b!1334998 res!885598) b!1334986))

(assert (= (and b!1334986 res!885603) b!1334991))

(assert (= (and b!1334991 res!885595) b!1334994))

(assert (= (and b!1334994 res!885600) b!1334993))

(assert (= (and b!1334993 res!885604) b!1334988))

(assert (= (and b!1334988 res!885599) b!1334990))

(assert (= (and b!1334990 res!885602) b!1334987))

(assert (= (and b!1334987 res!885597) b!1334992))

(assert (= (and b!1334992 res!885596) b!1334989))

(assert (= (and b!1334996 condMapEmpty!56836) mapIsEmpty!56836))

(assert (= (and b!1334996 (not condMapEmpty!56836)) mapNonEmpty!56836))

(get-info :version)

(assert (= (and mapNonEmpty!56836 ((_ is ValueCellFull!17489) mapValue!56836)) b!1334995))

(assert (= (and b!1334996 ((_ is ValueCellFull!17489) mapDefault!56836)) b!1334997))

(assert (= start!112694 b!1334996))

(declare-fun b_lambda!24065 () Bool)

(assert (=> (not b_lambda!24065) (not b!1334987)))

(declare-fun t!45194 () Bool)

(declare-fun tb!12019 () Bool)

(assert (=> (and start!112694 (= defaultEntry!1323 defaultEntry!1323) t!45194) tb!12019))

(declare-fun result!25117 () Bool)

(assert (=> tb!12019 (= result!25117 tp_is_empty!36775)))

(assert (=> b!1334987 t!45194))

(declare-fun b_and!49735 () Bool)

(assert (= b_and!49733 (and (=> t!45194 result!25117) b_and!49735)))

(declare-fun m!1223789 () Bool)

(assert (=> b!1334986 m!1223789))

(declare-fun m!1223791 () Bool)

(assert (=> b!1334992 m!1223791))

(declare-fun m!1223793 () Bool)

(assert (=> b!1334994 m!1223793))

(assert (=> b!1334994 m!1223793))

(declare-fun m!1223795 () Bool)

(assert (=> b!1334994 m!1223795))

(declare-fun m!1223797 () Bool)

(assert (=> mapNonEmpty!56836 m!1223797))

(assert (=> b!1334993 m!1223791))

(declare-fun m!1223799 () Bool)

(assert (=> b!1334998 m!1223799))

(declare-fun m!1223801 () Bool)

(assert (=> b!1334989 m!1223801))

(assert (=> b!1334989 m!1223791))

(assert (=> b!1334989 m!1223791))

(declare-fun m!1223803 () Bool)

(assert (=> b!1334989 m!1223803))

(declare-fun m!1223805 () Bool)

(assert (=> start!112694 m!1223805))

(declare-fun m!1223807 () Bool)

(assert (=> start!112694 m!1223807))

(declare-fun m!1223809 () Bool)

(assert (=> start!112694 m!1223809))

(assert (=> b!1334988 m!1223791))

(assert (=> b!1334988 m!1223791))

(declare-fun m!1223811 () Bool)

(assert (=> b!1334988 m!1223811))

(declare-fun m!1223813 () Bool)

(assert (=> b!1334987 m!1223813))

(declare-fun m!1223815 () Bool)

(assert (=> b!1334987 m!1223815))

(declare-fun m!1223817 () Bool)

(assert (=> b!1334987 m!1223817))

(declare-fun m!1223819 () Bool)

(assert (=> b!1334987 m!1223819))

(assert (=> b!1334987 m!1223817))

(declare-fun m!1223821 () Bool)

(assert (=> b!1334987 m!1223821))

(declare-fun m!1223823 () Bool)

(assert (=> b!1334987 m!1223823))

(assert (=> b!1334987 m!1223813))

(assert (=> b!1334987 m!1223819))

(assert (=> b!1334987 m!1223791))

(check-sat (not b!1334998) (not mapNonEmpty!56836) (not b!1334986) b_and!49735 (not b!1334988) (not b_next!30865) (not b_lambda!24065) (not b!1334989) tp_is_empty!36775 (not start!112694) (not b!1334987) (not b!1334994))
(check-sat b_and!49735 (not b_next!30865))
