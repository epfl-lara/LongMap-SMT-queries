; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96140 () Bool)

(assert start!96140)

(declare-fun b_free!22793 () Bool)

(declare-fun b_next!22793 () Bool)

(assert (=> start!96140 (= b_free!22793 (not b_next!22793))))

(declare-fun tp!80227 () Bool)

(declare-fun b_and!36261 () Bool)

(assert (=> start!96140 (= tp!80227 b_and!36261)))

(declare-fun mapIsEmpty!41947 () Bool)

(declare-fun mapRes!41947 () Bool)

(assert (=> mapIsEmpty!41947 mapRes!41947))

(declare-fun b!1091195 () Bool)

(declare-fun res!728019 () Bool)

(declare-fun e!623203 () Bool)

(assert (=> b!1091195 (=> (not res!728019) (not e!623203))))

(declare-datatypes ((array!70509 0))(
  ( (array!70510 (arr!33928 (Array (_ BitVec 32) (_ BitVec 64))) (size!34464 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70509)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70509 (_ BitVec 32)) Bool)

(assert (=> b!1091195 (= res!728019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091196 () Bool)

(declare-fun e!623204 () Bool)

(assert (=> b!1091196 (= e!623204 true)))

(declare-datatypes ((V!40853 0))(
  ( (V!40854 (val!13454 Int)) )
))
(declare-datatypes ((tuple2!17110 0))(
  ( (tuple2!17111 (_1!8566 (_ BitVec 64)) (_2!8566 V!40853)) )
))
(declare-datatypes ((List!23695 0))(
  ( (Nil!23692) (Cons!23691 (h!24900 tuple2!17110) (t!33546 List!23695)) )
))
(declare-datatypes ((ListLongMap!15079 0))(
  ( (ListLongMap!15080 (toList!7555 List!23695)) )
))
(declare-fun lt!487205 () ListLongMap!15079)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!487216 () ListLongMap!15079)

(declare-fun -!876 (ListLongMap!15079 (_ BitVec 64)) ListLongMap!15079)

(assert (=> b!1091196 (= (-!876 lt!487205 k!904) lt!487216)))

(declare-fun lt!487212 () ListLongMap!15079)

(declare-datatypes ((Unit!35918 0))(
  ( (Unit!35919) )
))
(declare-fun lt!487210 () Unit!35918)

(declare-fun minValue!831 () V!40853)

(declare-fun addRemoveCommutativeForDiffKeys!99 (ListLongMap!15079 (_ BitVec 64) V!40853 (_ BitVec 64)) Unit!35918)

(assert (=> b!1091196 (= lt!487210 (addRemoveCommutativeForDiffKeys!99 lt!487212 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091197 () Bool)

(declare-fun e!623206 () Bool)

(declare-fun e!623210 () Bool)

(assert (=> b!1091197 (= e!623206 (and e!623210 mapRes!41947))))

(declare-fun condMapEmpty!41947 () Bool)

(declare-datatypes ((ValueCell!12688 0))(
  ( (ValueCellFull!12688 (v!16075 V!40853)) (EmptyCell!12688) )
))
(declare-datatypes ((array!70511 0))(
  ( (array!70512 (arr!33929 (Array (_ BitVec 32) ValueCell!12688)) (size!34465 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70511)

(declare-fun mapDefault!41947 () ValueCell!12688)

