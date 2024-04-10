; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39848 () Bool)

(assert start!39848)

(declare-fun b_free!10115 () Bool)

(declare-fun b_next!10115 () Bool)

(assert (=> start!39848 (= b_free!10115 (not b_next!10115))))

(declare-fun tp!35873 () Bool)

(declare-fun b_and!17889 () Bool)

(assert (=> start!39848 (= tp!35873 b_and!17889)))

(declare-fun b!430766 () Bool)

(declare-fun res!253163 () Bool)

(declare-fun e!254991 () Bool)

(assert (=> b!430766 (=> (not res!253163) (not e!254991))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430766 (= res!253163 (bvsle from!863 i!563))))

(declare-fun b!430767 () Bool)

(declare-fun e!254985 () Bool)

(assert (=> b!430767 (= e!254985 e!254991)))

(declare-fun res!253160 () Bool)

(assert (=> b!430767 (=> (not res!253160) (not e!254991))))

(declare-datatypes ((array!26369 0))(
  ( (array!26370 (arr!12634 (Array (_ BitVec 32) (_ BitVec 64))) (size!12986 (_ BitVec 32))) )
))
(declare-fun lt!197092 () array!26369)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26369 (_ BitVec 32)) Bool)

(assert (=> b!430767 (= res!253160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197092 mask!1025))))

(declare-fun _keys!709 () array!26369)

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!430767 (= lt!197092 (array!26370 (store (arr!12634 _keys!709) i!563 k!794) (size!12986 _keys!709)))))

(declare-fun b!430768 () Bool)

(declare-fun e!254988 () Bool)

(declare-fun e!254990 () Bool)

(declare-fun mapRes!18522 () Bool)

(assert (=> b!430768 (= e!254988 (and e!254990 mapRes!18522))))

(declare-fun condMapEmpty!18522 () Bool)

(declare-datatypes ((V!16127 0))(
  ( (V!16128 (val!5678 Int)) )
))
(declare-datatypes ((ValueCell!5290 0))(
  ( (ValueCellFull!5290 (v!7925 V!16127)) (EmptyCell!5290) )
))
(declare-datatypes ((array!26371 0))(
  ( (array!26372 (arr!12635 (Array (_ BitVec 32) ValueCell!5290)) (size!12987 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26371)

(declare-fun mapDefault!18522 () ValueCell!5290)

