; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39582 () Bool)

(assert start!39582)

(declare-fun b_free!9849 () Bool)

(declare-fun b_next!9849 () Bool)

(assert (=> start!39582 (= b_free!9849 (not b_next!9849))))

(declare-fun tp!35076 () Bool)

(declare-fun b_and!17505 () Bool)

(assert (=> start!39582 (= tp!35076 b_and!17505)))

(declare-fun mapIsEmpty!18123 () Bool)

(declare-fun mapRes!18123 () Bool)

(assert (=> mapIsEmpty!18123 mapRes!18123))

(declare-fun b!423849 () Bool)

(declare-fun e!251901 () Bool)

(declare-fun e!251899 () Bool)

(assert (=> b!423849 (= e!251901 e!251899)))

(declare-fun res!247808 () Bool)

(assert (=> b!423849 (=> (not res!247808) (not e!251899))))

(declare-datatypes ((array!25843 0))(
  ( (array!25844 (arr!12371 (Array (_ BitVec 32) (_ BitVec 64))) (size!12723 (_ BitVec 32))) )
))
(declare-fun lt!194251 () array!25843)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25843 (_ BitVec 32)) Bool)

(assert (=> b!423849 (= res!247808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194251 mask!1025))))

(declare-fun _keys!709 () array!25843)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423849 (= lt!194251 (array!25844 (store (arr!12371 _keys!709) i!563 k0!794) (size!12723 _keys!709)))))

(declare-fun b!423850 () Bool)

(declare-fun res!247807 () Bool)

