; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132282 () Bool)

(assert start!132282)

(declare-fun b_free!31909 () Bool)

(declare-fun b_next!31909 () Bool)

(assert (=> start!132282 (= b_free!31909 (not b_next!31909))))

(declare-fun tp!111991 () Bool)

(declare-fun b_and!51347 () Bool)

(assert (=> start!132282 (= tp!111991 b_and!51347)))

(declare-fun b!1551815 () Bool)

(declare-datatypes ((Unit!51676 0))(
  ( (Unit!51677) )
))
(declare-fun e!863880 () Unit!51676)

(declare-fun Unit!51678 () Unit!51676)

(assert (=> b!1551815 (= e!863880 Unit!51678)))

(declare-datatypes ((array!103574 0))(
  ( (array!103575 (arr!49985 (Array (_ BitVec 32) (_ BitVec 64))) (size!50535 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103574)

(declare-datatypes ((V!59357 0))(
  ( (V!59358 (val!19170 Int)) )
))
(declare-fun zeroValue!436 () V!59357)

(declare-fun bm!71087 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18182 0))(
  ( (ValueCellFull!18182 (v!21975 V!59357)) (EmptyCell!18182) )
))
(declare-datatypes ((array!103576 0))(
  ( (array!103577 (arr!49986 (Array (_ BitVec 32) ValueCell!18182)) (size!50536 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103576)

(declare-fun minValue!436 () V!59357)

(declare-datatypes ((tuple2!24716 0))(
  ( (tuple2!24717 (_1!12369 (_ BitVec 64)) (_2!12369 V!59357)) )
))
(declare-datatypes ((List!36193 0))(
  ( (Nil!36190) (Cons!36189 (h!37634 tuple2!24716) (t!50907 List!36193)) )
))
(declare-datatypes ((ListLongMap!22325 0))(
  ( (ListLongMap!22326 (toList!11178 List!36193)) )
))
(declare-fun call!71094 () ListLongMap!22325)

(declare-fun getCurrentListMapNoExtraKeys!6625 (array!103574 array!103576 (_ BitVec 32) (_ BitVec 32) V!59357 V!59357 (_ BitVec 32) Int) ListLongMap!22325)

(assert (=> bm!71087 (= call!71094 (getCurrentListMapNoExtraKeys!6625 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551816 () Bool)

(declare-fun lt!668912 () Unit!51676)

(assert (=> b!1551816 (= e!863880 lt!668912)))

(declare-fun lt!668915 () ListLongMap!22325)

(assert (=> b!1551816 (= lt!668915 (getCurrentListMapNoExtraKeys!6625 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668913 () Unit!51676)

(declare-fun addStillContains!1296 (ListLongMap!22325 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51676)

(assert (=> b!1551816 (= lt!668913 (addStillContains!1296 lt!668915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49985 _keys!618) from!762)))))

(declare-fun lt!668909 () ListLongMap!22325)

(declare-fun +!4999 (ListLongMap!22325 tuple2!24716) ListLongMap!22325)

(assert (=> b!1551816 (= lt!668909 (+!4999 lt!668915 (tuple2!24717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10120 (ListLongMap!22325 (_ BitVec 64)) Bool)

(assert (=> b!1551816 (contains!10120 lt!668909 (select (arr!49985 _keys!618) from!762))))

(declare-fun addApplyDifferent!638 (ListLongMap!22325 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51676)

(assert (=> b!1551816 (= lt!668912 (addApplyDifferent!638 lt!668915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49985 _keys!618) from!762)))))

(declare-fun lt!668907 () V!59357)

(declare-fun apply!1100 (ListLongMap!22325 (_ BitVec 64)) V!59357)

(assert (=> b!1551816 (= lt!668907 (apply!1100 (+!4999 lt!668915 (tuple2!24717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49985 _keys!618) from!762)))))

(declare-fun lt!668911 () V!59357)

(assert (=> b!1551816 (= lt!668911 (apply!1100 lt!668915 (select (arr!49985 _keys!618) from!762)))))

(assert (=> b!1551816 (= lt!668907 lt!668911)))

(declare-fun lt!668914 () Unit!51676)

(assert (=> b!1551816 (= lt!668914 (addApplyDifferent!638 lt!668915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49985 _keys!618) from!762)))))

(assert (=> b!1551816 (= (apply!1100 lt!668909 (select (arr!49985 _keys!618) from!762)) lt!668911)))

(declare-fun b!1551817 () Bool)

(declare-fun e!863879 () Bool)

(assert (=> b!1551817 (= e!863879 false)))

(declare-fun lt!668916 () Unit!51676)

(assert (=> b!1551817 (= lt!668916 e!863880)))

(declare-fun c!142845 () Bool)

(declare-fun e!863876 () Bool)

(assert (=> b!1551817 (= c!142845 e!863876)))

(declare-fun res!1062607 () Bool)

(assert (=> b!1551817 (=> (not res!1062607) (not e!863876))))

(assert (=> b!1551817 (= res!1062607 (bvslt from!762 (size!50535 _keys!618)))))

(declare-fun lt!668910 () ListLongMap!22325)

(declare-fun e!863873 () ListLongMap!22325)

(assert (=> b!1551817 (= lt!668910 e!863873)))

(declare-fun c!142846 () Bool)

(declare-fun lt!668908 () Bool)

(assert (=> b!1551817 (= c!142846 (and (not lt!668908) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551817 (= lt!668908 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551818 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551818 (= e!863876 (validKeyInArray!0 (select (arr!49985 _keys!618) from!762)))))

(declare-fun b!1551819 () Bool)

(declare-fun e!863875 () ListLongMap!22325)

(declare-fun call!71093 () ListLongMap!22325)

(assert (=> b!1551819 (= e!863875 call!71093)))

(declare-fun mapIsEmpty!58993 () Bool)

(declare-fun mapRes!58993 () Bool)

(assert (=> mapIsEmpty!58993 mapRes!58993))

(declare-fun bm!71088 () Bool)

(declare-fun call!71090 () ListLongMap!22325)

(assert (=> bm!71088 (= call!71093 call!71090)))

(declare-fun b!1551820 () Bool)

(assert (=> b!1551820 (= e!863873 (+!4999 call!71090 (tuple2!24717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551821 () Bool)

(declare-fun e!863874 () ListLongMap!22325)

(declare-fun call!71091 () ListLongMap!22325)

(assert (=> b!1551821 (= e!863874 call!71091)))

(declare-fun b!1551822 () Bool)

(declare-fun res!1062602 () Bool)

(assert (=> b!1551822 (=> (not res!1062602) (not e!863879))))

(assert (=> b!1551822 (= res!1062602 (and (= (size!50536 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50535 _keys!618) (size!50536 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551823 () Bool)

(declare-fun e!863877 () Bool)

(declare-fun tp_is_empty!38185 () Bool)

(assert (=> b!1551823 (= e!863877 tp_is_empty!38185)))

(declare-fun bm!71090 () Bool)

(declare-fun call!71092 () ListLongMap!22325)

(assert (=> bm!71090 (= call!71092 call!71094)))

(declare-fun b!1551824 () Bool)

(assert (=> b!1551824 (= e!863874 call!71093)))

(declare-fun b!1551825 () Bool)

(declare-fun res!1062604 () Bool)

(assert (=> b!1551825 (=> (not res!1062604) (not e!863879))))

(declare-datatypes ((List!36194 0))(
  ( (Nil!36191) (Cons!36190 (h!37635 (_ BitVec 64)) (t!50908 List!36194)) )
))
(declare-fun arrayNoDuplicates!0 (array!103574 (_ BitVec 32) List!36194) Bool)

(assert (=> b!1551825 (= res!1062604 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36191))))

(declare-fun bm!71091 () Bool)

(assert (=> bm!71091 (= call!71091 call!71092)))

(declare-fun b!1551826 () Bool)

(declare-fun e!863872 () Bool)

(declare-fun e!863881 () Bool)

(assert (=> b!1551826 (= e!863872 (and e!863881 mapRes!58993))))

(declare-fun condMapEmpty!58993 () Bool)

(declare-fun mapDefault!58993 () ValueCell!18182)

