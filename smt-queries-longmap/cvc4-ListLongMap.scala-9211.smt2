; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110618 () Bool)

(assert start!110618)

(declare-fun b_free!29453 () Bool)

(declare-fun b_next!29453 () Bool)

(assert (=> start!110618 (= b_free!29453 (not b_next!29453))))

(declare-fun tp!103680 () Bool)

(declare-fun b_and!47661 () Bool)

(assert (=> start!110618 (= tp!103680 b_and!47661)))

(declare-fun b!1308899 () Bool)

(declare-fun res!868908 () Bool)

(declare-fun e!746760 () Bool)

(assert (=> b!1308899 (=> (not res!868908) (not e!746760))))

(declare-datatypes ((array!87360 0))(
  ( (array!87361 (arr!42160 (Array (_ BitVec 32) (_ BitVec 64))) (size!42710 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87360)

(declare-datatypes ((List!29889 0))(
  ( (Nil!29886) (Cons!29885 (h!31094 (_ BitVec 64)) (t!43495 List!29889)) )
))
(declare-fun arrayNoDuplicates!0 (array!87360 (_ BitVec 32) List!29889) Bool)

(assert (=> b!1308899 (= res!868908 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29886))))

(declare-fun mapNonEmpty!54403 () Bool)

(declare-fun mapRes!54403 () Bool)

(declare-fun tp!103681 () Bool)

(declare-fun e!746759 () Bool)

(assert (=> mapNonEmpty!54403 (= mapRes!54403 (and tp!103681 e!746759))))

(declare-datatypes ((V!52013 0))(
  ( (V!52014 (val!17666 Int)) )
))
(declare-datatypes ((ValueCell!16693 0))(
  ( (ValueCellFull!16693 (v!20293 V!52013)) (EmptyCell!16693) )
))
(declare-fun mapRest!54403 () (Array (_ BitVec 32) ValueCell!16693))

(declare-fun mapKey!54403 () (_ BitVec 32))

(declare-datatypes ((array!87362 0))(
  ( (array!87363 (arr!42161 (Array (_ BitVec 32) ValueCell!16693)) (size!42711 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87362)

(declare-fun mapValue!54403 () ValueCell!16693)

(assert (=> mapNonEmpty!54403 (= (arr!42161 _values!1354) (store mapRest!54403 mapKey!54403 mapValue!54403))))

(declare-fun mapIsEmpty!54403 () Bool)

(assert (=> mapIsEmpty!54403 mapRes!54403))

(declare-fun b!1308900 () Bool)

(assert (=> b!1308900 (= e!746760 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585198 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52013)

(declare-fun zeroValue!1296 () V!52013)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22748 0))(
  ( (tuple2!22749 (_1!11385 (_ BitVec 64)) (_2!11385 V!52013)) )
))
(declare-datatypes ((List!29890 0))(
  ( (Nil!29887) (Cons!29886 (h!31095 tuple2!22748) (t!43496 List!29890)) )
))
(declare-datatypes ((ListLongMap!20405 0))(
  ( (ListLongMap!20406 (toList!10218 List!29890)) )
))
(declare-fun contains!8368 (ListLongMap!20405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5231 (array!87360 array!87362 (_ BitVec 32) (_ BitVec 32) V!52013 V!52013 (_ BitVec 32) Int) ListLongMap!20405)

(assert (=> b!1308900 (= lt!585198 (contains!8368 (getCurrentListMap!5231 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!868905 () Bool)

(assert (=> start!110618 (=> (not res!868905) (not e!746760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110618 (= res!868905 (validMask!0 mask!2040))))

(assert (=> start!110618 e!746760))

(assert (=> start!110618 tp!103680))

(declare-fun array_inv!31867 (array!87360) Bool)

(assert (=> start!110618 (array_inv!31867 _keys!1628)))

(assert (=> start!110618 true))

(declare-fun tp_is_empty!35183 () Bool)

(assert (=> start!110618 tp_is_empty!35183))

(declare-fun e!746758 () Bool)

(declare-fun array_inv!31868 (array!87362) Bool)

(assert (=> start!110618 (and (array_inv!31868 _values!1354) e!746758)))

(declare-fun b!1308901 () Bool)

(declare-fun res!868907 () Bool)

(assert (=> b!1308901 (=> (not res!868907) (not e!746760))))

(assert (=> b!1308901 (= res!868907 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42710 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308902 () Bool)

(declare-fun res!868906 () Bool)

(assert (=> b!1308902 (=> (not res!868906) (not e!746760))))

(assert (=> b!1308902 (= res!868906 (and (= (size!42711 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42710 _keys!1628) (size!42711 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308903 () Bool)

(assert (=> b!1308903 (= e!746759 tp_is_empty!35183)))

(declare-fun b!1308904 () Bool)

(declare-fun res!868904 () Bool)

(assert (=> b!1308904 (=> (not res!868904) (not e!746760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87360 (_ BitVec 32)) Bool)

(assert (=> b!1308904 (= res!868904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308905 () Bool)

(declare-fun e!746761 () Bool)

(assert (=> b!1308905 (= e!746758 (and e!746761 mapRes!54403))))

(declare-fun condMapEmpty!54403 () Bool)

(declare-fun mapDefault!54403 () ValueCell!16693)

