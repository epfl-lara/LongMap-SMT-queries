; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132392 () Bool)

(assert start!132392)

(declare-fun b_free!31693 () Bool)

(declare-fun b_next!31693 () Bool)

(assert (=> start!132392 (= b_free!31693 (not b_next!31693))))

(declare-fun tp!111330 () Bool)

(declare-fun b_and!51105 () Bool)

(assert (=> start!132392 (= tp!111330 b_and!51105)))

(declare-fun bm!69572 () Bool)

(declare-datatypes ((V!59069 0))(
  ( (V!59070 (val!19062 Int)) )
))
(declare-datatypes ((tuple2!24566 0))(
  ( (tuple2!24567 (_1!12294 (_ BitVec 64)) (_2!12294 V!59069)) )
))
(declare-datatypes ((List!36053 0))(
  ( (Nil!36050) (Cons!36049 (h!37512 tuple2!24566) (t!50739 List!36053)) )
))
(declare-datatypes ((ListLongMap!22183 0))(
  ( (ListLongMap!22184 (toList!11107 List!36053)) )
))
(declare-fun call!69578 () ListLongMap!22183)

(declare-fun call!69576 () ListLongMap!22183)

(assert (=> bm!69572 (= call!69578 call!69576)))

(declare-fun b!1548510 () Bool)

(declare-fun c!142549 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667383 () Bool)

(assert (=> b!1548510 (= c!142549 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667383))))

(declare-fun e!862095 () ListLongMap!22183)

(declare-fun e!862094 () ListLongMap!22183)

(assert (=> b!1548510 (= e!862095 e!862094)))

(declare-fun b!1548511 () Bool)

(assert (=> b!1548511 (= e!862094 call!69578)))

(declare-fun b!1548512 () Bool)

(declare-fun e!862090 () Bool)

(declare-fun e!862089 () Bool)

(assert (=> b!1548512 (= e!862090 e!862089)))

(declare-fun res!1060947 () Bool)

