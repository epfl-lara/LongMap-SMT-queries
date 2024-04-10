; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34770 () Bool)

(assert start!34770)

(declare-fun b_free!7555 () Bool)

(declare-fun b_next!7555 () Bool)

(assert (=> start!34770 (= b_free!7555 (not b_next!7555))))

(declare-fun tp!26231 () Bool)

(declare-fun b_and!14777 () Bool)

(assert (=> start!34770 (= tp!26231 b_and!14777)))

(declare-fun b!347717 () Bool)

(declare-fun e!213057 () Bool)

(declare-fun e!213059 () Bool)

(assert (=> b!347717 (= e!213057 e!213059)))

(declare-fun res!192493 () Bool)

(assert (=> b!347717 (=> (not res!192493) (not e!213059))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18603 0))(
  ( (array!18604 (arr!8811 (Array (_ BitVec 32) (_ BitVec 64))) (size!9163 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18603)

(declare-datatypes ((SeekEntryResult!3399 0))(
  ( (MissingZero!3399 (index!15775 (_ BitVec 32))) (Found!3399 (index!15776 (_ BitVec 32))) (Intermediate!3399 (undefined!4211 Bool) (index!15777 (_ BitVec 32)) (x!34639 (_ BitVec 32))) (Undefined!3399) (MissingVacant!3399 (index!15778 (_ BitVec 32))) )
))
(declare-fun lt!163679 () SeekEntryResult!3399)

(assert (=> b!347717 (= res!192493 (and (is-Found!3399 lt!163679) (= (select (arr!8811 _keys!1895) (index!15776 lt!163679)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18603 (_ BitVec 32)) SeekEntryResult!3399)

(assert (=> b!347717 (= lt!163679 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347718 () Bool)

(declare-fun e!213053 () Bool)

(declare-fun e!213055 () Bool)

(declare-fun mapRes!12720 () Bool)

(assert (=> b!347718 (= e!213053 (and e!213055 mapRes!12720))))

(declare-fun condMapEmpty!12720 () Bool)

(declare-datatypes ((V!10987 0))(
  ( (V!10988 (val!3798 Int)) )
))
(declare-datatypes ((ValueCell!3410 0))(
  ( (ValueCellFull!3410 (v!5981 V!10987)) (EmptyCell!3410) )
))
(declare-datatypes ((array!18605 0))(
  ( (array!18606 (arr!8812 (Array (_ BitVec 32) ValueCell!3410)) (size!9164 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18605)

(declare-fun mapDefault!12720 () ValueCell!3410)

