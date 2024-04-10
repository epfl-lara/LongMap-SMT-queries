; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110918 () Bool)

(assert start!110918)

(declare-fun b_free!29753 () Bool)

(declare-fun b_next!29753 () Bool)

(assert (=> start!110918 (= b_free!29753 (not b_next!29753))))

(declare-fun tp!104580 () Bool)

(declare-fun b_and!47961 () Bool)

(assert (=> start!110918 (= tp!104580 b_and!47961)))

(declare-fun b!1313171 () Bool)

(declare-fun res!871829 () Bool)

(declare-fun e!749010 () Bool)

(assert (=> b!1313171 (=> (not res!871829) (not e!749010))))

(declare-datatypes ((array!87948 0))(
  ( (array!87949 (arr!42454 (Array (_ BitVec 32) (_ BitVec 64))) (size!43004 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87948)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52413 0))(
  ( (V!52414 (val!17816 Int)) )
))
(declare-datatypes ((ValueCell!16843 0))(
  ( (ValueCellFull!16843 (v!20443 V!52413)) (EmptyCell!16843) )
))
(declare-datatypes ((array!87950 0))(
  ( (array!87951 (arr!42455 (Array (_ BitVec 32) ValueCell!16843)) (size!43005 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87950)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313171 (= res!871829 (and (= (size!43005 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43004 _keys!1628) (size!43005 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313172 () Bool)

(declare-fun e!749012 () Bool)

(declare-fun tp_is_empty!35483 () Bool)

(assert (=> b!1313172 (= e!749012 tp_is_empty!35483)))

(declare-fun mapIsEmpty!54853 () Bool)

(declare-fun mapRes!54853 () Bool)

(assert (=> mapIsEmpty!54853 mapRes!54853))

(declare-fun b!1313173 () Bool)

(declare-fun res!871832 () Bool)

(assert (=> b!1313173 (=> (not res!871832) (not e!749010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87948 (_ BitVec 32)) Bool)

(assert (=> b!1313173 (= res!871832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313174 () Bool)

(declare-fun res!871831 () Bool)

(assert (=> b!1313174 (=> (not res!871831) (not e!749010))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313174 (= res!871831 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43004 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313176 () Bool)

(declare-fun res!871828 () Bool)

(assert (=> b!1313176 (=> (not res!871828) (not e!749010))))

(declare-datatypes ((List!30106 0))(
  ( (Nil!30103) (Cons!30102 (h!31311 (_ BitVec 64)) (t!43712 List!30106)) )
))
(declare-fun arrayNoDuplicates!0 (array!87948 (_ BitVec 32) List!30106) Bool)

(assert (=> b!1313176 (= res!871828 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30103))))

(declare-fun b!1313177 () Bool)

(declare-fun res!871830 () Bool)

(assert (=> b!1313177 (=> (not res!871830) (not e!749010))))

(assert (=> b!1313177 (= res!871830 (not (= (select (arr!42454 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1313178 () Bool)

(declare-fun e!749009 () Bool)

(declare-fun e!749008 () Bool)

(assert (=> b!1313178 (= e!749009 (and e!749008 mapRes!54853))))

(declare-fun condMapEmpty!54853 () Bool)

(declare-fun mapDefault!54853 () ValueCell!16843)

