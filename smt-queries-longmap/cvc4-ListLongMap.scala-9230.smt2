; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110732 () Bool)

(assert start!110732)

(declare-fun b_free!29567 () Bool)

(declare-fun b_next!29567 () Bool)

(assert (=> start!110732 (= b_free!29567 (not b_next!29567))))

(declare-fun tp!104022 () Bool)

(declare-fun b_and!47775 () Bool)

(assert (=> start!110732 (= tp!104022 b_and!47775)))

(declare-fun b!1310551 () Bool)

(declare-fun res!870044 () Bool)

(declare-fun e!747616 () Bool)

(assert (=> b!1310551 (=> (not res!870044) (not e!747616))))

(declare-datatypes ((array!87582 0))(
  ( (array!87583 (arr!42271 (Array (_ BitVec 32) (_ BitVec 64))) (size!42821 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87582)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310551 (= res!870044 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42821 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310552 () Bool)

(declare-fun e!747617 () Bool)

(declare-fun tp_is_empty!35297 () Bool)

(assert (=> b!1310552 (= e!747617 tp_is_empty!35297)))

(declare-fun b!1310553 () Bool)

(declare-fun res!870050 () Bool)

(assert (=> b!1310553 (=> (not res!870050) (not e!747616))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52165 0))(
  ( (V!52166 (val!17723 Int)) )
))
(declare-datatypes ((ValueCell!16750 0))(
  ( (ValueCellFull!16750 (v!20350 V!52165)) (EmptyCell!16750) )
))
(declare-datatypes ((array!87584 0))(
  ( (array!87585 (arr!42272 (Array (_ BitVec 32) ValueCell!16750)) (size!42822 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87584)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310553 (= res!870050 (and (= (size!42822 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42821 _keys!1628) (size!42822 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310554 () Bool)

(declare-fun res!870045 () Bool)

(assert (=> b!1310554 (=> (not res!870045) (not e!747616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310554 (= res!870045 (validKeyInArray!0 (select (arr!42271 _keys!1628) from!2020)))))

(declare-fun b!1310555 () Bool)

(declare-fun res!870049 () Bool)

(assert (=> b!1310555 (=> (not res!870049) (not e!747616))))

(assert (=> b!1310555 (= res!870049 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310556 () Bool)

(declare-fun res!870046 () Bool)

(assert (=> b!1310556 (=> (not res!870046) (not e!747616))))

(declare-datatypes ((List!29973 0))(
  ( (Nil!29970) (Cons!29969 (h!31178 (_ BitVec 64)) (t!43579 List!29973)) )
))
(declare-fun arrayNoDuplicates!0 (array!87582 (_ BitVec 32) List!29973) Bool)

(assert (=> b!1310556 (= res!870046 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29970))))

(declare-fun b!1310557 () Bool)

(declare-fun res!870048 () Bool)

(assert (=> b!1310557 (=> (not res!870048) (not e!747616))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52165)

(declare-fun zeroValue!1296 () V!52165)

(declare-datatypes ((tuple2!22834 0))(
  ( (tuple2!22835 (_1!11428 (_ BitVec 64)) (_2!11428 V!52165)) )
))
(declare-datatypes ((List!29974 0))(
  ( (Nil!29971) (Cons!29970 (h!31179 tuple2!22834) (t!43580 List!29974)) )
))
(declare-datatypes ((ListLongMap!20491 0))(
  ( (ListLongMap!20492 (toList!10261 List!29974)) )
))
(declare-fun contains!8411 (ListLongMap!20491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5274 (array!87582 array!87584 (_ BitVec 32) (_ BitVec 32) V!52165 V!52165 (_ BitVec 32) Int) ListLongMap!20491)

(assert (=> b!1310557 (= res!870048 (contains!8411 (getCurrentListMap!5274 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54574 () Bool)

(declare-fun mapRes!54574 () Bool)

(declare-fun tp!104023 () Bool)

(assert (=> mapNonEmpty!54574 (= mapRes!54574 (and tp!104023 e!747617))))

(declare-fun mapKey!54574 () (_ BitVec 32))

(declare-fun mapValue!54574 () ValueCell!16750)

(declare-fun mapRest!54574 () (Array (_ BitVec 32) ValueCell!16750))

(assert (=> mapNonEmpty!54574 (= (arr!42272 _values!1354) (store mapRest!54574 mapKey!54574 mapValue!54574))))

(declare-fun res!870051 () Bool)

(assert (=> start!110732 (=> (not res!870051) (not e!747616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110732 (= res!870051 (validMask!0 mask!2040))))

(assert (=> start!110732 e!747616))

(assert (=> start!110732 tp!104022))

(declare-fun array_inv!31943 (array!87582) Bool)

(assert (=> start!110732 (array_inv!31943 _keys!1628)))

(assert (=> start!110732 true))

(assert (=> start!110732 tp_is_empty!35297))

(declare-fun e!747615 () Bool)

(declare-fun array_inv!31944 (array!87584) Bool)

(assert (=> start!110732 (and (array_inv!31944 _values!1354) e!747615)))

(declare-fun b!1310558 () Bool)

(declare-fun res!870043 () Bool)

(assert (=> b!1310558 (=> (not res!870043) (not e!747616))))

(assert (=> b!1310558 (= res!870043 (not (= (select (arr!42271 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310559 () Bool)

(assert (=> b!1310559 (= e!747616 (not true))))

(assert (=> b!1310559 (contains!8411 (getCurrentListMap!5274 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43340 0))(
  ( (Unit!43341) )
))
(declare-fun lt!585369 () Unit!43340)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 (array!87582 array!87584 (_ BitVec 32) (_ BitVec 32) V!52165 V!52165 (_ BitVec 64) (_ BitVec 32) Int) Unit!43340)

(assert (=> b!1310559 (= lt!585369 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310560 () Bool)

(declare-fun e!747614 () Bool)

(assert (=> b!1310560 (= e!747614 tp_is_empty!35297)))

(declare-fun b!1310561 () Bool)

(assert (=> b!1310561 (= e!747615 (and e!747614 mapRes!54574))))

(declare-fun condMapEmpty!54574 () Bool)

(declare-fun mapDefault!54574 () ValueCell!16750)

