; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113258 () Bool)

(assert start!113258)

(declare-fun b_free!31309 () Bool)

(declare-fun b_next!31309 () Bool)

(assert (=> start!113258 (= b_free!31309 (not b_next!31309))))

(declare-fun tp!109731 () Bool)

(declare-fun b_and!50525 () Bool)

(assert (=> start!113258 (= tp!109731 b_and!50525)))

(declare-fun b!1343765 () Bool)

(declare-fun res!891573 () Bool)

(declare-fun e!764794 () Bool)

(assert (=> b!1343765 (=> (not res!891573) (not e!764794))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343765 (= res!891573 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343766 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343766 (= e!764794 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54849 0))(
  ( (V!54850 (val!18729 Int)) )
))
(declare-datatypes ((tuple2!24130 0))(
  ( (tuple2!24131 (_1!12076 (_ BitVec 64)) (_2!12076 V!54849)) )
))
(declare-datatypes ((List!31286 0))(
  ( (Nil!31283) (Cons!31282 (h!32491 tuple2!24130) (t!45806 List!31286)) )
))
(declare-datatypes ((ListLongMap!21787 0))(
  ( (ListLongMap!21788 (toList!10909 List!31286)) )
))
(declare-fun lt!595078 () ListLongMap!21787)

(declare-fun zeroValue!1245 () V!54849)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9085 (ListLongMap!21787 (_ BitVec 64)) Bool)

(declare-fun +!4816 (ListLongMap!21787 tuple2!24130) ListLongMap!21787)

(assert (=> b!1343766 (contains!9085 (+!4816 lt!595078 (tuple2!24131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44109 0))(
  ( (Unit!44110) )
))
(declare-fun lt!595081 () Unit!44109)

(declare-fun addStillContains!1209 (ListLongMap!21787 (_ BitVec 64) V!54849 (_ BitVec 64)) Unit!44109)

(assert (=> b!1343766 (= lt!595081 (addStillContains!1209 lt!595078 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343766 (contains!9085 lt!595078 k!1142)))

(declare-fun lt!595082 () V!54849)

(declare-datatypes ((array!91462 0))(
  ( (array!91463 (arr!44187 (Array (_ BitVec 32) (_ BitVec 64))) (size!44737 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91462)

(declare-fun lt!595079 () Unit!44109)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!385 ((_ BitVec 64) (_ BitVec 64) V!54849 ListLongMap!21787) Unit!44109)

(assert (=> b!1343766 (= lt!595079 (lemmaInListMapAfterAddingDiffThenInBefore!385 k!1142 (select (arr!44187 _keys!1571) from!1960) lt!595082 lt!595078))))

(declare-fun lt!595080 () ListLongMap!21787)

(assert (=> b!1343766 (contains!9085 lt!595080 k!1142)))

(declare-fun lt!595083 () Unit!44109)

(assert (=> b!1343766 (= lt!595083 (lemmaInListMapAfterAddingDiffThenInBefore!385 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595080))))

(assert (=> b!1343766 (= lt!595080 (+!4816 lt!595078 (tuple2!24131 (select (arr!44187 _keys!1571) from!1960) lt!595082)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17756 0))(
  ( (ValueCellFull!17756 (v!21377 V!54849)) (EmptyCell!17756) )
))
(declare-datatypes ((array!91464 0))(
  ( (array!91465 (arr!44188 (Array (_ BitVec 32) ValueCell!17756)) (size!44738 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91464)

(declare-fun get!22325 (ValueCell!17756 V!54849) V!54849)

(declare-fun dynLambda!3755 (Int (_ BitVec 64)) V!54849)

(assert (=> b!1343766 (= lt!595082 (get!22325 (select (arr!44188 _values!1303) from!1960) (dynLambda!3755 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54849)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6458 (array!91462 array!91464 (_ BitVec 32) (_ BitVec 32) V!54849 V!54849 (_ BitVec 32) Int) ListLongMap!21787)

(assert (=> b!1343766 (= lt!595078 (getCurrentListMapNoExtraKeys!6458 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343767 () Bool)

(declare-fun res!891570 () Bool)

(assert (=> b!1343767 (=> (not res!891570) (not e!764794))))

(assert (=> b!1343767 (= res!891570 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44737 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57670 () Bool)

(declare-fun mapRes!57670 () Bool)

(declare-fun tp!109732 () Bool)

(declare-fun e!764797 () Bool)

(assert (=> mapNonEmpty!57670 (= mapRes!57670 (and tp!109732 e!764797))))

(declare-fun mapRest!57670 () (Array (_ BitVec 32) ValueCell!17756))

(declare-fun mapKey!57670 () (_ BitVec 32))

(declare-fun mapValue!57670 () ValueCell!17756)

(assert (=> mapNonEmpty!57670 (= (arr!44188 _values!1303) (store mapRest!57670 mapKey!57670 mapValue!57670))))

(declare-fun b!1343768 () Bool)

(declare-fun res!891571 () Bool)

(assert (=> b!1343768 (=> (not res!891571) (not e!764794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91462 (_ BitVec 32)) Bool)

(assert (=> b!1343768 (= res!891571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57670 () Bool)

(assert (=> mapIsEmpty!57670 mapRes!57670))

(declare-fun b!1343769 () Bool)

(declare-fun res!891575 () Bool)

(assert (=> b!1343769 (=> (not res!891575) (not e!764794))))

(assert (=> b!1343769 (= res!891575 (and (= (size!44738 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44737 _keys!1571) (size!44738 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343770 () Bool)

(declare-fun tp_is_empty!37309 () Bool)

(assert (=> b!1343770 (= e!764797 tp_is_empty!37309)))

(declare-fun b!1343771 () Bool)

(declare-fun e!764796 () Bool)

(declare-fun e!764798 () Bool)

(assert (=> b!1343771 (= e!764796 (and e!764798 mapRes!57670))))

(declare-fun condMapEmpty!57670 () Bool)

(declare-fun mapDefault!57670 () ValueCell!17756)

