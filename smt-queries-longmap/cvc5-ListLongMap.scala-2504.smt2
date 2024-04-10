; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38842 () Bool)

(assert start!38842)

(declare-fun mapIsEmpty!17013 () Bool)

(declare-fun mapRes!17013 () Bool)

(assert (=> mapIsEmpty!17013 mapRes!17013))

(declare-fun mapNonEmpty!17013 () Bool)

(declare-fun tp!33132 () Bool)

(declare-fun e!243857 () Bool)

(assert (=> mapNonEmpty!17013 (= mapRes!17013 (and tp!33132 e!243857))))

(declare-datatypes ((V!14787 0))(
  ( (V!14788 (val!5175 Int)) )
))
(declare-datatypes ((ValueCell!4787 0))(
  ( (ValueCellFull!4787 (v!7422 V!14787)) (EmptyCell!4787) )
))
(declare-fun mapValue!17013 () ValueCell!4787)

(declare-datatypes ((array!24413 0))(
  ( (array!24414 (arr!11656 (Array (_ BitVec 32) ValueCell!4787)) (size!12008 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24413)

(declare-fun mapRest!17013 () (Array (_ BitVec 32) ValueCell!4787))

(declare-fun mapKey!17013 () (_ BitVec 32))

(assert (=> mapNonEmpty!17013 (= (arr!11656 _values!549) (store mapRest!17013 mapKey!17013 mapValue!17013))))

(declare-fun b!405612 () Bool)

(declare-fun res!234141 () Bool)

(declare-fun e!243853 () Bool)

(assert (=> b!405612 (=> (not res!234141) (not e!243853))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405612 (= res!234141 (validMask!0 mask!1025))))

(declare-fun b!405613 () Bool)

(declare-fun res!234142 () Bool)

(assert (=> b!405613 (=> (not res!234142) (not e!243853))))

(declare-datatypes ((array!24415 0))(
  ( (array!24416 (arr!11657 (Array (_ BitVec 32) (_ BitVec 64))) (size!12009 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24415)

(declare-datatypes ((List!6777 0))(
  ( (Nil!6774) (Cons!6773 (h!7629 (_ BitVec 64)) (t!11951 List!6777)) )
))
(declare-fun arrayNoDuplicates!0 (array!24415 (_ BitVec 32) List!6777) Bool)

(assert (=> b!405613 (= res!234142 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6774))))

(declare-fun b!405614 () Bool)

(declare-fun res!234146 () Bool)

(assert (=> b!405614 (=> (not res!234146) (not e!243853))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405614 (= res!234146 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405615 () Bool)

(declare-fun e!243856 () Bool)

(declare-fun e!243855 () Bool)

(assert (=> b!405615 (= e!243856 (and e!243855 mapRes!17013))))

(declare-fun condMapEmpty!17013 () Bool)

(declare-fun mapDefault!17013 () ValueCell!4787)

