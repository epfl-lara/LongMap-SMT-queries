; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112326 () Bool)

(assert start!112326)

(declare-fun b_free!30721 () Bool)

(declare-fun b_next!30721 () Bool)

(assert (=> start!112326 (= b_free!30721 (not b_next!30721))))

(declare-fun tp!107800 () Bool)

(declare-fun b_and!49479 () Bool)

(assert (=> start!112326 (= tp!107800 b_and!49479)))

(declare-fun b!1331191 () Bool)

(declare-fun res!883368 () Bool)

(declare-fun e!758574 () Bool)

(assert (=> b!1331191 (=> (not res!883368) (not e!758574))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90081 0))(
  ( (array!90082 (arr!43507 (Array (_ BitVec 32) (_ BitVec 64))) (size!44059 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90081)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331191 (= res!883368 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44059 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331192 () Bool)

(assert (=> b!1331192 (= e!758574 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!53945 0))(
  ( (V!53946 (val!18390 Int)) )
))
(declare-datatypes ((tuple2!23754 0))(
  ( (tuple2!23755 (_1!11888 (_ BitVec 64)) (_2!11888 V!53945)) )
))
(declare-datatypes ((List!30892 0))(
  ( (Nil!30889) (Cons!30888 (h!32097 tuple2!23754) (t!45018 List!30892)) )
))
(declare-datatypes ((ListLongMap!21411 0))(
  ( (ListLongMap!21412 (toList!10721 List!30892)) )
))
(declare-fun lt!591282 () ListLongMap!21411)

(declare-fun contains!8813 (ListLongMap!21411 (_ BitVec 64)) Bool)

(assert (=> b!1331192 (contains!8813 lt!591282 k0!1153)))

(declare-datatypes ((Unit!43616 0))(
  ( (Unit!43617) )
))
(declare-fun lt!591280 () Unit!43616)

(declare-fun lt!591279 () V!53945)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!258 ((_ BitVec 64) (_ BitVec 64) V!53945 ListLongMap!21411) Unit!43616)

(assert (=> b!1331192 (= lt!591280 (lemmaInListMapAfterAddingDiffThenInBefore!258 k0!1153 (select (arr!43507 _keys!1590) from!1980) lt!591279 lt!591282))))

(declare-fun lt!591283 () ListLongMap!21411)

(assert (=> b!1331192 (contains!8813 lt!591283 k0!1153)))

(declare-fun lt!591281 () Unit!43616)

(declare-fun minValue!1262 () V!53945)

(assert (=> b!1331192 (= lt!591281 (lemmaInListMapAfterAddingDiffThenInBefore!258 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591283))))

(declare-fun +!4702 (ListLongMap!21411 tuple2!23754) ListLongMap!21411)

(assert (=> b!1331192 (= lt!591283 (+!4702 lt!591282 (tuple2!23755 (select (arr!43507 _keys!1590) from!1980) lt!591279)))))

(declare-datatypes ((ValueCell!17417 0))(
  ( (ValueCellFull!17417 (v!21026 V!53945)) (EmptyCell!17417) )
))
(declare-datatypes ((array!90083 0))(
  ( (array!90084 (arr!43508 (Array (_ BitVec 32) ValueCell!17417)) (size!44060 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90083)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21939 (ValueCell!17417 V!53945) V!53945)

(declare-fun dynLambda!3632 (Int (_ BitVec 64)) V!53945)

(assert (=> b!1331192 (= lt!591279 (get!21939 (select (arr!43508 _values!1320) from!1980) (dynLambda!3632 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53945)

(declare-fun getCurrentListMapNoExtraKeys!6340 (array!90081 array!90083 (_ BitVec 32) (_ BitVec 32) V!53945 V!53945 (_ BitVec 32) Int) ListLongMap!21411)

(assert (=> b!1331192 (= lt!591282 (getCurrentListMapNoExtraKeys!6340 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331193 () Bool)

(declare-fun res!883362 () Bool)

(assert (=> b!1331193 (=> (not res!883362) (not e!758574))))

(declare-fun getCurrentListMap!5583 (array!90081 array!90083 (_ BitVec 32) (_ BitVec 32) V!53945 V!53945 (_ BitVec 32) Int) ListLongMap!21411)

(assert (=> b!1331193 (= res!883362 (contains!8813 (getCurrentListMap!5583 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331194 () Bool)

(declare-fun e!758575 () Bool)

(declare-fun tp_is_empty!36631 () Bool)

(assert (=> b!1331194 (= e!758575 tp_is_empty!36631)))

(declare-fun b!1331195 () Bool)

(declare-fun e!758578 () Bool)

(declare-fun e!758577 () Bool)

(declare-fun mapRes!56620 () Bool)

(assert (=> b!1331195 (= e!758578 (and e!758577 mapRes!56620))))

(declare-fun condMapEmpty!56620 () Bool)

(declare-fun mapDefault!56620 () ValueCell!17417)

(assert (=> b!1331195 (= condMapEmpty!56620 (= (arr!43508 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17417)) mapDefault!56620)))))

(declare-fun b!1331196 () Bool)

(declare-fun res!883369 () Bool)

(assert (=> b!1331196 (=> (not res!883369) (not e!758574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90081 (_ BitVec 32)) Bool)

(assert (=> b!1331196 (= res!883369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331197 () Bool)

(assert (=> b!1331197 (= e!758577 tp_is_empty!36631)))

(declare-fun b!1331198 () Bool)

(declare-fun res!883365 () Bool)

(assert (=> b!1331198 (=> (not res!883365) (not e!758574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331198 (= res!883365 (validKeyInArray!0 (select (arr!43507 _keys!1590) from!1980)))))

(declare-fun b!1331199 () Bool)

(declare-fun res!883366 () Bool)

(assert (=> b!1331199 (=> (not res!883366) (not e!758574))))

(assert (=> b!1331199 (= res!883366 (and (= (size!44060 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44059 _keys!1590) (size!44060 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331201 () Bool)

(declare-fun res!883367 () Bool)

(assert (=> b!1331201 (=> (not res!883367) (not e!758574))))

(declare-datatypes ((List!30893 0))(
  ( (Nil!30890) (Cons!30889 (h!32098 (_ BitVec 64)) (t!45019 List!30893)) )
))
(declare-fun arrayNoDuplicates!0 (array!90081 (_ BitVec 32) List!30893) Bool)

(assert (=> b!1331201 (= res!883367 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30890))))

(declare-fun mapNonEmpty!56620 () Bool)

(declare-fun tp!107801 () Bool)

(assert (=> mapNonEmpty!56620 (= mapRes!56620 (and tp!107801 e!758575))))

(declare-fun mapValue!56620 () ValueCell!17417)

(declare-fun mapKey!56620 () (_ BitVec 32))

(declare-fun mapRest!56620 () (Array (_ BitVec 32) ValueCell!17417))

(assert (=> mapNonEmpty!56620 (= (arr!43508 _values!1320) (store mapRest!56620 mapKey!56620 mapValue!56620))))

(declare-fun b!1331200 () Bool)

(declare-fun res!883363 () Bool)

(assert (=> b!1331200 (=> (not res!883363) (not e!758574))))

(assert (=> b!1331200 (= res!883363 (not (= (select (arr!43507 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!883364 () Bool)

(assert (=> start!112326 (=> (not res!883364) (not e!758574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112326 (= res!883364 (validMask!0 mask!1998))))

(assert (=> start!112326 e!758574))

(declare-fun array_inv!32999 (array!90083) Bool)

(assert (=> start!112326 (and (array_inv!32999 _values!1320) e!758578)))

(assert (=> start!112326 true))

(declare-fun array_inv!33000 (array!90081) Bool)

(assert (=> start!112326 (array_inv!33000 _keys!1590)))

(assert (=> start!112326 tp!107800))

(assert (=> start!112326 tp_is_empty!36631))

(declare-fun b!1331202 () Bool)

(declare-fun res!883361 () Bool)

(assert (=> b!1331202 (=> (not res!883361) (not e!758574))))

(assert (=> b!1331202 (= res!883361 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56620 () Bool)

(assert (=> mapIsEmpty!56620 mapRes!56620))

(assert (= (and start!112326 res!883364) b!1331199))

(assert (= (and b!1331199 res!883366) b!1331196))

(assert (= (and b!1331196 res!883369) b!1331201))

(assert (= (and b!1331201 res!883367) b!1331191))

(assert (= (and b!1331191 res!883368) b!1331193))

(assert (= (and b!1331193 res!883362) b!1331200))

(assert (= (and b!1331200 res!883363) b!1331198))

(assert (= (and b!1331198 res!883365) b!1331202))

(assert (= (and b!1331202 res!883361) b!1331192))

(assert (= (and b!1331195 condMapEmpty!56620) mapIsEmpty!56620))

(assert (= (and b!1331195 (not condMapEmpty!56620)) mapNonEmpty!56620))

(get-info :version)

(assert (= (and mapNonEmpty!56620 ((_ is ValueCellFull!17417) mapValue!56620)) b!1331194))

(assert (= (and b!1331195 ((_ is ValueCellFull!17417) mapDefault!56620)) b!1331197))

(assert (= start!112326 b!1331195))

(declare-fun b_lambda!23971 () Bool)

(assert (=> (not b_lambda!23971) (not b!1331192)))

(declare-fun t!45017 () Bool)

(declare-fun tb!11929 () Bool)

(assert (=> (and start!112326 (= defaultEntry!1323 defaultEntry!1323) t!45017) tb!11929))

(declare-fun result!24937 () Bool)

(assert (=> tb!11929 (= result!24937 tp_is_empty!36631)))

(assert (=> b!1331192 t!45017))

(declare-fun b_and!49481 () Bool)

(assert (= b_and!49479 (and (=> t!45017 result!24937) b_and!49481)))

(declare-fun m!1219407 () Bool)

(assert (=> b!1331193 m!1219407))

(assert (=> b!1331193 m!1219407))

(declare-fun m!1219409 () Bool)

(assert (=> b!1331193 m!1219409))

(declare-fun m!1219411 () Bool)

(assert (=> b!1331192 m!1219411))

(declare-fun m!1219413 () Bool)

(assert (=> b!1331192 m!1219413))

(declare-fun m!1219415 () Bool)

(assert (=> b!1331192 m!1219415))

(declare-fun m!1219417 () Bool)

(assert (=> b!1331192 m!1219417))

(declare-fun m!1219419 () Bool)

(assert (=> b!1331192 m!1219419))

(declare-fun m!1219421 () Bool)

(assert (=> b!1331192 m!1219421))

(declare-fun m!1219423 () Bool)

(assert (=> b!1331192 m!1219423))

(declare-fun m!1219425 () Bool)

(assert (=> b!1331192 m!1219425))

(assert (=> b!1331192 m!1219425))

(declare-fun m!1219427 () Bool)

(assert (=> b!1331192 m!1219427))

(assert (=> b!1331192 m!1219423))

(assert (=> b!1331192 m!1219413))

(declare-fun m!1219429 () Bool)

(assert (=> b!1331192 m!1219429))

(declare-fun m!1219431 () Bool)

(assert (=> start!112326 m!1219431))

(declare-fun m!1219433 () Bool)

(assert (=> start!112326 m!1219433))

(declare-fun m!1219435 () Bool)

(assert (=> start!112326 m!1219435))

(declare-fun m!1219437 () Bool)

(assert (=> mapNonEmpty!56620 m!1219437))

(assert (=> b!1331200 m!1219425))

(declare-fun m!1219439 () Bool)

(assert (=> b!1331196 m!1219439))

(assert (=> b!1331198 m!1219425))

(assert (=> b!1331198 m!1219425))

(declare-fun m!1219441 () Bool)

(assert (=> b!1331198 m!1219441))

(declare-fun m!1219443 () Bool)

(assert (=> b!1331201 m!1219443))

(check-sat (not b!1331198) (not b!1331201) tp_is_empty!36631 (not b_next!30721) (not b!1331196) (not mapNonEmpty!56620) (not b_lambda!23971) (not start!112326) (not b!1331192) (not b!1331193) b_and!49481)
(check-sat b_and!49481 (not b_next!30721))
