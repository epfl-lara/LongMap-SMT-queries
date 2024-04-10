; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110476 () Bool)

(assert start!110476)

(declare-fun mapIsEmpty!54190 () Bool)

(declare-fun mapRes!54190 () Bool)

(assert (=> mapIsEmpty!54190 mapRes!54190))

(declare-fun b!1306894 () Bool)

(declare-fun e!745693 () Bool)

(declare-fun tp_is_empty!35041 () Bool)

(assert (=> b!1306894 (= e!745693 tp_is_empty!35041)))

(declare-fun b!1306895 () Bool)

(declare-fun e!745697 () Bool)

(assert (=> b!1306895 (= e!745697 false)))

(declare-fun lt!584994 () Bool)

(declare-datatypes ((array!87090 0))(
  ( (array!87091 (arr!42025 (Array (_ BitVec 32) (_ BitVec 64))) (size!42575 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87090)

(declare-datatypes ((List!29802 0))(
  ( (Nil!29799) (Cons!29798 (h!31007 (_ BitVec 64)) (t!43408 List!29802)) )
))
(declare-fun arrayNoDuplicates!0 (array!87090 (_ BitVec 32) List!29802) Bool)

(assert (=> b!1306895 (= lt!584994 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29799))))

(declare-fun b!1306896 () Bool)

(declare-fun res!867540 () Bool)

(assert (=> b!1306896 (=> (not res!867540) (not e!745697))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51825 0))(
  ( (V!51826 (val!17595 Int)) )
))
(declare-datatypes ((ValueCell!16622 0))(
  ( (ValueCellFull!16622 (v!20222 V!51825)) (EmptyCell!16622) )
))
(declare-datatypes ((array!87092 0))(
  ( (array!87093 (arr!42026 (Array (_ BitVec 32) ValueCell!16622)) (size!42576 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87092)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306896 (= res!867540 (and (= (size!42576 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42575 _keys!1628) (size!42576 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54190 () Bool)

(declare-fun tp!103270 () Bool)

(assert (=> mapNonEmpty!54190 (= mapRes!54190 (and tp!103270 e!745693))))

(declare-fun mapValue!54190 () ValueCell!16622)

(declare-fun mapKey!54190 () (_ BitVec 32))

(declare-fun mapRest!54190 () (Array (_ BitVec 32) ValueCell!16622))

(assert (=> mapNonEmpty!54190 (= (arr!42026 _values!1354) (store mapRest!54190 mapKey!54190 mapValue!54190))))

(declare-fun b!1306897 () Bool)

(declare-fun e!745695 () Bool)

(declare-fun e!745696 () Bool)

(assert (=> b!1306897 (= e!745695 (and e!745696 mapRes!54190))))

(declare-fun condMapEmpty!54190 () Bool)

(declare-fun mapDefault!54190 () ValueCell!16622)

