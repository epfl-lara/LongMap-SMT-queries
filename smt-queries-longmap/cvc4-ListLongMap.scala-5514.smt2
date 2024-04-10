; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72872 () Bool)

(assert start!72872)

(declare-fun b_free!13787 () Bool)

(declare-fun b_next!13787 () Bool)

(assert (=> start!72872 (= b_free!13787 (not b_next!13787))))

(declare-fun tp!48865 () Bool)

(declare-fun b_and!22873 () Bool)

(assert (=> start!72872 (= tp!48865 b_and!22873)))

(declare-fun b!845869 () Bool)

(declare-fun res!574657 () Bool)

(declare-fun e!472160 () Bool)

(assert (=> b!845869 (=> (not res!574657) (not e!472160))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845869 (= res!574657 (validKeyInArray!0 k!854))))

(declare-fun b!845870 () Bool)

(declare-fun res!574654 () Bool)

(assert (=> b!845870 (=> (not res!574654) (not e!472160))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48064 0))(
  ( (array!48065 (arr!23063 (Array (_ BitVec 32) (_ BitVec 64))) (size!23503 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48064)

(declare-datatypes ((V!26277 0))(
  ( (V!26278 (val!8009 Int)) )
))
(declare-datatypes ((ValueCell!7522 0))(
  ( (ValueCellFull!7522 (v!10434 V!26277)) (EmptyCell!7522) )
))
(declare-datatypes ((array!48066 0))(
  ( (array!48067 (arr!23064 (Array (_ BitVec 32) ValueCell!7522)) (size!23504 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48066)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!845870 (= res!574654 (and (= (size!23504 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23503 _keys!868) (size!23504 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845871 () Bool)

(declare-fun res!574658 () Bool)

(assert (=> b!845871 (=> (not res!574658) (not e!472160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48064 (_ BitVec 32)) Bool)

(assert (=> b!845871 (= res!574658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845872 () Bool)

(declare-fun e!472159 () Bool)

(declare-fun e!472161 () Bool)

(declare-fun mapRes!25484 () Bool)

(assert (=> b!845872 (= e!472159 (and e!472161 mapRes!25484))))

(declare-fun condMapEmpty!25484 () Bool)

(declare-fun mapDefault!25484 () ValueCell!7522)

