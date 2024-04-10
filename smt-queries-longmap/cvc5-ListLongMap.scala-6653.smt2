; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83890 () Bool)

(assert start!83890)

(declare-fun b_free!19699 () Bool)

(declare-fun b_next!19699 () Bool)

(assert (=> start!83890 (= b_free!19699 (not b_next!19699))))

(declare-fun tp!68539 () Bool)

(declare-fun b_and!31487 () Bool)

(assert (=> start!83890 (= tp!68539 b_and!31487)))

(declare-fun b!980276 () Bool)

(declare-fun res!656044 () Bool)

(declare-fun e!552543 () Bool)

(assert (=> b!980276 (=> (not res!656044) (not e!552543))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35241 0))(
  ( (V!35242 (val!11397 Int)) )
))
(declare-datatypes ((ValueCell!10865 0))(
  ( (ValueCellFull!10865 (v!13959 V!35241)) (EmptyCell!10865) )
))
(declare-datatypes ((array!61395 0))(
  ( (array!61396 (arr!29555 (Array (_ BitVec 32) ValueCell!10865)) (size!30034 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61395)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61397 0))(
  ( (array!61398 (arr!29556 (Array (_ BitVec 32) (_ BitVec 64))) (size!30035 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61397)

(assert (=> b!980276 (= res!656044 (and (= (size!30034 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30035 _keys!1544) (size!30034 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980277 () Bool)

(declare-fun res!656040 () Bool)

(assert (=> b!980277 (=> (not res!656040) (not e!552543))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980277 (= res!656040 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30035 _keys!1544))))))

(declare-fun b!980278 () Bool)

(declare-fun e!552544 () Bool)

(declare-fun tp_is_empty!22693 () Bool)

(assert (=> b!980278 (= e!552544 tp_is_empty!22693)))

(declare-fun b!980279 () Bool)

(declare-fun e!552545 () Bool)

(declare-fun e!552541 () Bool)

(declare-fun mapRes!36068 () Bool)

(assert (=> b!980279 (= e!552545 (and e!552541 mapRes!36068))))

(declare-fun condMapEmpty!36068 () Bool)

(declare-fun mapDefault!36068 () ValueCell!10865)

