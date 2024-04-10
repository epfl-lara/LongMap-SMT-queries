; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110888 () Bool)

(assert start!110888)

(declare-fun b_free!29723 () Bool)

(declare-fun b_next!29723 () Bool)

(assert (=> start!110888 (= b_free!29723 (not b_next!29723))))

(declare-fun tp!104490 () Bool)

(declare-fun b_and!47931 () Bool)

(assert (=> start!110888 (= tp!104490 b_and!47931)))

(declare-fun mapNonEmpty!54808 () Bool)

(declare-fun mapRes!54808 () Bool)

(declare-fun tp!104491 () Bool)

(declare-fun e!748785 () Bool)

(assert (=> mapNonEmpty!54808 (= mapRes!54808 (and tp!104491 e!748785))))

(declare-datatypes ((V!52373 0))(
  ( (V!52374 (val!17801 Int)) )
))
(declare-datatypes ((ValueCell!16828 0))(
  ( (ValueCellFull!16828 (v!20428 V!52373)) (EmptyCell!16828) )
))
(declare-fun mapRest!54808 () (Array (_ BitVec 32) ValueCell!16828))

(declare-fun mapKey!54808 () (_ BitVec 32))

(declare-fun mapValue!54808 () ValueCell!16828)

(declare-datatypes ((array!87888 0))(
  ( (array!87889 (arr!42424 (Array (_ BitVec 32) ValueCell!16828)) (size!42974 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87888)

(assert (=> mapNonEmpty!54808 (= (arr!42424 _values!1354) (store mapRest!54808 mapKey!54808 mapValue!54808))))

(declare-fun b!1312787 () Bool)

(declare-fun res!871578 () Bool)

(declare-fun e!748783 () Bool)

(assert (=> b!1312787 (=> (not res!871578) (not e!748783))))

(declare-datatypes ((array!87890 0))(
  ( (array!87891 (arr!42425 (Array (_ BitVec 32) (_ BitVec 64))) (size!42975 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87890)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312787 (= res!871578 (and (= (size!42974 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42975 _keys!1628) (size!42974 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54808 () Bool)

(assert (=> mapIsEmpty!54808 mapRes!54808))

(declare-fun b!1312788 () Bool)

(declare-fun res!871579 () Bool)

(assert (=> b!1312788 (=> (not res!871579) (not e!748783))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312788 (= res!871579 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42975 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312789 () Bool)

(declare-fun e!748784 () Bool)

(declare-fun e!748786 () Bool)

(assert (=> b!1312789 (= e!748784 (and e!748786 mapRes!54808))))

(declare-fun condMapEmpty!54808 () Bool)

(declare-fun mapDefault!54808 () ValueCell!16828)

