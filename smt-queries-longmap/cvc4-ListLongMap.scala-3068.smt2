; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43264 () Bool)

(assert start!43264)

(declare-fun b_free!12131 () Bool)

(declare-fun b_next!12131 () Bool)

(assert (=> start!43264 (= b_free!12131 (not b_next!12131))))

(declare-fun tp!42664 () Bool)

(declare-fun b_and!20883 () Bool)

(assert (=> start!43264 (= tp!42664 b_and!20883)))

(declare-fun b!479342 () Bool)

(declare-fun res!285936 () Bool)

(declare-fun e!281996 () Bool)

(assert (=> b!479342 (=> (not res!285936) (not e!281996))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30959 0))(
  ( (array!30960 (arr!14886 (Array (_ BitVec 32) (_ BitVec 64))) (size!15244 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30959)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19261 0))(
  ( (V!19262 (val!6869 Int)) )
))
(declare-datatypes ((ValueCell!6460 0))(
  ( (ValueCellFull!6460 (v!9158 V!19261)) (EmptyCell!6460) )
))
(declare-datatypes ((array!30961 0))(
  ( (array!30962 (arr!14887 (Array (_ BitVec 32) ValueCell!6460)) (size!15245 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30961)

(assert (=> b!479342 (= res!285936 (and (= (size!15245 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15244 _keys!1874) (size!15245 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479343 () Bool)

(declare-fun e!281997 () Bool)

(declare-fun tp_is_empty!13643 () Bool)

(assert (=> b!479343 (= e!281997 tp_is_empty!13643)))

(declare-fun b!479344 () Bool)

(declare-fun e!282000 () Bool)

(assert (=> b!479344 (= e!282000 tp_is_empty!13643)))

(declare-fun b!479345 () Bool)

(declare-fun res!285934 () Bool)

(assert (=> b!479345 (=> (not res!285934) (not e!281996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30959 (_ BitVec 32)) Bool)

(assert (=> b!479345 (= res!285934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22162 () Bool)

(declare-fun mapRes!22162 () Bool)

(assert (=> mapIsEmpty!22162 mapRes!22162))

(declare-fun b!479346 () Bool)

(declare-fun e!281998 () Bool)

(assert (=> b!479346 (= e!281998 (and e!281997 mapRes!22162))))

(declare-fun condMapEmpty!22162 () Bool)

(declare-fun mapDefault!22162 () ValueCell!6460)

