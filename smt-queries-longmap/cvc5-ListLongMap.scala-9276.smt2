; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111004 () Bool)

(assert start!111004)

(declare-fun b_free!29839 () Bool)

(declare-fun b_next!29839 () Bool)

(assert (=> start!111004 (= b_free!29839 (not b_next!29839))))

(declare-fun tp!104838 () Bool)

(declare-fun b_and!48047 () Bool)

(assert (=> start!111004 (= tp!104838 b_and!48047)))

(declare-fun mapIsEmpty!54982 () Bool)

(declare-fun mapRes!54982 () Bool)

(assert (=> mapIsEmpty!54982 mapRes!54982))

(declare-fun b!1314214 () Bool)

(declare-fun e!749654 () Bool)

(declare-fun tp_is_empty!35569 () Bool)

(assert (=> b!1314214 (= e!749654 tp_is_empty!35569)))

(declare-fun b!1314215 () Bool)

(declare-fun res!872490 () Bool)

(declare-fun e!749657 () Bool)

(assert (=> b!1314215 (=> (not res!872490) (not e!749657))))

(declare-datatypes ((array!88110 0))(
  ( (array!88111 (arr!42535 (Array (_ BitVec 32) (_ BitVec 64))) (size!43085 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88110)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52529 0))(
  ( (V!52530 (val!17859 Int)) )
))
(declare-datatypes ((ValueCell!16886 0))(
  ( (ValueCellFull!16886 (v!20486 V!52529)) (EmptyCell!16886) )
))
(declare-datatypes ((array!88112 0))(
  ( (array!88113 (arr!42536 (Array (_ BitVec 32) ValueCell!16886)) (size!43086 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88112)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314215 (= res!872490 (and (= (size!43086 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43085 _keys!1628) (size!43086 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314216 () Bool)

(declare-fun res!872485 () Bool)

(assert (=> b!1314216 (=> (not res!872485) (not e!749657))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314216 (= res!872485 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43085 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314217 () Bool)

(declare-fun res!872486 () Bool)

(assert (=> b!1314217 (=> (not res!872486) (not e!749657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88110 (_ BitVec 32)) Bool)

(assert (=> b!1314217 (= res!872486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314218 () Bool)

(declare-fun res!872482 () Bool)

(assert (=> b!1314218 (=> (not res!872482) (not e!749657))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52529)

(declare-fun zeroValue!1296 () V!52529)

(declare-datatypes ((tuple2!23026 0))(
  ( (tuple2!23027 (_1!11524 (_ BitVec 64)) (_2!11524 V!52529)) )
))
(declare-datatypes ((List!30163 0))(
  ( (Nil!30160) (Cons!30159 (h!31368 tuple2!23026) (t!43769 List!30163)) )
))
(declare-datatypes ((ListLongMap!20683 0))(
  ( (ListLongMap!20684 (toList!10357 List!30163)) )
))
(declare-fun contains!8507 (ListLongMap!20683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5370 (array!88110 array!88112 (_ BitVec 32) (_ BitVec 32) V!52529 V!52529 (_ BitVec 32) Int) ListLongMap!20683)

(assert (=> b!1314218 (= res!872482 (contains!8507 (getCurrentListMap!5370 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314219 () Bool)

(declare-fun res!872487 () Bool)

(assert (=> b!1314219 (=> (not res!872487) (not e!749657))))

(declare-datatypes ((List!30164 0))(
  ( (Nil!30161) (Cons!30160 (h!31369 (_ BitVec 64)) (t!43770 List!30164)) )
))
(declare-fun arrayNoDuplicates!0 (array!88110 (_ BitVec 32) List!30164) Bool)

(assert (=> b!1314219 (= res!872487 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30161))))

(declare-fun mapNonEmpty!54982 () Bool)

(declare-fun tp!104839 () Bool)

(assert (=> mapNonEmpty!54982 (= mapRes!54982 (and tp!104839 e!749654))))

(declare-fun mapKey!54982 () (_ BitVec 32))

(declare-fun mapValue!54982 () ValueCell!16886)

(declare-fun mapRest!54982 () (Array (_ BitVec 32) ValueCell!16886))

(assert (=> mapNonEmpty!54982 (= (arr!42536 _values!1354) (store mapRest!54982 mapKey!54982 mapValue!54982))))

(declare-fun b!1314220 () Bool)

(declare-fun res!872483 () Bool)

(assert (=> b!1314220 (=> (not res!872483) (not e!749657))))

(assert (=> b!1314220 (= res!872483 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1314222 () Bool)

(declare-fun e!749656 () Bool)

(assert (=> b!1314222 (= e!749656 tp_is_empty!35569)))

(declare-fun b!1314223 () Bool)

(declare-fun res!872484 () Bool)

(assert (=> b!1314223 (=> (not res!872484) (not e!749657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1314223 (= res!872484 (validKeyInArray!0 (select (arr!42535 _keys!1628) from!2020)))))

(declare-fun b!1314224 () Bool)

(declare-fun res!872489 () Bool)

(assert (=> b!1314224 (=> (not res!872489) (not e!749657))))

(assert (=> b!1314224 (= res!872489 (not (= (select (arr!42535 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1314225 () Bool)

(declare-fun e!749655 () Bool)

(assert (=> b!1314225 (= e!749655 (and e!749656 mapRes!54982))))

(declare-fun condMapEmpty!54982 () Bool)

(declare-fun mapDefault!54982 () ValueCell!16886)

