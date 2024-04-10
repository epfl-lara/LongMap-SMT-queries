; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72874 () Bool)

(assert start!72874)

(declare-fun b_free!13789 () Bool)

(declare-fun b_next!13789 () Bool)

(assert (=> start!72874 (= b_free!13789 (not b_next!13789))))

(declare-fun tp!48870 () Bool)

(declare-fun b_and!22875 () Bool)

(assert (=> start!72874 (= tp!48870 b_and!22875)))

(declare-fun mapIsEmpty!25487 () Bool)

(declare-fun mapRes!25487 () Bool)

(assert (=> mapIsEmpty!25487 mapRes!25487))

(declare-fun b!845902 () Bool)

(declare-fun e!472173 () Bool)

(declare-fun tp_is_empty!15925 () Bool)

(assert (=> b!845902 (= e!472173 tp_is_empty!15925)))

(declare-fun b!845903 () Bool)

(declare-fun res!574683 () Bool)

(declare-fun e!472174 () Bool)

(assert (=> b!845903 (=> (not res!574683) (not e!472174))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845903 (= res!574683 (validMask!0 mask!1196))))

(declare-fun b!845904 () Bool)

(declare-fun res!574680 () Bool)

(assert (=> b!845904 (=> (not res!574680) (not e!472174))))

(declare-datatypes ((array!48068 0))(
  ( (array!48069 (arr!23065 (Array (_ BitVec 32) (_ BitVec 64))) (size!23505 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48068)

(declare-datatypes ((List!16324 0))(
  ( (Nil!16321) (Cons!16320 (h!17451 (_ BitVec 64)) (t!22695 List!16324)) )
))
(declare-fun arrayNoDuplicates!0 (array!48068 (_ BitVec 32) List!16324) Bool)

(assert (=> b!845904 (= res!574680 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16321))))

(declare-fun b!845905 () Bool)

(assert (=> b!845905 (= e!472174 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26281 0))(
  ( (V!26282 (val!8010 Int)) )
))
(declare-datatypes ((ValueCell!7523 0))(
  ( (ValueCellFull!7523 (v!10435 V!26281)) (EmptyCell!7523) )
))
(declare-datatypes ((array!48070 0))(
  ( (array!48071 (arr!23066 (Array (_ BitVec 32) ValueCell!7523)) (size!23506 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48070)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26281)

(declare-fun zeroValue!654 () V!26281)

(declare-datatypes ((tuple2!10462 0))(
  ( (tuple2!10463 (_1!5242 (_ BitVec 64)) (_2!5242 V!26281)) )
))
(declare-datatypes ((List!16325 0))(
  ( (Nil!16322) (Cons!16321 (h!17452 tuple2!10462) (t!22696 List!16325)) )
))
(declare-datatypes ((ListLongMap!9231 0))(
  ( (ListLongMap!9232 (toList!4631 List!16325)) )
))
(declare-fun lt!381454 () ListLongMap!9231)

(declare-fun getCurrentListMapNoExtraKeys!2616 (array!48068 array!48070 (_ BitVec 32) (_ BitVec 32) V!26281 V!26281 (_ BitVec 32) Int) ListLongMap!9231)

(assert (=> b!845905 (= lt!381454 (getCurrentListMapNoExtraKeys!2616 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845906 () Bool)

(declare-fun e!472176 () Bool)

(assert (=> b!845906 (= e!472176 tp_is_empty!15925)))

(declare-fun b!845907 () Bool)

(declare-fun res!574681 () Bool)

(assert (=> b!845907 (=> (not res!574681) (not e!472174))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845907 (= res!574681 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23505 _keys!868))))))

(declare-fun b!845908 () Bool)

(declare-fun res!574678 () Bool)

(assert (=> b!845908 (=> (not res!574678) (not e!472174))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845908 (= res!574678 (validKeyInArray!0 k!854))))

(declare-fun b!845909 () Bool)

(declare-fun e!472177 () Bool)

(assert (=> b!845909 (= e!472177 (and e!472176 mapRes!25487))))

(declare-fun condMapEmpty!25487 () Bool)

(declare-fun mapDefault!25487 () ValueCell!7523)

