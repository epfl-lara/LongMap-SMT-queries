; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97670 () Bool)

(assert start!97670)

(declare-fun b!1116303 () Bool)

(declare-fun res!745338 () Bool)

(declare-fun e!636031 () Bool)

(assert (=> b!1116303 (=> (not res!745338) (not e!636031))))

(declare-datatypes ((array!72699 0))(
  ( (array!72700 (arr!35002 (Array (_ BitVec 32) (_ BitVec 64))) (size!35538 (_ BitVec 32))) )
))
(declare-fun lt!497114 () array!72699)

(declare-datatypes ((List!24364 0))(
  ( (Nil!24361) (Cons!24360 (h!25569 (_ BitVec 64)) (t!34845 List!24364)) )
))
(declare-fun arrayNoDuplicates!0 (array!72699 (_ BitVec 32) List!24364) Bool)

(assert (=> b!1116303 (= res!745338 (arrayNoDuplicates!0 lt!497114 #b00000000000000000000000000000000 Nil!24361))))

(declare-fun b!1116304 () Bool)

(declare-fun e!636030 () Bool)

(declare-fun e!636028 () Bool)

(declare-fun mapRes!43669 () Bool)

(assert (=> b!1116304 (= e!636030 (and e!636028 mapRes!43669))))

(declare-fun condMapEmpty!43669 () Bool)

(declare-datatypes ((V!42329 0))(
  ( (V!42330 (val!14007 Int)) )
))
(declare-datatypes ((ValueCell!13241 0))(
  ( (ValueCellFull!13241 (v!16640 V!42329)) (EmptyCell!13241) )
))
(declare-datatypes ((array!72701 0))(
  ( (array!72702 (arr!35003 (Array (_ BitVec 32) ValueCell!13241)) (size!35539 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72701)

(declare-fun mapDefault!43669 () ValueCell!13241)

