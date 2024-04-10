; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108596 () Bool)

(assert start!108596)

(declare-fun b_free!28123 () Bool)

(declare-fun b_next!28123 () Bool)

(assert (=> start!108596 (= b_free!28123 (not b_next!28123))))

(declare-fun tp!99482 () Bool)

(declare-fun b_and!46187 () Bool)

(assert (=> start!108596 (= tp!99482 b_and!46187)))

(declare-fun res!851516 () Bool)

(declare-fun e!732412 () Bool)

(assert (=> start!108596 (=> (not res!851516) (not e!732412))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108596 (= res!851516 (validMask!0 mask!2175))))

(assert (=> start!108596 e!732412))

(declare-fun tp_is_empty!33763 () Bool)

(assert (=> start!108596 tp_is_empty!33763))

(assert (=> start!108596 true))

(declare-datatypes ((V!50121 0))(
  ( (V!50122 (val!16956 Int)) )
))
(declare-datatypes ((ValueCell!15983 0))(
  ( (ValueCellFull!15983 (v!19557 V!50121)) (EmptyCell!15983) )
))
(declare-datatypes ((array!84594 0))(
  ( (array!84595 (arr!40800 (Array (_ BitVec 32) ValueCell!15983)) (size!41350 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84594)

(declare-fun e!732409 () Bool)

(declare-fun array_inv!30957 (array!84594) Bool)

(assert (=> start!108596 (and (array_inv!30957 _values!1445) e!732409)))

(declare-datatypes ((array!84596 0))(
  ( (array!84597 (arr!40801 (Array (_ BitVec 32) (_ BitVec 64))) (size!41351 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84596)

(declare-fun array_inv!30958 (array!84596) Bool)

(assert (=> start!108596 (array_inv!30958 _keys!1741)))

(assert (=> start!108596 tp!99482))

(declare-fun b!1281895 () Bool)

(declare-fun res!851515 () Bool)

(assert (=> b!1281895 (=> (not res!851515) (not e!732412))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281895 (= res!851515 (and (= (size!41350 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41351 _keys!1741) (size!41350 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281896 () Bool)

(declare-fun e!732413 () Bool)

(assert (=> b!1281896 (= e!732413 tp_is_empty!33763)))

(declare-fun mapNonEmpty!52199 () Bool)

(declare-fun mapRes!52199 () Bool)

(declare-fun tp!99481 () Bool)

(assert (=> mapNonEmpty!52199 (= mapRes!52199 (and tp!99481 e!732413))))

(declare-fun mapValue!52199 () ValueCell!15983)

(declare-fun mapRest!52199 () (Array (_ BitVec 32) ValueCell!15983))

(declare-fun mapKey!52199 () (_ BitVec 32))

(assert (=> mapNonEmpty!52199 (= (arr!40800 _values!1445) (store mapRest!52199 mapKey!52199 mapValue!52199))))

(declare-fun b!1281897 () Bool)

(declare-fun res!851513 () Bool)

(assert (=> b!1281897 (=> (not res!851513) (not e!732412))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281897 (= res!851513 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41351 _keys!1741))))))

(declare-fun b!1281898 () Bool)

(declare-fun res!851514 () Bool)

(assert (=> b!1281898 (=> (not res!851514) (not e!732412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84596 (_ BitVec 32)) Bool)

(assert (=> b!1281898 (= res!851514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281899 () Bool)

(declare-fun res!851517 () Bool)

(assert (=> b!1281899 (=> (not res!851517) (not e!732412))))

(declare-datatypes ((List!28904 0))(
  ( (Nil!28901) (Cons!28900 (h!30109 (_ BitVec 64)) (t!42446 List!28904)) )
))
(declare-fun arrayNoDuplicates!0 (array!84596 (_ BitVec 32) List!28904) Bool)

(assert (=> b!1281899 (= res!851517 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28901))))

(declare-fun b!1281900 () Bool)

(assert (=> b!1281900 (= e!732412 false)))

(declare-fun minValue!1387 () V!50121)

(declare-fun zeroValue!1387 () V!50121)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576403 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21712 0))(
  ( (tuple2!21713 (_1!10867 (_ BitVec 64)) (_2!10867 V!50121)) )
))
(declare-datatypes ((List!28905 0))(
  ( (Nil!28902) (Cons!28901 (h!30110 tuple2!21712) (t!42447 List!28905)) )
))
(declare-datatypes ((ListLongMap!19369 0))(
  ( (ListLongMap!19370 (toList!9700 List!28905)) )
))
(declare-fun contains!7816 (ListLongMap!19369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4784 (array!84596 array!84594 (_ BitVec 32) (_ BitVec 32) V!50121 V!50121 (_ BitVec 32) Int) ListLongMap!19369)

(assert (=> b!1281900 (= lt!576403 (contains!7816 (getCurrentListMap!4784 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1281901 () Bool)

(declare-fun e!732410 () Bool)

(assert (=> b!1281901 (= e!732410 tp_is_empty!33763)))

(declare-fun b!1281902 () Bool)

(assert (=> b!1281902 (= e!732409 (and e!732410 mapRes!52199))))

(declare-fun condMapEmpty!52199 () Bool)

(declare-fun mapDefault!52199 () ValueCell!15983)

