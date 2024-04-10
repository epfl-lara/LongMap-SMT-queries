; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3978 () Bool)

(assert start!3978)

(declare-fun b_free!883 () Bool)

(declare-fun b_next!883 () Bool)

(assert (=> start!3978 (= b_free!883 (not b_next!883))))

(declare-fun tp!4068 () Bool)

(declare-fun b_and!1693 () Bool)

(assert (=> start!3978 (= tp!4068 b_and!1693)))

(declare-fun b!28655 () Bool)

(declare-fun res!17106 () Bool)

(declare-fun e!18528 () Bool)

(assert (=> b!28655 (=> (not res!17106) (not e!18528))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28655 (= res!17106 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1384 () Bool)

(declare-fun mapRes!1384 () Bool)

(assert (=> mapIsEmpty!1384 mapRes!1384))

(declare-fun b!28656 () Bool)

(declare-fun e!18530 () Bool)

(assert (=> b!28656 (= e!18528 e!18530)))

(declare-fun res!17104 () Bool)

(assert (=> b!28656 (=> (not res!17104) (not e!18530))))

(declare-datatypes ((V!1475 0))(
  ( (V!1476 (val!645 Int)) )
))
(declare-datatypes ((tuple2!1072 0))(
  ( (tuple2!1073 (_1!547 (_ BitVec 64)) (_2!547 V!1475)) )
))
(declare-datatypes ((List!671 0))(
  ( (Nil!668) (Cons!667 (h!1234 tuple2!1072) (t!3364 List!671)) )
))
(declare-datatypes ((ListLongMap!649 0))(
  ( (ListLongMap!650 (toList!340 List!671)) )
))
(declare-fun lt!10886 () ListLongMap!649)

(declare-fun contains!280 (ListLongMap!649 (_ BitVec 64)) Bool)

(assert (=> b!28656 (= res!17104 (not (contains!280 lt!10886 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!419 0))(
  ( (ValueCellFull!419 (v!1734 V!1475)) (EmptyCell!419) )
))
(declare-datatypes ((array!1709 0))(
  ( (array!1710 (arr!808 (Array (_ BitVec 32) ValueCell!419)) (size!909 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1709)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1711 0))(
  ( (array!1712 (arr!809 (Array (_ BitVec 32) (_ BitVec 64))) (size!910 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1711)

(declare-fun zeroValue!1443 () V!1475)

(declare-fun minValue!1443 () V!1475)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun getCurrentListMap!170 (array!1711 array!1709 (_ BitVec 32) (_ BitVec 32) V!1475 V!1475 (_ BitVec 32) Int) ListLongMap!649)

(assert (=> b!28656 (= lt!10886 (getCurrentListMap!170 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28657 () Bool)

(declare-fun e!18529 () Bool)

(declare-fun tp_is_empty!1237 () Bool)

(assert (=> b!28657 (= e!18529 tp_is_empty!1237)))

(declare-fun res!17105 () Bool)

(assert (=> start!3978 (=> (not res!17105) (not e!18528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3978 (= res!17105 (validMask!0 mask!2294))))

(assert (=> start!3978 e!18528))

(assert (=> start!3978 true))

(assert (=> start!3978 tp!4068))

(declare-fun e!18527 () Bool)

(declare-fun array_inv!555 (array!1709) Bool)

(assert (=> start!3978 (and (array_inv!555 _values!1501) e!18527)))

(declare-fun array_inv!556 (array!1711) Bool)

(assert (=> start!3978 (array_inv!556 _keys!1833)))

(assert (=> start!3978 tp_is_empty!1237))

(declare-fun b!28658 () Bool)

(declare-fun res!17102 () Bool)

(assert (=> b!28658 (=> (not res!17102) (not e!18530))))

(declare-fun arrayContainsKey!0 (array!1711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28658 (= res!17102 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28659 () Bool)

(declare-fun e!18532 () Bool)

(assert (=> b!28659 (= e!18532 true)))

(declare-datatypes ((SeekEntryResult!69 0))(
  ( (MissingZero!69 (index!2398 (_ BitVec 32))) (Found!69 (index!2399 (_ BitVec 32))) (Intermediate!69 (undefined!881 Bool) (index!2400 (_ BitVec 32)) (x!6339 (_ BitVec 32))) (Undefined!69) (MissingVacant!69 (index!2401 (_ BitVec 32))) )
))
(declare-fun lt!10888 () SeekEntryResult!69)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1711 (_ BitVec 32)) SeekEntryResult!69)

(assert (=> b!28659 (= lt!10888 (seekEntryOrOpen!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!28660 () Bool)

(declare-fun res!17099 () Bool)

(assert (=> b!28660 (=> (not res!17099) (not e!18528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1711 (_ BitVec 32)) Bool)

(assert (=> b!28660 (= res!17099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1384 () Bool)

(declare-fun tp!4069 () Bool)

(declare-fun e!18533 () Bool)

(assert (=> mapNonEmpty!1384 (= mapRes!1384 (and tp!4069 e!18533))))

(declare-fun mapKey!1384 () (_ BitVec 32))

(declare-fun mapRest!1384 () (Array (_ BitVec 32) ValueCell!419))

(declare-fun mapValue!1384 () ValueCell!419)

(assert (=> mapNonEmpty!1384 (= (arr!808 _values!1501) (store mapRest!1384 mapKey!1384 mapValue!1384))))

(declare-fun b!28661 () Bool)

(declare-fun res!17101 () Bool)

(assert (=> b!28661 (=> (not res!17101) (not e!18528))))

(declare-datatypes ((List!672 0))(
  ( (Nil!669) (Cons!668 (h!1235 (_ BitVec 64)) (t!3365 List!672)) )
))
(declare-fun arrayNoDuplicates!0 (array!1711 (_ BitVec 32) List!672) Bool)

(assert (=> b!28661 (= res!17101 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!669))))

(declare-fun b!28662 () Bool)

(assert (=> b!28662 (= e!18533 tp_is_empty!1237)))

(declare-fun b!28663 () Bool)

(declare-fun res!17103 () Bool)

(assert (=> b!28663 (=> (not res!17103) (not e!18528))))

(assert (=> b!28663 (= res!17103 (and (= (size!909 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!910 _keys!1833) (size!909 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28664 () Bool)

(assert (=> b!28664 (= e!18527 (and e!18529 mapRes!1384))))

(declare-fun condMapEmpty!1384 () Bool)

(declare-fun mapDefault!1384 () ValueCell!419)

