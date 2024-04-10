; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7336 () Bool)

(assert start!7336)

(declare-fun b!47118 () Bool)

(declare-fun e!30134 () Bool)

(declare-fun e!30130 () Bool)

(declare-fun mapRes!2048 () Bool)

(assert (=> b!47118 (= e!30134 (and e!30130 mapRes!2048))))

(declare-fun condMapEmpty!2048 () Bool)

(declare-datatypes ((V!2415 0))(
  ( (V!2416 (val!1044 Int)) )
))
(declare-datatypes ((ValueCell!716 0))(
  ( (ValueCellFull!716 (v!2104 V!2415)) (EmptyCell!716) )
))
(declare-datatypes ((array!3083 0))(
  ( (array!3084 (arr!1480 (Array (_ BitVec 32) ValueCell!716)) (size!1702 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3083)

(declare-fun mapDefault!2048 () ValueCell!716)

