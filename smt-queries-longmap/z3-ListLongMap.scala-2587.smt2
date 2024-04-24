; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39326 () Bool)

(assert start!39326)

(declare-fun b_free!9607 () Bool)

(declare-fun b_next!9607 () Bool)

(assert (=> start!39326 (= b_free!9607 (not b_next!9607))))

(declare-fun tp!34350 () Bool)

(declare-fun b_and!17103 () Bool)

(assert (=> start!39326 (= tp!34350 b_and!17103)))

(declare-fun b!417145 () Bool)

(declare-fun res!242930 () Bool)

(declare-fun e!248912 () Bool)

(assert (=> b!417145 (=> (not res!242930) (not e!248912))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417145 (= res!242930 (bvsle from!863 i!563))))

(declare-fun b!417146 () Bool)

(declare-fun res!242937 () Bool)

(declare-fun e!248918 () Bool)

(assert (=> b!417146 (=> (not res!242937) (not e!248918))))

(declare-datatypes ((array!25376 0))(
  ( (array!25377 (arr!12137 (Array (_ BitVec 32) (_ BitVec 64))) (size!12489 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25376)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15451 0))(
  ( (V!15452 (val!5424 Int)) )
))
(declare-datatypes ((ValueCell!5036 0))(
  ( (ValueCellFull!5036 (v!7672 V!15451)) (EmptyCell!5036) )
))
(declare-datatypes ((array!25378 0))(
  ( (array!25379 (arr!12138 (Array (_ BitVec 32) ValueCell!5036)) (size!12490 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25378)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!417146 (= res!242937 (and (= (size!12490 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12489 _keys!709) (size!12490 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417147 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!6956 0))(
  ( (tuple2!6957 (_1!3489 (_ BitVec 64)) (_2!3489 V!15451)) )
))
(declare-datatypes ((List!6972 0))(
  ( (Nil!6969) (Cons!6968 (h!7824 tuple2!6956) (t!12236 List!6972)) )
))
(declare-datatypes ((ListLongMap!5871 0))(
  ( (ListLongMap!5872 (toList!2951 List!6972)) )
))
(declare-fun call!28986 () ListLongMap!5871)

(declare-fun e!248914 () Bool)

(declare-fun call!28987 () ListLongMap!5871)

(declare-fun v!412 () V!15451)

(declare-fun +!1222 (ListLongMap!5871 tuple2!6956) ListLongMap!5871)

(assert (=> b!417147 (= e!248914 (= call!28987 (+!1222 call!28986 (tuple2!6957 k0!794 v!412))))))

(declare-fun mapNonEmpty!17760 () Bool)

(declare-fun mapRes!17760 () Bool)

(declare-fun tp!34349 () Bool)

(declare-fun e!248916 () Bool)

(assert (=> mapNonEmpty!17760 (= mapRes!17760 (and tp!34349 e!248916))))

(declare-fun mapKey!17760 () (_ BitVec 32))

(declare-fun mapValue!17760 () ValueCell!5036)

(declare-fun mapRest!17760 () (Array (_ BitVec 32) ValueCell!5036))

(assert (=> mapNonEmpty!17760 (= (arr!12138 _values!549) (store mapRest!17760 mapKey!17760 mapValue!17760))))

(declare-fun b!417148 () Bool)

(declare-fun tp_is_empty!10759 () Bool)

(assert (=> b!417148 (= e!248916 tp_is_empty!10759)))

(declare-fun b!417149 () Bool)

(declare-fun e!248917 () Bool)

(assert (=> b!417149 (= e!248917 true)))

(declare-fun lt!191116 () tuple2!6956)

(declare-fun lt!191111 () V!15451)

(declare-fun lt!191118 () ListLongMap!5871)

(assert (=> b!417149 (= (+!1222 lt!191118 lt!191116) (+!1222 (+!1222 lt!191118 (tuple2!6957 k0!794 lt!191111)) lt!191116))))

(declare-fun lt!191108 () V!15451)

(assert (=> b!417149 (= lt!191116 (tuple2!6957 k0!794 lt!191108))))

(declare-datatypes ((Unit!12317 0))(
  ( (Unit!12318) )
))
(declare-fun lt!191114 () Unit!12317)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!14 (ListLongMap!5871 (_ BitVec 64) V!15451 V!15451) Unit!12317)

(assert (=> b!417149 (= lt!191114 (addSameAsAddTwiceSameKeyDiffValues!14 lt!191118 k0!794 lt!191111 lt!191108))))

(declare-fun lt!191112 () V!15451)

(declare-fun get!6004 (ValueCell!5036 V!15451) V!15451)

(assert (=> b!417149 (= lt!191111 (get!6004 (select (arr!12138 _values!549) from!863) lt!191112))))

(declare-fun lt!191117 () array!25376)

(declare-fun lt!191113 () ListLongMap!5871)

(assert (=> b!417149 (= lt!191113 (+!1222 lt!191118 (tuple2!6957 (select (arr!12137 lt!191117) from!863) lt!191108)))))

(assert (=> b!417149 (= lt!191108 (get!6004 (select (store (arr!12138 _values!549) i!563 (ValueCellFull!5036 v!412)) from!863) lt!191112))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!681 (Int (_ BitVec 64)) V!15451)

(assert (=> b!417149 (= lt!191112 (dynLambda!681 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15451)

(declare-fun zeroValue!515 () V!15451)

(declare-fun lt!191110 () array!25378)

(declare-fun getCurrentListMapNoExtraKeys!1197 (array!25376 array!25378 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) Int) ListLongMap!5871)

(assert (=> b!417149 (= lt!191118 (getCurrentListMapNoExtraKeys!1197 lt!191117 lt!191110 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417150 () Bool)

(declare-fun e!248913 () Bool)

(declare-fun e!248915 () Bool)

(assert (=> b!417150 (= e!248913 (and e!248915 mapRes!17760))))

(declare-fun condMapEmpty!17760 () Bool)

(declare-fun mapDefault!17760 () ValueCell!5036)

(assert (=> b!417150 (= condMapEmpty!17760 (= (arr!12138 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5036)) mapDefault!17760)))))

(declare-fun c!55101 () Bool)

(declare-fun bm!28984 () Bool)

(assert (=> bm!28984 (= call!28987 (getCurrentListMapNoExtraKeys!1197 (ite c!55101 lt!191117 _keys!709) (ite c!55101 lt!191110 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417151 () Bool)

(assert (=> b!417151 (= e!248918 e!248912)))

(declare-fun res!242929 () Bool)

(assert (=> b!417151 (=> (not res!242929) (not e!248912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25376 (_ BitVec 32)) Bool)

(assert (=> b!417151 (= res!242929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191117 mask!1025))))

(assert (=> b!417151 (= lt!191117 (array!25377 (store (arr!12137 _keys!709) i!563 k0!794) (size!12489 _keys!709)))))

(declare-fun b!417152 () Bool)

(declare-fun res!242936 () Bool)

(assert (=> b!417152 (=> (not res!242936) (not e!248918))))

(assert (=> b!417152 (= res!242936 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12489 _keys!709))))))

(declare-fun b!417153 () Bool)

(declare-fun res!242938 () Bool)

(assert (=> b!417153 (=> (not res!242938) (not e!248918))))

(assert (=> b!417153 (= res!242938 (or (= (select (arr!12137 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12137 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417154 () Bool)

(declare-fun res!242933 () Bool)

(assert (=> b!417154 (=> (not res!242933) (not e!248918))))

(declare-fun arrayContainsKey!0 (array!25376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417154 (= res!242933 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417155 () Bool)

(declare-fun e!248919 () Bool)

(assert (=> b!417155 (= e!248912 e!248919)))

(declare-fun res!242935 () Bool)

(assert (=> b!417155 (=> (not res!242935) (not e!248919))))

(assert (=> b!417155 (= res!242935 (= from!863 i!563))))

(assert (=> b!417155 (= lt!191113 (getCurrentListMapNoExtraKeys!1197 lt!191117 lt!191110 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417155 (= lt!191110 (array!25379 (store (arr!12138 _values!549) i!563 (ValueCellFull!5036 v!412)) (size!12490 _values!549)))))

(declare-fun lt!191109 () ListLongMap!5871)

(assert (=> b!417155 (= lt!191109 (getCurrentListMapNoExtraKeys!1197 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417156 () Bool)

(assert (=> b!417156 (= e!248919 (not e!248917))))

(declare-fun res!242939 () Bool)

(assert (=> b!417156 (=> res!242939 e!248917)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417156 (= res!242939 (validKeyInArray!0 (select (arr!12137 _keys!709) from!863)))))

(assert (=> b!417156 e!248914))

(assert (=> b!417156 (= c!55101 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191115 () Unit!12317)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!424 (array!25376 array!25378 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) (_ BitVec 64) V!15451 (_ BitVec 32) Int) Unit!12317)

(assert (=> b!417156 (= lt!191115 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417157 () Bool)

(assert (=> b!417157 (= e!248914 (= call!28986 call!28987))))

(declare-fun b!417158 () Bool)

(declare-fun res!242927 () Bool)

(assert (=> b!417158 (=> (not res!242927) (not e!248918))))

(assert (=> b!417158 (= res!242927 (validKeyInArray!0 k0!794))))

(declare-fun b!417159 () Bool)

(declare-fun res!242931 () Bool)

(assert (=> b!417159 (=> (not res!242931) (not e!248918))))

(declare-datatypes ((List!6973 0))(
  ( (Nil!6970) (Cons!6969 (h!7825 (_ BitVec 64)) (t!12237 List!6973)) )
))
(declare-fun arrayNoDuplicates!0 (array!25376 (_ BitVec 32) List!6973) Bool)

(assert (=> b!417159 (= res!242931 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6970))))

(declare-fun mapIsEmpty!17760 () Bool)

(assert (=> mapIsEmpty!17760 mapRes!17760))

(declare-fun b!417160 () Bool)

(declare-fun res!242940 () Bool)

(assert (=> b!417160 (=> (not res!242940) (not e!248912))))

(assert (=> b!417160 (= res!242940 (arrayNoDuplicates!0 lt!191117 #b00000000000000000000000000000000 Nil!6970))))

(declare-fun b!417161 () Bool)

(declare-fun res!242928 () Bool)

(assert (=> b!417161 (=> (not res!242928) (not e!248918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417161 (= res!242928 (validMask!0 mask!1025))))

(declare-fun b!417162 () Bool)

(assert (=> b!417162 (= e!248915 tp_is_empty!10759)))

(declare-fun b!417163 () Bool)

(declare-fun res!242934 () Bool)

(assert (=> b!417163 (=> (not res!242934) (not e!248918))))

(assert (=> b!417163 (= res!242934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!242932 () Bool)

(assert (=> start!39326 (=> (not res!242932) (not e!248918))))

(assert (=> start!39326 (= res!242932 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12489 _keys!709))))))

(assert (=> start!39326 e!248918))

(assert (=> start!39326 tp_is_empty!10759))

(assert (=> start!39326 tp!34350))

(assert (=> start!39326 true))

(declare-fun array_inv!8930 (array!25378) Bool)

(assert (=> start!39326 (and (array_inv!8930 _values!549) e!248913)))

(declare-fun array_inv!8931 (array!25376) Bool)

(assert (=> start!39326 (array_inv!8931 _keys!709)))

(declare-fun bm!28983 () Bool)

(assert (=> bm!28983 (= call!28986 (getCurrentListMapNoExtraKeys!1197 (ite c!55101 _keys!709 lt!191117) (ite c!55101 _values!549 lt!191110) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39326 res!242932) b!417161))

(assert (= (and b!417161 res!242928) b!417146))

(assert (= (and b!417146 res!242937) b!417163))

(assert (= (and b!417163 res!242934) b!417159))

(assert (= (and b!417159 res!242931) b!417152))

(assert (= (and b!417152 res!242936) b!417158))

(assert (= (and b!417158 res!242927) b!417153))

(assert (= (and b!417153 res!242938) b!417154))

(assert (= (and b!417154 res!242933) b!417151))

(assert (= (and b!417151 res!242929) b!417160))

(assert (= (and b!417160 res!242940) b!417145))

(assert (= (and b!417145 res!242930) b!417155))

(assert (= (and b!417155 res!242935) b!417156))

(assert (= (and b!417156 c!55101) b!417147))

(assert (= (and b!417156 (not c!55101)) b!417157))

(assert (= (or b!417147 b!417157) bm!28984))

(assert (= (or b!417147 b!417157) bm!28983))

(assert (= (and b!417156 (not res!242939)) b!417149))

(assert (= (and b!417150 condMapEmpty!17760) mapIsEmpty!17760))

(assert (= (and b!417150 (not condMapEmpty!17760)) mapNonEmpty!17760))

(get-info :version)

(assert (= (and mapNonEmpty!17760 ((_ is ValueCellFull!5036) mapValue!17760)) b!417148))

(assert (= (and b!417150 ((_ is ValueCellFull!5036) mapDefault!17760)) b!417162))

(assert (= start!39326 b!417150))

(declare-fun b_lambda!8933 () Bool)

(assert (=> (not b_lambda!8933) (not b!417149)))

(declare-fun t!12235 () Bool)

(declare-fun tb!3221 () Bool)

(assert (=> (and start!39326 (= defaultEntry!557 defaultEntry!557) t!12235) tb!3221))

(declare-fun result!5977 () Bool)

(assert (=> tb!3221 (= result!5977 tp_is_empty!10759)))

(assert (=> b!417149 t!12235))

(declare-fun b_and!17105 () Bool)

(assert (= b_and!17103 (and (=> t!12235 result!5977) b_and!17105)))

(declare-fun m!406663 () Bool)

(assert (=> b!417151 m!406663))

(declare-fun m!406665 () Bool)

(assert (=> b!417151 m!406665))

(declare-fun m!406667 () Bool)

(assert (=> b!417153 m!406667))

(declare-fun m!406669 () Bool)

(assert (=> b!417161 m!406669))

(declare-fun m!406671 () Bool)

(assert (=> b!417158 m!406671))

(declare-fun m!406673 () Bool)

(assert (=> start!39326 m!406673))

(declare-fun m!406675 () Bool)

(assert (=> start!39326 m!406675))

(declare-fun m!406677 () Bool)

(assert (=> b!417160 m!406677))

(declare-fun m!406679 () Bool)

(assert (=> mapNonEmpty!17760 m!406679))

(declare-fun m!406681 () Bool)

(assert (=> b!417163 m!406681))

(declare-fun m!406683 () Bool)

(assert (=> b!417147 m!406683))

(declare-fun m!406685 () Bool)

(assert (=> bm!28984 m!406685))

(declare-fun m!406687 () Bool)

(assert (=> b!417159 m!406687))

(declare-fun m!406689 () Bool)

(assert (=> b!417156 m!406689))

(assert (=> b!417156 m!406689))

(declare-fun m!406691 () Bool)

(assert (=> b!417156 m!406691))

(declare-fun m!406693 () Bool)

(assert (=> b!417156 m!406693))

(declare-fun m!406695 () Bool)

(assert (=> b!417155 m!406695))

(declare-fun m!406697 () Bool)

(assert (=> b!417155 m!406697))

(declare-fun m!406699 () Bool)

(assert (=> b!417155 m!406699))

(declare-fun m!406701 () Bool)

(assert (=> bm!28983 m!406701))

(declare-fun m!406703 () Bool)

(assert (=> b!417154 m!406703))

(declare-fun m!406705 () Bool)

(assert (=> b!417149 m!406705))

(declare-fun m!406707 () Bool)

(assert (=> b!417149 m!406707))

(declare-fun m!406709 () Bool)

(assert (=> b!417149 m!406709))

(declare-fun m!406711 () Bool)

(assert (=> b!417149 m!406711))

(declare-fun m!406713 () Bool)

(assert (=> b!417149 m!406713))

(assert (=> b!417149 m!406713))

(declare-fun m!406715 () Bool)

(assert (=> b!417149 m!406715))

(assert (=> b!417149 m!406709))

(declare-fun m!406717 () Bool)

(assert (=> b!417149 m!406717))

(declare-fun m!406719 () Bool)

(assert (=> b!417149 m!406719))

(assert (=> b!417149 m!406697))

(declare-fun m!406721 () Bool)

(assert (=> b!417149 m!406721))

(declare-fun m!406723 () Bool)

(assert (=> b!417149 m!406723))

(assert (=> b!417149 m!406723))

(declare-fun m!406725 () Bool)

(assert (=> b!417149 m!406725))

(declare-fun m!406727 () Bool)

(assert (=> b!417149 m!406727))

(check-sat (not bm!28984) (not b_lambda!8933) (not b_next!9607) tp_is_empty!10759 (not b!417161) (not b!417151) (not mapNonEmpty!17760) (not b!417163) (not b!417158) (not b!417149) (not b!417159) (not b!417147) (not b!417155) b_and!17105 (not b!417154) (not start!39326) (not b!417160) (not bm!28983) (not b!417156))
(check-sat b_and!17105 (not b_next!9607))
