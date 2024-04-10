; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74002 () Bool)

(assert start!74002)

(declare-fun b_free!14917 () Bool)

(declare-fun b_next!14917 () Bool)

(assert (=> start!74002 (= b_free!14917 (not b_next!14917))))

(declare-fun tp!52254 () Bool)

(declare-fun b_and!24669 () Bool)

(assert (=> start!74002 (= tp!52254 b_and!24669)))

(declare-fun b!870159 () Bool)

(declare-fun res!591400 () Bool)

(declare-fun e!484553 () Bool)

(assert (=> b!870159 (=> (not res!591400) (not e!484553))))

(declare-datatypes ((array!50252 0))(
  ( (array!50253 (arr!24157 (Array (_ BitVec 32) (_ BitVec 64))) (size!24597 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50252)

(declare-datatypes ((List!17183 0))(
  ( (Nil!17180) (Cons!17179 (h!18310 (_ BitVec 64)) (t!24220 List!17183)) )
))
(declare-fun arrayNoDuplicates!0 (array!50252 (_ BitVec 32) List!17183) Bool)

(assert (=> b!870159 (= res!591400 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17180))))

(declare-fun mapIsEmpty!27179 () Bool)

(declare-fun mapRes!27179 () Bool)

(assert (=> mapIsEmpty!27179 mapRes!27179))

(declare-fun b!870160 () Bool)

(declare-fun res!591398 () Bool)

(assert (=> b!870160 (=> (not res!591398) (not e!484553))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27785 0))(
  ( (V!27786 (val!8574 Int)) )
))
(declare-datatypes ((ValueCell!8087 0))(
  ( (ValueCellFull!8087 (v!10999 V!27785)) (EmptyCell!8087) )
))
(declare-datatypes ((array!50254 0))(
  ( (array!50255 (arr!24158 (Array (_ BitVec 32) ValueCell!8087)) (size!24598 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50254)

(assert (=> b!870160 (= res!591398 (and (= (size!24598 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24597 _keys!868) (size!24598 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870161 () Bool)

(declare-fun e!484554 () Bool)

(declare-fun e!484555 () Bool)

(assert (=> b!870161 (= e!484554 (and e!484555 mapRes!27179))))

(declare-fun condMapEmpty!27179 () Bool)

(declare-fun mapDefault!27179 () ValueCell!8087)

