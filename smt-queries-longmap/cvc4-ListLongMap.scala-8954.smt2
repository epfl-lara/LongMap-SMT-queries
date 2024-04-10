; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108454 () Bool)

(assert start!108454)

(declare-fun b_free!28001 () Bool)

(declare-fun b_next!28001 () Bool)

(assert (=> start!108454 (= b_free!28001 (not b_next!28001))))

(declare-fun tp!99112 () Bool)

(declare-fun b_and!46061 () Bool)

(assert (=> start!108454 (= tp!99112 b_and!46061)))

(declare-fun b!1280025 () Bool)

(declare-fun res!850276 () Bool)

(declare-fun e!731371 () Bool)

(assert (=> b!1280025 (=> (not res!850276) (not e!731371))))

(declare-datatypes ((array!84362 0))(
  ( (array!84363 (arr!40685 (Array (_ BitVec 32) (_ BitVec 64))) (size!41235 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84362)

(declare-datatypes ((List!28817 0))(
  ( (Nil!28814) (Cons!28813 (h!30022 (_ BitVec 64)) (t!42357 List!28817)) )
))
(declare-fun arrayNoDuplicates!0 (array!84362 (_ BitVec 32) List!28817) Bool)

(assert (=> b!1280025 (= res!850276 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28814))))

(declare-fun mapNonEmpty!52013 () Bool)

(declare-fun mapRes!52013 () Bool)

(declare-fun tp!99113 () Bool)

(declare-fun e!731375 () Bool)

(assert (=> mapNonEmpty!52013 (= mapRes!52013 (and tp!99113 e!731375))))

(declare-fun mapKey!52013 () (_ BitVec 32))

(declare-datatypes ((V!49957 0))(
  ( (V!49958 (val!16895 Int)) )
))
(declare-datatypes ((ValueCell!15922 0))(
  ( (ValueCellFull!15922 (v!19495 V!49957)) (EmptyCell!15922) )
))
(declare-fun mapRest!52013 () (Array (_ BitVec 32) ValueCell!15922))

(declare-fun mapValue!52013 () ValueCell!15922)

(declare-datatypes ((array!84364 0))(
  ( (array!84365 (arr!40686 (Array (_ BitVec 32) ValueCell!15922)) (size!41236 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84364)

(assert (=> mapNonEmpty!52013 (= (arr!40686 _values!1445) (store mapRest!52013 mapKey!52013 mapValue!52013))))

(declare-fun b!1280026 () Bool)

(assert (=> b!1280026 (= e!731371 false)))

(declare-fun minValue!1387 () V!49957)

(declare-fun zeroValue!1387 () V!49957)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576074 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21618 0))(
  ( (tuple2!21619 (_1!10820 (_ BitVec 64)) (_2!10820 V!49957)) )
))
(declare-datatypes ((List!28818 0))(
  ( (Nil!28815) (Cons!28814 (h!30023 tuple2!21618) (t!42358 List!28818)) )
))
(declare-datatypes ((ListLongMap!19275 0))(
  ( (ListLongMap!19276 (toList!9653 List!28818)) )
))
(declare-fun contains!7768 (ListLongMap!19275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4737 (array!84362 array!84364 (_ BitVec 32) (_ BitVec 32) V!49957 V!49957 (_ BitVec 32) Int) ListLongMap!19275)

(assert (=> b!1280026 (= lt!576074 (contains!7768 (getCurrentListMap!4737 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280028 () Bool)

(declare-fun res!850278 () Bool)

(assert (=> b!1280028 (=> (not res!850278) (not e!731371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84362 (_ BitVec 32)) Bool)

(assert (=> b!1280028 (= res!850278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280029 () Bool)

(declare-fun e!731372 () Bool)

(declare-fun e!731373 () Bool)

(assert (=> b!1280029 (= e!731372 (and e!731373 mapRes!52013))))

(declare-fun condMapEmpty!52013 () Bool)

(declare-fun mapDefault!52013 () ValueCell!15922)

