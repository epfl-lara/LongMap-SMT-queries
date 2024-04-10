; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38238 () Bool)

(assert start!38238)

(declare-fun b_free!9075 () Bool)

(declare-fun b_next!9075 () Bool)

(assert (=> start!38238 (= b_free!9075 (not b_next!9075))))

(declare-fun tp!32013 () Bool)

(declare-fun b_and!16461 () Bool)

(assert (=> start!38238 (= tp!32013 b_and!16461)))

(declare-fun b!394540 () Bool)

(declare-fun e!238814 () Bool)

(declare-fun tp_is_empty!9747 () Bool)

(assert (=> b!394540 (= e!238814 tp_is_empty!9747)))

(declare-fun mapIsEmpty!16221 () Bool)

(declare-fun mapRes!16221 () Bool)

(assert (=> mapIsEmpty!16221 mapRes!16221))

(declare-fun mapNonEmpty!16221 () Bool)

(declare-fun tp!32012 () Bool)

(assert (=> mapNonEmpty!16221 (= mapRes!16221 (and tp!32012 e!238814))))

(declare-fun mapKey!16221 () (_ BitVec 32))

(declare-datatypes ((V!14101 0))(
  ( (V!14102 (val!4918 Int)) )
))
(declare-datatypes ((ValueCell!4530 0))(
  ( (ValueCellFull!4530 (v!7163 V!14101)) (EmptyCell!4530) )
))
(declare-datatypes ((array!23403 0))(
  ( (array!23404 (arr!11158 (Array (_ BitVec 32) ValueCell!4530)) (size!11510 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23403)

(declare-fun mapValue!16221 () ValueCell!4530)

(declare-fun mapRest!16221 () (Array (_ BitVec 32) ValueCell!4530))

(assert (=> mapNonEmpty!16221 (= (arr!11158 _values!506) (store mapRest!16221 mapKey!16221 mapValue!16221))))

(declare-fun b!394542 () Bool)

(declare-fun res!226157 () Bool)

(declare-fun e!238818 () Bool)

(assert (=> b!394542 (=> (not res!226157) (not e!238818))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23405 0))(
  ( (array!23406 (arr!11159 (Array (_ BitVec 32) (_ BitVec 64))) (size!11511 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23405)

(assert (=> b!394542 (= res!226157 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11511 _keys!658))))))

(declare-fun b!394543 () Bool)

(declare-fun res!226163 () Bool)

(assert (=> b!394543 (=> (not res!226163) (not e!238818))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23405 (_ BitVec 32)) Bool)

(assert (=> b!394543 (= res!226163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394544 () Bool)

(declare-fun res!226162 () Bool)

(assert (=> b!394544 (=> (not res!226162) (not e!238818))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394544 (= res!226162 (validKeyInArray!0 k0!778))))

(declare-fun b!394545 () Bool)

(declare-fun res!226165 () Bool)

(assert (=> b!394545 (=> (not res!226165) (not e!238818))))

(assert (=> b!394545 (= res!226165 (or (= (select (arr!11159 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11159 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394546 () Bool)

(declare-fun res!226161 () Bool)

(declare-fun e!238815 () Bool)

(assert (=> b!394546 (=> (not res!226161) (not e!238815))))

(declare-fun lt!186985 () array!23405)

(declare-datatypes ((List!6495 0))(
  ( (Nil!6492) (Cons!6491 (h!7347 (_ BitVec 64)) (t!11669 List!6495)) )
))
(declare-fun arrayNoDuplicates!0 (array!23405 (_ BitVec 32) List!6495) Bool)

(assert (=> b!394546 (= res!226161 (arrayNoDuplicates!0 lt!186985 #b00000000000000000000000000000000 Nil!6492))))

(declare-fun b!394547 () Bool)

(declare-fun e!238820 () Bool)

(declare-fun e!238816 () Bool)

(assert (=> b!394547 (= e!238820 (and e!238816 mapRes!16221))))

(declare-fun condMapEmpty!16221 () Bool)

(declare-fun mapDefault!16221 () ValueCell!4530)

(assert (=> b!394547 (= condMapEmpty!16221 (= (arr!11158 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4530)) mapDefault!16221)))))

(declare-fun b!394548 () Bool)

(declare-fun res!226166 () Bool)

(assert (=> b!394548 (=> (not res!226166) (not e!238818))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394548 (= res!226166 (and (= (size!11510 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11511 _keys!658) (size!11510 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394549 () Bool)

(declare-fun e!238817 () Bool)

(assert (=> b!394549 (= e!238815 (not e!238817))))

(declare-fun res!226160 () Bool)

(assert (=> b!394549 (=> res!226160 e!238817)))

(declare-fun lt!186991 () Bool)

(assert (=> b!394549 (= res!226160 (or (and (not lt!186991) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186991) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186991)))))

(assert (=> b!394549 (= lt!186991 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!472 () V!14101)

(declare-datatypes ((tuple2!6642 0))(
  ( (tuple2!6643 (_1!3332 (_ BitVec 64)) (_2!3332 V!14101)) )
))
(declare-datatypes ((List!6496 0))(
  ( (Nil!6493) (Cons!6492 (h!7348 tuple2!6642) (t!11670 List!6496)) )
))
(declare-datatypes ((ListLongMap!5555 0))(
  ( (ListLongMap!5556 (toList!2793 List!6496)) )
))
(declare-fun lt!186988 () ListLongMap!5555)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!14101)

(declare-fun getCurrentListMap!2132 (array!23405 array!23403 (_ BitVec 32) (_ BitVec 32) V!14101 V!14101 (_ BitVec 32) Int) ListLongMap!5555)

(assert (=> b!394549 (= lt!186988 (getCurrentListMap!2132 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186990 () ListLongMap!5555)

(declare-fun lt!186987 () array!23403)

(assert (=> b!394549 (= lt!186990 (getCurrentListMap!2132 lt!186985 lt!186987 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186984 () ListLongMap!5555)

(declare-fun lt!186993 () ListLongMap!5555)

(assert (=> b!394549 (and (= lt!186984 lt!186993) (= lt!186993 lt!186984))))

(declare-fun lt!186989 () ListLongMap!5555)

(declare-fun lt!186986 () tuple2!6642)

(declare-fun +!1086 (ListLongMap!5555 tuple2!6642) ListLongMap!5555)

(assert (=> b!394549 (= lt!186993 (+!1086 lt!186989 lt!186986))))

(declare-fun v!373 () V!14101)

(assert (=> b!394549 (= lt!186986 (tuple2!6643 k0!778 v!373))))

(declare-datatypes ((Unit!12062 0))(
  ( (Unit!12063) )
))
(declare-fun lt!186992 () Unit!12062)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!296 (array!23405 array!23403 (_ BitVec 32) (_ BitVec 32) V!14101 V!14101 (_ BitVec 32) (_ BitVec 64) V!14101 (_ BitVec 32) Int) Unit!12062)

(assert (=> b!394549 (= lt!186992 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!296 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1012 (array!23405 array!23403 (_ BitVec 32) (_ BitVec 32) V!14101 V!14101 (_ BitVec 32) Int) ListLongMap!5555)

(assert (=> b!394549 (= lt!186984 (getCurrentListMapNoExtraKeys!1012 lt!186985 lt!186987 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394549 (= lt!186987 (array!23404 (store (arr!11158 _values!506) i!548 (ValueCellFull!4530 v!373)) (size!11510 _values!506)))))

(assert (=> b!394549 (= lt!186989 (getCurrentListMapNoExtraKeys!1012 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394550 () Bool)

(assert (=> b!394550 (= e!238817 true)))

(declare-fun lt!186983 () ListLongMap!5555)

(assert (=> b!394550 (= lt!186983 (+!1086 lt!186988 lt!186986))))

(assert (=> b!394550 (= lt!186990 lt!186984)))

(declare-fun b!394551 () Bool)

(declare-fun res!226158 () Bool)

(assert (=> b!394551 (=> (not res!226158) (not e!238818))))

(assert (=> b!394551 (= res!226158 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6492))))

(declare-fun b!394552 () Bool)

(assert (=> b!394552 (= e!238816 tp_is_empty!9747)))

(declare-fun b!394553 () Bool)

(declare-fun res!226159 () Bool)

(assert (=> b!394553 (=> (not res!226159) (not e!238818))))

(declare-fun arrayContainsKey!0 (array!23405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394553 (= res!226159 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!226164 () Bool)

(assert (=> start!38238 (=> (not res!226164) (not e!238818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38238 (= res!226164 (validMask!0 mask!970))))

(assert (=> start!38238 e!238818))

(declare-fun array_inv!8192 (array!23403) Bool)

(assert (=> start!38238 (and (array_inv!8192 _values!506) e!238820)))

(assert (=> start!38238 tp!32013))

(assert (=> start!38238 true))

(assert (=> start!38238 tp_is_empty!9747))

(declare-fun array_inv!8193 (array!23405) Bool)

(assert (=> start!38238 (array_inv!8193 _keys!658)))

(declare-fun b!394541 () Bool)

(assert (=> b!394541 (= e!238818 e!238815)))

(declare-fun res!226156 () Bool)

(assert (=> b!394541 (=> (not res!226156) (not e!238815))))

(assert (=> b!394541 (= res!226156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186985 mask!970))))

(assert (=> b!394541 (= lt!186985 (array!23406 (store (arr!11159 _keys!658) i!548 k0!778) (size!11511 _keys!658)))))

(assert (= (and start!38238 res!226164) b!394548))

(assert (= (and b!394548 res!226166) b!394543))

(assert (= (and b!394543 res!226163) b!394551))

(assert (= (and b!394551 res!226158) b!394542))

(assert (= (and b!394542 res!226157) b!394544))

(assert (= (and b!394544 res!226162) b!394545))

(assert (= (and b!394545 res!226165) b!394553))

(assert (= (and b!394553 res!226159) b!394541))

(assert (= (and b!394541 res!226156) b!394546))

(assert (= (and b!394546 res!226161) b!394549))

(assert (= (and b!394549 (not res!226160)) b!394550))

(assert (= (and b!394547 condMapEmpty!16221) mapIsEmpty!16221))

(assert (= (and b!394547 (not condMapEmpty!16221)) mapNonEmpty!16221))

(get-info :version)

(assert (= (and mapNonEmpty!16221 ((_ is ValueCellFull!4530) mapValue!16221)) b!394540))

(assert (= (and b!394547 ((_ is ValueCellFull!4530) mapDefault!16221)) b!394552))

(assert (= start!38238 b!394547))

(declare-fun m!390959 () Bool)

(assert (=> b!394544 m!390959))

(declare-fun m!390961 () Bool)

(assert (=> b!394546 m!390961))

(declare-fun m!390963 () Bool)

(assert (=> b!394549 m!390963))

(declare-fun m!390965 () Bool)

(assert (=> b!394549 m!390965))

(declare-fun m!390967 () Bool)

(assert (=> b!394549 m!390967))

(declare-fun m!390969 () Bool)

(assert (=> b!394549 m!390969))

(declare-fun m!390971 () Bool)

(assert (=> b!394549 m!390971))

(declare-fun m!390973 () Bool)

(assert (=> b!394549 m!390973))

(declare-fun m!390975 () Bool)

(assert (=> b!394549 m!390975))

(declare-fun m!390977 () Bool)

(assert (=> b!394553 m!390977))

(declare-fun m!390979 () Bool)

(assert (=> b!394543 m!390979))

(declare-fun m!390981 () Bool)

(assert (=> b!394550 m!390981))

(declare-fun m!390983 () Bool)

(assert (=> b!394545 m!390983))

(declare-fun m!390985 () Bool)

(assert (=> mapNonEmpty!16221 m!390985))

(declare-fun m!390987 () Bool)

(assert (=> b!394541 m!390987))

(declare-fun m!390989 () Bool)

(assert (=> b!394541 m!390989))

(declare-fun m!390991 () Bool)

(assert (=> b!394551 m!390991))

(declare-fun m!390993 () Bool)

(assert (=> start!38238 m!390993))

(declare-fun m!390995 () Bool)

(assert (=> start!38238 m!390995))

(declare-fun m!390997 () Bool)

(assert (=> start!38238 m!390997))

(check-sat (not b!394551) b_and!16461 (not b!394546) (not start!38238) (not b!394544) (not b!394553) (not b_next!9075) (not b!394550) (not b!394541) (not mapNonEmpty!16221) (not b!394543) tp_is_empty!9747 (not b!394549))
(check-sat b_and!16461 (not b_next!9075))
