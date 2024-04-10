; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110792 () Bool)

(assert start!110792)

(declare-fun b_free!29627 () Bool)

(declare-fun b_next!29627 () Bool)

(assert (=> start!110792 (= b_free!29627 (not b_next!29627))))

(declare-fun tp!104203 () Bool)

(declare-fun b_and!47835 () Bool)

(assert (=> start!110792 (= tp!104203 b_and!47835)))

(declare-fun res!870536 () Bool)

(declare-fun e!748063 () Bool)

(assert (=> start!110792 (=> (not res!870536) (not e!748063))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110792 (= res!870536 (validMask!0 mask!2040))))

(assert (=> start!110792 e!748063))

(assert (=> start!110792 tp!104203))

(declare-datatypes ((array!87702 0))(
  ( (array!87703 (arr!42331 (Array (_ BitVec 32) (_ BitVec 64))) (size!42881 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87702)

(declare-fun array_inv!31987 (array!87702) Bool)

(assert (=> start!110792 (array_inv!31987 _keys!1628)))

(assert (=> start!110792 true))

(declare-fun tp_is_empty!35357 () Bool)

(assert (=> start!110792 tp_is_empty!35357))

(declare-datatypes ((V!52245 0))(
  ( (V!52246 (val!17753 Int)) )
))
(declare-datatypes ((ValueCell!16780 0))(
  ( (ValueCellFull!16780 (v!20380 V!52245)) (EmptyCell!16780) )
))
(declare-datatypes ((array!87704 0))(
  ( (array!87705 (arr!42332 (Array (_ BitVec 32) ValueCell!16780)) (size!42882 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87704)

(declare-fun e!748064 () Bool)

(declare-fun array_inv!31988 (array!87704) Bool)

(assert (=> start!110792 (and (array_inv!31988 _values!1354) e!748064)))

(declare-fun b!1311311 () Bool)

(declare-fun res!870534 () Bool)

(assert (=> b!1311311 (=> (not res!870534) (not e!748063))))

(declare-datatypes ((List!30020 0))(
  ( (Nil!30017) (Cons!30016 (h!31225 (_ BitVec 64)) (t!43626 List!30020)) )
))
(declare-fun arrayNoDuplicates!0 (array!87702 (_ BitVec 32) List!30020) Bool)

(assert (=> b!1311311 (= res!870534 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30017))))

(declare-fun b!1311312 () Bool)

(declare-fun e!748066 () Bool)

(assert (=> b!1311312 (= e!748066 tp_is_empty!35357)))

(declare-fun mapIsEmpty!54664 () Bool)

(declare-fun mapRes!54664 () Bool)

(assert (=> mapIsEmpty!54664 mapRes!54664))

(declare-fun b!1311313 () Bool)

(declare-fun res!870537 () Bool)

(assert (=> b!1311313 (=> (not res!870537) (not e!748063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87702 (_ BitVec 32)) Bool)

(assert (=> b!1311313 (= res!870537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311314 () Bool)

(declare-fun res!870533 () Bool)

(assert (=> b!1311314 (=> (not res!870533) (not e!748063))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311314 (= res!870533 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42881 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311315 () Bool)

(assert (=> b!1311315 (= e!748064 (and e!748066 mapRes!54664))))

(declare-fun condMapEmpty!54664 () Bool)

(declare-fun mapDefault!54664 () ValueCell!16780)

