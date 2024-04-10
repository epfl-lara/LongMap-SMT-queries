; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132286 () Bool)

(assert start!132286)

(declare-fun b_free!31913 () Bool)

(declare-fun b_next!31913 () Bool)

(assert (=> start!132286 (= b_free!31913 (not b_next!31913))))

(declare-fun tp!112003 () Bool)

(declare-fun b_and!51351 () Bool)

(assert (=> start!132286 (= tp!112003 b_and!51351)))

(declare-fun mapIsEmpty!58999 () Bool)

(declare-fun mapRes!58999 () Bool)

(assert (=> mapIsEmpty!58999 mapRes!58999))

(declare-fun b!1551917 () Bool)

(declare-fun c!142870 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668975 () Bool)

(assert (=> b!1551917 (= c!142870 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668975))))

(declare-datatypes ((V!59361 0))(
  ( (V!59362 (val!19172 Int)) )
))
(declare-datatypes ((tuple2!24720 0))(
  ( (tuple2!24721 (_1!12371 (_ BitVec 64)) (_2!12371 V!59361)) )
))
(declare-datatypes ((List!36197 0))(
  ( (Nil!36194) (Cons!36193 (h!37638 tuple2!24720) (t!50911 List!36197)) )
))
(declare-datatypes ((ListLongMap!22329 0))(
  ( (ListLongMap!22330 (toList!11180 List!36197)) )
))
(declare-fun e!863940 () ListLongMap!22329)

(declare-fun e!863938 () ListLongMap!22329)

(assert (=> b!1551917 (= e!863940 e!863938)))

(declare-fun bm!71117 () Bool)

(declare-fun call!71122 () ListLongMap!22329)

(declare-fun call!71123 () ListLongMap!22329)

(assert (=> bm!71117 (= call!71122 call!71123)))

(declare-fun b!1551918 () Bool)

(declare-datatypes ((Unit!51682 0))(
  ( (Unit!51683) )
))
(declare-fun e!863937 () Unit!51682)

(declare-fun lt!668971 () Unit!51682)

(assert (=> b!1551918 (= e!863937 lt!668971)))

(declare-fun lt!668974 () ListLongMap!22329)

