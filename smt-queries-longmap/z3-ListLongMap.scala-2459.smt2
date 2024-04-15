; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38558 () Bool)

(assert start!38558)

(declare-fun b_free!9109 () Bool)

(declare-fun b_next!9109 () Bool)

(assert (=> start!38558 (= b_free!9109 (not b_next!9109))))

(declare-fun tp!32450 () Bool)

(declare-fun b_and!16469 () Bool)

(assert (=> start!38558 (= tp!32450 b_and!16469)))

(declare-fun res!229415 () Bool)

(declare-fun e!240976 () Bool)

(assert (=> start!38558 (=> (not res!229415) (not e!240976))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23871 0))(
  ( (array!23872 (arr!11385 (Array (_ BitVec 32) (_ BitVec 64))) (size!11738 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23871)

(assert (=> start!38558 (= res!229415 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11738 _keys!709))))))

(assert (=> start!38558 e!240976))

(declare-fun tp_is_empty!9991 () Bool)

(assert (=> start!38558 tp_is_empty!9991))

(assert (=> start!38558 tp!32450))

(assert (=> start!38558 true))

(declare-datatypes ((V!14427 0))(
  ( (V!14428 (val!5040 Int)) )
))
(declare-datatypes ((ValueCell!4652 0))(
  ( (ValueCellFull!4652 (v!7281 V!14427)) (EmptyCell!4652) )
))
(declare-datatypes ((array!23873 0))(
  ( (array!23874 (arr!11386 (Array (_ BitVec 32) ValueCell!4652)) (size!11739 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23873)

(declare-fun e!240972 () Bool)

(declare-fun array_inv!8358 (array!23873) Bool)

(assert (=> start!38558 (and (array_inv!8358 _values!549) e!240972)))

(declare-fun array_inv!8359 (array!23871) Bool)

(assert (=> start!38558 (array_inv!8359 _keys!709)))

(declare-fun minValue!515 () V!14427)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6642 0))(
  ( (tuple2!6643 (_1!3332 (_ BitVec 64)) (_2!3332 V!14427)) )
))
(declare-datatypes ((List!6553 0))(
  ( (Nil!6550) (Cons!6549 (h!7405 tuple2!6642) (t!11718 List!6553)) )
))
(declare-datatypes ((ListLongMap!5545 0))(
  ( (ListLongMap!5546 (toList!2788 List!6553)) )
))
(declare-fun call!27967 () ListLongMap!5545)

(declare-fun zeroValue!515 () V!14427)

(declare-fun bm!27963 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1009 (array!23871 array!23873 (_ BitVec 32) (_ BitVec 32) V!14427 V!14427 (_ BitVec 32) Int) ListLongMap!5545)

(assert (=> bm!27963 (= call!27967 (getCurrentListMapNoExtraKeys!1009 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398967 () Bool)

(declare-fun res!229405 () Bool)

(assert (=> b!398967 (=> (not res!229405) (not e!240976))))

(declare-datatypes ((List!6554 0))(
  ( (Nil!6551) (Cons!6550 (h!7406 (_ BitVec 64)) (t!11719 List!6554)) )
))
(declare-fun arrayNoDuplicates!0 (array!23871 (_ BitVec 32) List!6554) Bool)

(assert (=> b!398967 (= res!229405 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6551))))

(declare-fun call!27966 () ListLongMap!5545)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!240974 () Bool)

(declare-fun b!398968 () Bool)

(declare-fun v!412 () V!14427)

(declare-fun +!1105 (ListLongMap!5545 tuple2!6642) ListLongMap!5545)

(assert (=> b!398968 (= e!240974 (= call!27966 (+!1105 call!27967 (tuple2!6643 k0!794 v!412))))))

(declare-fun b!398969 () Bool)

(declare-fun res!229414 () Bool)

(assert (=> b!398969 (=> (not res!229414) (not e!240976))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398969 (= res!229414 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11738 _keys!709))))))

(declare-fun b!398970 () Bool)

(declare-fun e!240977 () Bool)

