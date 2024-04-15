; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39224 () Bool)

(assert start!39224)

(declare-fun b_free!9505 () Bool)

(declare-fun b_next!9505 () Bool)

(assert (=> start!39224 (= b_free!9505 (not b_next!9505))))

(declare-fun tp!34044 () Bool)

(declare-fun b_and!16865 () Bool)

(assert (=> start!39224 (= tp!34044 b_and!16865)))

(declare-fun b!413920 () Bool)

(declare-fun e!247398 () Bool)

(declare-fun tp_is_empty!10657 () Bool)

(assert (=> b!413920 (= e!247398 tp_is_empty!10657)))

(declare-fun b!413921 () Bool)

(declare-fun e!247393 () Bool)

(declare-fun e!247396 () Bool)

(assert (=> b!413921 (= e!247393 (not e!247396))))

(declare-fun res!240662 () Bool)

(assert (=> b!413921 (=> res!240662 e!247396)))

(declare-datatypes ((array!25163 0))(
  ( (array!25164 (arr!12031 (Array (_ BitVec 32) (_ BitVec 64))) (size!12384 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25163)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413921 (= res!240662 (validKeyInArray!0 (select (arr!12031 _keys!709) from!863)))))

(declare-fun e!247397 () Bool)

(assert (=> b!413921 e!247397))

(declare-fun c!54900 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413921 (= c!54900 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15315 0))(
  ( (V!15316 (val!5373 Int)) )
))
(declare-fun minValue!515 () V!15315)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4985 0))(
  ( (ValueCellFull!4985 (v!7614 V!15315)) (EmptyCell!4985) )
))
(declare-datatypes ((array!25165 0))(
  ( (array!25166 (arr!12032 (Array (_ BitVec 32) ValueCell!4985)) (size!12385 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25165)

(declare-fun zeroValue!515 () V!15315)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12224 0))(
  ( (Unit!12225) )
))
(declare-fun lt!189701 () Unit!12224)

(declare-fun v!412 () V!15315)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!375 (array!25163 array!25165 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) (_ BitVec 64) V!15315 (_ BitVec 32) Int) Unit!12224)

(assert (=> b!413921 (= lt!189701 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240670 () Bool)

(declare-fun e!247394 () Bool)

(assert (=> start!39224 (=> (not res!240670) (not e!247394))))

(assert (=> start!39224 (= res!240670 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12384 _keys!709))))))

(assert (=> start!39224 e!247394))

(assert (=> start!39224 tp_is_empty!10657))

(assert (=> start!39224 tp!34044))

(assert (=> start!39224 true))

(declare-fun e!247395 () Bool)

(declare-fun array_inv!8828 (array!25165) Bool)

(assert (=> start!39224 (and (array_inv!8828 _values!549) e!247395)))

(declare-fun array_inv!8829 (array!25163) Bool)

(assert (=> start!39224 (array_inv!8829 _keys!709)))

(declare-fun b!413922 () Bool)

(declare-fun res!240659 () Bool)

(assert (=> b!413922 (=> (not res!240659) (not e!247394))))

(declare-datatypes ((List!6984 0))(
  ( (Nil!6981) (Cons!6980 (h!7836 (_ BitVec 64)) (t!12149 List!6984)) )
))
(declare-fun arrayNoDuplicates!0 (array!25163 (_ BitVec 32) List!6984) Bool)

(assert (=> b!413922 (= res!240659 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6981))))

(declare-fun mapIsEmpty!17607 () Bool)

(declare-fun mapRes!17607 () Bool)

(assert (=> mapIsEmpty!17607 mapRes!17607))

(declare-fun b!413923 () Bool)

(declare-fun res!240663 () Bool)

(assert (=> b!413923 (=> (not res!240663) (not e!247394))))

