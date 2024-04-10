; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72382 () Bool)

(assert start!72382)

(declare-fun b_free!13567 () Bool)

(declare-fun b_next!13567 () Bool)

(assert (=> start!72382 (= b_free!13567 (not b_next!13567))))

(declare-fun tp!47800 () Bool)

(declare-fun b_and!22653 () Bool)

(assert (=> start!72382 (= tp!47800 b_and!22653)))

(declare-fun b!838868 () Bool)

(declare-fun res!570398 () Bool)

(declare-fun e!468216 () Bool)

(assert (=> b!838868 (=> (not res!570398) (not e!468216))))

(declare-datatypes ((array!47152 0))(
  ( (array!47153 (arr!22607 (Array (_ BitVec 32) (_ BitVec 64))) (size!23047 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47152)

(declare-datatypes ((List!16073 0))(
  ( (Nil!16070) (Cons!16069 (h!17200 (_ BitVec 64)) (t!22444 List!16073)) )
))
(declare-fun arrayNoDuplicates!0 (array!47152 (_ BitVec 32) List!16073) Bool)

(assert (=> b!838868 (= res!570398 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16070))))

(declare-fun res!570397 () Bool)

(assert (=> start!72382 (=> (not res!570397) (not e!468216))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72382 (= res!570397 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23047 _keys!868))))))

(assert (=> start!72382 e!468216))

(declare-fun tp_is_empty!15433 () Bool)

(assert (=> start!72382 tp_is_empty!15433))

(assert (=> start!72382 true))

(assert (=> start!72382 tp!47800))

(declare-fun array_inv!18010 (array!47152) Bool)

(assert (=> start!72382 (array_inv!18010 _keys!868)))

(declare-datatypes ((V!25625 0))(
  ( (V!25626 (val!7764 Int)) )
))
(declare-datatypes ((ValueCell!7277 0))(
  ( (ValueCellFull!7277 (v!10189 V!25625)) (EmptyCell!7277) )
))
(declare-datatypes ((array!47154 0))(
  ( (array!47155 (arr!22608 (Array (_ BitVec 32) ValueCell!7277)) (size!23048 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47154)

(declare-fun e!468220 () Bool)

(declare-fun array_inv!18011 (array!47154) Bool)

(assert (=> start!72382 (and (array_inv!18011 _values!688) e!468220)))

(declare-fun b!838869 () Bool)

(declare-fun e!468218 () Bool)

(assert (=> b!838869 (= e!468218 tp_is_empty!15433)))

(declare-fun b!838870 () Bool)

(assert (=> b!838870 (= e!468216 (not true))))

(declare-fun e!468219 () Bool)

(assert (=> b!838870 e!468219))

(declare-fun c!91210 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838870 (= c!91210 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25625)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28809 0))(
  ( (Unit!28810) )
))
(declare-fun lt!380716 () Unit!28809)

(declare-fun minValue!654 () V!25625)

(declare-fun zeroValue!654 () V!25625)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!250 (array!47152 array!47154 (_ BitVec 32) (_ BitVec 32) V!25625 V!25625 (_ BitVec 32) (_ BitVec 64) V!25625 (_ BitVec 32) Int) Unit!28809)

(assert (=> b!838870 (= lt!380716 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!250 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838871 () Bool)

(declare-fun e!468217 () Bool)

(declare-fun mapRes!24749 () Bool)

(assert (=> b!838871 (= e!468220 (and e!468217 mapRes!24749))))

(declare-fun condMapEmpty!24749 () Bool)

(declare-fun mapDefault!24749 () ValueCell!7277)

