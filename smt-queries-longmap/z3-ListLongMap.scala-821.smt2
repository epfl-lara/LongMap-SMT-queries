; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20014 () Bool)

(assert start!20014)

(declare-fun b!196081 () Bool)

(declare-fun res!92520 () Bool)

(declare-fun e!129076 () Bool)

(assert (=> b!196081 (=> (not res!92520) (not e!129076))))

(declare-datatypes ((List!2417 0))(
  ( (Nil!2414) (Cons!2413 (h!3055 (_ BitVec 64)) (t!7340 List!2417)) )
))
(declare-fun noDuplicate!60 (List!2417) Bool)

(assert (=> b!196081 (= res!92520 (noDuplicate!60 Nil!2414))))

(declare-fun mapIsEmpty!7871 () Bool)

(declare-fun mapRes!7871 () Bool)

(assert (=> mapIsEmpty!7871 mapRes!7871))

(declare-fun b!196082 () Bool)

(declare-fun e!129077 () Bool)

(declare-fun contains!1370 (List!2417 (_ BitVec 64)) Bool)

(assert (=> b!196082 (= e!129077 (contains!1370 Nil!2414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!92523 () Bool)

(assert (=> start!20014 (=> (not res!92523) (not e!129076))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20014 (= res!92523 (validMask!0 mask!1149))))

(assert (=> start!20014 e!129076))

(assert (=> start!20014 true))

(declare-datatypes ((V!5697 0))(
  ( (V!5698 (val!2313 Int)) )
))
(declare-datatypes ((ValueCell!1925 0))(
  ( (ValueCellFull!1925 (v!4283 V!5697)) (EmptyCell!1925) )
))
(declare-datatypes ((array!8323 0))(
  ( (array!8324 (arr!3913 (Array (_ BitVec 32) ValueCell!1925)) (size!4238 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8323)

(declare-fun e!129073 () Bool)

(declare-fun array_inv!2535 (array!8323) Bool)

(assert (=> start!20014 (and (array_inv!2535 _values!649) e!129073)))

(declare-datatypes ((array!8325 0))(
  ( (array!8326 (arr!3914 (Array (_ BitVec 32) (_ BitVec 64))) (size!4239 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8325)

(declare-fun array_inv!2536 (array!8325) Bool)

(assert (=> start!20014 (array_inv!2536 _keys!825)))

(declare-fun b!196083 () Bool)

(declare-fun res!92522 () Bool)

(assert (=> b!196083 (=> (not res!92522) (not e!129076))))

(assert (=> b!196083 (= res!92522 (and (bvsle #b00000000000000000000000000000000 (size!4239 _keys!825)) (bvslt (size!4239 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!196084 () Bool)

(declare-fun res!92525 () Bool)

(assert (=> b!196084 (=> (not res!92525) (not e!129076))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196084 (= res!92525 (and (= (size!4238 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4239 _keys!825) (size!4238 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196085 () Bool)

(declare-fun e!129078 () Bool)

(declare-fun tp_is_empty!4537 () Bool)

(assert (=> b!196085 (= e!129078 tp_is_empty!4537)))

(declare-fun b!196086 () Bool)

(assert (=> b!196086 (= e!129073 (and e!129078 mapRes!7871))))

(declare-fun condMapEmpty!7871 () Bool)

(declare-fun mapDefault!7871 () ValueCell!1925)

(assert (=> b!196086 (= condMapEmpty!7871 (= (arr!3913 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1925)) mapDefault!7871)))))

(declare-fun b!196087 () Bool)

(assert (=> b!196087 (= e!129076 e!129077)))

(declare-fun res!92524 () Bool)

(assert (=> b!196087 (=> res!92524 e!129077)))

(assert (=> b!196087 (= res!92524 (contains!1370 Nil!2414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196088 () Bool)

(declare-fun e!129075 () Bool)

(assert (=> b!196088 (= e!129075 tp_is_empty!4537)))

(declare-fun b!196089 () Bool)

(declare-fun res!92521 () Bool)

(assert (=> b!196089 (=> (not res!92521) (not e!129076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8325 (_ BitVec 32)) Bool)

(assert (=> b!196089 (= res!92521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7871 () Bool)

(declare-fun tp!17159 () Bool)

(assert (=> mapNonEmpty!7871 (= mapRes!7871 (and tp!17159 e!129075))))

(declare-fun mapKey!7871 () (_ BitVec 32))

(declare-fun mapValue!7871 () ValueCell!1925)

(declare-fun mapRest!7871 () (Array (_ BitVec 32) ValueCell!1925))

(assert (=> mapNonEmpty!7871 (= (arr!3913 _values!649) (store mapRest!7871 mapKey!7871 mapValue!7871))))

(assert (= (and start!20014 res!92523) b!196084))

(assert (= (and b!196084 res!92525) b!196089))

(assert (= (and b!196089 res!92521) b!196083))

(assert (= (and b!196083 res!92522) b!196081))

(assert (= (and b!196081 res!92520) b!196087))

(assert (= (and b!196087 (not res!92524)) b!196082))

(assert (= (and b!196086 condMapEmpty!7871) mapIsEmpty!7871))

(assert (= (and b!196086 (not condMapEmpty!7871)) mapNonEmpty!7871))

(get-info :version)

(assert (= (and mapNonEmpty!7871 ((_ is ValueCellFull!1925) mapValue!7871)) b!196088))

(assert (= (and b!196086 ((_ is ValueCellFull!1925) mapDefault!7871)) b!196085))

(assert (= start!20014 b!196086))

(declare-fun m!223625 () Bool)

(assert (=> b!196087 m!223625))

(declare-fun m!223627 () Bool)

(assert (=> start!20014 m!223627))

(declare-fun m!223629 () Bool)

(assert (=> start!20014 m!223629))

(declare-fun m!223631 () Bool)

(assert (=> start!20014 m!223631))

(declare-fun m!223633 () Bool)

(assert (=> b!196089 m!223633))

(declare-fun m!223635 () Bool)

(assert (=> mapNonEmpty!7871 m!223635))

(declare-fun m!223637 () Bool)

(assert (=> b!196081 m!223637))

(declare-fun m!223639 () Bool)

(assert (=> b!196082 m!223639))

(check-sat (not b!196082) tp_is_empty!4537 (not b!196087) (not b!196081) (not start!20014) (not mapNonEmpty!7871) (not b!196089))
(check-sat)
(get-model)

(declare-fun b!196152 () Bool)

(declare-fun e!129121 () Bool)

(declare-fun e!129123 () Bool)

(assert (=> b!196152 (= e!129121 e!129123)))

(declare-fun c!35448 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196152 (= c!35448 (validKeyInArray!0 (select (arr!3914 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57639 () Bool)

(declare-fun res!92566 () Bool)

(assert (=> d!57639 (=> res!92566 e!129121)))

(assert (=> d!57639 (= res!92566 (bvsge #b00000000000000000000000000000000 (size!4239 _keys!825)))))

(assert (=> d!57639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!129121)))

(declare-fun b!196153 () Bool)

(declare-fun call!19764 () Bool)

(assert (=> b!196153 (= e!129123 call!19764)))

(declare-fun bm!19761 () Bool)

(assert (=> bm!19761 (= call!19764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!196154 () Bool)

(declare-fun e!129122 () Bool)

(assert (=> b!196154 (= e!129122 call!19764)))

(declare-fun b!196155 () Bool)

(assert (=> b!196155 (= e!129123 e!129122)))

(declare-fun lt!97619 () (_ BitVec 64))

(assert (=> b!196155 (= lt!97619 (select (arr!3914 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5928 0))(
  ( (Unit!5929) )
))
(declare-fun lt!97620 () Unit!5928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8325 (_ BitVec 64) (_ BitVec 32)) Unit!5928)

(assert (=> b!196155 (= lt!97620 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97619 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!196155 (arrayContainsKey!0 _keys!825 lt!97619 #b00000000000000000000000000000000)))

(declare-fun lt!97621 () Unit!5928)

(assert (=> b!196155 (= lt!97621 lt!97620)))

(declare-fun res!92567 () Bool)

(declare-datatypes ((SeekEntryResult!692 0))(
  ( (MissingZero!692 (index!4938 (_ BitVec 32))) (Found!692 (index!4939 (_ BitVec 32))) (Intermediate!692 (undefined!1504 Bool) (index!4940 (_ BitVec 32)) (x!20823 (_ BitVec 32))) (Undefined!692) (MissingVacant!692 (index!4941 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8325 (_ BitVec 32)) SeekEntryResult!692)

(assert (=> b!196155 (= res!92567 (= (seekEntryOrOpen!0 (select (arr!3914 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!692 #b00000000000000000000000000000000)))))

(assert (=> b!196155 (=> (not res!92567) (not e!129122))))

(assert (= (and d!57639 (not res!92566)) b!196152))

(assert (= (and b!196152 c!35448) b!196155))

(assert (= (and b!196152 (not c!35448)) b!196153))

(assert (= (and b!196155 res!92567) b!196154))

(assert (= (or b!196154 b!196153) bm!19761))

(declare-fun m!223673 () Bool)

(assert (=> b!196152 m!223673))

(assert (=> b!196152 m!223673))

(declare-fun m!223675 () Bool)

(assert (=> b!196152 m!223675))

(declare-fun m!223677 () Bool)

(assert (=> bm!19761 m!223677))

(assert (=> b!196155 m!223673))

(declare-fun m!223679 () Bool)

(assert (=> b!196155 m!223679))

(declare-fun m!223681 () Bool)

(assert (=> b!196155 m!223681))

(assert (=> b!196155 m!223673))

(declare-fun m!223683 () Bool)

(assert (=> b!196155 m!223683))

(assert (=> b!196089 d!57639))

(declare-fun d!57641 () Bool)

(declare-fun res!92572 () Bool)

(declare-fun e!129128 () Bool)

(assert (=> d!57641 (=> res!92572 e!129128)))

(assert (=> d!57641 (= res!92572 ((_ is Nil!2414) Nil!2414))))

(assert (=> d!57641 (= (noDuplicate!60 Nil!2414) e!129128)))

(declare-fun b!196160 () Bool)

(declare-fun e!129129 () Bool)

(assert (=> b!196160 (= e!129128 e!129129)))

(declare-fun res!92573 () Bool)

(assert (=> b!196160 (=> (not res!92573) (not e!129129))))

(assert (=> b!196160 (= res!92573 (not (contains!1370 (t!7340 Nil!2414) (h!3055 Nil!2414))))))

(declare-fun b!196161 () Bool)

(assert (=> b!196161 (= e!129129 (noDuplicate!60 (t!7340 Nil!2414)))))

(assert (= (and d!57641 (not res!92572)) b!196160))

(assert (= (and b!196160 res!92573) b!196161))

(declare-fun m!223685 () Bool)

(assert (=> b!196160 m!223685))

(declare-fun m!223687 () Bool)

(assert (=> b!196161 m!223687))

(assert (=> b!196081 d!57641))

(declare-fun d!57643 () Bool)

(declare-fun lt!97624 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!158 (List!2417) (InoxSet (_ BitVec 64)))

(assert (=> d!57643 (= lt!97624 (select (content!158 Nil!2414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!129135 () Bool)

(assert (=> d!57643 (= lt!97624 e!129135)))

(declare-fun res!92579 () Bool)

(assert (=> d!57643 (=> (not res!92579) (not e!129135))))

(assert (=> d!57643 (= res!92579 ((_ is Cons!2413) Nil!2414))))

(assert (=> d!57643 (= (contains!1370 Nil!2414 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97624)))

(declare-fun b!196166 () Bool)

(declare-fun e!129134 () Bool)

(assert (=> b!196166 (= e!129135 e!129134)))

(declare-fun res!92578 () Bool)

(assert (=> b!196166 (=> res!92578 e!129134)))

(assert (=> b!196166 (= res!92578 (= (h!3055 Nil!2414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196167 () Bool)

(assert (=> b!196167 (= e!129134 (contains!1370 (t!7340 Nil!2414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57643 res!92579) b!196166))

(assert (= (and b!196166 (not res!92578)) b!196167))

(declare-fun m!223689 () Bool)

(assert (=> d!57643 m!223689))

(declare-fun m!223691 () Bool)

(assert (=> d!57643 m!223691))

(declare-fun m!223693 () Bool)

(assert (=> b!196167 m!223693))

(assert (=> b!196087 d!57643))

(declare-fun d!57645 () Bool)

(declare-fun lt!97625 () Bool)

(assert (=> d!57645 (= lt!97625 (select (content!158 Nil!2414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!129137 () Bool)

(assert (=> d!57645 (= lt!97625 e!129137)))

(declare-fun res!92581 () Bool)

(assert (=> d!57645 (=> (not res!92581) (not e!129137))))

(assert (=> d!57645 (= res!92581 ((_ is Cons!2413) Nil!2414))))

(assert (=> d!57645 (= (contains!1370 Nil!2414 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97625)))

(declare-fun b!196168 () Bool)

(declare-fun e!129136 () Bool)

(assert (=> b!196168 (= e!129137 e!129136)))

(declare-fun res!92580 () Bool)

(assert (=> b!196168 (=> res!92580 e!129136)))

(assert (=> b!196168 (= res!92580 (= (h!3055 Nil!2414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196169 () Bool)

(assert (=> b!196169 (= e!129136 (contains!1370 (t!7340 Nil!2414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57645 res!92581) b!196168))

(assert (= (and b!196168 (not res!92580)) b!196169))

(assert (=> d!57645 m!223689))

(declare-fun m!223695 () Bool)

(assert (=> d!57645 m!223695))

(declare-fun m!223697 () Bool)

(assert (=> b!196169 m!223697))

(assert (=> b!196082 d!57645))

(declare-fun d!57647 () Bool)

(assert (=> d!57647 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20014 d!57647))

(declare-fun d!57649 () Bool)

(assert (=> d!57649 (= (array_inv!2535 _values!649) (bvsge (size!4238 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20014 d!57649))

(declare-fun d!57651 () Bool)

(assert (=> d!57651 (= (array_inv!2536 _keys!825) (bvsge (size!4239 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20014 d!57651))

(declare-fun b!196177 () Bool)

(declare-fun e!129142 () Bool)

(assert (=> b!196177 (= e!129142 tp_is_empty!4537)))

(declare-fun mapNonEmpty!7880 () Bool)

(declare-fun mapRes!7880 () Bool)

(declare-fun tp!17168 () Bool)

(declare-fun e!129143 () Bool)

(assert (=> mapNonEmpty!7880 (= mapRes!7880 (and tp!17168 e!129143))))

(declare-fun mapValue!7880 () ValueCell!1925)

(declare-fun mapKey!7880 () (_ BitVec 32))

(declare-fun mapRest!7880 () (Array (_ BitVec 32) ValueCell!1925))

(assert (=> mapNonEmpty!7880 (= mapRest!7871 (store mapRest!7880 mapKey!7880 mapValue!7880))))

(declare-fun b!196176 () Bool)

(assert (=> b!196176 (= e!129143 tp_is_empty!4537)))

(declare-fun mapIsEmpty!7880 () Bool)

(assert (=> mapIsEmpty!7880 mapRes!7880))

(declare-fun condMapEmpty!7880 () Bool)

(declare-fun mapDefault!7880 () ValueCell!1925)

(assert (=> mapNonEmpty!7871 (= condMapEmpty!7880 (= mapRest!7871 ((as const (Array (_ BitVec 32) ValueCell!1925)) mapDefault!7880)))))

(assert (=> mapNonEmpty!7871 (= tp!17159 (and e!129142 mapRes!7880))))

(assert (= (and mapNonEmpty!7871 condMapEmpty!7880) mapIsEmpty!7880))

(assert (= (and mapNonEmpty!7871 (not condMapEmpty!7880)) mapNonEmpty!7880))

(assert (= (and mapNonEmpty!7880 ((_ is ValueCellFull!1925) mapValue!7880)) b!196176))

(assert (= (and mapNonEmpty!7871 ((_ is ValueCellFull!1925) mapDefault!7880)) b!196177))

(declare-fun m!223699 () Bool)

(assert (=> mapNonEmpty!7880 m!223699))

(check-sat (not mapNonEmpty!7880) (not b!196169) (not d!57643) tp_is_empty!4537 (not b!196160) (not b!196161) (not b!196167) (not b!196152) (not d!57645) (not bm!19761) (not b!196155))
(check-sat)
