; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108496 () Bool)

(assert start!108496)

(declare-fun b_free!28043 () Bool)

(declare-fun b_next!28043 () Bool)

(assert (=> start!108496 (= b_free!28043 (not b_next!28043))))

(declare-fun tp!99238 () Bool)

(declare-fun b_and!46103 () Bool)

(assert (=> start!108496 (= tp!99238 b_and!46103)))

(declare-fun b!1280545 () Bool)

(declare-fun res!850607 () Bool)

(declare-fun e!731689 () Bool)

(assert (=> b!1280545 (=> (not res!850607) (not e!731689))))

(declare-datatypes ((array!84442 0))(
  ( (array!84443 (arr!40725 (Array (_ BitVec 32) (_ BitVec 64))) (size!41275 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84442)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84442 (_ BitVec 32)) Bool)

(assert (=> b!1280545 (= res!850607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280546 () Bool)

(declare-fun res!850610 () Bool)

(assert (=> b!1280546 (=> (not res!850610) (not e!731689))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1280546 (= res!850610 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41275 _keys!1741)) (not (= (select (arr!40725 _keys!1741) from!2144) k!1205))))))

(declare-fun mapIsEmpty!52076 () Bool)

(declare-fun mapRes!52076 () Bool)

(assert (=> mapIsEmpty!52076 mapRes!52076))

(declare-fun mapNonEmpty!52076 () Bool)

(declare-fun tp!99239 () Bool)

(declare-fun e!731688 () Bool)

(assert (=> mapNonEmpty!52076 (= mapRes!52076 (and tp!99239 e!731688))))

(declare-datatypes ((V!50013 0))(
  ( (V!50014 (val!16916 Int)) )
))
(declare-datatypes ((ValueCell!15943 0))(
  ( (ValueCellFull!15943 (v!19516 V!50013)) (EmptyCell!15943) )
))
(declare-datatypes ((array!84444 0))(
  ( (array!84445 (arr!40726 (Array (_ BitVec 32) ValueCell!15943)) (size!41276 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84444)

(declare-fun mapRest!52076 () (Array (_ BitVec 32) ValueCell!15943))

(declare-fun mapKey!52076 () (_ BitVec 32))

(declare-fun mapValue!52076 () ValueCell!15943)

(assert (=> mapNonEmpty!52076 (= (arr!40726 _values!1445) (store mapRest!52076 mapKey!52076 mapValue!52076))))

(declare-fun b!1280548 () Bool)

(assert (=> b!1280548 (= e!731689 (not true))))

(declare-fun minValue!1387 () V!50013)

(declare-fun zeroValue!1387 () V!50013)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21650 0))(
  ( (tuple2!21651 (_1!10836 (_ BitVec 64)) (_2!10836 V!50013)) )
))
(declare-datatypes ((List!28848 0))(
  ( (Nil!28845) (Cons!28844 (h!30053 tuple2!21650) (t!42388 List!28848)) )
))
(declare-datatypes ((ListLongMap!19307 0))(
  ( (ListLongMap!19308 (toList!9669 List!28848)) )
))
(declare-fun contains!7784 (ListLongMap!19307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4753 (array!84442 array!84444 (_ BitVec 32) (_ BitVec 32) V!50013 V!50013 (_ BitVec 32) Int) ListLongMap!19307)

(assert (=> b!1280548 (contains!7784 (getCurrentListMap!4753 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42395 0))(
  ( (Unit!42396) )
))
(declare-fun lt!576137 () Unit!42395)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!2 (array!84442 array!84444 (_ BitVec 32) (_ BitVec 32) V!50013 V!50013 (_ BitVec 64) (_ BitVec 32) Int) Unit!42395)

(assert (=> b!1280548 (= lt!576137 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!2 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280547 () Bool)

(declare-fun e!731687 () Bool)

(declare-fun tp_is_empty!33683 () Bool)

(assert (=> b!1280547 (= e!731687 tp_is_empty!33683)))

(declare-fun res!850613 () Bool)

(assert (=> start!108496 (=> (not res!850613) (not e!731689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108496 (= res!850613 (validMask!0 mask!2175))))

(assert (=> start!108496 e!731689))

(assert (=> start!108496 tp_is_empty!33683))

(assert (=> start!108496 true))

(declare-fun e!731686 () Bool)

(declare-fun array_inv!30907 (array!84444) Bool)

(assert (=> start!108496 (and (array_inv!30907 _values!1445) e!731686)))

(declare-fun array_inv!30908 (array!84442) Bool)

(assert (=> start!108496 (array_inv!30908 _keys!1741)))

(assert (=> start!108496 tp!99238))

(declare-fun b!1280549 () Bool)

(declare-fun res!850609 () Bool)

(assert (=> b!1280549 (=> (not res!850609) (not e!731689))))

(assert (=> b!1280549 (= res!850609 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41275 _keys!1741))))))

(declare-fun b!1280550 () Bool)

(assert (=> b!1280550 (= e!731688 tp_is_empty!33683)))

(declare-fun b!1280551 () Bool)

(declare-fun res!850612 () Bool)

(assert (=> b!1280551 (=> (not res!850612) (not e!731689))))

(declare-datatypes ((List!28849 0))(
  ( (Nil!28846) (Cons!28845 (h!30054 (_ BitVec 64)) (t!42389 List!28849)) )
))
(declare-fun arrayNoDuplicates!0 (array!84442 (_ BitVec 32) List!28849) Bool)

(assert (=> b!1280551 (= res!850612 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28846))))

(declare-fun b!1280552 () Bool)

(declare-fun res!850611 () Bool)

(assert (=> b!1280552 (=> (not res!850611) (not e!731689))))

(assert (=> b!1280552 (= res!850611 (contains!7784 (getCurrentListMap!4753 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280553 () Bool)

(assert (=> b!1280553 (= e!731686 (and e!731687 mapRes!52076))))

(declare-fun condMapEmpty!52076 () Bool)

(declare-fun mapDefault!52076 () ValueCell!15943)

