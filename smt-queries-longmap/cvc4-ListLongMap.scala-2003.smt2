; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35002 () Bool)

(assert start!35002)

(declare-fun b_free!7691 () Bool)

(declare-fun b_next!7691 () Bool)

(assert (=> start!35002 (= b_free!7691 (not b_next!7691))))

(declare-fun tp!26651 () Bool)

(declare-fun b_and!14921 () Bool)

(assert (=> start!35002 (= tp!26651 b_and!14921)))

(declare-fun b!350645 () Bool)

(declare-fun res!194351 () Bool)

(declare-fun e!214775 () Bool)

(assert (=> b!350645 (=> (not res!194351) (not e!214775))))

(declare-datatypes ((array!18873 0))(
  ( (array!18874 (arr!8942 (Array (_ BitVec 32) (_ BitVec 64))) (size!9294 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18873)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350645 (= res!194351 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350646 () Bool)

(assert (=> b!350646 (= e!214775 false)))

(declare-fun lt!164620 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18873 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350646 (= lt!164620 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350647 () Bool)

(declare-fun e!214772 () Bool)

(declare-fun e!214773 () Bool)

(declare-fun mapRes!12936 () Bool)

(assert (=> b!350647 (= e!214772 (and e!214773 mapRes!12936))))

(declare-fun condMapEmpty!12936 () Bool)

(declare-datatypes ((V!11167 0))(
  ( (V!11168 (val!3866 Int)) )
))
(declare-datatypes ((ValueCell!3478 0))(
  ( (ValueCellFull!3478 (v!6053 V!11167)) (EmptyCell!3478) )
))
(declare-datatypes ((array!18875 0))(
  ( (array!18876 (arr!8943 (Array (_ BitVec 32) ValueCell!3478)) (size!9295 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18875)

(declare-fun mapDefault!12936 () ValueCell!3478)

