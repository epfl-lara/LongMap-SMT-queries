; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111128 () Bool)

(assert start!111128)

(declare-fun b_free!29963 () Bool)

(declare-fun b_next!29963 () Bool)

(assert (=> start!111128 (= b_free!29963 (not b_next!29963))))

(declare-fun tp!105211 () Bool)

(declare-fun b_and!48171 () Bool)

(assert (=> start!111128 (= tp!105211 b_and!48171)))

(declare-fun b!1315766 () Bool)

(declare-fun res!873480 () Bool)

(declare-fun e!750587 () Bool)

(assert (=> b!1315766 (=> (not res!873480) (not e!750587))))

(declare-datatypes ((array!88346 0))(
  ( (array!88347 (arr!42653 (Array (_ BitVec 32) (_ BitVec 64))) (size!43203 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88346)

(declare-datatypes ((List!30258 0))(
  ( (Nil!30255) (Cons!30254 (h!31463 (_ BitVec 64)) (t!43864 List!30258)) )
))
(declare-fun arrayNoDuplicates!0 (array!88346 (_ BitVec 32) List!30258) Bool)

(assert (=> b!1315766 (= res!873480 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30255))))

(declare-fun b!1315767 () Bool)

(assert (=> b!1315767 (= e!750587 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585954 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52693 0))(
  ( (V!52694 (val!17921 Int)) )
))
(declare-fun minValue!1296 () V!52693)

(declare-datatypes ((ValueCell!16948 0))(
  ( (ValueCellFull!16948 (v!20548 V!52693)) (EmptyCell!16948) )
))
(declare-datatypes ((array!88348 0))(
  ( (array!88349 (arr!42654 (Array (_ BitVec 32) ValueCell!16948)) (size!43204 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88348)

(declare-fun zeroValue!1296 () V!52693)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23122 0))(
  ( (tuple2!23123 (_1!11572 (_ BitVec 64)) (_2!11572 V!52693)) )
))
(declare-datatypes ((List!30259 0))(
  ( (Nil!30256) (Cons!30255 (h!31464 tuple2!23122) (t!43865 List!30259)) )
))
(declare-datatypes ((ListLongMap!20779 0))(
  ( (ListLongMap!20780 (toList!10405 List!30259)) )
))
(declare-fun contains!8555 (ListLongMap!20779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5418 (array!88346 array!88348 (_ BitVec 32) (_ BitVec 32) V!52693 V!52693 (_ BitVec 32) Int) ListLongMap!20779)

(assert (=> b!1315767 (= lt!585954 (contains!8555 (getCurrentListMap!5418 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315768 () Bool)

(declare-fun res!873479 () Bool)

(assert (=> b!1315768 (=> (not res!873479) (not e!750587))))

(assert (=> b!1315768 (= res!873479 (and (= (size!43204 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43203 _keys!1628) (size!43204 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!873476 () Bool)

(assert (=> start!111128 (=> (not res!873476) (not e!750587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111128 (= res!873476 (validMask!0 mask!2040))))

(assert (=> start!111128 e!750587))

(assert (=> start!111128 tp!105211))

(declare-fun array_inv!32215 (array!88346) Bool)

(assert (=> start!111128 (array_inv!32215 _keys!1628)))

(assert (=> start!111128 true))

(declare-fun tp_is_empty!35693 () Bool)

(assert (=> start!111128 tp_is_empty!35693))

(declare-fun e!750583 () Bool)

(declare-fun array_inv!32216 (array!88348) Bool)

(assert (=> start!111128 (and (array_inv!32216 _values!1354) e!750583)))

(declare-fun mapIsEmpty!55168 () Bool)

(declare-fun mapRes!55168 () Bool)

(assert (=> mapIsEmpty!55168 mapRes!55168))

(declare-fun b!1315769 () Bool)

(declare-fun res!873478 () Bool)

(assert (=> b!1315769 (=> (not res!873478) (not e!750587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88346 (_ BitVec 32)) Bool)

(assert (=> b!1315769 (= res!873478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315770 () Bool)

(declare-fun e!750584 () Bool)

(assert (=> b!1315770 (= e!750584 tp_is_empty!35693)))

(declare-fun b!1315771 () Bool)

(declare-fun e!750586 () Bool)

(assert (=> b!1315771 (= e!750586 tp_is_empty!35693)))

(declare-fun mapNonEmpty!55168 () Bool)

(declare-fun tp!105210 () Bool)

(assert (=> mapNonEmpty!55168 (= mapRes!55168 (and tp!105210 e!750584))))

(declare-fun mapKey!55168 () (_ BitVec 32))

(declare-fun mapValue!55168 () ValueCell!16948)

(declare-fun mapRest!55168 () (Array (_ BitVec 32) ValueCell!16948))

(assert (=> mapNonEmpty!55168 (= (arr!42654 _values!1354) (store mapRest!55168 mapKey!55168 mapValue!55168))))

(declare-fun b!1315772 () Bool)

(declare-fun res!873477 () Bool)

(assert (=> b!1315772 (=> (not res!873477) (not e!750587))))

(assert (=> b!1315772 (= res!873477 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43203 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315773 () Bool)

(assert (=> b!1315773 (= e!750583 (and e!750586 mapRes!55168))))

(declare-fun condMapEmpty!55168 () Bool)

(declare-fun mapDefault!55168 () ValueCell!16948)

