; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112508 () Bool)

(assert start!112508)

(declare-fun b_free!30903 () Bool)

(declare-fun b_next!30903 () Bool)

(assert (=> start!112508 (= b_free!30903 (not b_next!30903))))

(declare-fun tp!108345 () Bool)

(declare-fun b_and!49807 () Bool)

(assert (=> start!112508 (= tp!108345 b_and!49807)))

(declare-fun b!1334522 () Bool)

(declare-fun res!885704 () Bool)

(declare-fun e!760049 () Bool)

(assert (=> b!1334522 (=> (not res!885704) (not e!760049))))

(declare-datatypes ((V!54187 0))(
  ( (V!54188 (val!18481 Int)) )
))
(declare-datatypes ((ValueCell!17508 0))(
  ( (ValueCellFull!17508 (v!21118 V!54187)) (EmptyCell!17508) )
))
(declare-datatypes ((array!90492 0))(
  ( (array!90493 (arr!43712 (Array (_ BitVec 32) ValueCell!17508)) (size!44262 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90492)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90494 0))(
  ( (array!90495 (arr!43713 (Array (_ BitVec 32) (_ BitVec 64))) (size!44263 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90494)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54187)

(declare-fun zeroValue!1262 () V!54187)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23830 0))(
  ( (tuple2!23831 (_1!11926 (_ BitVec 64)) (_2!11926 V!54187)) )
))
(declare-datatypes ((List!30969 0))(
  ( (Nil!30966) (Cons!30965 (h!32174 tuple2!23830) (t!45231 List!30969)) )
))
(declare-datatypes ((ListLongMap!21487 0))(
  ( (ListLongMap!21488 (toList!10759 List!30969)) )
))
(declare-fun contains!8923 (ListLongMap!21487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5734 (array!90494 array!90492 (_ BitVec 32) (_ BitVec 32) V!54187 V!54187 (_ BitVec 32) Int) ListLongMap!21487)

(assert (=> b!1334522 (= res!885704 (contains!8923 (getCurrentListMap!5734 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334523 () Bool)

(declare-fun e!760053 () Bool)

(declare-fun e!760052 () Bool)

(declare-fun mapRes!56893 () Bool)

(assert (=> b!1334523 (= e!760053 (and e!760052 mapRes!56893))))

(declare-fun condMapEmpty!56893 () Bool)

(declare-fun mapDefault!56893 () ValueCell!17508)

(assert (=> b!1334523 (= condMapEmpty!56893 (= (arr!43712 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17508)) mapDefault!56893)))))

(declare-fun b!1334524 () Bool)

(declare-fun res!885712 () Bool)

(assert (=> b!1334524 (=> (not res!885712) (not e!760049))))

(assert (=> b!1334524 (= res!885712 (not (= (select (arr!43713 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334525 () Bool)

(declare-fun e!760050 () Bool)

(assert (=> b!1334525 (= e!760049 e!760050)))

(declare-fun res!885708 () Bool)

(assert (=> b!1334525 (=> (not res!885708) (not e!760050))))

(declare-fun lt!592354 () ListLongMap!21487)

(declare-fun lt!592352 () V!54187)

(declare-fun +!4728 (ListLongMap!21487 tuple2!23830) ListLongMap!21487)

(assert (=> b!1334525 (= res!885708 (contains!8923 (+!4728 lt!592354 (tuple2!23831 (select (arr!43713 _keys!1590) from!1980) lt!592352)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6366 (array!90494 array!90492 (_ BitVec 32) (_ BitVec 32) V!54187 V!54187 (_ BitVec 32) Int) ListLongMap!21487)

(assert (=> b!1334525 (= lt!592354 (getCurrentListMapNoExtraKeys!6366 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22058 (ValueCell!17508 V!54187) V!54187)

(declare-fun dynLambda!3667 (Int (_ BitVec 64)) V!54187)

(assert (=> b!1334525 (= lt!592352 (get!22058 (select (arr!43712 _values!1320) from!1980) (dynLambda!3667 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334526 () Bool)

(declare-fun res!885714 () Bool)

(assert (=> b!1334526 (=> (not res!885714) (not e!760049))))

(assert (=> b!1334526 (= res!885714 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334527 () Bool)

(declare-fun res!885709 () Bool)

(assert (=> b!1334527 (=> (not res!885709) (not e!760049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334527 (= res!885709 (validKeyInArray!0 (select (arr!43713 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56893 () Bool)

(declare-fun tp!108346 () Bool)

(declare-fun e!760051 () Bool)

(assert (=> mapNonEmpty!56893 (= mapRes!56893 (and tp!108346 e!760051))))

(declare-fun mapRest!56893 () (Array (_ BitVec 32) ValueCell!17508))

(declare-fun mapKey!56893 () (_ BitVec 32))

(declare-fun mapValue!56893 () ValueCell!17508)

(assert (=> mapNonEmpty!56893 (= (arr!43712 _values!1320) (store mapRest!56893 mapKey!56893 mapValue!56893))))

(declare-fun b!1334528 () Bool)

(declare-fun res!885713 () Bool)

(assert (=> b!1334528 (=> (not res!885713) (not e!760050))))

(assert (=> b!1334528 (= res!885713 (not (= k0!1153 (select (arr!43713 _keys!1590) from!1980))))))

(declare-fun b!1334529 () Bool)

(declare-fun tp_is_empty!36813 () Bool)

(assert (=> b!1334529 (= e!760052 tp_is_empty!36813)))

(declare-fun b!1334530 () Bool)

(assert (=> b!1334530 (= e!760051 tp_is_empty!36813)))

(declare-fun b!1334531 () Bool)

(declare-fun res!885705 () Bool)

(assert (=> b!1334531 (=> (not res!885705) (not e!760049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90494 (_ BitVec 32)) Bool)

(assert (=> b!1334531 (= res!885705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334532 () Bool)

(assert (=> b!1334532 (= e!760050 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(assert (=> b!1334532 (contains!8923 lt!592354 k0!1153)))

(declare-datatypes ((Unit!43899 0))(
  ( (Unit!43900) )
))
(declare-fun lt!592353 () Unit!43899)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!312 ((_ BitVec 64) (_ BitVec 64) V!54187 ListLongMap!21487) Unit!43899)

(assert (=> b!1334532 (= lt!592353 (lemmaInListMapAfterAddingDiffThenInBefore!312 k0!1153 (select (arr!43713 _keys!1590) from!1980) lt!592352 lt!592354))))

(declare-fun b!1334533 () Bool)

(declare-fun res!885706 () Bool)

(assert (=> b!1334533 (=> (not res!885706) (not e!760049))))

(assert (=> b!1334533 (= res!885706 (and (= (size!44262 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44263 _keys!1590) (size!44262 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334534 () Bool)

(declare-fun res!885711 () Bool)

(assert (=> b!1334534 (=> (not res!885711) (not e!760049))))

(assert (=> b!1334534 (= res!885711 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44263 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56893 () Bool)

(assert (=> mapIsEmpty!56893 mapRes!56893))

(declare-fun b!1334535 () Bool)

(declare-fun res!885707 () Bool)

(assert (=> b!1334535 (=> (not res!885707) (not e!760049))))

(declare-datatypes ((List!30970 0))(
  ( (Nil!30967) (Cons!30966 (h!32175 (_ BitVec 64)) (t!45232 List!30970)) )
))
(declare-fun arrayNoDuplicates!0 (array!90494 (_ BitVec 32) List!30970) Bool)

(assert (=> b!1334535 (= res!885707 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30967))))

(declare-fun res!885710 () Bool)

(assert (=> start!112508 (=> (not res!885710) (not e!760049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112508 (= res!885710 (validMask!0 mask!1998))))

(assert (=> start!112508 e!760049))

(declare-fun array_inv!32965 (array!90492) Bool)

(assert (=> start!112508 (and (array_inv!32965 _values!1320) e!760053)))

(assert (=> start!112508 true))

(declare-fun array_inv!32966 (array!90494) Bool)

(assert (=> start!112508 (array_inv!32966 _keys!1590)))

(assert (=> start!112508 tp!108345))

(assert (=> start!112508 tp_is_empty!36813))

(assert (= (and start!112508 res!885710) b!1334533))

(assert (= (and b!1334533 res!885706) b!1334531))

(assert (= (and b!1334531 res!885705) b!1334535))

(assert (= (and b!1334535 res!885707) b!1334534))

(assert (= (and b!1334534 res!885711) b!1334522))

(assert (= (and b!1334522 res!885704) b!1334524))

(assert (= (and b!1334524 res!885712) b!1334527))

(assert (= (and b!1334527 res!885709) b!1334526))

(assert (= (and b!1334526 res!885714) b!1334525))

(assert (= (and b!1334525 res!885708) b!1334528))

(assert (= (and b!1334528 res!885713) b!1334532))

(assert (= (and b!1334523 condMapEmpty!56893) mapIsEmpty!56893))

(assert (= (and b!1334523 (not condMapEmpty!56893)) mapNonEmpty!56893))

(get-info :version)

(assert (= (and mapNonEmpty!56893 ((_ is ValueCellFull!17508) mapValue!56893)) b!1334530))

(assert (= (and b!1334523 ((_ is ValueCellFull!17508) mapDefault!56893)) b!1334529))

(assert (= start!112508 b!1334523))

(declare-fun b_lambda!24109 () Bool)

(assert (=> (not b_lambda!24109) (not b!1334525)))

(declare-fun t!45230 () Bool)

(declare-fun tb!12065 () Bool)

(assert (=> (and start!112508 (= defaultEntry!1323 defaultEntry!1323) t!45230) tb!12065))

(declare-fun result!25201 () Bool)

(assert (=> tb!12065 (= result!25201 tp_is_empty!36813)))

(assert (=> b!1334525 t!45230))

(declare-fun b_and!49809 () Bool)

(assert (= b_and!49807 (and (=> t!45230 result!25201) b_and!49809)))

(declare-fun m!1222875 () Bool)

(assert (=> start!112508 m!1222875))

(declare-fun m!1222877 () Bool)

(assert (=> start!112508 m!1222877))

(declare-fun m!1222879 () Bool)

(assert (=> start!112508 m!1222879))

(declare-fun m!1222881 () Bool)

(assert (=> b!1334524 m!1222881))

(declare-fun m!1222883 () Bool)

(assert (=> b!1334531 m!1222883))

(declare-fun m!1222885 () Bool)

(assert (=> b!1334525 m!1222885))

(declare-fun m!1222887 () Bool)

(assert (=> b!1334525 m!1222887))

(declare-fun m!1222889 () Bool)

(assert (=> b!1334525 m!1222889))

(declare-fun m!1222891 () Bool)

(assert (=> b!1334525 m!1222891))

(assert (=> b!1334525 m!1222881))

(assert (=> b!1334525 m!1222891))

(assert (=> b!1334525 m!1222885))

(declare-fun m!1222893 () Bool)

(assert (=> b!1334525 m!1222893))

(assert (=> b!1334525 m!1222887))

(declare-fun m!1222895 () Bool)

(assert (=> b!1334525 m!1222895))

(declare-fun m!1222897 () Bool)

(assert (=> b!1334535 m!1222897))

(declare-fun m!1222899 () Bool)

(assert (=> b!1334532 m!1222899))

(assert (=> b!1334532 m!1222881))

(assert (=> b!1334532 m!1222881))

(declare-fun m!1222901 () Bool)

(assert (=> b!1334532 m!1222901))

(assert (=> b!1334528 m!1222881))

(assert (=> b!1334527 m!1222881))

(assert (=> b!1334527 m!1222881))

(declare-fun m!1222903 () Bool)

(assert (=> b!1334527 m!1222903))

(declare-fun m!1222905 () Bool)

(assert (=> b!1334522 m!1222905))

(assert (=> b!1334522 m!1222905))

(declare-fun m!1222907 () Bool)

(assert (=> b!1334522 m!1222907))

(declare-fun m!1222909 () Bool)

(assert (=> mapNonEmpty!56893 m!1222909))

(check-sat (not b_lambda!24109) (not b_next!30903) tp_is_empty!36813 (not mapNonEmpty!56893) (not b!1334535) (not b!1334531) (not b!1334527) (not b!1334525) (not b!1334532) (not start!112508) b_and!49809 (not b!1334522))
(check-sat b_and!49809 (not b_next!30903))
