; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82846 () Bool)

(assert start!82846)

(declare-fun b_free!18991 () Bool)

(declare-fun b_next!18991 () Bool)

(assert (=> start!82846 (= b_free!18991 (not b_next!18991))))

(declare-fun tp!66102 () Bool)

(declare-fun b_and!30453 () Bool)

(assert (=> start!82846 (= tp!66102 b_and!30453)))

(declare-fun b!966465 () Bool)

(declare-fun res!646976 () Bool)

(declare-fun e!544798 () Bool)

(assert (=> b!966465 (=> (not res!646976) (not e!544798))))

(declare-datatypes ((array!59606 0))(
  ( (array!59607 (arr!28672 (Array (_ BitVec 32) (_ BitVec 64))) (size!29153 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59606)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966465 (= res!646976 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29153 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29153 _keys!1686))))))

(declare-fun b!966466 () Bool)

(declare-fun res!646971 () Bool)

(assert (=> b!966466 (=> (not res!646971) (not e!544798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966466 (= res!646971 (validKeyInArray!0 (select (arr!28672 _keys!1686) i!803)))))

(declare-fun b!966467 () Bool)

(assert (=> b!966467 (= e!544798 false)))

(declare-fun lt!431117 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34049 0))(
  ( (V!34050 (val!10950 Int)) )
))
(declare-datatypes ((ValueCell!10418 0))(
  ( (ValueCellFull!10418 (v!13507 V!34049)) (EmptyCell!10418) )
))
(declare-datatypes ((array!59608 0))(
  ( (array!59609 (arr!28673 (Array (_ BitVec 32) ValueCell!10418)) (size!29154 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59608)

(declare-fun minValue!1342 () V!34049)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34049)

(declare-datatypes ((tuple2!14150 0))(
  ( (tuple2!14151 (_1!7086 (_ BitVec 64)) (_2!7086 V!34049)) )
))
(declare-datatypes ((List!19956 0))(
  ( (Nil!19953) (Cons!19952 (h!21114 tuple2!14150) (t!28310 List!19956)) )
))
(declare-datatypes ((ListLongMap!12837 0))(
  ( (ListLongMap!12838 (toList!6434 List!19956)) )
))
(declare-fun contains!5479 (ListLongMap!12837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3596 (array!59606 array!59608 (_ BitVec 32) (_ BitVec 32) V!34049 V!34049 (_ BitVec 32) Int) ListLongMap!12837)

(assert (=> b!966467 (= lt!431117 (contains!5479 (getCurrentListMap!3596 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28672 _keys!1686) i!803)))))

(declare-fun res!646975 () Bool)

(assert (=> start!82846 (=> (not res!646975) (not e!544798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82846 (= res!646975 (validMask!0 mask!2110))))

(assert (=> start!82846 e!544798))

(assert (=> start!82846 true))

(declare-fun e!544797 () Bool)

(declare-fun array_inv!22261 (array!59608) Bool)

(assert (=> start!82846 (and (array_inv!22261 _values!1400) e!544797)))

(declare-fun array_inv!22262 (array!59606) Bool)

(assert (=> start!82846 (array_inv!22262 _keys!1686)))

(assert (=> start!82846 tp!66102))

(declare-fun tp_is_empty!21799 () Bool)

(assert (=> start!82846 tp_is_empty!21799))

(declare-fun b!966468 () Bool)

(declare-fun res!646973 () Bool)

(assert (=> b!966468 (=> (not res!646973) (not e!544798))))

(assert (=> b!966468 (= res!646973 (and (= (size!29154 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29153 _keys!1686) (size!29154 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966469 () Bool)

(declare-fun res!646972 () Bool)

(assert (=> b!966469 (=> (not res!646972) (not e!544798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59606 (_ BitVec 32)) Bool)

(assert (=> b!966469 (= res!646972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966470 () Bool)

(declare-fun e!544796 () Bool)

(assert (=> b!966470 (= e!544796 tp_is_empty!21799)))

(declare-fun b!966471 () Bool)

(declare-fun res!646974 () Bool)

(assert (=> b!966471 (=> (not res!646974) (not e!544798))))

(declare-datatypes ((List!19957 0))(
  ( (Nil!19954) (Cons!19953 (h!21115 (_ BitVec 64)) (t!28311 List!19957)) )
))
(declare-fun arrayNoDuplicates!0 (array!59606 (_ BitVec 32) List!19957) Bool)

(assert (=> b!966471 (= res!646974 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19954))))

(declare-fun b!966472 () Bool)

(declare-fun mapRes!34693 () Bool)

(assert (=> b!966472 (= e!544797 (and e!544796 mapRes!34693))))

(declare-fun condMapEmpty!34693 () Bool)

(declare-fun mapDefault!34693 () ValueCell!10418)

(assert (=> b!966472 (= condMapEmpty!34693 (= (arr!28673 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10418)) mapDefault!34693)))))

(declare-fun mapIsEmpty!34693 () Bool)

(assert (=> mapIsEmpty!34693 mapRes!34693))

(declare-fun mapNonEmpty!34693 () Bool)

(declare-fun tp!66103 () Bool)

(declare-fun e!544794 () Bool)

(assert (=> mapNonEmpty!34693 (= mapRes!34693 (and tp!66103 e!544794))))

(declare-fun mapRest!34693 () (Array (_ BitVec 32) ValueCell!10418))

(declare-fun mapValue!34693 () ValueCell!10418)

(declare-fun mapKey!34693 () (_ BitVec 32))

(assert (=> mapNonEmpty!34693 (= (arr!28673 _values!1400) (store mapRest!34693 mapKey!34693 mapValue!34693))))

(declare-fun b!966473 () Bool)

(assert (=> b!966473 (= e!544794 tp_is_empty!21799)))

(assert (= (and start!82846 res!646975) b!966468))

(assert (= (and b!966468 res!646973) b!966469))

(assert (= (and b!966469 res!646972) b!966471))

(assert (= (and b!966471 res!646974) b!966465))

(assert (= (and b!966465 res!646976) b!966466))

(assert (= (and b!966466 res!646971) b!966467))

(assert (= (and b!966472 condMapEmpty!34693) mapIsEmpty!34693))

(assert (= (and b!966472 (not condMapEmpty!34693)) mapNonEmpty!34693))

(get-info :version)

(assert (= (and mapNonEmpty!34693 ((_ is ValueCellFull!10418) mapValue!34693)) b!966473))

(assert (= (and b!966472 ((_ is ValueCellFull!10418) mapDefault!34693)) b!966470))

(assert (= start!82846 b!966472))

(declare-fun m!894661 () Bool)

(assert (=> b!966471 m!894661))

(declare-fun m!894663 () Bool)

(assert (=> b!966469 m!894663))

(declare-fun m!894665 () Bool)

(assert (=> b!966467 m!894665))

(declare-fun m!894667 () Bool)

(assert (=> b!966467 m!894667))

(assert (=> b!966467 m!894665))

(assert (=> b!966467 m!894667))

(declare-fun m!894669 () Bool)

(assert (=> b!966467 m!894669))

(declare-fun m!894671 () Bool)

(assert (=> mapNonEmpty!34693 m!894671))

(declare-fun m!894673 () Bool)

(assert (=> start!82846 m!894673))

(declare-fun m!894675 () Bool)

(assert (=> start!82846 m!894675))

(declare-fun m!894677 () Bool)

(assert (=> start!82846 m!894677))

(assert (=> b!966466 m!894667))

(assert (=> b!966466 m!894667))

(declare-fun m!894679 () Bool)

(assert (=> b!966466 m!894679))

(check-sat (not b!966466) tp_is_empty!21799 (not b!966471) (not mapNonEmpty!34693) b_and!30453 (not b!966467) (not b_next!18991) (not b!966469) (not start!82846))
(check-sat b_and!30453 (not b_next!18991))