(assert (=> b!1548512 (=> (not res!1060947) (not e!862089))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103266 0))(
  ( (array!103267 (arr!49828 (Array (_ BitVec 32) (_ BitVec 64))) (size!50379 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103266)

(assert (=> b!1548512 (= res!1060947 (bvslt from!762 (size!50379 _keys!618)))))

(declare-fun lt!667381 () ListLongMap!22183)

(declare-fun e!862088 () ListLongMap!22183)

(assert (=> b!1548512 (= lt!667381 e!862088)))

(declare-fun c!142547 () Bool)

(assert (=> b!1548512 (= c!142547 (and (not lt!667383) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548512 (= lt!667383 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548513 () Bool)

(declare-fun call!69579 () ListLongMap!22183)

(assert (=> b!1548513 (= e!862095 call!69579)))

(declare-fun b!1548514 () Bool)

(assert (=> b!1548514 (= e!862088 e!862095)))

(declare-fun c!142548 () Bool)

(assert (=> b!1548514 (= c!142548 (and (not lt!667383) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69573 () Bool)

(declare-fun call!69575 () ListLongMap!22183)

(assert (=> bm!69573 (= call!69576 call!69575)))

(declare-fun mapNonEmpty!58657 () Bool)

(declare-fun mapRes!58657 () Bool)

(declare-fun tp!111331 () Bool)

(declare-fun e!862091 () Bool)

(assert (=> mapNonEmpty!58657 (= mapRes!58657 (and tp!111331 e!862091))))

(declare-datatypes ((ValueCell!18074 0))(
  ( (ValueCellFull!18074 (v!21855 V!59069)) (EmptyCell!18074) )
))
(declare-fun mapValue!58657 () ValueCell!18074)

(declare-fun mapKey!58657 () (_ BitVec 32))

(declare-datatypes ((array!103268 0))(
  ( (array!103269 (arr!49829 (Array (_ BitVec 32) ValueCell!18074)) (size!50380 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103268)

(declare-fun mapRest!58657 () (Array (_ BitVec 32) ValueCell!18074))

(assert (=> mapNonEmpty!58657 (= (arr!49829 _values!470) (store mapRest!58657 mapKey!58657 mapValue!58657))))

(declare-fun mapIsEmpty!58657 () Bool)

(assert (=> mapIsEmpty!58657 mapRes!58657))

(declare-fun zeroValue!436 () V!59069)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!69574 () Bool)

(declare-fun minValue!436 () V!59069)

(declare-fun getCurrentListMapNoExtraKeys!6589 (array!103266 array!103268 (_ BitVec 32) (_ BitVec 32) V!59069 V!59069 (_ BitVec 32) Int) ListLongMap!22183)

(assert (=> bm!69574 (= call!69575 (getCurrentListMapNoExtraKeys!6589 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun call!69577 () ListLongMap!22183)

(declare-fun bm!69575 () Bool)

(declare-fun +!4952 (ListLongMap!22183 tuple2!24566) ListLongMap!22183)

(assert (=> bm!69575 (= call!69577 (+!4952 (ite c!142547 call!69575 (ite c!142548 call!69576 call!69578)) (ite (or c!142547 c!142548) (tuple2!24567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548515 () Bool)

(declare-fun res!1060946 () Bool)

(assert (=> b!1548515 (=> (not res!1060946) (not e!862090))))

(assert (=> b!1548515 (= res!1060946 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50379 _keys!618))))))

(declare-fun b!1548516 () Bool)

(declare-fun res!1060948 () Bool)

(assert (=> b!1548516 (=> (not res!1060948) (not e!862090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103266 (_ BitVec 32)) Bool)

(assert (=> b!1548516 (= res!1060948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548517 () Bool)

(declare-fun res!1060949 () Bool)

(assert (=> b!1548517 (=> (not res!1060949) (not e!862089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548517 (= res!1060949 (validKeyInArray!0 (select (arr!49828 _keys!618) from!762)))))

(declare-fun res!1060945 () Bool)

(assert (=> start!132392 (=> (not res!1060945) (not e!862090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132392 (= res!1060945 (validMask!0 mask!926))))

(assert (=> start!132392 e!862090))

(declare-fun array_inv!39023 (array!103266) Bool)

(assert (=> start!132392 (array_inv!39023 _keys!618)))

(declare-fun tp_is_empty!37969 () Bool)

(assert (=> start!132392 tp_is_empty!37969))

(assert (=> start!132392 true))

(assert (=> start!132392 tp!111330))

(declare-fun e!862087 () Bool)

(declare-fun array_inv!39024 (array!103268) Bool)

(assert (=> start!132392 (and (array_inv!39024 _values!470) e!862087)))

(declare-fun b!1548509 () Bool)

(declare-fun res!1060943 () Bool)

(assert (=> b!1548509 (=> (not res!1060943) (not e!862090))))

(assert (=> b!1548509 (= res!1060943 (and (= (size!50380 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50379 _keys!618) (size!50380 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548518 () Bool)

(assert (=> b!1548518 (= e!862088 (+!4952 call!69577 (tuple2!24567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548519 () Bool)

(declare-fun e!862093 () Bool)

(assert (=> b!1548519 (= e!862093 tp_is_empty!37969)))

(declare-fun b!1548520 () Bool)

(assert (=> b!1548520 (= e!862087 (and e!862093 mapRes!58657))))

(declare-fun condMapEmpty!58657 () Bool)

(declare-fun mapDefault!58657 () ValueCell!18074)

(assert (=> b!1548520 (= condMapEmpty!58657 (= (arr!49829 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18074)) mapDefault!58657)))))

(declare-fun b!1548521 () Bool)

(assert (=> b!1548521 (= e!862091 tp_is_empty!37969)))

(declare-fun b!1548522 () Bool)

(assert (=> b!1548522 (= e!862094 call!69579)))

(declare-fun b!1548523 () Bool)

(declare-fun res!1060944 () Bool)

(assert (=> b!1548523 (=> (not res!1060944) (not e!862090))))

(declare-datatypes ((List!36054 0))(
  ( (Nil!36051) (Cons!36050 (h!37513 (_ BitVec 64)) (t!50740 List!36054)) )
))
(declare-fun arrayNoDuplicates!0 (array!103266 (_ BitVec 32) List!36054) Bool)

(assert (=> b!1548523 (= res!1060944 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36051))))

(declare-fun bm!69576 () Bool)

(assert (=> bm!69576 (= call!69579 call!69577)))

(declare-fun b!1548524 () Bool)

(assert (=> b!1548524 (= e!862089 (not true))))

(declare-fun lt!667382 () ListLongMap!22183)

(declare-fun contains!10091 (ListLongMap!22183 (_ BitVec 64)) Bool)

(assert (=> b!1548524 (contains!10091 (+!4952 lt!667382 (tuple2!24567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49828 _keys!618) from!762))))

(declare-datatypes ((Unit!51451 0))(
  ( (Unit!51452) )
))
(declare-fun lt!667384 () Unit!51451)

(declare-fun addStillContains!1233 (ListLongMap!22183 (_ BitVec 64) V!59069 (_ BitVec 64)) Unit!51451)

(assert (=> b!1548524 (= lt!667384 (addStillContains!1233 lt!667382 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49828 _keys!618) from!762)))))

(assert (=> b!1548524 (= lt!667382 (getCurrentListMapNoExtraKeys!6589 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132392 res!1060945) b!1548509))

(assert (= (and b!1548509 res!1060943) b!1548516))

(assert (= (and b!1548516 res!1060948) b!1548523))

(assert (= (and b!1548523 res!1060944) b!1548515))

(assert (= (and b!1548515 res!1060946) b!1548512))

(assert (= (and b!1548512 c!142547) b!1548518))

(assert (= (and b!1548512 (not c!142547)) b!1548514))

(assert (= (and b!1548514 c!142548) b!1548513))

(assert (= (and b!1548514 (not c!142548)) b!1548510))

(assert (= (and b!1548510 c!142549) b!1548522))

(assert (= (and b!1548510 (not c!142549)) b!1548511))

(assert (= (or b!1548522 b!1548511) bm!69572))

(assert (= (or b!1548513 bm!69572) bm!69573))

(assert (= (or b!1548513 b!1548522) bm!69576))

(assert (= (or b!1548518 bm!69573) bm!69574))

(assert (= (or b!1548518 bm!69576) bm!69575))

(assert (= (and b!1548512 res!1060947) b!1548517))

(assert (= (and b!1548517 res!1060949) b!1548524))

(assert (= (and b!1548520 condMapEmpty!58657) mapIsEmpty!58657))

(assert (= (and b!1548520 (not condMapEmpty!58657)) mapNonEmpty!58657))

(get-info :version)

(assert (= (and mapNonEmpty!58657 ((_ is ValueCellFull!18074) mapValue!58657)) b!1548521))

(assert (= (and b!1548520 ((_ is ValueCellFull!18074) mapDefault!58657)) b!1548519))

(assert (= start!132392 b!1548520))

(declare-fun m!1428381 () Bool)

(assert (=> b!1548518 m!1428381))

(declare-fun m!1428383 () Bool)

(assert (=> bm!69574 m!1428383))

(declare-fun m!1428385 () Bool)

(assert (=> b!1548523 m!1428385))

(assert (=> b!1548524 m!1428383))

(declare-fun m!1428387 () Bool)

(assert (=> b!1548524 m!1428387))

(assert (=> b!1548524 m!1428387))

(declare-fun m!1428389 () Bool)

(assert (=> b!1548524 m!1428389))

(declare-fun m!1428391 () Bool)

(assert (=> b!1548524 m!1428391))

(assert (=> b!1548524 m!1428389))

(assert (=> b!1548524 m!1428389))

(declare-fun m!1428393 () Bool)

(assert (=> b!1548524 m!1428393))

(assert (=> b!1548517 m!1428389))

(assert (=> b!1548517 m!1428389))

(declare-fun m!1428395 () Bool)

(assert (=> b!1548517 m!1428395))

(declare-fun m!1428397 () Bool)

(assert (=> start!132392 m!1428397))

(declare-fun m!1428399 () Bool)

(assert (=> start!132392 m!1428399))

(declare-fun m!1428401 () Bool)

(assert (=> start!132392 m!1428401))

(declare-fun m!1428403 () Bool)

(assert (=> b!1548516 m!1428403))

(declare-fun m!1428405 () Bool)

(assert (=> bm!69575 m!1428405))

(declare-fun m!1428407 () Bool)

(assert (=> mapNonEmpty!58657 m!1428407))

(check-sat b_and!51105 (not b!1548518) tp_is_empty!37969 (not b!1548523) (not b!1548516) (not bm!69575) (not b_next!31693) (not bm!69574) (not b!1548524) (not start!132392) (not b!1548517) (not mapNonEmpty!58657))
(check-sat b_and!51105 (not b_next!31693))
