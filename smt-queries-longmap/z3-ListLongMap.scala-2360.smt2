; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37608 () Bool)

(assert start!37608)

(declare-fun b_free!8749 () Bool)

(declare-fun b_next!8749 () Bool)

(assert (=> start!37608 (= b_free!8749 (not b_next!8749))))

(declare-fun tp!30962 () Bool)

(declare-fun b_and!15965 () Bool)

(assert (=> start!37608 (= tp!30962 b_and!15965)))

(declare-fun b!384744 () Bool)

(declare-fun e!233523 () Bool)

(declare-fun tp_is_empty!9397 () Bool)

(assert (=> b!384744 (= e!233523 tp_is_empty!9397)))

(declare-fun b!384745 () Bool)

(declare-fun e!233525 () Bool)

(declare-fun e!233522 () Bool)

(assert (=> b!384745 (= e!233525 e!233522)))

(declare-fun res!219427 () Bool)

(assert (=> b!384745 (=> (not res!219427) (not e!233522))))

(declare-datatypes ((array!22681 0))(
  ( (array!22682 (arr!10809 (Array (_ BitVec 32) (_ BitVec 64))) (size!11162 (_ BitVec 32))) )
))
(declare-fun lt!181103 () array!22681)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22681 (_ BitVec 32)) Bool)

(assert (=> b!384745 (= res!219427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181103 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22681)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384745 (= lt!181103 (array!22682 (store (arr!10809 _keys!658) i!548 k0!778) (size!11162 _keys!658)))))

(declare-fun b!384746 () Bool)

(declare-fun res!219421 () Bool)

(assert (=> b!384746 (=> (not res!219421) (not e!233525))))

