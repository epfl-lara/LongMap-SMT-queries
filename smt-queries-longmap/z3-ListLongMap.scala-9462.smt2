; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112382 () Bool)

(assert start!112382)

(declare-fun b_free!30777 () Bool)

(declare-fun b_next!30777 () Bool)

(assert (=> start!112382 (= b_free!30777 (not b_next!30777))))

(declare-fun tp!107967 () Bool)

(declare-fun b_and!49609 () Bool)

(assert (=> start!112382 (= tp!107967 b_and!49609)))

(declare-fun b!1332325 () Bool)

(declare-fun e!759031 () Bool)

(declare-fun e!759029 () Bool)

(declare-fun mapRes!56704 () Bool)

(assert (=> b!1332325 (= e!759031 (and e!759029 mapRes!56704))))

(declare-fun condMapEmpty!56704 () Bool)

(declare-datatypes ((V!54019 0))(
  ( (V!54020 (val!18418 Int)) )
))
(declare-datatypes ((ValueCell!17445 0))(
  ( (ValueCellFull!17445 (v!21055 V!54019)) (EmptyCell!17445) )
))
(declare-datatypes ((array!90254 0))(
  ( (array!90255 (arr!43593 (Array (_ BitVec 32) ValueCell!17445)) (size!44143 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90254)

(declare-fun mapDefault!56704 () ValueCell!17445)

(assert (=> b!1332325 (= condMapEmpty!56704 (= (arr!43593 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17445)) mapDefault!56704)))))

(declare-fun b!1332326 () Bool)

(declare-fun res!884150 () Bool)

(declare-fun e!759027 () Bool)

(assert (=> b!1332326 (=> (not res!884150) (not e!759027))))

(declare-datatypes ((array!90256 0))(
  ( (array!90257 (arr!43594 (Array (_ BitVec 32) (_ BitVec 64))) (size!44144 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90256)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90256 (_ BitVec 32)) Bool)

(assert (=> b!1332326 (= res!884150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332327 () Bool)

(declare-fun res!884153 () Bool)

(assert (=> b!1332327 (=> (not res!884153) (not e!759027))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332327 (= res!884153 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56704 () Bool)

(declare-fun tp!107968 () Bool)

(declare-fun e!759028 () Bool)

(assert (=> mapNonEmpty!56704 (= mapRes!56704 (and tp!107968 e!759028))))

(declare-fun mapValue!56704 () ValueCell!17445)

(declare-fun mapKey!56704 () (_ BitVec 32))

(declare-fun mapRest!56704 () (Array (_ BitVec 32) ValueCell!17445))

(assert (=> mapNonEmpty!56704 (= (arr!43593 _values!1320) (store mapRest!56704 mapKey!56704 mapValue!56704))))

(declare-fun b!1332328 () Bool)

(declare-fun res!884149 () Bool)

(assert (=> b!1332328 (=> (not res!884149) (not e!759027))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332328 (= res!884149 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44144 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!884146 () Bool)

(assert (=> start!112382 (=> (not res!884146) (not e!759027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112382 (= res!884146 (validMask!0 mask!1998))))

(assert (=> start!112382 e!759027))

(declare-fun array_inv!32881 (array!90254) Bool)

(assert (=> start!112382 (and (array_inv!32881 _values!1320) e!759031)))

(assert (=> start!112382 true))

(declare-fun array_inv!32882 (array!90256) Bool)

(assert (=> start!112382 (array_inv!32882 _keys!1590)))

(assert (=> start!112382 tp!107967))

(declare-fun tp_is_empty!36687 () Bool)

(assert (=> start!112382 tp_is_empty!36687))

(declare-fun b!1332329 () Bool)

(declare-fun res!884147 () Bool)

(assert (=> b!1332329 (=> (not res!884147) (not e!759027))))

(declare-datatypes ((List!30880 0))(
  ( (Nil!30877) (Cons!30876 (h!32085 (_ BitVec 64)) (t!45070 List!30880)) )
))
(declare-fun arrayNoDuplicates!0 (array!90256 (_ BitVec 32) List!30880) Bool)

(assert (=> b!1332329 (= res!884147 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30877))))

(declare-fun b!1332330 () Bool)

(assert (=> b!1332330 (= e!759028 tp_is_empty!36687)))

(declare-fun b!1332331 () Bool)

(declare-fun res!884154 () Bool)

(assert (=> b!1332331 (=> (not res!884154) (not e!759027))))

(assert (=> b!1332331 (= res!884154 (not (= (select (arr!43594 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332332 () Bool)

(declare-fun res!884152 () Bool)

(assert (=> b!1332332 (=> (not res!884152) (not e!759027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332332 (= res!884152 (validKeyInArray!0 (select (arr!43594 _keys!1590) from!1980)))))

(declare-fun b!1332333 () Bool)

(assert (=> b!1332333 (= e!759027 (not true))))

(declare-datatypes ((tuple2!23738 0))(
  ( (tuple2!23739 (_1!11880 (_ BitVec 64)) (_2!11880 V!54019)) )
))
(declare-datatypes ((List!30881 0))(
  ( (Nil!30878) (Cons!30877 (h!32086 tuple2!23738) (t!45071 List!30881)) )
))
(declare-datatypes ((ListLongMap!21395 0))(
  ( (ListLongMap!21396 (toList!10713 List!30881)) )
))
(declare-fun lt!591953 () ListLongMap!21395)

(declare-fun minValue!1262 () V!54019)

(declare-fun contains!8877 (ListLongMap!21395 (_ BitVec 64)) Bool)

(declare-fun +!4706 (ListLongMap!21395 tuple2!23738) ListLongMap!21395)

(assert (=> b!1332333 (contains!8877 (+!4706 lt!591953 (tuple2!23739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43861 0))(
  ( (Unit!43862) )
))
(declare-fun lt!591958 () Unit!43861)

(declare-fun addStillContains!1185 (ListLongMap!21395 (_ BitVec 64) V!54019 (_ BitVec 64)) Unit!43861)

(assert (=> b!1332333 (= lt!591958 (addStillContains!1185 lt!591953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332333 (contains!8877 lt!591953 k0!1153)))

(declare-fun lt!591954 () Unit!43861)

(declare-fun lt!591956 () V!54019)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!293 ((_ BitVec 64) (_ BitVec 64) V!54019 ListLongMap!21395) Unit!43861)

(assert (=> b!1332333 (= lt!591954 (lemmaInListMapAfterAddingDiffThenInBefore!293 k0!1153 (select (arr!43594 _keys!1590) from!1980) lt!591956 lt!591953))))

(declare-fun lt!591957 () ListLongMap!21395)

(assert (=> b!1332333 (contains!8877 lt!591957 k0!1153)))

(declare-fun lt!591955 () Unit!43861)

(assert (=> b!1332333 (= lt!591955 (lemmaInListMapAfterAddingDiffThenInBefore!293 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591957))))

(assert (=> b!1332333 (= lt!591957 (+!4706 lt!591953 (tuple2!23739 (select (arr!43594 _keys!1590) from!1980) lt!591956)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21994 (ValueCell!17445 V!54019) V!54019)

(declare-fun dynLambda!3645 (Int (_ BitVec 64)) V!54019)

(assert (=> b!1332333 (= lt!591956 (get!21994 (select (arr!43593 _values!1320) from!1980) (dynLambda!3645 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!54019)

(declare-fun getCurrentListMapNoExtraKeys!6344 (array!90256 array!90254 (_ BitVec 32) (_ BitVec 32) V!54019 V!54019 (_ BitVec 32) Int) ListLongMap!21395)

(assert (=> b!1332333 (= lt!591953 (getCurrentListMapNoExtraKeys!6344 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332334 () Bool)

(declare-fun res!884151 () Bool)

(assert (=> b!1332334 (=> (not res!884151) (not e!759027))))

(assert (=> b!1332334 (= res!884151 (and (= (size!44143 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44144 _keys!1590) (size!44143 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332335 () Bool)

(declare-fun res!884148 () Bool)

(assert (=> b!1332335 (=> (not res!884148) (not e!759027))))

(declare-fun getCurrentListMap!5694 (array!90256 array!90254 (_ BitVec 32) (_ BitVec 32) V!54019 V!54019 (_ BitVec 32) Int) ListLongMap!21395)

(assert (=> b!1332335 (= res!884148 (contains!8877 (getCurrentListMap!5694 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332336 () Bool)

(assert (=> b!1332336 (= e!759029 tp_is_empty!36687)))

(declare-fun mapIsEmpty!56704 () Bool)

(assert (=> mapIsEmpty!56704 mapRes!56704))

(assert (= (and start!112382 res!884146) b!1332334))

(assert (= (and b!1332334 res!884151) b!1332326))

(assert (= (and b!1332326 res!884150) b!1332329))

(assert (= (and b!1332329 res!884147) b!1332328))

(assert (= (and b!1332328 res!884149) b!1332335))

(assert (= (and b!1332335 res!884148) b!1332331))

(assert (= (and b!1332331 res!884154) b!1332332))

(assert (= (and b!1332332 res!884152) b!1332327))

(assert (= (and b!1332327 res!884153) b!1332333))

(assert (= (and b!1332325 condMapEmpty!56704) mapIsEmpty!56704))

(assert (= (and b!1332325 (not condMapEmpty!56704)) mapNonEmpty!56704))

(get-info :version)

(assert (= (and mapNonEmpty!56704 ((_ is ValueCellFull!17445) mapValue!56704)) b!1332330))

(assert (= (and b!1332325 ((_ is ValueCellFull!17445) mapDefault!56704)) b!1332336))

(assert (= start!112382 b!1332325))

(declare-fun b_lambda!24037 () Bool)

(assert (=> (not b_lambda!24037) (not b!1332333)))

(declare-fun t!45069 () Bool)

(declare-fun tb!11993 () Bool)

(assert (=> (and start!112382 (= defaultEntry!1323 defaultEntry!1323) t!45069) tb!11993))

(declare-fun result!25057 () Bool)

(assert (=> tb!11993 (= result!25057 tp_is_empty!36687)))

(assert (=> b!1332333 t!45069))

(declare-fun b_and!49611 () Bool)

(assert (= b_and!49609 (and (=> t!45069 result!25057) b_and!49611)))

(declare-fun m!1221119 () Bool)

(assert (=> b!1332335 m!1221119))

(assert (=> b!1332335 m!1221119))

(declare-fun m!1221121 () Bool)

(assert (=> b!1332335 m!1221121))

(declare-fun m!1221123 () Bool)

(assert (=> b!1332331 m!1221123))

(declare-fun m!1221125 () Bool)

(assert (=> start!112382 m!1221125))

(declare-fun m!1221127 () Bool)

(assert (=> start!112382 m!1221127))

(declare-fun m!1221129 () Bool)

(assert (=> start!112382 m!1221129))

(declare-fun m!1221131 () Bool)

(assert (=> b!1332329 m!1221131))

(assert (=> b!1332332 m!1221123))

(assert (=> b!1332332 m!1221123))

(declare-fun m!1221133 () Bool)

(assert (=> b!1332332 m!1221133))

(declare-fun m!1221135 () Bool)

(assert (=> b!1332326 m!1221135))

(declare-fun m!1221137 () Bool)

(assert (=> b!1332333 m!1221137))

(declare-fun m!1221139 () Bool)

(assert (=> b!1332333 m!1221139))

(assert (=> b!1332333 m!1221137))

(declare-fun m!1221141 () Bool)

(assert (=> b!1332333 m!1221141))

(declare-fun m!1221143 () Bool)

(assert (=> b!1332333 m!1221143))

(declare-fun m!1221145 () Bool)

(assert (=> b!1332333 m!1221145))

(declare-fun m!1221147 () Bool)

(assert (=> b!1332333 m!1221147))

(declare-fun m!1221149 () Bool)

(assert (=> b!1332333 m!1221149))

(declare-fun m!1221151 () Bool)

(assert (=> b!1332333 m!1221151))

(assert (=> b!1332333 m!1221147))

(declare-fun m!1221153 () Bool)

(assert (=> b!1332333 m!1221153))

(assert (=> b!1332333 m!1221139))

(assert (=> b!1332333 m!1221123))

(declare-fun m!1221155 () Bool)

(assert (=> b!1332333 m!1221155))

(declare-fun m!1221157 () Bool)

(assert (=> b!1332333 m!1221157))

(declare-fun m!1221159 () Bool)

(assert (=> b!1332333 m!1221159))

(assert (=> b!1332333 m!1221123))

(declare-fun m!1221161 () Bool)

(assert (=> mapNonEmpty!56704 m!1221161))

(check-sat (not b!1332329) b_and!49611 (not b!1332333) (not b_lambda!24037) tp_is_empty!36687 (not b!1332332) (not mapNonEmpty!56704) (not b_next!30777) (not start!112382) (not b!1332326) (not b!1332335))
(check-sat b_and!49611 (not b_next!30777))
