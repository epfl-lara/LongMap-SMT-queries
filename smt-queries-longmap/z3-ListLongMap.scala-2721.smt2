; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40130 () Bool)

(assert start!40130)

(declare-fun b_free!10411 () Bool)

(declare-fun b_next!10411 () Bool)

(assert (=> start!40130 (= b_free!10411 (not b_next!10411))))

(declare-fun tp!36762 () Bool)

(declare-fun b_and!18353 () Bool)

(assert (=> start!40130 (= tp!36762 b_and!18353)))

(declare-fun b!438949 () Bool)

(declare-fun res!259380 () Bool)

(declare-fun e!258788 () Bool)

(assert (=> b!438949 (=> (not res!259380) (not e!258788))))

(declare-datatypes ((array!26945 0))(
  ( (array!26946 (arr!12922 (Array (_ BitVec 32) (_ BitVec 64))) (size!13275 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26945)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438949 (= res!259380 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438950 () Bool)

(declare-fun res!259379 () Bool)

(declare-fun e!258787 () Bool)

(assert (=> b!438950 (=> (not res!259379) (not e!258787))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438950 (= res!259379 (bvsle from!863 i!563))))

(declare-fun b!438951 () Bool)

(declare-fun res!259386 () Bool)

(assert (=> b!438951 (=> (not res!259386) (not e!258788))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26945 (_ BitVec 32)) Bool)

(assert (=> b!438951 (= res!259386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438952 () Bool)

(declare-fun e!258783 () Bool)

(declare-fun tp_is_empty!11563 () Bool)

(assert (=> b!438952 (= e!258783 tp_is_empty!11563)))

(declare-fun b!438953 () Bool)

(declare-fun e!258784 () Bool)

(assert (=> b!438953 (= e!258787 e!258784)))

(declare-fun res!259388 () Bool)

(assert (=> b!438953 (=> (not res!259388) (not e!258784))))

(assert (=> b!438953 (= res!259388 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16523 0))(
  ( (V!16524 (val!5826 Int)) )
))
(declare-fun minValue!515 () V!16523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16523)

(declare-datatypes ((tuple2!7754 0))(
  ( (tuple2!7755 (_1!3888 (_ BitVec 64)) (_2!3888 V!16523)) )
))
(declare-datatypes ((List!7741 0))(
  ( (Nil!7738) (Cons!7737 (h!8593 tuple2!7754) (t!13488 List!7741)) )
))
(declare-datatypes ((ListLongMap!6657 0))(
  ( (ListLongMap!6658 (toList!3344 List!7741)) )
))
(declare-fun lt!201970 () ListLongMap!6657)

(declare-datatypes ((ValueCell!5438 0))(
  ( (ValueCellFull!5438 (v!8067 V!16523)) (EmptyCell!5438) )
))
(declare-datatypes ((array!26947 0))(
  ( (array!26948 (arr!12923 (Array (_ BitVec 32) ValueCell!5438)) (size!13276 (_ BitVec 32))) )
))
(declare-fun lt!201968 () array!26947)

(declare-fun lt!201969 () array!26945)

(declare-fun getCurrentListMapNoExtraKeys!1543 (array!26945 array!26947 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) Int) ListLongMap!6657)

(assert (=> b!438953 (= lt!201970 (getCurrentListMapNoExtraKeys!1543 lt!201969 lt!201968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16523)

(declare-fun _values!549 () array!26947)

(assert (=> b!438953 (= lt!201968 (array!26948 (store (arr!12923 _values!549) i!563 (ValueCellFull!5438 v!412)) (size!13276 _values!549)))))

(declare-fun lt!201967 () ListLongMap!6657)

(assert (=> b!438953 (= lt!201967 (getCurrentListMapNoExtraKeys!1543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438954 () Bool)

(declare-fun e!258789 () Bool)

(assert (=> b!438954 (= e!258789 tp_is_empty!11563)))

(declare-fun b!438955 () Bool)

(declare-fun res!259387 () Bool)

(assert (=> b!438955 (=> (not res!259387) (not e!258788))))

(assert (=> b!438955 (= res!259387 (or (= (select (arr!12922 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12922 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18966 () Bool)

(declare-fun mapRes!18966 () Bool)

(declare-fun tp!36761 () Bool)

(assert (=> mapNonEmpty!18966 (= mapRes!18966 (and tp!36761 e!258783))))

(declare-fun mapRest!18966 () (Array (_ BitVec 32) ValueCell!5438))

(declare-fun mapKey!18966 () (_ BitVec 32))

(declare-fun mapValue!18966 () ValueCell!5438)

(assert (=> mapNonEmpty!18966 (= (arr!12923 _values!549) (store mapRest!18966 mapKey!18966 mapValue!18966))))

(declare-fun res!259382 () Bool)

(assert (=> start!40130 (=> (not res!259382) (not e!258788))))

(assert (=> start!40130 (= res!259382 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13275 _keys!709))))))

(assert (=> start!40130 e!258788))

(assert (=> start!40130 tp_is_empty!11563))

(assert (=> start!40130 tp!36762))

(assert (=> start!40130 true))

(declare-fun e!258785 () Bool)

(declare-fun array_inv!9428 (array!26947) Bool)

(assert (=> start!40130 (and (array_inv!9428 _values!549) e!258785)))

(declare-fun array_inv!9429 (array!26945) Bool)

(assert (=> start!40130 (array_inv!9429 _keys!709)))

(declare-fun b!438956 () Bool)

(declare-fun res!259377 () Bool)

(assert (=> b!438956 (=> (not res!259377) (not e!258788))))

(declare-datatypes ((List!7742 0))(
  ( (Nil!7739) (Cons!7738 (h!8594 (_ BitVec 64)) (t!13489 List!7742)) )
))
(declare-fun arrayNoDuplicates!0 (array!26945 (_ BitVec 32) List!7742) Bool)

(assert (=> b!438956 (= res!259377 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7739))))

(declare-fun b!438957 () Bool)

(declare-fun res!259381 () Bool)

(assert (=> b!438957 (=> (not res!259381) (not e!258788))))

(assert (=> b!438957 (= res!259381 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13275 _keys!709))))))

(declare-fun b!438958 () Bool)

(declare-fun res!259383 () Bool)

(assert (=> b!438958 (=> (not res!259383) (not e!258788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438958 (= res!259383 (validMask!0 mask!1025))))

(declare-fun b!438959 () Bool)

(assert (=> b!438959 (= e!258784 (not true))))

(declare-fun +!1508 (ListLongMap!6657 tuple2!7754) ListLongMap!6657)

(assert (=> b!438959 (= (getCurrentListMapNoExtraKeys!1543 lt!201969 lt!201968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1508 (getCurrentListMapNoExtraKeys!1543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7755 k0!794 v!412)))))

(declare-datatypes ((Unit!13033 0))(
  ( (Unit!13034) )
))
(declare-fun lt!201971 () Unit!13033)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 (array!26945 array!26947 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) (_ BitVec 64) V!16523 (_ BitVec 32) Int) Unit!13033)

(assert (=> b!438959 (= lt!201971 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438960 () Bool)

(declare-fun res!259378 () Bool)

(assert (=> b!438960 (=> (not res!259378) (not e!258787))))

(assert (=> b!438960 (= res!259378 (arrayNoDuplicates!0 lt!201969 #b00000000000000000000000000000000 Nil!7739))))

(declare-fun mapIsEmpty!18966 () Bool)

(assert (=> mapIsEmpty!18966 mapRes!18966))

(declare-fun b!438961 () Bool)

(assert (=> b!438961 (= e!258785 (and e!258789 mapRes!18966))))

(declare-fun condMapEmpty!18966 () Bool)

(declare-fun mapDefault!18966 () ValueCell!5438)

(assert (=> b!438961 (= condMapEmpty!18966 (= (arr!12923 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5438)) mapDefault!18966)))))

(declare-fun b!438962 () Bool)

(assert (=> b!438962 (= e!258788 e!258787)))

(declare-fun res!259384 () Bool)

(assert (=> b!438962 (=> (not res!259384) (not e!258787))))

(assert (=> b!438962 (= res!259384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201969 mask!1025))))

(assert (=> b!438962 (= lt!201969 (array!26946 (store (arr!12922 _keys!709) i!563 k0!794) (size!13275 _keys!709)))))

(declare-fun b!438963 () Bool)

(declare-fun res!259385 () Bool)

(assert (=> b!438963 (=> (not res!259385) (not e!258788))))

(assert (=> b!438963 (= res!259385 (and (= (size!13276 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13275 _keys!709) (size!13276 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438964 () Bool)

(declare-fun res!259389 () Bool)

(assert (=> b!438964 (=> (not res!259389) (not e!258788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438964 (= res!259389 (validKeyInArray!0 k0!794))))

(assert (= (and start!40130 res!259382) b!438958))

(assert (= (and b!438958 res!259383) b!438963))

(assert (= (and b!438963 res!259385) b!438951))

(assert (= (and b!438951 res!259386) b!438956))

(assert (= (and b!438956 res!259377) b!438957))

(assert (= (and b!438957 res!259381) b!438964))

(assert (= (and b!438964 res!259389) b!438955))

(assert (= (and b!438955 res!259387) b!438949))

(assert (= (and b!438949 res!259380) b!438962))

(assert (= (and b!438962 res!259384) b!438960))

(assert (= (and b!438960 res!259378) b!438950))

(assert (= (and b!438950 res!259379) b!438953))

(assert (= (and b!438953 res!259388) b!438959))

(assert (= (and b!438961 condMapEmpty!18966) mapIsEmpty!18966))

(assert (= (and b!438961 (not condMapEmpty!18966)) mapNonEmpty!18966))

(get-info :version)

(assert (= (and mapNonEmpty!18966 ((_ is ValueCellFull!5438) mapValue!18966)) b!438952))

(assert (= (and b!438961 ((_ is ValueCellFull!5438) mapDefault!18966)) b!438954))

(assert (= start!40130 b!438961))

(declare-fun m!425787 () Bool)

(assert (=> start!40130 m!425787))

(declare-fun m!425789 () Bool)

(assert (=> start!40130 m!425789))

(declare-fun m!425791 () Bool)

(assert (=> b!438953 m!425791))

(declare-fun m!425793 () Bool)

(assert (=> b!438953 m!425793))

(declare-fun m!425795 () Bool)

(assert (=> b!438953 m!425795))

(declare-fun m!425797 () Bool)

(assert (=> b!438958 m!425797))

(declare-fun m!425799 () Bool)

(assert (=> b!438956 m!425799))

(declare-fun m!425801 () Bool)

(assert (=> b!438959 m!425801))

(declare-fun m!425803 () Bool)

(assert (=> b!438959 m!425803))

(assert (=> b!438959 m!425803))

(declare-fun m!425805 () Bool)

(assert (=> b!438959 m!425805))

(declare-fun m!425807 () Bool)

(assert (=> b!438959 m!425807))

(declare-fun m!425809 () Bool)

(assert (=> b!438949 m!425809))

(declare-fun m!425811 () Bool)

(assert (=> b!438960 m!425811))

(declare-fun m!425813 () Bool)

(assert (=> b!438964 m!425813))

(declare-fun m!425815 () Bool)

(assert (=> b!438951 m!425815))

(declare-fun m!425817 () Bool)

(assert (=> b!438962 m!425817))

(declare-fun m!425819 () Bool)

(assert (=> b!438962 m!425819))

(declare-fun m!425821 () Bool)

(assert (=> mapNonEmpty!18966 m!425821))

(declare-fun m!425823 () Bool)

(assert (=> b!438955 m!425823))

(check-sat (not b!438962) (not b!438964) (not b!438951) (not b!438960) (not b!438959) b_and!18353 (not b!438956) (not b_next!10411) tp_is_empty!11563 (not mapNonEmpty!18966) (not start!40130) (not b!438953) (not b!438949) (not b!438958))
(check-sat b_and!18353 (not b_next!10411))
