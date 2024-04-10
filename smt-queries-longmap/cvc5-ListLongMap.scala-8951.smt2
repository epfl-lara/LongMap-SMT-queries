; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108432 () Bool)

(assert start!108432)

(declare-fun b_free!27979 () Bool)

(declare-fun b_next!27979 () Bool)

(assert (=> start!108432 (= b_free!27979 (not b_next!27979))))

(declare-fun tp!99047 () Bool)

(declare-fun b_and!46039 () Bool)

(assert (=> start!108432 (= tp!99047 b_and!46039)))

(declare-fun b!1279761 () Bool)

(declare-fun res!850113 () Bool)

(declare-fun e!731206 () Bool)

(assert (=> b!1279761 (=> (not res!850113) (not e!731206))))

(declare-datatypes ((array!84320 0))(
  ( (array!84321 (arr!40664 (Array (_ BitVec 32) (_ BitVec 64))) (size!41214 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84320)

(declare-datatypes ((List!28801 0))(
  ( (Nil!28798) (Cons!28797 (h!30006 (_ BitVec 64)) (t!42341 List!28801)) )
))
(declare-fun arrayNoDuplicates!0 (array!84320 (_ BitVec 32) List!28801) Bool)

(assert (=> b!1279761 (= res!850113 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28798))))

(declare-fun b!1279762 () Bool)

(assert (=> b!1279762 (= e!731206 false)))

(declare-datatypes ((V!49929 0))(
  ( (V!49930 (val!16884 Int)) )
))
(declare-fun minValue!1387 () V!49929)

(declare-fun zeroValue!1387 () V!49929)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576041 () Bool)

(declare-datatypes ((ValueCell!15911 0))(
  ( (ValueCellFull!15911 (v!19484 V!49929)) (EmptyCell!15911) )
))
(declare-datatypes ((array!84322 0))(
  ( (array!84323 (arr!40665 (Array (_ BitVec 32) ValueCell!15911)) (size!41215 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84322)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21602 0))(
  ( (tuple2!21603 (_1!10812 (_ BitVec 64)) (_2!10812 V!49929)) )
))
(declare-datatypes ((List!28802 0))(
  ( (Nil!28799) (Cons!28798 (h!30007 tuple2!21602) (t!42342 List!28802)) )
))
(declare-datatypes ((ListLongMap!19259 0))(
  ( (ListLongMap!19260 (toList!9645 List!28802)) )
))
(declare-fun contains!7760 (ListLongMap!19259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4729 (array!84320 array!84322 (_ BitVec 32) (_ BitVec 32) V!49929 V!49929 (_ BitVec 32) Int) ListLongMap!19259)

(assert (=> b!1279762 (= lt!576041 (contains!7760 (getCurrentListMap!4729 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279763 () Bool)

(declare-fun res!850111 () Bool)

(assert (=> b!1279763 (=> (not res!850111) (not e!731206))))

(assert (=> b!1279763 (= res!850111 (and (= (size!41215 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41214 _keys!1741) (size!41215 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279764 () Bool)

(declare-fun res!850114 () Bool)

(assert (=> b!1279764 (=> (not res!850114) (not e!731206))))

(assert (=> b!1279764 (= res!850114 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41214 _keys!1741))))))

(declare-fun res!850115 () Bool)

(assert (=> start!108432 (=> (not res!850115) (not e!731206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108432 (= res!850115 (validMask!0 mask!2175))))

(assert (=> start!108432 e!731206))

(declare-fun tp_is_empty!33619 () Bool)

(assert (=> start!108432 tp_is_empty!33619))

(assert (=> start!108432 true))

(declare-fun e!731209 () Bool)

(declare-fun array_inv!30869 (array!84322) Bool)

(assert (=> start!108432 (and (array_inv!30869 _values!1445) e!731209)))

(declare-fun array_inv!30870 (array!84320) Bool)

(assert (=> start!108432 (array_inv!30870 _keys!1741)))

(assert (=> start!108432 tp!99047))

(declare-fun b!1279765 () Bool)

(declare-fun res!850112 () Bool)

(assert (=> b!1279765 (=> (not res!850112) (not e!731206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84320 (_ BitVec 32)) Bool)

(assert (=> b!1279765 (= res!850112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279766 () Bool)

(declare-fun e!731210 () Bool)

(assert (=> b!1279766 (= e!731210 tp_is_empty!33619)))

(declare-fun mapNonEmpty!51980 () Bool)

(declare-fun mapRes!51980 () Bool)

(declare-fun tp!99046 () Bool)

(assert (=> mapNonEmpty!51980 (= mapRes!51980 (and tp!99046 e!731210))))

(declare-fun mapKey!51980 () (_ BitVec 32))

(declare-fun mapRest!51980 () (Array (_ BitVec 32) ValueCell!15911))

(declare-fun mapValue!51980 () ValueCell!15911)

(assert (=> mapNonEmpty!51980 (= (arr!40665 _values!1445) (store mapRest!51980 mapKey!51980 mapValue!51980))))

(declare-fun mapIsEmpty!51980 () Bool)

(assert (=> mapIsEmpty!51980 mapRes!51980))

(declare-fun b!1279767 () Bool)

(declare-fun e!731207 () Bool)

(assert (=> b!1279767 (= e!731209 (and e!731207 mapRes!51980))))

(declare-fun condMapEmpty!51980 () Bool)

(declare-fun mapDefault!51980 () ValueCell!15911)

