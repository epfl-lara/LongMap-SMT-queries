; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20668 () Bool)

(assert start!20668)

(declare-fun b_free!5327 () Bool)

(declare-fun b_next!5327 () Bool)

(assert (=> start!20668 (= b_free!5327 (not b_next!5327))))

(declare-fun tp!19013 () Bool)

(declare-fun b_and!12073 () Bool)

(assert (=> start!20668 (= tp!19013 b_and!12073)))

(declare-fun b!206516 () Bool)

(declare-fun res!100063 () Bool)

(declare-fun e!134967 () Bool)

(assert (=> b!206516 (=> (not res!100063) (not e!134967))))

(declare-datatypes ((array!9577 0))(
  ( (array!9578 (arr!4539 (Array (_ BitVec 32) (_ BitVec 64))) (size!4864 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9577)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206516 (= res!100063 (= (select (arr!4539 _keys!825) i!601) k!843))))

(declare-fun b!206517 () Bool)

(declare-fun res!100064 () Bool)

(assert (=> b!206517 (=> (not res!100064) (not e!134967))))

(assert (=> b!206517 (= res!100064 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4864 _keys!825))))))

(declare-fun b!206518 () Bool)

(declare-fun e!134966 () Bool)

(declare-fun e!134968 () Bool)

(declare-fun mapRes!8843 () Bool)

(assert (=> b!206518 (= e!134966 (and e!134968 mapRes!8843))))

(declare-fun condMapEmpty!8843 () Bool)

(declare-datatypes ((V!6557 0))(
  ( (V!6558 (val!2636 Int)) )
))
(declare-datatypes ((ValueCell!2248 0))(
  ( (ValueCellFull!2248 (v!4606 V!6557)) (EmptyCell!2248) )
))
(declare-datatypes ((array!9579 0))(
  ( (array!9580 (arr!4540 (Array (_ BitVec 32) ValueCell!2248)) (size!4865 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9579)

(declare-fun mapDefault!8843 () ValueCell!2248)

