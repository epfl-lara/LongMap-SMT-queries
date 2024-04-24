; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83032 () Bool)

(assert start!83032)

(declare-fun b_free!18991 () Bool)

(declare-fun b_next!18991 () Bool)

(assert (=> start!83032 (= b_free!18991 (not b_next!18991))))

(declare-fun tp!66103 () Bool)

(declare-fun b_and!30489 () Bool)

(assert (=> start!83032 (= tp!66103 b_and!30489)))

(declare-fun b!967607 () Bool)

(declare-fun res!647429 () Bool)

(declare-fun e!545524 () Bool)

(assert (=> b!967607 (=> (not res!647429) (not e!545524))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34049 0))(
  ( (V!34050 (val!10950 Int)) )
))
(declare-datatypes ((ValueCell!10418 0))(
  ( (ValueCellFull!10418 (v!13505 V!34049)) (EmptyCell!10418) )
))
(declare-datatypes ((array!59696 0))(
  ( (array!59697 (arr!28712 (Array (_ BitVec 32) ValueCell!10418)) (size!29192 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59696)

(declare-datatypes ((array!59698 0))(
  ( (array!59699 (arr!28713 (Array (_ BitVec 32) (_ BitVec 64))) (size!29193 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59698)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!967607 (= res!647429 (and (= (size!29192 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29193 _keys!1686) (size!29192 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967608 () Bool)

(declare-fun res!647428 () Bool)

(assert (=> b!967608 (=> (not res!647428) (not e!545524))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967608 (= res!647428 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29193 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29193 _keys!1686))))))

(declare-fun res!647430 () Bool)

(assert (=> start!83032 (=> (not res!647430) (not e!545524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83032 (= res!647430 (validMask!0 mask!2110))))

(assert (=> start!83032 e!545524))

(assert (=> start!83032 true))

(declare-fun e!545527 () Bool)

(declare-fun array_inv!22289 (array!59696) Bool)

(assert (=> start!83032 (and (array_inv!22289 _values!1400) e!545527)))

(declare-fun array_inv!22290 (array!59698) Bool)

(assert (=> start!83032 (array_inv!22290 _keys!1686)))

(assert (=> start!83032 tp!66103))

(declare-fun tp_is_empty!21799 () Bool)

(assert (=> start!83032 tp_is_empty!21799))

(declare-fun b!967609 () Bool)

(assert (=> b!967609 (= e!545524 false)))

(declare-fun minValue!1342 () V!34049)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431714 () Bool)

(declare-fun zeroValue!1342 () V!34049)

(declare-datatypes ((tuple2!14068 0))(
  ( (tuple2!14069 (_1!7045 (_ BitVec 64)) (_2!7045 V!34049)) )
))
(declare-datatypes ((List!19917 0))(
  ( (Nil!19914) (Cons!19913 (h!21081 tuple2!14068) (t!28272 List!19917)) )
))
(declare-datatypes ((ListLongMap!12767 0))(
  ( (ListLongMap!12768 (toList!6399 List!19917)) )
))
(declare-fun contains!5511 (ListLongMap!12767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3632 (array!59698 array!59696 (_ BitVec 32) (_ BitVec 32) V!34049 V!34049 (_ BitVec 32) Int) ListLongMap!12767)

(assert (=> b!967609 (= lt!431714 (contains!5511 (getCurrentListMap!3632 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28713 _keys!1686) i!803)))))

(declare-fun b!967610 () Bool)

(declare-fun e!545528 () Bool)

(declare-fun mapRes!34693 () Bool)

(assert (=> b!967610 (= e!545527 (and e!545528 mapRes!34693))))

(declare-fun condMapEmpty!34693 () Bool)

(declare-fun mapDefault!34693 () ValueCell!10418)

(assert (=> b!967610 (= condMapEmpty!34693 (= (arr!28712 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10418)) mapDefault!34693)))))

(declare-fun b!967611 () Bool)

(declare-fun e!545526 () Bool)

(assert (=> b!967611 (= e!545526 tp_is_empty!21799)))

(declare-fun mapNonEmpty!34693 () Bool)

(declare-fun tp!66102 () Bool)

(assert (=> mapNonEmpty!34693 (= mapRes!34693 (and tp!66102 e!545526))))

(declare-fun mapKey!34693 () (_ BitVec 32))

(declare-fun mapValue!34693 () ValueCell!10418)

(declare-fun mapRest!34693 () (Array (_ BitVec 32) ValueCell!10418))

(assert (=> mapNonEmpty!34693 (= (arr!28712 _values!1400) (store mapRest!34693 mapKey!34693 mapValue!34693))))

(declare-fun b!967612 () Bool)

(assert (=> b!967612 (= e!545528 tp_is_empty!21799)))

(declare-fun b!967613 () Bool)

(declare-fun res!647427 () Bool)

(assert (=> b!967613 (=> (not res!647427) (not e!545524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59698 (_ BitVec 32)) Bool)

(assert (=> b!967613 (= res!647427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34693 () Bool)

(assert (=> mapIsEmpty!34693 mapRes!34693))

(declare-fun b!967614 () Bool)

(declare-fun res!647425 () Bool)

(assert (=> b!967614 (=> (not res!647425) (not e!545524))))

(declare-datatypes ((List!19918 0))(
  ( (Nil!19915) (Cons!19914 (h!21082 (_ BitVec 64)) (t!28273 List!19918)) )
))
(declare-fun arrayNoDuplicates!0 (array!59698 (_ BitVec 32) List!19918) Bool)

(assert (=> b!967614 (= res!647425 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19915))))

(declare-fun b!967615 () Bool)

(declare-fun res!647426 () Bool)

(assert (=> b!967615 (=> (not res!647426) (not e!545524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967615 (= res!647426 (validKeyInArray!0 (select (arr!28713 _keys!1686) i!803)))))

(assert (= (and start!83032 res!647430) b!967607))

(assert (= (and b!967607 res!647429) b!967613))

(assert (= (and b!967613 res!647427) b!967614))

(assert (= (and b!967614 res!647425) b!967608))

(assert (= (and b!967608 res!647428) b!967615))

(assert (= (and b!967615 res!647426) b!967609))

(assert (= (and b!967610 condMapEmpty!34693) mapIsEmpty!34693))

(assert (= (and b!967610 (not condMapEmpty!34693)) mapNonEmpty!34693))

(get-info :version)

(assert (= (and mapNonEmpty!34693 ((_ is ValueCellFull!10418) mapValue!34693)) b!967611))

(assert (= (and b!967610 ((_ is ValueCellFull!10418) mapDefault!34693)) b!967612))

(assert (= start!83032 b!967610))

(declare-fun m!896713 () Bool)

(assert (=> b!967614 m!896713))

(declare-fun m!896715 () Bool)

(assert (=> b!967613 m!896715))

(declare-fun m!896717 () Bool)

(assert (=> start!83032 m!896717))

(declare-fun m!896719 () Bool)

(assert (=> start!83032 m!896719))

(declare-fun m!896721 () Bool)

(assert (=> start!83032 m!896721))

(declare-fun m!896723 () Bool)

(assert (=> b!967609 m!896723))

(declare-fun m!896725 () Bool)

(assert (=> b!967609 m!896725))

(assert (=> b!967609 m!896723))

(assert (=> b!967609 m!896725))

(declare-fun m!896727 () Bool)

(assert (=> b!967609 m!896727))

(assert (=> b!967615 m!896725))

(assert (=> b!967615 m!896725))

(declare-fun m!896729 () Bool)

(assert (=> b!967615 m!896729))

(declare-fun m!896731 () Bool)

(assert (=> mapNonEmpty!34693 m!896731))

(check-sat tp_is_empty!21799 (not b!967613) (not b!967609) b_and!30489 (not b!967615) (not b_next!18991) (not b!967614) (not mapNonEmpty!34693) (not start!83032))
(check-sat b_and!30489 (not b_next!18991))
