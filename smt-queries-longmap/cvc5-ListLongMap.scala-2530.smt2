; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38998 () Bool)

(assert start!38998)

(declare-fun b!408653 () Bool)

(declare-fun res!236478 () Bool)

(declare-fun e!245262 () Bool)

(assert (=> b!408653 (=> (not res!236478) (not e!245262))))

(declare-datatypes ((array!24709 0))(
  ( (array!24710 (arr!11804 (Array (_ BitVec 32) (_ BitVec 64))) (size!12156 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24709)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408653 (= res!236478 (or (= (select (arr!11804 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11804 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408654 () Bool)

(declare-fun e!245260 () Bool)

(assert (=> b!408654 (= e!245262 e!245260)))

(declare-fun res!236480 () Bool)

(assert (=> b!408654 (=> (not res!236480) (not e!245260))))

(declare-fun lt!188830 () array!24709)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24709 (_ BitVec 32)) Bool)

(assert (=> b!408654 (= res!236480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188830 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!408654 (= lt!188830 (array!24710 (store (arr!11804 _keys!709) i!563 k!794) (size!12156 _keys!709)))))

(declare-fun mapIsEmpty!17247 () Bool)

(declare-fun mapRes!17247 () Bool)

(assert (=> mapIsEmpty!17247 mapRes!17247))

(declare-fun b!408655 () Bool)

(declare-fun res!236479 () Bool)

(assert (=> b!408655 (=> (not res!236479) (not e!245262))))

(assert (=> b!408655 (= res!236479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!236483 () Bool)

(assert (=> start!38998 (=> (not res!236483) (not e!245262))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38998 (= res!236483 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12156 _keys!709))))))

(assert (=> start!38998 e!245262))

(assert (=> start!38998 true))

(declare-datatypes ((V!14995 0))(
  ( (V!14996 (val!5253 Int)) )
))
(declare-datatypes ((ValueCell!4865 0))(
  ( (ValueCellFull!4865 (v!7500 V!14995)) (EmptyCell!4865) )
))
(declare-datatypes ((array!24711 0))(
  ( (array!24712 (arr!11805 (Array (_ BitVec 32) ValueCell!4865)) (size!12157 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24711)

(declare-fun e!245258 () Bool)

(declare-fun array_inv!8612 (array!24711) Bool)

(assert (=> start!38998 (and (array_inv!8612 _values!549) e!245258)))

(declare-fun array_inv!8613 (array!24709) Bool)

(assert (=> start!38998 (array_inv!8613 _keys!709)))

(declare-fun b!408656 () Bool)

(declare-fun res!236484 () Bool)

(assert (=> b!408656 (=> (not res!236484) (not e!245262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408656 (= res!236484 (validKeyInArray!0 k!794))))

(declare-fun b!408657 () Bool)

(declare-fun res!236481 () Bool)

(assert (=> b!408657 (=> (not res!236481) (not e!245262))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408657 (= res!236481 (and (= (size!12157 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12156 _keys!709) (size!12157 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408658 () Bool)

(declare-fun res!236487 () Bool)

(assert (=> b!408658 (=> (not res!236487) (not e!245262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408658 (= res!236487 (validMask!0 mask!1025))))

(declare-fun b!408659 () Bool)

(declare-fun res!236485 () Bool)

(assert (=> b!408659 (=> (not res!236485) (not e!245262))))

(assert (=> b!408659 (= res!236485 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12156 _keys!709))))))

(declare-fun b!408660 () Bool)

(declare-fun res!236486 () Bool)

(assert (=> b!408660 (=> (not res!236486) (not e!245262))))

(declare-fun arrayContainsKey!0 (array!24709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408660 (= res!236486 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17247 () Bool)

(declare-fun tp!33366 () Bool)

(declare-fun e!245261 () Bool)

(assert (=> mapNonEmpty!17247 (= mapRes!17247 (and tp!33366 e!245261))))

(declare-fun mapKey!17247 () (_ BitVec 32))

(declare-fun mapRest!17247 () (Array (_ BitVec 32) ValueCell!4865))

(declare-fun mapValue!17247 () ValueCell!4865)

(assert (=> mapNonEmpty!17247 (= (arr!11805 _values!549) (store mapRest!17247 mapKey!17247 mapValue!17247))))

(declare-fun b!408661 () Bool)

(declare-fun e!245257 () Bool)

(assert (=> b!408661 (= e!245258 (and e!245257 mapRes!17247))))

(declare-fun condMapEmpty!17247 () Bool)

(declare-fun mapDefault!17247 () ValueCell!4865)

