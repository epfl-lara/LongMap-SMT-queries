; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108766 () Bool)

(assert start!108766)

(declare-fun b_free!28279 () Bool)

(declare-fun b_next!28279 () Bool)

(assert (=> start!108766 (= b_free!28279 (not b_next!28279))))

(declare-fun tp!99952 () Bool)

(declare-fun b_and!46345 () Bool)

(assert (=> start!108766 (= tp!99952 b_and!46345)))

(declare-fun res!853234 () Bool)

(declare-fun e!733653 () Bool)

(assert (=> start!108766 (=> (not res!853234) (not e!733653))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108766 (= res!853234 (validMask!0 mask!2175))))

(assert (=> start!108766 e!733653))

(declare-fun tp_is_empty!33919 () Bool)

(assert (=> start!108766 tp_is_empty!33919))

(assert (=> start!108766 true))

(declare-datatypes ((V!50329 0))(
  ( (V!50330 (val!17034 Int)) )
))
(declare-datatypes ((ValueCell!16061 0))(
  ( (ValueCellFull!16061 (v!19636 V!50329)) (EmptyCell!16061) )
))
(declare-datatypes ((array!84896 0))(
  ( (array!84897 (arr!40950 (Array (_ BitVec 32) ValueCell!16061)) (size!41500 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84896)

(declare-fun e!733651 () Bool)

(declare-fun array_inv!31057 (array!84896) Bool)

(assert (=> start!108766 (and (array_inv!31057 _values!1445) e!733651)))

(declare-datatypes ((array!84898 0))(
  ( (array!84899 (arr!40951 (Array (_ BitVec 32) (_ BitVec 64))) (size!41501 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84898)

(declare-fun array_inv!31058 (array!84898) Bool)

(assert (=> start!108766 (array_inv!31058 _keys!1741)))

(assert (=> start!108766 tp!99952))

(declare-fun b!1284380 () Bool)

(declare-fun res!853236 () Bool)

(assert (=> b!1284380 (=> (not res!853236) (not e!733653))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284380 (= res!853236 (and (= (size!41500 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41501 _keys!1741) (size!41500 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52436 () Bool)

(declare-fun mapRes!52436 () Bool)

(assert (=> mapIsEmpty!52436 mapRes!52436))

(declare-fun b!1284381 () Bool)

(declare-fun e!733655 () Bool)

(assert (=> b!1284381 (= e!733655 tp_is_empty!33919)))

(declare-fun b!1284382 () Bool)

(assert (=> b!1284382 (= e!733653 false)))

(declare-fun minValue!1387 () V!50329)

(declare-fun zeroValue!1387 () V!50329)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576805 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21826 0))(
  ( (tuple2!21827 (_1!10924 (_ BitVec 64)) (_2!10924 V!50329)) )
))
(declare-datatypes ((List!29018 0))(
  ( (Nil!29015) (Cons!29014 (h!30223 tuple2!21826) (t!42562 List!29018)) )
))
(declare-datatypes ((ListLongMap!19483 0))(
  ( (ListLongMap!19484 (toList!9757 List!29018)) )
))
(declare-fun contains!7874 (ListLongMap!19483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4836 (array!84898 array!84896 (_ BitVec 32) (_ BitVec 32) V!50329 V!50329 (_ BitVec 32) Int) ListLongMap!19483)

(assert (=> b!1284382 (= lt!576805 (contains!7874 (getCurrentListMap!4836 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284383 () Bool)

(declare-fun res!853232 () Bool)

(assert (=> b!1284383 (=> (not res!853232) (not e!733653))))

(declare-datatypes ((List!29019 0))(
  ( (Nil!29016) (Cons!29015 (h!30224 (_ BitVec 64)) (t!42563 List!29019)) )
))
(declare-fun arrayNoDuplicates!0 (array!84898 (_ BitVec 32) List!29019) Bool)

(assert (=> b!1284383 (= res!853232 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29016))))

(declare-fun b!1284384 () Bool)

(declare-fun res!853233 () Bool)

(assert (=> b!1284384 (=> (not res!853233) (not e!733653))))

(assert (=> b!1284384 (= res!853233 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41501 _keys!1741))))))

(declare-fun b!1284385 () Bool)

(declare-fun res!853235 () Bool)

(assert (=> b!1284385 (=> (not res!853235) (not e!733653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84898 (_ BitVec 32)) Bool)

(assert (=> b!1284385 (= res!853235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284386 () Bool)

(declare-fun e!733654 () Bool)

(assert (=> b!1284386 (= e!733651 (and e!733654 mapRes!52436))))

(declare-fun condMapEmpty!52436 () Bool)

(declare-fun mapDefault!52436 () ValueCell!16061)

