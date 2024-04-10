; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111094 () Bool)

(assert start!111094)

(declare-fun b_free!29929 () Bool)

(declare-fun b_next!29929 () Bool)

(assert (=> start!111094 (= b_free!29929 (not b_next!29929))))

(declare-fun tp!105108 () Bool)

(declare-fun b_and!48137 () Bool)

(assert (=> start!111094 (= tp!105108 b_and!48137)))

(declare-fun b!1315359 () Bool)

(declare-fun e!750329 () Bool)

(declare-fun tp_is_empty!35659 () Bool)

(assert (=> b!1315359 (= e!750329 tp_is_empty!35659)))

(declare-fun b!1315360 () Bool)

(declare-fun res!873225 () Bool)

(declare-fun e!750328 () Bool)

(assert (=> b!1315360 (=> (not res!873225) (not e!750328))))

(declare-datatypes ((array!88282 0))(
  ( (array!88283 (arr!42621 (Array (_ BitVec 32) (_ BitVec 64))) (size!43171 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88282)

(declare-datatypes ((List!30233 0))(
  ( (Nil!30230) (Cons!30229 (h!31438 (_ BitVec 64)) (t!43839 List!30233)) )
))
(declare-fun arrayNoDuplicates!0 (array!88282 (_ BitVec 32) List!30233) Bool)

(assert (=> b!1315360 (= res!873225 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30230))))

(declare-fun b!1315361 () Bool)

(declare-fun res!873222 () Bool)

(assert (=> b!1315361 (=> (not res!873222) (not e!750328))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88282 (_ BitVec 32)) Bool)

(assert (=> b!1315361 (= res!873222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55117 () Bool)

(declare-fun mapRes!55117 () Bool)

(declare-fun tp!105109 () Bool)

(assert (=> mapNonEmpty!55117 (= mapRes!55117 (and tp!105109 e!750329))))

(declare-datatypes ((V!52649 0))(
  ( (V!52650 (val!17904 Int)) )
))
(declare-datatypes ((ValueCell!16931 0))(
  ( (ValueCellFull!16931 (v!20531 V!52649)) (EmptyCell!16931) )
))
(declare-fun mapValue!55117 () ValueCell!16931)

(declare-fun mapKey!55117 () (_ BitVec 32))

(declare-fun mapRest!55117 () (Array (_ BitVec 32) ValueCell!16931))

(declare-datatypes ((array!88284 0))(
  ( (array!88285 (arr!42622 (Array (_ BitVec 32) ValueCell!16931)) (size!43172 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88284)

(assert (=> mapNonEmpty!55117 (= (arr!42622 _values!1354) (store mapRest!55117 mapKey!55117 mapValue!55117))))

(declare-fun mapIsEmpty!55117 () Bool)

(assert (=> mapIsEmpty!55117 mapRes!55117))

(declare-fun b!1315362 () Bool)

(assert (=> b!1315362 (= e!750328 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52649)

(declare-fun lt!585903 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52649)

(declare-datatypes ((tuple2!23098 0))(
  ( (tuple2!23099 (_1!11560 (_ BitVec 64)) (_2!11560 V!52649)) )
))
(declare-datatypes ((List!30234 0))(
  ( (Nil!30231) (Cons!30230 (h!31439 tuple2!23098) (t!43840 List!30234)) )
))
(declare-datatypes ((ListLongMap!20755 0))(
  ( (ListLongMap!20756 (toList!10393 List!30234)) )
))
(declare-fun contains!8543 (ListLongMap!20755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5406 (array!88282 array!88284 (_ BitVec 32) (_ BitVec 32) V!52649 V!52649 (_ BitVec 32) Int) ListLongMap!20755)

(assert (=> b!1315362 (= lt!585903 (contains!8543 (getCurrentListMap!5406 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315363 () Bool)

(declare-fun e!750332 () Bool)

(assert (=> b!1315363 (= e!750332 tp_is_empty!35659)))

(declare-fun res!873224 () Bool)

(assert (=> start!111094 (=> (not res!873224) (not e!750328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111094 (= res!873224 (validMask!0 mask!2040))))

(assert (=> start!111094 e!750328))

(assert (=> start!111094 tp!105108))

(declare-fun array_inv!32191 (array!88282) Bool)

(assert (=> start!111094 (array_inv!32191 _keys!1628)))

(assert (=> start!111094 true))

(assert (=> start!111094 tp_is_empty!35659))

(declare-fun e!750331 () Bool)

(declare-fun array_inv!32192 (array!88284) Bool)

(assert (=> start!111094 (and (array_inv!32192 _values!1354) e!750331)))

(declare-fun b!1315358 () Bool)

(declare-fun res!873221 () Bool)

(assert (=> b!1315358 (=> (not res!873221) (not e!750328))))

(assert (=> b!1315358 (= res!873221 (and (= (size!43172 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43171 _keys!1628) (size!43172 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315364 () Bool)

(assert (=> b!1315364 (= e!750331 (and e!750332 mapRes!55117))))

(declare-fun condMapEmpty!55117 () Bool)

(declare-fun mapDefault!55117 () ValueCell!16931)

