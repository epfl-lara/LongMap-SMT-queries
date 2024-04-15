; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112506 () Bool)

(assert start!112506)

(declare-fun b_free!30901 () Bool)

(declare-fun b_next!30901 () Bool)

(assert (=> start!112506 (= b_free!30901 (not b_next!30901))))

(declare-fun tp!108340 () Bool)

(declare-fun b_and!49785 () Bool)

(assert (=> start!112506 (= tp!108340 b_and!49785)))

(declare-fun mapNonEmpty!56890 () Bool)

(declare-fun mapRes!56890 () Bool)

(declare-fun tp!108341 () Bool)

(declare-fun e!759998 () Bool)

(assert (=> mapNonEmpty!56890 (= mapRes!56890 (and tp!108341 e!759998))))

(declare-datatypes ((V!54185 0))(
  ( (V!54186 (val!18480 Int)) )
))
(declare-datatypes ((ValueCell!17507 0))(
  ( (ValueCellFull!17507 (v!21116 V!54185)) (EmptyCell!17507) )
))
(declare-datatypes ((array!90433 0))(
  ( (array!90434 (arr!43683 (Array (_ BitVec 32) ValueCell!17507)) (size!44235 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90433)

(declare-fun mapRest!56890 () (Array (_ BitVec 32) ValueCell!17507))

(declare-fun mapValue!56890 () ValueCell!17507)

(declare-fun mapKey!56890 () (_ BitVec 32))

(assert (=> mapNonEmpty!56890 (= (arr!43683 _values!1320) (store mapRest!56890 mapKey!56890 mapValue!56890))))

(declare-fun b!1334408 () Bool)

(declare-fun e!760002 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1334408 (= e!760002 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23890 0))(
  ( (tuple2!23891 (_1!11956 (_ BitVec 64)) (_2!11956 V!54185)) )
))
(declare-datatypes ((List!31029 0))(
  ( (Nil!31026) (Cons!31025 (h!32234 tuple2!23890) (t!45281 List!31029)) )
))
(declare-datatypes ((ListLongMap!21547 0))(
  ( (ListLongMap!21548 (toList!10789 List!31029)) )
))
(declare-fun lt!592158 () ListLongMap!21547)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8881 (ListLongMap!21547 (_ BitVec 64)) Bool)

(assert (=> b!1334408 (contains!8881 lt!592158 k0!1153)))

(declare-datatypes ((array!90435 0))(
  ( (array!90436 (arr!43684 (Array (_ BitVec 32) (_ BitVec 64))) (size!44236 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90435)

(declare-fun lt!592157 () V!54185)

(declare-datatypes ((Unit!43698 0))(
  ( (Unit!43699) )
))
(declare-fun lt!592159 () Unit!43698)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!299 ((_ BitVec 64) (_ BitVec 64) V!54185 ListLongMap!21547) Unit!43698)

(assert (=> b!1334408 (= lt!592159 (lemmaInListMapAfterAddingDiffThenInBefore!299 k0!1153 (select (arr!43684 _keys!1590) from!1980) lt!592157 lt!592158))))

(declare-fun b!1334409 () Bool)

(declare-fun res!885645 () Bool)

(declare-fun e!760001 () Bool)

(assert (=> b!1334409 (=> (not res!885645) (not e!760001))))

(declare-datatypes ((List!31030 0))(
  ( (Nil!31027) (Cons!31026 (h!32235 (_ BitVec 64)) (t!45282 List!31030)) )
))
(declare-fun arrayNoDuplicates!0 (array!90435 (_ BitVec 32) List!31030) Bool)

(assert (=> b!1334409 (= res!885645 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31027))))

(declare-fun b!1334410 () Bool)

(declare-fun res!885642 () Bool)

(assert (=> b!1334410 (=> (not res!885642) (not e!760001))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334410 (= res!885642 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334411 () Bool)

(declare-fun res!885644 () Bool)

(assert (=> b!1334411 (=> (not res!885644) (not e!760001))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54185)

(declare-fun zeroValue!1262 () V!54185)

(declare-fun getCurrentListMap!5643 (array!90435 array!90433 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21547)

(assert (=> b!1334411 (= res!885644 (contains!8881 (getCurrentListMap!5643 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334412 () Bool)

(declare-fun res!885646 () Bool)

(assert (=> b!1334412 (=> (not res!885646) (not e!760001))))

(assert (=> b!1334412 (= res!885646 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44236 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334413 () Bool)

(assert (=> b!1334413 (= e!760001 e!760002)))

(declare-fun res!885651 () Bool)

(assert (=> b!1334413 (=> (not res!885651) (not e!760002))))

(declare-fun +!4750 (ListLongMap!21547 tuple2!23890) ListLongMap!21547)

(assert (=> b!1334413 (= res!885651 (contains!8881 (+!4750 lt!592158 (tuple2!23891 (select (arr!43684 _keys!1590) from!1980) lt!592157)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6388 (array!90435 array!90433 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21547)

(assert (=> b!1334413 (= lt!592158 (getCurrentListMapNoExtraKeys!6388 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22047 (ValueCell!17507 V!54185) V!54185)

(declare-fun dynLambda!3680 (Int (_ BitVec 64)) V!54185)

(assert (=> b!1334413 (= lt!592157 (get!22047 (select (arr!43683 _values!1320) from!1980) (dynLambda!3680 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334414 () Bool)

(declare-fun e!760003 () Bool)

(declare-fun e!759999 () Bool)

(assert (=> b!1334414 (= e!760003 (and e!759999 mapRes!56890))))

(declare-fun condMapEmpty!56890 () Bool)

(declare-fun mapDefault!56890 () ValueCell!17507)

(assert (=> b!1334414 (= condMapEmpty!56890 (= (arr!43683 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17507)) mapDefault!56890)))))

(declare-fun mapIsEmpty!56890 () Bool)

(assert (=> mapIsEmpty!56890 mapRes!56890))

(declare-fun b!1334415 () Bool)

(declare-fun res!885649 () Bool)

(assert (=> b!1334415 (=> (not res!885649) (not e!760002))))

(assert (=> b!1334415 (= res!885649 (not (= k0!1153 (select (arr!43684 _keys!1590) from!1980))))))

(declare-fun b!1334416 () Bool)

(declare-fun res!885650 () Bool)

(assert (=> b!1334416 (=> (not res!885650) (not e!760001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90435 (_ BitVec 32)) Bool)

(assert (=> b!1334416 (= res!885650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334417 () Bool)

(declare-fun res!885647 () Bool)

(assert (=> b!1334417 (=> (not res!885647) (not e!760001))))

(assert (=> b!1334417 (= res!885647 (not (= (select (arr!43684 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334418 () Bool)

(declare-fun tp_is_empty!36811 () Bool)

(assert (=> b!1334418 (= e!759999 tp_is_empty!36811)))

(declare-fun res!885643 () Bool)

(assert (=> start!112506 (=> (not res!885643) (not e!760001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112506 (= res!885643 (validMask!0 mask!1998))))

(assert (=> start!112506 e!760001))

(declare-fun array_inv!33141 (array!90433) Bool)

(assert (=> start!112506 (and (array_inv!33141 _values!1320) e!760003)))

(assert (=> start!112506 true))

(declare-fun array_inv!33142 (array!90435) Bool)

(assert (=> start!112506 (array_inv!33142 _keys!1590)))

(assert (=> start!112506 tp!108340))

(assert (=> start!112506 tp_is_empty!36811))

(declare-fun b!1334419 () Bool)

(declare-fun res!885652 () Bool)

(assert (=> b!1334419 (=> (not res!885652) (not e!760001))))

(assert (=> b!1334419 (= res!885652 (and (= (size!44235 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44236 _keys!1590) (size!44235 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334420 () Bool)

(declare-fun res!885648 () Bool)

(assert (=> b!1334420 (=> (not res!885648) (not e!760001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334420 (= res!885648 (validKeyInArray!0 (select (arr!43684 _keys!1590) from!1980)))))

(declare-fun b!1334421 () Bool)

(assert (=> b!1334421 (= e!759998 tp_is_empty!36811)))

(assert (= (and start!112506 res!885643) b!1334419))

(assert (= (and b!1334419 res!885652) b!1334416))

(assert (= (and b!1334416 res!885650) b!1334409))

(assert (= (and b!1334409 res!885645) b!1334412))

(assert (= (and b!1334412 res!885646) b!1334411))

(assert (= (and b!1334411 res!885644) b!1334417))

(assert (= (and b!1334417 res!885647) b!1334420))

(assert (= (and b!1334420 res!885648) b!1334410))

(assert (= (and b!1334410 res!885642) b!1334413))

(assert (= (and b!1334413 res!885651) b!1334415))

(assert (= (and b!1334415 res!885649) b!1334408))

(assert (= (and b!1334414 condMapEmpty!56890) mapIsEmpty!56890))

(assert (= (and b!1334414 (not condMapEmpty!56890)) mapNonEmpty!56890))

(get-info :version)

(assert (= (and mapNonEmpty!56890 ((_ is ValueCellFull!17507) mapValue!56890)) b!1334421))

(assert (= (and b!1334414 ((_ is ValueCellFull!17507) mapDefault!56890)) b!1334418))

(assert (= start!112506 b!1334414))

(declare-fun b_lambda!24097 () Bool)

(assert (=> (not b_lambda!24097) (not b!1334413)))

(declare-fun t!45280 () Bool)

(declare-fun tb!12055 () Bool)

(assert (=> (and start!112506 (= defaultEntry!1323 defaultEntry!1323) t!45280) tb!12055))

(declare-fun result!25189 () Bool)

(assert (=> tb!12055 (= result!25189 tp_is_empty!36811)))

(assert (=> b!1334413 t!45280))

(declare-fun b_and!49787 () Bool)

(assert (= b_and!49785 (and (=> t!45280 result!25189) b_and!49787)))

(declare-fun m!1222323 () Bool)

(assert (=> b!1334416 m!1222323))

(declare-fun m!1222325 () Bool)

(assert (=> b!1334409 m!1222325))

(declare-fun m!1222327 () Bool)

(assert (=> b!1334408 m!1222327))

(declare-fun m!1222329 () Bool)

(assert (=> b!1334408 m!1222329))

(assert (=> b!1334408 m!1222329))

(declare-fun m!1222331 () Bool)

(assert (=> b!1334408 m!1222331))

(assert (=> b!1334420 m!1222329))

(assert (=> b!1334420 m!1222329))

(declare-fun m!1222333 () Bool)

(assert (=> b!1334420 m!1222333))

(declare-fun m!1222335 () Bool)

(assert (=> mapNonEmpty!56890 m!1222335))

(declare-fun m!1222337 () Bool)

(assert (=> b!1334411 m!1222337))

(assert (=> b!1334411 m!1222337))

(declare-fun m!1222339 () Bool)

(assert (=> b!1334411 m!1222339))

(assert (=> b!1334415 m!1222329))

(declare-fun m!1222341 () Bool)

(assert (=> start!112506 m!1222341))

(declare-fun m!1222343 () Bool)

(assert (=> start!112506 m!1222343))

(declare-fun m!1222345 () Bool)

(assert (=> start!112506 m!1222345))

(declare-fun m!1222347 () Bool)

(assert (=> b!1334413 m!1222347))

(declare-fun m!1222349 () Bool)

(assert (=> b!1334413 m!1222349))

(assert (=> b!1334413 m!1222347))

(declare-fun m!1222351 () Bool)

(assert (=> b!1334413 m!1222351))

(declare-fun m!1222353 () Bool)

(assert (=> b!1334413 m!1222353))

(assert (=> b!1334413 m!1222353))

(declare-fun m!1222355 () Bool)

(assert (=> b!1334413 m!1222355))

(declare-fun m!1222357 () Bool)

(assert (=> b!1334413 m!1222357))

(assert (=> b!1334413 m!1222349))

(assert (=> b!1334413 m!1222329))

(assert (=> b!1334417 m!1222329))

(check-sat (not b!1334420) (not b!1334408) tp_is_empty!36811 (not start!112506) (not b!1334409) (not b!1334413) (not mapNonEmpty!56890) (not b_next!30901) (not b!1334416) b_and!49787 (not b_lambda!24097) (not b!1334411))
(check-sat b_and!49787 (not b_next!30901))
