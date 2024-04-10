; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82596 () Bool)

(assert start!82596)

(declare-fun b_free!18729 () Bool)

(declare-fun b_next!18729 () Bool)

(assert (=> start!82596 (= b_free!18729 (not b_next!18729))))

(declare-fun tp!65307 () Bool)

(declare-fun b_and!30217 () Bool)

(assert (=> start!82596 (= tp!65307 b_and!30217)))

(declare-fun mapIsEmpty!34291 () Bool)

(declare-fun mapRes!34291 () Bool)

(assert (=> mapIsEmpty!34291 mapRes!34291))

(declare-fun b!962628 () Bool)

(declare-fun e!542851 () Bool)

(assert (=> b!962628 (= e!542851 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!430897 () Bool)

(declare-datatypes ((V!33691 0))(
  ( (V!33692 (val!10816 Int)) )
))
(declare-datatypes ((ValueCell!10284 0))(
  ( (ValueCellFull!10284 (v!13374 V!33691)) (EmptyCell!10284) )
))
(declare-datatypes ((array!59159 0))(
  ( (array!59160 (arr!28448 (Array (_ BitVec 32) ValueCell!10284)) (size!28927 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59159)

(declare-datatypes ((array!59161 0))(
  ( (array!59162 (arr!28449 (Array (_ BitVec 32) (_ BitVec 64))) (size!28928 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59161)

(declare-fun minValue!1342 () V!33691)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33691)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13892 0))(
  ( (tuple2!13893 (_1!6957 (_ BitVec 64)) (_2!6957 V!33691)) )
))
(declare-datatypes ((List!19742 0))(
  ( (Nil!19739) (Cons!19738 (h!20900 tuple2!13892) (t!28105 List!19742)) )
))
(declare-datatypes ((ListLongMap!12589 0))(
  ( (ListLongMap!12590 (toList!6310 List!19742)) )
))
(declare-fun contains!5413 (ListLongMap!12589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3543 (array!59161 array!59159 (_ BitVec 32) (_ BitVec 32) V!33691 V!33691 (_ BitVec 32) Int) ListLongMap!12589)

(assert (=> b!962628 (= lt!430897 (contains!5413 (getCurrentListMap!3543 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28449 _keys!1686) i!803)))))

(declare-fun b!962629 () Bool)

(declare-fun res!644213 () Bool)

(assert (=> b!962629 (=> (not res!644213) (not e!542851))))

(declare-datatypes ((List!19743 0))(
  ( (Nil!19740) (Cons!19739 (h!20901 (_ BitVec 64)) (t!28106 List!19743)) )
))
(declare-fun arrayNoDuplicates!0 (array!59161 (_ BitVec 32) List!19743) Bool)

(assert (=> b!962629 (= res!644213 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19740))))

(declare-fun b!962630 () Bool)

(declare-fun res!644211 () Bool)

(assert (=> b!962630 (=> (not res!644211) (not e!542851))))

(assert (=> b!962630 (= res!644211 (and (= (size!28927 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28928 _keys!1686) (size!28927 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34291 () Bool)

(declare-fun tp!65306 () Bool)

(declare-fun e!542852 () Bool)

(assert (=> mapNonEmpty!34291 (= mapRes!34291 (and tp!65306 e!542852))))

(declare-fun mapValue!34291 () ValueCell!10284)

(declare-fun mapKey!34291 () (_ BitVec 32))

(declare-fun mapRest!34291 () (Array (_ BitVec 32) ValueCell!10284))

(assert (=> mapNonEmpty!34291 (= (arr!28448 _values!1400) (store mapRest!34291 mapKey!34291 mapValue!34291))))

(declare-fun b!962631 () Bool)

(declare-fun e!542854 () Bool)

(declare-fun tp_is_empty!21531 () Bool)

(assert (=> b!962631 (= e!542854 tp_is_empty!21531)))

(declare-fun b!962632 () Bool)

(assert (=> b!962632 (= e!542852 tp_is_empty!21531)))

(declare-fun b!962633 () Bool)

(declare-fun res!644215 () Bool)

(assert (=> b!962633 (=> (not res!644215) (not e!542851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962633 (= res!644215 (validKeyInArray!0 (select (arr!28449 _keys!1686) i!803)))))

(declare-fun b!962634 () Bool)

(declare-fun e!542855 () Bool)

(assert (=> b!962634 (= e!542855 (and e!542854 mapRes!34291))))

(declare-fun condMapEmpty!34291 () Bool)

(declare-fun mapDefault!34291 () ValueCell!10284)

(assert (=> b!962634 (= condMapEmpty!34291 (= (arr!28448 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10284)) mapDefault!34291)))))

(declare-fun b!962635 () Bool)

(declare-fun res!644212 () Bool)

(assert (=> b!962635 (=> (not res!644212) (not e!542851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59161 (_ BitVec 32)) Bool)

(assert (=> b!962635 (= res!644212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962627 () Bool)

(declare-fun res!644214 () Bool)

(assert (=> b!962627 (=> (not res!644214) (not e!542851))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962627 (= res!644214 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28928 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28928 _keys!1686))))))

(declare-fun res!644210 () Bool)

(assert (=> start!82596 (=> (not res!644210) (not e!542851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82596 (= res!644210 (validMask!0 mask!2110))))

(assert (=> start!82596 e!542851))

(assert (=> start!82596 true))

(declare-fun array_inv!22043 (array!59159) Bool)

(assert (=> start!82596 (and (array_inv!22043 _values!1400) e!542855)))

(declare-fun array_inv!22044 (array!59161) Bool)

(assert (=> start!82596 (array_inv!22044 _keys!1686)))

(assert (=> start!82596 tp!65307))

(assert (=> start!82596 tp_is_empty!21531))

(assert (= (and start!82596 res!644210) b!962630))

(assert (= (and b!962630 res!644211) b!962635))

(assert (= (and b!962635 res!644212) b!962629))

(assert (= (and b!962629 res!644213) b!962627))

(assert (= (and b!962627 res!644214) b!962633))

(assert (= (and b!962633 res!644215) b!962628))

(assert (= (and b!962634 condMapEmpty!34291) mapIsEmpty!34291))

(assert (= (and b!962634 (not condMapEmpty!34291)) mapNonEmpty!34291))

(get-info :version)

(assert (= (and mapNonEmpty!34291 ((_ is ValueCellFull!10284) mapValue!34291)) b!962632))

(assert (= (and b!962634 ((_ is ValueCellFull!10284) mapDefault!34291)) b!962631))

(assert (= start!82596 b!962634))

(declare-fun m!892229 () Bool)

(assert (=> b!962635 m!892229))

(declare-fun m!892231 () Bool)

(assert (=> start!82596 m!892231))

(declare-fun m!892233 () Bool)

(assert (=> start!82596 m!892233))

(declare-fun m!892235 () Bool)

(assert (=> start!82596 m!892235))

(declare-fun m!892237 () Bool)

(assert (=> b!962629 m!892237))

(declare-fun m!892239 () Bool)

(assert (=> b!962628 m!892239))

(declare-fun m!892241 () Bool)

(assert (=> b!962628 m!892241))

(assert (=> b!962628 m!892239))

(assert (=> b!962628 m!892241))

(declare-fun m!892243 () Bool)

(assert (=> b!962628 m!892243))

(declare-fun m!892245 () Bool)

(assert (=> mapNonEmpty!34291 m!892245))

(assert (=> b!962633 m!892241))

(assert (=> b!962633 m!892241))

(declare-fun m!892247 () Bool)

(assert (=> b!962633 m!892247))

(check-sat (not start!82596) b_and!30217 (not b!962635) (not b!962629) (not b!962628) tp_is_empty!21531 (not b!962633) (not mapNonEmpty!34291) (not b_next!18729))
(check-sat b_and!30217 (not b_next!18729))
