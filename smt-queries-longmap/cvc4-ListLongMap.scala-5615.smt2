; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73478 () Bool)

(assert start!73478)

(declare-fun b_free!14393 () Bool)

(declare-fun b_next!14393 () Bool)

(assert (=> start!73478 (= b_free!14393 (not b_next!14393))))

(declare-fun tp!50682 () Bool)

(declare-fun b_and!23765 () Bool)

(assert (=> start!73478 (= tp!50682 b_and!23765)))

(declare-fun mapNonEmpty!26393 () Bool)

(declare-fun mapRes!26393 () Bool)

(declare-fun tp!50683 () Bool)

(declare-fun e!478312 () Bool)

(assert (=> mapNonEmpty!26393 (= mapRes!26393 (and tp!50683 e!478312))))

(declare-fun mapKey!26393 () (_ BitVec 32))

(declare-datatypes ((V!27085 0))(
  ( (V!27086 (val!8312 Int)) )
))
(declare-datatypes ((ValueCell!7825 0))(
  ( (ValueCellFull!7825 (v!10737 V!27085)) (EmptyCell!7825) )
))
(declare-datatypes ((array!49246 0))(
  ( (array!49247 (arr!23654 (Array (_ BitVec 32) ValueCell!7825)) (size!24094 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49246)

(declare-fun mapValue!26393 () ValueCell!7825)

(declare-fun mapRest!26393 () (Array (_ BitVec 32) ValueCell!7825))

(assert (=> mapNonEmpty!26393 (= (arr!23654 _values!688) (store mapRest!26393 mapKey!26393 mapValue!26393))))

(declare-fun b!858249 () Bool)

(declare-fun res!583051 () Bool)

(declare-fun e!478314 () Bool)

(assert (=> b!858249 (=> (not res!583051) (not e!478314))))

(declare-datatypes ((array!49248 0))(
  ( (array!49249 (arr!23655 (Array (_ BitVec 32) (_ BitVec 64))) (size!24095 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49248)

(declare-datatypes ((List!16781 0))(
  ( (Nil!16778) (Cons!16777 (h!17908 (_ BitVec 64)) (t!23440 List!16781)) )
))
(declare-fun arrayNoDuplicates!0 (array!49248 (_ BitVec 32) List!16781) Bool)

(assert (=> b!858249 (= res!583051 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16778))))

(declare-fun b!858250 () Bool)

(declare-fun e!478315 () Bool)

(declare-fun tp_is_empty!16529 () Bool)

(assert (=> b!858250 (= e!478315 tp_is_empty!16529)))

(declare-fun b!858251 () Bool)

(declare-fun res!583049 () Bool)

(assert (=> b!858251 (=> (not res!583049) (not e!478314))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858251 (= res!583049 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24095 _keys!868))))))

(declare-fun mapIsEmpty!26393 () Bool)

(assert (=> mapIsEmpty!26393 mapRes!26393))

(declare-fun b!858252 () Bool)

(declare-fun res!583053 () Bool)

(assert (=> b!858252 (=> (not res!583053) (not e!478314))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858252 (= res!583053 (and (= (select (arr!23655 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858253 () Bool)

(declare-fun res!583057 () Bool)

(assert (=> b!858253 (=> (not res!583057) (not e!478314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858253 (= res!583057 (validKeyInArray!0 k!854))))

(declare-fun b!858254 () Bool)

(declare-fun e!478313 () Bool)

(assert (=> b!858254 (= e!478313 (and e!478315 mapRes!26393))))

(declare-fun condMapEmpty!26393 () Bool)

(declare-fun mapDefault!26393 () ValueCell!7825)

