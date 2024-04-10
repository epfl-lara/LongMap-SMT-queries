; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132214 () Bool)

(assert start!132214)

(declare-fun b_free!31889 () Bool)

(declare-fun b_next!31889 () Bool)

(assert (=> start!132214 (= b_free!31889 (not b_next!31889))))

(declare-fun tp!111925 () Bool)

(declare-fun b_and!51319 () Bool)

(assert (=> start!132214 (= tp!111925 b_and!51319)))

(declare-fun mapNonEmpty!58957 () Bool)

(declare-fun mapRes!58957 () Bool)

(declare-fun tp!111924 () Bool)

(declare-fun e!863457 () Bool)

(assert (=> mapNonEmpty!58957 (= mapRes!58957 (and tp!111924 e!863457))))

(declare-datatypes ((V!59329 0))(
  ( (V!59330 (val!19160 Int)) )
))
(declare-datatypes ((ValueCell!18172 0))(
  ( (ValueCellFull!18172 (v!21963 V!59329)) (EmptyCell!18172) )
))
(declare-fun mapRest!58957 () (Array (_ BitVec 32) ValueCell!18172))

(declare-fun mapValue!58957 () ValueCell!18172)

(declare-datatypes ((array!103530 0))(
  ( (array!103531 (arr!49965 (Array (_ BitVec 32) ValueCell!18172)) (size!50515 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103530)

(declare-fun mapKey!58957 () (_ BitVec 32))

(assert (=> mapNonEmpty!58957 (= (arr!49965 _values!470) (store mapRest!58957 mapKey!58957 mapValue!58957))))

(declare-fun b!1551110 () Bool)

(declare-fun res!1062289 () Bool)

(declare-fun e!863454 () Bool)

(assert (=> b!1551110 (=> (not res!1062289) (not e!863454))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103532 0))(
  ( (array!103533 (arr!49966 (Array (_ BitVec 32) (_ BitVec 64))) (size!50516 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103532)

(assert (=> b!1551110 (= res!1062289 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50516 _keys!618))))))

(declare-fun res!1062288 () Bool)

(assert (=> start!132214 (=> (not res!1062288) (not e!863454))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132214 (= res!1062288 (validMask!0 mask!926))))

(assert (=> start!132214 e!863454))

(declare-fun array_inv!38847 (array!103532) Bool)

(assert (=> start!132214 (array_inv!38847 _keys!618)))

(declare-fun tp_is_empty!38165 () Bool)

(assert (=> start!132214 tp_is_empty!38165))

(assert (=> start!132214 true))

(assert (=> start!132214 tp!111925))

(declare-fun e!863453 () Bool)

(declare-fun array_inv!38848 (array!103530) Bool)

(assert (=> start!132214 (and (array_inv!38848 _values!470) e!863453)))

(declare-fun b!1551111 () Bool)

(declare-fun res!1062283 () Bool)

(assert (=> b!1551111 (=> (not res!1062283) (not e!863454))))

(declare-datatypes ((List!36176 0))(
  ( (Nil!36173) (Cons!36172 (h!37617 (_ BitVec 64)) (t!50886 List!36176)) )
))
(declare-fun arrayNoDuplicates!0 (array!103532 (_ BitVec 32) List!36176) Bool)

(assert (=> b!1551111 (= res!1062283 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36173))))

(declare-fun b!1551112 () Bool)

(declare-datatypes ((tuple2!24698 0))(
  ( (tuple2!24699 (_1!12360 (_ BitVec 64)) (_2!12360 V!59329)) )
))
(declare-datatypes ((List!36177 0))(
  ( (Nil!36174) (Cons!36173 (h!37618 tuple2!24698) (t!50887 List!36177)) )
))
(declare-datatypes ((ListLongMap!22307 0))(
  ( (ListLongMap!22308 (toList!11169 List!36177)) )
))
(declare-fun e!863456 () ListLongMap!22307)

(declare-fun call!70923 () ListLongMap!22307)

(assert (=> b!1551112 (= e!863456 call!70923)))

(declare-fun b!1551113 () Bool)

(declare-fun e!863452 () Bool)

(assert (=> b!1551113 (= e!863452 (not true))))

(declare-fun minValue!436 () V!59329)

(declare-fun lt!668526 () ListLongMap!22307)

(declare-fun apply!1095 (ListLongMap!22307 (_ BitVec 64)) V!59329)

(declare-fun +!4990 (ListLongMap!22307 tuple2!24698) ListLongMap!22307)

(assert (=> b!1551113 (= (apply!1095 (+!4990 lt!668526 (tuple2!24699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49966 _keys!618) from!762)) (apply!1095 lt!668526 (select (arr!49966 _keys!618) from!762)))))

(declare-datatypes ((Unit!51662 0))(
  ( (Unit!51663) )
))
(declare-fun lt!668525 () Unit!51662)

(declare-fun addApplyDifferent!633 (ListLongMap!22307 (_ BitVec 64) V!59329 (_ BitVec 64)) Unit!51662)

(assert (=> b!1551113 (= lt!668525 (addApplyDifferent!633 lt!668526 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49966 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59329)

(declare-fun contains!10111 (ListLongMap!22307 (_ BitVec 64)) Bool)

(assert (=> b!1551113 (contains!10111 (+!4990 lt!668526 (tuple2!24699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49966 _keys!618) from!762))))

(declare-fun lt!668523 () Unit!51662)

(declare-fun addStillContains!1291 (ListLongMap!22307 (_ BitVec 64) V!59329 (_ BitVec 64)) Unit!51662)

(assert (=> b!1551113 (= lt!668523 (addStillContains!1291 lt!668526 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49966 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6617 (array!103532 array!103530 (_ BitVec 32) (_ BitVec 32) V!59329 V!59329 (_ BitVec 32) Int) ListLongMap!22307)

(assert (=> b!1551113 (= lt!668526 (getCurrentListMapNoExtraKeys!6617 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551114 () Bool)

(declare-fun e!863458 () Bool)

(assert (=> b!1551114 (= e!863453 (and e!863458 mapRes!58957))))

(declare-fun condMapEmpty!58957 () Bool)

(declare-fun mapDefault!58957 () ValueCell!18172)

