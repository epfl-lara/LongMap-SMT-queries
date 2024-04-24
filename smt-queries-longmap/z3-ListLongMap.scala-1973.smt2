; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34686 () Bool)

(assert start!34686)

(declare-fun b_free!7507 () Bool)

(declare-fun b_next!7507 () Bool)

(assert (=> start!34686 (= b_free!7507 (not b_next!7507))))

(declare-fun tp!26084 () Bool)

(declare-fun b_and!14741 () Bool)

(assert (=> start!34686 (= tp!26084 b_and!14741)))

(declare-fun b!346728 () Bool)

(declare-fun e!212488 () Bool)

(declare-fun e!212489 () Bool)

(declare-fun mapRes!12645 () Bool)

(assert (=> b!346728 (= e!212488 (and e!212489 mapRes!12645))))

(declare-fun condMapEmpty!12645 () Bool)

(declare-datatypes ((V!10923 0))(
  ( (V!10924 (val!3774 Int)) )
))
(declare-datatypes ((ValueCell!3386 0))(
  ( (ValueCellFull!3386 (v!5957 V!10923)) (EmptyCell!3386) )
))
(declare-datatypes ((array!18504 0))(
  ( (array!18505 (arr!8762 (Array (_ BitVec 32) ValueCell!3386)) (size!9114 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18504)

(declare-fun mapDefault!12645 () ValueCell!3386)

(assert (=> b!346728 (= condMapEmpty!12645 (= (arr!8762 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3386)) mapDefault!12645)))))

(declare-fun b!346729 () Bool)

(declare-fun tp_is_empty!7459 () Bool)

(assert (=> b!346729 (= e!212489 tp_is_empty!7459)))

(declare-fun mapNonEmpty!12645 () Bool)

(declare-fun tp!26085 () Bool)

(declare-fun e!212490 () Bool)

(assert (=> mapNonEmpty!12645 (= mapRes!12645 (and tp!26085 e!212490))))

(declare-fun mapKey!12645 () (_ BitVec 32))

(declare-fun mapValue!12645 () ValueCell!3386)

(declare-fun mapRest!12645 () (Array (_ BitVec 32) ValueCell!3386))

(assert (=> mapNonEmpty!12645 (= (arr!8762 _values!1525) (store mapRest!12645 mapKey!12645 mapValue!12645))))

(declare-fun b!346730 () Bool)

(declare-fun res!191849 () Bool)

(declare-fun e!212487 () Bool)

(assert (=> b!346730 (=> (not res!191849) (not e!212487))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18506 0))(
  ( (array!18507 (arr!8763 (Array (_ BitVec 32) (_ BitVec 64))) (size!9115 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18506)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346730 (= res!191849 (and (= (size!9114 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9115 _keys!1895) (size!9114 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!191855 () Bool)

(assert (=> start!34686 (=> (not res!191855) (not e!212487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34686 (= res!191855 (validMask!0 mask!2385))))

(assert (=> start!34686 e!212487))

(assert (=> start!34686 true))

(assert (=> start!34686 tp_is_empty!7459))

(assert (=> start!34686 tp!26084))

(declare-fun array_inv!6478 (array!18504) Bool)

(assert (=> start!34686 (and (array_inv!6478 _values!1525) e!212488)))

(declare-fun array_inv!6479 (array!18506) Bool)

(assert (=> start!34686 (array_inv!6479 _keys!1895)))

(declare-fun b!346731 () Bool)

(declare-fun res!191848 () Bool)

(assert (=> b!346731 (=> (not res!191848) (not e!212487))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346731 (= res!191848 (validKeyInArray!0 k0!1348))))

(declare-fun b!346732 () Bool)

(declare-fun e!212491 () Bool)

(assert (=> b!346732 (= e!212491 (not true))))

(declare-fun arrayContainsKey!0 (array!18506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346732 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10731 0))(
  ( (Unit!10732) )
))
(declare-fun lt!163450 () Unit!10731)

(declare-datatypes ((SeekEntryResult!3333 0))(
  ( (MissingZero!3333 (index!15511 (_ BitVec 32))) (Found!3333 (index!15512 (_ BitVec 32))) (Intermediate!3333 (undefined!4145 Bool) (index!15513 (_ BitVec 32)) (x!34496 (_ BitVec 32))) (Undefined!3333) (MissingVacant!3333 (index!15514 (_ BitVec 32))) )
))
(declare-fun lt!163449 () SeekEntryResult!3333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18506 (_ BitVec 64) (_ BitVec 32)) Unit!10731)

(assert (=> b!346732 (= lt!163450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15512 lt!163449)))))

(declare-fun b!346733 () Bool)

(declare-fun res!191851 () Bool)

(assert (=> b!346733 (=> (not res!191851) (not e!212491))))

(assert (=> b!346733 (= res!191851 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15512 lt!163449)))))

(declare-fun b!346734 () Bool)

(declare-fun res!191853 () Bool)

(assert (=> b!346734 (=> (not res!191853) (not e!212487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18506 (_ BitVec 32)) Bool)

(assert (=> b!346734 (= res!191853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346735 () Bool)

(assert (=> b!346735 (= e!212490 tp_is_empty!7459)))

(declare-fun b!346736 () Bool)

(declare-fun res!191852 () Bool)

(assert (=> b!346736 (=> (not res!191852) (not e!212487))))

(declare-datatypes ((List!4984 0))(
  ( (Nil!4981) (Cons!4980 (h!5836 (_ BitVec 64)) (t!10104 List!4984)) )
))
(declare-fun arrayNoDuplicates!0 (array!18506 (_ BitVec 32) List!4984) Bool)

(assert (=> b!346736 (= res!191852 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4981))))

(declare-fun b!346737 () Bool)

(assert (=> b!346737 (= e!212487 e!212491)))

(declare-fun res!191850 () Bool)

(assert (=> b!346737 (=> (not res!191850) (not e!212491))))

(get-info :version)

(assert (=> b!346737 (= res!191850 (and ((_ is Found!3333) lt!163449) (= (select (arr!8763 _keys!1895) (index!15512 lt!163449)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18506 (_ BitVec 32)) SeekEntryResult!3333)

(assert (=> b!346737 (= lt!163449 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346738 () Bool)

(declare-fun res!191854 () Bool)

(assert (=> b!346738 (=> (not res!191854) (not e!212487))))

(declare-fun zeroValue!1467 () V!10923)

(declare-fun minValue!1467 () V!10923)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5378 0))(
  ( (tuple2!5379 (_1!2700 (_ BitVec 64)) (_2!2700 V!10923)) )
))
(declare-datatypes ((List!4985 0))(
  ( (Nil!4982) (Cons!4981 (h!5837 tuple2!5378) (t!10105 List!4985)) )
))
(declare-datatypes ((ListLongMap!4293 0))(
  ( (ListLongMap!4294 (toList!2162 List!4985)) )
))
(declare-fun contains!2245 (ListLongMap!4293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1691 (array!18506 array!18504 (_ BitVec 32) (_ BitVec 32) V!10923 V!10923 (_ BitVec 32) Int) ListLongMap!4293)

(assert (=> b!346738 (= res!191854 (not (contains!2245 (getCurrentListMap!1691 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12645 () Bool)

(assert (=> mapIsEmpty!12645 mapRes!12645))

(assert (= (and start!34686 res!191855) b!346730))

(assert (= (and b!346730 res!191849) b!346734))

(assert (= (and b!346734 res!191853) b!346736))

(assert (= (and b!346736 res!191852) b!346731))

(assert (= (and b!346731 res!191848) b!346738))

(assert (= (and b!346738 res!191854) b!346737))

(assert (= (and b!346737 res!191850) b!346733))

(assert (= (and b!346733 res!191851) b!346732))

(assert (= (and b!346728 condMapEmpty!12645) mapIsEmpty!12645))

(assert (= (and b!346728 (not condMapEmpty!12645)) mapNonEmpty!12645))

(assert (= (and mapNonEmpty!12645 ((_ is ValueCellFull!3386) mapValue!12645)) b!346735))

(assert (= (and b!346728 ((_ is ValueCellFull!3386) mapDefault!12645)) b!346729))

(assert (= start!34686 b!346728))

(declare-fun m!348035 () Bool)

(assert (=> b!346738 m!348035))

(assert (=> b!346738 m!348035))

(declare-fun m!348037 () Bool)

(assert (=> b!346738 m!348037))

(declare-fun m!348039 () Bool)

(assert (=> b!346737 m!348039))

(declare-fun m!348041 () Bool)

(assert (=> b!346737 m!348041))

(declare-fun m!348043 () Bool)

(assert (=> mapNonEmpty!12645 m!348043))

(declare-fun m!348045 () Bool)

(assert (=> b!346731 m!348045))

(declare-fun m!348047 () Bool)

(assert (=> b!346732 m!348047))

(declare-fun m!348049 () Bool)

(assert (=> b!346732 m!348049))

(declare-fun m!348051 () Bool)

(assert (=> b!346734 m!348051))

(declare-fun m!348053 () Bool)

(assert (=> b!346733 m!348053))

(declare-fun m!348055 () Bool)

(assert (=> start!34686 m!348055))

(declare-fun m!348057 () Bool)

(assert (=> start!34686 m!348057))

(declare-fun m!348059 () Bool)

(assert (=> start!34686 m!348059))

(declare-fun m!348061 () Bool)

(assert (=> b!346736 m!348061))

(check-sat (not b!346731) b_and!14741 (not b!346734) (not b!346733) (not b!346736) tp_is_empty!7459 (not mapNonEmpty!12645) (not b!346738) (not b!346737) (not start!34686) (not b!346732) (not b_next!7507))
(check-sat b_and!14741 (not b_next!7507))
