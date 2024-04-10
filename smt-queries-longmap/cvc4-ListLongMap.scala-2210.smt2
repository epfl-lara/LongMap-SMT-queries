; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36678 () Bool)

(assert start!36678)

(declare-fun b!366092 () Bool)

(declare-fun res!204732 () Bool)

(declare-fun e!224186 () Bool)

(assert (=> b!366092 (=> (not res!204732) (not e!224186))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366092 (= res!204732 (validKeyInArray!0 k!778))))

(declare-fun b!366093 () Bool)

(declare-fun res!204730 () Bool)

(assert (=> b!366093 (=> (not res!204730) (not e!224186))))

(declare-datatypes ((array!20955 0))(
  ( (array!20956 (arr!9949 (Array (_ BitVec 32) (_ BitVec 64))) (size!10301 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20955)

(declare-datatypes ((List!5543 0))(
  ( (Nil!5540) (Cons!5539 (h!6395 (_ BitVec 64)) (t!10693 List!5543)) )
))
(declare-fun arrayNoDuplicates!0 (array!20955 (_ BitVec 32) List!5543) Bool)

(assert (=> b!366093 (= res!204730 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5540))))

(declare-fun b!366094 () Bool)

(declare-fun e!224189 () Bool)

(declare-fun e!224190 () Bool)

(declare-fun mapRes!14307 () Bool)

(assert (=> b!366094 (= e!224189 (and e!224190 mapRes!14307))))

(declare-fun condMapEmpty!14307 () Bool)

(declare-datatypes ((V!12439 0))(
  ( (V!12440 (val!4295 Int)) )
))
(declare-datatypes ((ValueCell!3907 0))(
  ( (ValueCellFull!3907 (v!6491 V!12439)) (EmptyCell!3907) )
))
(declare-datatypes ((array!20957 0))(
  ( (array!20958 (arr!9950 (Array (_ BitVec 32) ValueCell!3907)) (size!10302 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20957)

(declare-fun mapDefault!14307 () ValueCell!3907)

