; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113100 () Bool)

(assert start!113100)

(declare-fun b_free!31151 () Bool)

(declare-fun b_next!31151 () Bool)

(assert (=> start!113100 (= b_free!31151 (not b_next!31151))))

(declare-fun tp!109258 () Bool)

(declare-fun b_and!50209 () Bool)

(assert (=> start!113100 (= tp!109258 b_and!50209)))

(declare-fun b!1340763 () Bool)

(declare-fun res!889441 () Bool)

(declare-fun e!763612 () Bool)

(assert (=> b!1340763 (=> (not res!889441) (not e!763612))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91154 0))(
  ( (array!91155 (arr!44033 (Array (_ BitVec 32) (_ BitVec 64))) (size!44583 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91154)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340763 (= res!889441 (not (= (select (arr!44033 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340764 () Bool)

(declare-fun res!889437 () Bool)

(assert (=> b!1340764 (=> (not res!889437) (not e!763612))))

(declare-datatypes ((List!31170 0))(
  ( (Nil!31167) (Cons!31166 (h!32375 (_ BitVec 64)) (t!45532 List!31170)) )
))
(declare-fun arrayNoDuplicates!0 (array!91154 (_ BitVec 32) List!31170) Bool)

(assert (=> b!1340764 (= res!889437 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31167))))

(declare-fun b!1340766 () Bool)

(declare-fun res!889443 () Bool)

(assert (=> b!1340766 (=> (not res!889443) (not e!763612))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54637 0))(
  ( (V!54638 (val!18650 Int)) )
))
(declare-datatypes ((ValueCell!17677 0))(
  ( (ValueCellFull!17677 (v!21298 V!54637)) (EmptyCell!17677) )
))
(declare-datatypes ((array!91156 0))(
  ( (array!91157 (arr!44034 (Array (_ BitVec 32) ValueCell!17677)) (size!44584 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91156)

(assert (=> b!1340766 (= res!889443 (and (= (size!44584 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44583 _keys!1571) (size!44584 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340767 () Bool)

(declare-fun res!889436 () Bool)

(assert (=> b!1340767 (=> (not res!889436) (not e!763612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340767 (= res!889436 (validKeyInArray!0 (select (arr!44033 _keys!1571) from!1960)))))

(declare-fun b!1340768 () Bool)

(declare-fun res!889442 () Bool)

(assert (=> b!1340768 (=> (not res!889442) (not e!763612))))

(assert (=> b!1340768 (= res!889442 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340769 () Bool)

(assert (=> b!1340769 (= e!763612 (not true))))

(declare-datatypes ((tuple2!24008 0))(
  ( (tuple2!24009 (_1!12015 (_ BitVec 64)) (_2!12015 V!54637)) )
))
(declare-datatypes ((List!31171 0))(
  ( (Nil!31168) (Cons!31167 (h!32376 tuple2!24008) (t!45533 List!31171)) )
))
(declare-datatypes ((ListLongMap!21665 0))(
  ( (ListLongMap!21666 (toList!10848 List!31171)) )
))
(declare-fun lt!594038 () ListLongMap!21665)

(declare-fun contains!9024 (ListLongMap!21665 (_ BitVec 64)) Bool)

(assert (=> b!1340769 (contains!9024 lt!594038 k!1142)))

(declare-datatypes ((Unit!44003 0))(
  ( (Unit!44004) )
))
(declare-fun lt!594039 () Unit!44003)

(declare-fun zeroValue!1245 () V!54637)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!332 ((_ BitVec 64) (_ BitVec 64) V!54637 ListLongMap!21665) Unit!44003)

(assert (=> b!1340769 (= lt!594039 (lemmaInListMapAfterAddingDiffThenInBefore!332 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594038))))

(declare-fun minValue!1245 () V!54637)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4763 (ListLongMap!21665 tuple2!24008) ListLongMap!21665)

(declare-fun getCurrentListMapNoExtraKeys!6405 (array!91154 array!91156 (_ BitVec 32) (_ BitVec 32) V!54637 V!54637 (_ BitVec 32) Int) ListLongMap!21665)

(declare-fun get!22218 (ValueCell!17677 V!54637) V!54637)

(declare-fun dynLambda!3702 (Int (_ BitVec 64)) V!54637)

(assert (=> b!1340769 (= lt!594038 (+!4763 (getCurrentListMapNoExtraKeys!6405 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24009 (select (arr!44033 _keys!1571) from!1960) (get!22218 (select (arr!44034 _values!1303) from!1960) (dynLambda!3702 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!57433 () Bool)

(declare-fun mapRes!57433 () Bool)

(assert (=> mapIsEmpty!57433 mapRes!57433))

(declare-fun b!1340770 () Bool)

(declare-fun res!889438 () Bool)

(assert (=> b!1340770 (=> (not res!889438) (not e!763612))))

(assert (=> b!1340770 (= res!889438 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44583 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340771 () Bool)

(declare-fun e!763611 () Bool)

(declare-fun tp_is_empty!37151 () Bool)

(assert (=> b!1340771 (= e!763611 tp_is_empty!37151)))

(declare-fun b!1340772 () Bool)

(declare-fun e!763613 () Bool)

(assert (=> b!1340772 (= e!763613 (and e!763611 mapRes!57433))))

(declare-fun condMapEmpty!57433 () Bool)

(declare-fun mapDefault!57433 () ValueCell!17677)

