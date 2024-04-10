; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33666 () Bool)

(assert start!33666)

(declare-fun b_free!6901 () Bool)

(declare-fun b_next!6901 () Bool)

(assert (=> start!33666 (= b_free!6901 (not b_next!6901))))

(declare-fun tp!24207 () Bool)

(declare-fun b_and!14081 () Bool)

(assert (=> start!33666 (= tp!24207 b_and!14081)))

(declare-fun b!334371 () Bool)

(declare-fun res!184330 () Bool)

(declare-fun e!205260 () Bool)

(assert (=> b!334371 (=> (not res!184330) (not e!205260))))

(declare-datatypes ((array!17299 0))(
  ( (array!17300 (arr!8180 (Array (_ BitVec 32) (_ BitVec 64))) (size!8532 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17299)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17299 (_ BitVec 32)) Bool)

(assert (=> b!334371 (= res!184330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334372 () Bool)

(declare-fun e!205262 () Bool)

(declare-fun e!205261 () Bool)

(declare-fun mapRes!11676 () Bool)

(assert (=> b!334372 (= e!205262 (and e!205261 mapRes!11676))))

(declare-fun condMapEmpty!11676 () Bool)

(declare-datatypes ((V!10115 0))(
  ( (V!10116 (val!3471 Int)) )
))
(declare-datatypes ((ValueCell!3083 0))(
  ( (ValueCellFull!3083 (v!5633 V!10115)) (EmptyCell!3083) )
))
(declare-datatypes ((array!17301 0))(
  ( (array!17302 (arr!8181 (Array (_ BitVec 32) ValueCell!3083)) (size!8533 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17301)

(declare-fun mapDefault!11676 () ValueCell!3083)

