; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82768 () Bool)

(assert start!82768)

(declare-fun b_free!18733 () Bool)

(declare-fun b_next!18733 () Bool)

(assert (=> start!82768 (= b_free!18733 (not b_next!18733))))

(declare-fun tp!65320 () Bool)

(declare-fun b_and!30231 () Bool)

(assert (=> start!82768 (= tp!65320 b_and!30231)))

(declare-fun b!963584 () Bool)

(declare-fun res!644594 () Bool)

(declare-fun e!543464 () Bool)

(assert (=> b!963584 (=> (not res!644594) (not e!543464))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33697 0))(
  ( (V!33698 (val!10818 Int)) )
))
(declare-datatypes ((ValueCell!10286 0))(
  ( (ValueCellFull!10286 (v!13373 V!33697)) (EmptyCell!10286) )
))
(declare-datatypes ((array!59184 0))(
  ( (array!59185 (arr!28456 (Array (_ BitVec 32) ValueCell!10286)) (size!28936 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59184)

(declare-datatypes ((array!59186 0))(
  ( (array!59187 (arr!28457 (Array (_ BitVec 32) (_ BitVec 64))) (size!28937 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59186)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963584 (= res!644594 (and (= (size!28936 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28937 _keys!1686) (size!28936 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963585 () Bool)

(declare-fun e!543466 () Bool)

(declare-fun e!543465 () Bool)

(declare-fun mapRes!34297 () Bool)

(assert (=> b!963585 (= e!543466 (and e!543465 mapRes!34297))))

(declare-fun condMapEmpty!34297 () Bool)

(declare-fun mapDefault!34297 () ValueCell!10286)

(assert (=> b!963585 (= condMapEmpty!34297 (= (arr!28456 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10286)) mapDefault!34297)))))

(declare-fun res!644595 () Bool)

(assert (=> start!82768 (=> (not res!644595) (not e!543464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82768 (= res!644595 (validMask!0 mask!2110))))

(assert (=> start!82768 e!543464))

(assert (=> start!82768 true))

(declare-fun array_inv!22117 (array!59184) Bool)

(assert (=> start!82768 (and (array_inv!22117 _values!1400) e!543466)))

(declare-fun array_inv!22118 (array!59186) Bool)

(assert (=> start!82768 (array_inv!22118 _keys!1686)))

(assert (=> start!82768 tp!65320))

(declare-fun tp_is_empty!21535 () Bool)

(assert (=> start!82768 tp_is_empty!21535))

(declare-fun b!963586 () Bool)

(declare-fun e!543463 () Bool)

(assert (=> b!963586 (= e!543463 tp_is_empty!21535)))

(declare-fun b!963587 () Bool)

(assert (=> b!963587 (= e!543465 tp_is_empty!21535)))

(declare-fun mapIsEmpty!34297 () Bool)

(assert (=> mapIsEmpty!34297 mapRes!34297))

(declare-fun b!963588 () Bool)

(assert (=> b!963588 (= e!543464 false)))

(declare-fun minValue!1342 () V!33697)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431264 () Bool)

(declare-fun zeroValue!1342 () V!33697)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13876 0))(
  ( (tuple2!13877 (_1!6949 (_ BitVec 64)) (_2!6949 V!33697)) )
))
(declare-datatypes ((List!19728 0))(
  ( (Nil!19725) (Cons!19724 (h!20892 tuple2!13876) (t!28083 List!19728)) )
))
(declare-datatypes ((ListLongMap!12575 0))(
  ( (ListLongMap!12576 (toList!6303 List!19728)) )
))
(declare-fun contains!5418 (ListLongMap!12575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3536 (array!59186 array!59184 (_ BitVec 32) (_ BitVec 32) V!33697 V!33697 (_ BitVec 32) Int) ListLongMap!12575)

(assert (=> b!963588 (= lt!431264 (contains!5418 (getCurrentListMap!3536 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28457 _keys!1686) i!803)))))

(declare-fun b!963589 () Bool)

(declare-fun res!644590 () Bool)

(assert (=> b!963589 (=> (not res!644590) (not e!543464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963589 (= res!644590 (validKeyInArray!0 (select (arr!28457 _keys!1686) i!803)))))

(declare-fun b!963590 () Bool)

(declare-fun res!644592 () Bool)

(assert (=> b!963590 (=> (not res!644592) (not e!543464))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963590 (= res!644592 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28937 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28937 _keys!1686))))))

(declare-fun mapNonEmpty!34297 () Bool)

(declare-fun tp!65319 () Bool)

(assert (=> mapNonEmpty!34297 (= mapRes!34297 (and tp!65319 e!543463))))

(declare-fun mapRest!34297 () (Array (_ BitVec 32) ValueCell!10286))

(declare-fun mapValue!34297 () ValueCell!10286)

(declare-fun mapKey!34297 () (_ BitVec 32))

(assert (=> mapNonEmpty!34297 (= (arr!28456 _values!1400) (store mapRest!34297 mapKey!34297 mapValue!34297))))

(declare-fun b!963591 () Bool)

(declare-fun res!644593 () Bool)

(assert (=> b!963591 (=> (not res!644593) (not e!543464))))

(declare-datatypes ((List!19729 0))(
  ( (Nil!19726) (Cons!19725 (h!20893 (_ BitVec 64)) (t!28084 List!19729)) )
))
(declare-fun arrayNoDuplicates!0 (array!59186 (_ BitVec 32) List!19729) Bool)

(assert (=> b!963591 (= res!644593 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19726))))

(declare-fun b!963592 () Bool)

(declare-fun res!644591 () Bool)

(assert (=> b!963592 (=> (not res!644591) (not e!543464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59186 (_ BitVec 32)) Bool)

(assert (=> b!963592 (= res!644591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82768 res!644595) b!963584))

(assert (= (and b!963584 res!644594) b!963592))

(assert (= (and b!963592 res!644591) b!963591))

(assert (= (and b!963591 res!644593) b!963590))

(assert (= (and b!963590 res!644592) b!963589))

(assert (= (and b!963589 res!644590) b!963588))

(assert (= (and b!963585 condMapEmpty!34297) mapIsEmpty!34297))

(assert (= (and b!963585 (not condMapEmpty!34297)) mapNonEmpty!34297))

(get-info :version)

(assert (= (and mapNonEmpty!34297 ((_ is ValueCellFull!10286) mapValue!34297)) b!963586))

(assert (= (and b!963585 ((_ is ValueCellFull!10286) mapDefault!34297)) b!963587))

(assert (= start!82768 b!963585))

(declare-fun m!893563 () Bool)

(assert (=> b!963592 m!893563))

(declare-fun m!893565 () Bool)

(assert (=> b!963591 m!893565))

(declare-fun m!893567 () Bool)

(assert (=> start!82768 m!893567))

(declare-fun m!893569 () Bool)

(assert (=> start!82768 m!893569))

(declare-fun m!893571 () Bool)

(assert (=> start!82768 m!893571))

(declare-fun m!893573 () Bool)

(assert (=> b!963589 m!893573))

(assert (=> b!963589 m!893573))

(declare-fun m!893575 () Bool)

(assert (=> b!963589 m!893575))

(declare-fun m!893577 () Bool)

(assert (=> mapNonEmpty!34297 m!893577))

(declare-fun m!893579 () Bool)

(assert (=> b!963588 m!893579))

(assert (=> b!963588 m!893573))

(assert (=> b!963588 m!893579))

(assert (=> b!963588 m!893573))

(declare-fun m!893581 () Bool)

(assert (=> b!963588 m!893581))

(check-sat (not start!82768) (not mapNonEmpty!34297) (not b!963589) (not b!963591) (not b!963588) tp_is_empty!21535 b_and!30231 (not b!963592) (not b_next!18733))
(check-sat b_and!30231 (not b_next!18733))
