; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40158 () Bool)

(assert start!40158)

(declare-fun b_free!10425 () Bool)

(declare-fun b_next!10425 () Bool)

(assert (=> start!40158 (= b_free!10425 (not b_next!10425))))

(declare-fun tp!36804 () Bool)

(declare-fun b_and!18393 () Bool)

(assert (=> start!40158 (= tp!36804 b_and!18393)))

(declare-fun b!439556 () Bool)

(declare-fun e!259108 () Bool)

(declare-fun tp_is_empty!11577 () Bool)

(assert (=> b!439556 (= e!259108 tp_is_empty!11577)))

(declare-fun b!439557 () Bool)

(declare-fun e!259110 () Bool)

(assert (=> b!439557 (= e!259110 (not true))))

(declare-datatypes ((V!16541 0))(
  ( (V!16542 (val!5833 Int)) )
))
(declare-fun minValue!515 () V!16541)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5445 0))(
  ( (ValueCellFull!5445 (v!8080 V!16541)) (EmptyCell!5445) )
))
(declare-datatypes ((array!26971 0))(
  ( (array!26972 (arr!12935 (Array (_ BitVec 32) ValueCell!5445)) (size!13287 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26971)

(declare-fun zeroValue!515 () V!16541)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202310 () array!26971)

(declare-fun v!412 () V!16541)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26973 0))(
  ( (array!26974 (arr!12936 (Array (_ BitVec 32) (_ BitVec 64))) (size!13288 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26973)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202309 () array!26973)

(declare-datatypes ((tuple2!7746 0))(
  ( (tuple2!7747 (_1!3884 (_ BitVec 64)) (_2!3884 V!16541)) )
))
(declare-datatypes ((List!7743 0))(
  ( (Nil!7740) (Cons!7739 (h!8595 tuple2!7746) (t!13499 List!7743)) )
))
(declare-datatypes ((ListLongMap!6659 0))(
  ( (ListLongMap!6660 (toList!3345 List!7743)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1534 (array!26973 array!26971 (_ BitVec 32) (_ BitVec 32) V!16541 V!16541 (_ BitVec 32) Int) ListLongMap!6659)

(declare-fun +!1485 (ListLongMap!6659 tuple2!7746) ListLongMap!6659)

(assert (=> b!439557 (= (getCurrentListMapNoExtraKeys!1534 lt!202309 lt!202310 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1485 (getCurrentListMapNoExtraKeys!1534 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7747 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13074 0))(
  ( (Unit!13075) )
))
(declare-fun lt!202308 () Unit!13074)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 (array!26973 array!26971 (_ BitVec 32) (_ BitVec 32) V!16541 V!16541 (_ BitVec 32) (_ BitVec 64) V!16541 (_ BitVec 32) Int) Unit!13074)

(assert (=> b!439557 (= lt!202308 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439558 () Bool)

(declare-fun res!259784 () Bool)

(declare-fun e!259105 () Bool)

(assert (=> b!439558 (=> (not res!259784) (not e!259105))))

(assert (=> b!439558 (= res!259784 (and (= (size!13287 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13288 _keys!709) (size!13287 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439559 () Bool)

(declare-fun res!259783 () Bool)

(assert (=> b!439559 (=> (not res!259783) (not e!259105))))

(declare-datatypes ((List!7744 0))(
  ( (Nil!7741) (Cons!7740 (h!8596 (_ BitVec 64)) (t!13500 List!7744)) )
))
(declare-fun arrayNoDuplicates!0 (array!26973 (_ BitVec 32) List!7744) Bool)

(assert (=> b!439559 (= res!259783 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7741))))

(declare-fun b!439560 () Bool)

(declare-fun res!259780 () Bool)

(assert (=> b!439560 (=> (not res!259780) (not e!259105))))

(assert (=> b!439560 (= res!259780 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13288 _keys!709))))))

(declare-fun b!439561 () Bool)

(declare-fun res!259787 () Bool)

(declare-fun e!259107 () Bool)

(assert (=> b!439561 (=> (not res!259787) (not e!259107))))

(assert (=> b!439561 (= res!259787 (bvsle from!863 i!563))))

(declare-fun b!439562 () Bool)

(declare-fun res!259786 () Bool)

(assert (=> b!439562 (=> (not res!259786) (not e!259105))))

(declare-fun arrayContainsKey!0 (array!26973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439562 (= res!259786 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18987 () Bool)

(declare-fun mapRes!18987 () Bool)

(declare-fun tp!36803 () Bool)

(assert (=> mapNonEmpty!18987 (= mapRes!18987 (and tp!36803 e!259108))))

(declare-fun mapRest!18987 () (Array (_ BitVec 32) ValueCell!5445))

(declare-fun mapValue!18987 () ValueCell!5445)

(declare-fun mapKey!18987 () (_ BitVec 32))

(assert (=> mapNonEmpty!18987 (= (arr!12935 _values!549) (store mapRest!18987 mapKey!18987 mapValue!18987))))

(declare-fun res!259779 () Bool)

(assert (=> start!40158 (=> (not res!259779) (not e!259105))))

(assert (=> start!40158 (= res!259779 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13288 _keys!709))))))

(assert (=> start!40158 e!259105))

(assert (=> start!40158 tp_is_empty!11577))

(assert (=> start!40158 tp!36804))

(assert (=> start!40158 true))

(declare-fun e!259109 () Bool)

(declare-fun array_inv!9392 (array!26971) Bool)

(assert (=> start!40158 (and (array_inv!9392 _values!549) e!259109)))

(declare-fun array_inv!9393 (array!26973) Bool)

(assert (=> start!40158 (array_inv!9393 _keys!709)))

(declare-fun b!439563 () Bool)

(declare-fun res!259781 () Bool)

(assert (=> b!439563 (=> (not res!259781) (not e!259105))))

(assert (=> b!439563 (= res!259781 (or (= (select (arr!12936 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12936 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18987 () Bool)

(assert (=> mapIsEmpty!18987 mapRes!18987))

(declare-fun b!439564 () Bool)

(declare-fun e!259104 () Bool)

(assert (=> b!439564 (= e!259109 (and e!259104 mapRes!18987))))

(declare-fun condMapEmpty!18987 () Bool)

(declare-fun mapDefault!18987 () ValueCell!5445)

(assert (=> b!439564 (= condMapEmpty!18987 (= (arr!12935 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5445)) mapDefault!18987)))))

(declare-fun b!439565 () Bool)

(declare-fun res!259791 () Bool)

(assert (=> b!439565 (=> (not res!259791) (not e!259105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26973 (_ BitVec 32)) Bool)

(assert (=> b!439565 (= res!259791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439566 () Bool)

(assert (=> b!439566 (= e!259105 e!259107)))

(declare-fun res!259789 () Bool)

(assert (=> b!439566 (=> (not res!259789) (not e!259107))))

(assert (=> b!439566 (= res!259789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202309 mask!1025))))

(assert (=> b!439566 (= lt!202309 (array!26974 (store (arr!12936 _keys!709) i!563 k0!794) (size!13288 _keys!709)))))

(declare-fun b!439567 () Bool)

(declare-fun res!259788 () Bool)

(assert (=> b!439567 (=> (not res!259788) (not e!259107))))

(assert (=> b!439567 (= res!259788 (arrayNoDuplicates!0 lt!202309 #b00000000000000000000000000000000 Nil!7741))))

(declare-fun b!439568 () Bool)

(assert (=> b!439568 (= e!259107 e!259110)))

(declare-fun res!259785 () Bool)

(assert (=> b!439568 (=> (not res!259785) (not e!259110))))

(assert (=> b!439568 (= res!259785 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202306 () ListLongMap!6659)

(assert (=> b!439568 (= lt!202306 (getCurrentListMapNoExtraKeys!1534 lt!202309 lt!202310 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439568 (= lt!202310 (array!26972 (store (arr!12935 _values!549) i!563 (ValueCellFull!5445 v!412)) (size!13287 _values!549)))))

(declare-fun lt!202307 () ListLongMap!6659)

(assert (=> b!439568 (= lt!202307 (getCurrentListMapNoExtraKeys!1534 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439569 () Bool)

(declare-fun res!259790 () Bool)

(assert (=> b!439569 (=> (not res!259790) (not e!259105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439569 (= res!259790 (validMask!0 mask!1025))))

(declare-fun b!439570 () Bool)

(declare-fun res!259782 () Bool)

(assert (=> b!439570 (=> (not res!259782) (not e!259105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439570 (= res!259782 (validKeyInArray!0 k0!794))))

(declare-fun b!439571 () Bool)

(assert (=> b!439571 (= e!259104 tp_is_empty!11577)))

(assert (= (and start!40158 res!259779) b!439569))

(assert (= (and b!439569 res!259790) b!439558))

(assert (= (and b!439558 res!259784) b!439565))

(assert (= (and b!439565 res!259791) b!439559))

(assert (= (and b!439559 res!259783) b!439560))

(assert (= (and b!439560 res!259780) b!439570))

(assert (= (and b!439570 res!259782) b!439563))

(assert (= (and b!439563 res!259781) b!439562))

(assert (= (and b!439562 res!259786) b!439566))

(assert (= (and b!439566 res!259789) b!439567))

(assert (= (and b!439567 res!259788) b!439561))

(assert (= (and b!439561 res!259787) b!439568))

(assert (= (and b!439568 res!259785) b!439557))

(assert (= (and b!439564 condMapEmpty!18987) mapIsEmpty!18987))

(assert (= (and b!439564 (not condMapEmpty!18987)) mapNonEmpty!18987))

(get-info :version)

(assert (= (and mapNonEmpty!18987 ((_ is ValueCellFull!5445) mapValue!18987)) b!439556))

(assert (= (and b!439564 ((_ is ValueCellFull!5445) mapDefault!18987)) b!439571))

(assert (= start!40158 b!439564))

(declare-fun m!426785 () Bool)

(assert (=> b!439568 m!426785))

(declare-fun m!426787 () Bool)

(assert (=> b!439568 m!426787))

(declare-fun m!426789 () Bool)

(assert (=> b!439568 m!426789))

(declare-fun m!426791 () Bool)

(assert (=> b!439570 m!426791))

(declare-fun m!426793 () Bool)

(assert (=> b!439565 m!426793))

(declare-fun m!426795 () Bool)

(assert (=> b!439569 m!426795))

(declare-fun m!426797 () Bool)

(assert (=> b!439562 m!426797))

(declare-fun m!426799 () Bool)

(assert (=> b!439559 m!426799))

(declare-fun m!426801 () Bool)

(assert (=> mapNonEmpty!18987 m!426801))

(declare-fun m!426803 () Bool)

(assert (=> b!439557 m!426803))

(declare-fun m!426805 () Bool)

(assert (=> b!439557 m!426805))

(assert (=> b!439557 m!426805))

(declare-fun m!426807 () Bool)

(assert (=> b!439557 m!426807))

(declare-fun m!426809 () Bool)

(assert (=> b!439557 m!426809))

(declare-fun m!426811 () Bool)

(assert (=> start!40158 m!426811))

(declare-fun m!426813 () Bool)

(assert (=> start!40158 m!426813))

(declare-fun m!426815 () Bool)

(assert (=> b!439567 m!426815))

(declare-fun m!426817 () Bool)

(assert (=> b!439566 m!426817))

(declare-fun m!426819 () Bool)

(assert (=> b!439566 m!426819))

(declare-fun m!426821 () Bool)

(assert (=> b!439563 m!426821))

(check-sat (not mapNonEmpty!18987) (not b_next!10425) (not b!439568) (not b!439569) b_and!18393 (not b!439570) (not b!439559) (not b!439562) (not b!439567) tp_is_empty!11577 (not start!40158) (not b!439566) (not b!439557) (not b!439565))
(check-sat b_and!18393 (not b_next!10425))
