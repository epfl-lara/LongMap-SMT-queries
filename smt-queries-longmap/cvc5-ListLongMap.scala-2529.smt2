; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38992 () Bool)

(assert start!38992)

(declare-fun mapNonEmpty!17238 () Bool)

(declare-fun mapRes!17238 () Bool)

(declare-fun tp!33357 () Bool)

(declare-fun e!245206 () Bool)

(assert (=> mapNonEmpty!17238 (= mapRes!17238 (and tp!33357 e!245206))))

(declare-datatypes ((V!14987 0))(
  ( (V!14988 (val!5250 Int)) )
))
(declare-datatypes ((ValueCell!4862 0))(
  ( (ValueCellFull!4862 (v!7497 V!14987)) (EmptyCell!4862) )
))
(declare-fun mapRest!17238 () (Array (_ BitVec 32) ValueCell!4862))

(declare-datatypes ((array!24697 0))(
  ( (array!24698 (arr!11798 (Array (_ BitVec 32) ValueCell!4862)) (size!12150 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24697)

(declare-fun mapValue!17238 () ValueCell!4862)

(declare-fun mapKey!17238 () (_ BitVec 32))

(assert (=> mapNonEmpty!17238 (= (arr!11798 _values!549) (store mapRest!17238 mapKey!17238 mapValue!17238))))

(declare-fun b!408536 () Bool)

(declare-fun res!236392 () Bool)

(declare-fun e!245205 () Bool)

(assert (=> b!408536 (=> (not res!236392) (not e!245205))))

(declare-datatypes ((array!24699 0))(
  ( (array!24700 (arr!11799 (Array (_ BitVec 32) (_ BitVec 64))) (size!12151 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24699)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408536 (= res!236392 (or (= (select (arr!11799 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11799 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408537 () Bool)

(declare-fun e!245207 () Bool)

(assert (=> b!408537 (= e!245207 false)))

(declare-fun lt!188813 () Bool)

(declare-fun lt!188812 () array!24699)

(declare-datatypes ((List!6836 0))(
  ( (Nil!6833) (Cons!6832 (h!7688 (_ BitVec 64)) (t!12010 List!6836)) )
))
(declare-fun arrayNoDuplicates!0 (array!24699 (_ BitVec 32) List!6836) Bool)

(assert (=> b!408537 (= lt!188813 (arrayNoDuplicates!0 lt!188812 #b00000000000000000000000000000000 Nil!6833))))

(declare-fun b!408538 () Bool)

(declare-fun e!245203 () Bool)

(declare-fun tp_is_empty!10411 () Bool)

(assert (=> b!408538 (= e!245203 tp_is_empty!10411)))

(declare-fun b!408539 () Bool)

(declare-fun res!236394 () Bool)

(assert (=> b!408539 (=> (not res!236394) (not e!245205))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408539 (= res!236394 (validKeyInArray!0 k!794))))

(declare-fun res!236397 () Bool)

(assert (=> start!38992 (=> (not res!236397) (not e!245205))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38992 (= res!236397 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12151 _keys!709))))))

(assert (=> start!38992 e!245205))

(assert (=> start!38992 true))

(declare-fun e!245204 () Bool)

(declare-fun array_inv!8606 (array!24697) Bool)

(assert (=> start!38992 (and (array_inv!8606 _values!549) e!245204)))

(declare-fun array_inv!8607 (array!24699) Bool)

(assert (=> start!38992 (array_inv!8607 _keys!709)))

(declare-fun b!408540 () Bool)

(assert (=> b!408540 (= e!245206 tp_is_empty!10411)))

(declare-fun b!408541 () Bool)

(declare-fun res!236396 () Bool)

(assert (=> b!408541 (=> (not res!236396) (not e!245205))))

(assert (=> b!408541 (= res!236396 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12151 _keys!709))))))

(declare-fun b!408542 () Bool)

(declare-fun res!236390 () Bool)

(assert (=> b!408542 (=> (not res!236390) (not e!245205))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408542 (= res!236390 (and (= (size!12150 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12151 _keys!709) (size!12150 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408543 () Bool)

(declare-fun res!236393 () Bool)

(assert (=> b!408543 (=> (not res!236393) (not e!245205))))

(declare-fun arrayContainsKey!0 (array!24699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408543 (= res!236393 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408544 () Bool)

(declare-fun res!236388 () Bool)

(assert (=> b!408544 (=> (not res!236388) (not e!245205))))

(assert (=> b!408544 (= res!236388 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6833))))

(declare-fun mapIsEmpty!17238 () Bool)

(assert (=> mapIsEmpty!17238 mapRes!17238))

(declare-fun b!408545 () Bool)

(declare-fun res!236389 () Bool)

(assert (=> b!408545 (=> (not res!236389) (not e!245205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408545 (= res!236389 (validMask!0 mask!1025))))

(declare-fun b!408546 () Bool)

(declare-fun res!236391 () Bool)

(assert (=> b!408546 (=> (not res!236391) (not e!245205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24699 (_ BitVec 32)) Bool)

(assert (=> b!408546 (= res!236391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408547 () Bool)

(assert (=> b!408547 (= e!245205 e!245207)))

(declare-fun res!236395 () Bool)

(assert (=> b!408547 (=> (not res!236395) (not e!245207))))

(assert (=> b!408547 (= res!236395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188812 mask!1025))))

(assert (=> b!408547 (= lt!188812 (array!24700 (store (arr!11799 _keys!709) i!563 k!794) (size!12151 _keys!709)))))

(declare-fun b!408548 () Bool)

(assert (=> b!408548 (= e!245204 (and e!245203 mapRes!17238))))

(declare-fun condMapEmpty!17238 () Bool)

(declare-fun mapDefault!17238 () ValueCell!4862)

