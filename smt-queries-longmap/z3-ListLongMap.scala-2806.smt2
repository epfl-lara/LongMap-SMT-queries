; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40710 () Bool)

(assert start!40710)

(declare-fun b_free!10735 () Bool)

(declare-fun b_next!10735 () Bool)

(assert (=> start!40710 (= b_free!10735 (not b_next!10735))))

(declare-fun tp!38025 () Bool)

(declare-fun b_and!18757 () Bool)

(assert (=> start!40710 (= tp!38025 b_and!18757)))

(declare-fun b!450855 () Bool)

(declare-fun res!268435 () Bool)

(declare-fun e!264148 () Bool)

(assert (=> b!450855 (=> (not res!268435) (not e!264148))))

(declare-datatypes ((array!27946 0))(
  ( (array!27947 (arr!13418 (Array (_ BitVec 32) (_ BitVec 64))) (size!13770 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27946)

(declare-datatypes ((List!7969 0))(
  ( (Nil!7966) (Cons!7965 (h!8821 (_ BitVec 64)) (t!13723 List!7969)) )
))
(declare-fun arrayNoDuplicates!0 (array!27946 (_ BitVec 32) List!7969) Bool)

(assert (=> b!450855 (= res!268435 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7966))))

(declare-fun b!450856 () Bool)

(declare-fun res!268439 () Bool)

(assert (=> b!450856 (=> (not res!268439) (not e!264148))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450856 (= res!268439 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450857 () Bool)

(declare-fun e!264146 () Bool)

(declare-fun e!264142 () Bool)

(assert (=> b!450857 (= e!264146 e!264142)))

(declare-fun res!268433 () Bool)

(assert (=> b!450857 (=> (not res!268433) (not e!264142))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450857 (= res!268433 (= from!863 i!563))))

(declare-datatypes ((V!17203 0))(
  ( (V!17204 (val!6081 Int)) )
))
(declare-datatypes ((ValueCell!5693 0))(
  ( (ValueCellFull!5693 (v!8337 V!17203)) (EmptyCell!5693) )
))
(declare-datatypes ((array!27948 0))(
  ( (array!27949 (arr!13419 (Array (_ BitVec 32) ValueCell!5693)) (size!13771 (_ BitVec 32))) )
))
(declare-fun lt!204761 () array!27948)

(declare-fun minValue!515 () V!17203)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204766 () array!27946)

(declare-fun zeroValue!515 () V!17203)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7898 0))(
  ( (tuple2!7899 (_1!3960 (_ BitVec 64)) (_2!3960 V!17203)) )
))
(declare-datatypes ((List!7970 0))(
  ( (Nil!7967) (Cons!7966 (h!8822 tuple2!7898) (t!13724 List!7970)) )
))
(declare-datatypes ((ListLongMap!6813 0))(
  ( (ListLongMap!6814 (toList!3422 List!7970)) )
))
(declare-fun lt!204765 () ListLongMap!6813)

(declare-fun getCurrentListMapNoExtraKeys!1651 (array!27946 array!27948 (_ BitVec 32) (_ BitVec 32) V!17203 V!17203 (_ BitVec 32) Int) ListLongMap!6813)

(assert (=> b!450857 (= lt!204765 (getCurrentListMapNoExtraKeys!1651 lt!204766 lt!204761 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27948)

(declare-fun v!412 () V!17203)

(assert (=> b!450857 (= lt!204761 (array!27949 (store (arr!13419 _values!549) i!563 (ValueCellFull!5693 v!412)) (size!13771 _values!549)))))

(declare-fun lt!204763 () ListLongMap!6813)

(assert (=> b!450857 (= lt!204763 (getCurrentListMapNoExtraKeys!1651 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29781 () Bool)

(declare-fun c!55986 () Bool)

(declare-fun call!29784 () ListLongMap!6813)

(assert (=> bm!29781 (= call!29784 (getCurrentListMapNoExtraKeys!1651 (ite c!55986 lt!204766 _keys!709) (ite c!55986 lt!204761 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450858 () Bool)

(declare-fun e!264149 () Bool)

(assert (=> b!450858 (= e!264142 (not e!264149))))

(declare-fun res!268432 () Bool)

(assert (=> b!450858 (=> res!268432 e!264149)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450858 (= res!268432 (validKeyInArray!0 (select (arr!13418 _keys!709) from!863)))))

(declare-fun e!264145 () Bool)

(assert (=> b!450858 e!264145))

(assert (=> b!450858 (= c!55986 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13181 0))(
  ( (Unit!13182) )
))
(declare-fun lt!204764 () Unit!13181)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 (array!27946 array!27948 (_ BitVec 32) (_ BitVec 32) V!17203 V!17203 (_ BitVec 32) (_ BitVec 64) V!17203 (_ BitVec 32) Int) Unit!13181)

(assert (=> b!450858 (= lt!204764 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19743 () Bool)

(declare-fun mapRes!19743 () Bool)

(declare-fun tp!38024 () Bool)

(declare-fun e!264150 () Bool)

(assert (=> mapNonEmpty!19743 (= mapRes!19743 (and tp!38024 e!264150))))

(declare-fun mapRest!19743 () (Array (_ BitVec 32) ValueCell!5693))

(declare-fun mapValue!19743 () ValueCell!5693)

(declare-fun mapKey!19743 () (_ BitVec 32))

(assert (=> mapNonEmpty!19743 (= (arr!13419 _values!549) (store mapRest!19743 mapKey!19743 mapValue!19743))))

(declare-fun b!450859 () Bool)

(declare-fun res!268434 () Bool)

(assert (=> b!450859 (=> (not res!268434) (not e!264148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450859 (= res!268434 (validMask!0 mask!1025))))

(declare-fun b!450860 () Bool)

(declare-fun call!29785 () ListLongMap!6813)

(assert (=> b!450860 (= e!264145 (= call!29785 call!29784))))

(declare-fun b!450861 () Bool)

(declare-fun res!268443 () Bool)

(assert (=> b!450861 (=> (not res!268443) (not e!264148))))

(assert (=> b!450861 (= res!268443 (or (= (select (arr!13418 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13418 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19743 () Bool)

(assert (=> mapIsEmpty!19743 mapRes!19743))

(declare-fun b!450862 () Bool)

(declare-fun res!268442 () Bool)

(assert (=> b!450862 (=> (not res!268442) (not e!264146))))

(assert (=> b!450862 (= res!268442 (arrayNoDuplicates!0 lt!204766 #b00000000000000000000000000000000 Nil!7966))))

(declare-fun b!450863 () Bool)

(declare-fun e!264143 () Bool)

(declare-fun e!264147 () Bool)

(assert (=> b!450863 (= e!264143 (and e!264147 mapRes!19743))))

(declare-fun condMapEmpty!19743 () Bool)

(declare-fun mapDefault!19743 () ValueCell!5693)

(assert (=> b!450863 (= condMapEmpty!19743 (= (arr!13419 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5693)) mapDefault!19743)))))

(declare-fun b!450864 () Bool)

(declare-fun res!268441 () Bool)

(assert (=> b!450864 (=> (not res!268441) (not e!264148))))

(assert (=> b!450864 (= res!268441 (validKeyInArray!0 k0!794))))

(declare-fun res!268440 () Bool)

(assert (=> start!40710 (=> (not res!268440) (not e!264148))))

(assert (=> start!40710 (= res!268440 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13770 _keys!709))))))

(assert (=> start!40710 e!264148))

(declare-fun tp_is_empty!12073 () Bool)

(assert (=> start!40710 tp_is_empty!12073))

(assert (=> start!40710 tp!38025))

(assert (=> start!40710 true))

(declare-fun array_inv!9798 (array!27948) Bool)

(assert (=> start!40710 (and (array_inv!9798 _values!549) e!264143)))

(declare-fun array_inv!9799 (array!27946) Bool)

(assert (=> start!40710 (array_inv!9799 _keys!709)))

(declare-fun b!450865 () Bool)

(assert (=> b!450865 (= e!264149 (bvslt from!863 (size!13771 _values!549)))))

(declare-fun lt!204762 () ListLongMap!6813)

(assert (=> b!450865 (= lt!204762 (getCurrentListMapNoExtraKeys!1651 lt!204766 lt!204761 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450866 () Bool)

(declare-fun res!268430 () Bool)

(assert (=> b!450866 (=> (not res!268430) (not e!264148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27946 (_ BitVec 32)) Bool)

(assert (=> b!450866 (= res!268430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450867 () Bool)

(assert (=> b!450867 (= e!264150 tp_is_empty!12073)))

(declare-fun bm!29782 () Bool)

(assert (=> bm!29782 (= call!29785 (getCurrentListMapNoExtraKeys!1651 (ite c!55986 _keys!709 lt!204766) (ite c!55986 _values!549 lt!204761) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450868 () Bool)

(declare-fun res!268437 () Bool)

(assert (=> b!450868 (=> (not res!268437) (not e!264148))))

(assert (=> b!450868 (= res!268437 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13770 _keys!709))))))

(declare-fun b!450869 () Bool)

(declare-fun +!1550 (ListLongMap!6813 tuple2!7898) ListLongMap!6813)

(assert (=> b!450869 (= e!264145 (= call!29784 (+!1550 call!29785 (tuple2!7899 k0!794 v!412))))))

(declare-fun b!450870 () Bool)

(assert (=> b!450870 (= e!264147 tp_is_empty!12073)))

(declare-fun b!450871 () Bool)

(assert (=> b!450871 (= e!264148 e!264146)))

(declare-fun res!268438 () Bool)

(assert (=> b!450871 (=> (not res!268438) (not e!264146))))

(assert (=> b!450871 (= res!268438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204766 mask!1025))))

(assert (=> b!450871 (= lt!204766 (array!27947 (store (arr!13418 _keys!709) i!563 k0!794) (size!13770 _keys!709)))))

(declare-fun b!450872 () Bool)

(declare-fun res!268431 () Bool)

(assert (=> b!450872 (=> (not res!268431) (not e!264146))))

(assert (=> b!450872 (= res!268431 (bvsle from!863 i!563))))

(declare-fun b!450873 () Bool)

(declare-fun res!268436 () Bool)

(assert (=> b!450873 (=> (not res!268436) (not e!264148))))

(assert (=> b!450873 (= res!268436 (and (= (size!13771 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13770 _keys!709) (size!13771 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40710 res!268440) b!450859))

(assert (= (and b!450859 res!268434) b!450873))

(assert (= (and b!450873 res!268436) b!450866))

(assert (= (and b!450866 res!268430) b!450855))

(assert (= (and b!450855 res!268435) b!450868))

(assert (= (and b!450868 res!268437) b!450864))

(assert (= (and b!450864 res!268441) b!450861))

(assert (= (and b!450861 res!268443) b!450856))

(assert (= (and b!450856 res!268439) b!450871))

(assert (= (and b!450871 res!268438) b!450862))

(assert (= (and b!450862 res!268442) b!450872))

(assert (= (and b!450872 res!268431) b!450857))

(assert (= (and b!450857 res!268433) b!450858))

(assert (= (and b!450858 c!55986) b!450869))

(assert (= (and b!450858 (not c!55986)) b!450860))

(assert (= (or b!450869 b!450860) bm!29781))

(assert (= (or b!450869 b!450860) bm!29782))

(assert (= (and b!450858 (not res!268432)) b!450865))

(assert (= (and b!450863 condMapEmpty!19743) mapIsEmpty!19743))

(assert (= (and b!450863 (not condMapEmpty!19743)) mapNonEmpty!19743))

(get-info :version)

(assert (= (and mapNonEmpty!19743 ((_ is ValueCellFull!5693) mapValue!19743)) b!450867))

(assert (= (and b!450863 ((_ is ValueCellFull!5693) mapDefault!19743)) b!450870))

(assert (= start!40710 b!450863))

(declare-fun m!434907 () Bool)

(assert (=> b!450857 m!434907))

(declare-fun m!434909 () Bool)

(assert (=> b!450857 m!434909))

(declare-fun m!434911 () Bool)

(assert (=> b!450857 m!434911))

(declare-fun m!434913 () Bool)

(assert (=> b!450864 m!434913))

(declare-fun m!434915 () Bool)

(assert (=> b!450855 m!434915))

(declare-fun m!434917 () Bool)

(assert (=> b!450871 m!434917))

(declare-fun m!434919 () Bool)

(assert (=> b!450871 m!434919))

(declare-fun m!434921 () Bool)

(assert (=> b!450858 m!434921))

(assert (=> b!450858 m!434921))

(declare-fun m!434923 () Bool)

(assert (=> b!450858 m!434923))

(declare-fun m!434925 () Bool)

(assert (=> b!450858 m!434925))

(declare-fun m!434927 () Bool)

(assert (=> b!450859 m!434927))

(declare-fun m!434929 () Bool)

(assert (=> b!450861 m!434929))

(declare-fun m!434931 () Bool)

(assert (=> b!450866 m!434931))

(declare-fun m!434933 () Bool)

(assert (=> bm!29781 m!434933))

(declare-fun m!434935 () Bool)

(assert (=> b!450865 m!434935))

(declare-fun m!434937 () Bool)

(assert (=> mapNonEmpty!19743 m!434937))

(declare-fun m!434939 () Bool)

(assert (=> start!40710 m!434939))

(declare-fun m!434941 () Bool)

(assert (=> start!40710 m!434941))

(declare-fun m!434943 () Bool)

(assert (=> bm!29782 m!434943))

(declare-fun m!434945 () Bool)

(assert (=> b!450869 m!434945))

(declare-fun m!434947 () Bool)

(assert (=> b!450862 m!434947))

(declare-fun m!434949 () Bool)

(assert (=> b!450856 m!434949))

(check-sat tp_is_empty!12073 (not b!450862) (not b!450869) (not b!450871) (not bm!29782) (not b!450855) (not b!450865) (not b!450864) b_and!18757 (not bm!29781) (not b!450859) (not b!450856) (not b!450866) (not mapNonEmpty!19743) (not b!450858) (not start!40710) (not b_next!10735) (not b!450857))
(check-sat b_and!18757 (not b_next!10735))