(declare-datatypes ((array!103582 0))(
  ( (array!103583 (arr!49989 (Array (_ BitVec 32) (_ BitVec 64))) (size!50539 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103582)

(declare-fun zeroValue!436 () V!59361)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18184 0))(
  ( (ValueCellFull!18184 (v!21977 V!59361)) (EmptyCell!18184) )
))
(declare-datatypes ((array!103584 0))(
  ( (array!103585 (arr!49990 (Array (_ BitVec 32) ValueCell!18184)) (size!50540 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103584)

(declare-fun minValue!436 () V!59361)

(declare-fun getCurrentListMapNoExtraKeys!6627 (array!103582 array!103584 (_ BitVec 32) (_ BitVec 32) V!59361 V!59361 (_ BitVec 32) Int) ListLongMap!22329)

(assert (=> b!1551918 (= lt!668974 (getCurrentListMapNoExtraKeys!6627 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668968 () Unit!51682)

(declare-fun addStillContains!1298 (ListLongMap!22329 (_ BitVec 64) V!59361 (_ BitVec 64)) Unit!51682)

(assert (=> b!1551918 (= lt!668968 (addStillContains!1298 lt!668974 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49989 _keys!618) from!762)))))

(declare-fun lt!668973 () ListLongMap!22329)

(declare-fun +!5001 (ListLongMap!22329 tuple2!24720) ListLongMap!22329)

(assert (=> b!1551918 (= lt!668973 (+!5001 lt!668974 (tuple2!24721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10122 (ListLongMap!22329 (_ BitVec 64)) Bool)

(assert (=> b!1551918 (contains!10122 lt!668973 (select (arr!49989 _keys!618) from!762))))

(declare-fun addApplyDifferent!640 (ListLongMap!22329 (_ BitVec 64) V!59361 (_ BitVec 64)) Unit!51682)

(assert (=> b!1551918 (= lt!668971 (addApplyDifferent!640 lt!668974 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49989 _keys!618) from!762)))))

(declare-fun lt!668972 () V!59361)

(declare-fun apply!1102 (ListLongMap!22329 (_ BitVec 64)) V!59361)

(assert (=> b!1551918 (= lt!668972 (apply!1102 (+!5001 lt!668974 (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49989 _keys!618) from!762)))))

(declare-fun lt!668976 () V!59361)

(assert (=> b!1551918 (= lt!668976 (apply!1102 lt!668974 (select (arr!49989 _keys!618) from!762)))))

(assert (=> b!1551918 (= lt!668972 lt!668976)))

(declare-fun lt!668970 () Unit!51682)

(assert (=> b!1551918 (= lt!668970 (addApplyDifferent!640 lt!668974 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49989 _keys!618) from!762)))))

(assert (=> b!1551918 (= (apply!1102 lt!668973 (select (arr!49989 _keys!618) from!762)) lt!668976)))

(declare-fun b!1551919 () Bool)

(declare-fun res!1062641 () Bool)

(declare-fun e!863939 () Bool)

(assert (=> b!1551919 (=> (not res!1062641) (not e!863939))))

(assert (=> b!1551919 (= res!1062641 (and (= (size!50540 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50539 _keys!618) (size!50540 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551920 () Bool)

(declare-fun e!863934 () ListLongMap!22329)

(declare-fun call!71120 () ListLongMap!22329)

(assert (=> b!1551920 (= e!863934 (+!5001 call!71120 (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551921 () Bool)

(declare-fun e!863935 () Bool)

(declare-fun tp_is_empty!38189 () Bool)

(assert (=> b!1551921 (= e!863935 tp_is_empty!38189)))

(declare-fun b!1551922 () Bool)

(declare-fun call!71124 () ListLongMap!22329)

(assert (=> b!1551922 (= e!863938 call!71124)))

(declare-fun b!1551923 () Bool)

(declare-fun e!863933 () Bool)

(assert (=> b!1551923 (= e!863933 tp_is_empty!38189)))

(declare-fun mapNonEmpty!58999 () Bool)

(declare-fun tp!112002 () Bool)

(assert (=> mapNonEmpty!58999 (= mapRes!58999 (and tp!112002 e!863935))))

(declare-fun mapValue!58999 () ValueCell!18184)

(declare-fun mapRest!58999 () (Array (_ BitVec 32) ValueCell!18184))

(declare-fun mapKey!58999 () (_ BitVec 32))

(assert (=> mapNonEmpty!58999 (= (arr!49990 _values!470) (store mapRest!58999 mapKey!58999 mapValue!58999))))

(declare-fun bm!71118 () Bool)

(assert (=> bm!71118 (= call!71124 call!71120)))

(declare-fun b!1551924 () Bool)

(declare-fun res!1062639 () Bool)

(assert (=> b!1551924 (=> (not res!1062639) (not e!863939))))

(declare-datatypes ((List!36198 0))(
  ( (Nil!36195) (Cons!36194 (h!37639 (_ BitVec 64)) (t!50912 List!36198)) )
))
(declare-fun arrayNoDuplicates!0 (array!103582 (_ BitVec 32) List!36198) Bool)

(assert (=> b!1551924 (= res!1062639 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36195))))

(declare-fun b!1551925 () Bool)

(assert (=> b!1551925 (= e!863940 call!71124)))

(declare-fun res!1062642 () Bool)

(assert (=> start!132286 (=> (not res!1062642) (not e!863939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132286 (= res!1062642 (validMask!0 mask!926))))

(assert (=> start!132286 e!863939))

(declare-fun array_inv!38861 (array!103582) Bool)

(assert (=> start!132286 (array_inv!38861 _keys!618)))

(assert (=> start!132286 tp_is_empty!38189))

(assert (=> start!132286 true))

(assert (=> start!132286 tp!112003))

(declare-fun e!863936 () Bool)

(declare-fun array_inv!38862 (array!103584) Bool)

(assert (=> start!132286 (and (array_inv!38862 _values!470) e!863936)))

(declare-fun bm!71119 () Bool)

(declare-fun call!71121 () ListLongMap!22329)

(assert (=> bm!71119 (= call!71121 call!71122)))

(declare-fun b!1551926 () Bool)

(declare-fun Unit!51684 () Unit!51682)

(assert (=> b!1551926 (= e!863937 Unit!51684)))

(declare-fun b!1551927 () Bool)

(assert (=> b!1551927 (= e!863934 e!863940)))

(declare-fun c!142868 () Bool)

(assert (=> b!1551927 (= c!142868 (and (not lt!668975) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551928 () Bool)

(declare-fun e!863941 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551928 (= e!863941 (validKeyInArray!0 (select (arr!49989 _keys!618) from!762)))))

(declare-fun bm!71120 () Bool)

(declare-fun c!142869 () Bool)

(assert (=> bm!71120 (= call!71120 (+!5001 (ite c!142869 call!71123 (ite c!142868 call!71122 call!71121)) (ite (or c!142869 c!142868) (tuple2!24721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71121 () Bool)

(assert (=> bm!71121 (= call!71123 (getCurrentListMapNoExtraKeys!6627 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551929 () Bool)

(assert (=> b!1551929 (= e!863936 (and e!863933 mapRes!58999))))

(declare-fun condMapEmpty!58999 () Bool)

(declare-fun mapDefault!58999 () ValueCell!18184)

