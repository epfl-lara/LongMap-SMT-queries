; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112670 () Bool)

(assert start!112670)

(declare-fun b_free!30841 () Bool)

(declare-fun b_next!30841 () Bool)

(assert (=> start!112670 (= b_free!30841 (not b_next!30841))))

(declare-fun tp!108159 () Bool)

(declare-fun b_and!49685 () Bool)

(assert (=> start!112670 (= tp!108159 b_and!49685)))

(declare-fun mapNonEmpty!56800 () Bool)

(declare-fun mapRes!56800 () Bool)

(declare-fun tp!108160 () Bool)

(declare-fun e!760354 () Bool)

(assert (=> mapNonEmpty!56800 (= mapRes!56800 (and tp!108160 e!760354))))

(declare-datatypes ((V!54105 0))(
  ( (V!54106 (val!18450 Int)) )
))
(declare-datatypes ((ValueCell!17477 0))(
  ( (ValueCellFull!17477 (v!21082 V!54105)) (EmptyCell!17477) )
))
(declare-datatypes ((array!90475 0))(
  ( (array!90476 (arr!43699 (Array (_ BitVec 32) ValueCell!17477)) (size!44250 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90475)

(declare-fun mapRest!56800 () (Array (_ BitVec 32) ValueCell!17477))

(declare-fun mapKey!56800 () (_ BitVec 32))

(declare-fun mapValue!56800 () ValueCell!17477)

(assert (=> mapNonEmpty!56800 (= (arr!43699 _values!1320) (store mapRest!56800 mapKey!56800 mapValue!56800))))

(declare-fun mapIsEmpty!56800 () Bool)

(assert (=> mapIsEmpty!56800 mapRes!56800))

(declare-fun b!1334489 () Bool)

(declare-fun res!885232 () Bool)

(declare-fun e!760352 () Bool)

(assert (=> b!1334489 (=> (not res!885232) (not e!760352))))

(declare-datatypes ((array!90477 0))(
  ( (array!90478 (arr!43700 (Array (_ BitVec 32) (_ BitVec 64))) (size!44251 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90477)

(declare-datatypes ((List!30964 0))(
  ( (Nil!30961) (Cons!30960 (h!32178 (_ BitVec 64)) (t!45156 List!30964)) )
))
(declare-fun arrayNoDuplicates!0 (array!90477 (_ BitVec 32) List!30964) Bool)

(assert (=> b!1334489 (= res!885232 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30961))))

(declare-fun b!1334490 () Bool)

(declare-fun tp_is_empty!36751 () Bool)

(assert (=> b!1334490 (= e!760354 tp_is_empty!36751)))

(declare-fun res!885234 () Bool)

(assert (=> start!112670 (=> (not res!885234) (not e!760352))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112670 (= res!885234 (validMask!0 mask!1998))))

(assert (=> start!112670 e!760352))

(declare-fun e!760353 () Bool)

(declare-fun array_inv!33233 (array!90475) Bool)

(assert (=> start!112670 (and (array_inv!33233 _values!1320) e!760353)))

(assert (=> start!112670 true))

(declare-fun array_inv!33234 (array!90477) Bool)

(assert (=> start!112670 (array_inv!33234 _keys!1590)))

(assert (=> start!112670 tp!108159))

(assert (=> start!112670 tp_is_empty!36751))

(declare-fun b!1334491 () Bool)

(declare-fun e!760350 () Bool)

(assert (=> b!1334491 (= e!760353 (and e!760350 mapRes!56800))))

(declare-fun condMapEmpty!56800 () Bool)

(declare-fun mapDefault!56800 () ValueCell!17477)

(assert (=> b!1334491 (= condMapEmpty!56800 (= (arr!43699 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17477)) mapDefault!56800)))))

(declare-fun b!1334492 () Bool)

(declare-fun res!885238 () Bool)

(assert (=> b!1334492 (=> (not res!885238) (not e!760352))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334492 (= res!885238 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334493 () Bool)

(declare-fun res!885235 () Bool)

(assert (=> b!1334493 (=> (not res!885235) (not e!760352))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334493 (= res!885235 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44251 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334494 () Bool)

(declare-fun res!885233 () Bool)

(assert (=> b!1334494 (=> (not res!885233) (not e!760352))))

(assert (=> b!1334494 (= res!885233 (not (= (select (arr!43700 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334495 () Bool)

(assert (=> b!1334495 (= e!760350 tp_is_empty!36751)))

(declare-fun b!1334496 () Bool)

(declare-fun res!885239 () Bool)

(assert (=> b!1334496 (=> (not res!885239) (not e!760352))))

(assert (=> b!1334496 (= res!885239 (and (= (size!44250 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44251 _keys!1590) (size!44250 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334497 () Bool)

(assert (=> b!1334497 (= e!760352 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54105)

(declare-fun lt!592581 () Bool)

(declare-fun zeroValue!1262 () V!54105)

(declare-datatypes ((tuple2!23806 0))(
  ( (tuple2!23807 (_1!11914 (_ BitVec 64)) (_2!11914 V!54105)) )
))
(declare-datatypes ((List!30965 0))(
  ( (Nil!30962) (Cons!30961 (h!32179 tuple2!23806) (t!45157 List!30965)) )
))
(declare-datatypes ((ListLongMap!21471 0))(
  ( (ListLongMap!21472 (toList!10751 List!30965)) )
))
(declare-fun contains!8927 (ListLongMap!21471 (_ BitVec 64)) Bool)

(declare-fun +!4745 (ListLongMap!21471 tuple2!23806) ListLongMap!21471)

(declare-fun getCurrentListMapNoExtraKeys!6389 (array!90477 array!90475 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21471)

(declare-fun get!22058 (ValueCell!17477 V!54105) V!54105)

(declare-fun dynLambda!3699 (Int (_ BitVec 64)) V!54105)

(assert (=> b!1334497 (= lt!592581 (contains!8927 (+!4745 (getCurrentListMapNoExtraKeys!6389 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23807 (select (arr!43700 _keys!1590) from!1980) (get!22058 (select (arr!43699 _values!1320) from!1980) (dynLambda!3699 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1334498 () Bool)

(declare-fun res!885231 () Bool)

(assert (=> b!1334498 (=> (not res!885231) (not e!760352))))

(declare-fun getCurrentListMap!5715 (array!90477 array!90475 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21471)

(assert (=> b!1334498 (= res!885231 (contains!8927 (getCurrentListMap!5715 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334499 () Bool)

(declare-fun res!885237 () Bool)

(assert (=> b!1334499 (=> (not res!885237) (not e!760352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90477 (_ BitVec 32)) Bool)

(assert (=> b!1334499 (= res!885237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334500 () Bool)

(declare-fun res!885236 () Bool)

(assert (=> b!1334500 (=> (not res!885236) (not e!760352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334500 (= res!885236 (validKeyInArray!0 (select (arr!43700 _keys!1590) from!1980)))))

(assert (= (and start!112670 res!885234) b!1334496))

(assert (= (and b!1334496 res!885239) b!1334499))

(assert (= (and b!1334499 res!885237) b!1334489))

(assert (= (and b!1334489 res!885232) b!1334493))

(assert (= (and b!1334493 res!885235) b!1334498))

(assert (= (and b!1334498 res!885231) b!1334494))

(assert (= (and b!1334494 res!885233) b!1334500))

(assert (= (and b!1334500 res!885236) b!1334492))

(assert (= (and b!1334492 res!885238) b!1334497))

(assert (= (and b!1334491 condMapEmpty!56800) mapIsEmpty!56800))

(assert (= (and b!1334491 (not condMapEmpty!56800)) mapNonEmpty!56800))

(get-info :version)

(assert (= (and mapNonEmpty!56800 ((_ is ValueCellFull!17477) mapValue!56800)) b!1334490))

(assert (= (and b!1334491 ((_ is ValueCellFull!17477) mapDefault!56800)) b!1334495))

(assert (= start!112670 b!1334491))

(declare-fun b_lambda!24041 () Bool)

(assert (=> (not b_lambda!24041) (not b!1334497)))

(declare-fun t!45155 () Bool)

(declare-fun tb!11995 () Bool)

(assert (=> (and start!112670 (= defaultEntry!1323 defaultEntry!1323) t!45155) tb!11995))

(declare-fun result!25069 () Bool)

(assert (=> tb!11995 (= result!25069 tp_is_empty!36751)))

(assert (=> b!1334497 t!45155))

(declare-fun b_and!49687 () Bool)

(assert (= b_and!49685 (and (=> t!45155 result!25069) b_and!49687)))

(declare-fun m!1223381 () Bool)

(assert (=> b!1334498 m!1223381))

(assert (=> b!1334498 m!1223381))

(declare-fun m!1223383 () Bool)

(assert (=> b!1334498 m!1223383))

(declare-fun m!1223385 () Bool)

(assert (=> b!1334494 m!1223385))

(declare-fun m!1223387 () Bool)

(assert (=> b!1334489 m!1223387))

(declare-fun m!1223389 () Bool)

(assert (=> b!1334499 m!1223389))

(declare-fun m!1223391 () Bool)

(assert (=> start!112670 m!1223391))

(declare-fun m!1223393 () Bool)

(assert (=> start!112670 m!1223393))

(declare-fun m!1223395 () Bool)

(assert (=> start!112670 m!1223395))

(declare-fun m!1223397 () Bool)

(assert (=> mapNonEmpty!56800 m!1223397))

(declare-fun m!1223399 () Bool)

(assert (=> b!1334497 m!1223399))

(declare-fun m!1223401 () Bool)

(assert (=> b!1334497 m!1223401))

(declare-fun m!1223403 () Bool)

(assert (=> b!1334497 m!1223403))

(declare-fun m!1223405 () Bool)

(assert (=> b!1334497 m!1223405))

(assert (=> b!1334497 m!1223399))

(declare-fun m!1223407 () Bool)

(assert (=> b!1334497 m!1223407))

(assert (=> b!1334497 m!1223403))

(declare-fun m!1223409 () Bool)

(assert (=> b!1334497 m!1223409))

(assert (=> b!1334497 m!1223401))

(assert (=> b!1334497 m!1223405))

(assert (=> b!1334497 m!1223385))

(assert (=> b!1334500 m!1223385))

(assert (=> b!1334500 m!1223385))

(declare-fun m!1223411 () Bool)

(assert (=> b!1334500 m!1223411))

(check-sat (not b!1334499) (not start!112670) (not b!1334498) (not b_lambda!24041) b_and!49687 (not mapNonEmpty!56800) tp_is_empty!36751 (not b!1334489) (not b!1334497) (not b!1334500) (not b_next!30841))
(check-sat b_and!49687 (not b_next!30841))
