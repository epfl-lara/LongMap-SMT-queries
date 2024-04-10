; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112360 () Bool)

(assert start!112360)

(declare-fun b_free!30755 () Bool)

(declare-fun b_next!30755 () Bool)

(assert (=> start!112360 (= b_free!30755 (not b_next!30755))))

(declare-fun tp!107901 () Bool)

(declare-fun b_and!49565 () Bool)

(assert (=> start!112360 (= tp!107901 b_and!49565)))

(declare-fun mapNonEmpty!56671 () Bool)

(declare-fun mapRes!56671 () Bool)

(declare-fun tp!107902 () Bool)

(declare-fun e!758866 () Bool)

(assert (=> mapNonEmpty!56671 (= mapRes!56671 (and tp!107902 e!758866))))

(declare-datatypes ((V!53989 0))(
  ( (V!53990 (val!18407 Int)) )
))
(declare-datatypes ((ValueCell!17434 0))(
  ( (ValueCellFull!17434 (v!21044 V!53989)) (EmptyCell!17434) )
))
(declare-datatypes ((array!90210 0))(
  ( (array!90211 (arr!43571 (Array (_ BitVec 32) ValueCell!17434)) (size!44121 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90210)

(declare-fun mapRest!56671 () (Array (_ BitVec 32) ValueCell!17434))

(declare-fun mapKey!56671 () (_ BitVec 32))

(declare-fun mapValue!56671 () ValueCell!17434)

(assert (=> mapNonEmpty!56671 (= (arr!43571 _values!1320) (store mapRest!56671 mapKey!56671 mapValue!56671))))

(declare-fun mapIsEmpty!56671 () Bool)

(assert (=> mapIsEmpty!56671 mapRes!56671))

(declare-fun b!1331907 () Bool)

(declare-fun res!883850 () Bool)

(declare-fun e!758863 () Bool)

(assert (=> b!1331907 (=> (not res!883850) (not e!758863))))

(declare-datatypes ((array!90212 0))(
  ( (array!90213 (arr!43572 (Array (_ BitVec 32) (_ BitVec 64))) (size!44122 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90212)

(declare-datatypes ((List!30864 0))(
  ( (Nil!30861) (Cons!30860 (h!32069 (_ BitVec 64)) (t!45032 List!30864)) )
))
(declare-fun arrayNoDuplicates!0 (array!90212 (_ BitVec 32) List!30864) Bool)

(assert (=> b!1331907 (= res!883850 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30861))))

(declare-fun res!883851 () Bool)

(assert (=> start!112360 (=> (not res!883851) (not e!758863))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112360 (= res!883851 (validMask!0 mask!1998))))

(assert (=> start!112360 e!758863))

(declare-fun e!758864 () Bool)

(declare-fun array_inv!32865 (array!90210) Bool)

(assert (=> start!112360 (and (array_inv!32865 _values!1320) e!758864)))

(assert (=> start!112360 true))

(declare-fun array_inv!32866 (array!90212) Bool)

(assert (=> start!112360 (array_inv!32866 _keys!1590)))

(assert (=> start!112360 tp!107901))

(declare-fun tp_is_empty!36665 () Bool)

(assert (=> start!112360 tp_is_empty!36665))

(declare-fun b!1331908 () Bool)

(declare-fun res!883849 () Bool)

(assert (=> b!1331908 (=> (not res!883849) (not e!758863))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331908 (= res!883849 (validKeyInArray!0 (select (arr!43572 _keys!1590) from!1980)))))

(declare-fun b!1331909 () Bool)

(declare-fun res!883857 () Bool)

(assert (=> b!1331909 (=> (not res!883857) (not e!758863))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331909 (= res!883857 (and (= (size!44121 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44122 _keys!1590) (size!44121 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331910 () Bool)

(declare-fun res!883854 () Bool)

(assert (=> b!1331910 (=> (not res!883854) (not e!758863))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331910 (= res!883854 (not (= (select (arr!43572 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331911 () Bool)

(declare-fun e!758865 () Bool)

(assert (=> b!1331911 (= e!758865 tp_is_empty!36665)))

(declare-fun b!1331912 () Bool)

(assert (=> b!1331912 (= e!758863 (not true))))

(declare-datatypes ((tuple2!23716 0))(
  ( (tuple2!23717 (_1!11869 (_ BitVec 64)) (_2!11869 V!53989)) )
))
(declare-datatypes ((List!30865 0))(
  ( (Nil!30862) (Cons!30861 (h!32070 tuple2!23716) (t!45033 List!30865)) )
))
(declare-datatypes ((ListLongMap!21373 0))(
  ( (ListLongMap!21374 (toList!10702 List!30865)) )
))
(declare-fun lt!591755 () ListLongMap!21373)

(declare-fun minValue!1262 () V!53989)

(declare-fun contains!8866 (ListLongMap!21373 (_ BitVec 64)) Bool)

(declare-fun +!4696 (ListLongMap!21373 tuple2!23716) ListLongMap!21373)

(assert (=> b!1331912 (contains!8866 (+!4696 lt!591755 (tuple2!23717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43841 0))(
  ( (Unit!43842) )
))
(declare-fun lt!591757 () Unit!43841)

(declare-fun addStillContains!1175 (ListLongMap!21373 (_ BitVec 64) V!53989 (_ BitVec 64)) Unit!43841)

(assert (=> b!1331912 (= lt!591757 (addStillContains!1175 lt!591755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331912 (contains!8866 lt!591755 k!1153)))

(declare-fun lt!591758 () Unit!43841)

(declare-fun lt!591759 () V!53989)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!283 ((_ BitVec 64) (_ BitVec 64) V!53989 ListLongMap!21373) Unit!43841)

(assert (=> b!1331912 (= lt!591758 (lemmaInListMapAfterAddingDiffThenInBefore!283 k!1153 (select (arr!43572 _keys!1590) from!1980) lt!591759 lt!591755))))

(declare-fun lt!591760 () ListLongMap!21373)

(assert (=> b!1331912 (contains!8866 lt!591760 k!1153)))

(declare-fun lt!591756 () Unit!43841)

(assert (=> b!1331912 (= lt!591756 (lemmaInListMapAfterAddingDiffThenInBefore!283 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591760))))

(assert (=> b!1331912 (= lt!591760 (+!4696 lt!591755 (tuple2!23717 (select (arr!43572 _keys!1590) from!1980) lt!591759)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21976 (ValueCell!17434 V!53989) V!53989)

(declare-fun dynLambda!3635 (Int (_ BitVec 64)) V!53989)

(assert (=> b!1331912 (= lt!591759 (get!21976 (select (arr!43571 _values!1320) from!1980) (dynLambda!3635 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53989)

(declare-fun getCurrentListMapNoExtraKeys!6334 (array!90212 array!90210 (_ BitVec 32) (_ BitVec 32) V!53989 V!53989 (_ BitVec 32) Int) ListLongMap!21373)

(assert (=> b!1331912 (= lt!591755 (getCurrentListMapNoExtraKeys!6334 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331913 () Bool)

(assert (=> b!1331913 (= e!758864 (and e!758865 mapRes!56671))))

(declare-fun condMapEmpty!56671 () Bool)

(declare-fun mapDefault!56671 () ValueCell!17434)