(declare-fun arrayContainsKey!0 (array!22681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384746 (= res!219421 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384747 () Bool)

(declare-fun e!233520 () Bool)

(assert (=> b!384747 (= e!233520 tp_is_empty!9397)))

(declare-fun b!384748 () Bool)

(declare-fun res!219426 () Bool)

(assert (=> b!384748 (=> (not res!219426) (not e!233525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384748 (= res!219426 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15660 () Bool)

(declare-fun mapRes!15660 () Bool)

(declare-fun tp!30963 () Bool)

(assert (=> mapNonEmpty!15660 (= mapRes!15660 (and tp!30963 e!233520))))

(declare-datatypes ((V!13635 0))(
  ( (V!13636 (val!4743 Int)) )
))
(declare-datatypes ((ValueCell!4355 0))(
  ( (ValueCellFull!4355 (v!6934 V!13635)) (EmptyCell!4355) )
))
(declare-fun mapRest!15660 () (Array (_ BitVec 32) ValueCell!4355))

(declare-datatypes ((array!22683 0))(
  ( (array!22684 (arr!10810 (Array (_ BitVec 32) ValueCell!4355)) (size!11163 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22683)

(declare-fun mapValue!15660 () ValueCell!4355)

(declare-fun mapKey!15660 () (_ BitVec 32))

(assert (=> mapNonEmpty!15660 (= (arr!10810 _values!506) (store mapRest!15660 mapKey!15660 mapValue!15660))))

(declare-fun mapIsEmpty!15660 () Bool)

(assert (=> mapIsEmpty!15660 mapRes!15660))

(declare-fun b!384749 () Bool)

(declare-fun res!219428 () Bool)

(assert (=> b!384749 (=> (not res!219428) (not e!233525))))

(assert (=> b!384749 (= res!219428 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11162 _keys!658))))))

(declare-fun b!384750 () Bool)

(declare-fun res!219423 () Bool)

(assert (=> b!384750 (=> (not res!219423) (not e!233525))))

(assert (=> b!384750 (= res!219423 (or (= (select (arr!10809 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10809 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!219425 () Bool)

(assert (=> start!37608 (=> (not res!219425) (not e!233525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37608 (= res!219425 (validMask!0 mask!970))))

(assert (=> start!37608 e!233525))

(declare-fun e!233519 () Bool)

(declare-fun array_inv!7956 (array!22683) Bool)

(assert (=> start!37608 (and (array_inv!7956 _values!506) e!233519)))

(assert (=> start!37608 tp!30962))

(assert (=> start!37608 true))

(assert (=> start!37608 tp_is_empty!9397))

(declare-fun array_inv!7957 (array!22681) Bool)

(assert (=> start!37608 (array_inv!7957 _keys!658)))

(declare-fun b!384751 () Bool)

(declare-fun res!219431 () Bool)

(assert (=> b!384751 (=> (not res!219431) (not e!233525))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384751 (= res!219431 (and (= (size!11163 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11162 _keys!658) (size!11163 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384752 () Bool)

(declare-fun e!233524 () Bool)

(assert (=> b!384752 (= e!233524 true)))

(declare-datatypes ((tuple2!6370 0))(
  ( (tuple2!6371 (_1!3196 (_ BitVec 64)) (_2!3196 V!13635)) )
))
(declare-datatypes ((List!6193 0))(
  ( (Nil!6190) (Cons!6189 (h!7045 tuple2!6370) (t!11334 List!6193)) )
))
(declare-datatypes ((ListLongMap!5273 0))(
  ( (ListLongMap!5274 (toList!2652 List!6193)) )
))
(declare-fun lt!181110 () ListLongMap!5273)

(declare-fun lt!181104 () ListLongMap!5273)

(declare-fun lt!181106 () tuple2!6370)

(declare-fun +!1009 (ListLongMap!5273 tuple2!6370) ListLongMap!5273)

(assert (=> b!384752 (= lt!181110 (+!1009 lt!181104 lt!181106))))

(declare-fun lt!181112 () ListLongMap!5273)

(declare-fun lt!181107 () ListLongMap!5273)

(assert (=> b!384752 (= lt!181112 lt!181107)))

(declare-fun b!384753 () Bool)

(assert (=> b!384753 (= e!233522 (not e!233524))))

(declare-fun res!219430 () Bool)

(assert (=> b!384753 (=> res!219430 e!233524)))

(declare-fun lt!181108 () Bool)

(assert (=> b!384753 (= res!219430 (or (and (not lt!181108) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181108) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181108)))))

(assert (=> b!384753 (= lt!181108 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13635)

(declare-fun minValue!472 () V!13635)

(declare-fun getCurrentListMap!2029 (array!22681 array!22683 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!384753 (= lt!181104 (getCurrentListMap!2029 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181111 () array!22683)

(assert (=> b!384753 (= lt!181112 (getCurrentListMap!2029 lt!181103 lt!181111 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181105 () ListLongMap!5273)

(assert (=> b!384753 (and (= lt!181107 lt!181105) (= lt!181105 lt!181107))))

(declare-fun lt!181113 () ListLongMap!5273)

(assert (=> b!384753 (= lt!181105 (+!1009 lt!181113 lt!181106))))

(declare-fun v!373 () V!13635)

(assert (=> b!384753 (= lt!181106 (tuple2!6371 k0!778 v!373))))

(declare-datatypes ((Unit!11864 0))(
  ( (Unit!11865) )
))
(declare-fun lt!181109 () Unit!11864)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 (array!22681 array!22683 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) (_ BitVec 64) V!13635 (_ BitVec 32) Int) Unit!11864)

(assert (=> b!384753 (= lt!181109 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!894 (array!22681 array!22683 (_ BitVec 32) (_ BitVec 32) V!13635 V!13635 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!384753 (= lt!181107 (getCurrentListMapNoExtraKeys!894 lt!181103 lt!181111 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384753 (= lt!181111 (array!22684 (store (arr!10810 _values!506) i!548 (ValueCellFull!4355 v!373)) (size!11163 _values!506)))))

(assert (=> b!384753 (= lt!181113 (getCurrentListMapNoExtraKeys!894 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384754 () Bool)

(assert (=> b!384754 (= e!233519 (and e!233523 mapRes!15660))))

(declare-fun condMapEmpty!15660 () Bool)

(declare-fun mapDefault!15660 () ValueCell!4355)

(assert (=> b!384754 (= condMapEmpty!15660 (= (arr!10810 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4355)) mapDefault!15660)))))

(declare-fun b!384755 () Bool)

(declare-fun res!219422 () Bool)

(assert (=> b!384755 (=> (not res!219422) (not e!233525))))

(declare-datatypes ((List!6194 0))(
  ( (Nil!6191) (Cons!6190 (h!7046 (_ BitVec 64)) (t!11335 List!6194)) )
))
(declare-fun arrayNoDuplicates!0 (array!22681 (_ BitVec 32) List!6194) Bool)

(assert (=> b!384755 (= res!219422 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6191))))

(declare-fun b!384756 () Bool)

(declare-fun res!219424 () Bool)

(assert (=> b!384756 (=> (not res!219424) (not e!233522))))

(assert (=> b!384756 (= res!219424 (arrayNoDuplicates!0 lt!181103 #b00000000000000000000000000000000 Nil!6191))))

(declare-fun b!384757 () Bool)

(declare-fun res!219429 () Bool)

(assert (=> b!384757 (=> (not res!219429) (not e!233525))))

(assert (=> b!384757 (= res!219429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37608 res!219425) b!384751))

(assert (= (and b!384751 res!219431) b!384757))

(assert (= (and b!384757 res!219429) b!384755))

(assert (= (and b!384755 res!219422) b!384749))

(assert (= (and b!384749 res!219428) b!384748))

(assert (= (and b!384748 res!219426) b!384750))

(assert (= (and b!384750 res!219423) b!384746))

(assert (= (and b!384746 res!219421) b!384745))

(assert (= (and b!384745 res!219427) b!384756))

(assert (= (and b!384756 res!219424) b!384753))

(assert (= (and b!384753 (not res!219430)) b!384752))

(assert (= (and b!384754 condMapEmpty!15660) mapIsEmpty!15660))

(assert (= (and b!384754 (not condMapEmpty!15660)) mapNonEmpty!15660))

(get-info :version)

(assert (= (and mapNonEmpty!15660 ((_ is ValueCellFull!4355) mapValue!15660)) b!384747))

(assert (= (and b!384754 ((_ is ValueCellFull!4355) mapDefault!15660)) b!384744))

(assert (= start!37608 b!384754))

(declare-fun m!380951 () Bool)

(assert (=> b!384745 m!380951))

(declare-fun m!380953 () Bool)

(assert (=> b!384745 m!380953))

(declare-fun m!380955 () Bool)

(assert (=> start!37608 m!380955))

(declare-fun m!380957 () Bool)

(assert (=> start!37608 m!380957))

(declare-fun m!380959 () Bool)

(assert (=> start!37608 m!380959))

(declare-fun m!380961 () Bool)

(assert (=> b!384757 m!380961))

(declare-fun m!380963 () Bool)

(assert (=> mapNonEmpty!15660 m!380963))

(declare-fun m!380965 () Bool)

(assert (=> b!384753 m!380965))

(declare-fun m!380967 () Bool)

(assert (=> b!384753 m!380967))

(declare-fun m!380969 () Bool)

(assert (=> b!384753 m!380969))

(declare-fun m!380971 () Bool)

(assert (=> b!384753 m!380971))

(declare-fun m!380973 () Bool)

(assert (=> b!384753 m!380973))

(declare-fun m!380975 () Bool)

(assert (=> b!384753 m!380975))

(declare-fun m!380977 () Bool)

(assert (=> b!384753 m!380977))

(declare-fun m!380979 () Bool)

(assert (=> b!384750 m!380979))

(declare-fun m!380981 () Bool)

(assert (=> b!384756 m!380981))

(declare-fun m!380983 () Bool)

(assert (=> b!384752 m!380983))

(declare-fun m!380985 () Bool)

(assert (=> b!384746 m!380985))

(declare-fun m!380987 () Bool)

(assert (=> b!384748 m!380987))

(declare-fun m!380989 () Bool)

(assert (=> b!384755 m!380989))

(check-sat (not b!384756) (not b!384753) (not b!384752) (not b!384755) (not b!384748) (not b_next!8749) (not start!37608) (not b!384746) (not b!384757) (not b!384745) b_and!15965 (not mapNonEmpty!15660) tp_is_empty!9397)
(check-sat b_and!15965 (not b_next!8749))
