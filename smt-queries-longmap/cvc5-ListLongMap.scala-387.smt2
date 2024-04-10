; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7318 () Bool)

(assert start!7318)

(declare-datatypes ((array!3061 0))(
  ( (array!3062 (arr!1470 (Array (_ BitVec 32) (_ BitVec 64))) (size!1692 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3061)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun b!47034 () Bool)

(declare-datatypes ((V!2399 0))(
  ( (V!2400 (val!1038 Int)) )
))
(declare-datatypes ((ValueCell!710 0))(
  ( (ValueCellFull!710 (v!2098 V!2399)) (EmptyCell!710) )
))
(declare-datatypes ((array!3063 0))(
  ( (array!3064 (arr!1471 (Array (_ BitVec 32) ValueCell!710)) (size!1693 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3063)

(declare-fun e!30035 () Bool)

(assert (=> b!47034 (= e!30035 (and (= (size!1693 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1692 _keys!1940) (size!1693 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (not (= (size!1692 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)))))))

(declare-fun b!47035 () Bool)

(declare-fun e!30038 () Bool)

(declare-fun tp_is_empty!1999 () Bool)

(assert (=> b!47035 (= e!30038 tp_is_empty!1999)))

(declare-fun b!47036 () Bool)

(declare-fun e!30036 () Bool)

(declare-fun e!30034 () Bool)

(declare-fun mapRes!2027 () Bool)

(assert (=> b!47036 (= e!30036 (and e!30034 mapRes!2027))))

(declare-fun condMapEmpty!2027 () Bool)

(declare-fun mapDefault!2027 () ValueCell!710)

