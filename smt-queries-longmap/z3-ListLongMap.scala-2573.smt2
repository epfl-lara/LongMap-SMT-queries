; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39258 () Bool)

(assert start!39258)

(declare-fun b_free!9525 () Bool)

(declare-fun b_next!9525 () Bool)

(assert (=> start!39258 (= b_free!9525 (not b_next!9525))))

(declare-fun tp!34104 () Bool)

(declare-fun b_and!16925 () Bool)

(assert (=> start!39258 (= tp!34104 b_and!16925)))

(declare-fun b!414775 () Bool)

(declare-fun res!241215 () Bool)

(declare-fun e!247843 () Bool)

(assert (=> b!414775 (=> (not res!241215) (not e!247843))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414775 (= res!241215 (bvsle from!863 i!563))))

(declare-fun b!414776 () Bool)

(declare-fun e!247839 () Bool)

(declare-fun tp_is_empty!10677 () Bool)

(assert (=> b!414776 (= e!247839 tp_is_empty!10677)))

(declare-fun b!414777 () Bool)

(declare-fun res!241221 () Bool)

(declare-fun e!247837 () Bool)

(assert (=> b!414777 (=> (not res!241221) (not e!247837))))

(declare-datatypes ((array!25211 0))(
  ( (array!25212 (arr!12055 (Array (_ BitVec 32) (_ BitVec 64))) (size!12407 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25211)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25211 (_ BitVec 32)) Bool)

(assert (=> b!414777 (= res!241221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414778 () Bool)

(declare-fun res!241211 () Bool)

(assert (=> b!414778 (=> (not res!241211) (not e!247837))))

(assert (=> b!414778 (= res!241211 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12407 _keys!709))))))

(declare-fun b!414779 () Bool)

(declare-fun res!241208 () Bool)

(assert (=> b!414779 (=> (not res!241208) (not e!247837))))

(assert (=> b!414779 (= res!241208 (or (= (select (arr!12055 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12055 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414780 () Bool)

(declare-fun e!247842 () Bool)

(assert (=> b!414780 (= e!247843 e!247842)))

(declare-fun res!241210 () Bool)

(assert (=> b!414780 (=> (not res!241210) (not e!247842))))

(assert (=> b!414780 (= res!241210 (= from!863 i!563))))

(declare-datatypes ((V!15341 0))(
  ( (V!15342 (val!5383 Int)) )
))
(declare-fun minValue!515 () V!15341)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190084 () array!25211)

(declare-datatypes ((ValueCell!4995 0))(
  ( (ValueCellFull!4995 (v!7630 V!15341)) (EmptyCell!4995) )
))
(declare-datatypes ((array!25213 0))(
  ( (array!25214 (arr!12056 (Array (_ BitVec 32) ValueCell!4995)) (size!12408 (_ BitVec 32))) )
))
(declare-fun lt!190088 () array!25213)

(declare-fun zeroValue!515 () V!15341)

(declare-datatypes ((tuple2!7006 0))(
  ( (tuple2!7007 (_1!3514 (_ BitVec 64)) (_2!3514 V!15341)) )
))
(declare-datatypes ((List!7028 0))(
  ( (Nil!7025) (Cons!7024 (h!7880 tuple2!7006) (t!12218 List!7028)) )
))
(declare-datatypes ((ListLongMap!5919 0))(
  ( (ListLongMap!5920 (toList!2975 List!7028)) )
))
(declare-fun lt!190086 () ListLongMap!5919)

(declare-fun getCurrentListMapNoExtraKeys!1181 (array!25211 array!25213 (_ BitVec 32) (_ BitVec 32) V!15341 V!15341 (_ BitVec 32) Int) ListLongMap!5919)

(assert (=> b!414780 (= lt!190086 (getCurrentListMapNoExtraKeys!1181 lt!190084 lt!190088 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25213)

(declare-fun v!412 () V!15341)

(assert (=> b!414780 (= lt!190088 (array!25214 (store (arr!12056 _values!549) i!563 (ValueCellFull!4995 v!412)) (size!12408 _values!549)))))

(declare-fun lt!190085 () ListLongMap!5919)

(assert (=> b!414780 (= lt!190085 (getCurrentListMapNoExtraKeys!1181 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414781 () Bool)

(declare-fun e!247841 () Bool)

(assert (=> b!414781 (= e!247841 true)))

(declare-fun +!1180 (ListLongMap!5919 tuple2!7006) ListLongMap!5919)

(declare-fun get!5946 (ValueCell!4995 V!15341) V!15341)

(declare-fun dynLambda!657 (Int (_ BitVec 64)) V!15341)

(assert (=> b!414781 (= lt!190086 (+!1180 (getCurrentListMapNoExtraKeys!1181 lt!190084 lt!190088 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7007 (select (arr!12055 lt!190084) from!863) (get!5946 (select (arr!12056 lt!190088) from!863) (dynLambda!657 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414782 () Bool)

(declare-fun res!241212 () Bool)

(assert (=> b!414782 (=> (not res!241212) (not e!247837))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414782 (= res!241212 (validKeyInArray!0 k0!794))))

(declare-fun call!28754 () ListLongMap!5919)

(declare-fun bm!28750 () Bool)

(assert (=> bm!28750 (= call!28754 (getCurrentListMapNoExtraKeys!1181 lt!190084 lt!190088 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28751 () Bool)

(declare-fun call!28753 () ListLongMap!5919)

(assert (=> bm!28751 (= call!28753 (getCurrentListMapNoExtraKeys!1181 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241220 () Bool)

(assert (=> start!39258 (=> (not res!241220) (not e!247837))))

(assert (=> start!39258 (= res!241220 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12407 _keys!709))))))

(assert (=> start!39258 e!247837))

(assert (=> start!39258 tp_is_empty!10677))

(assert (=> start!39258 tp!34104))

(assert (=> start!39258 true))

(declare-fun e!247840 () Bool)

(declare-fun array_inv!8792 (array!25213) Bool)

(assert (=> start!39258 (and (array_inv!8792 _values!549) e!247840)))

(declare-fun array_inv!8793 (array!25211) Bool)

(assert (=> start!39258 (array_inv!8793 _keys!709)))

(declare-fun b!414783 () Bool)

(declare-fun res!241213 () Bool)

(assert (=> b!414783 (=> (not res!241213) (not e!247837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414783 (= res!241213 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17637 () Bool)

(declare-fun mapRes!17637 () Bool)

(declare-fun tp!34103 () Bool)

(declare-fun e!247844 () Bool)

(assert (=> mapNonEmpty!17637 (= mapRes!17637 (and tp!34103 e!247844))))

(declare-fun mapKey!17637 () (_ BitVec 32))

(declare-fun mapRest!17637 () (Array (_ BitVec 32) ValueCell!4995))

(declare-fun mapValue!17637 () ValueCell!4995)

(assert (=> mapNonEmpty!17637 (= (arr!12056 _values!549) (store mapRest!17637 mapKey!17637 mapValue!17637))))

(declare-fun b!414784 () Bool)

(assert (=> b!414784 (= e!247840 (and e!247839 mapRes!17637))))

(declare-fun condMapEmpty!17637 () Bool)

(declare-fun mapDefault!17637 () ValueCell!4995)

(assert (=> b!414784 (= condMapEmpty!17637 (= (arr!12056 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4995)) mapDefault!17637)))))

(declare-fun b!414785 () Bool)

(declare-fun res!241217 () Bool)

(assert (=> b!414785 (=> (not res!241217) (not e!247837))))

(declare-datatypes ((List!7029 0))(
  ( (Nil!7026) (Cons!7025 (h!7881 (_ BitVec 64)) (t!12219 List!7029)) )
))
(declare-fun arrayNoDuplicates!0 (array!25211 (_ BitVec 32) List!7029) Bool)

(assert (=> b!414785 (= res!241217 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7026))))

(declare-fun b!414786 () Bool)

(declare-fun e!247838 () Bool)

(assert (=> b!414786 (= e!247838 (= call!28754 call!28753))))

(declare-fun b!414787 () Bool)

(assert (=> b!414787 (= e!247844 tp_is_empty!10677)))

(declare-fun mapIsEmpty!17637 () Bool)

(assert (=> mapIsEmpty!17637 mapRes!17637))

(declare-fun b!414788 () Bool)

(assert (=> b!414788 (= e!247838 (= call!28754 (+!1180 call!28753 (tuple2!7007 k0!794 v!412))))))

(declare-fun b!414789 () Bool)

(declare-fun res!241219 () Bool)

(assert (=> b!414789 (=> (not res!241219) (not e!247837))))

(declare-fun arrayContainsKey!0 (array!25211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414789 (= res!241219 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414790 () Bool)

(declare-fun res!241216 () Bool)

(assert (=> b!414790 (=> (not res!241216) (not e!247837))))

(assert (=> b!414790 (= res!241216 (and (= (size!12408 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12407 _keys!709) (size!12408 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414791 () Bool)

(declare-fun res!241218 () Bool)

(assert (=> b!414791 (=> (not res!241218) (not e!247843))))

(assert (=> b!414791 (= res!241218 (arrayNoDuplicates!0 lt!190084 #b00000000000000000000000000000000 Nil!7026))))

(declare-fun b!414792 () Bool)

(assert (=> b!414792 (= e!247837 e!247843)))

(declare-fun res!241214 () Bool)

(assert (=> b!414792 (=> (not res!241214) (not e!247843))))

(assert (=> b!414792 (= res!241214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190084 mask!1025))))

(assert (=> b!414792 (= lt!190084 (array!25212 (store (arr!12055 _keys!709) i!563 k0!794) (size!12407 _keys!709)))))

(declare-fun b!414793 () Bool)

(assert (=> b!414793 (= e!247842 (not e!247841))))

(declare-fun res!241209 () Bool)

(assert (=> b!414793 (=> res!241209 e!247841)))

(assert (=> b!414793 (= res!241209 (validKeyInArray!0 (select (arr!12055 _keys!709) from!863)))))

(assert (=> b!414793 e!247838))

(declare-fun c!55001 () Bool)

(assert (=> b!414793 (= c!55001 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12266 0))(
  ( (Unit!12267) )
))
(declare-fun lt!190087 () Unit!12266)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!391 (array!25211 array!25213 (_ BitVec 32) (_ BitVec 32) V!15341 V!15341 (_ BitVec 32) (_ BitVec 64) V!15341 (_ BitVec 32) Int) Unit!12266)

(assert (=> b!414793 (= lt!190087 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!391 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39258 res!241220) b!414783))

(assert (= (and b!414783 res!241213) b!414790))

(assert (= (and b!414790 res!241216) b!414777))

(assert (= (and b!414777 res!241221) b!414785))

(assert (= (and b!414785 res!241217) b!414778))

(assert (= (and b!414778 res!241211) b!414782))

(assert (= (and b!414782 res!241212) b!414779))

(assert (= (and b!414779 res!241208) b!414789))

(assert (= (and b!414789 res!241219) b!414792))

(assert (= (and b!414792 res!241214) b!414791))

(assert (= (and b!414791 res!241218) b!414775))

(assert (= (and b!414775 res!241215) b!414780))

(assert (= (and b!414780 res!241210) b!414793))

(assert (= (and b!414793 c!55001) b!414788))

(assert (= (and b!414793 (not c!55001)) b!414786))

(assert (= (or b!414788 b!414786) bm!28751))

(assert (= (or b!414788 b!414786) bm!28750))

(assert (= (and b!414793 (not res!241209)) b!414781))

(assert (= (and b!414784 condMapEmpty!17637) mapIsEmpty!17637))

(assert (= (and b!414784 (not condMapEmpty!17637)) mapNonEmpty!17637))

(get-info :version)

(assert (= (and mapNonEmpty!17637 ((_ is ValueCellFull!4995) mapValue!17637)) b!414787))

(assert (= (and b!414784 ((_ is ValueCellFull!4995) mapDefault!17637)) b!414776))

(assert (= start!39258 b!414784))

(declare-fun b_lambda!8829 () Bool)

(assert (=> (not b_lambda!8829) (not b!414781)))

(declare-fun t!12217 () Bool)

(declare-fun tb!3147 () Bool)

(assert (=> (and start!39258 (= defaultEntry!557 defaultEntry!557) t!12217) tb!3147))

(declare-fun result!5821 () Bool)

(assert (=> tb!3147 (= result!5821 tp_is_empty!10677)))

(assert (=> b!414781 t!12217))

(declare-fun b_and!16927 () Bool)

(assert (= b_and!16925 (and (=> t!12217 result!5821) b_and!16927)))

(declare-fun m!403969 () Bool)

(assert (=> b!414779 m!403969))

(declare-fun m!403971 () Bool)

(assert (=> b!414777 m!403971))

(declare-fun m!403973 () Bool)

(assert (=> b!414789 m!403973))

(declare-fun m!403975 () Bool)

(assert (=> bm!28750 m!403975))

(declare-fun m!403977 () Bool)

(assert (=> b!414785 m!403977))

(declare-fun m!403979 () Bool)

(assert (=> bm!28751 m!403979))

(declare-fun m!403981 () Bool)

(assert (=> b!414780 m!403981))

(declare-fun m!403983 () Bool)

(assert (=> b!414780 m!403983))

(declare-fun m!403985 () Bool)

(assert (=> b!414780 m!403985))

(declare-fun m!403987 () Bool)

(assert (=> b!414781 m!403987))

(declare-fun m!403989 () Bool)

(assert (=> b!414781 m!403989))

(assert (=> b!414781 m!403975))

(assert (=> b!414781 m!403975))

(declare-fun m!403991 () Bool)

(assert (=> b!414781 m!403991))

(declare-fun m!403993 () Bool)

(assert (=> b!414781 m!403993))

(assert (=> b!414781 m!403987))

(assert (=> b!414781 m!403989))

(declare-fun m!403995 () Bool)

(assert (=> b!414781 m!403995))

(declare-fun m!403997 () Bool)

(assert (=> b!414782 m!403997))

(declare-fun m!403999 () Bool)

(assert (=> b!414783 m!403999))

(declare-fun m!404001 () Bool)

(assert (=> b!414788 m!404001))

(declare-fun m!404003 () Bool)

(assert (=> start!39258 m!404003))

(declare-fun m!404005 () Bool)

(assert (=> start!39258 m!404005))

(declare-fun m!404007 () Bool)

(assert (=> b!414793 m!404007))

(assert (=> b!414793 m!404007))

(declare-fun m!404009 () Bool)

(assert (=> b!414793 m!404009))

(declare-fun m!404011 () Bool)

(assert (=> b!414793 m!404011))

(declare-fun m!404013 () Bool)

(assert (=> b!414791 m!404013))

(declare-fun m!404015 () Bool)

(assert (=> mapNonEmpty!17637 m!404015))

(declare-fun m!404017 () Bool)

(assert (=> b!414792 m!404017))

(declare-fun m!404019 () Bool)

(assert (=> b!414792 m!404019))

(check-sat (not b_lambda!8829) (not b!414791) (not mapNonEmpty!17637) (not b!414780) (not bm!28750) (not b!414792) tp_is_empty!10677 b_and!16927 (not b!414777) (not b!414782) (not b!414793) (not start!39258) (not b!414785) (not b_next!9525) (not b!414781) (not bm!28751) (not b!414789) (not b!414783) (not b!414788))
(check-sat b_and!16927 (not b_next!9525))
