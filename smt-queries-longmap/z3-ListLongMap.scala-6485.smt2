; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82918 () Bool)

(assert start!82918)

(declare-fun b_free!18883 () Bool)

(declare-fun b_next!18883 () Bool)

(assert (=> start!82918 (= b_free!18883 (not b_next!18883))))

(declare-fun tp!65769 () Bool)

(declare-fun b_and!30381 () Bool)

(assert (=> start!82918 (= tp!65769 b_and!30381)))

(declare-fun b!966068 () Bool)

(declare-fun e!544673 () Bool)

(assert (=> b!966068 (= e!544673 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33897 0))(
  ( (V!33898 (val!10893 Int)) )
))
(declare-datatypes ((ValueCell!10361 0))(
  ( (ValueCellFull!10361 (v!13448 V!33897)) (EmptyCell!10361) )
))
(declare-datatypes ((array!59474 0))(
  ( (array!59475 (arr!28601 (Array (_ BitVec 32) ValueCell!10361)) (size!29081 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59474)

(declare-datatypes ((array!59476 0))(
  ( (array!59477 (arr!28602 (Array (_ BitVec 32) (_ BitVec 64))) (size!29082 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59476)

(declare-fun minValue!1342 () V!33897)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33897)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!431570 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!13994 0))(
  ( (tuple2!13995 (_1!7008 (_ BitVec 64)) (_2!7008 V!33897)) )
))
(declare-datatypes ((List!19839 0))(
  ( (Nil!19836) (Cons!19835 (h!21003 tuple2!13994) (t!28194 List!19839)) )
))
(declare-datatypes ((ListLongMap!12693 0))(
  ( (ListLongMap!12694 (toList!6362 List!19839)) )
))
(declare-fun contains!5477 (ListLongMap!12693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3595 (array!59476 array!59474 (_ BitVec 32) (_ BitVec 32) V!33897 V!33897 (_ BitVec 32) Int) ListLongMap!12693)

(assert (=> b!966068 (= lt!431570 (contains!5477 (getCurrentListMap!3595 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28602 _keys!1686) i!803)))))

(declare-fun res!646401 () Bool)

(assert (=> start!82918 (=> (not res!646401) (not e!544673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82918 (= res!646401 (validMask!0 mask!2110))))

(assert (=> start!82918 e!544673))

(assert (=> start!82918 true))

(declare-fun e!544672 () Bool)

(declare-fun array_inv!22213 (array!59474) Bool)

(assert (=> start!82918 (and (array_inv!22213 _values!1400) e!544672)))

(declare-fun array_inv!22214 (array!59476) Bool)

(assert (=> start!82918 (array_inv!22214 _keys!1686)))

(assert (=> start!82918 tp!65769))

(declare-fun tp_is_empty!21685 () Bool)

(assert (=> start!82918 tp_is_empty!21685))

(declare-fun b!966069 () Bool)

(declare-fun res!646404 () Bool)

(assert (=> b!966069 (=> (not res!646404) (not e!544673))))

(declare-datatypes ((List!19840 0))(
  ( (Nil!19837) (Cons!19836 (h!21004 (_ BitVec 64)) (t!28195 List!19840)) )
))
(declare-fun arrayNoDuplicates!0 (array!59476 (_ BitVec 32) List!19840) Bool)

(assert (=> b!966069 (= res!646404 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19837))))

(declare-fun b!966070 () Bool)

(declare-fun e!544671 () Bool)

(declare-fun mapRes!34522 () Bool)

(assert (=> b!966070 (= e!544672 (and e!544671 mapRes!34522))))

(declare-fun condMapEmpty!34522 () Bool)

(declare-fun mapDefault!34522 () ValueCell!10361)

(assert (=> b!966070 (= condMapEmpty!34522 (= (arr!28601 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10361)) mapDefault!34522)))))

(declare-fun b!966071 () Bool)

(declare-fun res!646399 () Bool)

(assert (=> b!966071 (=> (not res!646399) (not e!544673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59476 (_ BitVec 32)) Bool)

(assert (=> b!966071 (= res!646399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34522 () Bool)

(declare-fun tp!65770 () Bool)

(declare-fun e!544669 () Bool)

(assert (=> mapNonEmpty!34522 (= mapRes!34522 (and tp!65770 e!544669))))

(declare-fun mapRest!34522 () (Array (_ BitVec 32) ValueCell!10361))

(declare-fun mapValue!34522 () ValueCell!10361)

(declare-fun mapKey!34522 () (_ BitVec 32))

(assert (=> mapNonEmpty!34522 (= (arr!28601 _values!1400) (store mapRest!34522 mapKey!34522 mapValue!34522))))

(declare-fun mapIsEmpty!34522 () Bool)

(assert (=> mapIsEmpty!34522 mapRes!34522))

(declare-fun b!966072 () Bool)

(declare-fun res!646402 () Bool)

(assert (=> b!966072 (=> (not res!646402) (not e!544673))))

(assert (=> b!966072 (= res!646402 (and (= (size!29081 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29082 _keys!1686) (size!29081 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966073 () Bool)

(declare-fun res!646400 () Bool)

(assert (=> b!966073 (=> (not res!646400) (not e!544673))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966073 (= res!646400 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29082 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29082 _keys!1686))))))

(declare-fun b!966074 () Bool)

(assert (=> b!966074 (= e!544669 tp_is_empty!21685)))

(declare-fun b!966075 () Bool)

(assert (=> b!966075 (= e!544671 tp_is_empty!21685)))

(declare-fun b!966076 () Bool)

(declare-fun res!646403 () Bool)

(assert (=> b!966076 (=> (not res!646403) (not e!544673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966076 (= res!646403 (validKeyInArray!0 (select (arr!28602 _keys!1686) i!803)))))

(assert (= (and start!82918 res!646401) b!966072))

(assert (= (and b!966072 res!646402) b!966071))

(assert (= (and b!966071 res!646399) b!966069))

(assert (= (and b!966069 res!646404) b!966073))

(assert (= (and b!966073 res!646400) b!966076))

(assert (= (and b!966076 res!646403) b!966068))

(assert (= (and b!966070 condMapEmpty!34522) mapIsEmpty!34522))

(assert (= (and b!966070 (not condMapEmpty!34522)) mapNonEmpty!34522))

(get-info :version)

(assert (= (and mapNonEmpty!34522 ((_ is ValueCellFull!10361) mapValue!34522)) b!966074))

(assert (= (and b!966070 ((_ is ValueCellFull!10361) mapDefault!34522)) b!966075))

(assert (= start!82918 b!966070))

(declare-fun m!895603 () Bool)

(assert (=> b!966071 m!895603))

(declare-fun m!895605 () Bool)

(assert (=> b!966076 m!895605))

(assert (=> b!966076 m!895605))

(declare-fun m!895607 () Bool)

(assert (=> b!966076 m!895607))

(declare-fun m!895609 () Bool)

(assert (=> b!966068 m!895609))

(assert (=> b!966068 m!895605))

(assert (=> b!966068 m!895609))

(assert (=> b!966068 m!895605))

(declare-fun m!895611 () Bool)

(assert (=> b!966068 m!895611))

(declare-fun m!895613 () Bool)

(assert (=> start!82918 m!895613))

(declare-fun m!895615 () Bool)

(assert (=> start!82918 m!895615))

(declare-fun m!895617 () Bool)

(assert (=> start!82918 m!895617))

(declare-fun m!895619 () Bool)

(assert (=> b!966069 m!895619))

(declare-fun m!895621 () Bool)

(assert (=> mapNonEmpty!34522 m!895621))

(check-sat (not b!966069) (not mapNonEmpty!34522) tp_is_empty!21685 (not b_next!18883) (not b!966076) (not start!82918) b_and!30381 (not b!966068) (not b!966071))
(check-sat b_and!30381 (not b_next!18883))
