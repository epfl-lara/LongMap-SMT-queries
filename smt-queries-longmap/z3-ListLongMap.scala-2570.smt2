; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39224 () Bool)

(assert start!39224)

(declare-fun b_free!9505 () Bool)

(declare-fun b_next!9505 () Bool)

(assert (=> start!39224 (= b_free!9505 (not b_next!9505))))

(declare-fun tp!34043 () Bool)

(declare-fun b_and!16905 () Bool)

(assert (=> start!39224 (= tp!34043 b_and!16905)))

(declare-fun b!414142 () Bool)

(declare-fun res!240794 () Bool)

(declare-fun e!247537 () Bool)

(assert (=> b!414142 (=> (not res!240794) (not e!247537))))

(declare-datatypes ((array!25176 0))(
  ( (array!25177 (arr!12037 (Array (_ BitVec 32) (_ BitVec 64))) (size!12389 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25176)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25176 (_ BitVec 32)) Bool)

(assert (=> b!414142 (= res!240794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414143 () Bool)

(declare-fun res!240785 () Bool)

(declare-fun e!247543 () Bool)

(assert (=> b!414143 (=> (not res!240785) (not e!247543))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414143 (= res!240785 (bvsle from!863 i!563))))

(declare-fun b!414144 () Bool)

(declare-fun e!247538 () Bool)

(declare-fun e!247536 () Bool)

(assert (=> b!414144 (= e!247538 (not e!247536))))

(declare-fun res!240790 () Bool)

(assert (=> b!414144 (=> res!240790 e!247536)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414144 (= res!240790 (validKeyInArray!0 (select (arr!12037 _keys!709) from!863)))))

(declare-fun e!247535 () Bool)

(assert (=> b!414144 e!247535))

(declare-fun c!54948 () Bool)

(assert (=> b!414144 (= c!54948 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15315 0))(
  ( (V!15316 (val!5373 Int)) )
))
(declare-fun minValue!515 () V!15315)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4985 0))(
  ( (ValueCellFull!4985 (v!7621 V!15315)) (EmptyCell!4985) )
))
(declare-datatypes ((array!25178 0))(
  ( (array!25179 (arr!12038 (Array (_ BitVec 32) ValueCell!4985)) (size!12390 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25178)

(declare-fun zeroValue!515 () V!15315)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15315)

(declare-datatypes ((Unit!12249 0))(
  ( (Unit!12250) )
))
(declare-fun lt!189953 () Unit!12249)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 (array!25176 array!25178 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) (_ BitVec 64) V!15315 (_ BitVec 32) Int) Unit!12249)

(assert (=> b!414144 (= lt!189953 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414145 () Bool)

(declare-fun res!240786 () Bool)

(assert (=> b!414145 (=> (not res!240786) (not e!247537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414145 (= res!240786 (validMask!0 mask!1025))))

(declare-fun b!414146 () Bool)

(declare-fun res!240795 () Bool)

(assert (=> b!414146 (=> (not res!240795) (not e!247543))))

(declare-fun lt!189955 () array!25176)

(declare-datatypes ((List!6880 0))(
  ( (Nil!6877) (Cons!6876 (h!7732 (_ BitVec 64)) (t!12046 List!6880)) )
))
(declare-fun arrayNoDuplicates!0 (array!25176 (_ BitVec 32) List!6880) Bool)

(assert (=> b!414146 (= res!240795 (arrayNoDuplicates!0 lt!189955 #b00000000000000000000000000000000 Nil!6877))))

(declare-fun b!414147 () Bool)

(declare-fun res!240788 () Bool)

(assert (=> b!414147 (=> (not res!240788) (not e!247537))))

(assert (=> b!414147 (= res!240788 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6877))))

(declare-datatypes ((tuple2!6860 0))(
  ( (tuple2!6861 (_1!3441 (_ BitVec 64)) (_2!3441 V!15315)) )
))
(declare-datatypes ((List!6881 0))(
  ( (Nil!6878) (Cons!6877 (h!7733 tuple2!6860) (t!12047 List!6881)) )
))
(declare-datatypes ((ListLongMap!5775 0))(
  ( (ListLongMap!5776 (toList!2903 List!6881)) )
))
(declare-fun call!28681 () ListLongMap!5775)

(declare-fun call!28680 () ListLongMap!5775)

(declare-fun b!414148 () Bool)

(declare-fun +!1180 (ListLongMap!5775 tuple2!6860) ListLongMap!5775)

(assert (=> b!414148 (= e!247535 (= call!28681 (+!1180 call!28680 (tuple2!6861 k0!794 v!412))))))

(declare-fun b!414149 () Bool)

(assert (=> b!414149 (= e!247535 (= call!28680 call!28681))))

(declare-fun lt!189957 () array!25178)

(declare-fun bm!28677 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1152 (array!25176 array!25178 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) Int) ListLongMap!5775)

(assert (=> bm!28677 (= call!28681 (getCurrentListMapNoExtraKeys!1152 (ite c!54948 lt!189955 _keys!709) (ite c!54948 lt!189957 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240789 () Bool)

(assert (=> start!39224 (=> (not res!240789) (not e!247537))))

(assert (=> start!39224 (= res!240789 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12389 _keys!709))))))

(assert (=> start!39224 e!247537))

(declare-fun tp_is_empty!10657 () Bool)

(assert (=> start!39224 tp_is_empty!10657))

(assert (=> start!39224 tp!34043))

(assert (=> start!39224 true))

(declare-fun e!247542 () Bool)

(declare-fun array_inv!8860 (array!25178) Bool)

(assert (=> start!39224 (and (array_inv!8860 _values!549) e!247542)))

(declare-fun array_inv!8861 (array!25176) Bool)

(assert (=> start!39224 (array_inv!8861 _keys!709)))

(declare-fun b!414150 () Bool)

(declare-fun e!247540 () Bool)

(assert (=> b!414150 (= e!247540 tp_is_empty!10657)))

(declare-fun b!414151 () Bool)

(declare-fun res!240797 () Bool)

(assert (=> b!414151 (=> (not res!240797) (not e!247537))))

(assert (=> b!414151 (= res!240797 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12389 _keys!709))))))

(declare-fun mapIsEmpty!17607 () Bool)

(declare-fun mapRes!17607 () Bool)

(assert (=> mapIsEmpty!17607 mapRes!17607))

(declare-fun b!414152 () Bool)

(declare-fun e!247541 () Bool)

(assert (=> b!414152 (= e!247541 tp_is_empty!10657)))

(declare-fun b!414153 () Bool)

(declare-fun res!240792 () Bool)

(assert (=> b!414153 (=> (not res!240792) (not e!247537))))

(declare-fun arrayContainsKey!0 (array!25176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414153 (= res!240792 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414154 () Bool)

(assert (=> b!414154 (= e!247537 e!247543)))

(declare-fun res!240796 () Bool)

(assert (=> b!414154 (=> (not res!240796) (not e!247543))))

(assert (=> b!414154 (= res!240796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189955 mask!1025))))

(assert (=> b!414154 (= lt!189955 (array!25177 (store (arr!12037 _keys!709) i!563 k0!794) (size!12389 _keys!709)))))

(declare-fun b!414155 () Bool)

(declare-fun res!240791 () Bool)

(assert (=> b!414155 (=> (not res!240791) (not e!247537))))

(assert (=> b!414155 (= res!240791 (and (= (size!12390 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12389 _keys!709) (size!12390 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414156 () Bool)

(declare-fun res!240793 () Bool)

(assert (=> b!414156 (=> (not res!240793) (not e!247537))))

(assert (=> b!414156 (= res!240793 (or (= (select (arr!12037 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12037 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28678 () Bool)

(assert (=> bm!28678 (= call!28680 (getCurrentListMapNoExtraKeys!1152 (ite c!54948 _keys!709 lt!189955) (ite c!54948 _values!549 lt!189957) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414157 () Bool)

(assert (=> b!414157 (= e!247542 (and e!247541 mapRes!17607))))

(declare-fun condMapEmpty!17607 () Bool)

(declare-fun mapDefault!17607 () ValueCell!4985)

(assert (=> b!414157 (= condMapEmpty!17607 (= (arr!12038 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4985)) mapDefault!17607)))))

(declare-fun b!414158 () Bool)

(assert (=> b!414158 (= e!247536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12389 _keys!709))))))

(declare-fun mapNonEmpty!17607 () Bool)

(declare-fun tp!34044 () Bool)

(assert (=> mapNonEmpty!17607 (= mapRes!17607 (and tp!34044 e!247540))))

(declare-fun mapValue!17607 () ValueCell!4985)

(declare-fun mapKey!17607 () (_ BitVec 32))

(declare-fun mapRest!17607 () (Array (_ BitVec 32) ValueCell!4985))

(assert (=> mapNonEmpty!17607 (= (arr!12038 _values!549) (store mapRest!17607 mapKey!17607 mapValue!17607))))

(declare-fun b!414159 () Bool)

(declare-fun res!240787 () Bool)

(assert (=> b!414159 (=> (not res!240787) (not e!247537))))

(assert (=> b!414159 (= res!240787 (validKeyInArray!0 k0!794))))

(declare-fun b!414160 () Bool)

(assert (=> b!414160 (= e!247543 e!247538)))

(declare-fun res!240798 () Bool)

(assert (=> b!414160 (=> (not res!240798) (not e!247538))))

(assert (=> b!414160 (= res!240798 (= from!863 i!563))))

(declare-fun lt!189956 () ListLongMap!5775)

(assert (=> b!414160 (= lt!189956 (getCurrentListMapNoExtraKeys!1152 lt!189955 lt!189957 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414160 (= lt!189957 (array!25179 (store (arr!12038 _values!549) i!563 (ValueCellFull!4985 v!412)) (size!12390 _values!549)))))

(declare-fun lt!189954 () ListLongMap!5775)

(assert (=> b!414160 (= lt!189954 (getCurrentListMapNoExtraKeys!1152 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39224 res!240789) b!414145))

(assert (= (and b!414145 res!240786) b!414155))

(assert (= (and b!414155 res!240791) b!414142))

(assert (= (and b!414142 res!240794) b!414147))

(assert (= (and b!414147 res!240788) b!414151))

(assert (= (and b!414151 res!240797) b!414159))

(assert (= (and b!414159 res!240787) b!414156))

(assert (= (and b!414156 res!240793) b!414153))

(assert (= (and b!414153 res!240792) b!414154))

(assert (= (and b!414154 res!240796) b!414146))

(assert (= (and b!414146 res!240795) b!414143))

(assert (= (and b!414143 res!240785) b!414160))

(assert (= (and b!414160 res!240798) b!414144))

(assert (= (and b!414144 c!54948) b!414148))

(assert (= (and b!414144 (not c!54948)) b!414149))

(assert (= (or b!414148 b!414149) bm!28677))

(assert (= (or b!414148 b!414149) bm!28678))

(assert (= (and b!414144 (not res!240790)) b!414158))

(assert (= (and b!414157 condMapEmpty!17607) mapIsEmpty!17607))

(assert (= (and b!414157 (not condMapEmpty!17607)) mapNonEmpty!17607))

(get-info :version)

(assert (= (and mapNonEmpty!17607 ((_ is ValueCellFull!4985) mapValue!17607)) b!414150))

(assert (= (and b!414157 ((_ is ValueCellFull!4985) mapDefault!17607)) b!414152))

(assert (= start!39224 b!414157))

(declare-fun m!403695 () Bool)

(assert (=> bm!28677 m!403695))

(declare-fun m!403697 () Bool)

(assert (=> start!39224 m!403697))

(declare-fun m!403699 () Bool)

(assert (=> start!39224 m!403699))

(declare-fun m!403701 () Bool)

(assert (=> b!414148 m!403701))

(declare-fun m!403703 () Bool)

(assert (=> b!414142 m!403703))

(declare-fun m!403705 () Bool)

(assert (=> b!414144 m!403705))

(assert (=> b!414144 m!403705))

(declare-fun m!403707 () Bool)

(assert (=> b!414144 m!403707))

(declare-fun m!403709 () Bool)

(assert (=> b!414144 m!403709))

(declare-fun m!403711 () Bool)

(assert (=> b!414159 m!403711))

(declare-fun m!403713 () Bool)

(assert (=> b!414153 m!403713))

(declare-fun m!403715 () Bool)

(assert (=> b!414147 m!403715))

(declare-fun m!403717 () Bool)

(assert (=> b!414154 m!403717))

(declare-fun m!403719 () Bool)

(assert (=> b!414154 m!403719))

(declare-fun m!403721 () Bool)

(assert (=> b!414160 m!403721))

(declare-fun m!403723 () Bool)

(assert (=> b!414160 m!403723))

(declare-fun m!403725 () Bool)

(assert (=> b!414160 m!403725))

(declare-fun m!403727 () Bool)

(assert (=> mapNonEmpty!17607 m!403727))

(declare-fun m!403729 () Bool)

(assert (=> b!414156 m!403729))

(declare-fun m!403731 () Bool)

(assert (=> bm!28678 m!403731))

(declare-fun m!403733 () Bool)

(assert (=> b!414146 m!403733))

(declare-fun m!403735 () Bool)

(assert (=> b!414145 m!403735))

(check-sat (not b!414145) b_and!16905 (not b!414160) (not b!414142) (not bm!28678) (not b!414144) (not b!414147) (not b!414153) (not b!414148) (not start!39224) (not b!414159) (not b!414146) tp_is_empty!10657 (not b!414154) (not bm!28677) (not mapNonEmpty!17607) (not b_next!9505))
(check-sat b_and!16905 (not b_next!9505))
