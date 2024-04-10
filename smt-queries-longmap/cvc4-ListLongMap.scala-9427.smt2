; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112174 () Bool)

(assert start!112174)

(declare-fun b_free!30569 () Bool)

(declare-fun b_next!30569 () Bool)

(assert (=> start!112174 (= b_free!30569 (not b_next!30569))))

(declare-fun tp!107344 () Bool)

(declare-fun b_and!49219 () Bool)

(assert (=> start!112174 (= tp!107344 b_and!49219)))

(declare-fun b!1328520 () Bool)

(declare-fun e!757468 () Bool)

(declare-fun tp_is_empty!36479 () Bool)

(assert (=> b!1328520 (= e!757468 tp_is_empty!36479)))

(declare-fun b!1328521 () Bool)

(declare-fun res!881460 () Bool)

(declare-fun e!757469 () Bool)

(assert (=> b!1328521 (=> (not res!881460) (not e!757469))))

(declare-datatypes ((array!89852 0))(
  ( (array!89853 (arr!43392 (Array (_ BitVec 32) (_ BitVec 64))) (size!43942 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89852)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89852 (_ BitVec 32)) Bool)

(assert (=> b!1328521 (= res!881460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328522 () Bool)

(declare-fun res!881459 () Bool)

(assert (=> b!1328522 (=> (not res!881459) (not e!757469))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328522 (= res!881459 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43942 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328523 () Bool)

(declare-fun res!881461 () Bool)

(assert (=> b!1328523 (=> (not res!881461) (not e!757469))))

(declare-datatypes ((V!53741 0))(
  ( (V!53742 (val!18314 Int)) )
))
(declare-datatypes ((ValueCell!17341 0))(
  ( (ValueCellFull!17341 (v!20951 V!53741)) (EmptyCell!17341) )
))
(declare-datatypes ((array!89854 0))(
  ( (array!89855 (arr!43393 (Array (_ BitVec 32) ValueCell!17341)) (size!43943 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89854)

(assert (=> b!1328523 (= res!881461 (and (= (size!43943 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43942 _keys!1590) (size!43943 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!881463 () Bool)

(assert (=> start!112174 (=> (not res!881463) (not e!757469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112174 (= res!881463 (validMask!0 mask!1998))))

(assert (=> start!112174 e!757469))

(declare-fun e!757470 () Bool)

(declare-fun array_inv!32739 (array!89854) Bool)

(assert (=> start!112174 (and (array_inv!32739 _values!1320) e!757470)))

(assert (=> start!112174 true))

(declare-fun array_inv!32740 (array!89852) Bool)

(assert (=> start!112174 (array_inv!32740 _keys!1590)))

(assert (=> start!112174 tp!107344))

(assert (=> start!112174 tp_is_empty!36479))

(declare-fun b!1328524 () Bool)

(declare-fun e!757471 () Bool)

(assert (=> b!1328524 (= e!757471 tp_is_empty!36479)))

(declare-fun b!1328525 () Bool)

(assert (=> b!1328525 (= e!757469 false)))

(declare-fun minValue!1262 () V!53741)

(declare-fun zeroValue!1262 () V!53741)

(declare-fun lt!590851 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23572 0))(
  ( (tuple2!23573 (_1!11797 (_ BitVec 64)) (_2!11797 V!53741)) )
))
(declare-datatypes ((List!30730 0))(
  ( (Nil!30727) (Cons!30726 (h!31935 tuple2!23572) (t!44736 List!30730)) )
))
(declare-datatypes ((ListLongMap!21229 0))(
  ( (ListLongMap!21230 (toList!10630 List!30730)) )
))
(declare-fun contains!8794 (ListLongMap!21229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5621 (array!89852 array!89854 (_ BitVec 32) (_ BitVec 32) V!53741 V!53741 (_ BitVec 32) Int) ListLongMap!21229)

(assert (=> b!1328525 (= lt!590851 (contains!8794 (getCurrentListMap!5621 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56392 () Bool)

(declare-fun mapRes!56392 () Bool)

(assert (=> mapIsEmpty!56392 mapRes!56392))

(declare-fun b!1328526 () Bool)

(assert (=> b!1328526 (= e!757470 (and e!757468 mapRes!56392))))

(declare-fun condMapEmpty!56392 () Bool)

(declare-fun mapDefault!56392 () ValueCell!17341)

