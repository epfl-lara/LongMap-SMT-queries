; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108520 () Bool)

(assert start!108520)

(declare-fun b_free!28067 () Bool)

(declare-fun b_next!28067 () Bool)

(assert (=> start!108520 (= b_free!28067 (not b_next!28067))))

(declare-fun tp!99310 () Bool)

(declare-fun b_and!46127 () Bool)

(assert (=> start!108520 (= tp!99310 b_and!46127)))

(declare-fun b!1280905 () Bool)

(declare-fun res!850860 () Bool)

(declare-fun e!731866 () Bool)

(assert (=> b!1280905 (=> (not res!850860) (not e!731866))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50045 0))(
  ( (V!50046 (val!16928 Int)) )
))
(declare-datatypes ((ValueCell!15955 0))(
  ( (ValueCellFull!15955 (v!19528 V!50045)) (EmptyCell!15955) )
))
(declare-datatypes ((array!84490 0))(
  ( (array!84491 (arr!40749 (Array (_ BitVec 32) ValueCell!15955)) (size!41299 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84490)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84492 0))(
  ( (array!84493 (arr!40750 (Array (_ BitVec 32) (_ BitVec 64))) (size!41300 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84492)

(assert (=> b!1280905 (= res!850860 (and (= (size!41299 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41300 _keys!1741) (size!41299 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52112 () Bool)

(declare-fun mapRes!52112 () Bool)

(assert (=> mapIsEmpty!52112 mapRes!52112))

(declare-fun mapNonEmpty!52112 () Bool)

(declare-fun tp!99311 () Bool)

(declare-fun e!731867 () Bool)

(assert (=> mapNonEmpty!52112 (= mapRes!52112 (and tp!99311 e!731867))))

(declare-fun mapValue!52112 () ValueCell!15955)

(declare-fun mapKey!52112 () (_ BitVec 32))

(declare-fun mapRest!52112 () (Array (_ BitVec 32) ValueCell!15955))

(assert (=> mapNonEmpty!52112 (= (arr!40749 _values!1445) (store mapRest!52112 mapKey!52112 mapValue!52112))))

(declare-fun res!850865 () Bool)

(assert (=> start!108520 (=> (not res!850865) (not e!731866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108520 (= res!850865 (validMask!0 mask!2175))))

(assert (=> start!108520 e!731866))

(declare-fun tp_is_empty!33707 () Bool)

(assert (=> start!108520 tp_is_empty!33707))

(assert (=> start!108520 true))

(declare-fun e!731869 () Bool)

(declare-fun array_inv!30923 (array!84490) Bool)

(assert (=> start!108520 (and (array_inv!30923 _values!1445) e!731869)))

(declare-fun array_inv!30924 (array!84492) Bool)

(assert (=> start!108520 (array_inv!30924 _keys!1741)))

(assert (=> start!108520 tp!99310))

(declare-fun b!1280906 () Bool)

(declare-fun res!850863 () Bool)

(assert (=> b!1280906 (=> (not res!850863) (not e!731866))))

(declare-fun minValue!1387 () V!50045)

(declare-fun zeroValue!1387 () V!50045)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21672 0))(
  ( (tuple2!21673 (_1!10847 (_ BitVec 64)) (_2!10847 V!50045)) )
))
(declare-datatypes ((List!28868 0))(
  ( (Nil!28865) (Cons!28864 (h!30073 tuple2!21672) (t!42408 List!28868)) )
))
(declare-datatypes ((ListLongMap!19329 0))(
  ( (ListLongMap!19330 (toList!9680 List!28868)) )
))
(declare-fun contains!7795 (ListLongMap!19329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4764 (array!84492 array!84490 (_ BitVec 32) (_ BitVec 32) V!50045 V!50045 (_ BitVec 32) Int) ListLongMap!19329)

(assert (=> b!1280906 (= res!850863 (contains!7795 (getCurrentListMap!4764 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280907 () Bool)

(declare-fun res!850864 () Bool)

(assert (=> b!1280907 (=> (not res!850864) (not e!731866))))

(declare-datatypes ((List!28869 0))(
  ( (Nil!28866) (Cons!28865 (h!30074 (_ BitVec 64)) (t!42409 List!28869)) )
))
(declare-fun arrayNoDuplicates!0 (array!84492 (_ BitVec 32) List!28869) Bool)

(assert (=> b!1280907 (= res!850864 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28866))))

(declare-fun b!1280908 () Bool)

(declare-fun res!850862 () Bool)

(assert (=> b!1280908 (=> (not res!850862) (not e!731866))))

(assert (=> b!1280908 (= res!850862 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41300 _keys!1741))))))

(declare-fun b!1280909 () Bool)

(assert (=> b!1280909 (= e!731867 tp_is_empty!33707)))

(declare-fun b!1280910 () Bool)

(assert (=> b!1280910 (= e!731866 (not true))))

(assert (=> b!1280910 (contains!7795 (getCurrentListMap!4764 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42417 0))(
  ( (Unit!42418) )
))
(declare-fun lt!576173 () Unit!42417)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!13 (array!84492 array!84490 (_ BitVec 32) (_ BitVec 32) V!50045 V!50045 (_ BitVec 64) (_ BitVec 32) Int) Unit!42417)

(assert (=> b!1280910 (= lt!576173 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!13 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280911 () Bool)

(declare-fun res!850859 () Bool)

(assert (=> b!1280911 (=> (not res!850859) (not e!731866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84492 (_ BitVec 32)) Bool)

(assert (=> b!1280911 (= res!850859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280912 () Bool)

(declare-fun res!850861 () Bool)

(assert (=> b!1280912 (=> (not res!850861) (not e!731866))))

(assert (=> b!1280912 (= res!850861 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41300 _keys!1741)) (not (= (select (arr!40750 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1280913 () Bool)

(declare-fun e!731868 () Bool)

(assert (=> b!1280913 (= e!731868 tp_is_empty!33707)))

(declare-fun b!1280914 () Bool)

(assert (=> b!1280914 (= e!731869 (and e!731868 mapRes!52112))))

(declare-fun condMapEmpty!52112 () Bool)

(declare-fun mapDefault!52112 () ValueCell!15955)

