; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39982 () Bool)

(assert start!39982)

(declare-fun b_free!10249 () Bool)

(declare-fun b_next!10249 () Bool)

(assert (=> start!39982 (= b_free!10249 (not b_next!10249))))

(declare-fun tp!36275 () Bool)

(declare-fun b_and!18157 () Bool)

(assert (=> start!39982 (= tp!36275 b_and!18157)))

(declare-fun b!434920 () Bool)

(declare-fun res!256185 () Bool)

(declare-fun e!256997 () Bool)

(assert (=> b!434920 (=> (not res!256185) (not e!256997))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434920 (= res!256185 (validKeyInArray!0 k!794))))

(declare-fun b!434921 () Bool)

(declare-fun e!257000 () Bool)

(assert (=> b!434921 (= e!256997 e!257000)))

(declare-fun res!256174 () Bool)

(assert (=> b!434921 (=> (not res!256174) (not e!257000))))

(declare-datatypes ((array!26633 0))(
  ( (array!26634 (arr!12766 (Array (_ BitVec 32) (_ BitVec 64))) (size!13118 (_ BitVec 32))) )
))
(declare-fun lt!200116 () array!26633)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26633 (_ BitVec 32)) Bool)

(assert (=> b!434921 (= res!256174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200116 mask!1025))))

(declare-fun _keys!709 () array!26633)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434921 (= lt!200116 (array!26634 (store (arr!12766 _keys!709) i!563 k!794) (size!13118 _keys!709)))))

(declare-fun b!434922 () Bool)

(declare-fun res!256178 () Bool)

(assert (=> b!434922 (=> (not res!256178) (not e!256997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434922 (= res!256178 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18723 () Bool)

(declare-fun mapRes!18723 () Bool)

(assert (=> mapIsEmpty!18723 mapRes!18723))

(declare-fun b!434923 () Bool)

(declare-fun e!256993 () Bool)

(declare-fun e!257001 () Bool)

(assert (=> b!434923 (= e!256993 (and e!257001 mapRes!18723))))

(declare-fun condMapEmpty!18723 () Bool)

(declare-datatypes ((V!16307 0))(
  ( (V!16308 (val!5745 Int)) )
))
(declare-datatypes ((ValueCell!5357 0))(
  ( (ValueCellFull!5357 (v!7992 V!16307)) (EmptyCell!5357) )
))
(declare-datatypes ((array!26635 0))(
  ( (array!26636 (arr!12767 (Array (_ BitVec 32) ValueCell!5357)) (size!13119 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26635)

(declare-fun mapDefault!18723 () ValueCell!5357)