(assert (=> b!423850 (=> (not res!247807) (not e!251901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423850 (= res!247807 (validKeyInArray!0 k0!794))))

(declare-fun b!423851 () Bool)

(declare-fun res!247810 () Bool)

(assert (=> b!423851 (=> (not res!247810) (not e!251899))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423851 (= res!247810 (bvsle from!863 i!563))))

(declare-fun b!423852 () Bool)

(declare-fun res!247814 () Bool)

(assert (=> b!423852 (=> (not res!247814) (not e!251899))))

(declare-datatypes ((List!7292 0))(
  ( (Nil!7289) (Cons!7288 (h!8144 (_ BitVec 64)) (t!12736 List!7292)) )
))
(declare-fun arrayNoDuplicates!0 (array!25843 (_ BitVec 32) List!7292) Bool)

(assert (=> b!423852 (= res!247814 (arrayNoDuplicates!0 lt!194251 #b00000000000000000000000000000000 Nil!7289))))

(declare-fun b!423853 () Bool)

(declare-fun res!247809 () Bool)

(assert (=> b!423853 (=> (not res!247809) (not e!251901))))

(assert (=> b!423853 (= res!247809 (or (= (select (arr!12371 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12371 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18123 () Bool)

(declare-fun tp!35075 () Bool)

(declare-fun e!251902 () Bool)

(assert (=> mapNonEmpty!18123 (= mapRes!18123 (and tp!35075 e!251902))))

(declare-datatypes ((V!15773 0))(
  ( (V!15774 (val!5545 Int)) )
))
(declare-datatypes ((ValueCell!5157 0))(
  ( (ValueCellFull!5157 (v!7792 V!15773)) (EmptyCell!5157) )
))
(declare-fun mapRest!18123 () (Array (_ BitVec 32) ValueCell!5157))

(declare-fun mapKey!18123 () (_ BitVec 32))

(declare-fun mapValue!18123 () ValueCell!5157)

(declare-datatypes ((array!25845 0))(
  ( (array!25846 (arr!12372 (Array (_ BitVec 32) ValueCell!5157)) (size!12724 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25845)

(assert (=> mapNonEmpty!18123 (= (arr!12372 _values!549) (store mapRest!18123 mapKey!18123 mapValue!18123))))

(declare-fun b!423855 () Bool)

(declare-fun res!247815 () Bool)

(assert (=> b!423855 (=> (not res!247815) (not e!251901))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423855 (= res!247815 (and (= (size!12724 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12723 _keys!709) (size!12724 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423856 () Bool)

(declare-fun res!247805 () Bool)

(assert (=> b!423856 (=> (not res!247805) (not e!251901))))

(assert (=> b!423856 (= res!247805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423857 () Bool)

(declare-fun e!251903 () Bool)

(declare-fun tp_is_empty!11001 () Bool)

(assert (=> b!423857 (= e!251903 tp_is_empty!11001)))

(declare-fun b!423858 () Bool)

(assert (=> b!423858 (= e!251899 false)))

(declare-fun minValue!515 () V!15773)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15773)

(declare-datatypes ((tuple2!7284 0))(
  ( (tuple2!7285 (_1!3653 (_ BitVec 64)) (_2!3653 V!15773)) )
))
(declare-datatypes ((List!7293 0))(
  ( (Nil!7290) (Cons!7289 (h!8145 tuple2!7284) (t!12737 List!7293)) )
))
(declare-datatypes ((ListLongMap!6197 0))(
  ( (ListLongMap!6198 (toList!3114 List!7293)) )
))
(declare-fun lt!194250 () ListLongMap!6197)

(declare-fun v!412 () V!15773)

(declare-fun getCurrentListMapNoExtraKeys!1318 (array!25843 array!25845 (_ BitVec 32) (_ BitVec 32) V!15773 V!15773 (_ BitVec 32) Int) ListLongMap!6197)

(assert (=> b!423858 (= lt!194250 (getCurrentListMapNoExtraKeys!1318 lt!194251 (array!25846 (store (arr!12372 _values!549) i!563 (ValueCellFull!5157 v!412)) (size!12724 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194252 () ListLongMap!6197)

(assert (=> b!423858 (= lt!194252 (getCurrentListMapNoExtraKeys!1318 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423859 () Bool)

(declare-fun e!251900 () Bool)

(assert (=> b!423859 (= e!251900 (and e!251903 mapRes!18123))))

(declare-fun condMapEmpty!18123 () Bool)

(declare-fun mapDefault!18123 () ValueCell!5157)

(assert (=> b!423859 (= condMapEmpty!18123 (= (arr!12372 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5157)) mapDefault!18123)))))

(declare-fun b!423860 () Bool)

(declare-fun res!247811 () Bool)

(assert (=> b!423860 (=> (not res!247811) (not e!251901))))

(assert (=> b!423860 (= res!247811 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12723 _keys!709))))))

(declare-fun b!423854 () Bool)

(declare-fun res!247813 () Bool)

(assert (=> b!423854 (=> (not res!247813) (not e!251901))))

(assert (=> b!423854 (= res!247813 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7289))))

(declare-fun res!247806 () Bool)

(assert (=> start!39582 (=> (not res!247806) (not e!251901))))

(assert (=> start!39582 (= res!247806 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12723 _keys!709))))))

(assert (=> start!39582 e!251901))

(assert (=> start!39582 tp_is_empty!11001))

(assert (=> start!39582 tp!35076))

(assert (=> start!39582 true))

(declare-fun array_inv!9016 (array!25845) Bool)

(assert (=> start!39582 (and (array_inv!9016 _values!549) e!251900)))

(declare-fun array_inv!9017 (array!25843) Bool)

(assert (=> start!39582 (array_inv!9017 _keys!709)))

(declare-fun b!423861 () Bool)

(declare-fun res!247804 () Bool)

(assert (=> b!423861 (=> (not res!247804) (not e!251901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423861 (= res!247804 (validMask!0 mask!1025))))

(declare-fun b!423862 () Bool)

(assert (=> b!423862 (= e!251902 tp_is_empty!11001)))

(declare-fun b!423863 () Bool)

(declare-fun res!247812 () Bool)

(assert (=> b!423863 (=> (not res!247812) (not e!251901))))

(declare-fun arrayContainsKey!0 (array!25843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423863 (= res!247812 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39582 res!247806) b!423861))

(assert (= (and b!423861 res!247804) b!423855))

(assert (= (and b!423855 res!247815) b!423856))

(assert (= (and b!423856 res!247805) b!423854))

(assert (= (and b!423854 res!247813) b!423860))

(assert (= (and b!423860 res!247811) b!423850))

(assert (= (and b!423850 res!247807) b!423853))

(assert (= (and b!423853 res!247809) b!423863))

(assert (= (and b!423863 res!247812) b!423849))

(assert (= (and b!423849 res!247808) b!423852))

(assert (= (and b!423852 res!247814) b!423851))

(assert (= (and b!423851 res!247810) b!423858))

(assert (= (and b!423859 condMapEmpty!18123) mapIsEmpty!18123))

(assert (= (and b!423859 (not condMapEmpty!18123)) mapNonEmpty!18123))

(get-info :version)

(assert (= (and mapNonEmpty!18123 ((_ is ValueCellFull!5157) mapValue!18123)) b!423862))

(assert (= (and b!423859 ((_ is ValueCellFull!5157) mapDefault!18123)) b!423857))

(assert (= start!39582 b!423859))

(declare-fun m!413193 () Bool)

(assert (=> mapNonEmpty!18123 m!413193))

(declare-fun m!413195 () Bool)

(assert (=> b!423850 m!413195))

(declare-fun m!413197 () Bool)

(assert (=> b!423849 m!413197))

(declare-fun m!413199 () Bool)

(assert (=> b!423849 m!413199))

(declare-fun m!413201 () Bool)

(assert (=> start!39582 m!413201))

(declare-fun m!413203 () Bool)

(assert (=> start!39582 m!413203))

(declare-fun m!413205 () Bool)

(assert (=> b!423858 m!413205))

(declare-fun m!413207 () Bool)

(assert (=> b!423858 m!413207))

(declare-fun m!413209 () Bool)

(assert (=> b!423858 m!413209))

(declare-fun m!413211 () Bool)

(assert (=> b!423861 m!413211))

(declare-fun m!413213 () Bool)

(assert (=> b!423863 m!413213))

(declare-fun m!413215 () Bool)

(assert (=> b!423854 m!413215))

(declare-fun m!413217 () Bool)

(assert (=> b!423856 m!413217))

(declare-fun m!413219 () Bool)

(assert (=> b!423852 m!413219))

(declare-fun m!413221 () Bool)

(assert (=> b!423853 m!413221))

(check-sat (not b!423858) b_and!17505 (not b!423861) (not b!423863) (not b!423849) tp_is_empty!11001 (not b!423850) (not start!39582) (not mapNonEmpty!18123) (not b!423852) (not b!423856) (not b!423854) (not b_next!9849))
(check-sat b_and!17505 (not b_next!9849))
