; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38354 () Bool)

(assert start!38354)

(declare-fun b!395559 () Bool)

(declare-fun res!226783 () Bool)

(declare-fun e!239479 () Bool)

(assert (=> b!395559 (=> (not res!226783) (not e!239479))))

(declare-datatypes ((array!23549 0))(
  ( (array!23550 (arr!11227 (Array (_ BitVec 32) (_ BitVec 64))) (size!11579 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23549)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23549 (_ BitVec 32)) Bool)

(assert (=> b!395559 (= res!226783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395560 () Bool)

(declare-fun res!226780 () Bool)

(assert (=> b!395560 (=> (not res!226780) (not e!239479))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14199 0))(
  ( (V!14200 (val!4955 Int)) )
))
(declare-datatypes ((ValueCell!4567 0))(
  ( (ValueCellFull!4567 (v!7201 V!14199)) (EmptyCell!4567) )
))
(declare-datatypes ((array!23551 0))(
  ( (array!23552 (arr!11228 (Array (_ BitVec 32) ValueCell!4567)) (size!11580 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23551)

(assert (=> b!395560 (= res!226780 (and (= (size!11580 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11579 _keys!709) (size!11580 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395561 () Bool)

(declare-fun res!226781 () Bool)

(assert (=> b!395561 (=> (not res!226781) (not e!239479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395561 (= res!226781 (validMask!0 mask!1025))))

(declare-fun b!395562 () Bool)

(declare-fun e!239478 () Bool)

(declare-fun e!239482 () Bool)

(declare-fun mapRes!16344 () Bool)

(assert (=> b!395562 (= e!239478 (and e!239482 mapRes!16344))))

(declare-fun condMapEmpty!16344 () Bool)

(declare-fun mapDefault!16344 () ValueCell!4567)

