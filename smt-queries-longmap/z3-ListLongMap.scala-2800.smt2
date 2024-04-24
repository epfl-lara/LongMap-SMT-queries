; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40674 () Bool)

(assert start!40674)

(declare-fun b_free!10699 () Bool)

(declare-fun b_next!10699 () Bool)

(assert (=> start!40674 (= b_free!10699 (not b_next!10699))))

(declare-fun tp!37916 () Bool)

(declare-fun b_and!18721 () Bool)

(assert (=> start!40674 (= tp!37916 b_and!18721)))

(declare-datatypes ((array!27874 0))(
  ( (array!27875 (arr!13382 (Array (_ BitVec 32) (_ BitVec 64))) (size!13734 (_ BitVec 32))) )
))
(declare-fun lt!204482 () array!27874)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17155 0))(
  ( (V!17156 (val!6063 Int)) )
))
(declare-datatypes ((ValueCell!5675 0))(
  ( (ValueCellFull!5675 (v!8319 V!17155)) (EmptyCell!5675) )
))
(declare-datatypes ((array!27876 0))(
  ( (array!27877 (arr!13383 (Array (_ BitVec 32) ValueCell!5675)) (size!13735 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27876)

(declare-fun lt!204480 () array!27876)

(declare-fun zeroValue!515 () V!17155)

(declare-fun c!55932 () Bool)

(declare-fun bm!29673 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27874)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17155)

(declare-datatypes ((tuple2!7864 0))(
  ( (tuple2!7865 (_1!3943 (_ BitVec 64)) (_2!3943 V!17155)) )
))
(declare-datatypes ((List!7936 0))(
  ( (Nil!7933) (Cons!7932 (h!8788 tuple2!7864) (t!13690 List!7936)) )
))
(declare-datatypes ((ListLongMap!6779 0))(
  ( (ListLongMap!6780 (toList!3405 List!7936)) )
))
(declare-fun call!29676 () ListLongMap!6779)

(declare-fun getCurrentListMapNoExtraKeys!1635 (array!27874 array!27876 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) Int) ListLongMap!6779)

(assert (=> bm!29673 (= call!29676 (getCurrentListMapNoExtraKeys!1635 (ite c!55932 _keys!709 lt!204482) (ite c!55932 _values!549 lt!204480) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449854 () Bool)

(declare-fun res!267703 () Bool)

(declare-fun e!263684 () Bool)

(assert (=> b!449854 (=> (not res!267703) (not e!263684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449854 (= res!267703 (validMask!0 mask!1025))))

(declare-fun call!29677 () ListLongMap!6779)

(declare-fun b!449855 () Bool)

(declare-fun v!412 () V!17155)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!263687 () Bool)

(declare-fun +!1537 (ListLongMap!6779 tuple2!7864) ListLongMap!6779)

(assert (=> b!449855 (= e!263687 (= call!29677 (+!1537 call!29676 (tuple2!7865 k0!794 v!412))))))

(declare-fun b!449856 () Bool)

(declare-fun res!267708 () Bool)

(assert (=> b!449856 (=> (not res!267708) (not e!263684))))

(assert (=> b!449856 (= res!267708 (and (= (size!13735 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13734 _keys!709) (size!13735 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!267701 () Bool)

(assert (=> start!40674 (=> (not res!267701) (not e!263684))))

(assert (=> start!40674 (= res!267701 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13734 _keys!709))))))

(assert (=> start!40674 e!263684))

(declare-fun tp_is_empty!12037 () Bool)

(assert (=> start!40674 tp_is_empty!12037))

(assert (=> start!40674 tp!37916))

(assert (=> start!40674 true))

(declare-fun e!263683 () Bool)

(declare-fun array_inv!9772 (array!27876) Bool)

(assert (=> start!40674 (and (array_inv!9772 _values!549) e!263683)))

(declare-fun array_inv!9773 (array!27874) Bool)

(assert (=> start!40674 (array_inv!9773 _keys!709)))

(declare-fun b!449857 () Bool)

(declare-fun e!263681 () Bool)

(assert (=> b!449857 (= e!263681 (not (bvslt from!863 (size!13734 _keys!709))))))

(assert (=> b!449857 e!263687))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449857 (= c!55932 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13155 0))(
  ( (Unit!13156) )
))
(declare-fun lt!204481 () Unit!13155)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 (array!27874 array!27876 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) (_ BitVec 64) V!17155 (_ BitVec 32) Int) Unit!13155)

(assert (=> b!449857 (= lt!204481 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449858 () Bool)

(declare-fun res!267707 () Bool)

(declare-fun e!263688 () Bool)

(assert (=> b!449858 (=> (not res!267707) (not e!263688))))

(assert (=> b!449858 (= res!267707 (bvsle from!863 i!563))))

(declare-fun b!449859 () Bool)

(assert (=> b!449859 (= e!263687 (= call!29676 call!29677))))

(declare-fun b!449860 () Bool)

(declare-fun e!263682 () Bool)

(declare-fun mapRes!19689 () Bool)

(assert (=> b!449860 (= e!263683 (and e!263682 mapRes!19689))))

(declare-fun condMapEmpty!19689 () Bool)

(declare-fun mapDefault!19689 () ValueCell!5675)

(assert (=> b!449860 (= condMapEmpty!19689 (= (arr!13383 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5675)) mapDefault!19689)))))

(declare-fun b!449861 () Bool)

(declare-fun res!267709 () Bool)

(assert (=> b!449861 (=> (not res!267709) (not e!263684))))

(assert (=> b!449861 (= res!267709 (or (= (select (arr!13382 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13382 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449862 () Bool)

(declare-fun res!267705 () Bool)

(assert (=> b!449862 (=> (not res!267705) (not e!263688))))

(declare-datatypes ((List!7937 0))(
  ( (Nil!7934) (Cons!7933 (h!8789 (_ BitVec 64)) (t!13691 List!7937)) )
))
(declare-fun arrayNoDuplicates!0 (array!27874 (_ BitVec 32) List!7937) Bool)

(assert (=> b!449862 (= res!267705 (arrayNoDuplicates!0 lt!204482 #b00000000000000000000000000000000 Nil!7934))))

(declare-fun b!449863 () Bool)

(assert (=> b!449863 (= e!263682 tp_is_empty!12037)))

(declare-fun b!449864 () Bool)

(declare-fun res!267704 () Bool)

(assert (=> b!449864 (=> (not res!267704) (not e!263684))))

(declare-fun arrayContainsKey!0 (array!27874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449864 (= res!267704 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449865 () Bool)

(declare-fun e!263685 () Bool)

(assert (=> b!449865 (= e!263685 tp_is_empty!12037)))

(declare-fun mapIsEmpty!19689 () Bool)

(assert (=> mapIsEmpty!19689 mapRes!19689))

(declare-fun b!449866 () Bool)

(declare-fun res!267711 () Bool)

(assert (=> b!449866 (=> (not res!267711) (not e!263684))))

(assert (=> b!449866 (= res!267711 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7934))))

(declare-fun mapNonEmpty!19689 () Bool)

(declare-fun tp!37917 () Bool)

(assert (=> mapNonEmpty!19689 (= mapRes!19689 (and tp!37917 e!263685))))

(declare-fun mapRest!19689 () (Array (_ BitVec 32) ValueCell!5675))

(declare-fun mapKey!19689 () (_ BitVec 32))

(declare-fun mapValue!19689 () ValueCell!5675)

(assert (=> mapNonEmpty!19689 (= (arr!13383 _values!549) (store mapRest!19689 mapKey!19689 mapValue!19689))))

(declare-fun b!449867 () Bool)

(assert (=> b!449867 (= e!263688 e!263681)))

(declare-fun res!267710 () Bool)

(assert (=> b!449867 (=> (not res!267710) (not e!263681))))

(assert (=> b!449867 (= res!267710 (= from!863 i!563))))

(declare-fun lt!204484 () ListLongMap!6779)

(assert (=> b!449867 (= lt!204484 (getCurrentListMapNoExtraKeys!1635 lt!204482 lt!204480 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449867 (= lt!204480 (array!27877 (store (arr!13383 _values!549) i!563 (ValueCellFull!5675 v!412)) (size!13735 _values!549)))))

(declare-fun lt!204483 () ListLongMap!6779)

(assert (=> b!449867 (= lt!204483 (getCurrentListMapNoExtraKeys!1635 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449868 () Bool)

(declare-fun res!267706 () Bool)

(assert (=> b!449868 (=> (not res!267706) (not e!263684))))

(assert (=> b!449868 (= res!267706 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13734 _keys!709))))))

(declare-fun b!449869 () Bool)

(declare-fun res!267702 () Bool)

(assert (=> b!449869 (=> (not res!267702) (not e!263684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27874 (_ BitVec 32)) Bool)

(assert (=> b!449869 (= res!267702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449870 () Bool)

(declare-fun res!267700 () Bool)

(assert (=> b!449870 (=> (not res!267700) (not e!263684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449870 (= res!267700 (validKeyInArray!0 k0!794))))

(declare-fun bm!29674 () Bool)

(assert (=> bm!29674 (= call!29677 (getCurrentListMapNoExtraKeys!1635 (ite c!55932 lt!204482 _keys!709) (ite c!55932 lt!204480 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449871 () Bool)

(assert (=> b!449871 (= e!263684 e!263688)))

(declare-fun res!267699 () Bool)

(assert (=> b!449871 (=> (not res!267699) (not e!263688))))

(assert (=> b!449871 (= res!267699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204482 mask!1025))))

(assert (=> b!449871 (= lt!204482 (array!27875 (store (arr!13382 _keys!709) i!563 k0!794) (size!13734 _keys!709)))))

(assert (= (and start!40674 res!267701) b!449854))

(assert (= (and b!449854 res!267703) b!449856))

(assert (= (and b!449856 res!267708) b!449869))

(assert (= (and b!449869 res!267702) b!449866))

(assert (= (and b!449866 res!267711) b!449868))

(assert (= (and b!449868 res!267706) b!449870))

(assert (= (and b!449870 res!267700) b!449861))

(assert (= (and b!449861 res!267709) b!449864))

(assert (= (and b!449864 res!267704) b!449871))

(assert (= (and b!449871 res!267699) b!449862))

(assert (= (and b!449862 res!267705) b!449858))

(assert (= (and b!449858 res!267707) b!449867))

(assert (= (and b!449867 res!267710) b!449857))

(assert (= (and b!449857 c!55932) b!449855))

(assert (= (and b!449857 (not c!55932)) b!449859))

(assert (= (or b!449855 b!449859) bm!29674))

(assert (= (or b!449855 b!449859) bm!29673))

(assert (= (and b!449860 condMapEmpty!19689) mapIsEmpty!19689))

(assert (= (and b!449860 (not condMapEmpty!19689)) mapNonEmpty!19689))

(get-info :version)

(assert (= (and mapNonEmpty!19689 ((_ is ValueCellFull!5675) mapValue!19689)) b!449865))

(assert (= (and b!449860 ((_ is ValueCellFull!5675) mapDefault!19689)) b!449863))

(assert (= start!40674 b!449860))

(declare-fun m!434181 () Bool)

(assert (=> b!449864 m!434181))

(declare-fun m!434183 () Bool)

(assert (=> mapNonEmpty!19689 m!434183))

(declare-fun m!434185 () Bool)

(assert (=> start!40674 m!434185))

(declare-fun m!434187 () Bool)

(assert (=> start!40674 m!434187))

(declare-fun m!434189 () Bool)

(assert (=> b!449854 m!434189))

(declare-fun m!434191 () Bool)

(assert (=> b!449861 m!434191))

(declare-fun m!434193 () Bool)

(assert (=> b!449855 m!434193))

(declare-fun m!434195 () Bool)

(assert (=> bm!29673 m!434195))

(declare-fun m!434197 () Bool)

(assert (=> b!449866 m!434197))

(declare-fun m!434199 () Bool)

(assert (=> b!449869 m!434199))

(declare-fun m!434201 () Bool)

(assert (=> b!449867 m!434201))

(declare-fun m!434203 () Bool)

(assert (=> b!449867 m!434203))

(declare-fun m!434205 () Bool)

(assert (=> b!449867 m!434205))

(declare-fun m!434207 () Bool)

(assert (=> bm!29674 m!434207))

(declare-fun m!434209 () Bool)

(assert (=> b!449862 m!434209))

(declare-fun m!434211 () Bool)

(assert (=> b!449857 m!434211))

(declare-fun m!434213 () Bool)

(assert (=> b!449871 m!434213))

(declare-fun m!434215 () Bool)

(assert (=> b!449871 m!434215))

(declare-fun m!434217 () Bool)

(assert (=> b!449870 m!434217))

(check-sat (not bm!29674) (not b!449870) (not b_next!10699) (not b!449871) (not b!449867) (not b!449866) (not b!449864) b_and!18721 (not b!449857) (not start!40674) (not bm!29673) (not b!449855) (not b!449854) tp_is_empty!12037 (not mapNonEmpty!19689) (not b!449869) (not b!449862))
(check-sat b_and!18721 (not b_next!10699))
