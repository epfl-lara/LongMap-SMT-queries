; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111112 () Bool)

(assert start!111112)

(declare-fun b_free!29947 () Bool)

(declare-fun b_next!29947 () Bool)

(assert (=> start!111112 (= b_free!29947 (not b_next!29947))))

(declare-fun tp!105162 () Bool)

(declare-fun b_and!48155 () Bool)

(assert (=> start!111112 (= tp!105162 b_and!48155)))

(declare-fun res!873357 () Bool)

(declare-fun e!750466 () Bool)

(assert (=> start!111112 (=> (not res!873357) (not e!750466))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111112 (= res!873357 (validMask!0 mask!2040))))

(assert (=> start!111112 e!750466))

(assert (=> start!111112 tp!105162))

(declare-datatypes ((array!88316 0))(
  ( (array!88317 (arr!42638 (Array (_ BitVec 32) (_ BitVec 64))) (size!43188 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88316)

(declare-fun array_inv!32203 (array!88316) Bool)

(assert (=> start!111112 (array_inv!32203 _keys!1628)))

(assert (=> start!111112 true))

(declare-fun tp_is_empty!35677 () Bool)

(assert (=> start!111112 tp_is_empty!35677))

(declare-datatypes ((V!52673 0))(
  ( (V!52674 (val!17913 Int)) )
))
(declare-datatypes ((ValueCell!16940 0))(
  ( (ValueCellFull!16940 (v!20540 V!52673)) (EmptyCell!16940) )
))
(declare-datatypes ((array!88318 0))(
  ( (array!88319 (arr!42639 (Array (_ BitVec 32) ValueCell!16940)) (size!43189 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88318)

(declare-fun e!750467 () Bool)

(declare-fun array_inv!32204 (array!88318) Bool)

(assert (=> start!111112 (and (array_inv!32204 _values!1354) e!750467)))

(declare-fun mapIsEmpty!55144 () Bool)

(declare-fun mapRes!55144 () Bool)

(assert (=> mapIsEmpty!55144 mapRes!55144))

(declare-fun b!1315574 () Bool)

(declare-fun res!873356 () Bool)

(assert (=> b!1315574 (=> (not res!873356) (not e!750466))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315574 (= res!873356 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43188 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315575 () Bool)

(declare-fun e!750464 () Bool)

(assert (=> b!1315575 (= e!750464 tp_is_empty!35677)))

(declare-fun b!1315576 () Bool)

(declare-fun res!873358 () Bool)

(assert (=> b!1315576 (=> (not res!873358) (not e!750466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88316 (_ BitVec 32)) Bool)

(assert (=> b!1315576 (= res!873358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315577 () Bool)

(declare-fun e!750465 () Bool)

(assert (=> b!1315577 (= e!750465 tp_is_empty!35677)))

(declare-fun b!1315578 () Bool)

(assert (=> b!1315578 (= e!750466 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52673)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585930 () Bool)

(declare-fun zeroValue!1296 () V!52673)

(declare-datatypes ((tuple2!23110 0))(
  ( (tuple2!23111 (_1!11566 (_ BitVec 64)) (_2!11566 V!52673)) )
))
(declare-datatypes ((List!30245 0))(
  ( (Nil!30242) (Cons!30241 (h!31450 tuple2!23110) (t!43851 List!30245)) )
))
(declare-datatypes ((ListLongMap!20767 0))(
  ( (ListLongMap!20768 (toList!10399 List!30245)) )
))
(declare-fun contains!8549 (ListLongMap!20767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5412 (array!88316 array!88318 (_ BitVec 32) (_ BitVec 32) V!52673 V!52673 (_ BitVec 32) Int) ListLongMap!20767)

(assert (=> b!1315578 (= lt!585930 (contains!8549 (getCurrentListMap!5412 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315579 () Bool)

(declare-fun res!873360 () Bool)

(assert (=> b!1315579 (=> (not res!873360) (not e!750466))))

(declare-datatypes ((List!30246 0))(
  ( (Nil!30243) (Cons!30242 (h!31451 (_ BitVec 64)) (t!43852 List!30246)) )
))
(declare-fun arrayNoDuplicates!0 (array!88316 (_ BitVec 32) List!30246) Bool)

(assert (=> b!1315579 (= res!873360 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30243))))

(declare-fun b!1315580 () Bool)

(declare-fun res!873359 () Bool)

(assert (=> b!1315580 (=> (not res!873359) (not e!750466))))

(assert (=> b!1315580 (= res!873359 (and (= (size!43189 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43188 _keys!1628) (size!43189 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315581 () Bool)

(assert (=> b!1315581 (= e!750467 (and e!750464 mapRes!55144))))

(declare-fun condMapEmpty!55144 () Bool)

(declare-fun mapDefault!55144 () ValueCell!16940)