(assert (=> b!398970 (= e!240977 (not true))))

(assert (=> b!398970 e!240974))

(declare-fun c!54549 () Bool)

(assert (=> b!398970 (= c!54549 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12070 0))(
  ( (Unit!12071) )
))
(declare-fun lt!187319 () Unit!12070)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 (array!23871 array!23873 (_ BitVec 32) (_ BitVec 32) V!14427 V!14427 (_ BitVec 32) (_ BitVec 64) V!14427 (_ BitVec 32) Int) Unit!12070)

(assert (=> b!398970 (= lt!187319 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!298 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398971 () Bool)

(declare-fun res!229406 () Bool)

(assert (=> b!398971 (=> (not res!229406) (not e!240976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398971 (= res!229406 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16608 () Bool)

(declare-fun mapRes!16608 () Bool)

(assert (=> mapIsEmpty!16608 mapRes!16608))

(declare-fun b!398972 () Bool)

(assert (=> b!398972 (= e!240976 e!240977)))

(declare-fun res!229409 () Bool)

(assert (=> b!398972 (=> (not res!229409) (not e!240977))))

(declare-fun lt!187318 () array!23871)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23871 (_ BitVec 32)) Bool)

(assert (=> b!398972 (= res!229409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187318 mask!1025))))

(assert (=> b!398972 (= lt!187318 (array!23872 (store (arr!11385 _keys!709) i!563 k0!794) (size!11738 _keys!709)))))

(declare-fun b!398973 () Bool)

(assert (=> b!398973 (= e!240974 (= call!27966 call!27967))))

(declare-fun b!398974 () Bool)

(declare-fun res!229416 () Bool)

(assert (=> b!398974 (=> (not res!229416) (not e!240976))))

(assert (=> b!398974 (= res!229416 (and (= (size!11739 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11738 _keys!709) (size!11739 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398975 () Bool)

(declare-fun res!229413 () Bool)

(assert (=> b!398975 (=> (not res!229413) (not e!240976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398975 (= res!229413 (validMask!0 mask!1025))))

(declare-fun b!398976 () Bool)

(declare-fun e!240975 () Bool)

(assert (=> b!398976 (= e!240975 tp_is_empty!9991)))

(declare-fun b!398977 () Bool)

(declare-fun res!229411 () Bool)

(assert (=> b!398977 (=> (not res!229411) (not e!240976))))

(assert (=> b!398977 (= res!229411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398978 () Bool)

(declare-fun res!229407 () Bool)

(assert (=> b!398978 (=> (not res!229407) (not e!240976))))

(assert (=> b!398978 (= res!229407 (or (= (select (arr!11385 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11385 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398979 () Bool)

(declare-fun res!229410 () Bool)

(assert (=> b!398979 (=> (not res!229410) (not e!240977))))

(assert (=> b!398979 (= res!229410 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11738 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16608 () Bool)

(declare-fun tp!32451 () Bool)

(declare-fun e!240978 () Bool)

(assert (=> mapNonEmpty!16608 (= mapRes!16608 (and tp!32451 e!240978))))

(declare-fun mapValue!16608 () ValueCell!4652)

(declare-fun mapKey!16608 () (_ BitVec 32))

(declare-fun mapRest!16608 () (Array (_ BitVec 32) ValueCell!4652))

(assert (=> mapNonEmpty!16608 (= (arr!11386 _values!549) (store mapRest!16608 mapKey!16608 mapValue!16608))))

(declare-fun bm!27964 () Bool)

(assert (=> bm!27964 (= call!27966 (getCurrentListMapNoExtraKeys!1009 lt!187318 (array!23874 (store (arr!11386 _values!549) i!563 (ValueCellFull!4652 v!412)) (size!11739 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398980 () Bool)

(assert (=> b!398980 (= e!240978 tp_is_empty!9991)))

(declare-fun b!398981 () Bool)

(declare-fun res!229408 () Bool)

(assert (=> b!398981 (=> (not res!229408) (not e!240977))))

(assert (=> b!398981 (= res!229408 (arrayNoDuplicates!0 lt!187318 #b00000000000000000000000000000000 Nil!6551))))

(declare-fun b!398982 () Bool)

(declare-fun res!229412 () Bool)

(assert (=> b!398982 (=> (not res!229412) (not e!240976))))

(declare-fun arrayContainsKey!0 (array!23871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398982 (= res!229412 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398983 () Bool)

(assert (=> b!398983 (= e!240972 (and e!240975 mapRes!16608))))

(declare-fun condMapEmpty!16608 () Bool)

(declare-fun mapDefault!16608 () ValueCell!4652)

(assert (=> b!398983 (= condMapEmpty!16608 (= (arr!11386 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4652)) mapDefault!16608)))))

(assert (= (and start!38558 res!229415) b!398975))

(assert (= (and b!398975 res!229413) b!398974))

(assert (= (and b!398974 res!229416) b!398977))

(assert (= (and b!398977 res!229411) b!398967))

(assert (= (and b!398967 res!229405) b!398969))

(assert (= (and b!398969 res!229414) b!398971))

(assert (= (and b!398971 res!229406) b!398978))

(assert (= (and b!398978 res!229407) b!398982))

(assert (= (and b!398982 res!229412) b!398972))

(assert (= (and b!398972 res!229409) b!398981))

(assert (= (and b!398981 res!229408) b!398979))

(assert (= (and b!398979 res!229410) b!398970))

(assert (= (and b!398970 c!54549) b!398968))

(assert (= (and b!398970 (not c!54549)) b!398973))

(assert (= (or b!398968 b!398973) bm!27964))

(assert (= (or b!398968 b!398973) bm!27963))

(assert (= (and b!398983 condMapEmpty!16608) mapIsEmpty!16608))

(assert (= (and b!398983 (not condMapEmpty!16608)) mapNonEmpty!16608))

(get-info :version)

(assert (= (and mapNonEmpty!16608 ((_ is ValueCellFull!4652) mapValue!16608)) b!398980))

(assert (= (and b!398983 ((_ is ValueCellFull!4652) mapDefault!16608)) b!398976))

(assert (= start!38558 b!398983))

(declare-fun m!393105 () Bool)

(assert (=> start!38558 m!393105))

(declare-fun m!393107 () Bool)

(assert (=> start!38558 m!393107))

(declare-fun m!393109 () Bool)

(assert (=> b!398967 m!393109))

(declare-fun m!393111 () Bool)

(assert (=> mapNonEmpty!16608 m!393111))

(declare-fun m!393113 () Bool)

(assert (=> bm!27964 m!393113))

(declare-fun m!393115 () Bool)

(assert (=> bm!27964 m!393115))

(declare-fun m!393117 () Bool)

(assert (=> b!398981 m!393117))

(declare-fun m!393119 () Bool)

(assert (=> b!398968 m!393119))

(declare-fun m!393121 () Bool)

(assert (=> b!398975 m!393121))

(declare-fun m!393123 () Bool)

(assert (=> bm!27963 m!393123))

(declare-fun m!393125 () Bool)

(assert (=> b!398972 m!393125))

(declare-fun m!393127 () Bool)

(assert (=> b!398972 m!393127))

(declare-fun m!393129 () Bool)

(assert (=> b!398977 m!393129))

(declare-fun m!393131 () Bool)

(assert (=> b!398971 m!393131))

(declare-fun m!393133 () Bool)

(assert (=> b!398970 m!393133))

(declare-fun m!393135 () Bool)

(assert (=> b!398978 m!393135))

(declare-fun m!393137 () Bool)

(assert (=> b!398982 m!393137))

(check-sat (not b!398982) (not b!398975) (not mapNonEmpty!16608) (not b!398968) (not b_next!9109) (not b!398977) (not b!398972) (not bm!27964) b_and!16469 (not b!398970) (not start!38558) (not b!398981) (not b!398967) (not bm!27963) tp_is_empty!9991 (not b!398971))
(check-sat b_and!16469 (not b_next!9109))
