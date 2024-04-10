; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110750 () Bool)

(assert start!110750)

(declare-fun b_free!29585 () Bool)

(declare-fun b_next!29585 () Bool)

(assert (=> start!110750 (= b_free!29585 (not b_next!29585))))

(declare-fun tp!104077 () Bool)

(declare-fun b_and!47793 () Bool)

(assert (=> start!110750 (= tp!104077 b_and!47793)))

(declare-fun mapIsEmpty!54601 () Bool)

(declare-fun mapRes!54601 () Bool)

(assert (=> mapIsEmpty!54601 mapRes!54601))

(declare-fun b!1310807 () Bool)

(declare-fun res!870219 () Bool)

(declare-fun e!747752 () Bool)

(assert (=> b!1310807 (=> (not res!870219) (not e!747752))))

(declare-datatypes ((array!87618 0))(
  ( (array!87619 (arr!42289 (Array (_ BitVec 32) (_ BitVec 64))) (size!42839 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87618)

(declare-datatypes ((List!29991 0))(
  ( (Nil!29988) (Cons!29987 (h!31196 (_ BitVec 64)) (t!43597 List!29991)) )
))
(declare-fun arrayNoDuplicates!0 (array!87618 (_ BitVec 32) List!29991) Bool)

(assert (=> b!1310807 (= res!870219 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29988))))

(declare-fun res!870221 () Bool)

(assert (=> start!110750 (=> (not res!870221) (not e!747752))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110750 (= res!870221 (validMask!0 mask!2040))))

(assert (=> start!110750 e!747752))

(assert (=> start!110750 tp!104077))

(declare-fun array_inv!31959 (array!87618) Bool)

(assert (=> start!110750 (array_inv!31959 _keys!1628)))

(assert (=> start!110750 true))

(declare-fun tp_is_empty!35315 () Bool)

(assert (=> start!110750 tp_is_empty!35315))

(declare-datatypes ((V!52189 0))(
  ( (V!52190 (val!17732 Int)) )
))
(declare-datatypes ((ValueCell!16759 0))(
  ( (ValueCellFull!16759 (v!20359 V!52189)) (EmptyCell!16759) )
))
(declare-datatypes ((array!87620 0))(
  ( (array!87621 (arr!42290 (Array (_ BitVec 32) ValueCell!16759)) (size!42840 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87620)

(declare-fun e!747748 () Bool)

(declare-fun array_inv!31960 (array!87620) Bool)

(assert (=> start!110750 (and (array_inv!31960 _values!1354) e!747748)))

(declare-fun b!1310808 () Bool)

(declare-fun res!870218 () Bool)

(assert (=> b!1310808 (=> (not res!870218) (not e!747752))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310808 (= res!870218 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42839 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310809 () Bool)

(declare-fun res!870220 () Bool)

(assert (=> b!1310809 (=> (not res!870220) (not e!747752))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310809 (= res!870220 (and (= (size!42840 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42839 _keys!1628) (size!42840 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310810 () Bool)

(declare-fun res!870222 () Bool)

(assert (=> b!1310810 (=> (not res!870222) (not e!747752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87618 (_ BitVec 32)) Bool)

(assert (=> b!1310810 (= res!870222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310811 () Bool)

(declare-fun e!747750 () Bool)

(assert (=> b!1310811 (= e!747748 (and e!747750 mapRes!54601))))

(declare-fun condMapEmpty!54601 () Bool)

(declare-fun mapDefault!54601 () ValueCell!16759)

