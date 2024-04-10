; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112456 () Bool)

(assert start!112456)

(declare-fun b_free!30851 () Bool)

(declare-fun b_next!30851 () Bool)

(assert (=> start!112456 (= b_free!30851 (not b_next!30851))))

(declare-fun tp!108189 () Bool)

(declare-fun b_and!49703 () Bool)

(assert (=> start!112456 (= tp!108189 b_and!49703)))

(declare-fun mapNonEmpty!56815 () Bool)

(declare-fun mapRes!56815 () Bool)

(declare-fun tp!108190 () Bool)

(declare-fun e!759586 () Bool)

(assert (=> mapNonEmpty!56815 (= mapRes!56815 (and tp!108190 e!759586))))

(declare-datatypes ((V!54117 0))(
  ( (V!54118 (val!18455 Int)) )
))
(declare-datatypes ((ValueCell!17482 0))(
  ( (ValueCellFull!17482 (v!21092 V!54117)) (EmptyCell!17482) )
))
(declare-datatypes ((array!90396 0))(
  ( (array!90397 (arr!43664 (Array (_ BitVec 32) ValueCell!17482)) (size!44214 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90396)

(declare-fun mapValue!56815 () ValueCell!17482)

(declare-fun mapRest!56815 () (Array (_ BitVec 32) ValueCell!17482))

(declare-fun mapKey!56815 () (_ BitVec 32))

(assert (=> mapNonEmpty!56815 (= (arr!43664 _values!1320) (store mapRest!56815 mapKey!56815 mapValue!56815))))

(declare-fun b!1333380 () Bool)

(declare-fun tp_is_empty!36761 () Bool)

(assert (=> b!1333380 (= e!759586 tp_is_empty!36761)))

(declare-fun b!1333381 () Bool)

(declare-fun e!759583 () Bool)

(assert (=> b!1333381 (= e!759583 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90398 0))(
  ( (array!90399 (arr!43665 (Array (_ BitVec 32) (_ BitVec 64))) (size!44215 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90398)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592120 () Bool)

(declare-fun minValue!1262 () V!54117)

(declare-fun zeroValue!1262 () V!54117)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23788 0))(
  ( (tuple2!23789 (_1!11905 (_ BitVec 64)) (_2!11905 V!54117)) )
))
(declare-datatypes ((List!30933 0))(
  ( (Nil!30930) (Cons!30929 (h!32138 tuple2!23788) (t!45143 List!30933)) )
))
(declare-datatypes ((ListLongMap!21445 0))(
  ( (ListLongMap!21446 (toList!10738 List!30933)) )
))
(declare-fun contains!8902 (ListLongMap!21445 (_ BitVec 64)) Bool)

(declare-fun +!4712 (ListLongMap!21445 tuple2!23788) ListLongMap!21445)

(declare-fun getCurrentListMapNoExtraKeys!6350 (array!90398 array!90396 (_ BitVec 32) (_ BitVec 32) V!54117 V!54117 (_ BitVec 32) Int) ListLongMap!21445)

(declare-fun get!22024 (ValueCell!17482 V!54117) V!54117)

(declare-fun dynLambda!3651 (Int (_ BitVec 64)) V!54117)

(assert (=> b!1333381 (= lt!592120 (contains!8902 (+!4712 (getCurrentListMapNoExtraKeys!6350 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23789 (select (arr!43665 _keys!1590) from!1980) (get!22024 (select (arr!43664 _values!1320) from!1980) (dynLambda!3651 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153))))

(declare-fun b!1333382 () Bool)

(declare-fun res!884848 () Bool)

(assert (=> b!1333382 (=> (not res!884848) (not e!759583))))

(assert (=> b!1333382 (= res!884848 (and (= (size!44214 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44215 _keys!1590) (size!44214 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!884852 () Bool)

(assert (=> start!112456 (=> (not res!884852) (not e!759583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112456 (= res!884852 (validMask!0 mask!1998))))

(assert (=> start!112456 e!759583))

(declare-fun e!759585 () Bool)

(declare-fun array_inv!32933 (array!90396) Bool)

(assert (=> start!112456 (and (array_inv!32933 _values!1320) e!759585)))

(assert (=> start!112456 true))

(declare-fun array_inv!32934 (array!90398) Bool)

(assert (=> start!112456 (array_inv!32934 _keys!1590)))

(assert (=> start!112456 tp!108189))

(assert (=> start!112456 tp_is_empty!36761))

(declare-fun b!1333383 () Bool)

(declare-fun e!759582 () Bool)

(assert (=> b!1333383 (= e!759582 tp_is_empty!36761)))

(declare-fun b!1333384 () Bool)

(declare-fun res!884849 () Bool)

(assert (=> b!1333384 (=> (not res!884849) (not e!759583))))

(assert (=> b!1333384 (= res!884849 (not (= (select (arr!43665 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333385 () Bool)

(declare-fun res!884854 () Bool)

(assert (=> b!1333385 (=> (not res!884854) (not e!759583))))

(declare-fun getCurrentListMap!5719 (array!90398 array!90396 (_ BitVec 32) (_ BitVec 32) V!54117 V!54117 (_ BitVec 32) Int) ListLongMap!21445)

(assert (=> b!1333385 (= res!884854 (contains!8902 (getCurrentListMap!5719 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1333386 () Bool)

(declare-fun res!884856 () Bool)

(assert (=> b!1333386 (=> (not res!884856) (not e!759583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333386 (= res!884856 (validKeyInArray!0 (select (arr!43665 _keys!1590) from!1980)))))

(declare-fun b!1333387 () Bool)

(declare-fun res!884851 () Bool)

(assert (=> b!1333387 (=> (not res!884851) (not e!759583))))

(assert (=> b!1333387 (= res!884851 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333388 () Bool)

(assert (=> b!1333388 (= e!759585 (and e!759582 mapRes!56815))))

(declare-fun condMapEmpty!56815 () Bool)

(declare-fun mapDefault!56815 () ValueCell!17482)

