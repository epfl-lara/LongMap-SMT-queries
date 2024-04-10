; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72848 () Bool)

(assert start!72848)

(declare-fun b_free!13763 () Bool)

(declare-fun b_next!13763 () Bool)

(assert (=> start!72848 (= b_free!13763 (not b_next!13763))))

(declare-fun tp!48793 () Bool)

(declare-fun b_and!22849 () Bool)

(assert (=> start!72848 (= tp!48793 b_and!22849)))

(declare-fun b!845473 () Bool)

(declare-fun res!574370 () Bool)

(declare-fun e!471980 () Bool)

(assert (=> b!845473 (=> (not res!574370) (not e!471980))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48018 0))(
  ( (array!48019 (arr!23040 (Array (_ BitVec 32) (_ BitVec 64))) (size!23480 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48018)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845473 (= res!574370 (and (= (select (arr!23040 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845474 () Bool)

(declare-fun res!574367 () Bool)

(assert (=> b!845474 (=> (not res!574367) (not e!471980))))

(assert (=> b!845474 (= res!574367 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23480 _keys!868))))))

(declare-fun b!845475 () Bool)

(declare-fun res!574373 () Bool)

(assert (=> b!845475 (=> (not res!574373) (not e!471980))))

(declare-datatypes ((List!16306 0))(
  ( (Nil!16303) (Cons!16302 (h!17433 (_ BitVec 64)) (t!22677 List!16306)) )
))
(declare-fun arrayNoDuplicates!0 (array!48018 (_ BitVec 32) List!16306) Bool)

(assert (=> b!845475 (= res!574373 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16303))))

(declare-fun b!845476 () Bool)

(declare-fun res!574371 () Bool)

(assert (=> b!845476 (=> (not res!574371) (not e!471980))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48018 (_ BitVec 32)) Bool)

(assert (=> b!845476 (= res!574371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845477 () Bool)

(declare-fun res!574369 () Bool)

(assert (=> b!845477 (=> (not res!574369) (not e!471980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845477 (= res!574369 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25448 () Bool)

(declare-fun mapRes!25448 () Bool)

(assert (=> mapIsEmpty!25448 mapRes!25448))

(declare-fun b!845478 () Bool)

(declare-fun e!471982 () Bool)

(declare-fun tp_is_empty!15899 () Bool)

(assert (=> b!845478 (= e!471982 tp_is_empty!15899)))

(declare-fun b!845479 () Bool)

(declare-fun e!471979 () Bool)

(declare-fun e!471981 () Bool)

(assert (=> b!845479 (= e!471979 (and e!471981 mapRes!25448))))

(declare-fun condMapEmpty!25448 () Bool)

(declare-datatypes ((V!26245 0))(
  ( (V!26246 (val!7997 Int)) )
))
(declare-datatypes ((ValueCell!7510 0))(
  ( (ValueCellFull!7510 (v!10422 V!26245)) (EmptyCell!7510) )
))
(declare-datatypes ((array!48020 0))(
  ( (array!48021 (arr!23041 (Array (_ BitVec 32) ValueCell!7510)) (size!23481 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48020)

(declare-fun mapDefault!25448 () ValueCell!7510)

