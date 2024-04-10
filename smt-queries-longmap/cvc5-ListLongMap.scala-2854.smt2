; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41154 () Bool)

(assert start!41154)

(declare-fun b_free!11023 () Bool)

(declare-fun b_next!11023 () Bool)

(assert (=> start!41154 (= b_free!11023 (not b_next!11023))))

(declare-fun tp!38905 () Bool)

(declare-fun b_and!19285 () Bool)

(assert (=> start!41154 (= tp!38905 b_and!19285)))

(declare-fun b!459519 () Bool)

(declare-fun res!274627 () Bool)

(declare-fun e!268191 () Bool)

(assert (=> b!459519 (=> (not res!274627) (not e!268191))))

(declare-datatypes ((array!28523 0))(
  ( (array!28524 (arr!13702 (Array (_ BitVec 32) (_ BitVec 64))) (size!14054 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28523)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459519 (= res!274627 (or (= (select (arr!13702 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13702 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459520 () Bool)

(declare-fun res!274631 () Bool)

(assert (=> b!459520 (=> (not res!274631) (not e!268191))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459520 (= res!274631 (validKeyInArray!0 k!794))))

(declare-fun b!459521 () Bool)

(declare-fun e!268189 () Bool)

(declare-fun e!268193 () Bool)

(declare-fun mapRes!20191 () Bool)

(assert (=> b!459521 (= e!268189 (and e!268193 mapRes!20191))))

(declare-fun condMapEmpty!20191 () Bool)

(declare-datatypes ((V!17587 0))(
  ( (V!17588 (val!6225 Int)) )
))
(declare-datatypes ((ValueCell!5837 0))(
  ( (ValueCellFull!5837 (v!8503 V!17587)) (EmptyCell!5837) )
))
(declare-datatypes ((array!28525 0))(
  ( (array!28526 (arr!13703 (Array (_ BitVec 32) ValueCell!5837)) (size!14055 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28525)

(declare-fun mapDefault!20191 () ValueCell!5837)

