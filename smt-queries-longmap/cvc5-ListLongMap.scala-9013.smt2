; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108838 () Bool)

(assert start!108838)

(declare-fun b_free!28351 () Bool)

(declare-fun b_next!28351 () Bool)

(assert (=> start!108838 (= b_free!28351 (not b_next!28351))))

(declare-fun tp!100169 () Bool)

(declare-fun b_and!46417 () Bool)

(assert (=> start!108838 (= tp!100169 b_and!46417)))

(declare-fun mapNonEmpty!52544 () Bool)

(declare-fun mapRes!52544 () Bool)

(declare-fun tp!100168 () Bool)

(declare-fun e!734195 () Bool)

(assert (=> mapNonEmpty!52544 (= mapRes!52544 (and tp!100168 e!734195))))

(declare-fun mapKey!52544 () (_ BitVec 32))

(declare-datatypes ((V!50425 0))(
  ( (V!50426 (val!17070 Int)) )
))
(declare-datatypes ((ValueCell!16097 0))(
  ( (ValueCellFull!16097 (v!19672 V!50425)) (EmptyCell!16097) )
))
(declare-fun mapRest!52544 () (Array (_ BitVec 32) ValueCell!16097))

(declare-datatypes ((array!85040 0))(
  ( (array!85041 (arr!41022 (Array (_ BitVec 32) ValueCell!16097)) (size!41572 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85040)

(declare-fun mapValue!52544 () ValueCell!16097)

(assert (=> mapNonEmpty!52544 (= (arr!41022 _values!1445) (store mapRest!52544 mapKey!52544 mapValue!52544))))

(declare-fun b!1285343 () Bool)

(declare-fun tp_is_empty!33991 () Bool)

(assert (=> b!1285343 (= e!734195 tp_is_empty!33991)))

(declare-fun b!1285344 () Bool)

(declare-fun res!853871 () Bool)

(declare-fun e!734191 () Bool)

(assert (=> b!1285344 (=> (not res!853871) (not e!734191))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85042 0))(
  ( (array!85043 (arr!41023 (Array (_ BitVec 32) (_ BitVec 64))) (size!41573 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85042)

(assert (=> b!1285344 (= res!853871 (and (= (size!41572 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41573 _keys!1741) (size!41572 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285345 () Bool)

(assert (=> b!1285345 (= e!734191 false)))

(declare-fun minValue!1387 () V!50425)

(declare-fun zeroValue!1387 () V!50425)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576904 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21882 0))(
  ( (tuple2!21883 (_1!10952 (_ BitVec 64)) (_2!10952 V!50425)) )
))
(declare-datatypes ((List!29072 0))(
  ( (Nil!29069) (Cons!29068 (h!30277 tuple2!21882) (t!42616 List!29072)) )
))
(declare-datatypes ((ListLongMap!19539 0))(
  ( (ListLongMap!19540 (toList!9785 List!29072)) )
))
(declare-fun contains!7902 (ListLongMap!19539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4863 (array!85042 array!85040 (_ BitVec 32) (_ BitVec 32) V!50425 V!50425 (_ BitVec 32) Int) ListLongMap!19539)

(assert (=> b!1285345 (= lt!576904 (contains!7902 (getCurrentListMap!4863 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285346 () Bool)

(declare-fun res!853872 () Bool)

(assert (=> b!1285346 (=> (not res!853872) (not e!734191))))

(declare-datatypes ((List!29073 0))(
  ( (Nil!29070) (Cons!29069 (h!30278 (_ BitVec 64)) (t!42617 List!29073)) )
))
(declare-fun arrayNoDuplicates!0 (array!85042 (_ BitVec 32) List!29073) Bool)

(assert (=> b!1285346 (= res!853872 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29070))))

(declare-fun b!1285347 () Bool)

(declare-fun e!734194 () Bool)

(assert (=> b!1285347 (= e!734194 tp_is_empty!33991)))

(declare-fun b!1285348 () Bool)

(declare-fun res!853874 () Bool)

(assert (=> b!1285348 (=> (not res!853874) (not e!734191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85042 (_ BitVec 32)) Bool)

(assert (=> b!1285348 (= res!853874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285349 () Bool)

(declare-fun e!734192 () Bool)

(assert (=> b!1285349 (= e!734192 (and e!734194 mapRes!52544))))

(declare-fun condMapEmpty!52544 () Bool)

(declare-fun mapDefault!52544 () ValueCell!16097)

