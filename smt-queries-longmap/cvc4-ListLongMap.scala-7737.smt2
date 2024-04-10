; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97170 () Bool)

(assert start!97170)

(declare-fun b!1105329 () Bool)

(declare-fun res!737518 () Bool)

(declare-fun e!630867 () Bool)

(assert (=> b!1105329 (=> (not res!737518) (not e!630867))))

(declare-datatypes ((array!71725 0))(
  ( (array!71726 (arr!34515 (Array (_ BitVec 32) (_ BitVec 64))) (size!35051 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71725)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41661 0))(
  ( (V!41662 (val!13757 Int)) )
))
(declare-datatypes ((ValueCell!12991 0))(
  ( (ValueCellFull!12991 (v!16390 V!41661)) (EmptyCell!12991) )
))
(declare-datatypes ((array!71727 0))(
  ( (array!71728 (arr!34516 (Array (_ BitVec 32) ValueCell!12991)) (size!35052 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71727)

(assert (=> b!1105329 (= res!737518 (and (= (size!35052 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35051 _keys!1208) (size!35052 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!737514 () Bool)

(assert (=> start!97170 (=> (not res!737514) (not e!630867))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97170 (= res!737514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35051 _keys!1208))))))

(assert (=> start!97170 e!630867))

(declare-fun array_inv!26570 (array!71725) Bool)

(assert (=> start!97170 (array_inv!26570 _keys!1208)))

(assert (=> start!97170 true))

(declare-fun e!630863 () Bool)

(declare-fun array_inv!26571 (array!71727) Bool)

(assert (=> start!97170 (and (array_inv!26571 _values!996) e!630863)))

(declare-fun b!1105330 () Bool)

(declare-fun res!737515 () Bool)

(declare-fun e!630866 () Bool)

(assert (=> b!1105330 (=> (not res!737515) (not e!630866))))

(declare-fun lt!495290 () array!71725)

(declare-datatypes ((List!24073 0))(
  ( (Nil!24070) (Cons!24069 (h!25278 (_ BitVec 64)) (t!34338 List!24073)) )
))
(declare-fun arrayNoDuplicates!0 (array!71725 (_ BitVec 32) List!24073) Bool)

(assert (=> b!1105330 (= res!737515 (arrayNoDuplicates!0 lt!495290 #b00000000000000000000000000000000 Nil!24070))))

(declare-fun b!1105331 () Bool)

(declare-fun e!630862 () Bool)

(declare-fun tp_is_empty!27401 () Bool)

(assert (=> b!1105331 (= e!630862 tp_is_empty!27401)))

(declare-fun b!1105332 () Bool)

(declare-fun res!737517 () Bool)

(assert (=> b!1105332 (=> (not res!737517) (not e!630867))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1105332 (= res!737517 (= (select (arr!34515 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!42919 () Bool)

(declare-fun mapRes!42919 () Bool)

(declare-fun tp!81839 () Bool)

(assert (=> mapNonEmpty!42919 (= mapRes!42919 (and tp!81839 e!630862))))

(declare-fun mapValue!42919 () ValueCell!12991)

(declare-fun mapRest!42919 () (Array (_ BitVec 32) ValueCell!12991))

(declare-fun mapKey!42919 () (_ BitVec 32))

(assert (=> mapNonEmpty!42919 (= (arr!34516 _values!996) (store mapRest!42919 mapKey!42919 mapValue!42919))))

(declare-fun b!1105333 () Bool)

(declare-fun e!630864 () Bool)

(assert (=> b!1105333 (= e!630863 (and e!630864 mapRes!42919))))

(declare-fun condMapEmpty!42919 () Bool)

(declare-fun mapDefault!42919 () ValueCell!12991)

