; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108478 () Bool)

(assert start!108478)

(declare-fun b_free!28025 () Bool)

(declare-fun b_next!28025 () Bool)

(assert (=> start!108478 (= b_free!28025 (not b_next!28025))))

(declare-fun tp!99184 () Bool)

(declare-fun b_and!46085 () Bool)

(assert (=> start!108478 (= tp!99184 b_and!46085)))

(declare-fun b!1280313 () Bool)

(declare-fun res!850457 () Bool)

(declare-fun e!731554 () Bool)

(assert (=> b!1280313 (=> (not res!850457) (not e!731554))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84408 0))(
  ( (array!84409 (arr!40708 (Array (_ BitVec 32) (_ BitVec 64))) (size!41258 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84408)

(assert (=> b!1280313 (= res!850457 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41258 _keys!1741))))))

(declare-fun res!850456 () Bool)

(assert (=> start!108478 (=> (not res!850456) (not e!731554))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108478 (= res!850456 (validMask!0 mask!2175))))

(assert (=> start!108478 e!731554))

(declare-fun tp_is_empty!33665 () Bool)

(assert (=> start!108478 tp_is_empty!33665))

(assert (=> start!108478 true))

(declare-datatypes ((V!49989 0))(
  ( (V!49990 (val!16907 Int)) )
))
(declare-datatypes ((ValueCell!15934 0))(
  ( (ValueCellFull!15934 (v!19507 V!49989)) (EmptyCell!15934) )
))
(declare-datatypes ((array!84410 0))(
  ( (array!84411 (arr!40709 (Array (_ BitVec 32) ValueCell!15934)) (size!41259 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84410)

(declare-fun e!731555 () Bool)

(declare-fun array_inv!30897 (array!84410) Bool)

(assert (=> start!108478 (and (array_inv!30897 _values!1445) e!731555)))

(declare-fun array_inv!30898 (array!84408) Bool)

(assert (=> start!108478 (array_inv!30898 _keys!1741)))

(assert (=> start!108478 tp!99184))

(declare-fun mapNonEmpty!52049 () Bool)

(declare-fun mapRes!52049 () Bool)

(declare-fun tp!99185 () Bool)

(declare-fun e!731553 () Bool)

(assert (=> mapNonEmpty!52049 (= mapRes!52049 (and tp!99185 e!731553))))

(declare-fun mapKey!52049 () (_ BitVec 32))

(declare-fun mapValue!52049 () ValueCell!15934)

(declare-fun mapRest!52049 () (Array (_ BitVec 32) ValueCell!15934))

(assert (=> mapNonEmpty!52049 (= (arr!40709 _values!1445) (store mapRest!52049 mapKey!52049 mapValue!52049))))

(declare-fun b!1280314 () Bool)

(declare-fun res!850458 () Bool)

(assert (=> b!1280314 (=> (not res!850458) (not e!731554))))

(declare-datatypes ((List!28837 0))(
  ( (Nil!28834) (Cons!28833 (h!30042 (_ BitVec 64)) (t!42377 List!28837)) )
))
(declare-fun arrayNoDuplicates!0 (array!84408 (_ BitVec 32) List!28837) Bool)

(assert (=> b!1280314 (= res!850458 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28834))))

(declare-fun mapIsEmpty!52049 () Bool)

(assert (=> mapIsEmpty!52049 mapRes!52049))

(declare-fun b!1280315 () Bool)

(assert (=> b!1280315 (= e!731554 false)))

(declare-fun minValue!1387 () V!49989)

(declare-fun zeroValue!1387 () V!49989)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576110 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21638 0))(
  ( (tuple2!21639 (_1!10830 (_ BitVec 64)) (_2!10830 V!49989)) )
))
(declare-datatypes ((List!28838 0))(
  ( (Nil!28835) (Cons!28834 (h!30043 tuple2!21638) (t!42378 List!28838)) )
))
(declare-datatypes ((ListLongMap!19295 0))(
  ( (ListLongMap!19296 (toList!9663 List!28838)) )
))
(declare-fun contains!7778 (ListLongMap!19295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4747 (array!84408 array!84410 (_ BitVec 32) (_ BitVec 32) V!49989 V!49989 (_ BitVec 32) Int) ListLongMap!19295)

(assert (=> b!1280315 (= lt!576110 (contains!7778 (getCurrentListMap!4747 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280316 () Bool)

(declare-fun e!731551 () Bool)

(assert (=> b!1280316 (= e!731551 tp_is_empty!33665)))

(declare-fun b!1280317 () Bool)

(declare-fun res!850459 () Bool)

(assert (=> b!1280317 (=> (not res!850459) (not e!731554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84408 (_ BitVec 32)) Bool)

(assert (=> b!1280317 (= res!850459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280318 () Bool)

(assert (=> b!1280318 (= e!731553 tp_is_empty!33665)))

(declare-fun b!1280319 () Bool)

(declare-fun res!850460 () Bool)

(assert (=> b!1280319 (=> (not res!850460) (not e!731554))))

(assert (=> b!1280319 (= res!850460 (and (= (size!41259 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41258 _keys!1741) (size!41259 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280320 () Bool)

(assert (=> b!1280320 (= e!731555 (and e!731551 mapRes!52049))))

(declare-fun condMapEmpty!52049 () Bool)

(declare-fun mapDefault!52049 () ValueCell!15934)

