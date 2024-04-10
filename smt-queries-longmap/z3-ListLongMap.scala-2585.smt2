; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39330 () Bool)

(assert start!39330)

(declare-fun b_free!9597 () Bool)

(declare-fun b_next!9597 () Bool)

(assert (=> start!39330 (= b_free!9597 (not b_next!9597))))

(declare-fun tp!34319 () Bool)

(declare-fun b_and!17069 () Bool)

(assert (=> start!39330 (= tp!34319 b_and!17069)))

(declare-fun res!242733 () Bool)

(declare-fun e!248809 () Bool)

(assert (=> start!39330 (=> (not res!242733) (not e!248809))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25353 0))(
  ( (array!25354 (arr!12126 (Array (_ BitVec 32) (_ BitVec 64))) (size!12478 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25353)

(assert (=> start!39330 (= res!242733 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12478 _keys!709))))))

(assert (=> start!39330 e!248809))

(declare-fun tp_is_empty!10749 () Bool)

(assert (=> start!39330 tp_is_empty!10749))

(assert (=> start!39330 tp!34319))

(assert (=> start!39330 true))

(declare-datatypes ((V!15437 0))(
  ( (V!15438 (val!5419 Int)) )
))
(declare-datatypes ((ValueCell!5031 0))(
  ( (ValueCellFull!5031 (v!7666 V!15437)) (EmptyCell!5031) )
))
(declare-datatypes ((array!25355 0))(
  ( (array!25356 (arr!12127 (Array (_ BitVec 32) ValueCell!5031)) (size!12479 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25355)

(declare-fun e!248814 () Bool)

(declare-fun array_inv!8844 (array!25355) Bool)

(assert (=> start!39330 (and (array_inv!8844 _values!549) e!248814)))

(declare-fun array_inv!8845 (array!25353) Bool)

(assert (=> start!39330 (array_inv!8845 _keys!709)))

(declare-fun mapNonEmpty!17745 () Bool)

(declare-fun mapRes!17745 () Bool)

(declare-fun tp!34320 () Bool)

(declare-fun e!248816 () Bool)

(assert (=> mapNonEmpty!17745 (= mapRes!17745 (and tp!34320 e!248816))))

(declare-fun mapValue!17745 () ValueCell!5031)

(declare-fun mapKey!17745 () (_ BitVec 32))

(declare-fun mapRest!17745 () (Array (_ BitVec 32) ValueCell!5031))

(assert (=> mapNonEmpty!17745 (= (arr!12127 _values!549) (store mapRest!17745 mapKey!17745 mapValue!17745))))

(declare-fun b!416899 () Bool)

(declare-fun res!242722 () Bool)

(assert (=> b!416899 (=> (not res!242722) (not e!248809))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!416899 (= res!242722 (and (= (size!12479 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12478 _keys!709) (size!12479 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416900 () Bool)

(declare-fun e!248817 () Bool)

(declare-datatypes ((tuple2!7072 0))(
  ( (tuple2!7073 (_1!3547 (_ BitVec 64)) (_2!3547 V!15437)) )
))
(declare-datatypes ((List!7090 0))(
  ( (Nil!7087) (Cons!7086 (h!7942 tuple2!7072) (t!12352 List!7090)) )
))
(declare-datatypes ((ListLongMap!5985 0))(
  ( (ListLongMap!5986 (toList!3008 List!7090)) )
))
(declare-fun call!28969 () ListLongMap!5985)

(declare-fun call!28970 () ListLongMap!5985)

(assert (=> b!416900 (= e!248817 (= call!28969 call!28970))))

(declare-fun b!416901 () Bool)

(declare-fun res!242723 () Bool)

(assert (=> b!416901 (=> (not res!242723) (not e!248809))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416901 (= res!242723 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!15437)

(declare-fun zeroValue!515 () V!15437)

(declare-fun c!55109 () Bool)

(declare-fun lt!190928 () array!25353)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!190932 () array!25355)

(declare-fun bm!28966 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1213 (array!25353 array!25355 (_ BitVec 32) (_ BitVec 32) V!15437 V!15437 (_ BitVec 32) Int) ListLongMap!5985)

(assert (=> bm!28966 (= call!28969 (getCurrentListMapNoExtraKeys!1213 (ite c!55109 _keys!709 lt!190928) (ite c!55109 _values!549 lt!190932) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416902 () Bool)

(declare-fun e!248812 () Bool)

(assert (=> b!416902 (= e!248812 tp_is_empty!10749)))

(declare-fun b!416903 () Bool)

(declare-fun res!242728 () Bool)

(declare-fun e!248815 () Bool)

(assert (=> b!416903 (=> (not res!242728) (not e!248815))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416903 (= res!242728 (bvsle from!863 i!563))))

(declare-fun b!416904 () Bool)

(declare-fun v!412 () V!15437)

(declare-fun +!1210 (ListLongMap!5985 tuple2!7072) ListLongMap!5985)

(assert (=> b!416904 (= e!248817 (= call!28970 (+!1210 call!28969 (tuple2!7073 k0!794 v!412))))))

(declare-fun b!416905 () Bool)

(assert (=> b!416905 (= e!248814 (and e!248812 mapRes!17745))))

(declare-fun condMapEmpty!17745 () Bool)

(declare-fun mapDefault!17745 () ValueCell!5031)

(assert (=> b!416905 (= condMapEmpty!17745 (= (arr!12127 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5031)) mapDefault!17745)))))

(declare-fun b!416906 () Bool)

(declare-fun res!242730 () Bool)

(assert (=> b!416906 (=> (not res!242730) (not e!248809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416906 (= res!242730 (validMask!0 mask!1025))))

(declare-fun b!416907 () Bool)

(declare-fun res!242721 () Bool)

(assert (=> b!416907 (=> (not res!242721) (not e!248815))))

(declare-datatypes ((List!7091 0))(
  ( (Nil!7088) (Cons!7087 (h!7943 (_ BitVec 64)) (t!12353 List!7091)) )
))
(declare-fun arrayNoDuplicates!0 (array!25353 (_ BitVec 32) List!7091) Bool)

(assert (=> b!416907 (= res!242721 (arrayNoDuplicates!0 lt!190928 #b00000000000000000000000000000000 Nil!7088))))

(declare-fun mapIsEmpty!17745 () Bool)

(assert (=> mapIsEmpty!17745 mapRes!17745))

(declare-fun b!416908 () Bool)

(declare-fun e!248810 () Bool)

(assert (=> b!416908 (= e!248815 e!248810)))

(declare-fun res!242731 () Bool)

(assert (=> b!416908 (=> (not res!242731) (not e!248810))))

(assert (=> b!416908 (= res!242731 (= from!863 i!563))))

(declare-fun lt!190933 () ListLongMap!5985)

(assert (=> b!416908 (= lt!190933 (getCurrentListMapNoExtraKeys!1213 lt!190928 lt!190932 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416908 (= lt!190932 (array!25356 (store (arr!12127 _values!549) i!563 (ValueCellFull!5031 v!412)) (size!12479 _values!549)))))

(declare-fun lt!190924 () ListLongMap!5985)

(assert (=> b!416908 (= lt!190924 (getCurrentListMapNoExtraKeys!1213 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416909 () Bool)

(declare-fun res!242724 () Bool)

(assert (=> b!416909 (=> (not res!242724) (not e!248809))))

(assert (=> b!416909 (= res!242724 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12478 _keys!709))))))

(declare-fun b!416910 () Bool)

(declare-fun e!248813 () Bool)

(assert (=> b!416910 (= e!248810 (not e!248813))))

(declare-fun res!242727 () Bool)

(assert (=> b!416910 (=> res!242727 e!248813)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416910 (= res!242727 (validKeyInArray!0 (select (arr!12126 _keys!709) from!863)))))

(assert (=> b!416910 e!248817))

(assert (=> b!416910 (= c!55109 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12322 0))(
  ( (Unit!12323) )
))
(declare-fun lt!190925 () Unit!12322)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!417 (array!25353 array!25355 (_ BitVec 32) (_ BitVec 32) V!15437 V!15437 (_ BitVec 32) (_ BitVec 64) V!15437 (_ BitVec 32) Int) Unit!12322)

(assert (=> b!416910 (= lt!190925 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!417 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416911 () Bool)

(declare-fun res!242720 () Bool)

(assert (=> b!416911 (=> (not res!242720) (not e!248809))))

(assert (=> b!416911 (= res!242720 (or (= (select (arr!12126 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12126 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416912 () Bool)

(assert (=> b!416912 (= e!248809 e!248815)))

(declare-fun res!242732 () Bool)

(assert (=> b!416912 (=> (not res!242732) (not e!248815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25353 (_ BitVec 32)) Bool)

(assert (=> b!416912 (= res!242732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190928 mask!1025))))

(assert (=> b!416912 (= lt!190928 (array!25354 (store (arr!12126 _keys!709) i!563 k0!794) (size!12478 _keys!709)))))

(declare-fun bm!28967 () Bool)

(assert (=> bm!28967 (= call!28970 (getCurrentListMapNoExtraKeys!1213 (ite c!55109 lt!190928 _keys!709) (ite c!55109 lt!190932 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416913 () Bool)

(declare-fun res!242726 () Bool)

(assert (=> b!416913 (=> (not res!242726) (not e!248809))))

(assert (=> b!416913 (= res!242726 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7088))))

(declare-fun b!416914 () Bool)

(declare-fun res!242725 () Bool)

(assert (=> b!416914 (=> (not res!242725) (not e!248809))))

(assert (=> b!416914 (= res!242725 (validKeyInArray!0 k0!794))))

(declare-fun b!416915 () Bool)

(assert (=> b!416915 (= e!248816 tp_is_empty!10749)))

(declare-fun b!416916 () Bool)

(declare-fun res!242729 () Bool)

(assert (=> b!416916 (=> (not res!242729) (not e!248809))))

(assert (=> b!416916 (= res!242729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416917 () Bool)

(assert (=> b!416917 (= e!248813 true)))

(declare-fun lt!190927 () tuple2!7072)

(declare-fun lt!190929 () V!15437)

(declare-fun lt!190931 () ListLongMap!5985)

(assert (=> b!416917 (= (+!1210 lt!190931 lt!190927) (+!1210 (+!1210 lt!190931 (tuple2!7073 k0!794 lt!190929)) lt!190927))))

(declare-fun lt!190934 () V!15437)

(assert (=> b!416917 (= lt!190927 (tuple2!7073 k0!794 lt!190934))))

(declare-fun lt!190930 () Unit!12322)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!13 (ListLongMap!5985 (_ BitVec 64) V!15437 V!15437) Unit!12322)

(assert (=> b!416917 (= lt!190930 (addSameAsAddTwiceSameKeyDiffValues!13 lt!190931 k0!794 lt!190929 lt!190934))))

(declare-fun lt!190926 () V!15437)

(declare-fun get!5997 (ValueCell!5031 V!15437) V!15437)

(assert (=> b!416917 (= lt!190929 (get!5997 (select (arr!12127 _values!549) from!863) lt!190926))))

(assert (=> b!416917 (= lt!190933 (+!1210 lt!190931 (tuple2!7073 (select (arr!12126 lt!190928) from!863) lt!190934)))))

(assert (=> b!416917 (= lt!190934 (get!5997 (select (store (arr!12127 _values!549) i!563 (ValueCellFull!5031 v!412)) from!863) lt!190926))))

(declare-fun dynLambda!684 (Int (_ BitVec 64)) V!15437)

(assert (=> b!416917 (= lt!190926 (dynLambda!684 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416917 (= lt!190931 (getCurrentListMapNoExtraKeys!1213 lt!190928 lt!190932 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39330 res!242733) b!416906))

(assert (= (and b!416906 res!242730) b!416899))

(assert (= (and b!416899 res!242722) b!416916))

(assert (= (and b!416916 res!242729) b!416913))

(assert (= (and b!416913 res!242726) b!416909))

(assert (= (and b!416909 res!242724) b!416914))

(assert (= (and b!416914 res!242725) b!416911))

(assert (= (and b!416911 res!242720) b!416901))

(assert (= (and b!416901 res!242723) b!416912))

(assert (= (and b!416912 res!242732) b!416907))

(assert (= (and b!416907 res!242721) b!416903))

(assert (= (and b!416903 res!242728) b!416908))

(assert (= (and b!416908 res!242731) b!416910))

(assert (= (and b!416910 c!55109) b!416904))

(assert (= (and b!416910 (not c!55109)) b!416900))

(assert (= (or b!416904 b!416900) bm!28967))

(assert (= (or b!416904 b!416900) bm!28966))

(assert (= (and b!416910 (not res!242727)) b!416917))

(assert (= (and b!416905 condMapEmpty!17745) mapIsEmpty!17745))

(assert (= (and b!416905 (not condMapEmpty!17745)) mapNonEmpty!17745))

(get-info :version)

(assert (= (and mapNonEmpty!17745 ((_ is ValueCellFull!5031) mapValue!17745)) b!416915))

(assert (= (and b!416905 ((_ is ValueCellFull!5031) mapDefault!17745)) b!416902))

(assert (= start!39330 b!416905))

(declare-fun b_lambda!8901 () Bool)

(assert (=> (not b_lambda!8901) (not b!416917)))

(declare-fun t!12351 () Bool)

(declare-fun tb!3219 () Bool)

(assert (=> (and start!39330 (= defaultEntry!557 defaultEntry!557) t!12351) tb!3219))

(declare-fun result!5965 () Bool)

(assert (=> tb!3219 (= result!5965 tp_is_empty!10749)))

(assert (=> b!416917 t!12351))

(declare-fun b_and!17071 () Bool)

(assert (= b_and!17069 (and (=> t!12351 result!5965) b_and!17071)))

(declare-fun m!406103 () Bool)

(assert (=> b!416913 m!406103))

(declare-fun m!406105 () Bool)

(assert (=> b!416904 m!406105))

(declare-fun m!406107 () Bool)

(assert (=> b!416912 m!406107))

(declare-fun m!406109 () Bool)

(assert (=> b!416912 m!406109))

(declare-fun m!406111 () Bool)

(assert (=> b!416914 m!406111))

(declare-fun m!406113 () Bool)

(assert (=> start!39330 m!406113))

(declare-fun m!406115 () Bool)

(assert (=> start!39330 m!406115))

(declare-fun m!406117 () Bool)

(assert (=> bm!28967 m!406117))

(declare-fun m!406119 () Bool)

(assert (=> b!416901 m!406119))

(declare-fun m!406121 () Bool)

(assert (=> mapNonEmpty!17745 m!406121))

(declare-fun m!406123 () Bool)

(assert (=> b!416911 m!406123))

(declare-fun m!406125 () Bool)

(assert (=> b!416917 m!406125))

(declare-fun m!406127 () Bool)

(assert (=> b!416917 m!406127))

(declare-fun m!406129 () Bool)

(assert (=> b!416917 m!406129))

(declare-fun m!406131 () Bool)

(assert (=> b!416917 m!406131))

(declare-fun m!406133 () Bool)

(assert (=> b!416917 m!406133))

(declare-fun m!406135 () Bool)

(assert (=> b!416917 m!406135))

(assert (=> b!416917 m!406125))

(declare-fun m!406137 () Bool)

(assert (=> b!416917 m!406137))

(declare-fun m!406139 () Bool)

(assert (=> b!416917 m!406139))

(declare-fun m!406141 () Bool)

(assert (=> b!416917 m!406141))

(declare-fun m!406143 () Bool)

(assert (=> b!416917 m!406143))

(assert (=> b!416917 m!406133))

(declare-fun m!406145 () Bool)

(assert (=> b!416917 m!406145))

(declare-fun m!406147 () Bool)

(assert (=> b!416917 m!406147))

(assert (=> b!416917 m!406135))

(declare-fun m!406149 () Bool)

(assert (=> b!416917 m!406149))

(declare-fun m!406151 () Bool)

(assert (=> b!416906 m!406151))

(declare-fun m!406153 () Bool)

(assert (=> b!416916 m!406153))

(declare-fun m!406155 () Bool)

(assert (=> b!416907 m!406155))

(declare-fun m!406157 () Bool)

(assert (=> b!416908 m!406157))

(assert (=> b!416908 m!406129))

(declare-fun m!406159 () Bool)

(assert (=> b!416908 m!406159))

(declare-fun m!406161 () Bool)

(assert (=> bm!28966 m!406161))

(declare-fun m!406163 () Bool)

(assert (=> b!416910 m!406163))

(assert (=> b!416910 m!406163))

(declare-fun m!406165 () Bool)

(assert (=> b!416910 m!406165))

(declare-fun m!406167 () Bool)

(assert (=> b!416910 m!406167))

(check-sat (not mapNonEmpty!17745) (not b!416912) (not b!416907) b_and!17071 (not b!416908) (not bm!28966) (not b_next!9597) (not b!416901) (not b!416914) (not b!416916) (not bm!28967) (not b!416904) (not b!416906) (not b_lambda!8901) (not b!416917) (not start!39330) (not b!416910) tp_is_empty!10749 (not b!416913))
(check-sat b_and!17071 (not b_next!9597))
