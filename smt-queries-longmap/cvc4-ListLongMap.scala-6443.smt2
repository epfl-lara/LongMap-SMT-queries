; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82502 () Bool)

(assert start!82502)

(declare-fun b!961496 () Bool)

(declare-fun res!643503 () Bool)

(declare-fun e!542147 () Bool)

(assert (=> b!961496 (=> (not res!643503) (not e!542147))))

(declare-datatypes ((array!58971 0))(
  ( (array!58972 (arr!28354 (Array (_ BitVec 32) (_ BitVec 64))) (size!28833 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58971)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58971 (_ BitVec 32)) Bool)

(assert (=> b!961496 (= res!643503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961497 () Bool)

(declare-fun e!542148 () Bool)

(declare-fun e!542146 () Bool)

(declare-fun mapRes!34150 () Bool)

(assert (=> b!961497 (= e!542148 (and e!542146 mapRes!34150))))

(declare-fun condMapEmpty!34150 () Bool)

(declare-datatypes ((V!33565 0))(
  ( (V!33566 (val!10769 Int)) )
))
(declare-datatypes ((ValueCell!10237 0))(
  ( (ValueCellFull!10237 (v!13327 V!33565)) (EmptyCell!10237) )
))
(declare-datatypes ((array!58973 0))(
  ( (array!58974 (arr!28355 (Array (_ BitVec 32) ValueCell!10237)) (size!28834 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58973)

(declare-fun mapDefault!34150 () ValueCell!10237)

