; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95508 () Bool)

(assert start!95508)

(declare-fun b!1078651 () Bool)

(declare-fun res!718762 () Bool)

(declare-fun e!616732 () Bool)

(assert (=> b!1078651 (=> (not res!718762) (not e!616732))))

(declare-datatypes ((array!69313 0))(
  ( (array!69314 (arr!33331 (Array (_ BitVec 32) (_ BitVec 64))) (size!33867 (_ BitVec 32))) )
))
(declare-fun lt!478675 () array!69313)

(declare-datatypes ((List!23245 0))(
  ( (Nil!23242) (Cons!23241 (h!24450 (_ BitVec 64)) (t!32604 List!23245)) )
))
(declare-fun arrayNoDuplicates!0 (array!69313 (_ BitVec 32) List!23245) Bool)

(assert (=> b!1078651 (= res!718762 (arrayNoDuplicates!0 lt!478675 #b00000000000000000000000000000000 Nil!23242))))

(declare-fun b!1078652 () Bool)

(declare-fun e!616734 () Bool)

(declare-fun e!616730 () Bool)

(declare-fun mapRes!41020 () Bool)

(assert (=> b!1078652 (= e!616734 (and e!616730 mapRes!41020))))

(declare-fun condMapEmpty!41020 () Bool)

(declare-datatypes ((V!40033 0))(
  ( (V!40034 (val!13146 Int)) )
))
(declare-datatypes ((ValueCell!12380 0))(
  ( (ValueCellFull!12380 (v!15767 V!40033)) (EmptyCell!12380) )
))
(declare-datatypes ((array!69315 0))(
  ( (array!69316 (arr!33332 (Array (_ BitVec 32) ValueCell!12380)) (size!33868 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69315)

(declare-fun mapDefault!41020 () ValueCell!12380)

