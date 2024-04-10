; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109168 () Bool)

(assert start!109168)

(declare-fun b_free!28657 () Bool)

(declare-fun b_next!28657 () Bool)

(assert (=> start!109168 (= b_free!28657 (not b_next!28657))))

(declare-fun tp!101090 () Bool)

(declare-fun b_and!46747 () Bool)

(assert (=> start!109168 (= tp!101090 b_and!46747)))

(declare-fun b!1291109 () Bool)

(declare-fun res!857777 () Bool)

(declare-fun e!737054 () Bool)

(assert (=> b!1291109 (=> (not res!857777) (not e!737054))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50833 0))(
  ( (V!50834 (val!17223 Int)) )
))
(declare-datatypes ((ValueCell!16250 0))(
  ( (ValueCellFull!16250 (v!19826 V!50833)) (EmptyCell!16250) )
))
(declare-datatypes ((array!85630 0))(
  ( (array!85631 (arr!41316 (Array (_ BitVec 32) ValueCell!16250)) (size!41866 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85630)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85632 0))(
  ( (array!85633 (arr!41317 (Array (_ BitVec 32) (_ BitVec 64))) (size!41867 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85632)

(assert (=> b!1291109 (= res!857777 (and (= (size!41866 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41867 _keys!1741) (size!41866 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291110 () Bool)

(declare-fun res!857770 () Bool)

(assert (=> b!1291110 (=> (not res!857770) (not e!737054))))

(declare-fun minValue!1387 () V!50833)

(declare-fun zeroValue!1387 () V!50833)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22138 0))(
  ( (tuple2!22139 (_1!11080 (_ BitVec 64)) (_2!11080 V!50833)) )
))
(declare-datatypes ((List!29300 0))(
  ( (Nil!29297) (Cons!29296 (h!30505 tuple2!22138) (t!42864 List!29300)) )
))
(declare-datatypes ((ListLongMap!19795 0))(
  ( (ListLongMap!19796 (toList!9913 List!29300)) )
))
(declare-fun contains!8031 (ListLongMap!19795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4966 (array!85632 array!85630 (_ BitVec 32) (_ BitVec 32) V!50833 V!50833 (_ BitVec 32) Int) ListLongMap!19795)

(assert (=> b!1291110 (= res!857770 (contains!8031 (getCurrentListMap!4966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!857772 () Bool)

(assert (=> start!109168 (=> (not res!857772) (not e!737054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109168 (= res!857772 (validMask!0 mask!2175))))

(assert (=> start!109168 e!737054))

(declare-fun tp_is_empty!34297 () Bool)

(assert (=> start!109168 tp_is_empty!34297))

(assert (=> start!109168 true))

(declare-fun e!737053 () Bool)

(declare-fun array_inv!31309 (array!85630) Bool)

(assert (=> start!109168 (and (array_inv!31309 _values!1445) e!737053)))

(declare-fun array_inv!31310 (array!85632) Bool)

(assert (=> start!109168 (array_inv!31310 _keys!1741)))

(assert (=> start!109168 tp!101090))

(declare-fun b!1291111 () Bool)

(declare-fun e!737050 () Bool)

(assert (=> b!1291111 (= e!737050 tp_is_empty!34297)))

(declare-fun b!1291112 () Bool)

(declare-fun res!857778 () Bool)

(assert (=> b!1291112 (=> (not res!857778) (not e!737054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85632 (_ BitVec 32)) Bool)

(assert (=> b!1291112 (= res!857778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53006 () Bool)

(declare-fun mapRes!53006 () Bool)

(declare-fun tp!101089 () Bool)

(assert (=> mapNonEmpty!53006 (= mapRes!53006 (and tp!101089 e!737050))))

(declare-fun mapRest!53006 () (Array (_ BitVec 32) ValueCell!16250))

(declare-fun mapValue!53006 () ValueCell!16250)

(declare-fun mapKey!53006 () (_ BitVec 32))

(assert (=> mapNonEmpty!53006 (= (arr!41316 _values!1445) (store mapRest!53006 mapKey!53006 mapValue!53006))))

(declare-fun b!1291113 () Bool)

(declare-fun e!737049 () Bool)

(assert (=> b!1291113 (= e!737053 (and e!737049 mapRes!53006))))

(declare-fun condMapEmpty!53006 () Bool)

(declare-fun mapDefault!53006 () ValueCell!16250)

