; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96352 () Bool)

(assert start!96352)

(declare-fun b!1095001 () Bool)

(declare-fun res!730746 () Bool)

(declare-fun e!625160 () Bool)

(assert (=> b!1095001 (=> (not res!730746) (not e!625160))))

(declare-datatypes ((array!70905 0))(
  ( (array!70906 (arr!34125 (Array (_ BitVec 32) (_ BitVec 64))) (size!34661 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70905)

(assert (=> b!1095001 (= res!730746 (bvslt (size!34661 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun res!730742 () Bool)

(declare-fun e!625157 () Bool)

(assert (=> start!96352 (=> (not res!730742) (not e!625157))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96352 (= res!730742 (validMask!0 mask!1414))))

(assert (=> start!96352 e!625157))

(assert (=> start!96352 true))

(declare-fun array_inv!26298 (array!70905) Bool)

(assert (=> start!96352 (array_inv!26298 _keys!1070)))

(declare-datatypes ((V!41121 0))(
  ( (V!41122 (val!13554 Int)) )
))
(declare-datatypes ((ValueCell!12788 0))(
  ( (ValueCellFull!12788 (v!16175 V!41121)) (EmptyCell!12788) )
))
(declare-datatypes ((array!70907 0))(
  ( (array!70908 (arr!34126 (Array (_ BitVec 32) ValueCell!12788)) (size!34662 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70907)

(declare-fun e!625156 () Bool)

(declare-fun array_inv!26299 (array!70907) Bool)

(assert (=> start!96352 (and (array_inv!26299 _values!874) e!625156)))

(declare-fun b!1095002 () Bool)

(declare-fun res!730749 () Bool)

(assert (=> b!1095002 (=> (not res!730749) (not e!625157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70905 (_ BitVec 32)) Bool)

(assert (=> b!1095002 (= res!730749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095003 () Bool)

(declare-fun e!625159 () Bool)

(declare-fun mapRes!42250 () Bool)

(assert (=> b!1095003 (= e!625156 (and e!625159 mapRes!42250))))

(declare-fun condMapEmpty!42250 () Bool)

(declare-fun mapDefault!42250 () ValueCell!12788)

