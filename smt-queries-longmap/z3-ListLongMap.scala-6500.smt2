; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82822 () Bool)

(assert start!82822)

(declare-fun b_free!18967 () Bool)

(declare-fun b_next!18967 () Bool)

(assert (=> start!82822 (= b_free!18967 (not b_next!18967))))

(declare-fun tp!66031 () Bool)

(declare-fun b_and!30429 () Bool)

(assert (=> start!82822 (= tp!66031 b_and!30429)))

(declare-fun b!966132 () Bool)

(declare-fun res!646746 () Bool)

(declare-fun e!544618 () Bool)

(assert (=> b!966132 (=> (not res!646746) (not e!544618))))

(declare-datatypes ((array!59562 0))(
  ( (array!59563 (arr!28650 (Array (_ BitVec 32) (_ BitVec 64))) (size!29131 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59562)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59562 (_ BitVec 32)) Bool)

(assert (=> b!966132 (= res!646746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966133 () Bool)

(declare-fun e!544617 () Bool)

(declare-fun e!544616 () Bool)

(declare-fun mapRes!34657 () Bool)

(assert (=> b!966133 (= e!544617 (and e!544616 mapRes!34657))))

(declare-fun condMapEmpty!34657 () Bool)

(declare-datatypes ((V!34017 0))(
  ( (V!34018 (val!10938 Int)) )
))
(declare-datatypes ((ValueCell!10406 0))(
  ( (ValueCellFull!10406 (v!13495 V!34017)) (EmptyCell!10406) )
))
(declare-datatypes ((array!59564 0))(
  ( (array!59565 (arr!28651 (Array (_ BitVec 32) ValueCell!10406)) (size!29132 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59564)

(declare-fun mapDefault!34657 () ValueCell!10406)

(assert (=> b!966133 (= condMapEmpty!34657 (= (arr!28651 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10406)) mapDefault!34657)))))

(declare-fun b!966134 () Bool)

(declare-fun tp_is_empty!21775 () Bool)

(assert (=> b!966134 (= e!544616 tp_is_empty!21775)))

(declare-fun b!966135 () Bool)

(declare-fun res!646750 () Bool)

(assert (=> b!966135 (=> (not res!646750) (not e!544618))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966135 (= res!646750 (and (= (size!29132 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29131 _keys!1686) (size!29132 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966136 () Bool)

(declare-fun res!646747 () Bool)

(assert (=> b!966136 (=> (not res!646747) (not e!544618))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966136 (= res!646747 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29131 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29131 _keys!1686))))))

(declare-fun res!646751 () Bool)

(assert (=> start!82822 (=> (not res!646751) (not e!544618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82822 (= res!646751 (validMask!0 mask!2110))))

(assert (=> start!82822 e!544618))

(assert (=> start!82822 true))

(declare-fun array_inv!22245 (array!59564) Bool)

(assert (=> start!82822 (and (array_inv!22245 _values!1400) e!544617)))

(declare-fun array_inv!22246 (array!59562) Bool)

(assert (=> start!82822 (array_inv!22246 _keys!1686)))

(assert (=> start!82822 tp!66031))

(assert (=> start!82822 tp_is_empty!21775))

(declare-fun mapIsEmpty!34657 () Bool)

(assert (=> mapIsEmpty!34657 mapRes!34657))

(declare-fun mapNonEmpty!34657 () Bool)

(declare-fun tp!66030 () Bool)

(declare-fun e!544614 () Bool)

(assert (=> mapNonEmpty!34657 (= mapRes!34657 (and tp!66030 e!544614))))

(declare-fun mapValue!34657 () ValueCell!10406)

(declare-fun mapRest!34657 () (Array (_ BitVec 32) ValueCell!10406))

(declare-fun mapKey!34657 () (_ BitVec 32))

(assert (=> mapNonEmpty!34657 (= (arr!28651 _values!1400) (store mapRest!34657 mapKey!34657 mapValue!34657))))

(declare-fun b!966137 () Bool)

(declare-fun res!646748 () Bool)

(assert (=> b!966137 (=> (not res!646748) (not e!544618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966137 (= res!646748 (validKeyInArray!0 (select (arr!28650 _keys!1686) i!803)))))

(declare-fun b!966138 () Bool)

(assert (=> b!966138 (= e!544614 tp_is_empty!21775)))

(declare-fun b!966139 () Bool)

(assert (=> b!966139 (= e!544618 false)))

(declare-fun minValue!1342 () V!34017)

(declare-fun lt!431090 () Bool)

(declare-fun zeroValue!1342 () V!34017)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14138 0))(
  ( (tuple2!14139 (_1!7080 (_ BitVec 64)) (_2!7080 V!34017)) )
))
(declare-datatypes ((List!19943 0))(
  ( (Nil!19940) (Cons!19939 (h!21101 tuple2!14138) (t!28297 List!19943)) )
))
(declare-datatypes ((ListLongMap!12825 0))(
  ( (ListLongMap!12826 (toList!6428 List!19943)) )
))
(declare-fun contains!5473 (ListLongMap!12825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3590 (array!59562 array!59564 (_ BitVec 32) (_ BitVec 32) V!34017 V!34017 (_ BitVec 32) Int) ListLongMap!12825)

(assert (=> b!966139 (= lt!431090 (contains!5473 (getCurrentListMap!3590 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28650 _keys!1686) i!803)))))

(declare-fun b!966140 () Bool)

(declare-fun res!646749 () Bool)

(assert (=> b!966140 (=> (not res!646749) (not e!544618))))

(declare-datatypes ((List!19944 0))(
  ( (Nil!19941) (Cons!19940 (h!21102 (_ BitVec 64)) (t!28298 List!19944)) )
))
(declare-fun arrayNoDuplicates!0 (array!59562 (_ BitVec 32) List!19944) Bool)

(assert (=> b!966140 (= res!646749 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19941))))

(assert (= (and start!82822 res!646751) b!966135))

(assert (= (and b!966135 res!646750) b!966132))

(assert (= (and b!966132 res!646746) b!966140))

(assert (= (and b!966140 res!646749) b!966136))

(assert (= (and b!966136 res!646747) b!966137))

(assert (= (and b!966137 res!646748) b!966139))

(assert (= (and b!966133 condMapEmpty!34657) mapIsEmpty!34657))

(assert (= (and b!966133 (not condMapEmpty!34657)) mapNonEmpty!34657))

(get-info :version)

(assert (= (and mapNonEmpty!34657 ((_ is ValueCellFull!10406) mapValue!34657)) b!966138))

(assert (= (and b!966133 ((_ is ValueCellFull!10406) mapDefault!34657)) b!966134))

(assert (= start!82822 b!966133))

(declare-fun m!894421 () Bool)

(assert (=> b!966137 m!894421))

(assert (=> b!966137 m!894421))

(declare-fun m!894423 () Bool)

(assert (=> b!966137 m!894423))

(declare-fun m!894425 () Bool)

(assert (=> b!966139 m!894425))

(assert (=> b!966139 m!894421))

(assert (=> b!966139 m!894425))

(assert (=> b!966139 m!894421))

(declare-fun m!894427 () Bool)

(assert (=> b!966139 m!894427))

(declare-fun m!894429 () Bool)

(assert (=> b!966132 m!894429))

(declare-fun m!894431 () Bool)

(assert (=> mapNonEmpty!34657 m!894431))

(declare-fun m!894433 () Bool)

(assert (=> start!82822 m!894433))

(declare-fun m!894435 () Bool)

(assert (=> start!82822 m!894435))

(declare-fun m!894437 () Bool)

(assert (=> start!82822 m!894437))

(declare-fun m!894439 () Bool)

(assert (=> b!966140 m!894439))

(check-sat tp_is_empty!21775 (not b!966139) (not b!966132) (not start!82822) (not b_next!18967) (not b!966137) (not mapNonEmpty!34657) (not b!966140) b_and!30429)
(check-sat b_and!30429 (not b_next!18967))
