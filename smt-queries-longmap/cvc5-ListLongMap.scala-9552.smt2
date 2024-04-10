; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113174 () Bool)

(assert start!113174)

(declare-fun b_free!31225 () Bool)

(declare-fun b_next!31225 () Bool)

(assert (=> start!113174 (= b_free!31225 (not b_next!31225))))

(declare-fun tp!109480 () Bool)

(declare-fun b_and!50357 () Bool)

(assert (=> start!113174 (= tp!109480 b_and!50357)))

(declare-fun b!1342169 () Bool)

(declare-fun res!890436 () Bool)

(declare-fun e!764168 () Bool)

(assert (=> b!1342169 (=> (not res!890436) (not e!764168))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342169 (= res!890436 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342170 () Bool)

(assert (=> b!1342170 (= e!764168 (not true))))

(declare-datatypes ((V!54737 0))(
  ( (V!54738 (val!18687 Int)) )
))
(declare-datatypes ((tuple2!24070 0))(
  ( (tuple2!24071 (_1!12046 (_ BitVec 64)) (_2!12046 V!54737)) )
))
(declare-datatypes ((List!31226 0))(
  ( (Nil!31223) (Cons!31222 (h!32431 tuple2!24070) (t!45662 List!31226)) )
))
(declare-datatypes ((ListLongMap!21727 0))(
  ( (ListLongMap!21728 (toList!10879 List!31226)) )
))
(declare-fun lt!594374 () ListLongMap!21727)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9055 (ListLongMap!21727 (_ BitVec 64)) Bool)

(assert (=> b!1342170 (contains!9055 lt!594374 k!1142)))

(declare-datatypes ((array!91300 0))(
  ( (array!91301 (arr!44106 (Array (_ BitVec 32) (_ BitVec 64))) (size!44656 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91300)

(declare-fun lt!594377 () V!54737)

(declare-datatypes ((Unit!44057 0))(
  ( (Unit!44058) )
))
(declare-fun lt!594378 () Unit!44057)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!359 ((_ BitVec 64) (_ BitVec 64) V!54737 ListLongMap!21727) Unit!44057)

(assert (=> b!1342170 (= lt!594378 (lemmaInListMapAfterAddingDiffThenInBefore!359 k!1142 (select (arr!44106 _keys!1571) from!1960) lt!594377 lt!594374))))

(declare-fun lt!594376 () ListLongMap!21727)

(assert (=> b!1342170 (contains!9055 lt!594376 k!1142)))

(declare-fun lt!594375 () Unit!44057)

(declare-fun zeroValue!1245 () V!54737)

(assert (=> b!1342170 (= lt!594375 (lemmaInListMapAfterAddingDiffThenInBefore!359 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594376))))

(declare-fun +!4790 (ListLongMap!21727 tuple2!24070) ListLongMap!21727)

(assert (=> b!1342170 (= lt!594376 (+!4790 lt!594374 (tuple2!24071 (select (arr!44106 _keys!1571) from!1960) lt!594377)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17714 0))(
  ( (ValueCellFull!17714 (v!21335 V!54737)) (EmptyCell!17714) )
))
(declare-datatypes ((array!91302 0))(
  ( (array!91303 (arr!44107 (Array (_ BitVec 32) ValueCell!17714)) (size!44657 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91302)

(declare-fun get!22271 (ValueCell!17714 V!54737) V!54737)

(declare-fun dynLambda!3729 (Int (_ BitVec 64)) V!54737)

(assert (=> b!1342170 (= lt!594377 (get!22271 (select (arr!44107 _values!1303) from!1960) (dynLambda!3729 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54737)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6432 (array!91300 array!91302 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21727)

(assert (=> b!1342170 (= lt!594374 (getCurrentListMapNoExtraKeys!6432 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342171 () Bool)

(declare-fun res!890439 () Bool)

(assert (=> b!1342171 (=> (not res!890439) (not e!764168))))

(assert (=> b!1342171 (= res!890439 (not (= (select (arr!44106 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342172 () Bool)

(declare-fun res!890442 () Bool)

(assert (=> b!1342172 (=> (not res!890442) (not e!764168))))

(assert (=> b!1342172 (= res!890442 (and (= (size!44657 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44656 _keys!1571) (size!44657 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342173 () Bool)

(declare-fun res!890437 () Bool)

(assert (=> b!1342173 (=> (not res!890437) (not e!764168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91300 (_ BitVec 32)) Bool)

(assert (=> b!1342173 (= res!890437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342174 () Bool)

(declare-fun res!890441 () Bool)

(assert (=> b!1342174 (=> (not res!890441) (not e!764168))))

(declare-fun getCurrentListMap!5843 (array!91300 array!91302 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21727)

(assert (=> b!1342174 (= res!890441 (contains!9055 (getCurrentListMap!5843 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57544 () Bool)

(declare-fun mapRes!57544 () Bool)

(assert (=> mapIsEmpty!57544 mapRes!57544))

(declare-fun b!1342175 () Bool)

(declare-fun res!890434 () Bool)

(assert (=> b!1342175 (=> (not res!890434) (not e!764168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342175 (= res!890434 (validKeyInArray!0 (select (arr!44106 _keys!1571) from!1960)))))

(declare-fun b!1342176 () Bool)

(declare-fun e!764166 () Bool)

(declare-fun tp_is_empty!37225 () Bool)

(assert (=> b!1342176 (= e!764166 tp_is_empty!37225)))

(declare-fun b!1342177 () Bool)

(declare-fun e!764165 () Bool)

(assert (=> b!1342177 (= e!764165 tp_is_empty!37225)))

(declare-fun mapNonEmpty!57544 () Bool)

(declare-fun tp!109479 () Bool)

(assert (=> mapNonEmpty!57544 (= mapRes!57544 (and tp!109479 e!764165))))

(declare-fun mapValue!57544 () ValueCell!17714)

(declare-fun mapRest!57544 () (Array (_ BitVec 32) ValueCell!17714))

(declare-fun mapKey!57544 () (_ BitVec 32))

(assert (=> mapNonEmpty!57544 (= (arr!44107 _values!1303) (store mapRest!57544 mapKey!57544 mapValue!57544))))

(declare-fun b!1342178 () Bool)

(declare-fun res!890435 () Bool)

(assert (=> b!1342178 (=> (not res!890435) (not e!764168))))

(declare-datatypes ((List!31227 0))(
  ( (Nil!31224) (Cons!31223 (h!32432 (_ BitVec 64)) (t!45663 List!31227)) )
))
(declare-fun arrayNoDuplicates!0 (array!91300 (_ BitVec 32) List!31227) Bool)

(assert (=> b!1342178 (= res!890435 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31224))))

(declare-fun b!1342179 () Bool)

(declare-fun res!890438 () Bool)

(assert (=> b!1342179 (=> (not res!890438) (not e!764168))))

(assert (=> b!1342179 (= res!890438 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44656 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342180 () Bool)

(declare-fun e!764167 () Bool)

(assert (=> b!1342180 (= e!764167 (and e!764166 mapRes!57544))))

(declare-fun condMapEmpty!57544 () Bool)

(declare-fun mapDefault!57544 () ValueCell!17714)

