; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110780 () Bool)

(assert start!110780)

(declare-fun b_free!29615 () Bool)

(declare-fun b_next!29615 () Bool)

(assert (=> start!110780 (= b_free!29615 (not b_next!29615))))

(declare-fun tp!104166 () Bool)

(declare-fun b_and!47823 () Bool)

(assert (=> start!110780 (= tp!104166 b_and!47823)))

(declare-fun res!870446 () Bool)

(declare-fun e!747975 () Bool)

(assert (=> start!110780 (=> (not res!870446) (not e!747975))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110780 (= res!870446 (validMask!0 mask!2040))))

(assert (=> start!110780 e!747975))

(assert (=> start!110780 tp!104166))

(declare-datatypes ((array!87678 0))(
  ( (array!87679 (arr!42319 (Array (_ BitVec 32) (_ BitVec 64))) (size!42869 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87678)

(declare-fun array_inv!31977 (array!87678) Bool)

(assert (=> start!110780 (array_inv!31977 _keys!1628)))

(assert (=> start!110780 true))

(declare-fun tp_is_empty!35345 () Bool)

(assert (=> start!110780 tp_is_empty!35345))

(declare-datatypes ((V!52229 0))(
  ( (V!52230 (val!17747 Int)) )
))
(declare-datatypes ((ValueCell!16774 0))(
  ( (ValueCellFull!16774 (v!20374 V!52229)) (EmptyCell!16774) )
))
(declare-datatypes ((array!87680 0))(
  ( (array!87681 (arr!42320 (Array (_ BitVec 32) ValueCell!16774)) (size!42870 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87680)

(declare-fun e!747974 () Bool)

(declare-fun array_inv!31978 (array!87680) Bool)

(assert (=> start!110780 (and (array_inv!31978 _values!1354) e!747974)))

(declare-fun b!1311167 () Bool)

(declare-fun res!870445 () Bool)

(assert (=> b!1311167 (=> (not res!870445) (not e!747975))))

(declare-datatypes ((List!30011 0))(
  ( (Nil!30008) (Cons!30007 (h!31216 (_ BitVec 64)) (t!43617 List!30011)) )
))
(declare-fun arrayNoDuplicates!0 (array!87678 (_ BitVec 32) List!30011) Bool)

(assert (=> b!1311167 (= res!870445 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30008))))

(declare-fun b!1311168 () Bool)

(declare-fun e!747976 () Bool)

(assert (=> b!1311168 (= e!747976 tp_is_empty!35345)))

(declare-fun mapNonEmpty!54646 () Bool)

(declare-fun mapRes!54646 () Bool)

(declare-fun tp!104167 () Bool)

(assert (=> mapNonEmpty!54646 (= mapRes!54646 (and tp!104167 e!747976))))

(declare-fun mapValue!54646 () ValueCell!16774)

(declare-fun mapKey!54646 () (_ BitVec 32))

(declare-fun mapRest!54646 () (Array (_ BitVec 32) ValueCell!16774))

(assert (=> mapNonEmpty!54646 (= (arr!42320 _values!1354) (store mapRest!54646 mapKey!54646 mapValue!54646))))

(declare-fun b!1311169 () Bool)

(declare-fun e!747973 () Bool)

(assert (=> b!1311169 (= e!747973 tp_is_empty!35345)))

(declare-fun b!1311170 () Bool)

(declare-fun res!870443 () Bool)

(assert (=> b!1311170 (=> (not res!870443) (not e!747975))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311170 (= res!870443 (and (= (size!42870 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42869 _keys!1628) (size!42870 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311171 () Bool)

(declare-fun res!870447 () Bool)

(assert (=> b!1311171 (=> (not res!870447) (not e!747975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87678 (_ BitVec 32)) Bool)

(assert (=> b!1311171 (= res!870447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311172 () Bool)

(declare-fun res!870444 () Bool)

(assert (=> b!1311172 (=> (not res!870444) (not e!747975))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311172 (= res!870444 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42869 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311173 () Bool)

(assert (=> b!1311173 (= e!747974 (and e!747973 mapRes!54646))))

(declare-fun condMapEmpty!54646 () Bool)

(declare-fun mapDefault!54646 () ValueCell!16774)

