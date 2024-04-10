; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132142 () Bool)

(assert start!132142)

(declare-fun b_free!31855 () Bool)

(declare-fun b_next!31855 () Bool)

(assert (=> start!132142 (= b_free!31855 (not b_next!31855))))

(declare-fun tp!111817 () Bool)

(declare-fun b_and!51277 () Bool)

(assert (=> start!132142 (= tp!111817 b_and!51277)))

(declare-fun b!1550113 () Bool)

(declare-fun res!1061856 () Bool)

(declare-fun e!862876 () Bool)

(assert (=> b!1550113 (=> (not res!1061856) (not e!862876))))

(declare-datatypes ((array!103458 0))(
  ( (array!103459 (arr!49931 (Array (_ BitVec 32) (_ BitVec 64))) (size!50481 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103458)

(declare-datatypes ((List!36147 0))(
  ( (Nil!36144) (Cons!36143 (h!37588 (_ BitVec 64)) (t!50853 List!36147)) )
))
(declare-fun arrayNoDuplicates!0 (array!103458 (_ BitVec 32) List!36147) Bool)

(assert (=> b!1550113 (= res!1061856 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36144))))

(declare-fun b!1550114 () Bool)

(declare-datatypes ((V!59285 0))(
  ( (V!59286 (val!19143 Int)) )
))
(declare-datatypes ((tuple2!24664 0))(
  ( (tuple2!24665 (_1!12343 (_ BitVec 64)) (_2!12343 V!59285)) )
))
(declare-datatypes ((List!36148 0))(
  ( (Nil!36145) (Cons!36144 (h!37589 tuple2!24664) (t!50854 List!36148)) )
))
(declare-datatypes ((ListLongMap!22273 0))(
  ( (ListLongMap!22274 (toList!11152 List!36148)) )
))
(declare-fun e!862877 () ListLongMap!22273)

(declare-fun call!70651 () ListLongMap!22273)

(declare-fun minValue!436 () V!59285)

(declare-fun +!4977 (ListLongMap!22273 tuple2!24664) ListLongMap!22273)

(assert (=> b!1550114 (= e!862877 (+!4977 call!70651 (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550115 () Bool)

(declare-fun res!1061853 () Bool)

(assert (=> b!1550115 (=> (not res!1061853) (not e!862876))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103458 (_ BitVec 32)) Bool)

(assert (=> b!1550115 (= res!1061853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550116 () Bool)

(assert (=> b!1550116 (= e!862876 false)))

(declare-fun lt!668224 () ListLongMap!22273)

(assert (=> b!1550116 (= lt!668224 e!862877)))

(declare-fun c!142512 () Bool)

(declare-fun lt!668225 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550116 (= c!142512 (and (not lt!668225) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550116 (= lt!668225 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550117 () Bool)

(declare-fun res!1061852 () Bool)

(assert (=> b!1550117 (=> (not res!1061852) (not e!862876))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1550117 (= res!1061852 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50481 _keys!618))))))

(declare-fun bm!70646 () Bool)

(declare-fun call!70652 () ListLongMap!22273)

(declare-fun call!70650 () ListLongMap!22273)

(assert (=> bm!70646 (= call!70652 call!70650)))

(declare-fun b!1550118 () Bool)

(declare-fun e!862874 () ListLongMap!22273)

(declare-fun call!70649 () ListLongMap!22273)

(assert (=> b!1550118 (= e!862874 call!70649)))

(declare-fun call!70653 () ListLongMap!22273)

(declare-fun bm!70647 () Bool)

(declare-fun c!142514 () Bool)

(declare-fun zeroValue!436 () V!59285)

(assert (=> bm!70647 (= call!70651 (+!4977 (ite c!142512 call!70650 (ite c!142514 call!70652 call!70653)) (ite (or c!142512 c!142514) (tuple2!24665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550119 () Bool)

(declare-fun res!1061855 () Bool)

(assert (=> b!1550119 (=> (not res!1061855) (not e!862876))))

(declare-datatypes ((ValueCell!18155 0))(
  ( (ValueCellFull!18155 (v!21944 V!59285)) (EmptyCell!18155) )
))
(declare-datatypes ((array!103460 0))(
  ( (array!103461 (arr!49932 (Array (_ BitVec 32) ValueCell!18155)) (size!50482 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103460)

(assert (=> b!1550119 (= res!1061855 (and (= (size!50482 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50481 _keys!618) (size!50482 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58900 () Bool)

(declare-fun mapRes!58900 () Bool)

(declare-fun tp!111816 () Bool)

(declare-fun e!862873 () Bool)

(assert (=> mapNonEmpty!58900 (= mapRes!58900 (and tp!111816 e!862873))))

(declare-fun mapRest!58900 () (Array (_ BitVec 32) ValueCell!18155))

(declare-fun mapValue!58900 () ValueCell!18155)

(declare-fun mapKey!58900 () (_ BitVec 32))

(assert (=> mapNonEmpty!58900 (= (arr!49932 _values!470) (store mapRest!58900 mapKey!58900 mapValue!58900))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70648 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6602 (array!103458 array!103460 (_ BitVec 32) (_ BitVec 32) V!59285 V!59285 (_ BitVec 32) Int) ListLongMap!22273)

(assert (=> bm!70648 (= call!70650 (getCurrentListMapNoExtraKeys!6602 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70649 () Bool)

(assert (=> bm!70649 (= call!70649 call!70651)))

(declare-fun b!1550120 () Bool)

(declare-fun e!862871 () ListLongMap!22273)

(assert (=> b!1550120 (= e!862877 e!862871)))

(assert (=> b!1550120 (= c!142514 (and (not lt!668225) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1061854 () Bool)

(assert (=> start!132142 (=> (not res!1061854) (not e!862876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132142 (= res!1061854 (validMask!0 mask!926))))

(assert (=> start!132142 e!862876))

(declare-fun array_inv!38819 (array!103458) Bool)

(assert (=> start!132142 (array_inv!38819 _keys!618)))

(declare-fun tp_is_empty!38131 () Bool)

(assert (=> start!132142 tp_is_empty!38131))

(assert (=> start!132142 true))

(assert (=> start!132142 tp!111817))

(declare-fun e!862878 () Bool)

(declare-fun array_inv!38820 (array!103460) Bool)

(assert (=> start!132142 (and (array_inv!38820 _values!470) e!862878)))

(declare-fun b!1550121 () Bool)

(assert (=> b!1550121 (= e!862873 tp_is_empty!38131)))

(declare-fun b!1550122 () Bool)

(assert (=> b!1550122 (= e!862871 call!70649)))

(declare-fun bm!70650 () Bool)

(assert (=> bm!70650 (= call!70653 call!70652)))

(declare-fun b!1550123 () Bool)

(declare-fun c!142513 () Bool)

(assert (=> b!1550123 (= c!142513 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668225))))

(assert (=> b!1550123 (= e!862871 e!862874)))

(declare-fun mapIsEmpty!58900 () Bool)

(assert (=> mapIsEmpty!58900 mapRes!58900))

(declare-fun b!1550124 () Bool)

(declare-fun e!862872 () Bool)

(assert (=> b!1550124 (= e!862872 tp_is_empty!38131)))

(declare-fun b!1550125 () Bool)

(assert (=> b!1550125 (= e!862874 call!70653)))

(declare-fun b!1550126 () Bool)

(assert (=> b!1550126 (= e!862878 (and e!862872 mapRes!58900))))

(declare-fun condMapEmpty!58900 () Bool)

(declare-fun mapDefault!58900 () ValueCell!18155)

