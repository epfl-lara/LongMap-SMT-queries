; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73372 () Bool)

(assert start!73372)

(declare-fun b_free!14287 () Bool)

(declare-fun b_next!14287 () Bool)

(assert (=> start!73372 (= b_free!14287 (not b_next!14287))))

(declare-fun tp!50364 () Bool)

(declare-fun b_and!23643 () Bool)

(assert (=> start!73372 (= tp!50364 b_and!23643)))

(declare-fun b!856290 () Bool)

(declare-fun res!581583 () Bool)

(declare-fun e!477325 () Bool)

(assert (=> b!856290 (=> (not res!581583) (not e!477325))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49038 0))(
  ( (array!49039 (arr!23550 (Array (_ BitVec 32) (_ BitVec 64))) (size!23990 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49038)

(assert (=> b!856290 (= res!581583 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23990 _keys!868))))))

(declare-fun b!856291 () Bool)

(declare-fun e!477323 () Bool)

(declare-fun tp_is_empty!16423 () Bool)

(assert (=> b!856291 (= e!477323 tp_is_empty!16423)))

(declare-fun b!856292 () Bool)

(declare-fun res!581589 () Bool)

(assert (=> b!856292 (=> (not res!581589) (not e!477325))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856292 (= res!581589 (validKeyInArray!0 k!854))))

(declare-fun b!856293 () Bool)

(declare-fun res!581584 () Bool)

(assert (=> b!856293 (=> (not res!581584) (not e!477325))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49038 (_ BitVec 32)) Bool)

(assert (=> b!856293 (= res!581584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856294 () Bool)

(declare-fun res!581586 () Bool)

(assert (=> b!856294 (=> (not res!581586) (not e!477325))))

(declare-datatypes ((List!16700 0))(
  ( (Nil!16697) (Cons!16696 (h!17827 (_ BitVec 64)) (t!23341 List!16700)) )
))
(declare-fun arrayNoDuplicates!0 (array!49038 (_ BitVec 32) List!16700) Bool)

(assert (=> b!856294 (= res!581586 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16697))))

(declare-fun b!856295 () Bool)

(declare-fun res!581587 () Bool)

(assert (=> b!856295 (=> (not res!581587) (not e!477325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856295 (= res!581587 (validMask!0 mask!1196))))

(declare-fun b!856296 () Bool)

(declare-fun res!581590 () Bool)

(assert (=> b!856296 (=> (not res!581590) (not e!477325))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26945 0))(
  ( (V!26946 (val!8259 Int)) )
))
(declare-datatypes ((ValueCell!7772 0))(
  ( (ValueCellFull!7772 (v!10684 V!26945)) (EmptyCell!7772) )
))
(declare-datatypes ((array!49040 0))(
  ( (array!49041 (arr!23551 (Array (_ BitVec 32) ValueCell!7772)) (size!23991 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49040)

(assert (=> b!856296 (= res!581590 (and (= (size!23991 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23990 _keys!868) (size!23991 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856297 () Bool)

(declare-fun res!581591 () Bool)

(assert (=> b!856297 (=> (not res!581591) (not e!477325))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856297 (= res!581591 (and (= (select (arr!23550 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26234 () Bool)

(declare-fun mapRes!26234 () Bool)

(assert (=> mapIsEmpty!26234 mapRes!26234))

(declare-fun b!856298 () Bool)

(declare-fun e!477326 () Bool)

(assert (=> b!856298 (= e!477326 (and e!477323 mapRes!26234))))

(declare-fun condMapEmpty!26234 () Bool)

(declare-fun mapDefault!26234 () ValueCell!7772)

