; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132300 () Bool)

(assert start!132300)

(declare-fun b_free!31927 () Bool)

(declare-fun b_next!31927 () Bool)

(assert (=> start!132300 (= b_free!31927 (not b_next!31927))))

(declare-fun tp!112045 () Bool)

(declare-fun b_and!51365 () Bool)

(assert (=> start!132300 (= tp!112045 b_and!51365)))

(declare-fun bm!71222 () Bool)

(declare-datatypes ((V!59381 0))(
  ( (V!59382 (val!19179 Int)) )
))
(declare-datatypes ((tuple2!24734 0))(
  ( (tuple2!24735 (_1!12378 (_ BitVec 64)) (_2!12378 V!59381)) )
))
(declare-datatypes ((List!36209 0))(
  ( (Nil!36206) (Cons!36205 (h!37650 tuple2!24734) (t!50923 List!36209)) )
))
(declare-datatypes ((ListLongMap!22343 0))(
  ( (ListLongMap!22344 (toList!11187 List!36209)) )
))
(declare-fun call!71229 () ListLongMap!22343)

(declare-fun call!71228 () ListLongMap!22343)

(assert (=> bm!71222 (= call!71229 call!71228)))

(declare-fun b!1552287 () Bool)

(declare-fun e!864155 () ListLongMap!22343)

(declare-fun call!71227 () ListLongMap!22343)

(declare-fun minValue!436 () V!59381)

(declare-fun +!5007 (ListLongMap!22343 tuple2!24734) ListLongMap!22343)

