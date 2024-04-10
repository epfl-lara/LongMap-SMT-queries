; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38990 () Bool)

(assert start!38990)

(declare-fun b!408497 () Bool)

(declare-fun res!236361 () Bool)

(declare-fun e!245187 () Bool)

(assert (=> b!408497 (=> (not res!236361) (not e!245187))))

(declare-datatypes ((array!24693 0))(
  ( (array!24694 (arr!11796 (Array (_ BitVec 32) (_ BitVec 64))) (size!12148 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24693)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408497 (= res!236361 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408498 () Bool)

(declare-fun res!236366 () Bool)

(assert (=> b!408498 (=> (not res!236366) (not e!245187))))

(declare-datatypes ((List!6835 0))(
  ( (Nil!6832) (Cons!6831 (h!7687 (_ BitVec 64)) (t!12009 List!6835)) )
))
(declare-fun arrayNoDuplicates!0 (array!24693 (_ BitVec 32) List!6835) Bool)

(assert (=> b!408498 (= res!236366 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6832))))

(declare-fun mapIsEmpty!17235 () Bool)

(declare-fun mapRes!17235 () Bool)

(assert (=> mapIsEmpty!17235 mapRes!17235))

(declare-fun b!408499 () Bool)

(declare-fun e!245189 () Bool)

(declare-fun tp_is_empty!10409 () Bool)

(assert (=> b!408499 (= e!245189 tp_is_empty!10409)))

(declare-fun b!408500 () Bool)

(declare-fun res!236364 () Bool)

(assert (=> b!408500 (=> (not res!236364) (not e!245187))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24693 (_ BitVec 32)) Bool)

(assert (=> b!408500 (= res!236364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408501 () Bool)

(declare-fun e!245186 () Bool)

(assert (=> b!408501 (= e!245187 e!245186)))

(declare-fun res!236363 () Bool)

(assert (=> b!408501 (=> (not res!236363) (not e!245186))))

(declare-fun lt!188807 () array!24693)

(assert (=> b!408501 (= res!236363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188807 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408501 (= lt!188807 (array!24694 (store (arr!11796 _keys!709) i!563 k!794) (size!12148 _keys!709)))))

(declare-fun b!408502 () Bool)

(declare-fun e!245185 () Bool)

(assert (=> b!408502 (= e!245185 tp_is_empty!10409)))

(declare-fun b!408503 () Bool)

(declare-fun res!236359 () Bool)

(assert (=> b!408503 (=> (not res!236359) (not e!245187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408503 (= res!236359 (validKeyInArray!0 k!794))))

(declare-fun b!408504 () Bool)

(declare-fun e!245188 () Bool)

(assert (=> b!408504 (= e!245188 (and e!245185 mapRes!17235))))

(declare-fun condMapEmpty!17235 () Bool)

(declare-datatypes ((V!14983 0))(
  ( (V!14984 (val!5249 Int)) )
))
(declare-datatypes ((ValueCell!4861 0))(
  ( (ValueCellFull!4861 (v!7496 V!14983)) (EmptyCell!4861) )
))
(declare-datatypes ((array!24695 0))(
  ( (array!24696 (arr!11797 (Array (_ BitVec 32) ValueCell!4861)) (size!12149 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24695)

(declare-fun mapDefault!17235 () ValueCell!4861)

