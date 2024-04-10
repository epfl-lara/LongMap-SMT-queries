; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110984 () Bool)

(assert start!110984)

(declare-fun b_free!29819 () Bool)

(declare-fun b_next!29819 () Bool)

(assert (=> start!110984 (= b_free!29819 (not b_next!29819))))

(declare-fun tp!104779 () Bool)

(declare-fun b_and!48027 () Bool)

(assert (=> start!110984 (= tp!104779 b_and!48027)))

(declare-fun b!1313966 () Bool)

(declare-fun res!872325 () Bool)

(declare-fun e!749503 () Bool)

(assert (=> b!1313966 (=> (not res!872325) (not e!749503))))

(declare-datatypes ((array!88070 0))(
  ( (array!88071 (arr!42515 (Array (_ BitVec 32) (_ BitVec 64))) (size!43065 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88070)

(declare-datatypes ((List!30152 0))(
  ( (Nil!30149) (Cons!30148 (h!31357 (_ BitVec 64)) (t!43758 List!30152)) )
))
(declare-fun arrayNoDuplicates!0 (array!88070 (_ BitVec 32) List!30152) Bool)

(assert (=> b!1313966 (= res!872325 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30149))))

(declare-fun b!1313967 () Bool)

(declare-fun res!872328 () Bool)

(assert (=> b!1313967 (=> (not res!872328) (not e!749503))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88070 (_ BitVec 32)) Bool)

(assert (=> b!1313967 (= res!872328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54952 () Bool)

(declare-fun mapRes!54952 () Bool)

(assert (=> mapIsEmpty!54952 mapRes!54952))

(declare-fun res!872326 () Bool)

(assert (=> start!110984 (=> (not res!872326) (not e!749503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110984 (= res!872326 (validMask!0 mask!2040))))

(assert (=> start!110984 e!749503))

(assert (=> start!110984 tp!104779))

(declare-fun array_inv!32117 (array!88070) Bool)

(assert (=> start!110984 (array_inv!32117 _keys!1628)))

(assert (=> start!110984 true))

(declare-fun tp_is_empty!35549 () Bool)

(assert (=> start!110984 tp_is_empty!35549))

(declare-datatypes ((V!52501 0))(
  ( (V!52502 (val!17849 Int)) )
))
(declare-datatypes ((ValueCell!16876 0))(
  ( (ValueCellFull!16876 (v!20476 V!52501)) (EmptyCell!16876) )
))
(declare-datatypes ((array!88072 0))(
  ( (array!88073 (arr!42516 (Array (_ BitVec 32) ValueCell!16876)) (size!43066 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88072)

(declare-fun e!749507 () Bool)

(declare-fun array_inv!32118 (array!88072) Bool)

(assert (=> start!110984 (and (array_inv!32118 _values!1354) e!749507)))

(declare-fun b!1313968 () Bool)

(declare-fun e!749504 () Bool)

(assert (=> b!1313968 (= e!749507 (and e!749504 mapRes!54952))))

(declare-fun condMapEmpty!54952 () Bool)

(declare-fun mapDefault!54952 () ValueCell!16876)

