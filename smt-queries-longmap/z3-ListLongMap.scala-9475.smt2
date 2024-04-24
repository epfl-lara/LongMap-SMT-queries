; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112682 () Bool)

(assert start!112682)

(declare-fun b_free!30853 () Bool)

(declare-fun b_next!30853 () Bool)

(assert (=> start!112682 (= b_free!30853 (not b_next!30853))))

(declare-fun tp!108196 () Bool)

(declare-fun b_and!49709 () Bool)

(assert (=> start!112682 (= tp!108196 b_and!49709)))

(declare-fun b!1334721 () Bool)

(declare-fun res!885398 () Bool)

(declare-fun e!760447 () Bool)

(assert (=> b!1334721 (=> (not res!885398) (not e!760447))))

(declare-datatypes ((array!90499 0))(
  ( (array!90500 (arr!43711 (Array (_ BitVec 32) (_ BitVec 64))) (size!44262 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90499)

(declare-datatypes ((List!30973 0))(
  ( (Nil!30970) (Cons!30969 (h!32187 (_ BitVec 64)) (t!45177 List!30973)) )
))
(declare-fun arrayNoDuplicates!0 (array!90499 (_ BitVec 32) List!30973) Bool)

(assert (=> b!1334721 (= res!885398 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30970))))

(declare-fun b!1334722 () Bool)

(declare-fun e!760446 () Bool)

(declare-fun tp_is_empty!36763 () Bool)

(assert (=> b!1334722 (= e!760446 tp_is_empty!36763)))

(declare-fun b!1334723 () Bool)

(declare-fun e!760444 () Bool)

(assert (=> b!1334723 (= e!760444 (not true))))

(declare-datatypes ((V!54121 0))(
  ( (V!54122 (val!18456 Int)) )
))
(declare-datatypes ((tuple2!23816 0))(
  ( (tuple2!23817 (_1!11919 (_ BitVec 64)) (_2!11919 V!54121)) )
))
(declare-datatypes ((List!30974 0))(
  ( (Nil!30971) (Cons!30970 (h!32188 tuple2!23816) (t!45178 List!30974)) )
))
(declare-datatypes ((ListLongMap!21481 0))(
  ( (ListLongMap!21482 (toList!10756 List!30974)) )
))
(declare-fun lt!592605 () ListLongMap!21481)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8932 (ListLongMap!21481 (_ BitVec 64)) Bool)

(assert (=> b!1334723 (contains!8932 lt!592605 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592604 () V!54121)

(declare-datatypes ((Unit!43800 0))(
  ( (Unit!43801) )
))
(declare-fun lt!592603 () Unit!43800)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!288 ((_ BitVec 64) (_ BitVec 64) V!54121 ListLongMap!21481) Unit!43800)

(assert (=> b!1334723 (= lt!592603 (lemmaInListMapAfterAddingDiffThenInBefore!288 k0!1153 (select (arr!43711 _keys!1590) from!1980) lt!592604 lt!592605))))

(declare-fun b!1334724 () Bool)

(declare-fun res!885401 () Bool)

(assert (=> b!1334724 (=> (not res!885401) (not e!760447))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334724 (= res!885401 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334725 () Bool)

(declare-fun res!885402 () Bool)

(assert (=> b!1334725 (=> (not res!885402) (not e!760447))))

(assert (=> b!1334725 (= res!885402 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44262 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!885397 () Bool)

(assert (=> start!112682 (=> (not res!885397) (not e!760447))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112682 (= res!885397 (validMask!0 mask!1998))))

(assert (=> start!112682 e!760447))

(declare-datatypes ((ValueCell!17483 0))(
  ( (ValueCellFull!17483 (v!21088 V!54121)) (EmptyCell!17483) )
))
(declare-datatypes ((array!90501 0))(
  ( (array!90502 (arr!43712 (Array (_ BitVec 32) ValueCell!17483)) (size!44263 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90501)

(declare-fun e!760443 () Bool)

(declare-fun array_inv!33243 (array!90501) Bool)

(assert (=> start!112682 (and (array_inv!33243 _values!1320) e!760443)))

(assert (=> start!112682 true))

(declare-fun array_inv!33244 (array!90499) Bool)

(assert (=> start!112682 (array_inv!33244 _keys!1590)))

(assert (=> start!112682 tp!108196))

(assert (=> start!112682 tp_is_empty!36763))

(declare-fun b!1334726 () Bool)

(declare-fun res!885405 () Bool)

(assert (=> b!1334726 (=> (not res!885405) (not e!760444))))

(assert (=> b!1334726 (= res!885405 (not (= k0!1153 (select (arr!43711 _keys!1590) from!1980))))))

(declare-fun b!1334727 () Bool)

(assert (=> b!1334727 (= e!760447 e!760444)))

(declare-fun res!885407 () Bool)

(assert (=> b!1334727 (=> (not res!885407) (not e!760444))))

(declare-fun +!4749 (ListLongMap!21481 tuple2!23816) ListLongMap!21481)

(assert (=> b!1334727 (= res!885407 (contains!8932 (+!4749 lt!592605 (tuple2!23817 (select (arr!43711 _keys!1590) from!1980) lt!592604)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54121)

(declare-fun zeroValue!1262 () V!54121)

(declare-fun getCurrentListMapNoExtraKeys!6393 (array!90499 array!90501 (_ BitVec 32) (_ BitVec 32) V!54121 V!54121 (_ BitVec 32) Int) ListLongMap!21481)

(assert (=> b!1334727 (= lt!592605 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22066 (ValueCell!17483 V!54121) V!54121)

(declare-fun dynLambda!3703 (Int (_ BitVec 64)) V!54121)

(assert (=> b!1334727 (= lt!592604 (get!22066 (select (arr!43712 _values!1320) from!1980) (dynLambda!3703 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334728 () Bool)

(declare-fun res!885400 () Bool)

(assert (=> b!1334728 (=> (not res!885400) (not e!760447))))

(assert (=> b!1334728 (= res!885400 (and (= (size!44263 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44262 _keys!1590) (size!44263 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56818 () Bool)

(declare-fun mapRes!56818 () Bool)

(assert (=> mapIsEmpty!56818 mapRes!56818))

(declare-fun b!1334729 () Bool)

(declare-fun e!760445 () Bool)

(assert (=> b!1334729 (= e!760445 tp_is_empty!36763)))

(declare-fun b!1334730 () Bool)

(declare-fun res!885404 () Bool)

(assert (=> b!1334730 (=> (not res!885404) (not e!760447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334730 (= res!885404 (validKeyInArray!0 (select (arr!43711 _keys!1590) from!1980)))))

(declare-fun b!1334731 () Bool)

(assert (=> b!1334731 (= e!760443 (and e!760446 mapRes!56818))))

(declare-fun condMapEmpty!56818 () Bool)

(declare-fun mapDefault!56818 () ValueCell!17483)

(assert (=> b!1334731 (= condMapEmpty!56818 (= (arr!43712 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17483)) mapDefault!56818)))))

(declare-fun b!1334732 () Bool)

(declare-fun res!885403 () Bool)

(assert (=> b!1334732 (=> (not res!885403) (not e!760447))))

(declare-fun getCurrentListMap!5720 (array!90499 array!90501 (_ BitVec 32) (_ BitVec 32) V!54121 V!54121 (_ BitVec 32) Int) ListLongMap!21481)

(assert (=> b!1334732 (= res!885403 (contains!8932 (getCurrentListMap!5720 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334733 () Bool)

(declare-fun res!885406 () Bool)

(assert (=> b!1334733 (=> (not res!885406) (not e!760447))))

(assert (=> b!1334733 (= res!885406 (not (= (select (arr!43711 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56818 () Bool)

(declare-fun tp!108195 () Bool)

(assert (=> mapNonEmpty!56818 (= mapRes!56818 (and tp!108195 e!760445))))

(declare-fun mapValue!56818 () ValueCell!17483)

(declare-fun mapRest!56818 () (Array (_ BitVec 32) ValueCell!17483))

(declare-fun mapKey!56818 () (_ BitVec 32))

(assert (=> mapNonEmpty!56818 (= (arr!43712 _values!1320) (store mapRest!56818 mapKey!56818 mapValue!56818))))

(declare-fun b!1334734 () Bool)

(declare-fun res!885399 () Bool)

(assert (=> b!1334734 (=> (not res!885399) (not e!760447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90499 (_ BitVec 32)) Bool)

(assert (=> b!1334734 (= res!885399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112682 res!885397) b!1334728))

(assert (= (and b!1334728 res!885400) b!1334734))

(assert (= (and b!1334734 res!885399) b!1334721))

(assert (= (and b!1334721 res!885398) b!1334725))

(assert (= (and b!1334725 res!885402) b!1334732))

(assert (= (and b!1334732 res!885403) b!1334733))

(assert (= (and b!1334733 res!885406) b!1334730))

(assert (= (and b!1334730 res!885404) b!1334724))

(assert (= (and b!1334724 res!885401) b!1334727))

(assert (= (and b!1334727 res!885407) b!1334726))

(assert (= (and b!1334726 res!885405) b!1334723))

(assert (= (and b!1334731 condMapEmpty!56818) mapIsEmpty!56818))

(assert (= (and b!1334731 (not condMapEmpty!56818)) mapNonEmpty!56818))

(get-info :version)

(assert (= (and mapNonEmpty!56818 ((_ is ValueCellFull!17483) mapValue!56818)) b!1334729))

(assert (= (and b!1334731 ((_ is ValueCellFull!17483) mapDefault!56818)) b!1334722))

(assert (= start!112682 b!1334731))

(declare-fun b_lambda!24053 () Bool)

(assert (=> (not b_lambda!24053) (not b!1334727)))

(declare-fun t!45176 () Bool)

(declare-fun tb!12007 () Bool)

(assert (=> (and start!112682 (= defaultEntry!1323 defaultEntry!1323) t!45176) tb!12007))

(declare-fun result!25093 () Bool)

(assert (=> tb!12007 (= result!25093 tp_is_empty!36763)))

(assert (=> b!1334727 t!45176))

(declare-fun b_and!49711 () Bool)

(assert (= b_and!49709 (and (=> t!45176 result!25093) b_and!49711)))

(declare-fun m!1223573 () Bool)

(assert (=> b!1334734 m!1223573))

(declare-fun m!1223575 () Bool)

(assert (=> b!1334733 m!1223575))

(declare-fun m!1223577 () Bool)

(assert (=> b!1334723 m!1223577))

(assert (=> b!1334723 m!1223575))

(assert (=> b!1334723 m!1223575))

(declare-fun m!1223579 () Bool)

(assert (=> b!1334723 m!1223579))

(declare-fun m!1223581 () Bool)

(assert (=> b!1334732 m!1223581))

(assert (=> b!1334732 m!1223581))

(declare-fun m!1223583 () Bool)

(assert (=> b!1334732 m!1223583))

(declare-fun m!1223585 () Bool)

(assert (=> b!1334727 m!1223585))

(declare-fun m!1223587 () Bool)

(assert (=> b!1334727 m!1223587))

(declare-fun m!1223589 () Bool)

(assert (=> b!1334727 m!1223589))

(assert (=> b!1334727 m!1223587))

(declare-fun m!1223591 () Bool)

(assert (=> b!1334727 m!1223591))

(assert (=> b!1334727 m!1223589))

(assert (=> b!1334727 m!1223575))

(declare-fun m!1223593 () Bool)

(assert (=> b!1334727 m!1223593))

(assert (=> b!1334727 m!1223585))

(declare-fun m!1223595 () Bool)

(assert (=> b!1334727 m!1223595))

(declare-fun m!1223597 () Bool)

(assert (=> b!1334721 m!1223597))

(assert (=> b!1334730 m!1223575))

(assert (=> b!1334730 m!1223575))

(declare-fun m!1223599 () Bool)

(assert (=> b!1334730 m!1223599))

(declare-fun m!1223601 () Bool)

(assert (=> start!112682 m!1223601))

(declare-fun m!1223603 () Bool)

(assert (=> start!112682 m!1223603))

(declare-fun m!1223605 () Bool)

(assert (=> start!112682 m!1223605))

(declare-fun m!1223607 () Bool)

(assert (=> mapNonEmpty!56818 m!1223607))

(assert (=> b!1334726 m!1223575))

(check-sat (not b!1334723) (not b!1334730) (not b_next!30853) (not start!112682) (not b!1334721) (not mapNonEmpty!56818) (not b_lambda!24053) (not b!1334734) tp_is_empty!36763 b_and!49711 (not b!1334727) (not b!1334732))
(check-sat b_and!49711 (not b_next!30853))
