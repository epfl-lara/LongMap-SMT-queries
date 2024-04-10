; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3982 () Bool)

(assert start!3982)

(declare-fun b_free!887 () Bool)

(declare-fun b_next!887 () Bool)

(assert (=> start!3982 (= b_free!887 (not b_next!887))))

(declare-fun tp!4081 () Bool)

(declare-fun b_and!1697 () Bool)

(assert (=> start!3982 (= tp!4081 b_and!1697)))

(declare-fun b!28721 () Bool)

(declare-fun e!18573 () Bool)

(assert (=> b!28721 (= e!18573 true)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!1717 0))(
  ( (array!1718 (arr!812 (Array (_ BitVec 32) (_ BitVec 64))) (size!913 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1717)

(declare-datatypes ((SeekEntryResult!71 0))(
  ( (MissingZero!71 (index!2406 (_ BitVec 32))) (Found!71 (index!2407 (_ BitVec 32))) (Intermediate!71 (undefined!883 Bool) (index!2408 (_ BitVec 32)) (x!6341 (_ BitVec 32))) (Undefined!71) (MissingVacant!71 (index!2409 (_ BitVec 32))) )
))
(declare-fun lt!10911 () SeekEntryResult!71)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1717 (_ BitVec 32)) SeekEntryResult!71)

(assert (=> b!28721 (= lt!10911 (seekEntryOrOpen!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!28722 () Bool)

(declare-fun res!17150 () Bool)

(declare-fun e!18575 () Bool)

(assert (=> b!28722 (=> (not res!17150) (not e!18575))))

(declare-datatypes ((V!1479 0))(
  ( (V!1480 (val!647 Int)) )
))
(declare-datatypes ((ValueCell!421 0))(
  ( (ValueCellFull!421 (v!1736 V!1479)) (EmptyCell!421) )
))
(declare-datatypes ((array!1719 0))(
  ( (array!1720 (arr!813 (Array (_ BitVec 32) ValueCell!421)) (size!914 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1719)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28722 (= res!17150 (and (= (size!914 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!913 _keys!1833) (size!914 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28723 () Bool)

(declare-fun e!18574 () Bool)

(declare-fun tp_is_empty!1241 () Bool)

(assert (=> b!28723 (= e!18574 tp_is_empty!1241)))

(declare-fun mapNonEmpty!1390 () Bool)

(declare-fun mapRes!1390 () Bool)

(declare-fun tp!4080 () Bool)

(assert (=> mapNonEmpty!1390 (= mapRes!1390 (and tp!4080 e!18574))))

(declare-fun mapKey!1390 () (_ BitVec 32))

(declare-fun mapRest!1390 () (Array (_ BitVec 32) ValueCell!421))

(declare-fun mapValue!1390 () ValueCell!421)

(assert (=> mapNonEmpty!1390 (= (arr!813 _values!1501) (store mapRest!1390 mapKey!1390 mapValue!1390))))

(declare-fun b!28725 () Bool)

(declare-fun res!17147 () Bool)

(assert (=> b!28725 (=> (not res!17147) (not e!18575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1717 (_ BitVec 32)) Bool)

(assert (=> b!28725 (= res!17147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28726 () Bool)

(declare-fun e!18572 () Bool)

(assert (=> b!28726 (= e!18575 e!18572)))

(declare-fun res!17152 () Bool)

(assert (=> b!28726 (=> (not res!17152) (not e!18572))))

(declare-datatypes ((tuple2!1076 0))(
  ( (tuple2!1077 (_1!549 (_ BitVec 64)) (_2!549 V!1479)) )
))
(declare-datatypes ((List!675 0))(
  ( (Nil!672) (Cons!671 (h!1238 tuple2!1076) (t!3368 List!675)) )
))
(declare-datatypes ((ListLongMap!653 0))(
  ( (ListLongMap!654 (toList!342 List!675)) )
))
(declare-fun lt!10910 () ListLongMap!653)

(declare-fun contains!282 (ListLongMap!653 (_ BitVec 64)) Bool)

(assert (=> b!28726 (= res!17152 (not (contains!282 lt!10910 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1479)

(declare-fun minValue!1443 () V!1479)

(declare-fun getCurrentListMap!172 (array!1717 array!1719 (_ BitVec 32) (_ BitVec 32) V!1479 V!1479 (_ BitVec 32) Int) ListLongMap!653)

(assert (=> b!28726 (= lt!10910 (getCurrentListMap!172 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28727 () Bool)

(declare-fun res!17149 () Bool)

(assert (=> b!28727 (=> (not res!17149) (not e!18572))))

(declare-fun arrayContainsKey!0 (array!1717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28727 (= res!17149 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1390 () Bool)

(assert (=> mapIsEmpty!1390 mapRes!1390))

(declare-fun b!28728 () Bool)

(declare-fun res!17148 () Bool)

(assert (=> b!28728 (=> (not res!17148) (not e!18575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28728 (= res!17148 (validKeyInArray!0 k!1304))))

(declare-fun b!28729 () Bool)

(declare-fun res!17154 () Bool)

(assert (=> b!28729 (=> (not res!17154) (not e!18575))))

(declare-datatypes ((List!676 0))(
  ( (Nil!673) (Cons!672 (h!1239 (_ BitVec 64)) (t!3369 List!676)) )
))
(declare-fun arrayNoDuplicates!0 (array!1717 (_ BitVec 32) List!676) Bool)

(assert (=> b!28729 (= res!17154 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!673))))

(declare-fun b!28730 () Bool)

(declare-fun e!18569 () Bool)

(declare-fun e!18571 () Bool)

(assert (=> b!28730 (= e!18569 (and e!18571 mapRes!1390))))

(declare-fun condMapEmpty!1390 () Bool)

(declare-fun mapDefault!1390 () ValueCell!421)

