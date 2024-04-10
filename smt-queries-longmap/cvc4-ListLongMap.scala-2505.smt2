; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38852 () Bool)

(assert start!38852)

(declare-fun res!234290 () Bool)

(declare-fun e!243948 () Bool)

(assert (=> start!38852 (=> (not res!234290) (not e!243948))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24433 0))(
  ( (array!24434 (arr!11666 (Array (_ BitVec 32) (_ BitVec 64))) (size!12018 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24433)

(assert (=> start!38852 (= res!234290 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12018 _keys!709))))))

(assert (=> start!38852 e!243948))

(assert (=> start!38852 true))

(declare-datatypes ((V!14799 0))(
  ( (V!14800 (val!5180 Int)) )
))
(declare-datatypes ((ValueCell!4792 0))(
  ( (ValueCellFull!4792 (v!7427 V!14799)) (EmptyCell!4792) )
))
(declare-datatypes ((array!24435 0))(
  ( (array!24436 (arr!11667 (Array (_ BitVec 32) ValueCell!4792)) (size!12019 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24435)

(declare-fun e!243945 () Bool)

(declare-fun array_inv!8524 (array!24435) Bool)

(assert (=> start!38852 (and (array_inv!8524 _values!549) e!243945)))

(declare-fun array_inv!8525 (array!24433) Bool)

(assert (=> start!38852 (array_inv!8525 _keys!709)))

(declare-fun b!405806 () Bool)

(declare-fun res!234294 () Bool)

(assert (=> b!405806 (=> (not res!234294) (not e!243948))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405806 (= res!234294 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405807 () Bool)

(declare-fun e!243946 () Bool)

(assert (=> b!405807 (= e!243948 e!243946)))

(declare-fun res!234292 () Bool)

(assert (=> b!405807 (=> (not res!234292) (not e!243946))))

(declare-fun lt!188392 () array!24433)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24433 (_ BitVec 32)) Bool)

(assert (=> b!405807 (= res!234292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188392 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405807 (= lt!188392 (array!24434 (store (arr!11666 _keys!709) i!563 k!794) (size!12018 _keys!709)))))

(declare-fun b!405808 () Bool)

(declare-fun res!234291 () Bool)

(assert (=> b!405808 (=> (not res!234291) (not e!243948))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405808 (= res!234291 (and (= (size!12019 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12018 _keys!709) (size!12019 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405809 () Bool)

(declare-fun res!234288 () Bool)

(assert (=> b!405809 (=> (not res!234288) (not e!243948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405809 (= res!234288 (validMask!0 mask!1025))))

(declare-fun b!405810 () Bool)

(declare-fun e!243943 () Bool)

(declare-fun tp_is_empty!10271 () Bool)

(assert (=> b!405810 (= e!243943 tp_is_empty!10271)))

(declare-fun b!405811 () Bool)

(declare-fun res!234295 () Bool)

(assert (=> b!405811 (=> (not res!234295) (not e!243948))))

(assert (=> b!405811 (= res!234295 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12018 _keys!709))))))

(declare-fun b!405812 () Bool)

(declare-fun e!243947 () Bool)

(assert (=> b!405812 (= e!243947 tp_is_empty!10271)))

(declare-fun b!405813 () Bool)

(declare-fun mapRes!17028 () Bool)

(assert (=> b!405813 (= e!243945 (and e!243947 mapRes!17028))))

(declare-fun condMapEmpty!17028 () Bool)

(declare-fun mapDefault!17028 () ValueCell!4792)

