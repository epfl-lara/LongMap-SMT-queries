; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73484 () Bool)

(assert start!73484)

(declare-fun b_free!14399 () Bool)

(declare-fun b_next!14399 () Bool)

(assert (=> start!73484 (= b_free!14399 (not b_next!14399))))

(declare-fun tp!50700 () Bool)

(declare-fun b_and!23777 () Bool)

(assert (=> start!73484 (= tp!50700 b_and!23777)))

(declare-fun b!858372 () Bool)

(declare-fun res!583145 () Bool)

(declare-fun e!478375 () Bool)

(assert (=> b!858372 (=> (not res!583145) (not e!478375))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858372 (= res!583145 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26402 () Bool)

(declare-fun mapRes!26402 () Bool)

(assert (=> mapIsEmpty!26402 mapRes!26402))

(declare-fun b!858373 () Bool)

(declare-fun res!583139 () Bool)

(assert (=> b!858373 (=> (not res!583139) (not e!478375))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858373 (= res!583139 (validKeyInArray!0 k!854))))

(declare-fun b!858374 () Bool)

(declare-fun e!478381 () Bool)

(declare-fun e!478378 () Bool)

(assert (=> b!858374 (= e!478381 (and e!478378 mapRes!26402))))

(declare-fun condMapEmpty!26402 () Bool)

(declare-datatypes ((V!27093 0))(
  ( (V!27094 (val!8315 Int)) )
))
(declare-datatypes ((ValueCell!7828 0))(
  ( (ValueCellFull!7828 (v!10740 V!27093)) (EmptyCell!7828) )
))
(declare-datatypes ((array!49258 0))(
  ( (array!49259 (arr!23660 (Array (_ BitVec 32) ValueCell!7828)) (size!24100 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49258)

(declare-fun mapDefault!26402 () ValueCell!7828)