(assert (=> b!413923 (= res!240663 (and (= (size!12385 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12384 _keys!709) (size!12385 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413924 () Bool)

(declare-fun e!247399 () Bool)

(assert (=> b!413924 (= e!247395 (and e!247399 mapRes!17607))))

(declare-fun condMapEmpty!17607 () Bool)

(declare-fun mapDefault!17607 () ValueCell!4985)

(assert (=> b!413924 (= condMapEmpty!17607 (= (arr!12032 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4985)) mapDefault!17607)))))

(declare-fun lt!189702 () array!25163)

(declare-fun bm!28665 () Bool)

(declare-fun lt!189704 () array!25165)

(declare-datatypes ((tuple2!6970 0))(
  ( (tuple2!6971 (_1!3496 (_ BitVec 64)) (_2!3496 V!15315)) )
))
(declare-datatypes ((List!6985 0))(
  ( (Nil!6982) (Cons!6981 (h!7837 tuple2!6970) (t!12150 List!6985)) )
))
(declare-datatypes ((ListLongMap!5873 0))(
  ( (ListLongMap!5874 (toList!2952 List!6985)) )
))
(declare-fun call!28668 () ListLongMap!5873)

(declare-fun getCurrentListMapNoExtraKeys!1165 (array!25163 array!25165 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) Int) ListLongMap!5873)

(assert (=> bm!28665 (= call!28668 (getCurrentListMapNoExtraKeys!1165 (ite c!54900 lt!189702 _keys!709) (ite c!54900 lt!189704 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413925 () Bool)

(declare-fun res!240661 () Bool)

(assert (=> b!413925 (=> (not res!240661) (not e!247394))))

(assert (=> b!413925 (= res!240661 (or (= (select (arr!12031 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12031 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413926 () Bool)

(declare-fun res!240667 () Bool)

(declare-fun e!247401 () Bool)

(assert (=> b!413926 (=> (not res!240667) (not e!247401))))

(assert (=> b!413926 (= res!240667 (arrayNoDuplicates!0 lt!189702 #b00000000000000000000000000000000 Nil!6981))))

(declare-fun b!413927 () Bool)

(declare-fun res!240665 () Bool)

(assert (=> b!413927 (=> (not res!240665) (not e!247394))))

(assert (=> b!413927 (= res!240665 (validKeyInArray!0 k0!794))))

(declare-fun call!28669 () ListLongMap!5873)

(declare-fun bm!28666 () Bool)

(assert (=> bm!28666 (= call!28669 (getCurrentListMapNoExtraKeys!1165 (ite c!54900 _keys!709 lt!189702) (ite c!54900 _values!549 lt!189704) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413928 () Bool)

(assert (=> b!413928 (= e!247394 e!247401)))

(declare-fun res!240660 () Bool)

(assert (=> b!413928 (=> (not res!240660) (not e!247401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25163 (_ BitVec 32)) Bool)

(assert (=> b!413928 (= res!240660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189702 mask!1025))))

(assert (=> b!413928 (= lt!189702 (array!25164 (store (arr!12031 _keys!709) i!563 k0!794) (size!12384 _keys!709)))))

(declare-fun b!413929 () Bool)

(declare-fun res!240668 () Bool)

(assert (=> b!413929 (=> (not res!240668) (not e!247394))))

(declare-fun arrayContainsKey!0 (array!25163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413929 (= res!240668 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413930 () Bool)

(declare-fun res!240666 () Bool)

(assert (=> b!413930 (=> (not res!240666) (not e!247401))))

(assert (=> b!413930 (= res!240666 (bvsle from!863 i!563))))

(declare-fun b!413931 () Bool)

(assert (=> b!413931 (= e!247397 (= call!28669 call!28668))))

(declare-fun b!413932 () Bool)

(assert (=> b!413932 (= e!247401 e!247393)))

(declare-fun res!240672 () Bool)

(assert (=> b!413932 (=> (not res!240672) (not e!247393))))

(assert (=> b!413932 (= res!240672 (= from!863 i!563))))

(declare-fun lt!189700 () ListLongMap!5873)

(assert (=> b!413932 (= lt!189700 (getCurrentListMapNoExtraKeys!1165 lt!189702 lt!189704 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413932 (= lt!189704 (array!25166 (store (arr!12032 _values!549) i!563 (ValueCellFull!4985 v!412)) (size!12385 _values!549)))))

(declare-fun lt!189703 () ListLongMap!5873)

(assert (=> b!413932 (= lt!189703 (getCurrentListMapNoExtraKeys!1165 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413933 () Bool)

(declare-fun +!1190 (ListLongMap!5873 tuple2!6970) ListLongMap!5873)

(assert (=> b!413933 (= e!247397 (= call!28668 (+!1190 call!28669 (tuple2!6971 k0!794 v!412))))))

(declare-fun mapNonEmpty!17607 () Bool)

(declare-fun tp!34043 () Bool)

(assert (=> mapNonEmpty!17607 (= mapRes!17607 (and tp!34043 e!247398))))

(declare-fun mapKey!17607 () (_ BitVec 32))

(declare-fun mapValue!17607 () ValueCell!4985)

(declare-fun mapRest!17607 () (Array (_ BitVec 32) ValueCell!4985))

(assert (=> mapNonEmpty!17607 (= (arr!12032 _values!549) (store mapRest!17607 mapKey!17607 mapValue!17607))))

(declare-fun b!413934 () Bool)

(assert (=> b!413934 (= e!247399 tp_is_empty!10657)))

(declare-fun b!413935 () Bool)

(declare-fun res!240671 () Bool)

(assert (=> b!413935 (=> (not res!240671) (not e!247394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413935 (= res!240671 (validMask!0 mask!1025))))

(declare-fun b!413936 () Bool)

(assert (=> b!413936 (= e!247396 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12384 _keys!709))))))

(declare-fun b!413937 () Bool)

(declare-fun res!240669 () Bool)

(assert (=> b!413937 (=> (not res!240669) (not e!247394))))

(assert (=> b!413937 (= res!240669 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12384 _keys!709))))))

(declare-fun b!413938 () Bool)

(declare-fun res!240664 () Bool)

(assert (=> b!413938 (=> (not res!240664) (not e!247394))))

(assert (=> b!413938 (= res!240664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39224 res!240670) b!413935))

(assert (= (and b!413935 res!240671) b!413923))

(assert (= (and b!413923 res!240663) b!413938))

(assert (= (and b!413938 res!240664) b!413922))

(assert (= (and b!413922 res!240659) b!413937))

(assert (= (and b!413937 res!240669) b!413927))

(assert (= (and b!413927 res!240665) b!413925))

(assert (= (and b!413925 res!240661) b!413929))

(assert (= (and b!413929 res!240668) b!413928))

(assert (= (and b!413928 res!240660) b!413926))

(assert (= (and b!413926 res!240667) b!413930))

(assert (= (and b!413930 res!240666) b!413932))

(assert (= (and b!413932 res!240672) b!413921))

(assert (= (and b!413921 c!54900) b!413933))

(assert (= (and b!413921 (not c!54900)) b!413931))

(assert (= (or b!413933 b!413931) bm!28665))

(assert (= (or b!413933 b!413931) bm!28666))

(assert (= (and b!413921 (not res!240662)) b!413936))

(assert (= (and b!413924 condMapEmpty!17607) mapIsEmpty!17607))

(assert (= (and b!413924 (not condMapEmpty!17607)) mapNonEmpty!17607))

(get-info :version)

(assert (= (and mapNonEmpty!17607 ((_ is ValueCellFull!4985) mapValue!17607)) b!413920))

(assert (= (and b!413924 ((_ is ValueCellFull!4985) mapDefault!17607)) b!413934))

(assert (= start!39224 b!413924))

(declare-fun m!402741 () Bool)

(assert (=> b!413933 m!402741))

(declare-fun m!402743 () Bool)

(assert (=> bm!28665 m!402743))

(declare-fun m!402745 () Bool)

(assert (=> b!413932 m!402745))

(declare-fun m!402747 () Bool)

(assert (=> b!413932 m!402747))

(declare-fun m!402749 () Bool)

(assert (=> b!413932 m!402749))

(declare-fun m!402751 () Bool)

(assert (=> mapNonEmpty!17607 m!402751))

(declare-fun m!402753 () Bool)

(assert (=> b!413922 m!402753))

(declare-fun m!402755 () Bool)

(assert (=> start!39224 m!402755))

(declare-fun m!402757 () Bool)

(assert (=> start!39224 m!402757))

(declare-fun m!402759 () Bool)

(assert (=> b!413925 m!402759))

(declare-fun m!402761 () Bool)

(assert (=> b!413926 m!402761))

(declare-fun m!402763 () Bool)

(assert (=> b!413927 m!402763))

(declare-fun m!402765 () Bool)

(assert (=> b!413935 m!402765))

(declare-fun m!402767 () Bool)

(assert (=> b!413929 m!402767))

(declare-fun m!402769 () Bool)

(assert (=> b!413921 m!402769))

(assert (=> b!413921 m!402769))

(declare-fun m!402771 () Bool)

(assert (=> b!413921 m!402771))

(declare-fun m!402773 () Bool)

(assert (=> b!413921 m!402773))

(declare-fun m!402775 () Bool)

(assert (=> bm!28666 m!402775))

(declare-fun m!402777 () Bool)

(assert (=> b!413938 m!402777))

(declare-fun m!402779 () Bool)

(assert (=> b!413928 m!402779))

(declare-fun m!402781 () Bool)

(assert (=> b!413928 m!402781))

(check-sat (not b!413921) (not b_next!9505) (not b!413926) (not b!413935) b_and!16865 (not bm!28666) (not bm!28665) (not mapNonEmpty!17607) (not start!39224) (not b!413932) (not b!413938) (not b!413929) (not b!413928) (not b!413927) tp_is_empty!10657 (not b!413933) (not b!413922))
(check-sat b_and!16865 (not b_next!9505))