(assert (=> b!1552287 (= e!864155 (+!5007 call!71227 (tuple2!24735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1552288 () Bool)

(declare-fun res!1062784 () Bool)

(declare-fun e!864161 () Bool)

(assert (=> b!1552288 (=> (not res!1062784) (not e!864161))))

(declare-datatypes ((array!103608 0))(
  ( (array!103609 (arr!50002 (Array (_ BitVec 32) (_ BitVec 64))) (size!50552 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103608)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103608 (_ BitVec 32)) Bool)

(assert (=> b!1552288 (= res!1062784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552289 () Bool)

(declare-fun res!1062783 () Bool)

(assert (=> b!1552289 (=> (not res!1062783) (not e!864161))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18191 0))(
  ( (ValueCellFull!18191 (v!21984 V!59381)) (EmptyCell!18191) )
))
(declare-datatypes ((array!103610 0))(
  ( (array!103611 (arr!50003 (Array (_ BitVec 32) ValueCell!18191)) (size!50553 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103610)

(assert (=> b!1552289 (= res!1062783 (and (= (size!50553 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50552 _keys!618) (size!50553 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552290 () Bool)

(declare-fun res!1062777 () Bool)

(assert (=> b!1552290 (=> (not res!1062777) (not e!864161))))

(declare-datatypes ((List!36210 0))(
  ( (Nil!36207) (Cons!36206 (h!37651 (_ BitVec 64)) (t!50924 List!36210)) )
))
(declare-fun arrayNoDuplicates!0 (array!103608 (_ BitVec 32) List!36210) Bool)

(assert (=> b!1552290 (= res!1062777 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36207))))

(declare-fun b!1552291 () Bool)

(declare-datatypes ((Unit!51699 0))(
  ( (Unit!51700) )
))
(declare-fun e!864163 () Unit!51699)

(declare-fun Unit!51701 () Unit!51699)

(assert (=> b!1552291 (= e!864163 Unit!51701)))

(declare-fun zeroValue!436 () V!59381)

(declare-fun c!142953 () Bool)

(declare-fun c!142955 () Bool)

(declare-fun call!71225 () ListLongMap!22343)

(declare-fun bm!71223 () Bool)

(assert (=> bm!71223 (= call!71227 (+!5007 (ite c!142955 call!71225 (ite c!142953 call!71228 call!71229)) (ite (or c!142955 c!142953) (tuple2!24735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!59020 () Bool)

(declare-fun mapRes!59020 () Bool)

(assert (=> mapIsEmpty!59020 mapRes!59020))

(declare-fun b!1552292 () Bool)

(declare-fun e!864154 () Bool)

(assert (=> b!1552292 (= e!864161 e!864154)))

(declare-fun res!1062782 () Bool)

(assert (=> b!1552292 (=> (not res!1062782) (not e!864154))))

(declare-fun lt!669203 () Bool)

(assert (=> b!1552292 (= res!1062782 (not lt!669203))))

(declare-fun lt!669201 () Unit!51699)

(assert (=> b!1552292 (= lt!669201 e!864163)))

(declare-fun c!142952 () Bool)

(assert (=> b!1552292 (= c!142952 (not lt!669203))))

(declare-fun e!864158 () Bool)

(assert (=> b!1552292 (= lt!669203 e!864158)))

(declare-fun res!1062780 () Bool)

(assert (=> b!1552292 (=> res!1062780 e!864158)))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1552292 (= res!1062780 (bvsge from!762 (size!50552 _keys!618)))))

(declare-fun lt!669202 () ListLongMap!22343)

(assert (=> b!1552292 (= lt!669202 e!864155)))

(declare-fun lt!669204 () Bool)

(assert (=> b!1552292 (= c!142955 (and (not lt!669204) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552292 (= lt!669204 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1552293 () Bool)

(declare-fun e!864156 () Bool)

(declare-fun tp_is_empty!38203 () Bool)

(assert (=> b!1552293 (= e!864156 tp_is_empty!38203)))

(declare-fun b!1552294 () Bool)

(declare-fun e!864159 () ListLongMap!22343)

(assert (=> b!1552294 (= e!864155 e!864159)))

(assert (=> b!1552294 (= c!142953 (and (not lt!669204) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552295 () Bool)

(declare-fun res!1062778 () Bool)

(assert (=> b!1552295 (=> (not res!1062778) (not e!864161))))

(assert (=> b!1552295 (= res!1062778 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50552 _keys!618))))))

(declare-fun res!1062779 () Bool)

(assert (=> start!132300 (=> (not res!1062779) (not e!864161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132300 (= res!1062779 (validMask!0 mask!926))))

(assert (=> start!132300 e!864161))

(declare-fun array_inv!38871 (array!103608) Bool)

(assert (=> start!132300 (array_inv!38871 _keys!618)))

(assert (=> start!132300 tp_is_empty!38203))

(assert (=> start!132300 true))

(assert (=> start!132300 tp!112045))

(declare-fun e!864153 () Bool)

(declare-fun array_inv!38872 (array!103610) Bool)

(assert (=> start!132300 (and (array_inv!38872 _values!470) e!864153)))

(declare-fun mapNonEmpty!59020 () Bool)

(declare-fun tp!112044 () Bool)

(assert (=> mapNonEmpty!59020 (= mapRes!59020 (and tp!112044 e!864156))))

(declare-fun mapKey!59020 () (_ BitVec 32))

(declare-fun mapValue!59020 () ValueCell!18191)

(declare-fun mapRest!59020 () (Array (_ BitVec 32) ValueCell!18191))

(assert (=> mapNonEmpty!59020 (= (arr!50003 _values!470) (store mapRest!59020 mapKey!59020 mapValue!59020))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!71224 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6632 (array!103608 array!103610 (_ BitVec 32) (_ BitVec 32) V!59381 V!59381 (_ BitVec 32) Int) ListLongMap!22343)

(assert (=> bm!71224 (= call!71225 (getCurrentListMapNoExtraKeys!6632 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71225 () Bool)

(assert (=> bm!71225 (= call!71228 call!71225)))

(declare-fun b!1552296 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552296 (= e!864158 (not (validKeyInArray!0 (select (arr!50002 _keys!618) from!762))))))

(declare-fun b!1552297 () Bool)

(assert (=> b!1552297 (= e!864154 (bvsge from!762 (size!50553 _values!470)))))

(declare-fun b!1552298 () Bool)

(declare-fun e!864157 () ListLongMap!22343)

(assert (=> b!1552298 (= e!864157 call!71229)))

(declare-fun b!1552299 () Bool)

(declare-fun lt!669200 () Unit!51699)

(assert (=> b!1552299 (= e!864163 lt!669200)))

(declare-fun lt!669197 () ListLongMap!22343)

(assert (=> b!1552299 (= lt!669197 (getCurrentListMapNoExtraKeys!6632 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669198 () Unit!51699)

(declare-fun addStillContains!1303 (ListLongMap!22343 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51699)

(assert (=> b!1552299 (= lt!669198 (addStillContains!1303 lt!669197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50002 _keys!618) from!762)))))

(declare-fun lt!669206 () ListLongMap!22343)

(assert (=> b!1552299 (= lt!669206 (+!5007 lt!669197 (tuple2!24735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10127 (ListLongMap!22343 (_ BitVec 64)) Bool)

(assert (=> b!1552299 (contains!10127 lt!669206 (select (arr!50002 _keys!618) from!762))))

(declare-fun addApplyDifferent!645 (ListLongMap!22343 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51699)

(assert (=> b!1552299 (= lt!669200 (addApplyDifferent!645 lt!669197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50002 _keys!618) from!762)))))

(declare-fun lt!669199 () V!59381)

(declare-fun apply!1107 (ListLongMap!22343 (_ BitVec 64)) V!59381)

(assert (=> b!1552299 (= lt!669199 (apply!1107 (+!5007 lt!669197 (tuple2!24735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50002 _keys!618) from!762)))))

(declare-fun lt!669207 () V!59381)

(assert (=> b!1552299 (= lt!669207 (apply!1107 lt!669197 (select (arr!50002 _keys!618) from!762)))))

(assert (=> b!1552299 (= lt!669199 lt!669207)))

(declare-fun lt!669205 () Unit!51699)

(assert (=> b!1552299 (= lt!669205 (addApplyDifferent!645 lt!669197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50002 _keys!618) from!762)))))

(assert (=> b!1552299 (= (apply!1107 lt!669206 (select (arr!50002 _keys!618) from!762)) lt!669207)))

(declare-fun b!1552300 () Bool)

(declare-fun res!1062781 () Bool)

(assert (=> b!1552300 (=> (not res!1062781) (not e!864154))))

(assert (=> b!1552300 (= res!1062781 (contains!10127 lt!669202 (select (arr!50002 _keys!618) from!762)))))

(declare-fun b!1552301 () Bool)

(declare-fun e!864162 () Bool)

(assert (=> b!1552301 (= e!864153 (and e!864162 mapRes!59020))))

(declare-fun condMapEmpty!59020 () Bool)

(declare-fun mapDefault!59020 () ValueCell!18191)

