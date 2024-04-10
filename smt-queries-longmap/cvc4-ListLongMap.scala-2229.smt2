; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36840 () Bool)

(assert start!36840)

(declare-fun b_free!7967 () Bool)

(declare-fun b_next!7967 () Bool)

(assert (=> start!36840 (= b_free!7967 (not b_next!7967))))

(declare-fun tp!28617 () Bool)

(declare-fun b_and!15209 () Bool)

(assert (=> start!36840 (= tp!28617 b_and!15209)))

(declare-fun b!368396 () Bool)

(declare-fun res!206450 () Bool)

(declare-fun e!225313 () Bool)

(assert (=> b!368396 (=> (not res!206450) (not e!225313))))

(declare-datatypes ((array!21187 0))(
  ( (array!21188 (arr!10062 (Array (_ BitVec 32) (_ BitVec 64))) (size!10414 (_ BitVec 32))) )
))
(declare-fun lt!169524 () array!21187)

(declare-datatypes ((List!5600 0))(
  ( (Nil!5597) (Cons!5596 (h!6452 (_ BitVec 64)) (t!10750 List!5600)) )
))
(declare-fun arrayNoDuplicates!0 (array!21187 (_ BitVec 32) List!5600) Bool)

(assert (=> b!368396 (= res!206450 (arrayNoDuplicates!0 lt!169524 #b00000000000000000000000000000000 Nil!5597))))

(declare-fun b!368397 () Bool)

(declare-fun res!206454 () Bool)

(declare-fun e!225314 () Bool)

(assert (=> b!368397 (=> (not res!206454) (not e!225314))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12591 0))(
  ( (V!12592 (val!4352 Int)) )
))
(declare-datatypes ((ValueCell!3964 0))(
  ( (ValueCellFull!3964 (v!6549 V!12591)) (EmptyCell!3964) )
))
(declare-datatypes ((array!21189 0))(
  ( (array!21190 (arr!10063 (Array (_ BitVec 32) ValueCell!3964)) (size!10415 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21189)

(declare-fun _keys!658 () array!21187)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!368397 (= res!206454 (and (= (size!10415 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10414 _keys!658) (size!10415 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368398 () Bool)

(declare-fun e!225315 () Bool)

(declare-fun e!225316 () Bool)

(declare-fun mapRes!14487 () Bool)

(assert (=> b!368398 (= e!225315 (and e!225316 mapRes!14487))))

(declare-fun condMapEmpty!14487 () Bool)

(declare-fun mapDefault!14487 () ValueCell!3964)

