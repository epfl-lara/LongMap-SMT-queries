; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106956 () Bool)

(assert start!106956)

(declare-fun b!1268374 () Bool)

(declare-fun res!844218 () Bool)

(declare-fun e!722734 () Bool)

(assert (=> b!1268374 (=> (not res!844218) (not e!722734))))

(declare-datatypes ((array!82586 0))(
  ( (array!82587 (arr!39831 (Array (_ BitVec 32) (_ BitVec 64))) (size!40367 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82586)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82586 (_ BitVec 32)) Bool)

(assert (=> b!1268374 (= res!844218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268375 () Bool)

(declare-fun e!722731 () Bool)

(declare-fun e!722732 () Bool)

(declare-fun mapRes!50563 () Bool)

(assert (=> b!1268375 (= e!722731 (and e!722732 mapRes!50563))))

(declare-fun condMapEmpty!50563 () Bool)

(declare-datatypes ((V!48735 0))(
  ( (V!48736 (val!16403 Int)) )
))
(declare-datatypes ((ValueCell!15475 0))(
  ( (ValueCellFull!15475 (v!19039 V!48735)) (EmptyCell!15475) )
))
(declare-datatypes ((array!82588 0))(
  ( (array!82589 (arr!39832 (Array (_ BitVec 32) ValueCell!15475)) (size!40368 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82588)

(declare-fun mapDefault!50563 () ValueCell!15475)

