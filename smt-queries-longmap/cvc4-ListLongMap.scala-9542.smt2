; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113118 () Bool)

(assert start!113118)

(declare-fun b_free!31169 () Bool)

(declare-fun b_next!31169 () Bool)

(assert (=> start!113118 (= b_free!31169 (not b_next!31169))))

(declare-fun tp!109311 () Bool)

(declare-fun b_and!50245 () Bool)

(assert (=> start!113118 (= tp!109311 b_and!50245)))

(declare-fun b!1341105 () Bool)

(declare-fun res!889684 () Bool)

(declare-fun e!763746 () Bool)

(assert (=> b!1341105 (=> (not res!889684) (not e!763746))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341105 (= res!889684 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341106 () Bool)

(declare-fun e!763747 () Bool)

(declare-fun tp_is_empty!37169 () Bool)

(assert (=> b!1341106 (= e!763747 tp_is_empty!37169)))

(declare-fun b!1341107 () Bool)

(declare-fun res!889681 () Bool)

(assert (=> b!1341107 (=> (not res!889681) (not e!763746))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91190 0))(
  ( (array!91191 (arr!44051 (Array (_ BitVec 32) (_ BitVec 64))) (size!44601 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91190)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341107 (= res!889681 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44601 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341108 () Bool)

(declare-fun e!763744 () Bool)

(assert (=> b!1341108 (= e!763744 tp_is_empty!37169)))

(declare-fun mapNonEmpty!57460 () Bool)

(declare-fun mapRes!57460 () Bool)

(declare-fun tp!109312 () Bool)

(assert (=> mapNonEmpty!57460 (= mapRes!57460 (and tp!109312 e!763744))))

(declare-fun mapKey!57460 () (_ BitVec 32))

(declare-datatypes ((V!54661 0))(
  ( (V!54662 (val!18659 Int)) )
))
(declare-datatypes ((ValueCell!17686 0))(
  ( (ValueCellFull!17686 (v!21307 V!54661)) (EmptyCell!17686) )
))
(declare-fun mapRest!57460 () (Array (_ BitVec 32) ValueCell!17686))

(declare-fun mapValue!57460 () ValueCell!17686)

(declare-datatypes ((array!91192 0))(
  ( (array!91193 (arr!44052 (Array (_ BitVec 32) ValueCell!17686)) (size!44602 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91192)

(assert (=> mapNonEmpty!57460 (= (arr!44052 _values!1303) (store mapRest!57460 mapKey!57460 mapValue!57460))))

(declare-fun b!1341110 () Bool)

(assert (=> b!1341110 (= e!763746 (not true))))

(declare-datatypes ((tuple2!24022 0))(
  ( (tuple2!24023 (_1!12022 (_ BitVec 64)) (_2!12022 V!54661)) )
))
(declare-datatypes ((List!31184 0))(
  ( (Nil!31181) (Cons!31180 (h!32389 tuple2!24022) (t!45564 List!31184)) )
))
(declare-datatypes ((ListLongMap!21679 0))(
  ( (ListLongMap!21680 (toList!10855 List!31184)) )
))
(declare-fun lt!594092 () ListLongMap!21679)

(declare-fun contains!9031 (ListLongMap!21679 (_ BitVec 64)) Bool)

(assert (=> b!1341110 (contains!9031 lt!594092 k!1142)))

(declare-datatypes ((Unit!44015 0))(
  ( (Unit!44016) )
))
(declare-fun lt!594093 () Unit!44015)

(declare-fun zeroValue!1245 () V!54661)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!338 ((_ BitVec 64) (_ BitVec 64) V!54661 ListLongMap!21679) Unit!44015)

(assert (=> b!1341110 (= lt!594093 (lemmaInListMapAfterAddingDiffThenInBefore!338 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594092))))

(declare-fun minValue!1245 () V!54661)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun +!4769 (ListLongMap!21679 tuple2!24022) ListLongMap!21679)

(declare-fun getCurrentListMapNoExtraKeys!6411 (array!91190 array!91192 (_ BitVec 32) (_ BitVec 32) V!54661 V!54661 (_ BitVec 32) Int) ListLongMap!21679)

(declare-fun get!22230 (ValueCell!17686 V!54661) V!54661)

(declare-fun dynLambda!3708 (Int (_ BitVec 64)) V!54661)

(assert (=> b!1341110 (= lt!594092 (+!4769 (getCurrentListMapNoExtraKeys!6411 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24023 (select (arr!44051 _keys!1571) from!1960) (get!22230 (select (arr!44052 _values!1303) from!1960) (dynLambda!3708 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341111 () Bool)

(declare-fun res!889686 () Bool)

(assert (=> b!1341111 (=> (not res!889686) (not e!763746))))

(assert (=> b!1341111 (= res!889686 (and (= (size!44602 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44601 _keys!1571) (size!44602 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341112 () Bool)

(declare-fun e!763748 () Bool)

(assert (=> b!1341112 (= e!763748 (and e!763747 mapRes!57460))))

(declare-fun condMapEmpty!57460 () Bool)

(declare-fun mapDefault!57460 () ValueCell!17686)

