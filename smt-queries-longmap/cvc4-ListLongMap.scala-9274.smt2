; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110996 () Bool)

(assert start!110996)

(declare-fun b_free!29831 () Bool)

(declare-fun b_next!29831 () Bool)

(assert (=> start!110996 (= b_free!29831 (not b_next!29831))))

(declare-fun tp!104814 () Bool)

(declare-fun b_and!48039 () Bool)

(assert (=> start!110996 (= tp!104814 b_and!48039)))

(declare-fun b!1314110 () Bool)

(declare-fun res!872415 () Bool)

(declare-fun e!749596 () Bool)

(assert (=> b!1314110 (=> (not res!872415) (not e!749596))))

(declare-datatypes ((array!88094 0))(
  ( (array!88095 (arr!42527 (Array (_ BitVec 32) (_ BitVec 64))) (size!43077 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88094)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314110 (= res!872415 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43077 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!872418 () Bool)

(assert (=> start!110996 (=> (not res!872418) (not e!749596))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110996 (= res!872418 (validMask!0 mask!2040))))

(assert (=> start!110996 e!749596))

(assert (=> start!110996 tp!104814))

(declare-fun array_inv!32125 (array!88094) Bool)

(assert (=> start!110996 (array_inv!32125 _keys!1628)))

(assert (=> start!110996 true))

(declare-fun tp_is_empty!35561 () Bool)

(assert (=> start!110996 tp_is_empty!35561))

(declare-datatypes ((V!52517 0))(
  ( (V!52518 (val!17855 Int)) )
))
(declare-datatypes ((ValueCell!16882 0))(
  ( (ValueCellFull!16882 (v!20482 V!52517)) (EmptyCell!16882) )
))
(declare-datatypes ((array!88096 0))(
  ( (array!88097 (arr!42528 (Array (_ BitVec 32) ValueCell!16882)) (size!43078 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88096)

(declare-fun e!749594 () Bool)

(declare-fun array_inv!32126 (array!88096) Bool)

(assert (=> start!110996 (and (array_inv!32126 _values!1354) e!749594)))

(declare-fun b!1314111 () Bool)

(assert (=> b!1314111 (= e!749596 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52517)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52517)

(declare-fun lt!585756 () Bool)

(declare-datatypes ((tuple2!23022 0))(
  ( (tuple2!23023 (_1!11522 (_ BitVec 64)) (_2!11522 V!52517)) )
))
(declare-datatypes ((List!30158 0))(
  ( (Nil!30155) (Cons!30154 (h!31363 tuple2!23022) (t!43764 List!30158)) )
))
(declare-datatypes ((ListLongMap!20679 0))(
  ( (ListLongMap!20680 (toList!10355 List!30158)) )
))
(declare-fun contains!8505 (ListLongMap!20679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5368 (array!88094 array!88096 (_ BitVec 32) (_ BitVec 32) V!52517 V!52517 (_ BitVec 32) Int) ListLongMap!20679)

(assert (=> b!1314111 (= lt!585756 (contains!8505 (getCurrentListMap!5368 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314112 () Bool)

(declare-fun e!749597 () Bool)

(assert (=> b!1314112 (= e!749597 tp_is_empty!35561)))

(declare-fun b!1314113 () Bool)

(declare-fun res!872414 () Bool)

(assert (=> b!1314113 (=> (not res!872414) (not e!749596))))

(assert (=> b!1314113 (= res!872414 (and (= (size!43078 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43077 _keys!1628) (size!43078 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314114 () Bool)

(declare-fun res!872417 () Bool)

(assert (=> b!1314114 (=> (not res!872417) (not e!749596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88094 (_ BitVec 32)) Bool)

(assert (=> b!1314114 (= res!872417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314115 () Bool)

(declare-fun res!872416 () Bool)

(assert (=> b!1314115 (=> (not res!872416) (not e!749596))))

(declare-datatypes ((List!30159 0))(
  ( (Nil!30156) (Cons!30155 (h!31364 (_ BitVec 64)) (t!43765 List!30159)) )
))
(declare-fun arrayNoDuplicates!0 (array!88094 (_ BitVec 32) List!30159) Bool)

(assert (=> b!1314115 (= res!872416 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30156))))

(declare-fun mapIsEmpty!54970 () Bool)

(declare-fun mapRes!54970 () Bool)

(assert (=> mapIsEmpty!54970 mapRes!54970))

(declare-fun mapNonEmpty!54970 () Bool)

(declare-fun tp!104815 () Bool)

(declare-fun e!749593 () Bool)

(assert (=> mapNonEmpty!54970 (= mapRes!54970 (and tp!104815 e!749593))))

(declare-fun mapValue!54970 () ValueCell!16882)

(declare-fun mapKey!54970 () (_ BitVec 32))

(declare-fun mapRest!54970 () (Array (_ BitVec 32) ValueCell!16882))

(assert (=> mapNonEmpty!54970 (= (arr!42528 _values!1354) (store mapRest!54970 mapKey!54970 mapValue!54970))))

(declare-fun b!1314116 () Bool)

(assert (=> b!1314116 (= e!749593 tp_is_empty!35561)))

(declare-fun b!1314117 () Bool)

(assert (=> b!1314117 (= e!749594 (and e!749597 mapRes!54970))))

(declare-fun condMapEmpty!54970 () Bool)

(declare-fun mapDefault!54970 () ValueCell!16882)

