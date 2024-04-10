; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110740 () Bool)

(assert start!110740)

(declare-fun b_free!29575 () Bool)

(declare-fun b_next!29575 () Bool)

(assert (=> start!110740 (= b_free!29575 (not b_next!29575))))

(declare-fun tp!104046 () Bool)

(declare-fun b_and!47783 () Bool)

(assert (=> start!110740 (= tp!104046 b_and!47783)))

(declare-fun res!870145 () Bool)

(declare-fun e!747674 () Bool)

(assert (=> start!110740 (=> (not res!870145) (not e!747674))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110740 (= res!870145 (validMask!0 mask!2040))))

(assert (=> start!110740 e!747674))

(assert (=> start!110740 tp!104046))

(declare-datatypes ((array!87598 0))(
  ( (array!87599 (arr!42279 (Array (_ BitVec 32) (_ BitVec 64))) (size!42829 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87598)

(declare-fun array_inv!31949 (array!87598) Bool)

(assert (=> start!110740 (array_inv!31949 _keys!1628)))

(assert (=> start!110740 true))

(declare-fun tp_is_empty!35305 () Bool)

(assert (=> start!110740 tp_is_empty!35305))

(declare-datatypes ((V!52177 0))(
  ( (V!52178 (val!17727 Int)) )
))
(declare-datatypes ((ValueCell!16754 0))(
  ( (ValueCellFull!16754 (v!20354 V!52177)) (EmptyCell!16754) )
))
(declare-datatypes ((array!87600 0))(
  ( (array!87601 (arr!42280 (Array (_ BitVec 32) ValueCell!16754)) (size!42830 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87600)

(declare-fun e!747676 () Bool)

(declare-fun array_inv!31950 (array!87600) Bool)

(assert (=> start!110740 (and (array_inv!31950 _values!1354) e!747676)))

(declare-fun b!1310687 () Bool)

(declare-fun res!870147 () Bool)

(assert (=> b!1310687 (=> (not res!870147) (not e!747674))))

(declare-datatypes ((List!29981 0))(
  ( (Nil!29978) (Cons!29977 (h!31186 (_ BitVec 64)) (t!43587 List!29981)) )
))
(declare-fun arrayNoDuplicates!0 (array!87598 (_ BitVec 32) List!29981) Bool)

(assert (=> b!1310687 (= res!870147 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29978))))

(declare-fun mapIsEmpty!54586 () Bool)

(declare-fun mapRes!54586 () Bool)

(assert (=> mapIsEmpty!54586 mapRes!54586))

(declare-fun mapNonEmpty!54586 () Bool)

(declare-fun tp!104047 () Bool)

(declare-fun e!747673 () Bool)

(assert (=> mapNonEmpty!54586 (= mapRes!54586 (and tp!104047 e!747673))))

(declare-fun mapKey!54586 () (_ BitVec 32))

(declare-fun mapRest!54586 () (Array (_ BitVec 32) ValueCell!16754))

(declare-fun mapValue!54586 () ValueCell!16754)

(assert (=> mapNonEmpty!54586 (= (arr!42280 _values!1354) (store mapRest!54586 mapKey!54586 mapValue!54586))))

(declare-fun b!1310688 () Bool)

(declare-fun res!870143 () Bool)

(assert (=> b!1310688 (=> (not res!870143) (not e!747674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87598 (_ BitVec 32)) Bool)

(assert (=> b!1310688 (= res!870143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310689 () Bool)

(declare-fun res!870144 () Bool)

(assert (=> b!1310689 (=> (not res!870144) (not e!747674))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310689 (= res!870144 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42829 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310690 () Bool)

(assert (=> b!1310690 (= e!747674 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585381 () Bool)

(declare-fun minValue!1296 () V!52177)

(declare-fun zeroValue!1296 () V!52177)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22842 0))(
  ( (tuple2!22843 (_1!11432 (_ BitVec 64)) (_2!11432 V!52177)) )
))
(declare-datatypes ((List!29982 0))(
  ( (Nil!29979) (Cons!29978 (h!31187 tuple2!22842) (t!43588 List!29982)) )
))
(declare-datatypes ((ListLongMap!20499 0))(
  ( (ListLongMap!20500 (toList!10265 List!29982)) )
))
(declare-fun contains!8415 (ListLongMap!20499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5278 (array!87598 array!87600 (_ BitVec 32) (_ BitVec 32) V!52177 V!52177 (_ BitVec 32) Int) ListLongMap!20499)

(assert (=> b!1310690 (= lt!585381 (contains!8415 (getCurrentListMap!5278 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310691 () Bool)

(declare-fun e!747675 () Bool)

(assert (=> b!1310691 (= e!747675 tp_is_empty!35305)))

(declare-fun b!1310692 () Bool)

(declare-fun res!870146 () Bool)

(assert (=> b!1310692 (=> (not res!870146) (not e!747674))))

(assert (=> b!1310692 (= res!870146 (and (= (size!42830 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42829 _keys!1628) (size!42830 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310693 () Bool)

(assert (=> b!1310693 (= e!747673 tp_is_empty!35305)))

(declare-fun b!1310694 () Bool)

(assert (=> b!1310694 (= e!747676 (and e!747675 mapRes!54586))))

(declare-fun condMapEmpty!54586 () Bool)

(declare-fun mapDefault!54586 () ValueCell!16754)

