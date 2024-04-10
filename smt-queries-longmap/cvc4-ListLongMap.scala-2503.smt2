; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38840 () Bool)

(assert start!38840)

(declare-fun b!405572 () Bool)

(declare-fun res!234108 () Bool)

(declare-fun e!243836 () Bool)

(assert (=> b!405572 (=> (not res!234108) (not e!243836))))

(declare-datatypes ((array!24409 0))(
  ( (array!24410 (arr!11654 (Array (_ BitVec 32) (_ BitVec 64))) (size!12006 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24409)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24409 (_ BitVec 32)) Bool)

(assert (=> b!405572 (= res!234108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405573 () Bool)

(declare-fun res!234117 () Bool)

(assert (=> b!405573 (=> (not res!234117) (not e!243836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405573 (= res!234117 (validMask!0 mask!1025))))

(declare-fun b!405574 () Bool)

(declare-fun e!243835 () Bool)

(assert (=> b!405574 (= e!243835 false)))

(declare-fun lt!188356 () Bool)

(declare-fun lt!188357 () array!24409)

(declare-datatypes ((List!6776 0))(
  ( (Nil!6773) (Cons!6772 (h!7628 (_ BitVec 64)) (t!11950 List!6776)) )
))
(declare-fun arrayNoDuplicates!0 (array!24409 (_ BitVec 32) List!6776) Bool)

(assert (=> b!405574 (= lt!188356 (arrayNoDuplicates!0 lt!188357 #b00000000000000000000000000000000 Nil!6773))))

(declare-fun b!405575 () Bool)

(declare-fun res!234110 () Bool)

(assert (=> b!405575 (=> (not res!234110) (not e!243836))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14783 0))(
  ( (V!14784 (val!5174 Int)) )
))
(declare-datatypes ((ValueCell!4786 0))(
  ( (ValueCellFull!4786 (v!7421 V!14783)) (EmptyCell!4786) )
))
(declare-datatypes ((array!24411 0))(
  ( (array!24412 (arr!11655 (Array (_ BitVec 32) ValueCell!4786)) (size!12007 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24411)

(assert (=> b!405575 (= res!234110 (and (= (size!12007 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12006 _keys!709) (size!12007 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405576 () Bool)

(declare-fun e!243839 () Bool)

(declare-fun tp_is_empty!10259 () Bool)

(assert (=> b!405576 (= e!243839 tp_is_empty!10259)))

(declare-fun mapNonEmpty!17010 () Bool)

(declare-fun mapRes!17010 () Bool)

(declare-fun tp!33129 () Bool)

(assert (=> mapNonEmpty!17010 (= mapRes!17010 (and tp!33129 e!243839))))

(declare-fun mapRest!17010 () (Array (_ BitVec 32) ValueCell!4786))

(declare-fun mapValue!17010 () ValueCell!4786)

(declare-fun mapKey!17010 () (_ BitVec 32))

(assert (=> mapNonEmpty!17010 (= (arr!11655 _values!549) (store mapRest!17010 mapKey!17010 mapValue!17010))))

(declare-fun res!234115 () Bool)

(assert (=> start!38840 (=> (not res!234115) (not e!243836))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38840 (= res!234115 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12006 _keys!709))))))

(assert (=> start!38840 e!243836))

(assert (=> start!38840 true))

(declare-fun e!243838 () Bool)

(declare-fun array_inv!8518 (array!24411) Bool)

(assert (=> start!38840 (and (array_inv!8518 _values!549) e!243838)))

(declare-fun array_inv!8519 (array!24409) Bool)

(assert (=> start!38840 (array_inv!8519 _keys!709)))

(declare-fun b!405577 () Bool)

(declare-fun res!234116 () Bool)

(assert (=> b!405577 (=> (not res!234116) (not e!243836))))

(assert (=> b!405577 (= res!234116 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6773))))

(declare-fun b!405578 () Bool)

(declare-fun res!234114 () Bool)

(assert (=> b!405578 (=> (not res!234114) (not e!243836))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405578 (= res!234114 (or (= (select (arr!11654 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11654 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405579 () Bool)

(declare-fun res!234113 () Bool)

(assert (=> b!405579 (=> (not res!234113) (not e!243836))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405579 (= res!234113 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17010 () Bool)

(assert (=> mapIsEmpty!17010 mapRes!17010))

(declare-fun b!405580 () Bool)

(declare-fun e!243837 () Bool)

(assert (=> b!405580 (= e!243837 tp_is_empty!10259)))

(declare-fun b!405581 () Bool)

(declare-fun res!234111 () Bool)

(assert (=> b!405581 (=> (not res!234111) (not e!243836))))

(assert (=> b!405581 (= res!234111 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12006 _keys!709))))))

(declare-fun b!405582 () Bool)

(assert (=> b!405582 (= e!243838 (and e!243837 mapRes!17010))))

(declare-fun condMapEmpty!17010 () Bool)

(declare-fun mapDefault!17010 () ValueCell!4786)

