; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132296 () Bool)

(assert start!132296)

(declare-fun b_free!31597 () Bool)

(declare-fun b_next!31597 () Bool)

(assert (=> start!132296 (= b_free!31597 (not b_next!31597))))

(declare-fun tp!111042 () Bool)

(declare-fun b_and!51009 () Bool)

(assert (=> start!132296 (= tp!111042 b_and!51009)))

(declare-fun mapNonEmpty!58513 () Bool)

(declare-fun mapRes!58513 () Bool)

(declare-fun tp!111043 () Bool)

(declare-fun e!860876 () Bool)

(assert (=> mapNonEmpty!58513 (= mapRes!58513 (and tp!111043 e!860876))))

(declare-datatypes ((V!58941 0))(
  ( (V!58942 (val!19014 Int)) )
))
(declare-datatypes ((ValueCell!18026 0))(
  ( (ValueCellFull!18026 (v!21807 V!58941)) (EmptyCell!18026) )
))
(declare-fun mapValue!58513 () ValueCell!18026)

(declare-datatypes ((array!103078 0))(
  ( (array!103079 (arr!49734 (Array (_ BitVec 32) ValueCell!18026)) (size!50285 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103078)

(declare-fun mapKey!58513 () (_ BitVec 32))

(declare-fun mapRest!58513 () (Array (_ BitVec 32) ValueCell!18026))

(assert (=> mapNonEmpty!58513 (= (arr!49734 _values!470) (store mapRest!58513 mapKey!58513 mapValue!58513))))

(declare-fun b!1546363 () Bool)

(declare-fun res!1060093 () Bool)

(declare-fun e!860871 () Bool)

(assert (=> b!1546363 (=> (not res!1060093) (not e!860871))))

(declare-datatypes ((array!103080 0))(
  ( (array!103081 (arr!49735 (Array (_ BitVec 32) (_ BitVec 64))) (size!50286 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103080)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103080 (_ BitVec 32)) Bool)

(assert (=> b!1546363 (= res!1060093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546364 () Bool)

(declare-fun res!1060094 () Bool)

(assert (=> b!1546364 (=> (not res!1060094) (not e!860871))))

(declare-datatypes ((List!35972 0))(
  ( (Nil!35969) (Cons!35968 (h!37431 (_ BitVec 64)) (t!50658 List!35972)) )
))
(declare-fun arrayNoDuplicates!0 (array!103080 (_ BitVec 32) List!35972) Bool)

(assert (=> b!1546364 (= res!1060094 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35969))))

(declare-fun b!1546365 () Bool)

(declare-datatypes ((tuple2!24474 0))(
  ( (tuple2!24475 (_1!12248 (_ BitVec 64)) (_2!12248 V!58941)) )
))
(declare-datatypes ((List!35973 0))(
  ( (Nil!35970) (Cons!35969 (h!37432 tuple2!24474) (t!50659 List!35973)) )
))
(declare-datatypes ((ListLongMap!22091 0))(
  ( (ListLongMap!22092 (toList!11061 List!35973)) )
))
(declare-fun e!860875 () ListLongMap!22091)

(declare-fun call!68858 () ListLongMap!22091)

(assert (=> b!1546365 (= e!860875 call!68858)))

(declare-fun bm!68852 () Bool)

(declare-fun c!142116 () Bool)

(declare-fun c!142115 () Bool)

(declare-fun minValue!436 () V!58941)

(declare-fun call!68857 () ListLongMap!22091)

(declare-fun call!68859 () ListLongMap!22091)

(declare-fun call!68856 () ListLongMap!22091)

(declare-fun zeroValue!436 () V!58941)

(declare-fun +!4909 (ListLongMap!22091 tuple2!24474) ListLongMap!22091)

(assert (=> bm!68852 (= call!68859 (+!4909 (ite c!142116 call!68856 (ite c!142115 call!68857 call!68858)) (ite (or c!142116 c!142115) (tuple2!24475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68853 () Bool)

(declare-fun call!68855 () ListLongMap!22091)

(assert (=> bm!68853 (= call!68855 call!68859)))

(declare-fun b!1546366 () Bool)

(declare-fun e!860870 () Bool)

(declare-fun e!860873 () Bool)

(assert (=> b!1546366 (= e!860870 (and e!860873 mapRes!58513))))

(declare-fun condMapEmpty!58513 () Bool)

(declare-fun mapDefault!58513 () ValueCell!18026)

(assert (=> b!1546366 (= condMapEmpty!58513 (= (arr!49734 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18026)) mapDefault!58513)))))

(declare-fun b!1546367 () Bool)

(declare-fun res!1060095 () Bool)

(assert (=> b!1546367 (=> (not res!1060095) (not e!860871))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546367 (= res!1060095 (and (= (size!50285 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50286 _keys!618) (size!50285 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546368 () Bool)

(declare-fun res!1060096 () Bool)

(assert (=> b!1546368 (=> (not res!1060096) (not e!860871))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546368 (= res!1060096 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50286 _keys!618))))))

(declare-fun b!1546369 () Bool)

(declare-fun tp_is_empty!37873 () Bool)

(assert (=> b!1546369 (= e!860873 tp_is_empty!37873)))

(declare-fun bm!68854 () Bool)

(assert (=> bm!68854 (= call!68857 call!68856)))

(declare-fun b!1546370 () Bool)

(assert (=> b!1546370 (= e!860875 call!68855)))

(declare-fun b!1546371 () Bool)

(declare-fun e!860877 () ListLongMap!22091)

(assert (=> b!1546371 (= e!860877 (+!4909 call!68859 (tuple2!24475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546372 () Bool)

(declare-fun e!860872 () ListLongMap!22091)

(assert (=> b!1546372 (= e!860872 call!68855)))

(declare-fun b!1546373 () Bool)

(declare-fun c!142117 () Bool)

(declare-fun lt!666972 () Bool)

(assert (=> b!1546373 (= c!142117 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666972))))

(assert (=> b!1546373 (= e!860872 e!860875)))

(declare-fun bm!68855 () Bool)

(assert (=> bm!68855 (= call!68858 call!68857)))

(declare-fun res!1060097 () Bool)

(assert (=> start!132296 (=> (not res!1060097) (not e!860871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132296 (= res!1060097 (validMask!0 mask!926))))

(assert (=> start!132296 e!860871))

(declare-fun array_inv!38951 (array!103080) Bool)

(assert (=> start!132296 (array_inv!38951 _keys!618)))

(assert (=> start!132296 tp_is_empty!37873))

(assert (=> start!132296 true))

(assert (=> start!132296 tp!111042))

(declare-fun array_inv!38952 (array!103078) Bool)

(assert (=> start!132296 (and (array_inv!38952 _values!470) e!860870)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68856 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6550 (array!103080 array!103078 (_ BitVec 32) (_ BitVec 32) V!58941 V!58941 (_ BitVec 32) Int) ListLongMap!22091)

(assert (=> bm!68856 (= call!68856 (getCurrentListMapNoExtraKeys!6550 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546374 () Bool)

(assert (=> b!1546374 (= e!860871 false)))

(declare-fun lt!666973 () ListLongMap!22091)

(assert (=> b!1546374 (= lt!666973 e!860877)))

(assert (=> b!1546374 (= c!142116 (and (not lt!666972) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546374 (= lt!666972 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58513 () Bool)

(assert (=> mapIsEmpty!58513 mapRes!58513))

(declare-fun b!1546375 () Bool)

(assert (=> b!1546375 (= e!860876 tp_is_empty!37873)))

(declare-fun b!1546376 () Bool)

(assert (=> b!1546376 (= e!860877 e!860872)))

(assert (=> b!1546376 (= c!142115 (and (not lt!666972) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!132296 res!1060097) b!1546367))

(assert (= (and b!1546367 res!1060095) b!1546363))

(assert (= (and b!1546363 res!1060093) b!1546364))

(assert (= (and b!1546364 res!1060094) b!1546368))

(assert (= (and b!1546368 res!1060096) b!1546374))

(assert (= (and b!1546374 c!142116) b!1546371))

(assert (= (and b!1546374 (not c!142116)) b!1546376))

(assert (= (and b!1546376 c!142115) b!1546372))

(assert (= (and b!1546376 (not c!142115)) b!1546373))

(assert (= (and b!1546373 c!142117) b!1546370))

(assert (= (and b!1546373 (not c!142117)) b!1546365))

(assert (= (or b!1546370 b!1546365) bm!68855))

(assert (= (or b!1546372 bm!68855) bm!68854))

(assert (= (or b!1546372 b!1546370) bm!68853))

(assert (= (or b!1546371 bm!68854) bm!68856))

(assert (= (or b!1546371 bm!68853) bm!68852))

(assert (= (and b!1546366 condMapEmpty!58513) mapIsEmpty!58513))

(assert (= (and b!1546366 (not condMapEmpty!58513)) mapNonEmpty!58513))

(get-info :version)

(assert (= (and mapNonEmpty!58513 ((_ is ValueCellFull!18026) mapValue!58513)) b!1546375))

(assert (= (and b!1546366 ((_ is ValueCellFull!18026) mapDefault!58513)) b!1546369))

(assert (= start!132296 b!1546366))

(declare-fun m!1427319 () Bool)

(assert (=> b!1546363 m!1427319))

(declare-fun m!1427321 () Bool)

(assert (=> bm!68852 m!1427321))

(declare-fun m!1427323 () Bool)

(assert (=> mapNonEmpty!58513 m!1427323))

(declare-fun m!1427325 () Bool)

(assert (=> start!132296 m!1427325))

(declare-fun m!1427327 () Bool)

(assert (=> start!132296 m!1427327))

(declare-fun m!1427329 () Bool)

(assert (=> start!132296 m!1427329))

(declare-fun m!1427331 () Bool)

(assert (=> b!1546371 m!1427331))

(declare-fun m!1427333 () Bool)

(assert (=> bm!68856 m!1427333))

(declare-fun m!1427335 () Bool)

(assert (=> b!1546364 m!1427335))

(check-sat (not b!1546371) b_and!51009 (not bm!68852) (not b!1546364) (not bm!68856) (not b!1546363) (not mapNonEmpty!58513) (not start!132296) tp_is_empty!37873 (not b_next!31597))
(check-sat b_and!51009 (not b_next!31597))
