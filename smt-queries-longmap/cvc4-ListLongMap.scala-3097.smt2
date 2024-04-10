; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43526 () Bool)

(assert start!43526)

(declare-fun b_free!12305 () Bool)

(declare-fun b_next!12305 () Bool)

(assert (=> start!43526 (= b_free!12305 (not b_next!12305))))

(declare-fun tp!43198 () Bool)

(declare-fun b_and!21065 () Bool)

(assert (=> start!43526 (= tp!43198 b_and!21065)))

(declare-fun b!482258 () Bool)

(declare-fun res!287483 () Bool)

(declare-fun e!283794 () Bool)

(assert (=> b!482258 (=> (not res!287483) (not e!283794))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31293 0))(
  ( (array!31294 (arr!15049 (Array (_ BitVec 32) (_ BitVec 64))) (size!15407 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31293)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19493 0))(
  ( (V!19494 (val!6956 Int)) )
))
(declare-datatypes ((ValueCell!6547 0))(
  ( (ValueCellFull!6547 (v!9249 V!19493)) (EmptyCell!6547) )
))
(declare-datatypes ((array!31295 0))(
  ( (array!31296 (arr!15050 (Array (_ BitVec 32) ValueCell!6547)) (size!15408 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31295)

(assert (=> b!482258 (= res!287483 (and (= (size!15408 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15407 _keys!1874) (size!15408 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482259 () Bool)

(declare-fun e!283793 () Bool)

(declare-fun e!283790 () Bool)

(declare-fun mapRes!22435 () Bool)

(assert (=> b!482259 (= e!283793 (and e!283790 mapRes!22435))))

(declare-fun condMapEmpty!22435 () Bool)

(declare-fun mapDefault!22435 () ValueCell!6547)

