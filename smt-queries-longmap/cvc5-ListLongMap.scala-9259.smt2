; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110902 () Bool)

(assert start!110902)

(declare-fun b_free!29737 () Bool)

(declare-fun b_next!29737 () Bool)

(assert (=> start!110902 (= b_free!29737 (not b_next!29737))))

(declare-fun tp!104533 () Bool)

(declare-fun b_and!47945 () Bool)

(assert (=> start!110902 (= tp!104533 b_and!47945)))

(declare-fun b!1312955 () Bool)

(declare-fun e!748888 () Bool)

(declare-fun tp_is_empty!35467 () Bool)

(assert (=> b!1312955 (= e!748888 tp_is_empty!35467)))

(declare-fun mapIsEmpty!54829 () Bool)

(declare-fun mapRes!54829 () Bool)

(assert (=> mapIsEmpty!54829 mapRes!54829))

(declare-fun mapNonEmpty!54829 () Bool)

(declare-fun tp!104532 () Bool)

(assert (=> mapNonEmpty!54829 (= mapRes!54829 (and tp!104532 e!748888))))

(declare-datatypes ((V!52393 0))(
  ( (V!52394 (val!17808 Int)) )
))
(declare-datatypes ((ValueCell!16835 0))(
  ( (ValueCellFull!16835 (v!20435 V!52393)) (EmptyCell!16835) )
))
(declare-fun mapValue!54829 () ValueCell!16835)

(declare-datatypes ((array!87916 0))(
  ( (array!87917 (arr!42438 (Array (_ BitVec 32) ValueCell!16835)) (size!42988 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87916)

(declare-fun mapRest!54829 () (Array (_ BitVec 32) ValueCell!16835))

(declare-fun mapKey!54829 () (_ BitVec 32))

(assert (=> mapNonEmpty!54829 (= (arr!42438 _values!1354) (store mapRest!54829 mapKey!54829 mapValue!54829))))

(declare-fun b!1312956 () Bool)

(declare-fun e!748892 () Bool)

(assert (=> b!1312956 (= e!748892 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87918 0))(
  ( (array!87919 (arr!42439 (Array (_ BitVec 32) (_ BitVec 64))) (size!42989 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87918)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52393)

(declare-fun zeroValue!1296 () V!52393)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585624 () Bool)

(declare-datatypes ((tuple2!22956 0))(
  ( (tuple2!22957 (_1!11489 (_ BitVec 64)) (_2!11489 V!52393)) )
))
(declare-datatypes ((List!30093 0))(
  ( (Nil!30090) (Cons!30089 (h!31298 tuple2!22956) (t!43699 List!30093)) )
))
(declare-datatypes ((ListLongMap!20613 0))(
  ( (ListLongMap!20614 (toList!10322 List!30093)) )
))
(declare-fun contains!8472 (ListLongMap!20613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5335 (array!87918 array!87916 (_ BitVec 32) (_ BitVec 32) V!52393 V!52393 (_ BitVec 32) Int) ListLongMap!20613)

(assert (=> b!1312956 (= lt!585624 (contains!8472 (getCurrentListMap!5335 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312957 () Bool)

(declare-fun res!871683 () Bool)

(assert (=> b!1312957 (=> (not res!871683) (not e!748892))))

(assert (=> b!1312957 (= res!871683 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42989 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312958 () Bool)

(declare-fun res!871684 () Bool)

(assert (=> b!1312958 (=> (not res!871684) (not e!748892))))

(assert (=> b!1312958 (= res!871684 (and (= (size!42988 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42989 _keys!1628) (size!42988 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312959 () Bool)

(declare-fun e!748889 () Bool)

(declare-fun e!748890 () Bool)

(assert (=> b!1312959 (= e!748889 (and e!748890 mapRes!54829))))

(declare-fun condMapEmpty!54829 () Bool)

(declare-fun mapDefault!54829 () ValueCell!16835)

