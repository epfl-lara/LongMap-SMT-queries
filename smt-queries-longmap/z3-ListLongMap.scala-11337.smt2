; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132338 () Bool)

(assert start!132338)

(declare-fun b_free!31639 () Bool)

(declare-fun b_next!31639 () Bool)

(assert (=> start!132338 (= b_free!31639 (not b_next!31639))))

(declare-fun tp!111168 () Bool)

(declare-fun b_and!51051 () Bool)

(assert (=> start!132338 (= tp!111168 b_and!51051)))

(declare-datatypes ((array!103160 0))(
  ( (array!103161 (arr!49775 (Array (_ BitVec 32) (_ BitVec 64))) (size!50326 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103160)

(declare-datatypes ((V!58997 0))(
  ( (V!58998 (val!19035 Int)) )
))
(declare-fun zeroValue!436 () V!58997)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!58997)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!69167 () Bool)

(declare-datatypes ((tuple2!24514 0))(
  ( (tuple2!24515 (_1!12268 (_ BitVec 64)) (_2!12268 V!58997)) )
))
(declare-datatypes ((List!36008 0))(
  ( (Nil!36005) (Cons!36004 (h!37467 tuple2!24514) (t!50694 List!36008)) )
))
(declare-datatypes ((ListLongMap!22131 0))(
  ( (ListLongMap!22132 (toList!11081 List!36008)) )
))
(declare-fun call!69173 () ListLongMap!22131)

(declare-datatypes ((ValueCell!18047 0))(
  ( (ValueCellFull!18047 (v!21828 V!58997)) (EmptyCell!18047) )
))
(declare-datatypes ((array!103162 0))(
  ( (array!103163 (arr!49776 (Array (_ BitVec 32) ValueCell!18047)) (size!50327 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103162)

(declare-fun getCurrentListMapNoExtraKeys!6566 (array!103160 array!103162 (_ BitVec 32) (_ BitVec 32) V!58997 V!58997 (_ BitVec 32) Int) ListLongMap!22131)

(assert (=> bm!69167 (= call!69173 (getCurrentListMapNoExtraKeys!6566 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060409 () Bool)

(declare-fun e!861379 () Bool)

(assert (=> start!132338 (=> (not res!1060409) (not e!861379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132338 (= res!1060409 (validMask!0 mask!926))))

(assert (=> start!132338 e!861379))

(declare-fun array_inv!38981 (array!103160) Bool)

(assert (=> start!132338 (array_inv!38981 _keys!618)))

(declare-fun tp_is_empty!37915 () Bool)

(assert (=> start!132338 tp_is_empty!37915))

(assert (=> start!132338 true))

(assert (=> start!132338 tp!111168))

(declare-fun e!861375 () Bool)

(declare-fun array_inv!38982 (array!103162) Bool)

(assert (=> start!132338 (and (array_inv!38982 _values!470) e!861375)))

(declare-fun b!1547245 () Bool)

(declare-fun e!861377 () ListLongMap!22131)

(declare-fun call!69170 () ListLongMap!22131)

(assert (=> b!1547245 (= e!861377 call!69170)))

(declare-fun b!1547246 () Bool)

(declare-fun c!142305 () Bool)

(declare-fun lt!667099 () Bool)

(assert (=> b!1547246 (= c!142305 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667099))))

(declare-fun e!861378 () ListLongMap!22131)

(assert (=> b!1547246 (= e!861378 e!861377)))

(declare-fun b!1547247 () Bool)

(declare-fun res!1060411 () Bool)

(assert (=> b!1547247 (=> (not res!1060411) (not e!861379))))

(declare-datatypes ((List!36009 0))(
  ( (Nil!36006) (Cons!36005 (h!37468 (_ BitVec 64)) (t!50695 List!36009)) )
))
(declare-fun arrayNoDuplicates!0 (array!103160 (_ BitVec 32) List!36009) Bool)

(assert (=> b!1547247 (= res!1060411 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36006))))

(declare-fun c!142304 () Bool)

(declare-fun bm!69168 () Bool)

(declare-fun call!69174 () ListLongMap!22131)

(declare-fun call!69172 () ListLongMap!22131)

(declare-fun c!142306 () Bool)

(declare-fun call!69171 () ListLongMap!22131)

(declare-fun +!4928 (ListLongMap!22131 tuple2!24514) ListLongMap!22131)

(assert (=> bm!69168 (= call!69174 (+!4928 (ite c!142304 call!69173 (ite c!142306 call!69172 call!69171)) (ite (or c!142304 c!142306) (tuple2!24515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547248 () Bool)

(declare-fun res!1060412 () Bool)

(assert (=> b!1547248 (=> (not res!1060412) (not e!861379))))

(assert (=> b!1547248 (= res!1060412 (and (= (size!50327 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50326 _keys!618) (size!50327 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547249 () Bool)

(assert (=> b!1547249 (= e!861377 call!69171)))

(declare-fun b!1547250 () Bool)

(assert (=> b!1547250 (= e!861379 false)))

(declare-fun lt!667098 () ListLongMap!22131)

(declare-fun e!861376 () ListLongMap!22131)

(assert (=> b!1547250 (= lt!667098 e!861376)))

(assert (=> b!1547250 (= c!142304 (and (not lt!667099) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547250 (= lt!667099 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547251 () Bool)

(declare-fun e!861374 () Bool)

(declare-fun mapRes!58576 () Bool)

(assert (=> b!1547251 (= e!861375 (and e!861374 mapRes!58576))))

(declare-fun condMapEmpty!58576 () Bool)

(declare-fun mapDefault!58576 () ValueCell!18047)

(assert (=> b!1547251 (= condMapEmpty!58576 (= (arr!49776 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18047)) mapDefault!58576)))))

(declare-fun mapNonEmpty!58576 () Bool)

(declare-fun tp!111169 () Bool)

(declare-fun e!861380 () Bool)

(assert (=> mapNonEmpty!58576 (= mapRes!58576 (and tp!111169 e!861380))))

(declare-fun mapKey!58576 () (_ BitVec 32))

(declare-fun mapRest!58576 () (Array (_ BitVec 32) ValueCell!18047))

(declare-fun mapValue!58576 () ValueCell!18047)

(assert (=> mapNonEmpty!58576 (= (arr!49776 _values!470) (store mapRest!58576 mapKey!58576 mapValue!58576))))

(declare-fun b!1547252 () Bool)

(assert (=> b!1547252 (= e!861374 tp_is_empty!37915)))

(declare-fun b!1547253 () Bool)

(assert (=> b!1547253 (= e!861376 (+!4928 call!69174 (tuple2!24515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69169 () Bool)

(assert (=> bm!69169 (= call!69171 call!69172)))

(declare-fun b!1547254 () Bool)

(assert (=> b!1547254 (= e!861378 call!69170)))

(declare-fun mapIsEmpty!58576 () Bool)

(assert (=> mapIsEmpty!58576 mapRes!58576))

(declare-fun bm!69170 () Bool)

(assert (=> bm!69170 (= call!69170 call!69174)))

(declare-fun b!1547255 () Bool)

(assert (=> b!1547255 (= e!861376 e!861378)))

(assert (=> b!1547255 (= c!142306 (and (not lt!667099) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69171 () Bool)

(assert (=> bm!69171 (= call!69172 call!69173)))

(declare-fun b!1547256 () Bool)

(assert (=> b!1547256 (= e!861380 tp_is_empty!37915)))

(declare-fun b!1547257 () Bool)

(declare-fun res!1060410 () Bool)

(assert (=> b!1547257 (=> (not res!1060410) (not e!861379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103160 (_ BitVec 32)) Bool)

(assert (=> b!1547257 (= res!1060410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547258 () Bool)

(declare-fun res!1060408 () Bool)

(assert (=> b!1547258 (=> (not res!1060408) (not e!861379))))

(assert (=> b!1547258 (= res!1060408 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50326 _keys!618))))))

(assert (= (and start!132338 res!1060409) b!1547248))

(assert (= (and b!1547248 res!1060412) b!1547257))

(assert (= (and b!1547257 res!1060410) b!1547247))

(assert (= (and b!1547247 res!1060411) b!1547258))

(assert (= (and b!1547258 res!1060408) b!1547250))

(assert (= (and b!1547250 c!142304) b!1547253))

(assert (= (and b!1547250 (not c!142304)) b!1547255))

(assert (= (and b!1547255 c!142306) b!1547254))

(assert (= (and b!1547255 (not c!142306)) b!1547246))

(assert (= (and b!1547246 c!142305) b!1547245))

(assert (= (and b!1547246 (not c!142305)) b!1547249))

(assert (= (or b!1547245 b!1547249) bm!69169))

(assert (= (or b!1547254 bm!69169) bm!69171))

(assert (= (or b!1547254 b!1547245) bm!69170))

(assert (= (or b!1547253 bm!69171) bm!69167))

(assert (= (or b!1547253 bm!69170) bm!69168))

(assert (= (and b!1547251 condMapEmpty!58576) mapIsEmpty!58576))

(assert (= (and b!1547251 (not condMapEmpty!58576)) mapNonEmpty!58576))

(get-info :version)

(assert (= (and mapNonEmpty!58576 ((_ is ValueCellFull!18047) mapValue!58576)) b!1547256))

(assert (= (and b!1547251 ((_ is ValueCellFull!18047) mapDefault!58576)) b!1547252))

(assert (= start!132338 b!1547251))

(declare-fun m!1427697 () Bool)

(assert (=> bm!69167 m!1427697))

(declare-fun m!1427699 () Bool)

(assert (=> bm!69168 m!1427699))

(declare-fun m!1427701 () Bool)

(assert (=> start!132338 m!1427701))

(declare-fun m!1427703 () Bool)

(assert (=> start!132338 m!1427703))

(declare-fun m!1427705 () Bool)

(assert (=> start!132338 m!1427705))

(declare-fun m!1427707 () Bool)

(assert (=> b!1547253 m!1427707))

(declare-fun m!1427709 () Bool)

(assert (=> mapNonEmpty!58576 m!1427709))

(declare-fun m!1427711 () Bool)

(assert (=> b!1547257 m!1427711))

(declare-fun m!1427713 () Bool)

(assert (=> b!1547247 m!1427713))

(check-sat (not mapNonEmpty!58576) (not b!1547253) (not bm!69168) (not b!1547247) b_and!51051 (not start!132338) tp_is_empty!37915 (not bm!69167) (not b!1547257) (not b_next!31639))
(check-sat b_and!51051 (not b_next!31639))
