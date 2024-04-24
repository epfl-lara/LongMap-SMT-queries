; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39614 () Bool)

(assert start!39614)

(declare-fun b_free!9895 () Bool)

(declare-fun b_next!9895 () Bool)

(assert (=> start!39614 (= b_free!9895 (not b_next!9895))))

(declare-fun tp!35213 () Bool)

(declare-fun b_and!17565 () Bool)

(assert (=> start!39614 (= tp!35213 b_and!17565)))

(declare-fun b!424846 () Bool)

(declare-fun res!248649 () Bool)

(declare-fun e!252298 () Bool)

(assert (=> b!424846 (=> (not res!248649) (not e!252298))))

(declare-datatypes ((array!25940 0))(
  ( (array!25941 (arr!12419 (Array (_ BitVec 32) (_ BitVec 64))) (size!12771 (_ BitVec 32))) )
))
(declare-fun lt!194500 () array!25940)

(declare-datatypes ((List!7211 0))(
  ( (Nil!7208) (Cons!7207 (h!8063 (_ BitVec 64)) (t!12647 List!7211)) )
))
(declare-fun arrayNoDuplicates!0 (array!25940 (_ BitVec 32) List!7211) Bool)

(assert (=> b!424846 (= res!248649 (arrayNoDuplicates!0 lt!194500 #b00000000000000000000000000000000 Nil!7208))))

(declare-fun b!424847 () Bool)

(declare-fun res!248645 () Bool)

(assert (=> b!424847 (=> (not res!248645) (not e!252298))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424847 (= res!248645 (bvsle from!863 i!563))))

(declare-fun b!424848 () Bool)

(declare-fun e!252295 () Bool)

(assert (=> b!424848 (= e!252298 e!252295)))

(declare-fun res!248641 () Bool)

(assert (=> b!424848 (=> (not res!248641) (not e!252295))))

(assert (=> b!424848 (= res!248641 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15835 0))(
  ( (V!15836 (val!5568 Int)) )
))
(declare-datatypes ((tuple2!7204 0))(
  ( (tuple2!7205 (_1!3613 (_ BitVec 64)) (_2!3613 V!15835)) )
))
(declare-datatypes ((List!7212 0))(
  ( (Nil!7209) (Cons!7208 (h!8064 tuple2!7204) (t!12648 List!7212)) )
))
(declare-datatypes ((ListLongMap!6119 0))(
  ( (ListLongMap!6120 (toList!3075 List!7212)) )
))
(declare-fun lt!194499 () ListLongMap!6119)

(declare-fun minValue!515 () V!15835)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15835)

(declare-datatypes ((ValueCell!5180 0))(
  ( (ValueCellFull!5180 (v!7816 V!15835)) (EmptyCell!5180) )
))
(declare-datatypes ((array!25942 0))(
  ( (array!25943 (arr!12420 (Array (_ BitVec 32) ValueCell!5180)) (size!12772 (_ BitVec 32))) )
))
(declare-fun lt!194501 () array!25942)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1321 (array!25940 array!25942 (_ BitVec 32) (_ BitVec 32) V!15835 V!15835 (_ BitVec 32) Int) ListLongMap!6119)

(assert (=> b!424848 (= lt!194499 (getCurrentListMapNoExtraKeys!1321 lt!194500 lt!194501 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25942)

(declare-fun v!412 () V!15835)

(assert (=> b!424848 (= lt!194501 (array!25943 (store (arr!12420 _values!549) i!563 (ValueCellFull!5180 v!412)) (size!12772 _values!549)))))

(declare-fun lt!194498 () ListLongMap!6119)

(declare-fun _keys!709 () array!25940)

(assert (=> b!424848 (= lt!194498 (getCurrentListMapNoExtraKeys!1321 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424849 () Bool)

(declare-fun res!248643 () Bool)

(declare-fun e!252297 () Bool)

(assert (=> b!424849 (=> (not res!248643) (not e!252297))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424849 (= res!248643 (validKeyInArray!0 k0!794))))

(declare-fun b!424850 () Bool)

(declare-fun e!252293 () Bool)

(declare-fun e!252292 () Bool)

(declare-fun mapRes!18192 () Bool)

(assert (=> b!424850 (= e!252293 (and e!252292 mapRes!18192))))

(declare-fun condMapEmpty!18192 () Bool)

(declare-fun mapDefault!18192 () ValueCell!5180)

(assert (=> b!424850 (= condMapEmpty!18192 (= (arr!12420 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5180)) mapDefault!18192)))))

(declare-fun b!424851 () Bool)

(declare-fun e!252294 () Bool)

(declare-fun tp_is_empty!11047 () Bool)

(assert (=> b!424851 (= e!252294 tp_is_empty!11047)))

(declare-fun b!424852 () Bool)

(declare-fun res!248646 () Bool)

(assert (=> b!424852 (=> (not res!248646) (not e!252297))))

(assert (=> b!424852 (= res!248646 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7208))))

(declare-fun res!248652 () Bool)

(assert (=> start!39614 (=> (not res!248652) (not e!252297))))

(assert (=> start!39614 (= res!248652 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12771 _keys!709))))))

(assert (=> start!39614 e!252297))

(assert (=> start!39614 tp_is_empty!11047))

(assert (=> start!39614 tp!35213))

(assert (=> start!39614 true))

(declare-fun array_inv!9122 (array!25942) Bool)

(assert (=> start!39614 (and (array_inv!9122 _values!549) e!252293)))

(declare-fun array_inv!9123 (array!25940) Bool)

(assert (=> start!39614 (array_inv!9123 _keys!709)))

(declare-fun b!424853 () Bool)

(assert (=> b!424853 (= e!252292 tp_is_empty!11047)))

(declare-fun b!424854 () Bool)

(declare-fun res!248642 () Bool)

(assert (=> b!424854 (=> (not res!248642) (not e!252297))))

(assert (=> b!424854 (= res!248642 (or (= (select (arr!12419 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12419 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424855 () Bool)

(declare-fun res!248650 () Bool)

(assert (=> b!424855 (=> (not res!248650) (not e!252297))))

(assert (=> b!424855 (= res!248650 (and (= (size!12772 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12771 _keys!709) (size!12772 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424856 () Bool)

(declare-fun res!248640 () Bool)

(assert (=> b!424856 (=> (not res!248640) (not e!252297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25940 (_ BitVec 32)) Bool)

(assert (=> b!424856 (= res!248640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424857 () Bool)

(declare-fun res!248648 () Bool)

(assert (=> b!424857 (=> (not res!248648) (not e!252297))))

(assert (=> b!424857 (= res!248648 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12771 _keys!709))))))

(declare-fun b!424858 () Bool)

(assert (=> b!424858 (= e!252297 e!252298)))

(declare-fun res!248644 () Bool)

(assert (=> b!424858 (=> (not res!248644) (not e!252298))))

(assert (=> b!424858 (= res!248644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194500 mask!1025))))

(assert (=> b!424858 (= lt!194500 (array!25941 (store (arr!12419 _keys!709) i!563 k0!794) (size!12771 _keys!709)))))

(declare-fun mapNonEmpty!18192 () Bool)

(declare-fun tp!35214 () Bool)

(assert (=> mapNonEmpty!18192 (= mapRes!18192 (and tp!35214 e!252294))))

(declare-fun mapRest!18192 () (Array (_ BitVec 32) ValueCell!5180))

(declare-fun mapValue!18192 () ValueCell!5180)

(declare-fun mapKey!18192 () (_ BitVec 32))

(assert (=> mapNonEmpty!18192 (= (arr!12420 _values!549) (store mapRest!18192 mapKey!18192 mapValue!18192))))

(declare-fun b!424859 () Bool)

(assert (=> b!424859 (= e!252295 (not true))))

(declare-fun +!1294 (ListLongMap!6119 tuple2!7204) ListLongMap!6119)

(assert (=> b!424859 (= (getCurrentListMapNoExtraKeys!1321 lt!194500 lt!194501 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1294 (getCurrentListMapNoExtraKeys!1321 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7205 k0!794 v!412)))))

(declare-datatypes ((Unit!12463 0))(
  ( (Unit!12464) )
))
(declare-fun lt!194502 () Unit!12463)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!478 (array!25940 array!25942 (_ BitVec 32) (_ BitVec 32) V!15835 V!15835 (_ BitVec 32) (_ BitVec 64) V!15835 (_ BitVec 32) Int) Unit!12463)

(assert (=> b!424859 (= lt!194502 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!478 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424860 () Bool)

(declare-fun res!248647 () Bool)

(assert (=> b!424860 (=> (not res!248647) (not e!252297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424860 (= res!248647 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18192 () Bool)

(assert (=> mapIsEmpty!18192 mapRes!18192))

(declare-fun b!424861 () Bool)

(declare-fun res!248651 () Bool)

(assert (=> b!424861 (=> (not res!248651) (not e!252297))))

(declare-fun arrayContainsKey!0 (array!25940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424861 (= res!248651 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39614 res!248652) b!424860))

(assert (= (and b!424860 res!248647) b!424855))

(assert (= (and b!424855 res!248650) b!424856))

(assert (= (and b!424856 res!248640) b!424852))

(assert (= (and b!424852 res!248646) b!424857))

(assert (= (and b!424857 res!248648) b!424849))

(assert (= (and b!424849 res!248643) b!424854))

(assert (= (and b!424854 res!248642) b!424861))

(assert (= (and b!424861 res!248651) b!424858))

(assert (= (and b!424858 res!248644) b!424846))

(assert (= (and b!424846 res!248649) b!424847))

(assert (= (and b!424847 res!248645) b!424848))

(assert (= (and b!424848 res!248641) b!424859))

(assert (= (and b!424850 condMapEmpty!18192) mapIsEmpty!18192))

(assert (= (and b!424850 (not condMapEmpty!18192)) mapNonEmpty!18192))

(get-info :version)

(assert (= (and mapNonEmpty!18192 ((_ is ValueCellFull!5180) mapValue!18192)) b!424851))

(assert (= (and b!424850 ((_ is ValueCellFull!5180) mapDefault!18192)) b!424853))

(assert (= start!39614 b!424850))

(declare-fun m!414125 () Bool)

(assert (=> b!424856 m!414125))

(declare-fun m!414127 () Bool)

(assert (=> b!424860 m!414127))

(declare-fun m!414129 () Bool)

(assert (=> b!424846 m!414129))

(declare-fun m!414131 () Bool)

(assert (=> b!424849 m!414131))

(declare-fun m!414133 () Bool)

(assert (=> b!424854 m!414133))

(declare-fun m!414135 () Bool)

(assert (=> b!424848 m!414135))

(declare-fun m!414137 () Bool)

(assert (=> b!424848 m!414137))

(declare-fun m!414139 () Bool)

(assert (=> b!424848 m!414139))

(declare-fun m!414141 () Bool)

(assert (=> b!424859 m!414141))

(declare-fun m!414143 () Bool)

(assert (=> b!424859 m!414143))

(assert (=> b!424859 m!414143))

(declare-fun m!414145 () Bool)

(assert (=> b!424859 m!414145))

(declare-fun m!414147 () Bool)

(assert (=> b!424859 m!414147))

(declare-fun m!414149 () Bool)

(assert (=> start!39614 m!414149))

(declare-fun m!414151 () Bool)

(assert (=> start!39614 m!414151))

(declare-fun m!414153 () Bool)

(assert (=> mapNonEmpty!18192 m!414153))

(declare-fun m!414155 () Bool)

(assert (=> b!424858 m!414155))

(declare-fun m!414157 () Bool)

(assert (=> b!424858 m!414157))

(declare-fun m!414159 () Bool)

(assert (=> b!424852 m!414159))

(declare-fun m!414161 () Bool)

(assert (=> b!424861 m!414161))

(check-sat (not b!424846) (not b!424856) (not b!424858) tp_is_empty!11047 (not b!424849) (not b!424861) (not b!424852) (not b_next!9895) b_and!17565 (not mapNonEmpty!18192) (not b!424859) (not b!424848) (not b!424860) (not start!39614))
(check-sat b_and!17565 (not b_next!9895))
