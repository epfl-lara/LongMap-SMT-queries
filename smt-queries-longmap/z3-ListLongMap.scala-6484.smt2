; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82746 () Bool)

(assert start!82746)

(declare-fun b_free!18879 () Bool)

(declare-fun b_next!18879 () Bool)

(assert (=> start!82746 (= b_free!18879 (not b_next!18879))))

(declare-fun tp!65757 () Bool)

(declare-fun b_and!30367 () Bool)

(assert (=> start!82746 (= tp!65757 b_and!30367)))

(declare-fun mapIsEmpty!34516 () Bool)

(declare-fun mapRes!34516 () Bool)

(assert (=> mapIsEmpty!34516 mapRes!34516))

(declare-fun b!965111 () Bool)

(declare-fun res!646024 () Bool)

(declare-fun e!544061 () Bool)

(assert (=> b!965111 (=> (not res!646024) (not e!544061))))

(declare-datatypes ((array!59447 0))(
  ( (array!59448 (arr!28592 (Array (_ BitVec 32) (_ BitVec 64))) (size!29071 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59447)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965111 (= res!646024 (validKeyInArray!0 (select (arr!28592 _keys!1686) i!803)))))

(declare-fun b!965112 () Bool)

(declare-fun res!646022 () Bool)

(assert (=> b!965112 (=> (not res!646022) (not e!544061))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33891 0))(
  ( (V!33892 (val!10891 Int)) )
))
(declare-datatypes ((ValueCell!10359 0))(
  ( (ValueCellFull!10359 (v!13449 V!33891)) (EmptyCell!10359) )
))
(declare-datatypes ((array!59449 0))(
  ( (array!59450 (arr!28593 (Array (_ BitVec 32) ValueCell!10359)) (size!29072 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59449)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965112 (= res!646022 (and (= (size!29072 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29071 _keys!1686) (size!29072 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965113 () Bool)

(declare-fun res!646020 () Bool)

(assert (=> b!965113 (=> (not res!646020) (not e!544061))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965113 (= res!646020 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29071 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29071 _keys!1686))))))

(declare-fun mapNonEmpty!34516 () Bool)

(declare-fun tp!65756 () Bool)

(declare-fun e!544059 () Bool)

(assert (=> mapNonEmpty!34516 (= mapRes!34516 (and tp!65756 e!544059))))

(declare-fun mapRest!34516 () (Array (_ BitVec 32) ValueCell!10359))

(declare-fun mapValue!34516 () ValueCell!10359)

(declare-fun mapKey!34516 () (_ BitVec 32))

(assert (=> mapNonEmpty!34516 (= (arr!28593 _values!1400) (store mapRest!34516 mapKey!34516 mapValue!34516))))

(declare-fun b!965114 () Bool)

(declare-fun res!646021 () Bool)

(assert (=> b!965114 (=> (not res!646021) (not e!544061))))

(declare-datatypes ((List!19844 0))(
  ( (Nil!19841) (Cons!19840 (h!21002 (_ BitVec 64)) (t!28207 List!19844)) )
))
(declare-fun arrayNoDuplicates!0 (array!59447 (_ BitVec 32) List!19844) Bool)

(assert (=> b!965114 (= res!646021 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19841))))

(declare-fun b!965115 () Bool)

(declare-fun e!544060 () Bool)

(declare-fun e!544057 () Bool)

(assert (=> b!965115 (= e!544060 (and e!544057 mapRes!34516))))

(declare-fun condMapEmpty!34516 () Bool)

(declare-fun mapDefault!34516 () ValueCell!10359)

(assert (=> b!965115 (= condMapEmpty!34516 (= (arr!28593 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10359)) mapDefault!34516)))))

(declare-fun res!646023 () Bool)

(assert (=> start!82746 (=> (not res!646023) (not e!544061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82746 (= res!646023 (validMask!0 mask!2110))))

(assert (=> start!82746 e!544061))

(assert (=> start!82746 true))

(declare-fun array_inv!22141 (array!59449) Bool)

(assert (=> start!82746 (and (array_inv!22141 _values!1400) e!544060)))

(declare-fun array_inv!22142 (array!59447) Bool)

(assert (=> start!82746 (array_inv!22142 _keys!1686)))

(assert (=> start!82746 tp!65757))

(declare-fun tp_is_empty!21681 () Bool)

(assert (=> start!82746 tp_is_empty!21681))

(declare-fun b!965116 () Bool)

(assert (=> b!965116 (= e!544061 false)))

(declare-fun minValue!1342 () V!33891)

(declare-fun lt!431203 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33891)

(declare-datatypes ((tuple2!14000 0))(
  ( (tuple2!14001 (_1!7011 (_ BitVec 64)) (_2!7011 V!33891)) )
))
(declare-datatypes ((List!19845 0))(
  ( (Nil!19842) (Cons!19841 (h!21003 tuple2!14000) (t!28208 List!19845)) )
))
(declare-datatypes ((ListLongMap!12697 0))(
  ( (ListLongMap!12698 (toList!6364 List!19845)) )
))
(declare-fun contains!5467 (ListLongMap!12697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3597 (array!59447 array!59449 (_ BitVec 32) (_ BitVec 32) V!33891 V!33891 (_ BitVec 32) Int) ListLongMap!12697)

(assert (=> b!965116 (= lt!431203 (contains!5467 (getCurrentListMap!3597 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28592 _keys!1686) i!803)))))

(declare-fun b!965117 () Bool)

(declare-fun res!646019 () Bool)

(assert (=> b!965117 (=> (not res!646019) (not e!544061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59447 (_ BitVec 32)) Bool)

(assert (=> b!965117 (= res!646019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965118 () Bool)

(assert (=> b!965118 (= e!544057 tp_is_empty!21681)))

(declare-fun b!965119 () Bool)

(assert (=> b!965119 (= e!544059 tp_is_empty!21681)))

(assert (= (and start!82746 res!646023) b!965112))

(assert (= (and b!965112 res!646022) b!965117))

(assert (= (and b!965117 res!646019) b!965114))

(assert (= (and b!965114 res!646021) b!965113))

(assert (= (and b!965113 res!646020) b!965111))

(assert (= (and b!965111 res!646024) b!965116))

(assert (= (and b!965115 condMapEmpty!34516) mapIsEmpty!34516))

(assert (= (and b!965115 (not condMapEmpty!34516)) mapNonEmpty!34516))

(get-info :version)

(assert (= (and mapNonEmpty!34516 ((_ is ValueCellFull!10359) mapValue!34516)) b!965119))

(assert (= (and b!965115 ((_ is ValueCellFull!10359) mapDefault!34516)) b!965118))

(assert (= start!82746 b!965115))

(declare-fun m!894269 () Bool)

(assert (=> start!82746 m!894269))

(declare-fun m!894271 () Bool)

(assert (=> start!82746 m!894271))

(declare-fun m!894273 () Bool)

(assert (=> start!82746 m!894273))

(declare-fun m!894275 () Bool)

(assert (=> b!965114 m!894275))

(declare-fun m!894277 () Bool)

(assert (=> b!965117 m!894277))

(declare-fun m!894279 () Bool)

(assert (=> mapNonEmpty!34516 m!894279))

(declare-fun m!894281 () Bool)

(assert (=> b!965111 m!894281))

(assert (=> b!965111 m!894281))

(declare-fun m!894283 () Bool)

(assert (=> b!965111 m!894283))

(declare-fun m!894285 () Bool)

(assert (=> b!965116 m!894285))

(assert (=> b!965116 m!894281))

(assert (=> b!965116 m!894285))

(assert (=> b!965116 m!894281))

(declare-fun m!894287 () Bool)

(assert (=> b!965116 m!894287))

(check-sat (not b!965114) (not b!965116) (not b!965111) tp_is_empty!21681 (not mapNonEmpty!34516) (not start!82746) (not b!965117) b_and!30367 (not b_next!18879))
(check-sat b_and!30367 (not b_next!18879))
