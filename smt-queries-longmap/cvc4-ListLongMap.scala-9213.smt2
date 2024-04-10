; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110630 () Bool)

(assert start!110630)

(declare-fun b_free!29465 () Bool)

(declare-fun b_next!29465 () Bool)

(assert (=> start!110630 (= b_free!29465 (not b_next!29465))))

(declare-fun tp!103716 () Bool)

(declare-fun b_and!47673 () Bool)

(assert (=> start!110630 (= tp!103716 b_and!47673)))

(declare-fun b!1309043 () Bool)

(declare-fun res!868997 () Bool)

(declare-fun e!746849 () Bool)

(assert (=> b!1309043 (=> (not res!868997) (not e!746849))))

(declare-datatypes ((array!87384 0))(
  ( (array!87385 (arr!42172 (Array (_ BitVec 32) (_ BitVec 64))) (size!42722 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87384)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52029 0))(
  ( (V!52030 (val!17672 Int)) )
))
(declare-datatypes ((ValueCell!16699 0))(
  ( (ValueCellFull!16699 (v!20299 V!52029)) (EmptyCell!16699) )
))
(declare-datatypes ((array!87386 0))(
  ( (array!87387 (arr!42173 (Array (_ BitVec 32) ValueCell!16699)) (size!42723 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87386)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309043 (= res!868997 (and (= (size!42723 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42722 _keys!1628) (size!42723 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309044 () Bool)

(declare-fun e!746850 () Bool)

(declare-fun tp_is_empty!35195 () Bool)

(assert (=> b!1309044 (= e!746850 tp_is_empty!35195)))

(declare-fun b!1309045 () Bool)

(declare-fun res!868995 () Bool)

(assert (=> b!1309045 (=> (not res!868995) (not e!746849))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309045 (= res!868995 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42722 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309046 () Bool)

(declare-fun res!868994 () Bool)

(assert (=> b!1309046 (=> (not res!868994) (not e!746849))))

(declare-datatypes ((List!29899 0))(
  ( (Nil!29896) (Cons!29895 (h!31104 (_ BitVec 64)) (t!43505 List!29899)) )
))
(declare-fun arrayNoDuplicates!0 (array!87384 (_ BitVec 32) List!29899) Bool)

(assert (=> b!1309046 (= res!868994 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29896))))

(declare-fun b!1309047 () Bool)

(declare-fun res!868996 () Bool)

(assert (=> b!1309047 (=> (not res!868996) (not e!746849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87384 (_ BitVec 32)) Bool)

(assert (=> b!1309047 (= res!868996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54421 () Bool)

(declare-fun mapRes!54421 () Bool)

(declare-fun tp!103717 () Bool)

(assert (=> mapNonEmpty!54421 (= mapRes!54421 (and tp!103717 e!746850))))

(declare-fun mapKey!54421 () (_ BitVec 32))

(declare-fun mapRest!54421 () (Array (_ BitVec 32) ValueCell!16699))

(declare-fun mapValue!54421 () ValueCell!16699)

(assert (=> mapNonEmpty!54421 (= (arr!42173 _values!1354) (store mapRest!54421 mapKey!54421 mapValue!54421))))

(declare-fun b!1309048 () Bool)

(declare-fun e!746851 () Bool)

(assert (=> b!1309048 (= e!746851 tp_is_empty!35195)))

(declare-fun res!868998 () Bool)

(assert (=> start!110630 (=> (not res!868998) (not e!746849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110630 (= res!868998 (validMask!0 mask!2040))))

(assert (=> start!110630 e!746849))

(assert (=> start!110630 tp!103716))

(declare-fun array_inv!31875 (array!87384) Bool)

(assert (=> start!110630 (array_inv!31875 _keys!1628)))

(assert (=> start!110630 true))

(assert (=> start!110630 tp_is_empty!35195))

(declare-fun e!746848 () Bool)

(declare-fun array_inv!31876 (array!87386) Bool)

(assert (=> start!110630 (and (array_inv!31876 _values!1354) e!746848)))

(declare-fun mapIsEmpty!54421 () Bool)

(assert (=> mapIsEmpty!54421 mapRes!54421))

(declare-fun b!1309049 () Bool)

(assert (=> b!1309049 (= e!746848 (and e!746851 mapRes!54421))))

(declare-fun condMapEmpty!54421 () Bool)

(declare-fun mapDefault!54421 () ValueCell!16699)

