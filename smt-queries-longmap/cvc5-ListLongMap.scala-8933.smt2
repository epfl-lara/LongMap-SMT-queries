; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108324 () Bool)

(assert start!108324)

(declare-fun b!1278587 () Bool)

(declare-fun res!849423 () Bool)

(declare-fun e!730398 () Bool)

(assert (=> b!1278587 (=> (not res!849423) (not e!730398))))

(declare-datatypes ((array!84116 0))(
  ( (array!84117 (arr!40562 (Array (_ BitVec 32) (_ BitVec 64))) (size!41112 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84116)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84116 (_ BitVec 32)) Bool)

(assert (=> b!1278587 (= res!849423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278588 () Bool)

(declare-fun e!730400 () Bool)

(declare-fun tp_is_empty!33511 () Bool)

(assert (=> b!1278588 (= e!730400 tp_is_empty!33511)))

(declare-fun mapIsEmpty!51818 () Bool)

(declare-fun mapRes!51818 () Bool)

(assert (=> mapIsEmpty!51818 mapRes!51818))

(declare-fun b!1278589 () Bool)

(declare-fun res!849424 () Bool)

(assert (=> b!1278589 (=> (not res!849424) (not e!730398))))

(declare-datatypes ((V!49785 0))(
  ( (V!49786 (val!16830 Int)) )
))
(declare-datatypes ((ValueCell!15857 0))(
  ( (ValueCellFull!15857 (v!19430 V!49785)) (EmptyCell!15857) )
))
(declare-datatypes ((array!84118 0))(
  ( (array!84119 (arr!40563 (Array (_ BitVec 32) ValueCell!15857)) (size!41113 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84118)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278589 (= res!849424 (and (= (size!41113 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41112 _keys!1741) (size!41113 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278590 () Bool)

(declare-fun e!730397 () Bool)

(assert (=> b!1278590 (= e!730397 tp_is_empty!33511)))

(declare-fun b!1278591 () Bool)

(declare-fun e!730399 () Bool)

(assert (=> b!1278591 (= e!730399 (and e!730400 mapRes!51818))))

(declare-fun condMapEmpty!51818 () Bool)

(declare-fun mapDefault!51818 () ValueCell!15857)

