; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73396 () Bool)

(assert start!73396)

(declare-fun b_free!14311 () Bool)

(declare-fun b_next!14311 () Bool)

(assert (=> start!73396 (= b_free!14311 (not b_next!14311))))

(declare-fun tp!50436 () Bool)

(declare-fun b_and!23667 () Bool)

(assert (=> start!73396 (= tp!50436 b_and!23667)))

(declare-fun res!581913 () Bool)

(declare-fun e!477541 () Bool)

(assert (=> start!73396 (=> (not res!581913) (not e!477541))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49086 0))(
  ( (array!49087 (arr!23574 (Array (_ BitVec 32) (_ BitVec 64))) (size!24014 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49086)

(assert (=> start!73396 (= res!581913 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24014 _keys!868))))))

(assert (=> start!73396 e!477541))

(declare-fun tp_is_empty!16447 () Bool)

(assert (=> start!73396 tp_is_empty!16447))

(assert (=> start!73396 true))

(assert (=> start!73396 tp!50436))

(declare-fun array_inv!18670 (array!49086) Bool)

(assert (=> start!73396 (array_inv!18670 _keys!868)))

(declare-datatypes ((V!26977 0))(
  ( (V!26978 (val!8271 Int)) )
))
(declare-datatypes ((ValueCell!7784 0))(
  ( (ValueCellFull!7784 (v!10696 V!26977)) (EmptyCell!7784) )
))
(declare-datatypes ((array!49088 0))(
  ( (array!49089 (arr!23575 (Array (_ BitVec 32) ValueCell!7784)) (size!24015 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49088)

(declare-fun e!477544 () Bool)

(declare-fun array_inv!18671 (array!49088) Bool)

(assert (=> start!73396 (and (array_inv!18671 _values!688) e!477544)))

(declare-fun b!856722 () Bool)

(declare-fun res!581911 () Bool)

(assert (=> b!856722 (=> (not res!581911) (not e!477541))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856722 (= res!581911 (validMask!0 mask!1196))))

(declare-fun b!856723 () Bool)

(declare-fun res!581915 () Bool)

(assert (=> b!856723 (=> (not res!581915) (not e!477541))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856723 (= res!581915 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24014 _keys!868))))))

(declare-fun b!856724 () Bool)

(declare-fun res!581910 () Bool)

(assert (=> b!856724 (=> (not res!581910) (not e!477541))))

(declare-datatypes ((List!16717 0))(
  ( (Nil!16714) (Cons!16713 (h!17844 (_ BitVec 64)) (t!23358 List!16717)) )
))
(declare-fun arrayNoDuplicates!0 (array!49086 (_ BitVec 32) List!16717) Bool)

(assert (=> b!856724 (= res!581910 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16714))))

(declare-fun b!856725 () Bool)

(declare-fun res!581914 () Bool)

(assert (=> b!856725 (=> (not res!581914) (not e!477541))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!856725 (= res!581914 (and (= (select (arr!23574 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26270 () Bool)

(declare-fun mapRes!26270 () Bool)

(declare-fun tp!50437 () Bool)

(declare-fun e!477542 () Bool)

(assert (=> mapNonEmpty!26270 (= mapRes!26270 (and tp!50437 e!477542))))

(declare-fun mapValue!26270 () ValueCell!7784)

(declare-fun mapRest!26270 () (Array (_ BitVec 32) ValueCell!7784))

(declare-fun mapKey!26270 () (_ BitVec 32))

(assert (=> mapNonEmpty!26270 (= (arr!23575 _values!688) (store mapRest!26270 mapKey!26270 mapValue!26270))))

(declare-fun mapIsEmpty!26270 () Bool)

(assert (=> mapIsEmpty!26270 mapRes!26270))

(declare-fun b!856726 () Bool)

(declare-fun e!477540 () Bool)

(assert (=> b!856726 (= e!477540 tp_is_empty!16447)))

(declare-fun b!856727 () Bool)

(assert (=> b!856727 (= e!477544 (and e!477540 mapRes!26270))))

(declare-fun condMapEmpty!26270 () Bool)

(declare-fun mapDefault!26270 () ValueCell!7784)

