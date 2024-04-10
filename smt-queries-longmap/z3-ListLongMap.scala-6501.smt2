; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82848 () Bool)

(assert start!82848)

(declare-fun b_free!18975 () Bool)

(declare-fun b_next!18975 () Bool)

(assert (=> start!82848 (= b_free!18975 (not b_next!18975))))

(declare-fun tp!66054 () Bool)

(declare-fun b_and!30463 () Bool)

(assert (=> start!82848 (= tp!66054 b_and!30463)))

(declare-fun res!646931 () Bool)

(declare-fun e!544823 () Bool)

(assert (=> start!82848 (=> (not res!646931) (not e!544823))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82848 (= res!646931 (validMask!0 mask!2110))))

(assert (=> start!82848 e!544823))

(assert (=> start!82848 true))

(declare-datatypes ((V!34027 0))(
  ( (V!34028 (val!10942 Int)) )
))
(declare-datatypes ((ValueCell!10410 0))(
  ( (ValueCellFull!10410 (v!13500 V!34027)) (EmptyCell!10410) )
))
(declare-datatypes ((array!59649 0))(
  ( (array!59650 (arr!28693 (Array (_ BitVec 32) ValueCell!10410)) (size!29172 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59649)

(declare-fun e!544825 () Bool)

(declare-fun array_inv!22225 (array!59649) Bool)

(assert (=> start!82848 (and (array_inv!22225 _values!1400) e!544825)))

(declare-datatypes ((array!59651 0))(
  ( (array!59652 (arr!28694 (Array (_ BitVec 32) (_ BitVec 64))) (size!29173 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59651)

(declare-fun array_inv!22226 (array!59651) Bool)

(assert (=> start!82848 (array_inv!22226 _keys!1686)))

(assert (=> start!82848 tp!66054))

(declare-fun tp_is_empty!21783 () Bool)

(assert (=> start!82848 tp_is_empty!21783))

(declare-fun b!966479 () Bool)

(declare-fun res!646929 () Bool)

(assert (=> b!966479 (=> (not res!646929) (not e!544823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59651 (_ BitVec 32)) Bool)

(assert (=> b!966479 (= res!646929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966480 () Bool)

(declare-fun res!646928 () Bool)

(assert (=> b!966480 (=> (not res!646928) (not e!544823))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966480 (= res!646928 (and (= (size!29172 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29173 _keys!1686) (size!29172 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34669 () Bool)

(declare-fun mapRes!34669 () Bool)

(declare-fun tp!66053 () Bool)

(declare-fun e!544824 () Bool)

(assert (=> mapNonEmpty!34669 (= mapRes!34669 (and tp!66053 e!544824))))

(declare-fun mapValue!34669 () ValueCell!10410)

(declare-fun mapKey!34669 () (_ BitVec 32))

(declare-fun mapRest!34669 () (Array (_ BitVec 32) ValueCell!10410))

(assert (=> mapNonEmpty!34669 (= (arr!28693 _values!1400) (store mapRest!34669 mapKey!34669 mapValue!34669))))

(declare-fun b!966481 () Bool)

(declare-fun res!646932 () Bool)

(assert (=> b!966481 (=> (not res!646932) (not e!544823))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966481 (= res!646932 (validKeyInArray!0 (select (arr!28694 _keys!1686) i!803)))))

(declare-fun b!966482 () Bool)

(assert (=> b!966482 (= e!544824 tp_is_empty!21783)))

(declare-fun b!966483 () Bool)

(declare-fun res!646930 () Bool)

(assert (=> b!966483 (=> (not res!646930) (not e!544823))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966483 (= res!646930 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29173 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29173 _keys!1686))))))

(declare-fun b!966484 () Bool)

(declare-fun e!544826 () Bool)

(assert (=> b!966484 (= e!544825 (and e!544826 mapRes!34669))))

(declare-fun condMapEmpty!34669 () Bool)

(declare-fun mapDefault!34669 () ValueCell!10410)

(assert (=> b!966484 (= condMapEmpty!34669 (= (arr!28693 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10410)) mapDefault!34669)))))

(declare-fun mapIsEmpty!34669 () Bool)

(assert (=> mapIsEmpty!34669 mapRes!34669))

(declare-fun b!966485 () Bool)

(declare-fun res!646933 () Bool)

(assert (=> b!966485 (=> (not res!646933) (not e!544823))))

(declare-datatypes ((List!19917 0))(
  ( (Nil!19914) (Cons!19913 (h!21075 (_ BitVec 64)) (t!28280 List!19917)) )
))
(declare-fun arrayNoDuplicates!0 (array!59651 (_ BitVec 32) List!19917) Bool)

(assert (=> b!966485 (= res!646933 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19914))))

(declare-fun b!966486 () Bool)

(assert (=> b!966486 (= e!544826 tp_is_empty!21783)))

(declare-fun b!966487 () Bool)

(assert (=> b!966487 (= e!544823 false)))

(declare-fun lt!431338 () Bool)

(declare-fun minValue!1342 () V!34027)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34027)

(declare-datatypes ((tuple2!14072 0))(
  ( (tuple2!14073 (_1!7047 (_ BitVec 64)) (_2!7047 V!34027)) )
))
(declare-datatypes ((List!19918 0))(
  ( (Nil!19915) (Cons!19914 (h!21076 tuple2!14072) (t!28281 List!19918)) )
))
(declare-datatypes ((ListLongMap!12769 0))(
  ( (ListLongMap!12770 (toList!6400 List!19918)) )
))
(declare-fun contains!5501 (ListLongMap!12769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3633 (array!59651 array!59649 (_ BitVec 32) (_ BitVec 32) V!34027 V!34027 (_ BitVec 32) Int) ListLongMap!12769)

(assert (=> b!966487 (= lt!431338 (contains!5501 (getCurrentListMap!3633 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28694 _keys!1686) i!803)))))

(assert (= (and start!82848 res!646931) b!966480))

(assert (= (and b!966480 res!646928) b!966479))

(assert (= (and b!966479 res!646929) b!966485))

(assert (= (and b!966485 res!646933) b!966483))

(assert (= (and b!966483 res!646930) b!966481))

(assert (= (and b!966481 res!646932) b!966487))

(assert (= (and b!966484 condMapEmpty!34669) mapIsEmpty!34669))

(assert (= (and b!966484 (not condMapEmpty!34669)) mapNonEmpty!34669))

(get-info :version)

(assert (= (and mapNonEmpty!34669 ((_ is ValueCellFull!10410) mapValue!34669)) b!966482))

(assert (= (and b!966484 ((_ is ValueCellFull!10410) mapDefault!34669)) b!966486))

(assert (= start!82848 b!966484))

(declare-fun m!895259 () Bool)

(assert (=> b!966479 m!895259))

(declare-fun m!895261 () Bool)

(assert (=> b!966485 m!895261))

(declare-fun m!895263 () Bool)

(assert (=> mapNonEmpty!34669 m!895263))

(declare-fun m!895265 () Bool)

(assert (=> start!82848 m!895265))

(declare-fun m!895267 () Bool)

(assert (=> start!82848 m!895267))

(declare-fun m!895269 () Bool)

(assert (=> start!82848 m!895269))

(declare-fun m!895271 () Bool)

(assert (=> b!966481 m!895271))

(assert (=> b!966481 m!895271))

(declare-fun m!895273 () Bool)

(assert (=> b!966481 m!895273))

(declare-fun m!895275 () Bool)

(assert (=> b!966487 m!895275))

(assert (=> b!966487 m!895271))

(assert (=> b!966487 m!895275))

(assert (=> b!966487 m!895271))

(declare-fun m!895277 () Bool)

(assert (=> b!966487 m!895277))

(check-sat (not b!966481) (not b_next!18975) tp_is_empty!21783 (not start!82848) (not mapNonEmpty!34669) (not b!966485) b_and!30463 (not b!966487) (not b!966479))
(check-sat b_and!30463 (not b_next!18975))
