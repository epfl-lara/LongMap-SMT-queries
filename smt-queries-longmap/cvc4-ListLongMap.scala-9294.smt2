; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111116 () Bool)

(assert start!111116)

(declare-fun b_free!29951 () Bool)

(declare-fun b_next!29951 () Bool)

(assert (=> start!111116 (= b_free!29951 (not b_next!29951))))

(declare-fun tp!105175 () Bool)

(declare-fun b_and!48159 () Bool)

(assert (=> start!111116 (= tp!105175 b_and!48159)))

(declare-fun b!1315622 () Bool)

(declare-fun res!873389 () Bool)

(declare-fun e!750495 () Bool)

(assert (=> b!1315622 (=> (not res!873389) (not e!750495))))

(declare-datatypes ((array!88324 0))(
  ( (array!88325 (arr!42642 (Array (_ BitVec 32) (_ BitVec 64))) (size!43192 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88324)

(declare-datatypes ((List!30249 0))(
  ( (Nil!30246) (Cons!30245 (h!31454 (_ BitVec 64)) (t!43855 List!30249)) )
))
(declare-fun arrayNoDuplicates!0 (array!88324 (_ BitVec 32) List!30249) Bool)

(assert (=> b!1315622 (= res!873389 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30246))))

(declare-fun b!1315623 () Bool)

(declare-fun res!873387 () Bool)

(assert (=> b!1315623 (=> (not res!873387) (not e!750495))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88324 (_ BitVec 32)) Bool)

(assert (=> b!1315623 (= res!873387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55150 () Bool)

(declare-fun mapRes!55150 () Bool)

(declare-fun tp!105174 () Bool)

(declare-fun e!750496 () Bool)

(assert (=> mapNonEmpty!55150 (= mapRes!55150 (and tp!105174 e!750496))))

(declare-datatypes ((V!52677 0))(
  ( (V!52678 (val!17915 Int)) )
))
(declare-datatypes ((ValueCell!16942 0))(
  ( (ValueCellFull!16942 (v!20542 V!52677)) (EmptyCell!16942) )
))
(declare-fun mapRest!55150 () (Array (_ BitVec 32) ValueCell!16942))

(declare-datatypes ((array!88326 0))(
  ( (array!88327 (arr!42643 (Array (_ BitVec 32) ValueCell!16942)) (size!43193 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88326)

(declare-fun mapValue!55150 () ValueCell!16942)

(declare-fun mapKey!55150 () (_ BitVec 32))

(assert (=> mapNonEmpty!55150 (= (arr!42643 _values!1354) (store mapRest!55150 mapKey!55150 mapValue!55150))))

(declare-fun b!1315624 () Bool)

(declare-fun res!873390 () Bool)

(assert (=> b!1315624 (=> (not res!873390) (not e!750495))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315624 (= res!873390 (and (= (size!43193 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43192 _keys!1628) (size!43193 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315625 () Bool)

(assert (=> b!1315625 (= e!750495 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52677)

(declare-fun zeroValue!1296 () V!52677)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585936 () Bool)

(declare-datatypes ((tuple2!23114 0))(
  ( (tuple2!23115 (_1!11568 (_ BitVec 64)) (_2!11568 V!52677)) )
))
(declare-datatypes ((List!30250 0))(
  ( (Nil!30247) (Cons!30246 (h!31455 tuple2!23114) (t!43856 List!30250)) )
))
(declare-datatypes ((ListLongMap!20771 0))(
  ( (ListLongMap!20772 (toList!10401 List!30250)) )
))
(declare-fun contains!8551 (ListLongMap!20771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5414 (array!88324 array!88326 (_ BitVec 32) (_ BitVec 32) V!52677 V!52677 (_ BitVec 32) Int) ListLongMap!20771)

(assert (=> b!1315625 (= lt!585936 (contains!8551 (getCurrentListMap!5414 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!873386 () Bool)

(assert (=> start!111116 (=> (not res!873386) (not e!750495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111116 (= res!873386 (validMask!0 mask!2040))))

(assert (=> start!111116 e!750495))

(assert (=> start!111116 tp!105175))

(declare-fun array_inv!32207 (array!88324) Bool)

(assert (=> start!111116 (array_inv!32207 _keys!1628)))

(assert (=> start!111116 true))

(declare-fun tp_is_empty!35681 () Bool)

(assert (=> start!111116 tp_is_empty!35681))

(declare-fun e!750493 () Bool)

(declare-fun array_inv!32208 (array!88326) Bool)

(assert (=> start!111116 (and (array_inv!32208 _values!1354) e!750493)))

(declare-fun b!1315626 () Bool)

(declare-fun e!750494 () Bool)

(assert (=> b!1315626 (= e!750494 tp_is_empty!35681)))

(declare-fun mapIsEmpty!55150 () Bool)

(assert (=> mapIsEmpty!55150 mapRes!55150))

(declare-fun b!1315627 () Bool)

(assert (=> b!1315627 (= e!750493 (and e!750494 mapRes!55150))))

(declare-fun condMapEmpty!55150 () Bool)

(declare-fun mapDefault!55150 () ValueCell!16942)

