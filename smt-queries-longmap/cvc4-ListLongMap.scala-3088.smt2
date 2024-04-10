; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43472 () Bool)

(assert start!43472)

(declare-fun b_free!12251 () Bool)

(declare-fun b_next!12251 () Bool)

(assert (=> start!43472 (= b_free!12251 (not b_next!12251))))

(declare-fun tp!43035 () Bool)

(declare-fun b_and!21011 () Bool)

(assert (=> start!43472 (= tp!43035 b_and!21011)))

(declare-fun b!481615 () Bool)

(declare-fun res!287124 () Bool)

(declare-fun e!283370 () Bool)

(assert (=> b!481615 (=> (not res!287124) (not e!283370))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31189 0))(
  ( (array!31190 (arr!14997 (Array (_ BitVec 32) (_ BitVec 64))) (size!15355 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31189)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19421 0))(
  ( (V!19422 (val!6929 Int)) )
))
(declare-datatypes ((ValueCell!6520 0))(
  ( (ValueCellFull!6520 (v!9222 V!19421)) (EmptyCell!6520) )
))
(declare-datatypes ((array!31191 0))(
  ( (array!31192 (arr!14998 (Array (_ BitVec 32) ValueCell!6520)) (size!15356 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31191)

(assert (=> b!481615 (= res!287124 (and (= (size!15356 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15355 _keys!1874) (size!15356 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481616 () Bool)

(declare-fun res!287121 () Bool)

(assert (=> b!481616 (=> (not res!287121) (not e!283370))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481616 (= res!287121 (validKeyInArray!0 k!1332))))

(declare-fun mapNonEmpty!22354 () Bool)

(declare-fun mapRes!22354 () Bool)

(declare-fun tp!43036 () Bool)

(declare-fun e!283369 () Bool)

(assert (=> mapNonEmpty!22354 (= mapRes!22354 (and tp!43036 e!283369))))

(declare-fun mapRest!22354 () (Array (_ BitVec 32) ValueCell!6520))

(declare-fun mapKey!22354 () (_ BitVec 32))

(declare-fun mapValue!22354 () ValueCell!6520)

(assert (=> mapNonEmpty!22354 (= (arr!14998 _values!1516) (store mapRest!22354 mapKey!22354 mapValue!22354))))

(declare-fun b!481617 () Bool)

(declare-fun e!283366 () Bool)

(declare-fun e!283368 () Bool)

(assert (=> b!481617 (= e!283366 (and e!283368 mapRes!22354))))

(declare-fun condMapEmpty!22354 () Bool)

(declare-fun mapDefault!22354 () ValueCell!6520)

