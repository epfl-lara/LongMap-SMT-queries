; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109802 () Bool)

(assert start!109802)

(declare-fun b_free!29195 () Bool)

(declare-fun b_next!29195 () Bool)

(assert (=> start!109802 (= b_free!29195 (not b_next!29195))))

(declare-fun tp!102719 () Bool)

(declare-fun b_and!47309 () Bool)

(assert (=> start!109802 (= tp!102719 b_and!47309)))

(declare-fun bm!63706 () Bool)

(declare-datatypes ((V!51549 0))(
  ( (V!51550 (val!17492 Int)) )
))
(declare-datatypes ((tuple2!22562 0))(
  ( (tuple2!22563 (_1!11292 (_ BitVec 64)) (_2!11292 V!51549)) )
))
(declare-datatypes ((List!29694 0))(
  ( (Nil!29691) (Cons!29690 (h!30899 tuple2!22562) (t!43268 List!29694)) )
))
(declare-datatypes ((ListLongMap!20219 0))(
  ( (ListLongMap!20220 (toList!10125 List!29694)) )
))
(declare-fun call!63711 () ListLongMap!20219)

(declare-fun call!63710 () ListLongMap!20219)

(assert (=> bm!63706 (= call!63711 call!63710)))

(declare-fun b!1300704 () Bool)

(declare-fun res!864316 () Bool)

(declare-fun e!741937 () Bool)

(assert (=> b!1300704 (=> (not res!864316) (not e!741937))))

(declare-datatypes ((array!86682 0))(
  ( (array!86683 (arr!41837 (Array (_ BitVec 32) (_ BitVec 64))) (size!42387 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86682)

(declare-datatypes ((List!29695 0))(
  ( (Nil!29692) (Cons!29691 (h!30900 (_ BitVec 64)) (t!43269 List!29695)) )
))
(declare-fun arrayNoDuplicates!0 (array!86682 (_ BitVec 32) List!29695) Bool)

(assert (=> b!1300704 (= res!864316 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29692))))

(declare-fun call!63709 () Bool)

(declare-fun bm!63707 () Bool)

(declare-fun lt!581491 () ListLongMap!20219)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!581492 () ListLongMap!20219)

(declare-fun c!124625 () Bool)

(declare-fun c!124623 () Bool)

(declare-fun lt!581497 () ListLongMap!20219)

(declare-fun contains!8251 (ListLongMap!20219 (_ BitVec 64)) Bool)

(assert (=> bm!63707 (= call!63709 (contains!8251 (ite c!124625 lt!581492 (ite c!124623 lt!581491 lt!581497)) k!1205))))

(declare-fun b!1300705 () Bool)

(assert (=> b!1300705 (= e!741937 (not true))))

(assert (=> b!1300705 (not (contains!8251 (ListLongMap!20220 Nil!29691) k!1205))))

(declare-datatypes ((Unit!43045 0))(
  ( (Unit!43046) )
))
(declare-fun lt!581501 () Unit!43045)

(declare-fun emptyContainsNothing!194 ((_ BitVec 64)) Unit!43045)

(assert (=> b!1300705 (= lt!581501 (emptyContainsNothing!194 k!1205))))

(declare-fun lt!581494 () Unit!43045)

(declare-fun e!741940 () Unit!43045)

(assert (=> b!1300705 (= lt!581494 e!741940)))

(declare-fun lt!581493 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300705 (= c!124625 (and (not lt!581493) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300705 (= lt!581493 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!53828 () Bool)

(declare-fun mapRes!53828 () Bool)

(declare-fun tp!102718 () Bool)

(declare-fun e!741938 () Bool)

(assert (=> mapNonEmpty!53828 (= mapRes!53828 (and tp!102718 e!741938))))

(declare-datatypes ((ValueCell!16519 0))(
  ( (ValueCellFull!16519 (v!20100 V!51549)) (EmptyCell!16519) )
))
(declare-fun mapValue!53828 () ValueCell!16519)

(declare-fun mapRest!53828 () (Array (_ BitVec 32) ValueCell!16519))

(declare-datatypes ((array!86684 0))(
  ( (array!86685 (arr!41838 (Array (_ BitVec 32) ValueCell!16519)) (size!42388 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86684)

(declare-fun mapKey!53828 () (_ BitVec 32))

(assert (=> mapNonEmpty!53828 (= (arr!41838 _values!1445) (store mapRest!53828 mapKey!53828 mapValue!53828))))

(declare-fun b!1300706 () Bool)

(declare-fun res!864319 () Bool)

(assert (=> b!1300706 (=> (not res!864319) (not e!741937))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1300706 (= res!864319 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42387 _keys!1741))))))

(declare-fun b!1300707 () Bool)

(declare-fun e!741942 () Unit!43045)

(assert (=> b!1300707 (= e!741940 e!741942)))

(assert (=> b!1300707 (= c!124623 (and (not lt!581493) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300708 () Bool)

(declare-fun call!63713 () Bool)

(assert (=> b!1300708 call!63713))

(declare-fun lt!581500 () Unit!43045)

(declare-fun call!63714 () Unit!43045)

(assert (=> b!1300708 (= lt!581500 call!63714)))

(assert (=> b!1300708 (= lt!581491 call!63711)))

(assert (=> b!1300708 (= e!741942 lt!581500)))

(declare-fun b!1300709 () Bool)

(declare-fun e!741944 () Bool)

(declare-fun e!741941 () Bool)

(assert (=> b!1300709 (= e!741944 (and e!741941 mapRes!53828))))

(declare-fun condMapEmpty!53828 () Bool)

(declare-fun mapDefault!53828 () ValueCell!16519)

