; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38800 () Bool)

(assert start!38800)

(declare-fun res!233513 () Bool)

(declare-fun e!243477 () Bool)

(assert (=> start!38800 (=> (not res!233513) (not e!243477))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24333 0))(
  ( (array!24334 (arr!11616 (Array (_ BitVec 32) (_ BitVec 64))) (size!11968 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24333)

(assert (=> start!38800 (= res!233513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11968 _keys!709))))))

(assert (=> start!38800 e!243477))

(assert (=> start!38800 true))

(declare-datatypes ((V!14731 0))(
  ( (V!14732 (val!5154 Int)) )
))
(declare-datatypes ((ValueCell!4766 0))(
  ( (ValueCellFull!4766 (v!7401 V!14731)) (EmptyCell!4766) )
))
(declare-datatypes ((array!24335 0))(
  ( (array!24336 (arr!11617 (Array (_ BitVec 32) ValueCell!4766)) (size!11969 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24335)

(declare-fun e!243479 () Bool)

(declare-fun array_inv!8494 (array!24335) Bool)

(assert (=> start!38800 (and (array_inv!8494 _values!549) e!243479)))

(declare-fun array_inv!8495 (array!24333) Bool)

(assert (=> start!38800 (array_inv!8495 _keys!709)))

(declare-fun b!404792 () Bool)

(declare-fun e!243475 () Bool)

(assert (=> b!404792 (= e!243475 false)))

(declare-fun lt!188237 () Bool)

(declare-fun lt!188236 () array!24333)

(declare-datatypes ((List!6761 0))(
  ( (Nil!6758) (Cons!6757 (h!7613 (_ BitVec 64)) (t!11935 List!6761)) )
))
(declare-fun arrayNoDuplicates!0 (array!24333 (_ BitVec 32) List!6761) Bool)

(assert (=> b!404792 (= lt!188237 (arrayNoDuplicates!0 lt!188236 #b00000000000000000000000000000000 Nil!6758))))

(declare-fun b!404793 () Bool)

(declare-fun res!233517 () Bool)

(assert (=> b!404793 (=> (not res!233517) (not e!243477))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404793 (= res!233517 (or (= (select (arr!11616 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11616 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404794 () Bool)

(declare-fun res!233510 () Bool)

(assert (=> b!404794 (=> (not res!233510) (not e!243477))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404794 (= res!233510 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404795 () Bool)

(declare-fun res!233511 () Bool)

(assert (=> b!404795 (=> (not res!233511) (not e!243477))))

(assert (=> b!404795 (= res!233511 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6758))))

(declare-fun b!404796 () Bool)

(declare-fun res!233515 () Bool)

(assert (=> b!404796 (=> (not res!233515) (not e!243477))))

(assert (=> b!404796 (= res!233515 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11968 _keys!709))))))

(declare-fun b!404797 () Bool)

(declare-fun e!243478 () Bool)

(declare-fun tp_is_empty!10219 () Bool)

(assert (=> b!404797 (= e!243478 tp_is_empty!10219)))

(declare-fun b!404798 () Bool)

(declare-fun res!233508 () Bool)

(assert (=> b!404798 (=> (not res!233508) (not e!243477))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404798 (= res!233508 (validMask!0 mask!1025))))

(declare-fun b!404799 () Bool)

(declare-fun res!233516 () Bool)

(assert (=> b!404799 (=> (not res!233516) (not e!243477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404799 (= res!233516 (validKeyInArray!0 k!794))))

(declare-fun b!404800 () Bool)

(assert (=> b!404800 (= e!243477 e!243475)))

(declare-fun res!233509 () Bool)

(assert (=> b!404800 (=> (not res!233509) (not e!243475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24333 (_ BitVec 32)) Bool)

(assert (=> b!404800 (= res!233509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188236 mask!1025))))

(assert (=> b!404800 (= lt!188236 (array!24334 (store (arr!11616 _keys!709) i!563 k!794) (size!11968 _keys!709)))))

(declare-fun b!404801 () Bool)

(declare-fun e!243480 () Bool)

(declare-fun mapRes!16950 () Bool)

(assert (=> b!404801 (= e!243479 (and e!243480 mapRes!16950))))

(declare-fun condMapEmpty!16950 () Bool)

(declare-fun mapDefault!16950 () ValueCell!4766)

