; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113166 () Bool)

(assert start!113166)

(declare-fun b_free!31217 () Bool)

(declare-fun b_next!31217 () Bool)

(assert (=> start!113166 (= b_free!31217 (not b_next!31217))))

(declare-fun tp!109456 () Bool)

(declare-fun b_and!50341 () Bool)

(assert (=> start!113166 (= tp!109456 b_and!50341)))

(declare-fun b!1342017 () Bool)

(declare-fun res!890334 () Bool)

(declare-fun e!764105 () Bool)

(assert (=> b!1342017 (=> (not res!890334) (not e!764105))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91286 0))(
  ( (array!91287 (arr!44099 (Array (_ BitVec 32) (_ BitVec 64))) (size!44649 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91286)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342017 (= res!890334 (not (= (select (arr!44099 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342018 () Bool)

(declare-fun res!890333 () Bool)

(assert (=> b!1342018 (=> (not res!890333) (not e!764105))))

(declare-datatypes ((V!54725 0))(
  ( (V!54726 (val!18683 Int)) )
))
(declare-fun minValue!1245 () V!54725)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54725)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17710 0))(
  ( (ValueCellFull!17710 (v!21331 V!54725)) (EmptyCell!17710) )
))
(declare-datatypes ((array!91288 0))(
  ( (array!91289 (arr!44100 (Array (_ BitVec 32) ValueCell!17710)) (size!44650 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91288)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24064 0))(
  ( (tuple2!24065 (_1!12043 (_ BitVec 64)) (_2!12043 V!54725)) )
))
(declare-datatypes ((List!31220 0))(
  ( (Nil!31217) (Cons!31216 (h!32425 tuple2!24064) (t!45648 List!31220)) )
))
(declare-datatypes ((ListLongMap!21721 0))(
  ( (ListLongMap!21722 (toList!10876 List!31220)) )
))
(declare-fun contains!9052 (ListLongMap!21721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5840 (array!91286 array!91288 (_ BitVec 32) (_ BitVec 32) V!54725 V!54725 (_ BitVec 32) Int) ListLongMap!21721)

(assert (=> b!1342018 (= res!890333 (contains!9052 (getCurrentListMap!5840 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342020 () Bool)

(declare-fun res!890328 () Bool)

(assert (=> b!1342020 (=> (not res!890328) (not e!764105))))

(assert (=> b!1342020 (= res!890328 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342021 () Bool)

(declare-fun res!890329 () Bool)

(assert (=> b!1342021 (=> (not res!890329) (not e!764105))))

(assert (=> b!1342021 (= res!890329 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44649 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57532 () Bool)

(declare-fun mapRes!57532 () Bool)

(assert (=> mapIsEmpty!57532 mapRes!57532))

(declare-fun b!1342022 () Bool)

(declare-fun res!890332 () Bool)

(assert (=> b!1342022 (=> (not res!890332) (not e!764105))))

(declare-datatypes ((List!31221 0))(
  ( (Nil!31218) (Cons!31217 (h!32426 (_ BitVec 64)) (t!45649 List!31221)) )
))
(declare-fun arrayNoDuplicates!0 (array!91286 (_ BitVec 32) List!31221) Bool)

(assert (=> b!1342022 (= res!890332 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31218))))

(declare-fun b!1342023 () Bool)

(declare-fun e!764108 () Bool)

(declare-fun tp_is_empty!37217 () Bool)

(assert (=> b!1342023 (= e!764108 tp_is_empty!37217)))

(declare-fun b!1342024 () Bool)

(declare-fun res!890330 () Bool)

(assert (=> b!1342024 (=> (not res!890330) (not e!764105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91286 (_ BitVec 32)) Bool)

(assert (=> b!1342024 (= res!890330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342025 () Bool)

(assert (=> b!1342025 (= e!764105 (not true))))

(declare-fun lt!594316 () ListLongMap!21721)

(assert (=> b!1342025 (contains!9052 lt!594316 k!1142)))

(declare-fun lt!594315 () V!54725)

(declare-datatypes ((Unit!44053 0))(
  ( (Unit!44054) )
))
(declare-fun lt!594317 () Unit!44053)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!357 ((_ BitVec 64) (_ BitVec 64) V!54725 ListLongMap!21721) Unit!44053)

(assert (=> b!1342025 (= lt!594317 (lemmaInListMapAfterAddingDiffThenInBefore!357 k!1142 (select (arr!44099 _keys!1571) from!1960) lt!594315 lt!594316))))

(declare-fun lt!594314 () ListLongMap!21721)

(assert (=> b!1342025 (contains!9052 lt!594314 k!1142)))

(declare-fun lt!594318 () Unit!44053)

(assert (=> b!1342025 (= lt!594318 (lemmaInListMapAfterAddingDiffThenInBefore!357 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594314))))

(declare-fun +!4788 (ListLongMap!21721 tuple2!24064) ListLongMap!21721)

(assert (=> b!1342025 (= lt!594314 (+!4788 lt!594316 (tuple2!24065 (select (arr!44099 _keys!1571) from!1960) lt!594315)))))

(declare-fun get!22265 (ValueCell!17710 V!54725) V!54725)

(declare-fun dynLambda!3727 (Int (_ BitVec 64)) V!54725)

(assert (=> b!1342025 (= lt!594315 (get!22265 (select (arr!44100 _values!1303) from!1960) (dynLambda!3727 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6430 (array!91286 array!91288 (_ BitVec 32) (_ BitVec 32) V!54725 V!54725 (_ BitVec 32) Int) ListLongMap!21721)

(assert (=> b!1342025 (= lt!594316 (getCurrentListMapNoExtraKeys!6430 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342026 () Bool)

(declare-fun e!764106 () Bool)

(assert (=> b!1342026 (= e!764106 tp_is_empty!37217)))

(declare-fun b!1342027 () Bool)

(declare-fun res!890327 () Bool)

(assert (=> b!1342027 (=> (not res!890327) (not e!764105))))

(assert (=> b!1342027 (= res!890327 (and (= (size!44650 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44649 _keys!1571) (size!44650 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890326 () Bool)

(assert (=> start!113166 (=> (not res!890326) (not e!764105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113166 (= res!890326 (validMask!0 mask!1977))))

(assert (=> start!113166 e!764105))

(assert (=> start!113166 tp_is_empty!37217))

(assert (=> start!113166 true))

(declare-fun array_inv!33243 (array!91286) Bool)

(assert (=> start!113166 (array_inv!33243 _keys!1571)))

(declare-fun e!764104 () Bool)

(declare-fun array_inv!33244 (array!91288) Bool)

(assert (=> start!113166 (and (array_inv!33244 _values!1303) e!764104)))

(assert (=> start!113166 tp!109456))

(declare-fun b!1342019 () Bool)

(assert (=> b!1342019 (= e!764104 (and e!764108 mapRes!57532))))

(declare-fun condMapEmpty!57532 () Bool)

(declare-fun mapDefault!57532 () ValueCell!17710)

