; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43380 () Bool)

(assert start!43380)

(declare-fun b_free!12207 () Bool)

(declare-fun b_next!12207 () Bool)

(assert (=> start!43380 (= b_free!12207 (not b_next!12207))))

(declare-fun tp!42898 () Bool)

(declare-fun b_and!20963 () Bool)

(assert (=> start!43380 (= tp!42898 b_and!20963)))

(declare-fun b!480627 () Bool)

(declare-fun e!282799 () Bool)

(declare-fun tp_is_empty!13719 () Bool)

(assert (=> b!480627 (= e!282799 tp_is_empty!13719)))

(declare-fun b!480628 () Bool)

(declare-fun e!282801 () Bool)

(declare-fun mapRes!22282 () Bool)

(assert (=> b!480628 (= e!282801 (and e!282799 mapRes!22282))))

(declare-fun condMapEmpty!22282 () Bool)

(declare-datatypes ((V!19363 0))(
  ( (V!19364 (val!6907 Int)) )
))
(declare-datatypes ((ValueCell!6498 0))(
  ( (ValueCellFull!6498 (v!9198 V!19363)) (EmptyCell!6498) )
))
(declare-datatypes ((array!31103 0))(
  ( (array!31104 (arr!14956 (Array (_ BitVec 32) ValueCell!6498)) (size!15314 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31103)

(declare-fun mapDefault!22282 () ValueCell!6498)

(assert (=> b!480628 (= condMapEmpty!22282 (= (arr!14956 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6498)) mapDefault!22282)))))

(declare-fun mapIsEmpty!22282 () Bool)

(assert (=> mapIsEmpty!22282 mapRes!22282))

(declare-fun mapNonEmpty!22282 () Bool)

(declare-fun tp!42897 () Bool)

(declare-fun e!282800 () Bool)

(assert (=> mapNonEmpty!22282 (= mapRes!22282 (and tp!42897 e!282800))))

(declare-fun mapValue!22282 () ValueCell!6498)

(declare-fun mapRest!22282 () (Array (_ BitVec 32) ValueCell!6498))

(declare-fun mapKey!22282 () (_ BitVec 32))

(assert (=> mapNonEmpty!22282 (= (arr!14956 _values!1516) (store mapRest!22282 mapKey!22282 mapValue!22282))))

(declare-fun b!480629 () Bool)

(declare-fun res!286618 () Bool)

(declare-fun e!282798 () Bool)

(assert (=> b!480629 (=> (not res!286618) (not e!282798))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((array!31105 0))(
  ( (array!31106 (arr!14957 (Array (_ BitVec 32) (_ BitVec 64))) (size!15315 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31105)

(assert (=> b!480629 (= res!286618 (and (= (size!15314 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15315 _keys!1874) (size!15314 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480631 () Bool)

(declare-fun e!282796 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480631 (= e!282796 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480632 () Bool)

(declare-fun res!286622 () Bool)

(assert (=> b!480632 (=> (not res!286622) (not e!282798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480632 (= res!286622 (validKeyInArray!0 k0!1332))))

(declare-fun b!480633 () Bool)

(declare-fun res!286621 () Bool)

(assert (=> b!480633 (=> (not res!286621) (not e!282798))))

(declare-datatypes ((List!9141 0))(
  ( (Nil!9138) (Cons!9137 (h!9993 (_ BitVec 64)) (t!15351 List!9141)) )
))
(declare-fun arrayNoDuplicates!0 (array!31105 (_ BitVec 32) List!9141) Bool)

(assert (=> b!480633 (= res!286621 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9138))))

(declare-fun b!480634 () Bool)

(assert (=> b!480634 (= e!282798 (not true))))

(declare-fun lt!218185 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31105 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480634 (= lt!218185 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480634 e!282796))

(declare-fun c!57796 () Bool)

(assert (=> b!480634 (= c!57796 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19363)

(declare-datatypes ((Unit!14094 0))(
  ( (Unit!14095) )
))
(declare-fun lt!218184 () Unit!14094)

(declare-fun zeroValue!1458 () V!19363)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!120 (array!31105 array!31103 (_ BitVec 32) (_ BitVec 32) V!19363 V!19363 (_ BitVec 64) Int) Unit!14094)

(assert (=> b!480634 (= lt!218184 (lemmaKeyInListMapIsInArray!120 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480635 () Bool)

(declare-fun res!286623 () Bool)

(assert (=> b!480635 (=> (not res!286623) (not e!282798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31105 (_ BitVec 32)) Bool)

(assert (=> b!480635 (= res!286623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480630 () Bool)

(assert (=> b!480630 (= e!282800 tp_is_empty!13719)))

(declare-fun res!286619 () Bool)

(assert (=> start!43380 (=> (not res!286619) (not e!282798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43380 (= res!286619 (validMask!0 mask!2352))))

(assert (=> start!43380 e!282798))

(assert (=> start!43380 true))

(assert (=> start!43380 tp_is_empty!13719))

(declare-fun array_inv!10786 (array!31103) Bool)

(assert (=> start!43380 (and (array_inv!10786 _values!1516) e!282801)))

(assert (=> start!43380 tp!42898))

(declare-fun array_inv!10787 (array!31105) Bool)

(assert (=> start!43380 (array_inv!10787 _keys!1874)))

(declare-fun b!480636 () Bool)

(assert (=> b!480636 (= e!282796 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480637 () Bool)

(declare-fun res!286620 () Bool)

(assert (=> b!480637 (=> (not res!286620) (not e!282798))))

(declare-datatypes ((tuple2!9064 0))(
  ( (tuple2!9065 (_1!4543 (_ BitVec 64)) (_2!4543 V!19363)) )
))
(declare-datatypes ((List!9142 0))(
  ( (Nil!9139) (Cons!9138 (h!9994 tuple2!9064) (t!15352 List!9142)) )
))
(declare-datatypes ((ListLongMap!7977 0))(
  ( (ListLongMap!7978 (toList!4004 List!9142)) )
))
(declare-fun contains!2616 (ListLongMap!7977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2323 (array!31105 array!31103 (_ BitVec 32) (_ BitVec 32) V!19363 V!19363 (_ BitVec 32) Int) ListLongMap!7977)

(assert (=> b!480637 (= res!286620 (contains!2616 (getCurrentListMap!2323 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43380 res!286619) b!480629))

(assert (= (and b!480629 res!286618) b!480635))

(assert (= (and b!480635 res!286623) b!480633))

(assert (= (and b!480633 res!286621) b!480637))

(assert (= (and b!480637 res!286620) b!480632))

(assert (= (and b!480632 res!286622) b!480634))

(assert (= (and b!480634 c!57796) b!480631))

(assert (= (and b!480634 (not c!57796)) b!480636))

(assert (= (and b!480628 condMapEmpty!22282) mapIsEmpty!22282))

(assert (= (and b!480628 (not condMapEmpty!22282)) mapNonEmpty!22282))

(get-info :version)

(assert (= (and mapNonEmpty!22282 ((_ is ValueCellFull!6498) mapValue!22282)) b!480630))

(assert (= (and b!480628 ((_ is ValueCellFull!6498) mapDefault!22282)) b!480627))

(assert (= start!43380 b!480628))

(declare-fun m!462227 () Bool)

(assert (=> b!480635 m!462227))

(declare-fun m!462229 () Bool)

(assert (=> b!480637 m!462229))

(assert (=> b!480637 m!462229))

(declare-fun m!462231 () Bool)

(assert (=> b!480637 m!462231))

(declare-fun m!462233 () Bool)

(assert (=> b!480633 m!462233))

(declare-fun m!462235 () Bool)

(assert (=> start!43380 m!462235))

(declare-fun m!462237 () Bool)

(assert (=> start!43380 m!462237))

(declare-fun m!462239 () Bool)

(assert (=> start!43380 m!462239))

(declare-fun m!462241 () Bool)

(assert (=> mapNonEmpty!22282 m!462241))

(declare-fun m!462243 () Bool)

(assert (=> b!480632 m!462243))

(declare-fun m!462245 () Bool)

(assert (=> b!480634 m!462245))

(declare-fun m!462247 () Bool)

(assert (=> b!480634 m!462247))

(declare-fun m!462249 () Bool)

(assert (=> b!480631 m!462249))

(check-sat b_and!20963 (not mapNonEmpty!22282) tp_is_empty!13719 (not b_next!12207) (not b!480631) (not b!480635) (not b!480632) (not b!480637) (not b!480634) (not start!43380) (not b!480633))
(check-sat b_and!20963 (not b_next!12207))
