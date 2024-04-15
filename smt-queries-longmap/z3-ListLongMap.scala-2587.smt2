; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39326 () Bool)

(assert start!39326)

(declare-fun b_free!9607 () Bool)

(declare-fun b_next!9607 () Bool)

(assert (=> start!39326 (= b_free!9607 (not b_next!9607))))

(declare-fun tp!34350 () Bool)

(declare-fun b_and!17063 () Bool)

(assert (=> start!39326 (= tp!34350 b_and!17063)))

(declare-fun mapIsEmpty!17760 () Bool)

(declare-fun mapRes!17760 () Bool)

(assert (=> mapIsEmpty!17760 mapRes!17760))

(declare-fun b!416923 () Bool)

(declare-fun res!242811 () Bool)

(declare-fun e!248771 () Bool)

(assert (=> b!416923 (=> (not res!242811) (not e!248771))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25361 0))(
  ( (array!25362 (arr!12130 (Array (_ BitVec 32) (_ BitVec 64))) (size!12483 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25361)

(assert (=> b!416923 (= res!242811 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12483 _keys!709))))))

(declare-fun b!416924 () Bool)

(declare-fun e!248775 () Bool)

(declare-datatypes ((V!15451 0))(
  ( (V!15452 (val!5424 Int)) )
))
(declare-datatypes ((tuple2!7064 0))(
  ( (tuple2!7065 (_1!3543 (_ BitVec 64)) (_2!3543 V!15451)) )
))
(declare-datatypes ((List!7065 0))(
  ( (Nil!7062) (Cons!7061 (h!7917 tuple2!7064) (t!12328 List!7065)) )
))
(declare-datatypes ((ListLongMap!5967 0))(
  ( (ListLongMap!5968 (toList!2999 List!7065)) )
))
(declare-fun call!28975 () ListLongMap!5967)

(declare-fun call!28974 () ListLongMap!5967)

(assert (=> b!416924 (= e!248775 (= call!28975 call!28974))))

(declare-fun b!416925 () Bool)

(declare-fun res!242806 () Bool)

(assert (=> b!416925 (=> (not res!242806) (not e!248771))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416925 (= res!242806 (validKeyInArray!0 k0!794))))

