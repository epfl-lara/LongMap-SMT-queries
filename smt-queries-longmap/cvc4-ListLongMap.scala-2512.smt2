; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38894 () Bool)

(assert start!38894)

(declare-fun b!406626 () Bool)

(declare-fun res!234922 () Bool)

(declare-fun e!244322 () Bool)

(assert (=> b!406626 (=> (not res!234922) (not e!244322))))

(declare-datatypes ((array!24515 0))(
  ( (array!24516 (arr!11707 (Array (_ BitVec 32) (_ BitVec 64))) (size!12059 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24515)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24515 (_ BitVec 32)) Bool)

(assert (=> b!406626 (= res!234922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406627 () Bool)

(declare-fun e!244325 () Bool)

(declare-fun tp_is_empty!10313 () Bool)

(assert (=> b!406627 (= e!244325 tp_is_empty!10313)))

(declare-fun b!406628 () Bool)

(declare-fun e!244324 () Bool)

(assert (=> b!406628 (= e!244324 false)))

(declare-fun lt!188518 () Bool)

(declare-fun lt!188519 () array!24515)

(declare-datatypes ((List!6797 0))(
  ( (Nil!6794) (Cons!6793 (h!7649 (_ BitVec 64)) (t!11971 List!6797)) )
))
(declare-fun arrayNoDuplicates!0 (array!24515 (_ BitVec 32) List!6797) Bool)

(assert (=> b!406628 (= lt!188518 (arrayNoDuplicates!0 lt!188519 #b00000000000000000000000000000000 Nil!6794))))

(declare-fun b!406629 () Bool)

(declare-fun res!234926 () Bool)

(assert (=> b!406629 (=> (not res!234926) (not e!244322))))

(assert (=> b!406629 (= res!234926 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6794))))

(declare-fun b!406630 () Bool)

(assert (=> b!406630 (= e!244322 e!244324)))

(declare-fun res!234923 () Bool)

(assert (=> b!406630 (=> (not res!234923) (not e!244324))))

(assert (=> b!406630 (= res!234923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188519 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406630 (= lt!188519 (array!24516 (store (arr!11707 _keys!709) i!563 k!794) (size!12059 _keys!709)))))

(declare-fun b!406631 () Bool)

(declare-fun e!244321 () Bool)

(assert (=> b!406631 (= e!244321 tp_is_empty!10313)))

(declare-fun b!406632 () Bool)

(declare-fun res!234925 () Bool)

(assert (=> b!406632 (=> (not res!234925) (not e!244322))))

(assert (=> b!406632 (= res!234925 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12059 _keys!709))))))

(declare-fun b!406633 () Bool)

(declare-fun res!234921 () Bool)

(assert (=> b!406633 (=> (not res!234921) (not e!244322))))

(declare-fun arrayContainsKey!0 (array!24515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406633 (= res!234921 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!406634 () Bool)

(declare-fun e!244326 () Bool)

(declare-fun mapRes!17091 () Bool)

(assert (=> b!406634 (= e!244326 (and e!244325 mapRes!17091))))

(declare-fun condMapEmpty!17091 () Bool)

(declare-datatypes ((V!14855 0))(
  ( (V!14856 (val!5201 Int)) )
))
(declare-datatypes ((ValueCell!4813 0))(
  ( (ValueCellFull!4813 (v!7448 V!14855)) (EmptyCell!4813) )
))
(declare-datatypes ((array!24517 0))(
  ( (array!24518 (arr!11708 (Array (_ BitVec 32) ValueCell!4813)) (size!12060 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24517)

(declare-fun mapDefault!17091 () ValueCell!4813)

