; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108508 () Bool)

(assert start!108508)

(declare-fun b_free!28055 () Bool)

(declare-fun b_next!28055 () Bool)

(assert (=> start!108508 (= b_free!28055 (not b_next!28055))))

(declare-fun tp!99275 () Bool)

(declare-fun b_and!46115 () Bool)

(assert (=> start!108508 (= tp!99275 b_and!46115)))

(declare-fun b!1280725 () Bool)

(declare-fun res!850733 () Bool)

(declare-fun e!731779 () Bool)

(assert (=> b!1280725 (=> (not res!850733) (not e!731779))))

(declare-datatypes ((V!50029 0))(
  ( (V!50030 (val!16922 Int)) )
))
(declare-fun minValue!1387 () V!50029)

(declare-fun zeroValue!1387 () V!50029)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15949 0))(
  ( (ValueCellFull!15949 (v!19522 V!50029)) (EmptyCell!15949) )
))
(declare-datatypes ((array!84466 0))(
  ( (array!84467 (arr!40737 (Array (_ BitVec 32) ValueCell!15949)) (size!41287 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84466)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84468 0))(
  ( (array!84469 (arr!40738 (Array (_ BitVec 32) (_ BitVec 64))) (size!41288 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84468)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21662 0))(
  ( (tuple2!21663 (_1!10842 (_ BitVec 64)) (_2!10842 V!50029)) )
))
(declare-datatypes ((List!28859 0))(
  ( (Nil!28856) (Cons!28855 (h!30064 tuple2!21662) (t!42399 List!28859)) )
))
(declare-datatypes ((ListLongMap!19319 0))(
  ( (ListLongMap!19320 (toList!9675 List!28859)) )
))
(declare-fun contains!7790 (ListLongMap!19319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4759 (array!84468 array!84466 (_ BitVec 32) (_ BitVec 32) V!50029 V!50029 (_ BitVec 32) Int) ListLongMap!19319)

(assert (=> b!1280725 (= res!850733 (contains!7790 (getCurrentListMap!4759 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280726 () Bool)

(declare-fun res!850738 () Bool)

(assert (=> b!1280726 (=> (not res!850738) (not e!731779))))

(assert (=> b!1280726 (= res!850738 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41288 _keys!1741))))))

(declare-fun b!1280727 () Bool)

(declare-fun res!850736 () Bool)

(assert (=> b!1280727 (=> (not res!850736) (not e!731779))))

(assert (=> b!1280727 (= res!850736 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41288 _keys!1741)) (not (= (select (arr!40738 _keys!1741) from!2144) k!1205))))))

(declare-fun res!850734 () Bool)

(assert (=> start!108508 (=> (not res!850734) (not e!731779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108508 (= res!850734 (validMask!0 mask!2175))))

(assert (=> start!108508 e!731779))

(declare-fun tp_is_empty!33695 () Bool)

(assert (=> start!108508 tp_is_empty!33695))

(assert (=> start!108508 true))

(declare-fun e!731777 () Bool)

(declare-fun array_inv!30917 (array!84466) Bool)

(assert (=> start!108508 (and (array_inv!30917 _values!1445) e!731777)))

(declare-fun array_inv!30918 (array!84468) Bool)

(assert (=> start!108508 (array_inv!30918 _keys!1741)))

(assert (=> start!108508 tp!99275))

(declare-fun b!1280728 () Bool)

(declare-fun e!731780 () Bool)

(assert (=> b!1280728 (= e!731780 tp_is_empty!33695)))

(declare-fun b!1280729 () Bool)

(declare-fun e!731776 () Bool)

(assert (=> b!1280729 (= e!731776 tp_is_empty!33695)))

(declare-fun mapIsEmpty!52094 () Bool)

(declare-fun mapRes!52094 () Bool)

(assert (=> mapIsEmpty!52094 mapRes!52094))

(declare-fun mapNonEmpty!52094 () Bool)

(declare-fun tp!99274 () Bool)

(assert (=> mapNonEmpty!52094 (= mapRes!52094 (and tp!99274 e!731776))))

(declare-fun mapKey!52094 () (_ BitVec 32))

(declare-fun mapValue!52094 () ValueCell!15949)

(declare-fun mapRest!52094 () (Array (_ BitVec 32) ValueCell!15949))

(assert (=> mapNonEmpty!52094 (= (arr!40737 _values!1445) (store mapRest!52094 mapKey!52094 mapValue!52094))))

(declare-fun b!1280730 () Bool)

(assert (=> b!1280730 (= e!731779 (not true))))

(assert (=> b!1280730 (contains!7790 (getCurrentListMap!4759 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42407 0))(
  ( (Unit!42408) )
))
(declare-fun lt!576155 () Unit!42407)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!8 (array!84468 array!84466 (_ BitVec 32) (_ BitVec 32) V!50029 V!50029 (_ BitVec 64) (_ BitVec 32) Int) Unit!42407)

(assert (=> b!1280730 (= lt!576155 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!8 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280731 () Bool)

(declare-fun res!850739 () Bool)

(assert (=> b!1280731 (=> (not res!850739) (not e!731779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84468 (_ BitVec 32)) Bool)

(assert (=> b!1280731 (= res!850739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280732 () Bool)

(assert (=> b!1280732 (= e!731777 (and e!731780 mapRes!52094))))

(declare-fun condMapEmpty!52094 () Bool)

(declare-fun mapDefault!52094 () ValueCell!15949)

