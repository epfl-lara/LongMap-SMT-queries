; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131908 () Bool)

(assert start!131908)

(declare-fun b_free!31621 () Bool)

(declare-fun b_next!31621 () Bool)

(assert (=> start!131908 (= b_free!31621 (not b_next!31621))))

(declare-fun tp!111114 () Bool)

(declare-fun b_and!51031 () Bool)

(assert (=> start!131908 (= tp!111114 b_and!51031)))

(declare-fun b!1544431 () Bool)

(declare-fun e!859651 () Bool)

(assert (=> b!1544431 (= e!859651 false)))

(declare-datatypes ((V!58973 0))(
  ( (V!58974 (val!19026 Int)) )
))
(declare-datatypes ((tuple2!24440 0))(
  ( (tuple2!24441 (_1!12231 (_ BitVec 64)) (_2!12231 V!58973)) )
))
(declare-datatypes ((List!35956 0))(
  ( (Nil!35953) (Cons!35952 (h!37397 tuple2!24440) (t!50650 List!35956)) )
))
(declare-datatypes ((ListLongMap!22049 0))(
  ( (ListLongMap!22050 (toList!11040 List!35956)) )
))
(declare-fun lt!666136 () ListLongMap!22049)

(declare-fun e!859653 () ListLongMap!22049)

(assert (=> b!1544431 (= lt!666136 e!859653)))

(declare-fun c!141424 () Bool)

(declare-fun lt!666137 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544431 (= c!141424 (and (not lt!666137) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544431 (= lt!666137 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58549 () Bool)

(declare-fun mapRes!58549 () Bool)

(assert (=> mapIsEmpty!58549 mapRes!58549))

(declare-fun b!1544432 () Bool)

(declare-fun res!1059413 () Bool)

(assert (=> b!1544432 (=> (not res!1059413) (not e!859651))))

(declare-datatypes ((array!103006 0))(
  ( (array!103007 (arr!49705 (Array (_ BitVec 32) (_ BitVec 64))) (size!50255 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103006)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18038 0))(
  ( (ValueCellFull!18038 (v!21827 V!58973)) (EmptyCell!18038) )
))
(declare-datatypes ((array!103008 0))(
  ( (array!103009 (arr!49706 (Array (_ BitVec 32) ValueCell!18038)) (size!50256 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103008)

(assert (=> b!1544432 (= res!1059413 (and (= (size!50256 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50255 _keys!618) (size!50256 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544433 () Bool)

(declare-fun c!141423 () Bool)

(assert (=> b!1544433 (= c!141423 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666137))))

(declare-fun e!859656 () ListLongMap!22049)

(declare-fun e!859652 () ListLongMap!22049)

(assert (=> b!1544433 (= e!859656 e!859652)))

(declare-fun b!1544434 () Bool)

(declare-fun call!68885 () ListLongMap!22049)

(assert (=> b!1544434 (= e!859652 call!68885)))

(declare-fun mapNonEmpty!58549 () Bool)

(declare-fun tp!111115 () Bool)

(declare-fun e!859650 () Bool)

(assert (=> mapNonEmpty!58549 (= mapRes!58549 (and tp!111115 e!859650))))

(declare-fun mapKey!58549 () (_ BitVec 32))

(declare-fun mapValue!58549 () ValueCell!18038)

(declare-fun mapRest!58549 () (Array (_ BitVec 32) ValueCell!18038))

(assert (=> mapNonEmpty!58549 (= (arr!49706 _values!470) (store mapRest!58549 mapKey!58549 mapValue!58549))))

(declare-fun b!1544435 () Bool)

(declare-fun res!1059415 () Bool)

(assert (=> b!1544435 (=> (not res!1059415) (not e!859651))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544435 (= res!1059415 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50255 _keys!618))))))

(declare-fun b!1544436 () Bool)

(declare-fun res!1059416 () Bool)

(assert (=> b!1544436 (=> (not res!1059416) (not e!859651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103006 (_ BitVec 32)) Bool)

(assert (=> b!1544436 (= res!1059416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544437 () Bool)

(declare-fun call!68888 () ListLongMap!22049)

(assert (=> b!1544437 (= e!859652 call!68888)))

(declare-fun b!1544438 () Bool)

(assert (=> b!1544438 (= e!859656 call!68885)))

(declare-fun b!1544439 () Bool)

(declare-fun res!1059414 () Bool)

(assert (=> b!1544439 (=> (not res!1059414) (not e!859651))))

(declare-datatypes ((List!35957 0))(
  ( (Nil!35954) (Cons!35953 (h!37398 (_ BitVec 64)) (t!50651 List!35957)) )
))
(declare-fun arrayNoDuplicates!0 (array!103006 (_ BitVec 32) List!35957) Bool)

(assert (=> b!1544439 (= res!1059414 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35954))))

(declare-fun b!1544440 () Bool)

(declare-fun tp_is_empty!37897 () Bool)

(assert (=> b!1544440 (= e!859650 tp_is_empty!37897)))

(declare-fun b!1544441 () Bool)

(declare-fun call!68886 () ListLongMap!22049)

(declare-fun minValue!436 () V!58973)

(declare-fun +!4878 (ListLongMap!22049 tuple2!24440) ListLongMap!22049)

(assert (=> b!1544441 (= e!859653 (+!4878 call!68886 (tuple2!24441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544442 () Bool)

(assert (=> b!1544442 (= e!859653 e!859656)))

(declare-fun c!141425 () Bool)

(assert (=> b!1544442 (= c!141425 (and (not lt!666137) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1059417 () Bool)

(assert (=> start!131908 (=> (not res!1059417) (not e!859651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131908 (= res!1059417 (validMask!0 mask!926))))

(assert (=> start!131908 e!859651))

(declare-fun array_inv!38665 (array!103006) Bool)

(assert (=> start!131908 (array_inv!38665 _keys!618)))

(assert (=> start!131908 tp_is_empty!37897))

(assert (=> start!131908 true))

(assert (=> start!131908 tp!111114))

(declare-fun e!859649 () Bool)

(declare-fun array_inv!38666 (array!103008) Bool)

(assert (=> start!131908 (and (array_inv!38666 _values!470) e!859649)))

(declare-fun zeroValue!436 () V!58973)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!68889 () ListLongMap!22049)

(declare-fun bm!68882 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6512 (array!103006 array!103008 (_ BitVec 32) (_ BitVec 32) V!58973 V!58973 (_ BitVec 32) Int) ListLongMap!22049)

(assert (=> bm!68882 (= call!68889 (getCurrentListMapNoExtraKeys!6512 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68883 () Bool)

(assert (=> bm!68883 (= call!68885 call!68886)))

(declare-fun bm!68884 () Bool)

(declare-fun call!68887 () ListLongMap!22049)

(assert (=> bm!68884 (= call!68887 call!68889)))

(declare-fun b!1544443 () Bool)

(declare-fun e!859655 () Bool)

(assert (=> b!1544443 (= e!859649 (and e!859655 mapRes!58549))))

(declare-fun condMapEmpty!58549 () Bool)

(declare-fun mapDefault!58549 () ValueCell!18038)

