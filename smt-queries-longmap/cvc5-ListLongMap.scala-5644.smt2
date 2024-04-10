; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73648 () Bool)

(assert start!73648)

(declare-fun b_free!14563 () Bool)

(declare-fun b_next!14563 () Bool)

(assert (=> start!73648 (= b_free!14563 (not b_next!14563))))

(declare-fun tp!51193 () Bool)

(declare-fun b_and!24105 () Bool)

(assert (=> start!73648 (= tp!51193 b_and!24105)))

(declare-fun b!862325 () Bool)

(declare-fun res!585990 () Bool)

(declare-fun e!480432 () Bool)

(assert (=> b!862325 (=> (not res!585990) (not e!480432))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49562 0))(
  ( (array!49563 (arr!23812 (Array (_ BitVec 32) (_ BitVec 64))) (size!24252 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49562)

(declare-datatypes ((V!27313 0))(
  ( (V!27314 (val!8397 Int)) )
))
(declare-datatypes ((ValueCell!7910 0))(
  ( (ValueCellFull!7910 (v!10822 V!27313)) (EmptyCell!7910) )
))
(declare-datatypes ((array!49564 0))(
  ( (array!49565 (arr!23813 (Array (_ BitVec 32) ValueCell!7910)) (size!24253 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49564)

(assert (=> b!862325 (= res!585990 (and (= (size!24253 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24252 _keys!868) (size!24253 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862326 () Bool)

(declare-datatypes ((Unit!29443 0))(
  ( (Unit!29444) )
))
(declare-fun e!480431 () Unit!29443)

(declare-fun Unit!29445 () Unit!29443)

(assert (=> b!862326 (= e!480431 Unit!29445)))

(declare-fun b!862327 () Bool)

(declare-fun e!480428 () Bool)

(declare-fun e!480425 () Bool)

(declare-fun mapRes!26648 () Bool)

(assert (=> b!862327 (= e!480428 (and e!480425 mapRes!26648))))

(declare-fun condMapEmpty!26648 () Bool)

(declare-fun mapDefault!26648 () ValueCell!7910)

