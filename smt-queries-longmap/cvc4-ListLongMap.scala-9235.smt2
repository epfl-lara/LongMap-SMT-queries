; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110762 () Bool)

(assert start!110762)

(declare-fun b_free!29597 () Bool)

(declare-fun b_next!29597 () Bool)

(assert (=> start!110762 (= b_free!29597 (not b_next!29597))))

(declare-fun tp!104113 () Bool)

(declare-fun b_and!47805 () Bool)

(assert (=> start!110762 (= tp!104113 b_and!47805)))

(declare-fun res!870308 () Bool)

(declare-fun e!747840 () Bool)

(assert (=> start!110762 (=> (not res!870308) (not e!747840))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110762 (= res!870308 (validMask!0 mask!2040))))

(assert (=> start!110762 e!747840))

(assert (=> start!110762 tp!104113))

(declare-datatypes ((array!87642 0))(
  ( (array!87643 (arr!42301 (Array (_ BitVec 32) (_ BitVec 64))) (size!42851 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87642)

(declare-fun array_inv!31965 (array!87642) Bool)

(assert (=> start!110762 (array_inv!31965 _keys!1628)))

(assert (=> start!110762 true))

(declare-fun tp_is_empty!35327 () Bool)

(assert (=> start!110762 tp_is_empty!35327))

(declare-datatypes ((V!52205 0))(
  ( (V!52206 (val!17738 Int)) )
))
(declare-datatypes ((ValueCell!16765 0))(
  ( (ValueCellFull!16765 (v!20365 V!52205)) (EmptyCell!16765) )
))
(declare-datatypes ((array!87644 0))(
  ( (array!87645 (arr!42302 (Array (_ BitVec 32) ValueCell!16765)) (size!42852 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87644)

(declare-fun e!747839 () Bool)

(declare-fun array_inv!31966 (array!87644) Bool)

(assert (=> start!110762 (and (array_inv!31966 _values!1354) e!747839)))

(declare-fun b!1310951 () Bool)

(declare-fun res!870309 () Bool)

(assert (=> b!1310951 (=> (not res!870309) (not e!747840))))

(declare-datatypes ((List!29999 0))(
  ( (Nil!29996) (Cons!29995 (h!31204 (_ BitVec 64)) (t!43605 List!29999)) )
))
(declare-fun arrayNoDuplicates!0 (array!87642 (_ BitVec 32) List!29999) Bool)

(assert (=> b!1310951 (= res!870309 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29996))))

(declare-fun b!1310952 () Bool)

(declare-fun res!870311 () Bool)

(assert (=> b!1310952 (=> (not res!870311) (not e!747840))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310952 (= res!870311 (and (= (size!42852 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42851 _keys!1628) (size!42852 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310953 () Bool)

(declare-fun res!870312 () Bool)

(assert (=> b!1310953 (=> (not res!870312) (not e!747840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87642 (_ BitVec 32)) Bool)

(assert (=> b!1310953 (= res!870312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310954 () Bool)

(declare-fun res!870310 () Bool)

(assert (=> b!1310954 (=> (not res!870310) (not e!747840))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310954 (= res!870310 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42851 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310955 () Bool)

(declare-fun e!747842 () Bool)

(declare-fun mapRes!54619 () Bool)

(assert (=> b!1310955 (= e!747839 (and e!747842 mapRes!54619))))

(declare-fun condMapEmpty!54619 () Bool)

(declare-fun mapDefault!54619 () ValueCell!16765)

