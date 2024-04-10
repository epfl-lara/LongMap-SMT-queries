; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34232 () Bool)

(assert start!34232)

(declare-fun b_free!7255 () Bool)

(declare-fun b_next!7255 () Bool)

(assert (=> start!34232 (= b_free!7255 (not b_next!7255))))

(declare-fun tp!25299 () Bool)

(declare-fun b_and!14455 () Bool)

(assert (=> start!34232 (= tp!25299 b_and!14455)))

(declare-fun b!341553 () Bool)

(declare-datatypes ((Unit!10605 0))(
  ( (Unit!10606) )
))
(declare-fun e!209462 () Unit!10605)

(declare-fun Unit!10607 () Unit!10605)

(assert (=> b!341553 (= e!209462 Unit!10607)))

(declare-fun b!341554 () Bool)

(declare-fun res!188831 () Bool)

(declare-fun e!209459 () Bool)

(assert (=> b!341554 (=> (not res!188831) (not e!209459))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341554 (= res!188831 (validKeyInArray!0 k!1348))))

(declare-fun b!341556 () Bool)

(declare-fun e!209463 () Bool)

(assert (=> b!341556 (= e!209463 false)))

(declare-fun lt!161792 () Unit!10605)

(assert (=> b!341556 (= lt!161792 e!209462)))

(declare-fun c!52686 () Bool)

(declare-datatypes ((array!18007 0))(
  ( (array!18008 (arr!8524 (Array (_ BitVec 32) (_ BitVec 64))) (size!8876 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18007)

(declare-fun arrayContainsKey!0 (array!18007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341556 (= c!52686 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341557 () Bool)

(declare-fun e!209457 () Bool)

(declare-fun tp_is_empty!7207 () Bool)

(assert (=> b!341557 (= e!209457 tp_is_empty!7207)))

(declare-fun b!341558 () Bool)

(declare-fun e!209460 () Bool)

(declare-fun mapRes!12237 () Bool)

(assert (=> b!341558 (= e!209460 (and e!209457 mapRes!12237))))

(declare-fun condMapEmpty!12237 () Bool)

(declare-datatypes ((V!10587 0))(
  ( (V!10588 (val!3648 Int)) )
))
(declare-datatypes ((ValueCell!3260 0))(
  ( (ValueCellFull!3260 (v!5820 V!10587)) (EmptyCell!3260) )
))
(declare-datatypes ((array!18009 0))(
  ( (array!18010 (arr!8525 (Array (_ BitVec 32) ValueCell!3260)) (size!8877 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18009)

(declare-fun mapDefault!12237 () ValueCell!3260)

