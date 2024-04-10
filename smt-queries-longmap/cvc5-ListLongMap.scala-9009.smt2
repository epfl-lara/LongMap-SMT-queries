; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108814 () Bool)

(assert start!108814)

(declare-fun b_free!28327 () Bool)

(declare-fun b_next!28327 () Bool)

(assert (=> start!108814 (= b_free!28327 (not b_next!28327))))

(declare-fun tp!100096 () Bool)

(declare-fun b_and!46393 () Bool)

(assert (=> start!108814 (= tp!100096 b_and!46393)))

(declare-fun b!1285027 () Bool)

(declare-fun res!853665 () Bool)

(declare-fun e!734011 () Bool)

(assert (=> b!1285027 (=> (not res!853665) (not e!734011))))

(declare-datatypes ((array!84992 0))(
  ( (array!84993 (arr!40998 (Array (_ BitVec 32) (_ BitVec 64))) (size!41548 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84992)

(declare-datatypes ((List!29051 0))(
  ( (Nil!29048) (Cons!29047 (h!30256 (_ BitVec 64)) (t!42595 List!29051)) )
))
(declare-fun arrayNoDuplicates!0 (array!84992 (_ BitVec 32) List!29051) Bool)

(assert (=> b!1285027 (= res!853665 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29048))))

(declare-fun b!1285028 () Bool)

(declare-fun res!853667 () Bool)

(assert (=> b!1285028 (=> (not res!853667) (not e!734011))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285028 (= res!853667 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!853666 () Bool)

(assert (=> start!108814 (=> (not res!853666) (not e!734011))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108814 (= res!853666 (validMask!0 mask!2175))))

(assert (=> start!108814 e!734011))

(declare-fun tp_is_empty!33967 () Bool)

(assert (=> start!108814 tp_is_empty!33967))

(assert (=> start!108814 true))

(declare-datatypes ((V!50393 0))(
  ( (V!50394 (val!17058 Int)) )
))
(declare-datatypes ((ValueCell!16085 0))(
  ( (ValueCellFull!16085 (v!19660 V!50393)) (EmptyCell!16085) )
))
(declare-datatypes ((array!84994 0))(
  ( (array!84995 (arr!40999 (Array (_ BitVec 32) ValueCell!16085)) (size!41549 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84994)

(declare-fun e!734015 () Bool)

(declare-fun array_inv!31093 (array!84994) Bool)

(assert (=> start!108814 (and (array_inv!31093 _values!1445) e!734015)))

(declare-fun array_inv!31094 (array!84992) Bool)

(assert (=> start!108814 (array_inv!31094 _keys!1741)))

(assert (=> start!108814 tp!100096))

(declare-fun b!1285029 () Bool)

(declare-fun res!853671 () Bool)

(assert (=> b!1285029 (=> (not res!853671) (not e!734011))))

(assert (=> b!1285029 (= res!853671 (and (= (size!41549 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41548 _keys!1741) (size!41549 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285030 () Bool)

(declare-fun res!853670 () Bool)

(assert (=> b!1285030 (=> (not res!853670) (not e!734011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84992 (_ BitVec 32)) Bool)

(assert (=> b!1285030 (= res!853670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285031 () Bool)

(declare-fun e!734014 () Bool)

(assert (=> b!1285031 (= e!734014 tp_is_empty!33967)))

(declare-fun b!1285032 () Bool)

(declare-fun res!853664 () Bool)

(assert (=> b!1285032 (=> (not res!853664) (not e!734011))))

(declare-fun minValue!1387 () V!50393)

(declare-fun zeroValue!1387 () V!50393)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21858 0))(
  ( (tuple2!21859 (_1!10940 (_ BitVec 64)) (_2!10940 V!50393)) )
))
(declare-datatypes ((List!29052 0))(
  ( (Nil!29049) (Cons!29048 (h!30257 tuple2!21858) (t!42596 List!29052)) )
))
(declare-datatypes ((ListLongMap!19515 0))(
  ( (ListLongMap!19516 (toList!9773 List!29052)) )
))
(declare-fun contains!7890 (ListLongMap!19515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4851 (array!84992 array!84994 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19515)

(assert (=> b!1285032 (= res!853664 (contains!7890 (getCurrentListMap!4851 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285033 () Bool)

(assert (=> b!1285033 (= e!734011 false)))

(declare-fun lt!576868 () Bool)

(declare-fun +!4304 (ListLongMap!19515 tuple2!21858) ListLongMap!19515)

(declare-fun getCurrentListMapNoExtraKeys!5934 (array!84992 array!84994 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19515)

(assert (=> b!1285033 (= lt!576868 (contains!7890 (+!4304 (getCurrentListMapNoExtraKeys!5934 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun b!1285034 () Bool)

(declare-fun res!853663 () Bool)

(assert (=> b!1285034 (=> (not res!853663) (not e!734011))))

(assert (=> b!1285034 (= res!853663 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41548 _keys!1741))))))

(declare-fun b!1285035 () Bool)

(declare-fun e!734012 () Bool)

(assert (=> b!1285035 (= e!734012 tp_is_empty!33967)))

(declare-fun b!1285036 () Bool)

(declare-fun mapRes!52508 () Bool)

(assert (=> b!1285036 (= e!734015 (and e!734014 mapRes!52508))))

(declare-fun condMapEmpty!52508 () Bool)

(declare-fun mapDefault!52508 () ValueCell!16085)

