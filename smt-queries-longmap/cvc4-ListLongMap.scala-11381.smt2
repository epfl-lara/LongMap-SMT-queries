; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132256 () Bool)

(assert start!132256)

(declare-fun b_free!31907 () Bool)

(declare-fun b_next!31907 () Bool)

(assert (=> start!132256 (= b_free!31907 (not b_next!31907))))

(declare-fun tp!111981 () Bool)

(declare-fun b_and!51341 () Bool)

(assert (=> start!132256 (= tp!111981 b_and!51341)))

(declare-fun b!1551661 () Bool)

(declare-fun e!863785 () Bool)

(declare-datatypes ((array!103568 0))(
  ( (array!103569 (arr!49983 (Array (_ BitVec 32) (_ BitVec 64))) (size!50533 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103568)

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1551661 (= e!863785 (not (= (select (arr!49983 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58987 () Bool)

(declare-fun mapRes!58987 () Bool)

(assert (=> mapIsEmpty!58987 mapRes!58987))

(declare-fun bm!71063 () Bool)

(declare-datatypes ((V!59353 0))(
  ( (V!59354 (val!19169 Int)) )
))
(declare-datatypes ((tuple2!24714 0))(
  ( (tuple2!24715 (_1!12368 (_ BitVec 64)) (_2!12368 V!59353)) )
))
(declare-datatypes ((List!36192 0))(
  ( (Nil!36189) (Cons!36188 (h!37633 tuple2!24714) (t!50904 List!36192)) )
))
(declare-datatypes ((ListLongMap!22323 0))(
  ( (ListLongMap!22324 (toList!11177 List!36192)) )
))
(declare-fun call!71068 () ListLongMap!22323)

(declare-fun call!71066 () ListLongMap!22323)

(assert (=> bm!71063 (= call!71068 call!71066)))

(declare-fun b!1551662 () Bool)

(declare-fun e!863780 () Bool)

(declare-fun tp_is_empty!38183 () Bool)

(assert (=> b!1551662 (= e!863780 tp_is_empty!38183)))

(declare-fun b!1551663 () Bool)

(declare-fun res!1062535 () Bool)

(declare-fun e!863779 () Bool)

(assert (=> b!1551663 (=> (not res!1062535) (not e!863779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551663 (= res!1062535 (validKeyInArray!0 (select (arr!49983 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58987 () Bool)

(declare-fun tp!111982 () Bool)

(declare-fun e!863777 () Bool)

(assert (=> mapNonEmpty!58987 (= mapRes!58987 (and tp!111982 e!863777))))

(declare-datatypes ((ValueCell!18181 0))(
  ( (ValueCellFull!18181 (v!21973 V!59353)) (EmptyCell!18181) )
))
(declare-datatypes ((array!103570 0))(
  ( (array!103571 (arr!49984 (Array (_ BitVec 32) ValueCell!18181)) (size!50534 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103570)

(declare-fun mapRest!58987 () (Array (_ BitVec 32) ValueCell!18181))

(declare-fun mapValue!58987 () ValueCell!18181)

(declare-fun mapKey!58987 () (_ BitVec 32))

(assert (=> mapNonEmpty!58987 (= (arr!49984 _values!470) (store mapRest!58987 mapKey!58987 mapValue!58987))))

(declare-fun zeroValue!436 () V!59353)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59353)

(declare-fun bm!71064 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6624 (array!103568 array!103570 (_ BitVec 32) (_ BitVec 32) V!59353 V!59353 (_ BitVec 32) Int) ListLongMap!22323)

(assert (=> bm!71064 (= call!71066 (getCurrentListMapNoExtraKeys!6624 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551664 () Bool)

(declare-fun res!1062541 () Bool)

(declare-fun e!863783 () Bool)

(assert (=> b!1551664 (=> (not res!1062541) (not e!863783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103568 (_ BitVec 32)) Bool)

(assert (=> b!1551664 (= res!1062541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551665 () Bool)

(assert (=> b!1551665 (= e!863783 e!863779)))

(declare-fun res!1062542 () Bool)

(assert (=> b!1551665 (=> (not res!1062542) (not e!863779))))

(assert (=> b!1551665 (= res!1062542 (bvslt from!762 (size!50533 _keys!618)))))

(declare-fun lt!668805 () ListLongMap!22323)

(declare-fun e!863778 () ListLongMap!22323)

(assert (=> b!1551665 (= lt!668805 e!863778)))

(declare-fun c!142811 () Bool)

(declare-fun lt!668801 () Bool)

(assert (=> b!1551665 (= c!142811 (and (not lt!668801) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551665 (= lt!668801 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551666 () Bool)

(declare-fun c!142812 () Bool)

(assert (=> b!1551666 (= c!142812 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668801))))

(declare-fun e!863776 () ListLongMap!22323)

(declare-fun e!863781 () ListLongMap!22323)

(assert (=> b!1551666 (= e!863776 e!863781)))

(declare-fun b!1551667 () Bool)

(declare-fun res!1062537 () Bool)

(assert (=> b!1551667 (=> (not res!1062537) (not e!863783))))

(assert (=> b!1551667 (= res!1062537 (and (= (size!50534 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50533 _keys!618) (size!50534 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1062540 () Bool)

(assert (=> start!132256 (=> (not res!1062540) (not e!863783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132256 (= res!1062540 (validMask!0 mask!926))))

(assert (=> start!132256 e!863783))

(declare-fun array_inv!38857 (array!103568) Bool)

(assert (=> start!132256 (array_inv!38857 _keys!618)))

(assert (=> start!132256 tp_is_empty!38183))

(assert (=> start!132256 true))

(assert (=> start!132256 tp!111981))

(declare-fun e!863784 () Bool)

(declare-fun array_inv!38858 (array!103570) Bool)

(assert (=> start!132256 (and (array_inv!38858 _values!470) e!863784)))

(declare-fun bm!71065 () Bool)

(declare-fun call!71067 () ListLongMap!22323)

(assert (=> bm!71065 (= call!71067 call!71068)))

(declare-fun call!71070 () ListLongMap!22323)

(declare-fun c!142813 () Bool)

(declare-fun bm!71066 () Bool)

(declare-fun +!4998 (ListLongMap!22323 tuple2!24714) ListLongMap!22323)

(assert (=> bm!71066 (= call!71070 (+!4998 (ite c!142811 call!71066 (ite c!142813 call!71068 call!71067)) (ite (or c!142811 c!142813) (tuple2!24715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551668 () Bool)

(declare-fun res!1062538 () Bool)

(assert (=> b!1551668 (=> (not res!1062538) (not e!863783))))

(assert (=> b!1551668 (= res!1062538 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50533 _keys!618))))))

(declare-fun bm!71067 () Bool)

(declare-fun call!71069 () ListLongMap!22323)

(assert (=> bm!71067 (= call!71069 call!71070)))

(declare-fun b!1551669 () Bool)

(assert (=> b!1551669 (= e!863777 tp_is_empty!38183)))

(declare-fun b!1551670 () Bool)

(assert (=> b!1551670 (= e!863778 e!863776)))

(assert (=> b!1551670 (= c!142813 (and (not lt!668801) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551671 () Bool)

(assert (=> b!1551671 (= e!863784 (and e!863780 mapRes!58987))))

(declare-fun condMapEmpty!58987 () Bool)

(declare-fun mapDefault!58987 () ValueCell!18181)

