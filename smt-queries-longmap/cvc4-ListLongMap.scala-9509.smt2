; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112808 () Bool)

(assert start!112808)

(declare-fun b_free!31061 () Bool)

(declare-fun b_next!31061 () Bool)

(assert (=> start!112808 (= b_free!31061 (not b_next!31061))))

(declare-fun tp!108830 () Bool)

(declare-fun b_and!50069 () Bool)

(assert (=> start!112808 (= tp!108830 b_and!50069)))

(declare-fun b!1337985 () Bool)

(declare-fun e!761843 () Bool)

(declare-fun e!761842 () Bool)

(assert (=> b!1337985 (= e!761843 e!761842)))

(declare-fun res!887854 () Bool)

(assert (=> b!1337985 (=> (not res!887854) (not e!761842))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((V!54397 0))(
  ( (V!54398 (val!18560 Int)) )
))
(declare-datatypes ((tuple2!23944 0))(
  ( (tuple2!23945 (_1!11983 (_ BitVec 64)) (_2!11983 V!54397)) )
))
(declare-datatypes ((List!31085 0))(
  ( (Nil!31082) (Cons!31081 (h!32290 tuple2!23944) (t!45415 List!31085)) )
))
(declare-datatypes ((ListLongMap!21601 0))(
  ( (ListLongMap!21602 (toList!10816 List!31085)) )
))
(declare-fun lt!593363 () ListLongMap!21601)

(declare-fun lt!593362 () V!54397)

(declare-datatypes ((array!90800 0))(
  ( (array!90801 (arr!43863 (Array (_ BitVec 32) (_ BitVec 64))) (size!44413 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90800)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8985 (ListLongMap!21601 (_ BitVec 64)) Bool)

(declare-fun +!4752 (ListLongMap!21601 tuple2!23944) ListLongMap!21601)

(assert (=> b!1337985 (= res!887854 (contains!8985 (+!4752 lt!593363 (tuple2!23945 (select (arr!43863 _keys!1590) from!1980) lt!593362)) k!1153))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54397)

(declare-fun zeroValue!1262 () V!54397)

(declare-datatypes ((ValueCell!17587 0))(
  ( (ValueCellFull!17587 (v!21204 V!54397)) (EmptyCell!17587) )
))
(declare-datatypes ((array!90802 0))(
  ( (array!90803 (arr!43864 (Array (_ BitVec 32) ValueCell!17587)) (size!44414 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90802)

(declare-fun getCurrentListMapNoExtraKeys!6394 (array!90800 array!90802 (_ BitVec 32) (_ BitVec 32) V!54397 V!54397 (_ BitVec 32) Int) ListLongMap!21601)

(assert (=> b!1337985 (= lt!593363 (getCurrentListMapNoExtraKeys!6394 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22142 (ValueCell!17587 V!54397) V!54397)

(declare-fun dynLambda!3691 (Int (_ BitVec 64)) V!54397)

(assert (=> b!1337985 (= lt!593362 (get!22142 (select (arr!43864 _values!1320) from!1980) (dynLambda!3691 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!887847 () Bool)

(assert (=> start!112808 (=> (not res!887847) (not e!761843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112808 (= res!887847 (validMask!0 mask!1998))))

(assert (=> start!112808 e!761843))

(declare-fun e!761840 () Bool)

(declare-fun array_inv!33079 (array!90802) Bool)

(assert (=> start!112808 (and (array_inv!33079 _values!1320) e!761840)))

(assert (=> start!112808 true))

(declare-fun array_inv!33080 (array!90800) Bool)

(assert (=> start!112808 (array_inv!33080 _keys!1590)))

(assert (=> start!112808 tp!108830))

(declare-fun tp_is_empty!36971 () Bool)

(assert (=> start!112808 tp_is_empty!36971))

(declare-fun b!1337986 () Bool)

(declare-fun res!887851 () Bool)

(assert (=> b!1337986 (=> (not res!887851) (not e!761843))))

(assert (=> b!1337986 (= res!887851 (not (= (select (arr!43863 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1337987 () Bool)

(declare-fun res!887855 () Bool)

(assert (=> b!1337987 (=> (not res!887855) (not e!761843))))

(assert (=> b!1337987 (= res!887855 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337988 () Bool)

(declare-fun res!887857 () Bool)

(assert (=> b!1337988 (=> (not res!887857) (not e!761843))))

(declare-datatypes ((List!31086 0))(
  ( (Nil!31083) (Cons!31082 (h!32291 (_ BitVec 64)) (t!45416 List!31086)) )
))
(declare-fun arrayNoDuplicates!0 (array!90800 (_ BitVec 32) List!31086) Bool)

(assert (=> b!1337988 (= res!887857 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31083))))

(declare-fun b!1337989 () Bool)

(declare-fun res!887850 () Bool)

(assert (=> b!1337989 (=> (not res!887850) (not e!761843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90800 (_ BitVec 32)) Bool)

(assert (=> b!1337989 (= res!887850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337990 () Bool)

(declare-fun res!887848 () Bool)

(assert (=> b!1337990 (=> (not res!887848) (not e!761843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337990 (= res!887848 (validKeyInArray!0 (select (arr!43863 _keys!1590) from!1980)))))

(declare-fun b!1337991 () Bool)

(declare-fun res!887849 () Bool)

(assert (=> b!1337991 (=> (not res!887849) (not e!761843))))

(declare-fun getCurrentListMap!5785 (array!90800 array!90802 (_ BitVec 32) (_ BitVec 32) V!54397 V!54397 (_ BitVec 32) Int) ListLongMap!21601)

(assert (=> b!1337991 (= res!887849 (contains!8985 (getCurrentListMap!5785 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!57141 () Bool)

(declare-fun mapRes!57141 () Bool)

(declare-fun tp!108831 () Bool)

(declare-fun e!761841 () Bool)

(assert (=> mapNonEmpty!57141 (= mapRes!57141 (and tp!108831 e!761841))))

(declare-fun mapValue!57141 () ValueCell!17587)

(declare-fun mapKey!57141 () (_ BitVec 32))

(declare-fun mapRest!57141 () (Array (_ BitVec 32) ValueCell!17587))

(assert (=> mapNonEmpty!57141 (= (arr!43864 _values!1320) (store mapRest!57141 mapKey!57141 mapValue!57141))))

(declare-fun b!1337992 () Bool)

(declare-fun res!887853 () Bool)

(assert (=> b!1337992 (=> (not res!887853) (not e!761843))))

(assert (=> b!1337992 (= res!887853 (and (= (size!44414 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44413 _keys!1590) (size!44414 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337993 () Bool)

(declare-fun e!761839 () Bool)

(assert (=> b!1337993 (= e!761840 (and e!761839 mapRes!57141))))

(declare-fun condMapEmpty!57141 () Bool)

(declare-fun mapDefault!57141 () ValueCell!17587)

