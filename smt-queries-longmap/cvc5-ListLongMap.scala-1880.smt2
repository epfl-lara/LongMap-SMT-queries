; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33714 () Bool)

(assert start!33714)

(declare-fun b_free!6949 () Bool)

(declare-fun b_next!6949 () Bool)

(assert (=> start!33714 (= b_free!6949 (not b_next!6949))))

(declare-fun tp!24350 () Bool)

(declare-fun b_and!14129 () Bool)

(assert (=> start!33714 (= tp!24350 b_and!14129)))

(declare-fun b!335163 () Bool)

(declare-fun res!184907 () Bool)

(declare-fun e!205734 () Bool)

(assert (=> b!335163 (=> (not res!184907) (not e!205734))))

(declare-datatypes ((array!17395 0))(
  ( (array!17396 (arr!8228 (Array (_ BitVec 32) (_ BitVec 64))) (size!8580 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17395)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17395 (_ BitVec 32)) Bool)

(assert (=> b!335163 (= res!184907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335164 () Bool)

(declare-fun e!205732 () Bool)

(declare-fun e!205733 () Bool)

(declare-fun mapRes!11748 () Bool)

(assert (=> b!335164 (= e!205732 (and e!205733 mapRes!11748))))

(declare-fun condMapEmpty!11748 () Bool)

(declare-datatypes ((V!10179 0))(
  ( (V!10180 (val!3495 Int)) )
))
(declare-datatypes ((ValueCell!3107 0))(
  ( (ValueCellFull!3107 (v!5657 V!10179)) (EmptyCell!3107) )
))
(declare-datatypes ((array!17397 0))(
  ( (array!17398 (arr!8229 (Array (_ BitVec 32) ValueCell!3107)) (size!8581 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17397)

(declare-fun mapDefault!11748 () ValueCell!3107)

