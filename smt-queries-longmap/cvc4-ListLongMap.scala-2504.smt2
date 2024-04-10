; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38846 () Bool)

(assert start!38846)

(declare-fun b!405689 () Bool)

(declare-fun res!234200 () Bool)

(declare-fun e!243891 () Bool)

(assert (=> b!405689 (=> (not res!234200) (not e!243891))))

(declare-datatypes ((array!24421 0))(
  ( (array!24422 (arr!11660 (Array (_ BitVec 32) (_ BitVec 64))) (size!12012 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24421)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405689 (= res!234200 (or (= (select (arr!11660 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11660 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405690 () Bool)

(declare-fun e!243889 () Bool)

(assert (=> b!405690 (= e!243891 e!243889)))

(declare-fun res!234198 () Bool)

(assert (=> b!405690 (=> (not res!234198) (not e!243889))))

(declare-fun lt!188374 () array!24421)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24421 (_ BitVec 32)) Bool)

(assert (=> b!405690 (= res!234198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188374 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!405690 (= lt!188374 (array!24422 (store (arr!11660 _keys!709) i!563 k!794) (size!12012 _keys!709)))))

(declare-fun b!405691 () Bool)

(declare-fun res!234202 () Bool)

(assert (=> b!405691 (=> (not res!234202) (not e!243891))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14791 0))(
  ( (V!14792 (val!5177 Int)) )
))
(declare-datatypes ((ValueCell!4789 0))(
  ( (ValueCellFull!4789 (v!7424 V!14791)) (EmptyCell!4789) )
))
(declare-datatypes ((array!24423 0))(
  ( (array!24424 (arr!11661 (Array (_ BitVec 32) ValueCell!4789)) (size!12013 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24423)

(assert (=> b!405691 (= res!234202 (and (= (size!12013 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12012 _keys!709) (size!12013 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405692 () Bool)

(assert (=> b!405692 (= e!243889 false)))

(declare-fun lt!188375 () Bool)

(declare-datatypes ((List!6779 0))(
  ( (Nil!6776) (Cons!6775 (h!7631 (_ BitVec 64)) (t!11953 List!6779)) )
))
(declare-fun arrayNoDuplicates!0 (array!24421 (_ BitVec 32) List!6779) Bool)

(assert (=> b!405692 (= lt!188375 (arrayNoDuplicates!0 lt!188374 #b00000000000000000000000000000000 Nil!6776))))

(declare-fun b!405693 () Bool)

(declare-fun res!234199 () Bool)

(assert (=> b!405693 (=> (not res!234199) (not e!243891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405693 (= res!234199 (validKeyInArray!0 k!794))))

(declare-fun b!405694 () Bool)

(declare-fun res!234204 () Bool)

(assert (=> b!405694 (=> (not res!234204) (not e!243891))))

(assert (=> b!405694 (= res!234204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17019 () Bool)

(declare-fun mapRes!17019 () Bool)

(declare-fun tp!33138 () Bool)

(declare-fun e!243893 () Bool)

(assert (=> mapNonEmpty!17019 (= mapRes!17019 (and tp!33138 e!243893))))

(declare-fun mapValue!17019 () ValueCell!4789)

(declare-fun mapRest!17019 () (Array (_ BitVec 32) ValueCell!4789))

(declare-fun mapKey!17019 () (_ BitVec 32))

(assert (=> mapNonEmpty!17019 (= (arr!11661 _values!549) (store mapRest!17019 mapKey!17019 mapValue!17019))))

(declare-fun b!405695 () Bool)

(declare-fun res!234206 () Bool)

(assert (=> b!405695 (=> (not res!234206) (not e!243891))))

(declare-fun arrayContainsKey!0 (array!24421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405695 (= res!234206 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405696 () Bool)

(declare-fun res!234201 () Bool)

(assert (=> b!405696 (=> (not res!234201) (not e!243891))))

(assert (=> b!405696 (= res!234201 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6776))))

(declare-fun b!405698 () Bool)

(declare-fun e!243892 () Bool)

(declare-fun tp_is_empty!10265 () Bool)

(assert (=> b!405698 (= e!243892 tp_is_empty!10265)))

(declare-fun mapIsEmpty!17019 () Bool)

(assert (=> mapIsEmpty!17019 mapRes!17019))

(declare-fun b!405699 () Bool)

(declare-fun res!234207 () Bool)

(assert (=> b!405699 (=> (not res!234207) (not e!243891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405699 (= res!234207 (validMask!0 mask!1025))))

(declare-fun b!405700 () Bool)

(assert (=> b!405700 (= e!243893 tp_is_empty!10265)))

(declare-fun b!405701 () Bool)

(declare-fun e!243890 () Bool)

(assert (=> b!405701 (= e!243890 (and e!243892 mapRes!17019))))

(declare-fun condMapEmpty!17019 () Bool)

(declare-fun mapDefault!17019 () ValueCell!4789)

