; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110458 () Bool)

(assert start!110458)

(declare-fun b!1306732 () Bool)

(declare-fun res!867457 () Bool)

(declare-fun e!745558 () Bool)

(assert (=> b!1306732 (=> (not res!867457) (not e!745558))))

(declare-datatypes ((array!87058 0))(
  ( (array!87059 (arr!42009 (Array (_ BitVec 32) (_ BitVec 64))) (size!42559 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87058)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87058 (_ BitVec 32)) Bool)

(assert (=> b!1306732 (= res!867457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867458 () Bool)

(assert (=> start!110458 (=> (not res!867458) (not e!745558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110458 (= res!867458 (validMask!0 mask!2040))))

(assert (=> start!110458 e!745558))

(assert (=> start!110458 true))

(declare-datatypes ((V!51801 0))(
  ( (V!51802 (val!17586 Int)) )
))
(declare-datatypes ((ValueCell!16613 0))(
  ( (ValueCellFull!16613 (v!20213 V!51801)) (EmptyCell!16613) )
))
(declare-datatypes ((array!87060 0))(
  ( (array!87061 (arr!42010 (Array (_ BitVec 32) ValueCell!16613)) (size!42560 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87060)

(declare-fun e!745561 () Bool)

(declare-fun array_inv!31761 (array!87060) Bool)

(assert (=> start!110458 (and (array_inv!31761 _values!1354) e!745561)))

(declare-fun array_inv!31762 (array!87058) Bool)

(assert (=> start!110458 (array_inv!31762 _keys!1628)))

(declare-fun b!1306733 () Bool)

(declare-fun e!745562 () Bool)

(declare-fun tp_is_empty!35023 () Bool)

(assert (=> b!1306733 (= e!745562 tp_is_empty!35023)))

(declare-fun b!1306734 () Bool)

(declare-fun res!867459 () Bool)

(assert (=> b!1306734 (=> (not res!867459) (not e!745558))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306734 (= res!867459 (and (= (size!42560 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42559 _keys!1628) (size!42560 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306735 () Bool)

(declare-fun mapRes!54163 () Bool)

(assert (=> b!1306735 (= e!745561 (and e!745562 mapRes!54163))))

(declare-fun condMapEmpty!54163 () Bool)

(declare-fun mapDefault!54163 () ValueCell!16613)

