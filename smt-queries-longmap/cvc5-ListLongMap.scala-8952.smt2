; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108438 () Bool)

(assert start!108438)

(declare-fun b_free!27985 () Bool)

(declare-fun b_next!27985 () Bool)

(assert (=> start!108438 (= b_free!27985 (not b_next!27985))))

(declare-fun tp!99065 () Bool)

(declare-fun b_and!46045 () Bool)

(assert (=> start!108438 (= tp!99065 b_and!46045)))

(declare-fun b!1279833 () Bool)

(declare-fun res!850158 () Bool)

(declare-fun e!731254 () Bool)

(assert (=> b!1279833 (=> (not res!850158) (not e!731254))))

(declare-datatypes ((array!84332 0))(
  ( (array!84333 (arr!40670 (Array (_ BitVec 32) (_ BitVec 64))) (size!41220 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84332)

(declare-datatypes ((List!28805 0))(
  ( (Nil!28802) (Cons!28801 (h!30010 (_ BitVec 64)) (t!42345 List!28805)) )
))
(declare-fun arrayNoDuplicates!0 (array!84332 (_ BitVec 32) List!28805) Bool)

(assert (=> b!1279833 (= res!850158 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28802))))

(declare-fun b!1279834 () Bool)

(declare-fun e!731255 () Bool)

(declare-fun tp_is_empty!33625 () Bool)

(assert (=> b!1279834 (= e!731255 tp_is_empty!33625)))

(declare-fun b!1279835 () Bool)

(assert (=> b!1279835 (= e!731254 false)))

(declare-datatypes ((V!49937 0))(
  ( (V!49938 (val!16887 Int)) )
))
(declare-fun minValue!1387 () V!49937)

(declare-fun zeroValue!1387 () V!49937)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15914 0))(
  ( (ValueCellFull!15914 (v!19487 V!49937)) (EmptyCell!15914) )
))
(declare-datatypes ((array!84334 0))(
  ( (array!84335 (arr!40671 (Array (_ BitVec 32) ValueCell!15914)) (size!41221 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84334)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576050 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21606 0))(
  ( (tuple2!21607 (_1!10814 (_ BitVec 64)) (_2!10814 V!49937)) )
))
(declare-datatypes ((List!28806 0))(
  ( (Nil!28803) (Cons!28802 (h!30011 tuple2!21606) (t!42346 List!28806)) )
))
(declare-datatypes ((ListLongMap!19263 0))(
  ( (ListLongMap!19264 (toList!9647 List!28806)) )
))
(declare-fun contains!7762 (ListLongMap!19263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4731 (array!84332 array!84334 (_ BitVec 32) (_ BitVec 32) V!49937 V!49937 (_ BitVec 32) Int) ListLongMap!19263)

(assert (=> b!1279835 (= lt!576050 (contains!7762 (getCurrentListMap!4731 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279836 () Bool)

(declare-fun res!850160 () Bool)

(assert (=> b!1279836 (=> (not res!850160) (not e!731254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84332 (_ BitVec 32)) Bool)

(assert (=> b!1279836 (= res!850160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51989 () Bool)

(declare-fun mapRes!51989 () Bool)

(assert (=> mapIsEmpty!51989 mapRes!51989))

(declare-fun b!1279838 () Bool)

(declare-fun e!731253 () Bool)

(declare-fun e!731251 () Bool)

(assert (=> b!1279838 (= e!731253 (and e!731251 mapRes!51989))))

(declare-fun condMapEmpty!51989 () Bool)

(declare-fun mapDefault!51989 () ValueCell!15914)

