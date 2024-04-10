; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108358 () Bool)

(assert start!108358)

(declare-fun b!1278893 () Bool)

(declare-fun res!849577 () Bool)

(declare-fun e!730651 () Bool)

(assert (=> b!1278893 (=> (not res!849577) (not e!730651))))

(declare-datatypes ((array!84178 0))(
  ( (array!84179 (arr!40593 (Array (_ BitVec 32) (_ BitVec 64))) (size!41143 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84178)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84178 (_ BitVec 32)) Bool)

(assert (=> b!1278893 (= res!849577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278894 () Bool)

(declare-fun res!849578 () Bool)

(assert (=> b!1278894 (=> (not res!849578) (not e!730651))))

(declare-datatypes ((V!49829 0))(
  ( (V!49830 (val!16847 Int)) )
))
(declare-datatypes ((ValueCell!15874 0))(
  ( (ValueCellFull!15874 (v!19447 V!49829)) (EmptyCell!15874) )
))
(declare-datatypes ((array!84180 0))(
  ( (array!84181 (arr!40594 (Array (_ BitVec 32) ValueCell!15874)) (size!41144 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84180)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278894 (= res!849578 (and (= (size!41144 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41143 _keys!1741) (size!41144 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278895 () Bool)

(declare-fun e!730652 () Bool)

(declare-fun tp_is_empty!33545 () Bool)

(assert (=> b!1278895 (= e!730652 tp_is_empty!33545)))

(declare-fun mapIsEmpty!51869 () Bool)

(declare-fun mapRes!51869 () Bool)

(assert (=> mapIsEmpty!51869 mapRes!51869))

(declare-fun b!1278896 () Bool)

(declare-fun e!730653 () Bool)

(assert (=> b!1278896 (= e!730653 tp_is_empty!33545)))

(declare-fun b!1278897 () Bool)

(declare-fun e!730654 () Bool)

(assert (=> b!1278897 (= e!730654 (and e!730653 mapRes!51869))))

(declare-fun condMapEmpty!51869 () Bool)

(declare-fun mapDefault!51869 () ValueCell!15874)

