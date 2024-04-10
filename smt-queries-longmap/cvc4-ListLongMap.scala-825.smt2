; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20050 () Bool)

(assert start!20050)

(declare-fun b!196341 () Bool)

(declare-fun e!129296 () Bool)

(declare-fun e!129299 () Bool)

(declare-fun mapRes!7916 () Bool)

(assert (=> b!196341 (= e!129296 (and e!129299 mapRes!7916))))

(declare-fun condMapEmpty!7916 () Bool)

(declare-datatypes ((V!5733 0))(
  ( (V!5734 (val!2327 Int)) )
))
(declare-datatypes ((ValueCell!1939 0))(
  ( (ValueCellFull!1939 (v!4297 V!5733)) (EmptyCell!1939) )
))
(declare-datatypes ((array!8389 0))(
  ( (array!8390 (arr!3945 (Array (_ BitVec 32) ValueCell!1939)) (size!4270 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8389)

(declare-fun mapDefault!7916 () ValueCell!1939)

