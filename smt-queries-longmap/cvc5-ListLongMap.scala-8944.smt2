; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108390 () Bool)

(assert start!108390)

(declare-fun b_free!27937 () Bool)

(declare-fun b_next!27937 () Bool)

(assert (=> start!108390 (= b_free!27937 (not b_next!27937))))

(declare-fun tp!98921 () Bool)

(declare-fun b_and!45997 () Bool)

(assert (=> start!108390 (= tp!98921 b_and!45997)))

(declare-fun b!1279248 () Bool)

(declare-fun res!849787 () Bool)

(declare-fun e!730892 () Bool)

(assert (=> b!1279248 (=> (not res!849787) (not e!730892))))

(declare-datatypes ((array!84242 0))(
  ( (array!84243 (arr!40625 (Array (_ BitVec 32) (_ BitVec 64))) (size!41175 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84242)

(declare-datatypes ((List!28773 0))(
  ( (Nil!28770) (Cons!28769 (h!29978 (_ BitVec 64)) (t!42313 List!28773)) )
))
(declare-fun arrayNoDuplicates!0 (array!84242 (_ BitVec 32) List!28773) Bool)

(assert (=> b!1279248 (= res!849787 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28770))))

(declare-fun b!1279249 () Bool)

(declare-fun e!730894 () Bool)

(declare-fun tp_is_empty!33577 () Bool)

(assert (=> b!1279249 (= e!730894 tp_is_empty!33577)))

(declare-fun mapNonEmpty!51917 () Bool)

(declare-fun mapRes!51917 () Bool)

(declare-fun tp!98920 () Bool)

(assert (=> mapNonEmpty!51917 (= mapRes!51917 (and tp!98920 e!730894))))

(declare-fun mapKey!51917 () (_ BitVec 32))

(declare-datatypes ((V!49873 0))(
  ( (V!49874 (val!16863 Int)) )
))
(declare-datatypes ((ValueCell!15890 0))(
  ( (ValueCellFull!15890 (v!19463 V!49873)) (EmptyCell!15890) )
))
(declare-datatypes ((array!84244 0))(
  ( (array!84245 (arr!40626 (Array (_ BitVec 32) ValueCell!15890)) (size!41176 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84244)

(declare-fun mapValue!51917 () ValueCell!15890)

(declare-fun mapRest!51917 () (Array (_ BitVec 32) ValueCell!15890))

(assert (=> mapNonEmpty!51917 (= (arr!40626 _values!1445) (store mapRest!51917 mapKey!51917 mapValue!51917))))

(declare-fun b!1279250 () Bool)

(assert (=> b!1279250 (= e!730892 false)))

(declare-fun minValue!1387 () V!49873)

(declare-fun zeroValue!1387 () V!49873)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575987 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21574 0))(
  ( (tuple2!21575 (_1!10798 (_ BitVec 64)) (_2!10798 V!49873)) )
))
(declare-datatypes ((List!28774 0))(
  ( (Nil!28771) (Cons!28770 (h!29979 tuple2!21574) (t!42314 List!28774)) )
))
(declare-datatypes ((ListLongMap!19231 0))(
  ( (ListLongMap!19232 (toList!9631 List!28774)) )
))
(declare-fun contains!7746 (ListLongMap!19231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4715 (array!84242 array!84244 (_ BitVec 32) (_ BitVec 32) V!49873 V!49873 (_ BitVec 32) Int) ListLongMap!19231)

(assert (=> b!1279250 (= lt!575987 (contains!7746 (getCurrentListMap!4715 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279251 () Bool)

(declare-fun res!849789 () Bool)

(assert (=> b!1279251 (=> (not res!849789) (not e!730892))))

(assert (=> b!1279251 (= res!849789 (and (= (size!41176 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41175 _keys!1741) (size!41176 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279252 () Bool)

(declare-fun res!849790 () Bool)

(assert (=> b!1279252 (=> (not res!849790) (not e!730892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84242 (_ BitVec 32)) Bool)

(assert (=> b!1279252 (= res!849790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51917 () Bool)

(assert (=> mapIsEmpty!51917 mapRes!51917))

(declare-fun b!1279253 () Bool)

(declare-fun e!730895 () Bool)

(declare-fun e!730891 () Bool)

(assert (=> b!1279253 (= e!730895 (and e!730891 mapRes!51917))))

(declare-fun condMapEmpty!51917 () Bool)

(declare-fun mapDefault!51917 () ValueCell!15890)

