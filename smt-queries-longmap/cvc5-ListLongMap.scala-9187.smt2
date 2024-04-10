; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110470 () Bool)

(assert start!110470)

(declare-fun b!1306840 () Bool)

(declare-fun e!745649 () Bool)

(declare-fun tp_is_empty!35035 () Bool)

(assert (=> b!1306840 (= e!745649 tp_is_empty!35035)))

(declare-fun b!1306841 () Bool)

(declare-fun res!867512 () Bool)

(declare-fun e!745648 () Bool)

(assert (=> b!1306841 (=> (not res!867512) (not e!745648))))

(declare-datatypes ((array!87080 0))(
  ( (array!87081 (arr!42020 (Array (_ BitVec 32) (_ BitVec 64))) (size!42570 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87080)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87080 (_ BitVec 32)) Bool)

(assert (=> b!1306841 (= res!867512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306842 () Bool)

(declare-fun e!745650 () Bool)

(assert (=> b!1306842 (= e!745650 tp_is_empty!35035)))

(declare-fun mapNonEmpty!54181 () Bool)

(declare-fun mapRes!54181 () Bool)

(declare-fun tp!103261 () Bool)

(assert (=> mapNonEmpty!54181 (= mapRes!54181 (and tp!103261 e!745650))))

(declare-datatypes ((V!51817 0))(
  ( (V!51818 (val!17592 Int)) )
))
(declare-datatypes ((ValueCell!16619 0))(
  ( (ValueCellFull!16619 (v!20219 V!51817)) (EmptyCell!16619) )
))
(declare-fun mapRest!54181 () (Array (_ BitVec 32) ValueCell!16619))

(declare-fun mapKey!54181 () (_ BitVec 32))

(declare-fun mapValue!54181 () ValueCell!16619)

(declare-datatypes ((array!87082 0))(
  ( (array!87083 (arr!42021 (Array (_ BitVec 32) ValueCell!16619)) (size!42571 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87082)

(assert (=> mapNonEmpty!54181 (= (arr!42021 _values!1354) (store mapRest!54181 mapKey!54181 mapValue!54181))))

(declare-fun b!1306843 () Bool)

(assert (=> b!1306843 (= e!745648 false)))

(declare-fun lt!584985 () Bool)

(declare-datatypes ((List!29800 0))(
  ( (Nil!29797) (Cons!29796 (h!31005 (_ BitVec 64)) (t!43406 List!29800)) )
))
(declare-fun arrayNoDuplicates!0 (array!87080 (_ BitVec 32) List!29800) Bool)

(assert (=> b!1306843 (= lt!584985 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29797))))

(declare-fun b!1306844 () Bool)

(declare-fun res!867511 () Bool)

(assert (=> b!1306844 (=> (not res!867511) (not e!745648))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306844 (= res!867511 (and (= (size!42571 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42570 _keys!1628) (size!42571 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54181 () Bool)

(assert (=> mapIsEmpty!54181 mapRes!54181))

(declare-fun res!867513 () Bool)

(assert (=> start!110470 (=> (not res!867513) (not e!745648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110470 (= res!867513 (validMask!0 mask!2040))))

(assert (=> start!110470 e!745648))

(assert (=> start!110470 true))

(declare-fun e!745651 () Bool)

(declare-fun array_inv!31767 (array!87082) Bool)

(assert (=> start!110470 (and (array_inv!31767 _values!1354) e!745651)))

(declare-fun array_inv!31768 (array!87080) Bool)

(assert (=> start!110470 (array_inv!31768 _keys!1628)))

(declare-fun b!1306845 () Bool)

(assert (=> b!1306845 (= e!745651 (and e!745649 mapRes!54181))))

(declare-fun condMapEmpty!54181 () Bool)

(declare-fun mapDefault!54181 () ValueCell!16619)

