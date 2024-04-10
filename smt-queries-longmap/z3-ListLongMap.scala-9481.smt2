; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112496 () Bool)

(assert start!112496)

(declare-fun b_free!30891 () Bool)

(declare-fun b_next!30891 () Bool)

(assert (=> start!112496 (= b_free!30891 (not b_next!30891))))

(declare-fun tp!108310 () Bool)

(declare-fun b_and!49783 () Bool)

(assert (=> start!112496 (= tp!108310 b_and!49783)))

(declare-fun b!1334258 () Bool)

(declare-fun e!759945 () Bool)

(declare-fun e!759944 () Bool)

(assert (=> b!1334258 (= e!759945 e!759944)))

(declare-fun res!885506 () Bool)

(assert (=> b!1334258 (=> (not res!885506) (not e!759944))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90468 0))(
  ( (array!90469 (arr!43700 (Array (_ BitVec 32) (_ BitVec 64))) (size!44250 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90468)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((V!54171 0))(
  ( (V!54172 (val!18475 Int)) )
))
(declare-datatypes ((tuple2!23820 0))(
  ( (tuple2!23821 (_1!11921 (_ BitVec 64)) (_2!11921 V!54171)) )
))
(declare-datatypes ((List!30960 0))(
  ( (Nil!30957) (Cons!30956 (h!32165 tuple2!23820) (t!45210 List!30960)) )
))
(declare-datatypes ((ListLongMap!21477 0))(
  ( (ListLongMap!21478 (toList!10754 List!30960)) )
))
(declare-fun lt!592300 () ListLongMap!21477)

(declare-fun lt!592299 () V!54171)

(declare-fun contains!8918 (ListLongMap!21477 (_ BitVec 64)) Bool)

(declare-fun +!4724 (ListLongMap!21477 tuple2!23820) ListLongMap!21477)

(assert (=> b!1334258 (= res!885506 (contains!8918 (+!4724 lt!592300 (tuple2!23821 (select (arr!43700 _keys!1590) from!1980) lt!592299)) k0!1153))))

(declare-datatypes ((ValueCell!17502 0))(
  ( (ValueCellFull!17502 (v!21112 V!54171)) (EmptyCell!17502) )
))
(declare-datatypes ((array!90470 0))(
  ( (array!90471 (arr!43701 (Array (_ BitVec 32) ValueCell!17502)) (size!44251 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90470)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54171)

(declare-fun zeroValue!1262 () V!54171)

(declare-fun getCurrentListMapNoExtraKeys!6362 (array!90468 array!90470 (_ BitVec 32) (_ BitVec 32) V!54171 V!54171 (_ BitVec 32) Int) ListLongMap!21477)

(assert (=> b!1334258 (= lt!592300 (getCurrentListMapNoExtraKeys!6362 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22050 (ValueCell!17502 V!54171) V!54171)

(declare-fun dynLambda!3663 (Int (_ BitVec 64)) V!54171)

(assert (=> b!1334258 (= lt!592299 (get!22050 (select (arr!43701 _values!1320) from!1980) (dynLambda!3663 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334259 () Bool)

(declare-fun res!885511 () Bool)

(assert (=> b!1334259 (=> (not res!885511) (not e!759945))))

(declare-datatypes ((List!30961 0))(
  ( (Nil!30958) (Cons!30957 (h!32166 (_ BitVec 64)) (t!45211 List!30961)) )
))
(declare-fun arrayNoDuplicates!0 (array!90468 (_ BitVec 32) List!30961) Bool)

(assert (=> b!1334259 (= res!885511 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30958))))

(declare-fun b!1334260 () Bool)

(declare-fun res!885515 () Bool)

(assert (=> b!1334260 (=> (not res!885515) (not e!759945))))

(assert (=> b!1334260 (= res!885515 (and (= (size!44251 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44250 _keys!1590) (size!44251 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334261 () Bool)

(declare-fun res!885509 () Bool)

(assert (=> b!1334261 (=> (not res!885509) (not e!759945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90468 (_ BitVec 32)) Bool)

(assert (=> b!1334261 (= res!885509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334262 () Bool)

(declare-fun e!759946 () Bool)

(declare-fun tp_is_empty!36801 () Bool)

(assert (=> b!1334262 (= e!759946 tp_is_empty!36801)))

(declare-fun b!1334263 () Bool)

(declare-fun res!885516 () Bool)

(assert (=> b!1334263 (=> (not res!885516) (not e!759945))))

(assert (=> b!1334263 (= res!885516 (not (= (select (arr!43700 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334264 () Bool)

(declare-fun e!759943 () Bool)

(declare-fun e!759942 () Bool)

(declare-fun mapRes!56875 () Bool)

(assert (=> b!1334264 (= e!759943 (and e!759942 mapRes!56875))))

(declare-fun condMapEmpty!56875 () Bool)

(declare-fun mapDefault!56875 () ValueCell!17502)

(assert (=> b!1334264 (= condMapEmpty!56875 (= (arr!43701 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17502)) mapDefault!56875)))))

(declare-fun b!1334265 () Bool)

(declare-fun res!885510 () Bool)

(assert (=> b!1334265 (=> (not res!885510) (not e!759945))))

(assert (=> b!1334265 (= res!885510 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334266 () Bool)

(declare-fun res!885508 () Bool)

(assert (=> b!1334266 (=> (not res!885508) (not e!759945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334266 (= res!885508 (validKeyInArray!0 (select (arr!43700 _keys!1590) from!1980)))))

(declare-fun b!1334267 () Bool)

(declare-fun res!885512 () Bool)

(assert (=> b!1334267 (=> (not res!885512) (not e!759944))))

(assert (=> b!1334267 (= res!885512 (not (= k0!1153 (select (arr!43700 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56875 () Bool)

(assert (=> mapIsEmpty!56875 mapRes!56875))

(declare-fun b!1334268 () Bool)

(declare-fun res!885514 () Bool)

(assert (=> b!1334268 (=> (not res!885514) (not e!759945))))

(declare-fun getCurrentListMap!5730 (array!90468 array!90470 (_ BitVec 32) (_ BitVec 32) V!54171 V!54171 (_ BitVec 32) Int) ListLongMap!21477)

(assert (=> b!1334268 (= res!885514 (contains!8918 (getCurrentListMap!5730 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!885507 () Bool)

(assert (=> start!112496 (=> (not res!885507) (not e!759945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112496 (= res!885507 (validMask!0 mask!1998))))

(assert (=> start!112496 e!759945))

(declare-fun array_inv!32959 (array!90470) Bool)

(assert (=> start!112496 (and (array_inv!32959 _values!1320) e!759943)))

(assert (=> start!112496 true))

(declare-fun array_inv!32960 (array!90468) Bool)

(assert (=> start!112496 (array_inv!32960 _keys!1590)))

(assert (=> start!112496 tp!108310))

(assert (=> start!112496 tp_is_empty!36801))

(declare-fun b!1334269 () Bool)

(assert (=> b!1334269 (= e!759944 (not true))))

(assert (=> b!1334269 (contains!8918 lt!592300 k0!1153)))

(declare-datatypes ((Unit!43889 0))(
  ( (Unit!43890) )
))
(declare-fun lt!592298 () Unit!43889)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!307 ((_ BitVec 64) (_ BitVec 64) V!54171 ListLongMap!21477) Unit!43889)

(assert (=> b!1334269 (= lt!592298 (lemmaInListMapAfterAddingDiffThenInBefore!307 k0!1153 (select (arr!43700 _keys!1590) from!1980) lt!592299 lt!592300))))

(declare-fun mapNonEmpty!56875 () Bool)

(declare-fun tp!108309 () Bool)

(assert (=> mapNonEmpty!56875 (= mapRes!56875 (and tp!108309 e!759946))))

(declare-fun mapKey!56875 () (_ BitVec 32))

(declare-fun mapRest!56875 () (Array (_ BitVec 32) ValueCell!17502))

(declare-fun mapValue!56875 () ValueCell!17502)

(assert (=> mapNonEmpty!56875 (= (arr!43701 _values!1320) (store mapRest!56875 mapKey!56875 mapValue!56875))))

(declare-fun b!1334270 () Bool)

(declare-fun res!885513 () Bool)

(assert (=> b!1334270 (=> (not res!885513) (not e!759945))))

(assert (=> b!1334270 (= res!885513 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44250 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334271 () Bool)

(assert (=> b!1334271 (= e!759942 tp_is_empty!36801)))

(assert (= (and start!112496 res!885507) b!1334260))

(assert (= (and b!1334260 res!885515) b!1334261))

(assert (= (and b!1334261 res!885509) b!1334259))

(assert (= (and b!1334259 res!885511) b!1334270))

(assert (= (and b!1334270 res!885513) b!1334268))

(assert (= (and b!1334268 res!885514) b!1334263))

(assert (= (and b!1334263 res!885516) b!1334266))

(assert (= (and b!1334266 res!885508) b!1334265))

(assert (= (and b!1334265 res!885510) b!1334258))

(assert (= (and b!1334258 res!885506) b!1334267))

(assert (= (and b!1334267 res!885512) b!1334269))

(assert (= (and b!1334264 condMapEmpty!56875) mapIsEmpty!56875))

(assert (= (and b!1334264 (not condMapEmpty!56875)) mapNonEmpty!56875))

(get-info :version)

(assert (= (and mapNonEmpty!56875 ((_ is ValueCellFull!17502) mapValue!56875)) b!1334262))

(assert (= (and b!1334264 ((_ is ValueCellFull!17502) mapDefault!56875)) b!1334271))

(assert (= start!112496 b!1334264))

(declare-fun b_lambda!24097 () Bool)

(assert (=> (not b_lambda!24097) (not b!1334258)))

(declare-fun t!45209 () Bool)

(declare-fun tb!12053 () Bool)

(assert (=> (and start!112496 (= defaultEntry!1323 defaultEntry!1323) t!45209) tb!12053))

(declare-fun result!25177 () Bool)

(assert (=> tb!12053 (= result!25177 tp_is_empty!36801)))

(assert (=> b!1334258 t!45209))

(declare-fun b_and!49785 () Bool)

(assert (= b_and!49783 (and (=> t!45209 result!25177) b_and!49785)))

(declare-fun m!1222659 () Bool)

(assert (=> b!1334263 m!1222659))

(declare-fun m!1222661 () Bool)

(assert (=> b!1334269 m!1222661))

(assert (=> b!1334269 m!1222659))

(assert (=> b!1334269 m!1222659))

(declare-fun m!1222663 () Bool)

(assert (=> b!1334269 m!1222663))

(declare-fun m!1222665 () Bool)

(assert (=> b!1334258 m!1222665))

(declare-fun m!1222667 () Bool)

(assert (=> b!1334258 m!1222667))

(assert (=> b!1334258 m!1222665))

(declare-fun m!1222669 () Bool)

(assert (=> b!1334258 m!1222669))

(declare-fun m!1222671 () Bool)

(assert (=> b!1334258 m!1222671))

(assert (=> b!1334258 m!1222667))

(assert (=> b!1334258 m!1222659))

(declare-fun m!1222673 () Bool)

(assert (=> b!1334258 m!1222673))

(assert (=> b!1334258 m!1222671))

(declare-fun m!1222675 () Bool)

(assert (=> b!1334258 m!1222675))

(declare-fun m!1222677 () Bool)

(assert (=> b!1334261 m!1222677))

(declare-fun m!1222679 () Bool)

(assert (=> mapNonEmpty!56875 m!1222679))

(declare-fun m!1222681 () Bool)

(assert (=> b!1334259 m!1222681))

(declare-fun m!1222683 () Bool)

(assert (=> b!1334268 m!1222683))

(assert (=> b!1334268 m!1222683))

(declare-fun m!1222685 () Bool)

(assert (=> b!1334268 m!1222685))

(declare-fun m!1222687 () Bool)

(assert (=> start!112496 m!1222687))

(declare-fun m!1222689 () Bool)

(assert (=> start!112496 m!1222689))

(declare-fun m!1222691 () Bool)

(assert (=> start!112496 m!1222691))

(assert (=> b!1334267 m!1222659))

(assert (=> b!1334266 m!1222659))

(assert (=> b!1334266 m!1222659))

(declare-fun m!1222693 () Bool)

(assert (=> b!1334266 m!1222693))

(check-sat (not b!1334259) (not b_lambda!24097) (not mapNonEmpty!56875) (not b!1334266) (not b!1334269) (not start!112496) (not b!1334258) (not b!1334268) tp_is_empty!36801 (not b!1334261) (not b_next!30891) b_and!49785)
(check-sat b_and!49785 (not b_next!30891))
