; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82960 () Bool)

(assert start!82960)

(declare-fun b_free!18919 () Bool)

(declare-fun b_next!18919 () Bool)

(assert (=> start!82960 (= b_free!18919 (not b_next!18919))))

(declare-fun tp!65887 () Bool)

(declare-fun b_and!30417 () Bool)

(assert (=> start!82960 (= tp!65887 b_and!30417)))

(declare-fun b!966626 () Bool)

(declare-fun e!544986 () Bool)

(declare-fun tp_is_empty!21727 () Bool)

(assert (=> b!966626 (= e!544986 tp_is_empty!21727)))

(declare-fun b!966627 () Bool)

(declare-fun e!544985 () Bool)

(declare-fun e!544984 () Bool)

(declare-fun mapRes!34585 () Bool)

(assert (=> b!966627 (= e!544985 (and e!544984 mapRes!34585))))

(declare-fun condMapEmpty!34585 () Bool)

(declare-datatypes ((V!33953 0))(
  ( (V!33954 (val!10914 Int)) )
))
(declare-datatypes ((ValueCell!10382 0))(
  ( (ValueCellFull!10382 (v!13469 V!33953)) (EmptyCell!10382) )
))
(declare-datatypes ((array!59554 0))(
  ( (array!59555 (arr!28641 (Array (_ BitVec 32) ValueCell!10382)) (size!29121 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59554)

(declare-fun mapDefault!34585 () ValueCell!10382)

(assert (=> b!966627 (= condMapEmpty!34585 (= (arr!28641 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10382)) mapDefault!34585)))))

(declare-fun b!966628 () Bool)

(assert (=> b!966628 (= e!544984 tp_is_empty!21727)))

(declare-fun b!966629 () Bool)

(declare-fun res!646771 () Bool)

(declare-fun e!544987 () Bool)

(assert (=> b!966629 (=> (not res!646771) (not e!544987))))

(declare-datatypes ((array!59556 0))(
  ( (array!59557 (arr!28642 (Array (_ BitVec 32) (_ BitVec 64))) (size!29122 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59556)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59556 (_ BitVec 32)) Bool)

(assert (=> b!966629 (= res!646771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34585 () Bool)

(assert (=> mapIsEmpty!34585 mapRes!34585))

(declare-fun b!966630 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966630 (= e!544987 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33953)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14016 0))(
  ( (tuple2!14017 (_1!7019 (_ BitVec 64)) (_2!7019 V!33953)) )
))
(declare-datatypes ((List!19863 0))(
  ( (Nil!19860) (Cons!19859 (h!21027 tuple2!14016) (t!28218 List!19863)) )
))
(declare-datatypes ((ListLongMap!12715 0))(
  ( (ListLongMap!12716 (toList!6373 List!19863)) )
))
(declare-fun lt!431615 () ListLongMap!12715)

(declare-fun zeroValue!1342 () V!33953)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun getCurrentListMap!3606 (array!59556 array!59554 (_ BitVec 32) (_ BitVec 32) V!33953 V!33953 (_ BitVec 32) Int) ListLongMap!12715)

(assert (=> b!966630 (= lt!431615 (getCurrentListMap!3606 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403))))

(declare-fun b!966631 () Bool)

(declare-fun res!646770 () Bool)

(assert (=> b!966631 (=> (not res!646770) (not e!544987))))

(assert (=> b!966631 (= res!646770 (and (= (size!29121 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29122 _keys!1686) (size!29121 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966632 () Bool)

(declare-fun res!646772 () Bool)

(assert (=> b!966632 (=> (not res!646772) (not e!544987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966632 (= res!646772 (validKeyInArray!0 (select (arr!28642 _keys!1686) i!803)))))

(declare-fun res!646769 () Bool)

(assert (=> start!82960 (=> (not res!646769) (not e!544987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82960 (= res!646769 (validMask!0 mask!2110))))

(assert (=> start!82960 e!544987))

(assert (=> start!82960 true))

(declare-fun array_inv!22235 (array!59554) Bool)

(assert (=> start!82960 (and (array_inv!22235 _values!1400) e!544985)))

(declare-fun array_inv!22236 (array!59556) Bool)

(assert (=> start!82960 (array_inv!22236 _keys!1686)))

(assert (=> start!82960 tp!65887))

(assert (=> start!82960 tp_is_empty!21727))

(declare-fun mapNonEmpty!34585 () Bool)

(declare-fun tp!65886 () Bool)

(assert (=> mapNonEmpty!34585 (= mapRes!34585 (and tp!65886 e!544986))))

(declare-fun mapKey!34585 () (_ BitVec 32))

(declare-fun mapValue!34585 () ValueCell!10382)

(declare-fun mapRest!34585 () (Array (_ BitVec 32) ValueCell!10382))

(assert (=> mapNonEmpty!34585 (= (arr!28641 _values!1400) (store mapRest!34585 mapKey!34585 mapValue!34585))))

(declare-fun b!966633 () Bool)

(declare-fun res!646768 () Bool)

(assert (=> b!966633 (=> (not res!646768) (not e!544987))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966633 (= res!646768 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29122 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29122 _keys!1686))))))

(declare-fun b!966634 () Bool)

(declare-fun res!646773 () Bool)

(assert (=> b!966634 (=> (not res!646773) (not e!544987))))

(declare-datatypes ((List!19864 0))(
  ( (Nil!19861) (Cons!19860 (h!21028 (_ BitVec 64)) (t!28219 List!19864)) )
))
(declare-fun arrayNoDuplicates!0 (array!59556 (_ BitVec 32) List!19864) Bool)

(assert (=> b!966634 (= res!646773 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19861))))

(assert (= (and start!82960 res!646769) b!966631))

(assert (= (and b!966631 res!646770) b!966629))

(assert (= (and b!966629 res!646771) b!966634))

(assert (= (and b!966634 res!646773) b!966633))

(assert (= (and b!966633 res!646768) b!966632))

(assert (= (and b!966632 res!646772) b!966630))

(assert (= (and b!966627 condMapEmpty!34585) mapIsEmpty!34585))

(assert (= (and b!966627 (not condMapEmpty!34585)) mapNonEmpty!34585))

(get-info :version)

(assert (= (and mapNonEmpty!34585 ((_ is ValueCellFull!10382) mapValue!34585)) b!966626))

(assert (= (and b!966627 ((_ is ValueCellFull!10382) mapDefault!34585)) b!966628))

(assert (= start!82960 b!966627))

(declare-fun m!895999 () Bool)

(assert (=> b!966630 m!895999))

(declare-fun m!896001 () Bool)

(assert (=> b!966629 m!896001))

(declare-fun m!896003 () Bool)

(assert (=> start!82960 m!896003))

(declare-fun m!896005 () Bool)

(assert (=> start!82960 m!896005))

(declare-fun m!896007 () Bool)

(assert (=> start!82960 m!896007))

(declare-fun m!896009 () Bool)

(assert (=> b!966632 m!896009))

(assert (=> b!966632 m!896009))

(declare-fun m!896011 () Bool)

(assert (=> b!966632 m!896011))

(declare-fun m!896013 () Bool)

(assert (=> mapNonEmpty!34585 m!896013))

(declare-fun m!896015 () Bool)

(assert (=> b!966634 m!896015))

(check-sat tp_is_empty!21727 b_and!30417 (not b!966634) (not b_next!18919) (not b!966632) (not b!966629) (not b!966630) (not mapNonEmpty!34585) (not start!82960))
(check-sat b_and!30417 (not b_next!18919))
