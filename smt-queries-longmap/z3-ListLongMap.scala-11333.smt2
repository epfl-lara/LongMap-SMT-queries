; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131904 () Bool)

(assert start!131904)

(declare-fun b_free!31617 () Bool)

(declare-fun b_next!31617 () Bool)

(assert (=> start!131904 (= b_free!31617 (not b_next!31617))))

(declare-fun tp!111102 () Bool)

(declare-fun b_and!51027 () Bool)

(assert (=> start!131904 (= tp!111102 b_and!51027)))

(declare-fun res!1059386 () Bool)

(declare-fun e!859605 () Bool)

(assert (=> start!131904 (=> (not res!1059386) (not e!859605))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131904 (= res!1059386 (validMask!0 mask!926))))

(assert (=> start!131904 e!859605))

(declare-datatypes ((array!103000 0))(
  ( (array!103001 (arr!49702 (Array (_ BitVec 32) (_ BitVec 64))) (size!50252 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103000)

(declare-fun array_inv!38663 (array!103000) Bool)

(assert (=> start!131904 (array_inv!38663 _keys!618)))

(declare-fun tp_is_empty!37893 () Bool)

(assert (=> start!131904 tp_is_empty!37893))

(assert (=> start!131904 true))

(assert (=> start!131904 tp!111102))

(declare-datatypes ((V!58967 0))(
  ( (V!58968 (val!19024 Int)) )
))
(declare-datatypes ((ValueCell!18036 0))(
  ( (ValueCellFull!18036 (v!21825 V!58967)) (EmptyCell!18036) )
))
(declare-datatypes ((array!103002 0))(
  ( (array!103003 (arr!49703 (Array (_ BitVec 32) ValueCell!18036)) (size!50253 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103002)

(declare-fun e!859607 () Bool)

(declare-fun array_inv!38664 (array!103002) Bool)

(assert (=> start!131904 (and (array_inv!38664 _values!470) e!859607)))

(declare-fun b!1544347 () Bool)

(declare-datatypes ((tuple2!24438 0))(
  ( (tuple2!24439 (_1!12230 (_ BitVec 64)) (_2!12230 V!58967)) )
))
(declare-datatypes ((List!35954 0))(
  ( (Nil!35951) (Cons!35950 (h!37395 tuple2!24438) (t!50648 List!35954)) )
))
(declare-datatypes ((ListLongMap!22047 0))(
  ( (ListLongMap!22048 (toList!11039 List!35954)) )
))
(declare-fun e!859601 () ListLongMap!22047)

(declare-fun call!68856 () ListLongMap!22047)

(assert (=> b!1544347 (= e!859601 call!68856)))

(declare-fun b!1544348 () Bool)

(declare-fun e!859606 () ListLongMap!22047)

(declare-fun call!68858 () ListLongMap!22047)

(assert (=> b!1544348 (= e!859606 call!68858)))

(declare-fun b!1544349 () Bool)

(declare-fun res!1059385 () Bool)

(assert (=> b!1544349 (=> (not res!1059385) (not e!859605))))

(declare-datatypes ((List!35955 0))(
  ( (Nil!35952) (Cons!35951 (h!37396 (_ BitVec 64)) (t!50649 List!35955)) )
))
(declare-fun arrayNoDuplicates!0 (array!103000 (_ BitVec 32) List!35955) Bool)

(assert (=> b!1544349 (= res!1059385 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35952))))

(declare-fun b!1544350 () Bool)

(assert (=> b!1544350 (= e!859601 call!68858)))

(declare-fun mapIsEmpty!58543 () Bool)

(declare-fun mapRes!58543 () Bool)

(assert (=> mapIsEmpty!58543 mapRes!58543))

(declare-fun b!1544351 () Bool)

(declare-fun res!1059387 () Bool)

(assert (=> b!1544351 (=> (not res!1059387) (not e!859605))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544351 (= res!1059387 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50252 _keys!618))))))

(declare-fun b!1544352 () Bool)

(declare-fun e!859603 () Bool)

(assert (=> b!1544352 (= e!859603 tp_is_empty!37893)))

(declare-fun b!1544353 () Bool)

(assert (=> b!1544353 (= e!859605 false)))

(declare-fun lt!666125 () ListLongMap!22047)

(declare-fun e!859604 () ListLongMap!22047)

(assert (=> b!1544353 (= lt!666125 e!859604)))

(declare-fun c!141405 () Bool)

(declare-fun lt!666124 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544353 (= c!141405 (and (not lt!666124) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544353 (= lt!666124 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544354 () Bool)

(assert (=> b!1544354 (= e!859604 e!859606)))

(declare-fun c!141406 () Bool)

(assert (=> b!1544354 (= c!141406 (and (not lt!666124) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68852 () Bool)

(declare-fun call!68855 () ListLongMap!22047)

(assert (=> bm!68852 (= call!68858 call!68855)))

(declare-fun mapNonEmpty!58543 () Bool)

(declare-fun tp!111103 () Bool)

(declare-fun e!859602 () Bool)

(assert (=> mapNonEmpty!58543 (= mapRes!58543 (and tp!111103 e!859602))))

(declare-fun mapValue!58543 () ValueCell!18036)

(declare-fun mapKey!58543 () (_ BitVec 32))

(declare-fun mapRest!58543 () (Array (_ BitVec 32) ValueCell!18036))

(assert (=> mapNonEmpty!58543 (= (arr!49703 _values!470) (store mapRest!58543 mapKey!58543 mapValue!58543))))

(declare-fun b!1544355 () Bool)

(declare-fun res!1059384 () Bool)

(assert (=> b!1544355 (=> (not res!1059384) (not e!859605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103000 (_ BitVec 32)) Bool)

(assert (=> b!1544355 (= res!1059384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544356 () Bool)

(declare-fun res!1059383 () Bool)

(assert (=> b!1544356 (=> (not res!1059383) (not e!859605))))

(assert (=> b!1544356 (= res!1059383 (and (= (size!50253 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50252 _keys!618) (size!50253 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!58967)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!68859 () ListLongMap!22047)

(declare-fun bm!68853 () Bool)

(declare-fun minValue!436 () V!58967)

(declare-fun getCurrentListMapNoExtraKeys!6511 (array!103000 array!103002 (_ BitVec 32) (_ BitVec 32) V!58967 V!58967 (_ BitVec 32) Int) ListLongMap!22047)

(assert (=> bm!68853 (= call!68859 (getCurrentListMapNoExtraKeys!6511 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68854 () Bool)

(declare-fun call!68857 () ListLongMap!22047)

(assert (=> bm!68854 (= call!68857 call!68859)))

(declare-fun b!1544357 () Bool)

(assert (=> b!1544357 (= e!859607 (and e!859603 mapRes!58543))))

(declare-fun condMapEmpty!58543 () Bool)

(declare-fun mapDefault!58543 () ValueCell!18036)

(assert (=> b!1544357 (= condMapEmpty!58543 (= (arr!49703 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18036)) mapDefault!58543)))))

(declare-fun b!1544358 () Bool)

(declare-fun c!141407 () Bool)

(assert (=> b!1544358 (= c!141407 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666124))))

(assert (=> b!1544358 (= e!859606 e!859601)))

(declare-fun bm!68855 () Bool)

(assert (=> bm!68855 (= call!68856 call!68857)))

(declare-fun b!1544359 () Bool)

(assert (=> b!1544359 (= e!859602 tp_is_empty!37893)))

(declare-fun bm!68856 () Bool)

(declare-fun +!4877 (ListLongMap!22047 tuple2!24438) ListLongMap!22047)

(assert (=> bm!68856 (= call!68855 (+!4877 (ite c!141405 call!68859 (ite c!141406 call!68857 call!68856)) (ite (or c!141405 c!141406) (tuple2!24439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544360 () Bool)

(assert (=> b!1544360 (= e!859604 (+!4877 call!68855 (tuple2!24439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!131904 res!1059386) b!1544356))

(assert (= (and b!1544356 res!1059383) b!1544355))

(assert (= (and b!1544355 res!1059384) b!1544349))

(assert (= (and b!1544349 res!1059385) b!1544351))

(assert (= (and b!1544351 res!1059387) b!1544353))

(assert (= (and b!1544353 c!141405) b!1544360))

(assert (= (and b!1544353 (not c!141405)) b!1544354))

(assert (= (and b!1544354 c!141406) b!1544348))

(assert (= (and b!1544354 (not c!141406)) b!1544358))

(assert (= (and b!1544358 c!141407) b!1544350))

(assert (= (and b!1544358 (not c!141407)) b!1544347))

(assert (= (or b!1544350 b!1544347) bm!68855))

(assert (= (or b!1544348 bm!68855) bm!68854))

(assert (= (or b!1544348 b!1544350) bm!68852))

(assert (= (or b!1544360 bm!68854) bm!68853))

(assert (= (or b!1544360 bm!68852) bm!68856))

(assert (= (and b!1544357 condMapEmpty!58543) mapIsEmpty!58543))

(assert (= (and b!1544357 (not condMapEmpty!58543)) mapNonEmpty!58543))

(get-info :version)

(assert (= (and mapNonEmpty!58543 ((_ is ValueCellFull!18036) mapValue!58543)) b!1544359))

(assert (= (and b!1544357 ((_ is ValueCellFull!18036) mapDefault!58543)) b!1544352))

(assert (= start!131904 b!1544357))

(declare-fun m!1425241 () Bool)

(assert (=> start!131904 m!1425241))

(declare-fun m!1425243 () Bool)

(assert (=> start!131904 m!1425243))

(declare-fun m!1425245 () Bool)

(assert (=> start!131904 m!1425245))

(declare-fun m!1425247 () Bool)

(assert (=> bm!68853 m!1425247))

(declare-fun m!1425249 () Bool)

(assert (=> b!1544355 m!1425249))

(declare-fun m!1425251 () Bool)

(assert (=> b!1544360 m!1425251))

(declare-fun m!1425253 () Bool)

(assert (=> mapNonEmpty!58543 m!1425253))

(declare-fun m!1425255 () Bool)

(assert (=> bm!68856 m!1425255))

(declare-fun m!1425257 () Bool)

(assert (=> b!1544349 m!1425257))

(check-sat (not bm!68853) (not bm!68856) (not start!131904) (not b_next!31617) (not b!1544360) b_and!51027 (not b!1544355) (not mapNonEmpty!58543) tp_is_empty!37893 (not b!1544349))
(check-sat b_and!51027 (not b_next!31617))
