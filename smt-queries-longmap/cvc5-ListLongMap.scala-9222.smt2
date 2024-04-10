; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110680 () Bool)

(assert start!110680)

(declare-fun b_free!29515 () Bool)

(declare-fun b_next!29515 () Bool)

(assert (=> start!110680 (= b_free!29515 (not b_next!29515))))

(declare-fun tp!103866 () Bool)

(declare-fun b_and!47723 () Bool)

(assert (=> start!110680 (= tp!103866 b_and!47723)))

(declare-fun b!1309643 () Bool)

(declare-fun res!869369 () Bool)

(declare-fun e!747227 () Bool)

(assert (=> b!1309643 (=> (not res!869369) (not e!747227))))

(declare-datatypes ((array!87480 0))(
  ( (array!87481 (arr!42220 (Array (_ BitVec 32) (_ BitVec 64))) (size!42770 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87480)

(declare-datatypes ((List!29933 0))(
  ( (Nil!29930) (Cons!29929 (h!31138 (_ BitVec 64)) (t!43539 List!29933)) )
))
(declare-fun arrayNoDuplicates!0 (array!87480 (_ BitVec 32) List!29933) Bool)

(assert (=> b!1309643 (= res!869369 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29930))))

(declare-fun b!1309644 () Bool)

(declare-fun e!747226 () Bool)

(declare-fun tp_is_empty!35245 () Bool)

(assert (=> b!1309644 (= e!747226 tp_is_empty!35245)))

(declare-fun b!1309645 () Bool)

(declare-fun res!869370 () Bool)

(assert (=> b!1309645 (=> (not res!869370) (not e!747227))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87480 (_ BitVec 32)) Bool)

(assert (=> b!1309645 (= res!869370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309646 () Bool)

(assert (=> b!1309646 (= e!747227 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52097 0))(
  ( (V!52098 (val!17697 Int)) )
))
(declare-fun minValue!1296 () V!52097)

(declare-fun lt!585291 () Bool)

(declare-datatypes ((ValueCell!16724 0))(
  ( (ValueCellFull!16724 (v!20324 V!52097)) (EmptyCell!16724) )
))
(declare-datatypes ((array!87482 0))(
  ( (array!87483 (arr!42221 (Array (_ BitVec 32) ValueCell!16724)) (size!42771 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87482)

(declare-fun zeroValue!1296 () V!52097)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!22792 0))(
  ( (tuple2!22793 (_1!11407 (_ BitVec 64)) (_2!11407 V!52097)) )
))
(declare-datatypes ((List!29934 0))(
  ( (Nil!29931) (Cons!29930 (h!31139 tuple2!22792) (t!43540 List!29934)) )
))
(declare-datatypes ((ListLongMap!20449 0))(
  ( (ListLongMap!20450 (toList!10240 List!29934)) )
))
(declare-fun contains!8390 (ListLongMap!20449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5253 (array!87480 array!87482 (_ BitVec 32) (_ BitVec 32) V!52097 V!52097 (_ BitVec 32) Int) ListLongMap!20449)

(assert (=> b!1309646 (= lt!585291 (contains!8390 (getCurrentListMap!5253 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!54496 () Bool)

(declare-fun mapRes!54496 () Bool)

(assert (=> mapIsEmpty!54496 mapRes!54496))

(declare-fun b!1309647 () Bool)

(declare-fun e!747223 () Bool)

(assert (=> b!1309647 (= e!747223 tp_is_empty!35245)))

(declare-fun mapNonEmpty!54496 () Bool)

(declare-fun tp!103867 () Bool)

(assert (=> mapNonEmpty!54496 (= mapRes!54496 (and tp!103867 e!747226))))

(declare-fun mapRest!54496 () (Array (_ BitVec 32) ValueCell!16724))

(declare-fun mapValue!54496 () ValueCell!16724)

(declare-fun mapKey!54496 () (_ BitVec 32))

(assert (=> mapNonEmpty!54496 (= (arr!42221 _values!1354) (store mapRest!54496 mapKey!54496 mapValue!54496))))

(declare-fun b!1309649 () Bool)

(declare-fun res!869371 () Bool)

(assert (=> b!1309649 (=> (not res!869371) (not e!747227))))

(assert (=> b!1309649 (= res!869371 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42770 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309650 () Bool)

(declare-fun res!869373 () Bool)

(assert (=> b!1309650 (=> (not res!869373) (not e!747227))))

(assert (=> b!1309650 (= res!869373 (and (= (size!42771 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42770 _keys!1628) (size!42771 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!869372 () Bool)

(assert (=> start!110680 (=> (not res!869372) (not e!747227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110680 (= res!869372 (validMask!0 mask!2040))))

(assert (=> start!110680 e!747227))

(assert (=> start!110680 tp!103866))

(declare-fun array_inv!31905 (array!87480) Bool)

(assert (=> start!110680 (array_inv!31905 _keys!1628)))

(assert (=> start!110680 true))

(assert (=> start!110680 tp_is_empty!35245))

(declare-fun e!747225 () Bool)

(declare-fun array_inv!31906 (array!87482) Bool)

(assert (=> start!110680 (and (array_inv!31906 _values!1354) e!747225)))

(declare-fun b!1309648 () Bool)

(assert (=> b!1309648 (= e!747225 (and e!747223 mapRes!54496))))

(declare-fun condMapEmpty!54496 () Bool)

(declare-fun mapDefault!54496 () ValueCell!16724)

