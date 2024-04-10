; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108526 () Bool)

(assert start!108526)

(declare-fun b_free!28073 () Bool)

(declare-fun b_next!28073 () Bool)

(assert (=> start!108526 (= b_free!28073 (not b_next!28073))))

(declare-fun tp!99329 () Bool)

(declare-fun b_and!46133 () Bool)

(assert (=> start!108526 (= tp!99329 b_and!46133)))

(declare-fun b!1280995 () Bool)

(declare-fun e!731914 () Bool)

(declare-fun tp_is_empty!33713 () Bool)

(assert (=> b!1280995 (= e!731914 tp_is_empty!33713)))

(declare-fun b!1280996 () Bool)

(declare-fun res!850925 () Bool)

(declare-fun e!731915 () Bool)

(assert (=> b!1280996 (=> (not res!850925) (not e!731915))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84500 0))(
  ( (array!84501 (arr!40754 (Array (_ BitVec 32) (_ BitVec 64))) (size!41304 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84500)

(assert (=> b!1280996 (= res!850925 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41304 _keys!1741))))))

(declare-fun b!1280997 () Bool)

(declare-fun res!850927 () Bool)

(assert (=> b!1280997 (=> (not res!850927) (not e!731915))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84500 (_ BitVec 32)) Bool)

(assert (=> b!1280997 (= res!850927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280998 () Bool)

(assert (=> b!1280998 (= e!731915 (not true))))

(declare-datatypes ((V!50053 0))(
  ( (V!50054 (val!16931 Int)) )
))
(declare-fun minValue!1387 () V!50053)

(declare-fun zeroValue!1387 () V!50053)

(declare-datatypes ((ValueCell!15958 0))(
  ( (ValueCellFull!15958 (v!19531 V!50053)) (EmptyCell!15958) )
))
(declare-datatypes ((array!84502 0))(
  ( (array!84503 (arr!40755 (Array (_ BitVec 32) ValueCell!15958)) (size!41305 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84502)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21676 0))(
  ( (tuple2!21677 (_1!10849 (_ BitVec 64)) (_2!10849 V!50053)) )
))
(declare-datatypes ((List!28872 0))(
  ( (Nil!28869) (Cons!28868 (h!30077 tuple2!21676) (t!42412 List!28872)) )
))
(declare-datatypes ((ListLongMap!19333 0))(
  ( (ListLongMap!19334 (toList!9682 List!28872)) )
))
(declare-fun contains!7797 (ListLongMap!19333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4766 (array!84500 array!84502 (_ BitVec 32) (_ BitVec 32) V!50053 V!50053 (_ BitVec 32) Int) ListLongMap!19333)

(assert (=> b!1280998 (contains!7797 (getCurrentListMap!4766 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42421 0))(
  ( (Unit!42422) )
))
(declare-fun lt!576182 () Unit!42421)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 (array!84500 array!84502 (_ BitVec 32) (_ BitVec 32) V!50053 V!50053 (_ BitVec 64) (_ BitVec 32) Int) Unit!42421)

(assert (=> b!1280998 (= lt!576182 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!15 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun res!850922 () Bool)

(assert (=> start!108526 (=> (not res!850922) (not e!731915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108526 (= res!850922 (validMask!0 mask!2175))))

(assert (=> start!108526 e!731915))

(assert (=> start!108526 tp_is_empty!33713))

(assert (=> start!108526 true))

(declare-fun e!731911 () Bool)

(declare-fun array_inv!30927 (array!84502) Bool)

(assert (=> start!108526 (and (array_inv!30927 _values!1445) e!731911)))

(declare-fun array_inv!30928 (array!84500) Bool)

(assert (=> start!108526 (array_inv!30928 _keys!1741)))

(assert (=> start!108526 tp!99329))

(declare-fun b!1280999 () Bool)

(declare-fun res!850928 () Bool)

(assert (=> b!1280999 (=> (not res!850928) (not e!731915))))

(declare-datatypes ((List!28873 0))(
  ( (Nil!28870) (Cons!28869 (h!30078 (_ BitVec 64)) (t!42413 List!28873)) )
))
(declare-fun arrayNoDuplicates!0 (array!84500 (_ BitVec 32) List!28873) Bool)

(assert (=> b!1280999 (= res!850928 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28870))))

(declare-fun b!1281000 () Bool)

(declare-fun res!850926 () Bool)

(assert (=> b!1281000 (=> (not res!850926) (not e!731915))))

(assert (=> b!1281000 (= res!850926 (contains!7797 (getCurrentListMap!4766 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52121 () Bool)

(declare-fun mapRes!52121 () Bool)

(declare-fun tp!99328 () Bool)

(declare-fun e!731912 () Bool)

(assert (=> mapNonEmpty!52121 (= mapRes!52121 (and tp!99328 e!731912))))

(declare-fun mapValue!52121 () ValueCell!15958)

(declare-fun mapRest!52121 () (Array (_ BitVec 32) ValueCell!15958))

(declare-fun mapKey!52121 () (_ BitVec 32))

(assert (=> mapNonEmpty!52121 (= (arr!40755 _values!1445) (store mapRest!52121 mapKey!52121 mapValue!52121))))

(declare-fun b!1281001 () Bool)

(assert (=> b!1281001 (= e!731912 tp_is_empty!33713)))

(declare-fun b!1281002 () Bool)

(declare-fun res!850923 () Bool)

(assert (=> b!1281002 (=> (not res!850923) (not e!731915))))

(assert (=> b!1281002 (= res!850923 (and (= (size!41305 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41304 _keys!1741) (size!41305 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281003 () Bool)

(assert (=> b!1281003 (= e!731911 (and e!731914 mapRes!52121))))

(declare-fun condMapEmpty!52121 () Bool)

(declare-fun mapDefault!52121 () ValueCell!15958)

