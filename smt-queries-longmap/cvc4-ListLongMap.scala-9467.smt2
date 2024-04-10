; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112414 () Bool)

(assert start!112414)

(declare-fun b_free!30809 () Bool)

(declare-fun b_next!30809 () Bool)

(assert (=> start!112414 (= b_free!30809 (not b_next!30809))))

(declare-fun tp!108064 () Bool)

(declare-fun b_and!49651 () Bool)

(assert (=> start!112414 (= tp!108064 b_and!49651)))

(declare-fun b!1332771 () Bool)

(declare-fun res!884439 () Bool)

(declare-fun e!759271 () Bool)

(assert (=> b!1332771 (=> (not res!884439) (not e!759271))))

(declare-datatypes ((array!90314 0))(
  ( (array!90315 (arr!43623 (Array (_ BitVec 32) (_ BitVec 64))) (size!44173 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90314)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90314 (_ BitVec 32)) Bool)

(assert (=> b!1332771 (= res!884439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332772 () Bool)

(declare-fun res!884440 () Bool)

(assert (=> b!1332772 (=> (not res!884440) (not e!759271))))

(declare-datatypes ((List!30901 0))(
  ( (Nil!30898) (Cons!30897 (h!32106 (_ BitVec 64)) (t!45099 List!30901)) )
))
(declare-fun arrayNoDuplicates!0 (array!90314 (_ BitVec 32) List!30901) Bool)

(assert (=> b!1332772 (= res!884440 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30898))))

(declare-fun b!1332773 () Bool)

(declare-fun res!884438 () Bool)

(assert (=> b!1332773 (=> (not res!884438) (not e!759271))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332773 (= res!884438 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44173 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56752 () Bool)

(declare-fun mapRes!56752 () Bool)

(declare-fun tp!108063 () Bool)

(declare-fun e!759270 () Bool)

(assert (=> mapNonEmpty!56752 (= mapRes!56752 (and tp!108063 e!759270))))

(declare-datatypes ((V!54061 0))(
  ( (V!54062 (val!18434 Int)) )
))
(declare-datatypes ((ValueCell!17461 0))(
  ( (ValueCellFull!17461 (v!21071 V!54061)) (EmptyCell!17461) )
))
(declare-fun mapValue!56752 () ValueCell!17461)

(declare-fun mapRest!56752 () (Array (_ BitVec 32) ValueCell!17461))

(declare-datatypes ((array!90316 0))(
  ( (array!90317 (arr!43624 (Array (_ BitVec 32) ValueCell!17461)) (size!44174 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90316)

(declare-fun mapKey!56752 () (_ BitVec 32))

(assert (=> mapNonEmpty!56752 (= (arr!43624 _values!1320) (store mapRest!56752 mapKey!56752 mapValue!56752))))

(declare-fun res!884442 () Bool)

(assert (=> start!112414 (=> (not res!884442) (not e!759271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112414 (= res!884442 (validMask!0 mask!1998))))

(assert (=> start!112414 e!759271))

(declare-fun e!759268 () Bool)

(declare-fun array_inv!32905 (array!90316) Bool)

(assert (=> start!112414 (and (array_inv!32905 _values!1320) e!759268)))

(assert (=> start!112414 true))

(declare-fun array_inv!32906 (array!90314) Bool)

(assert (=> start!112414 (array_inv!32906 _keys!1590)))

(assert (=> start!112414 tp!108064))

(declare-fun tp_is_empty!36719 () Bool)

(assert (=> start!112414 tp_is_empty!36719))

(declare-fun b!1332774 () Bool)

(declare-fun e!759267 () Bool)

(assert (=> b!1332774 (= e!759267 tp_is_empty!36719)))

(declare-fun b!1332775 () Bool)

(declare-fun res!884441 () Bool)

(assert (=> b!1332775 (=> (not res!884441) (not e!759271))))

(assert (=> b!1332775 (= res!884441 (and (= (size!44174 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44173 _keys!1590) (size!44174 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332776 () Bool)

(assert (=> b!1332776 (= e!759271 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592066 () Bool)

(declare-fun minValue!1262 () V!54061)

(declare-fun zeroValue!1262 () V!54061)

(declare-datatypes ((tuple2!23756 0))(
  ( (tuple2!23757 (_1!11889 (_ BitVec 64)) (_2!11889 V!54061)) )
))
(declare-datatypes ((List!30902 0))(
  ( (Nil!30899) (Cons!30898 (h!32107 tuple2!23756) (t!45100 List!30902)) )
))
(declare-datatypes ((ListLongMap!21413 0))(
  ( (ListLongMap!21414 (toList!10722 List!30902)) )
))
(declare-fun contains!8886 (ListLongMap!21413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5703 (array!90314 array!90316 (_ BitVec 32) (_ BitVec 32) V!54061 V!54061 (_ BitVec 32) Int) ListLongMap!21413)

(assert (=> b!1332776 (= lt!592066 (contains!8886 (getCurrentListMap!5703 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332777 () Bool)

(assert (=> b!1332777 (= e!759268 (and e!759267 mapRes!56752))))

(declare-fun condMapEmpty!56752 () Bool)

(declare-fun mapDefault!56752 () ValueCell!17461)

