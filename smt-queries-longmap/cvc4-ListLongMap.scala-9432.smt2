; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112204 () Bool)

(assert start!112204)

(declare-fun b_free!30599 () Bool)

(declare-fun b_next!30599 () Bool)

(assert (=> start!112204 (= b_free!30599 (not b_next!30599))))

(declare-fun tp!107433 () Bool)

(declare-fun b_and!49253 () Bool)

(assert (=> start!112204 (= tp!107433 b_and!49253)))

(declare-fun b!1328943 () Bool)

(declare-fun e!757694 () Bool)

(assert (=> b!1328943 (= e!757694 false)))

(declare-datatypes ((V!53781 0))(
  ( (V!53782 (val!18329 Int)) )
))
(declare-datatypes ((ValueCell!17356 0))(
  ( (ValueCellFull!17356 (v!20966 V!53781)) (EmptyCell!17356) )
))
(declare-datatypes ((array!89910 0))(
  ( (array!89911 (arr!43421 (Array (_ BitVec 32) ValueCell!17356)) (size!43971 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89910)

(declare-fun lt!590887 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89912 0))(
  ( (array!89913 (arr!43422 (Array (_ BitVec 32) (_ BitVec 64))) (size!43972 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89912)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53781)

(declare-fun zeroValue!1262 () V!53781)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((tuple2!23594 0))(
  ( (tuple2!23595 (_1!11808 (_ BitVec 64)) (_2!11808 V!53781)) )
))
(declare-datatypes ((List!30750 0))(
  ( (Nil!30747) (Cons!30746 (h!31955 tuple2!23594) (t!44762 List!30750)) )
))
(declare-datatypes ((ListLongMap!21251 0))(
  ( (ListLongMap!21252 (toList!10641 List!30750)) )
))
(declare-fun contains!8805 (ListLongMap!21251 (_ BitVec 64)) Bool)

(declare-fun +!4643 (ListLongMap!21251 tuple2!23594) ListLongMap!21251)

(declare-fun getCurrentListMapNoExtraKeys!6281 (array!89912 array!89910 (_ BitVec 32) (_ BitVec 32) V!53781 V!53781 (_ BitVec 32) Int) ListLongMap!21251)

(declare-fun get!21871 (ValueCell!17356 V!53781) V!53781)

(declare-fun dynLambda!3582 (Int (_ BitVec 64)) V!53781)

(assert (=> b!1328943 (= lt!590887 (contains!8805 (+!4643 (+!4643 (getCurrentListMapNoExtraKeys!6281 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23595 (select (arr!43422 _keys!1590) from!1980) (get!21871 (select (arr!43421 _values!1320) from!1980) (dynLambda!3582 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153))))

(declare-fun b!1328944 () Bool)

(declare-fun e!757696 () Bool)

(declare-fun tp_is_empty!36509 () Bool)

(assert (=> b!1328944 (= e!757696 tp_is_empty!36509)))

(declare-fun b!1328945 () Bool)

(declare-fun res!881743 () Bool)

(assert (=> b!1328945 (=> (not res!881743) (not e!757694))))

(assert (=> b!1328945 (= res!881743 (and (= (size!43971 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43972 _keys!1590) (size!43971 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328946 () Bool)

(declare-fun e!757693 () Bool)

(declare-fun mapRes!56437 () Bool)

(assert (=> b!1328946 (= e!757693 (and e!757696 mapRes!56437))))

(declare-fun condMapEmpty!56437 () Bool)

(declare-fun mapDefault!56437 () ValueCell!17356)

