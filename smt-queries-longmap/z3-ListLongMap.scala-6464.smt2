; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82626 () Bool)

(assert start!82626)

(declare-fun b_free!18759 () Bool)

(declare-fun b_next!18759 () Bool)

(assert (=> start!82626 (= b_free!18759 (not b_next!18759))))

(declare-fun tp!65397 () Bool)

(declare-fun b_and!30247 () Bool)

(assert (=> start!82626 (= tp!65397 b_and!30247)))

(declare-fun b!963096 () Bool)

(declare-fun e!543079 () Bool)

(declare-fun e!543078 () Bool)

(declare-fun mapRes!34336 () Bool)

(assert (=> b!963096 (= e!543079 (and e!543078 mapRes!34336))))

(declare-fun condMapEmpty!34336 () Bool)

(declare-datatypes ((V!33731 0))(
  ( (V!33732 (val!10831 Int)) )
))
(declare-datatypes ((ValueCell!10299 0))(
  ( (ValueCellFull!10299 (v!13389 V!33731)) (EmptyCell!10299) )
))
(declare-datatypes ((array!59217 0))(
  ( (array!59218 (arr!28477 (Array (_ BitVec 32) ValueCell!10299)) (size!28956 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59217)

(declare-fun mapDefault!34336 () ValueCell!10299)

(assert (=> b!963096 (= condMapEmpty!34336 (= (arr!28477 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10299)) mapDefault!34336)))))

(declare-fun res!644551 () Bool)

(declare-fun e!543077 () Bool)

(assert (=> start!82626 (=> (not res!644551) (not e!543077))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82626 (= res!644551 (validMask!0 mask!2110))))

(assert (=> start!82626 e!543077))

(assert (=> start!82626 true))

(declare-fun array_inv!22065 (array!59217) Bool)

(assert (=> start!82626 (and (array_inv!22065 _values!1400) e!543079)))

(declare-datatypes ((array!59219 0))(
  ( (array!59220 (arr!28478 (Array (_ BitVec 32) (_ BitVec 64))) (size!28957 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59219)

(declare-fun array_inv!22066 (array!59219) Bool)

(assert (=> start!82626 (array_inv!22066 _keys!1686)))

(assert (=> start!82626 tp!65397))

(declare-fun tp_is_empty!21561 () Bool)

(assert (=> start!82626 tp_is_empty!21561))

(declare-fun b!963097 () Bool)

(declare-fun res!644548 () Bool)

(assert (=> b!963097 (=> (not res!644548) (not e!543077))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963097 (= res!644548 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963098 () Bool)

(declare-fun res!644550 () Bool)

(assert (=> b!963098 (=> (not res!644550) (not e!543077))))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963098 (= res!644550 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28957 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28957 _keys!1686))))))

(declare-fun b!963099 () Bool)

(declare-fun res!644546 () Bool)

(assert (=> b!963099 (=> (not res!644546) (not e!543077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963099 (= res!644546 (validKeyInArray!0 (select (arr!28478 _keys!1686) i!803)))))

(declare-fun b!963100 () Bool)

(declare-fun res!644545 () Bool)

(assert (=> b!963100 (=> (not res!644545) (not e!543077))))

(declare-datatypes ((List!19764 0))(
  ( (Nil!19761) (Cons!19760 (h!20922 (_ BitVec 64)) (t!28127 List!19764)) )
))
(declare-fun arrayNoDuplicates!0 (array!59219 (_ BitVec 32) List!19764) Bool)

(assert (=> b!963100 (= res!644545 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19761))))

(declare-fun mapIsEmpty!34336 () Bool)

(assert (=> mapIsEmpty!34336 mapRes!34336))

(declare-fun b!963101 () Bool)

(assert (=> b!963101 (= e!543078 tp_is_empty!21561)))

(declare-fun b!963102 () Bool)

(declare-fun res!644544 () Bool)

(assert (=> b!963102 (=> (not res!644544) (not e!543077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59219 (_ BitVec 32)) Bool)

(assert (=> b!963102 (= res!644544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34336 () Bool)

(declare-fun tp!65396 () Bool)

(declare-fun e!543080 () Bool)

(assert (=> mapNonEmpty!34336 (= mapRes!34336 (and tp!65396 e!543080))))

(declare-fun mapKey!34336 () (_ BitVec 32))

(declare-fun mapValue!34336 () ValueCell!10299)

(declare-fun mapRest!34336 () (Array (_ BitVec 32) ValueCell!10299))

(assert (=> mapNonEmpty!34336 (= (arr!28477 _values!1400) (store mapRest!34336 mapKey!34336 mapValue!34336))))

(declare-fun b!963103 () Bool)

(declare-fun res!644549 () Bool)

(assert (=> b!963103 (=> (not res!644549) (not e!543077))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33731)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33731)

(declare-datatypes ((tuple2!13914 0))(
  ( (tuple2!13915 (_1!6968 (_ BitVec 64)) (_2!6968 V!33731)) )
))
(declare-datatypes ((List!19765 0))(
  ( (Nil!19762) (Cons!19761 (h!20923 tuple2!13914) (t!28128 List!19765)) )
))
(declare-datatypes ((ListLongMap!12611 0))(
  ( (ListLongMap!12612 (toList!6321 List!19765)) )
))
(declare-fun contains!5424 (ListLongMap!12611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3554 (array!59219 array!59217 (_ BitVec 32) (_ BitVec 32) V!33731 V!33731 (_ BitVec 32) Int) ListLongMap!12611)

(assert (=> b!963103 (= res!644549 (contains!5424 (getCurrentListMap!3554 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28478 _keys!1686) i!803)))))

(declare-fun b!963104 () Bool)

(assert (=> b!963104 (= e!543077 (not true))))

(assert (=> b!963104 (contains!5424 (getCurrentListMap!3554 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28478 _keys!1686) i!803))))

(declare-datatypes ((Unit!32227 0))(
  ( (Unit!32228) )
))
(declare-fun lt!430942 () Unit!32227)

(declare-fun lemmaInListMapFromThenInFromMinusOne!8 (array!59219 array!59217 (_ BitVec 32) (_ BitVec 32) V!33731 V!33731 (_ BitVec 32) (_ BitVec 32) Int) Unit!32227)

(assert (=> b!963104 (= lt!430942 (lemmaInListMapFromThenInFromMinusOne!8 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963105 () Bool)

(assert (=> b!963105 (= e!543080 tp_is_empty!21561)))

(declare-fun b!963106 () Bool)

(declare-fun res!644547 () Bool)

(assert (=> b!963106 (=> (not res!644547) (not e!543077))))

(assert (=> b!963106 (= res!644547 (and (= (size!28956 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28957 _keys!1686) (size!28956 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82626 res!644551) b!963106))

(assert (= (and b!963106 res!644547) b!963102))

(assert (= (and b!963102 res!644544) b!963100))

(assert (= (and b!963100 res!644545) b!963098))

(assert (= (and b!963098 res!644550) b!963099))

(assert (= (and b!963099 res!644546) b!963103))

(assert (= (and b!963103 res!644549) b!963097))

(assert (= (and b!963097 res!644548) b!963104))

(assert (= (and b!963096 condMapEmpty!34336) mapIsEmpty!34336))

(assert (= (and b!963096 (not condMapEmpty!34336)) mapNonEmpty!34336))

(get-info :version)

(assert (= (and mapNonEmpty!34336 ((_ is ValueCellFull!10299) mapValue!34336)) b!963105))

(assert (= (and b!963096 ((_ is ValueCellFull!10299) mapDefault!34336)) b!963101))

(assert (= start!82626 b!963096))

(declare-fun m!892589 () Bool)

(assert (=> b!963103 m!892589))

(declare-fun m!892591 () Bool)

(assert (=> b!963103 m!892591))

(assert (=> b!963103 m!892589))

(assert (=> b!963103 m!892591))

(declare-fun m!892593 () Bool)

(assert (=> b!963103 m!892593))

(declare-fun m!892595 () Bool)

(assert (=> b!963100 m!892595))

(declare-fun m!892597 () Bool)

(assert (=> b!963104 m!892597))

(assert (=> b!963104 m!892591))

(assert (=> b!963104 m!892597))

(assert (=> b!963104 m!892591))

(declare-fun m!892599 () Bool)

(assert (=> b!963104 m!892599))

(declare-fun m!892601 () Bool)

(assert (=> b!963104 m!892601))

(declare-fun m!892603 () Bool)

(assert (=> mapNonEmpty!34336 m!892603))

(assert (=> b!963099 m!892591))

(assert (=> b!963099 m!892591))

(declare-fun m!892605 () Bool)

(assert (=> b!963099 m!892605))

(declare-fun m!892607 () Bool)

(assert (=> b!963102 m!892607))

(declare-fun m!892609 () Bool)

(assert (=> start!82626 m!892609))

(declare-fun m!892611 () Bool)

(assert (=> start!82626 m!892611))

(declare-fun m!892613 () Bool)

(assert (=> start!82626 m!892613))

(check-sat (not b!963104) (not b_next!18759) tp_is_empty!21561 (not b!963099) (not b!963102) b_and!30247 (not start!82626) (not mapNonEmpty!34336) (not b!963103) (not b!963100))
(check-sat b_and!30247 (not b_next!18759))