(declare-fun minValue!515 () V!15451)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5036 0))(
  ( (ValueCellFull!5036 (v!7665 V!15451)) (EmptyCell!5036) )
))
(declare-datatypes ((array!25363 0))(
  ( (array!25364 (arr!12131 (Array (_ BitVec 32) ValueCell!5036)) (size!12484 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25363)

(declare-fun lt!190859 () array!25363)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55053 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15451)

(declare-fun lt!190863 () array!25361)

(declare-fun bm!28971 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1210 (array!25361 array!25363 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) Int) ListLongMap!5967)

(assert (=> bm!28971 (= call!28974 (getCurrentListMapNoExtraKeys!1210 (ite c!55053 lt!190863 _keys!709) (ite c!55053 lt!190859 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17760 () Bool)

(declare-fun tp!34349 () Bool)

(declare-fun e!248777 () Bool)

(assert (=> mapNonEmpty!17760 (= mapRes!17760 (and tp!34349 e!248777))))

(declare-fun mapValue!17760 () ValueCell!5036)

(declare-fun mapKey!17760 () (_ BitVec 32))

(declare-fun mapRest!17760 () (Array (_ BitVec 32) ValueCell!5036))

(assert (=> mapNonEmpty!17760 (= (arr!12131 _values!549) (store mapRest!17760 mapKey!17760 mapValue!17760))))

(declare-fun b!416926 () Bool)

(declare-fun e!248778 () Bool)

(declare-fun e!248773 () Bool)

(assert (=> b!416926 (= e!248778 (not e!248773))))

(declare-fun res!242814 () Bool)

(assert (=> b!416926 (=> res!242814 e!248773)))

(assert (=> b!416926 (= res!242814 (validKeyInArray!0 (select (arr!12130 _keys!709) from!863)))))

(assert (=> b!416926 e!248775))

(assert (=> b!416926 (= c!55053 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12298 0))(
  ( (Unit!12299) )
))
(declare-fun lt!190855 () Unit!12298)

(declare-fun v!412 () V!15451)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!407 (array!25361 array!25363 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) (_ BitVec 64) V!15451 (_ BitVec 32) Int) Unit!12298)

(assert (=> b!416926 (= lt!190855 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416927 () Bool)

(assert (=> b!416927 (= e!248773 true)))

(declare-fun lt!190857 () tuple2!7064)

(declare-fun lt!190860 () ListLongMap!5967)

(declare-fun lt!190864 () V!15451)

(declare-fun +!1228 (ListLongMap!5967 tuple2!7064) ListLongMap!5967)

(assert (=> b!416927 (= (+!1228 lt!190860 lt!190857) (+!1228 (+!1228 lt!190860 (tuple2!7065 k0!794 lt!190864)) lt!190857))))

(declare-fun lt!190865 () V!15451)

(assert (=> b!416927 (= lt!190857 (tuple2!7065 k0!794 lt!190865))))

(declare-fun lt!190856 () Unit!12298)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!17 (ListLongMap!5967 (_ BitVec 64) V!15451 V!15451) Unit!12298)

(assert (=> b!416927 (= lt!190856 (addSameAsAddTwiceSameKeyDiffValues!17 lt!190860 k0!794 lt!190864 lt!190865))))

(declare-fun lt!190858 () V!15451)

(declare-fun get!5994 (ValueCell!5036 V!15451) V!15451)

(assert (=> b!416927 (= lt!190864 (get!5994 (select (arr!12131 _values!549) from!863) lt!190858))))

(declare-fun lt!190861 () ListLongMap!5967)

(assert (=> b!416927 (= lt!190861 (+!1228 lt!190860 (tuple2!7065 (select (arr!12130 lt!190863) from!863) lt!190865)))))

(assert (=> b!416927 (= lt!190865 (get!5994 (select (store (arr!12131 _values!549) i!563 (ValueCellFull!5036 v!412)) from!863) lt!190858))))

(declare-fun dynLambda!674 (Int (_ BitVec 64)) V!15451)

(assert (=> b!416927 (= lt!190858 (dynLambda!674 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416927 (= lt!190860 (getCurrentListMapNoExtraKeys!1210 lt!190863 lt!190859 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416928 () Bool)

(declare-fun res!242807 () Bool)

(declare-fun e!248776 () Bool)

(assert (=> b!416928 (=> (not res!242807) (not e!248776))))

(declare-datatypes ((List!7066 0))(
  ( (Nil!7063) (Cons!7062 (h!7918 (_ BitVec 64)) (t!12329 List!7066)) )
))
(declare-fun arrayNoDuplicates!0 (array!25361 (_ BitVec 32) List!7066) Bool)

(assert (=> b!416928 (= res!242807 (arrayNoDuplicates!0 lt!190863 #b00000000000000000000000000000000 Nil!7063))))

(declare-fun b!416930 () Bool)

(declare-fun tp_is_empty!10759 () Bool)

(assert (=> b!416930 (= e!248777 tp_is_empty!10759)))

(declare-fun b!416931 () Bool)

(declare-fun res!242804 () Bool)

(assert (=> b!416931 (=> (not res!242804) (not e!248776))))

(assert (=> b!416931 (= res!242804 (bvsle from!863 i!563))))

(declare-fun b!416932 () Bool)

(declare-fun e!248774 () Bool)

(declare-fun e!248770 () Bool)

(assert (=> b!416932 (= e!248774 (and e!248770 mapRes!17760))))

(declare-fun condMapEmpty!17760 () Bool)

(declare-fun mapDefault!17760 () ValueCell!5036)

(assert (=> b!416932 (= condMapEmpty!17760 (= (arr!12131 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5036)) mapDefault!17760)))))

(declare-fun b!416933 () Bool)

(declare-fun res!242803 () Bool)

(assert (=> b!416933 (=> (not res!242803) (not e!248771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416933 (= res!242803 (validMask!0 mask!1025))))

(declare-fun b!416934 () Bool)

(assert (=> b!416934 (= e!248771 e!248776)))

(declare-fun res!242812 () Bool)

(assert (=> b!416934 (=> (not res!242812) (not e!248776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25361 (_ BitVec 32)) Bool)

(assert (=> b!416934 (= res!242812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190863 mask!1025))))

(assert (=> b!416934 (= lt!190863 (array!25362 (store (arr!12130 _keys!709) i!563 k0!794) (size!12483 _keys!709)))))

(declare-fun bm!28972 () Bool)

(assert (=> bm!28972 (= call!28975 (getCurrentListMapNoExtraKeys!1210 (ite c!55053 _keys!709 lt!190863) (ite c!55053 _values!549 lt!190859) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416935 () Bool)

(declare-fun res!242809 () Bool)

(assert (=> b!416935 (=> (not res!242809) (not e!248771))))

(declare-fun arrayContainsKey!0 (array!25361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416935 (= res!242809 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416936 () Bool)

(declare-fun res!242805 () Bool)

(assert (=> b!416936 (=> (not res!242805) (not e!248771))))

(assert (=> b!416936 (= res!242805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416937 () Bool)

(assert (=> b!416937 (= e!248770 tp_is_empty!10759)))

(declare-fun b!416938 () Bool)

(assert (=> b!416938 (= e!248775 (= call!28974 (+!1228 call!28975 (tuple2!7065 k0!794 v!412))))))

(declare-fun b!416939 () Bool)

(declare-fun res!242810 () Bool)

(assert (=> b!416939 (=> (not res!242810) (not e!248771))))

(assert (=> b!416939 (= res!242810 (and (= (size!12484 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12483 _keys!709) (size!12484 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416940 () Bool)

(declare-fun res!242801 () Bool)

(assert (=> b!416940 (=> (not res!242801) (not e!248771))))

(assert (=> b!416940 (= res!242801 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7063))))

(declare-fun b!416941 () Bool)

(declare-fun res!242813 () Bool)

(assert (=> b!416941 (=> (not res!242813) (not e!248771))))

(assert (=> b!416941 (= res!242813 (or (= (select (arr!12130 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12130 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!242802 () Bool)

(assert (=> start!39326 (=> (not res!242802) (not e!248771))))

(assert (=> start!39326 (= res!242802 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12483 _keys!709))))))

(assert (=> start!39326 e!248771))

(assert (=> start!39326 tp_is_empty!10759))

(assert (=> start!39326 tp!34350))

(assert (=> start!39326 true))

(declare-fun array_inv!8888 (array!25363) Bool)

(assert (=> start!39326 (and (array_inv!8888 _values!549) e!248774)))

(declare-fun array_inv!8889 (array!25361) Bool)

(assert (=> start!39326 (array_inv!8889 _keys!709)))

(declare-fun b!416929 () Bool)

(assert (=> b!416929 (= e!248776 e!248778)))

(declare-fun res!242808 () Bool)

(assert (=> b!416929 (=> (not res!242808) (not e!248778))))

(assert (=> b!416929 (= res!242808 (= from!863 i!563))))

(assert (=> b!416929 (= lt!190861 (getCurrentListMapNoExtraKeys!1210 lt!190863 lt!190859 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416929 (= lt!190859 (array!25364 (store (arr!12131 _values!549) i!563 (ValueCellFull!5036 v!412)) (size!12484 _values!549)))))

(declare-fun lt!190862 () ListLongMap!5967)

(assert (=> b!416929 (= lt!190862 (getCurrentListMapNoExtraKeys!1210 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39326 res!242802) b!416933))

(assert (= (and b!416933 res!242803) b!416939))

(assert (= (and b!416939 res!242810) b!416936))

(assert (= (and b!416936 res!242805) b!416940))

(assert (= (and b!416940 res!242801) b!416923))

(assert (= (and b!416923 res!242811) b!416925))

(assert (= (and b!416925 res!242806) b!416941))

(assert (= (and b!416941 res!242813) b!416935))

(assert (= (and b!416935 res!242809) b!416934))

(assert (= (and b!416934 res!242812) b!416928))

(assert (= (and b!416928 res!242807) b!416931))

(assert (= (and b!416931 res!242804) b!416929))

(assert (= (and b!416929 res!242808) b!416926))

(assert (= (and b!416926 c!55053) b!416938))

(assert (= (and b!416926 (not c!55053)) b!416924))

(assert (= (or b!416938 b!416924) bm!28971))

(assert (= (or b!416938 b!416924) bm!28972))

(assert (= (and b!416926 (not res!242814)) b!416927))

(assert (= (and b!416932 condMapEmpty!17760) mapIsEmpty!17760))

(assert (= (and b!416932 (not condMapEmpty!17760)) mapNonEmpty!17760))

(get-info :version)

(assert (= (and mapNonEmpty!17760 ((_ is ValueCellFull!5036) mapValue!17760)) b!416930))

(assert (= (and b!416932 ((_ is ValueCellFull!5036) mapDefault!17760)) b!416937))

(assert (= start!39326 b!416932))

(declare-fun b_lambda!8893 () Bool)

(assert (=> (not b_lambda!8893) (not b!416927)))

(declare-fun t!12327 () Bool)

(declare-fun tb!3221 () Bool)

(assert (=> (and start!39326 (= defaultEntry!557 defaultEntry!557) t!12327) tb!3221))

(declare-fun result!5977 () Bool)

(assert (=> tb!3221 (= result!5977 tp_is_empty!10759)))

(assert (=> b!416927 t!12327))

(declare-fun b_and!17065 () Bool)

(assert (= b_and!17063 (and (=> t!12327 result!5977) b_and!17065)))

(declare-fun m!405705 () Bool)

(assert (=> bm!28971 m!405705))

(declare-fun m!405707 () Bool)

(assert (=> b!416928 m!405707))

(declare-fun m!405709 () Bool)

(assert (=> b!416933 m!405709))

(declare-fun m!405711 () Bool)

(assert (=> b!416940 m!405711))

(declare-fun m!405713 () Bool)

(assert (=> b!416936 m!405713))

(declare-fun m!405715 () Bool)

(assert (=> b!416935 m!405715))

(declare-fun m!405717 () Bool)

(assert (=> b!416927 m!405717))

(declare-fun m!405719 () Bool)

(assert (=> b!416927 m!405719))

(declare-fun m!405721 () Bool)

(assert (=> b!416927 m!405721))

(declare-fun m!405723 () Bool)

(assert (=> b!416927 m!405723))

(declare-fun m!405725 () Bool)

(assert (=> b!416927 m!405725))

(declare-fun m!405727 () Bool)

(assert (=> b!416927 m!405727))

(declare-fun m!405729 () Bool)

(assert (=> b!416927 m!405729))

(declare-fun m!405731 () Bool)

(assert (=> b!416927 m!405731))

(declare-fun m!405733 () Bool)

(assert (=> b!416927 m!405733))

(assert (=> b!416927 m!405717))

(declare-fun m!405735 () Bool)

(assert (=> b!416927 m!405735))

(assert (=> b!416927 m!405723))

(declare-fun m!405737 () Bool)

(assert (=> b!416927 m!405737))

(declare-fun m!405739 () Bool)

(assert (=> b!416927 m!405739))

(assert (=> b!416927 m!405735))

(declare-fun m!405741 () Bool)

(assert (=> b!416927 m!405741))

(declare-fun m!405743 () Bool)

(assert (=> b!416926 m!405743))

(assert (=> b!416926 m!405743))

(declare-fun m!405745 () Bool)

(assert (=> b!416926 m!405745))

(declare-fun m!405747 () Bool)

(assert (=> b!416926 m!405747))

(declare-fun m!405749 () Bool)

(assert (=> start!39326 m!405749))

(declare-fun m!405751 () Bool)

(assert (=> start!39326 m!405751))

(declare-fun m!405753 () Bool)

(assert (=> b!416934 m!405753))

(declare-fun m!405755 () Bool)

(assert (=> b!416934 m!405755))

(declare-fun m!405757 () Bool)

(assert (=> b!416929 m!405757))

(assert (=> b!416929 m!405729))

(declare-fun m!405759 () Bool)

(assert (=> b!416929 m!405759))

(declare-fun m!405761 () Bool)

(assert (=> bm!28972 m!405761))

(declare-fun m!405763 () Bool)

(assert (=> b!416925 m!405763))

(declare-fun m!405765 () Bool)

(assert (=> b!416941 m!405765))

(declare-fun m!405767 () Bool)

(assert (=> mapNonEmpty!17760 m!405767))

(declare-fun m!405769 () Bool)

(assert (=> b!416938 m!405769))

(check-sat (not bm!28971) (not b_next!9607) (not b_lambda!8893) (not b!416940) (not b!416936) (not b!416925) (not b!416929) (not b!416938) (not b!416935) (not bm!28972) (not b!416934) (not b!416928) tp_is_empty!10759 b_and!17065 (not b!416926) (not start!39326) (not b!416933) (not mapNonEmpty!17760) (not b!416927))
(check-sat b_and!17065 (not b_next!9607))
