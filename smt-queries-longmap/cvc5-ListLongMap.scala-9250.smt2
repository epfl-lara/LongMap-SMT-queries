; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110848 () Bool)

(assert start!110848)

(declare-fun b_free!29683 () Bool)

(declare-fun b_next!29683 () Bool)

(assert (=> start!110848 (= b_free!29683 (not b_next!29683))))

(declare-fun tp!104371 () Bool)

(declare-fun b_and!47891 () Bool)

(assert (=> start!110848 (= tp!104371 b_and!47891)))

(declare-fun mapIsEmpty!54748 () Bool)

(declare-fun mapRes!54748 () Bool)

(assert (=> mapIsEmpty!54748 mapRes!54748))

(declare-fun b!1312207 () Bool)

(declare-fun e!748483 () Bool)

(declare-fun tp_is_empty!35413 () Bool)

(assert (=> b!1312207 (= e!748483 tp_is_empty!35413)))

(declare-fun b!1312208 () Bool)

(declare-fun res!871185 () Bool)

(declare-fun e!748485 () Bool)

(assert (=> b!1312208 (=> (not res!871185) (not e!748485))))

(declare-datatypes ((array!87814 0))(
  ( (array!87815 (arr!42387 (Array (_ BitVec 32) (_ BitVec 64))) (size!42937 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87814)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312208 (= res!871185 (not (= (select (arr!42387 _keys!1628) from!2020) k!1175)))))

(declare-fun mapNonEmpty!54748 () Bool)

(declare-fun tp!104370 () Bool)

(declare-fun e!748487 () Bool)

(assert (=> mapNonEmpty!54748 (= mapRes!54748 (and tp!104370 e!748487))))

(declare-datatypes ((V!52321 0))(
  ( (V!52322 (val!17781 Int)) )
))
(declare-datatypes ((ValueCell!16808 0))(
  ( (ValueCellFull!16808 (v!20408 V!52321)) (EmptyCell!16808) )
))
(declare-fun mapRest!54748 () (Array (_ BitVec 32) ValueCell!16808))

(declare-fun mapKey!54748 () (_ BitVec 32))

(declare-datatypes ((array!87816 0))(
  ( (array!87817 (arr!42388 (Array (_ BitVec 32) ValueCell!16808)) (size!42938 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87816)

(declare-fun mapValue!54748 () ValueCell!16808)

(assert (=> mapNonEmpty!54748 (= (arr!42388 _values!1354) (store mapRest!54748 mapKey!54748 mapValue!54748))))

(declare-fun b!1312210 () Bool)

(declare-fun res!871182 () Bool)

(assert (=> b!1312210 (=> (not res!871182) (not e!748485))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52321)

(declare-fun zeroValue!1296 () V!52321)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22918 0))(
  ( (tuple2!22919 (_1!11470 (_ BitVec 64)) (_2!11470 V!52321)) )
))
(declare-datatypes ((List!30056 0))(
  ( (Nil!30053) (Cons!30052 (h!31261 tuple2!22918) (t!43662 List!30056)) )
))
(declare-datatypes ((ListLongMap!20575 0))(
  ( (ListLongMap!20576 (toList!10303 List!30056)) )
))
(declare-fun contains!8453 (ListLongMap!20575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5316 (array!87814 array!87816 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 32) Int) ListLongMap!20575)

(assert (=> b!1312210 (= res!871182 (contains!8453 (getCurrentListMap!5316 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312211 () Bool)

(declare-fun res!871181 () Bool)

(assert (=> b!1312211 (=> (not res!871181) (not e!748485))))

(declare-datatypes ((List!30057 0))(
  ( (Nil!30054) (Cons!30053 (h!31262 (_ BitVec 64)) (t!43663 List!30057)) )
))
(declare-fun arrayNoDuplicates!0 (array!87814 (_ BitVec 32) List!30057) Bool)

(assert (=> b!1312211 (= res!871181 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30054))))

(declare-fun b!1312212 () Bool)

(declare-fun res!871177 () Bool)

(assert (=> b!1312212 (=> (not res!871177) (not e!748485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87814 (_ BitVec 32)) Bool)

(assert (=> b!1312212 (= res!871177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312213 () Bool)

(assert (=> b!1312213 (= e!748485 (not true))))

(assert (=> b!1312213 (contains!8453 (getCurrentListMap!5316 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43372 0))(
  ( (Unit!43373) )
))
(declare-fun lt!585543 () Unit!43372)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!13 (array!87814 array!87816 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 64) (_ BitVec 32) Int) Unit!43372)

(assert (=> b!1312213 (= lt!585543 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!13 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312214 () Bool)

(declare-fun res!871184 () Bool)

(assert (=> b!1312214 (=> (not res!871184) (not e!748485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312214 (= res!871184 (validKeyInArray!0 (select (arr!42387 _keys!1628) from!2020)))))

(declare-fun b!1312215 () Bool)

(assert (=> b!1312215 (= e!748487 tp_is_empty!35413)))

(declare-fun b!1312216 () Bool)

(declare-fun res!871180 () Bool)

(assert (=> b!1312216 (=> (not res!871180) (not e!748485))))

(assert (=> b!1312216 (= res!871180 (and (= (size!42938 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42937 _keys!1628) (size!42938 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312209 () Bool)

(declare-fun res!871178 () Bool)

(assert (=> b!1312209 (=> (not res!871178) (not e!748485))))

(assert (=> b!1312209 (= res!871178 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42937 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871183 () Bool)

(assert (=> start!110848 (=> (not res!871183) (not e!748485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110848 (= res!871183 (validMask!0 mask!2040))))

(assert (=> start!110848 e!748485))

(assert (=> start!110848 tp!104371))

(declare-fun array_inv!32029 (array!87814) Bool)

(assert (=> start!110848 (array_inv!32029 _keys!1628)))

(assert (=> start!110848 true))

(assert (=> start!110848 tp_is_empty!35413))

(declare-fun e!748484 () Bool)

(declare-fun array_inv!32030 (array!87816) Bool)

(assert (=> start!110848 (and (array_inv!32030 _values!1354) e!748484)))

(declare-fun b!1312217 () Bool)

(declare-fun res!871179 () Bool)

(assert (=> b!1312217 (=> (not res!871179) (not e!748485))))

(assert (=> b!1312217 (= res!871179 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312218 () Bool)

(assert (=> b!1312218 (= e!748484 (and e!748483 mapRes!54748))))

(declare-fun condMapEmpty!54748 () Bool)

(declare-fun mapDefault!54748 () ValueCell!16808)

