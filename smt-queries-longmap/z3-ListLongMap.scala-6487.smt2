; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82930 () Bool)

(assert start!82930)

(declare-fun b_free!18895 () Bool)

(declare-fun b_next!18895 () Bool)

(assert (=> start!82930 (= b_free!18895 (not b_next!18895))))

(declare-fun tp!65806 () Bool)

(declare-fun b_and!30393 () Bool)

(assert (=> start!82930 (= tp!65806 b_and!30393)))

(declare-fun mapIsEmpty!34540 () Bool)

(declare-fun mapRes!34540 () Bool)

(assert (=> mapIsEmpty!34540 mapRes!34540))

(declare-fun res!646507 () Bool)

(declare-fun e!544760 () Bool)

(assert (=> start!82930 (=> (not res!646507) (not e!544760))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82930 (= res!646507 (validMask!0 mask!2110))))

(assert (=> start!82930 e!544760))

(assert (=> start!82930 true))

(declare-datatypes ((V!33913 0))(
  ( (V!33914 (val!10899 Int)) )
))
(declare-datatypes ((ValueCell!10367 0))(
  ( (ValueCellFull!10367 (v!13454 V!33913)) (EmptyCell!10367) )
))
(declare-datatypes ((array!59496 0))(
  ( (array!59497 (arr!28612 (Array (_ BitVec 32) ValueCell!10367)) (size!29092 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59496)

(declare-fun e!544759 () Bool)

(declare-fun array_inv!22221 (array!59496) Bool)

(assert (=> start!82930 (and (array_inv!22221 _values!1400) e!544759)))

(declare-datatypes ((array!59498 0))(
  ( (array!59499 (arr!28613 (Array (_ BitVec 32) (_ BitVec 64))) (size!29093 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59498)

(declare-fun array_inv!22222 (array!59498) Bool)

(assert (=> start!82930 (array_inv!22222 _keys!1686)))

(assert (=> start!82930 tp!65806))

(declare-fun tp_is_empty!21697 () Bool)

(assert (=> start!82930 tp_is_empty!21697))

(declare-fun b!966230 () Bool)

(assert (=> b!966230 (= e!544760 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431588 () Bool)

(declare-fun minValue!1342 () V!33913)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33913)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14000 0))(
  ( (tuple2!14001 (_1!7011 (_ BitVec 64)) (_2!7011 V!33913)) )
))
(declare-datatypes ((List!19844 0))(
  ( (Nil!19841) (Cons!19840 (h!21008 tuple2!14000) (t!28199 List!19844)) )
))
(declare-datatypes ((ListLongMap!12699 0))(
  ( (ListLongMap!12700 (toList!6365 List!19844)) )
))
(declare-fun contains!5480 (ListLongMap!12699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3598 (array!59498 array!59496 (_ BitVec 32) (_ BitVec 32) V!33913 V!33913 (_ BitVec 32) Int) ListLongMap!12699)

(assert (=> b!966230 (= lt!431588 (contains!5480 (getCurrentListMap!3598 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28613 _keys!1686) i!803)))))

(declare-fun b!966231 () Bool)

(declare-fun res!646511 () Bool)

(assert (=> b!966231 (=> (not res!646511) (not e!544760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59498 (_ BitVec 32)) Bool)

(assert (=> b!966231 (= res!646511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966232 () Bool)

(declare-fun e!544763 () Bool)

(assert (=> b!966232 (= e!544763 tp_is_empty!21697)))

(declare-fun b!966233 () Bool)

(declare-fun res!646512 () Bool)

(assert (=> b!966233 (=> (not res!646512) (not e!544760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966233 (= res!646512 (validKeyInArray!0 (select (arr!28613 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34540 () Bool)

(declare-fun tp!65805 () Bool)

(declare-fun e!544762 () Bool)

(assert (=> mapNonEmpty!34540 (= mapRes!34540 (and tp!65805 e!544762))))

(declare-fun mapKey!34540 () (_ BitVec 32))

(declare-fun mapRest!34540 () (Array (_ BitVec 32) ValueCell!10367))

(declare-fun mapValue!34540 () ValueCell!10367)

(assert (=> mapNonEmpty!34540 (= (arr!28612 _values!1400) (store mapRest!34540 mapKey!34540 mapValue!34540))))

(declare-fun b!966234 () Bool)

(declare-fun res!646509 () Bool)

(assert (=> b!966234 (=> (not res!646509) (not e!544760))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966234 (= res!646509 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29093 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29093 _keys!1686))))))

(declare-fun b!966235 () Bool)

(assert (=> b!966235 (= e!544759 (and e!544763 mapRes!34540))))

(declare-fun condMapEmpty!34540 () Bool)

(declare-fun mapDefault!34540 () ValueCell!10367)

(assert (=> b!966235 (= condMapEmpty!34540 (= (arr!28612 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10367)) mapDefault!34540)))))

(declare-fun b!966236 () Bool)

(declare-fun res!646510 () Bool)

(assert (=> b!966236 (=> (not res!646510) (not e!544760))))

(assert (=> b!966236 (= res!646510 (and (= (size!29092 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29093 _keys!1686) (size!29092 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966237 () Bool)

(assert (=> b!966237 (= e!544762 tp_is_empty!21697)))

(declare-fun b!966238 () Bool)

(declare-fun res!646508 () Bool)

(assert (=> b!966238 (=> (not res!646508) (not e!544760))))

(declare-datatypes ((List!19845 0))(
  ( (Nil!19842) (Cons!19841 (h!21009 (_ BitVec 64)) (t!28200 List!19845)) )
))
(declare-fun arrayNoDuplicates!0 (array!59498 (_ BitVec 32) List!19845) Bool)

(assert (=> b!966238 (= res!646508 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19842))))

(assert (= (and start!82930 res!646507) b!966236))

(assert (= (and b!966236 res!646510) b!966231))

(assert (= (and b!966231 res!646511) b!966238))

(assert (= (and b!966238 res!646508) b!966234))

(assert (= (and b!966234 res!646509) b!966233))

(assert (= (and b!966233 res!646512) b!966230))

(assert (= (and b!966235 condMapEmpty!34540) mapIsEmpty!34540))

(assert (= (and b!966235 (not condMapEmpty!34540)) mapNonEmpty!34540))

(get-info :version)

(assert (= (and mapNonEmpty!34540 ((_ is ValueCellFull!10367) mapValue!34540)) b!966237))

(assert (= (and b!966235 ((_ is ValueCellFull!10367) mapDefault!34540)) b!966232))

(assert (= start!82930 b!966235))

(declare-fun m!895723 () Bool)

(assert (=> b!966230 m!895723))

(declare-fun m!895725 () Bool)

(assert (=> b!966230 m!895725))

(assert (=> b!966230 m!895723))

(assert (=> b!966230 m!895725))

(declare-fun m!895727 () Bool)

(assert (=> b!966230 m!895727))

(declare-fun m!895729 () Bool)

(assert (=> start!82930 m!895729))

(declare-fun m!895731 () Bool)

(assert (=> start!82930 m!895731))

(declare-fun m!895733 () Bool)

(assert (=> start!82930 m!895733))

(declare-fun m!895735 () Bool)

(assert (=> b!966231 m!895735))

(declare-fun m!895737 () Bool)

(assert (=> mapNonEmpty!34540 m!895737))

(declare-fun m!895739 () Bool)

(assert (=> b!966238 m!895739))

(assert (=> b!966233 m!895725))

(assert (=> b!966233 m!895725))

(declare-fun m!895741 () Bool)

(assert (=> b!966233 m!895741))

(check-sat (not b!966238) (not b_next!18895) (not b!966230) tp_is_empty!21697 b_and!30393 (not start!82930) (not b!966231) (not mapNonEmpty!34540) (not b!966233))
(check-sat b_and!30393 (not b_next!18895))
