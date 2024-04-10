; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74564 () Bool)

(assert start!74564)

(declare-fun b_free!15253 () Bool)

(declare-fun b_next!15253 () Bool)

(assert (=> start!74564 (= b_free!15253 (not b_next!15253))))

(declare-fun tp!53441 () Bool)

(declare-fun b_and!25129 () Bool)

(assert (=> start!74564 (= tp!53441 b_and!25129)))

(declare-fun b!878510 () Bool)

(declare-fun res!596834 () Bool)

(declare-fun e!488934 () Bool)

(assert (=> b!878510 (=> (not res!596834) (not e!488934))))

(declare-datatypes ((array!51120 0))(
  ( (array!51121 (arr!24586 (Array (_ BitVec 32) (_ BitVec 64))) (size!25026 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51120)

(declare-datatypes ((List!17447 0))(
  ( (Nil!17444) (Cons!17443 (h!18574 (_ BitVec 64)) (t!24536 List!17447)) )
))
(declare-fun arrayNoDuplicates!0 (array!51120 (_ BitVec 32) List!17447) Bool)

(assert (=> b!878510 (= res!596834 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17444))))

(declare-fun res!596835 () Bool)

(assert (=> start!74564 (=> (not res!596835) (not e!488934))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74564 (= res!596835 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25026 _keys!868))))))

(assert (=> start!74564 e!488934))

(declare-fun tp_is_empty!17497 () Bool)

(assert (=> start!74564 tp_is_empty!17497))

(assert (=> start!74564 true))

(assert (=> start!74564 tp!53441))

(declare-fun array_inv!19376 (array!51120) Bool)

(assert (=> start!74564 (array_inv!19376 _keys!868)))

(declare-datatypes ((V!28377 0))(
  ( (V!28378 (val!8796 Int)) )
))
(declare-datatypes ((ValueCell!8309 0))(
  ( (ValueCellFull!8309 (v!11236 V!28377)) (EmptyCell!8309) )
))
(declare-datatypes ((array!51122 0))(
  ( (array!51123 (arr!24587 (Array (_ BitVec 32) ValueCell!8309)) (size!25027 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51122)

(declare-fun e!488932 () Bool)

(declare-fun array_inv!19377 (array!51122) Bool)

(assert (=> start!74564 (and (array_inv!19377 _values!688) e!488932)))

(declare-fun b!878511 () Bool)

(declare-fun res!596837 () Bool)

(assert (=> b!878511 (=> (not res!596837) (not e!488934))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!878511 (= res!596837 (and (= (select (arr!24586 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27861 () Bool)

(declare-fun mapRes!27861 () Bool)

(declare-fun tp!53440 () Bool)

(declare-fun e!488933 () Bool)

(assert (=> mapNonEmpty!27861 (= mapRes!27861 (and tp!53440 e!488933))))

(declare-fun mapKey!27861 () (_ BitVec 32))

(declare-fun mapValue!27861 () ValueCell!8309)

(declare-fun mapRest!27861 () (Array (_ BitVec 32) ValueCell!8309))

(assert (=> mapNonEmpty!27861 (= (arr!24587 _values!688) (store mapRest!27861 mapKey!27861 mapValue!27861))))

(declare-fun b!878512 () Bool)

(declare-fun e!488935 () Bool)

(assert (=> b!878512 (= e!488935 tp_is_empty!17497)))

(declare-fun b!878513 () Bool)

(assert (=> b!878513 (= e!488932 (and e!488935 mapRes!27861))))

(declare-fun condMapEmpty!27861 () Bool)

(declare-fun mapDefault!27861 () ValueCell!8309)

