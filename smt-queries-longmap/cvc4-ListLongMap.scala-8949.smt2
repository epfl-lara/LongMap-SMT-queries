; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108424 () Bool)

(assert start!108424)

(declare-fun b_free!27971 () Bool)

(declare-fun b_next!27971 () Bool)

(assert (=> start!108424 (= b_free!27971 (not b_next!27971))))

(declare-fun tp!99023 () Bool)

(declare-fun b_and!46031 () Bool)

(assert (=> start!108424 (= tp!99023 b_and!46031)))

(declare-fun b!1279664 () Bool)

(declare-fun res!850055 () Bool)

(declare-fun e!731147 () Bool)

(assert (=> b!1279664 (=> (not res!850055) (not e!731147))))

(declare-datatypes ((array!84306 0))(
  ( (array!84307 (arr!40657 (Array (_ BitVec 32) (_ BitVec 64))) (size!41207 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84306)

(declare-datatypes ((List!28797 0))(
  ( (Nil!28794) (Cons!28793 (h!30002 (_ BitVec 64)) (t!42337 List!28797)) )
))
(declare-fun arrayNoDuplicates!0 (array!84306 (_ BitVec 32) List!28797) Bool)

(assert (=> b!1279664 (= res!850055 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28794))))

(declare-fun b!1279665 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279665 (= e!731147 (bvsgt from!2144 (size!41207 _keys!1741)))))

(declare-fun b!1279666 () Bool)

(declare-fun res!850050 () Bool)

(assert (=> b!1279666 (=> (not res!850050) (not e!731147))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84306 (_ BitVec 32)) Bool)

(assert (=> b!1279666 (= res!850050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51968 () Bool)

(declare-fun mapRes!51968 () Bool)

(assert (=> mapIsEmpty!51968 mapRes!51968))

(declare-fun b!1279667 () Bool)

(declare-fun res!850053 () Bool)

(assert (=> b!1279667 (=> (not res!850053) (not e!731147))))

(declare-datatypes ((V!49917 0))(
  ( (V!49918 (val!16880 Int)) )
))
(declare-datatypes ((ValueCell!15907 0))(
  ( (ValueCellFull!15907 (v!19480 V!49917)) (EmptyCell!15907) )
))
(declare-datatypes ((array!84308 0))(
  ( (array!84309 (arr!40658 (Array (_ BitVec 32) ValueCell!15907)) (size!41208 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84308)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279667 (= res!850053 (and (= (size!41208 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41207 _keys!1741) (size!41208 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279668 () Bool)

(declare-fun res!850052 () Bool)

(assert (=> b!1279668 (=> (not res!850052) (not e!731147))))

(declare-fun minValue!1387 () V!49917)

(declare-fun zeroValue!1387 () V!49917)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21598 0))(
  ( (tuple2!21599 (_1!10810 (_ BitVec 64)) (_2!10810 V!49917)) )
))
(declare-datatypes ((List!28798 0))(
  ( (Nil!28795) (Cons!28794 (h!30003 tuple2!21598) (t!42338 List!28798)) )
))
(declare-datatypes ((ListLongMap!19255 0))(
  ( (ListLongMap!19256 (toList!9643 List!28798)) )
))
(declare-fun contains!7758 (ListLongMap!19255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4727 (array!84306 array!84308 (_ BitVec 32) (_ BitVec 32) V!49917 V!49917 (_ BitVec 32) Int) ListLongMap!19255)

(assert (=> b!1279668 (= res!850052 (contains!7758 (getCurrentListMap!4727 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279669 () Bool)

(declare-fun res!850054 () Bool)

(assert (=> b!1279669 (=> (not res!850054) (not e!731147))))

(assert (=> b!1279669 (= res!850054 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41207 _keys!1741))))))

(declare-fun res!850051 () Bool)

(assert (=> start!108424 (=> (not res!850051) (not e!731147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108424 (= res!850051 (validMask!0 mask!2175))))

(assert (=> start!108424 e!731147))

(declare-fun tp_is_empty!33611 () Bool)

(assert (=> start!108424 tp_is_empty!33611))

(assert (=> start!108424 true))

(declare-fun e!731149 () Bool)

(declare-fun array_inv!30865 (array!84308) Bool)

(assert (=> start!108424 (and (array_inv!30865 _values!1445) e!731149)))

(declare-fun array_inv!30866 (array!84306) Bool)

(assert (=> start!108424 (array_inv!30866 _keys!1741)))

(assert (=> start!108424 tp!99023))

(declare-fun b!1279670 () Bool)

(declare-fun e!731148 () Bool)

(assert (=> b!1279670 (= e!731148 tp_is_empty!33611)))

(declare-fun b!1279671 () Bool)

(declare-fun e!731146 () Bool)

(assert (=> b!1279671 (= e!731149 (and e!731146 mapRes!51968))))

(declare-fun condMapEmpty!51968 () Bool)

(declare-fun mapDefault!51968 () ValueCell!15907)

