; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108288 () Bool)

(assert start!108288)

(declare-fun b!1278373 () Bool)

(declare-fun e!730232 () Bool)

(declare-datatypes ((List!28738 0))(
  ( (Nil!28735) (Cons!28734 (h!29943 (_ BitVec 64)) (t!42278 List!28738)) )
))
(declare-fun noDuplicate!2055 (List!28738) Bool)

(assert (=> b!1278373 (= e!730232 (not (noDuplicate!2055 Nil!28735)))))

(declare-fun b!1278374 () Bool)

(declare-fun res!849300 () Bool)

(assert (=> b!1278374 (=> (not res!849300) (not e!730232))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49765 0))(
  ( (V!49766 (val!16823 Int)) )
))
(declare-datatypes ((ValueCell!15850 0))(
  ( (ValueCellFull!15850 (v!19422 V!49765)) (EmptyCell!15850) )
))
(declare-datatypes ((array!84086 0))(
  ( (array!84087 (arr!40549 (Array (_ BitVec 32) ValueCell!15850)) (size!41099 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84086)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84088 0))(
  ( (array!84089 (arr!40550 (Array (_ BitVec 32) (_ BitVec 64))) (size!41100 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84088)

(assert (=> b!1278374 (= res!849300 (and (= (size!41099 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41100 _keys!1741) (size!41099 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51791 () Bool)

(declare-fun mapRes!51791 () Bool)

(assert (=> mapIsEmpty!51791 mapRes!51791))

(declare-fun b!1278375 () Bool)

(declare-fun e!730235 () Bool)

(declare-fun tp_is_empty!33497 () Bool)

(assert (=> b!1278375 (= e!730235 tp_is_empty!33497)))

(declare-fun b!1278376 () Bool)

(declare-fun e!730233 () Bool)

(assert (=> b!1278376 (= e!730233 (and e!730235 mapRes!51791))))

(declare-fun condMapEmpty!51791 () Bool)

(declare-fun mapDefault!51791 () ValueCell!15850)

