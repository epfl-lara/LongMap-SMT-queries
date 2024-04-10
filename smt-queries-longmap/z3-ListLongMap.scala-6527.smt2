; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83036 () Bool)

(assert start!83036)

(declare-fun mapIsEmpty!34915 () Bool)

(declare-fun mapRes!34915 () Bool)

(assert (=> mapIsEmpty!34915 mapRes!34915))

(declare-fun b!968830 () Bool)

(declare-fun e!546072 () Bool)

(declare-fun tp_is_empty!21939 () Bool)

(assert (=> b!968830 (= e!546072 tp_is_empty!21939)))

(declare-fun b!968831 () Bool)

(declare-fun e!546075 () Bool)

(assert (=> b!968831 (= e!546075 tp_is_empty!21939)))

(declare-fun b!968832 () Bool)

(declare-fun e!546074 () Bool)

(declare-datatypes ((List!20005 0))(
  ( (Nil!20002) (Cons!20001 (h!21163 (_ BitVec 64)) (t!28368 List!20005)) )
))
(declare-fun contains!5545 (List!20005 (_ BitVec 64)) Bool)

(assert (=> b!968832 (= e!546074 (contains!5545 Nil!20002 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!34915 () Bool)

(declare-fun tp!66483 () Bool)

(assert (=> mapNonEmpty!34915 (= mapRes!34915 (and tp!66483 e!546072))))

(declare-datatypes ((V!34235 0))(
  ( (V!34236 (val!11020 Int)) )
))
(declare-datatypes ((ValueCell!10488 0))(
  ( (ValueCellFull!10488 (v!13578 V!34235)) (EmptyCell!10488) )
))
(declare-fun mapValue!34915 () ValueCell!10488)

(declare-fun mapKey!34915 () (_ BitVec 32))

(declare-fun mapRest!34915 () (Array (_ BitVec 32) ValueCell!10488))

(declare-datatypes ((array!59951 0))(
  ( (array!59952 (arr!28840 (Array (_ BitVec 32) ValueCell!10488)) (size!29319 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59951)

(assert (=> mapNonEmpty!34915 (= (arr!28840 _values!1425) (store mapRest!34915 mapKey!34915 mapValue!34915))))

(declare-fun b!968833 () Bool)

(declare-fun e!546076 () Bool)

(assert (=> b!968833 (= e!546076 e!546074)))

(declare-fun res!648529 () Bool)

(assert (=> b!968833 (=> res!648529 e!546074)))

(assert (=> b!968833 (= res!648529 (contains!5545 Nil!20002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!648531 () Bool)

(assert (=> start!83036 (=> (not res!648531) (not e!546076))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83036 (= res!648531 (validMask!0 mask!2147))))

(assert (=> start!83036 e!546076))

(assert (=> start!83036 true))

(declare-fun e!546073 () Bool)

(declare-fun array_inv!22325 (array!59951) Bool)

(assert (=> start!83036 (and (array_inv!22325 _values!1425) e!546073)))

(declare-datatypes ((array!59953 0))(
  ( (array!59954 (arr!28841 (Array (_ BitVec 32) (_ BitVec 64))) (size!29320 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59953)

(declare-fun array_inv!22326 (array!59953) Bool)

(assert (=> start!83036 (array_inv!22326 _keys!1717)))

(declare-fun b!968834 () Bool)

(assert (=> b!968834 (= e!546073 (and e!546075 mapRes!34915))))

(declare-fun condMapEmpty!34915 () Bool)

(declare-fun mapDefault!34915 () ValueCell!10488)

(assert (=> b!968834 (= condMapEmpty!34915 (= (arr!28840 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10488)) mapDefault!34915)))))

(declare-fun b!968835 () Bool)

(declare-fun res!648532 () Bool)

(assert (=> b!968835 (=> (not res!648532) (not e!546076))))

(assert (=> b!968835 (= res!648532 (and (bvsle #b00000000000000000000000000000000 (size!29320 _keys!1717)) (bvslt (size!29320 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun b!968836 () Bool)

(declare-fun res!648528 () Bool)

(assert (=> b!968836 (=> (not res!648528) (not e!546076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59953 (_ BitVec 32)) Bool)

(assert (=> b!968836 (= res!648528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968837 () Bool)

(declare-fun res!648530 () Bool)

(assert (=> b!968837 (=> (not res!648530) (not e!546076))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968837 (= res!648530 (and (= (size!29319 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29320 _keys!1717) (size!29319 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968838 () Bool)

(declare-fun res!648527 () Bool)

(assert (=> b!968838 (=> (not res!648527) (not e!546076))))

(declare-fun noDuplicate!1372 (List!20005) Bool)

(assert (=> b!968838 (= res!648527 (noDuplicate!1372 Nil!20002))))

(assert (= (and start!83036 res!648531) b!968837))

(assert (= (and b!968837 res!648530) b!968836))

(assert (= (and b!968836 res!648528) b!968835))

(assert (= (and b!968835 res!648532) b!968838))

(assert (= (and b!968838 res!648527) b!968833))

(assert (= (and b!968833 (not res!648529)) b!968832))

(assert (= (and b!968834 condMapEmpty!34915) mapIsEmpty!34915))

(assert (= (and b!968834 (not condMapEmpty!34915)) mapNonEmpty!34915))

(get-info :version)

(assert (= (and mapNonEmpty!34915 ((_ is ValueCellFull!10488) mapValue!34915)) b!968830))

(assert (= (and b!968834 ((_ is ValueCellFull!10488) mapDefault!34915)) b!968831))

(assert (= start!83036 b!968834))

(declare-fun m!897031 () Bool)

(assert (=> b!968833 m!897031))

(declare-fun m!897033 () Bool)

(assert (=> mapNonEmpty!34915 m!897033))

(declare-fun m!897035 () Bool)

(assert (=> start!83036 m!897035))

(declare-fun m!897037 () Bool)

(assert (=> start!83036 m!897037))

(declare-fun m!897039 () Bool)

(assert (=> start!83036 m!897039))

(declare-fun m!897041 () Bool)

(assert (=> b!968838 m!897041))

(declare-fun m!897043 () Bool)

(assert (=> b!968836 m!897043))

(declare-fun m!897045 () Bool)

(assert (=> b!968832 m!897045))

(check-sat (not b!968833) tp_is_empty!21939 (not b!968838) (not b!968832) (not b!968836) (not start!83036) (not mapNonEmpty!34915))
(check-sat)
(get-model)

(declare-fun d!116273 () Bool)

(declare-fun lt!431551 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!415 (List!20005) (InoxSet (_ BitVec 64)))

(assert (=> d!116273 (= lt!431551 (select (content!415 Nil!20002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!546100 () Bool)

(assert (=> d!116273 (= lt!431551 e!546100)))

(declare-fun res!648555 () Bool)

(assert (=> d!116273 (=> (not res!648555) (not e!546100))))

(assert (=> d!116273 (= res!648555 ((_ is Cons!20001) Nil!20002))))

(assert (=> d!116273 (= (contains!5545 Nil!20002 #b0000000000000000000000000000000000000000000000000000000000000000) lt!431551)))

(declare-fun b!968870 () Bool)

(declare-fun e!546101 () Bool)

(assert (=> b!968870 (= e!546100 e!546101)))

(declare-fun res!648556 () Bool)

(assert (=> b!968870 (=> res!648556 e!546101)))

(assert (=> b!968870 (= res!648556 (= (h!21163 Nil!20002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968871 () Bool)

(assert (=> b!968871 (= e!546101 (contains!5545 (t!28368 Nil!20002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116273 res!648555) b!968870))

(assert (= (and b!968870 (not res!648556)) b!968871))

(declare-fun m!897063 () Bool)

(assert (=> d!116273 m!897063))

(declare-fun m!897065 () Bool)

(assert (=> d!116273 m!897065))

(declare-fun m!897067 () Bool)

(assert (=> b!968871 m!897067))

(assert (=> b!968833 d!116273))

(declare-fun d!116275 () Bool)

(declare-fun res!648561 () Bool)

(declare-fun e!546106 () Bool)

(assert (=> d!116275 (=> res!648561 e!546106)))

(assert (=> d!116275 (= res!648561 ((_ is Nil!20002) Nil!20002))))

(assert (=> d!116275 (= (noDuplicate!1372 Nil!20002) e!546106)))

(declare-fun b!968876 () Bool)

(declare-fun e!546107 () Bool)

(assert (=> b!968876 (= e!546106 e!546107)))

(declare-fun res!648562 () Bool)

(assert (=> b!968876 (=> (not res!648562) (not e!546107))))

(assert (=> b!968876 (= res!648562 (not (contains!5545 (t!28368 Nil!20002) (h!21163 Nil!20002))))))

(declare-fun b!968877 () Bool)

(assert (=> b!968877 (= e!546107 (noDuplicate!1372 (t!28368 Nil!20002)))))

(assert (= (and d!116275 (not res!648561)) b!968876))

(assert (= (and b!968876 res!648562) b!968877))

(declare-fun m!897069 () Bool)

(assert (=> b!968876 m!897069))

(declare-fun m!897071 () Bool)

(assert (=> b!968877 m!897071))

(assert (=> b!968838 d!116275))

(declare-fun d!116277 () Bool)

(assert (=> d!116277 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83036 d!116277))

(declare-fun d!116279 () Bool)

(assert (=> d!116279 (= (array_inv!22325 _values!1425) (bvsge (size!29319 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83036 d!116279))

(declare-fun d!116281 () Bool)

(assert (=> d!116281 (= (array_inv!22326 _keys!1717) (bvsge (size!29320 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83036 d!116281))

(declare-fun d!116283 () Bool)

(declare-fun lt!431552 () Bool)

(assert (=> d!116283 (= lt!431552 (select (content!415 Nil!20002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!546108 () Bool)

(assert (=> d!116283 (= lt!431552 e!546108)))

(declare-fun res!648563 () Bool)

(assert (=> d!116283 (=> (not res!648563) (not e!546108))))

(assert (=> d!116283 (= res!648563 ((_ is Cons!20001) Nil!20002))))

(assert (=> d!116283 (= (contains!5545 Nil!20002 #b1000000000000000000000000000000000000000000000000000000000000000) lt!431552)))

(declare-fun b!968878 () Bool)

(declare-fun e!546109 () Bool)

(assert (=> b!968878 (= e!546108 e!546109)))

(declare-fun res!648564 () Bool)

(assert (=> b!968878 (=> res!648564 e!546109)))

(assert (=> b!968878 (= res!648564 (= (h!21163 Nil!20002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!968879 () Bool)

(assert (=> b!968879 (= e!546109 (contains!5545 (t!28368 Nil!20002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116283 res!648563) b!968878))

(assert (= (and b!968878 (not res!648564)) b!968879))

(assert (=> d!116283 m!897063))

(declare-fun m!897073 () Bool)

(assert (=> d!116283 m!897073))

(declare-fun m!897075 () Bool)

(assert (=> b!968879 m!897075))

(assert (=> b!968832 d!116283))

(declare-fun d!116285 () Bool)

(declare-fun res!648570 () Bool)

(declare-fun e!546117 () Bool)

(assert (=> d!116285 (=> res!648570 e!546117)))

(assert (=> d!116285 (= res!648570 (bvsge #b00000000000000000000000000000000 (size!29320 _keys!1717)))))

(assert (=> d!116285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546117)))

(declare-fun b!968888 () Bool)

(declare-fun e!546116 () Bool)

(assert (=> b!968888 (= e!546117 e!546116)))

(declare-fun c!99929 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968888 (= c!99929 (validKeyInArray!0 (select (arr!28841 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!968889 () Bool)

(declare-fun e!546118 () Bool)

(declare-fun call!41741 () Bool)

(assert (=> b!968889 (= e!546118 call!41741)))

(declare-fun bm!41738 () Bool)

(assert (=> bm!41738 (= call!41741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968890 () Bool)

(assert (=> b!968890 (= e!546116 e!546118)))

(declare-fun lt!431561 () (_ BitVec 64))

(assert (=> b!968890 (= lt!431561 (select (arr!28841 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32367 0))(
  ( (Unit!32368) )
))
(declare-fun lt!431560 () Unit!32367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59953 (_ BitVec 64) (_ BitVec 32)) Unit!32367)

(assert (=> b!968890 (= lt!431560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431561 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968890 (arrayContainsKey!0 _keys!1717 lt!431561 #b00000000000000000000000000000000)))

(declare-fun lt!431559 () Unit!32367)

(assert (=> b!968890 (= lt!431559 lt!431560)))

(declare-fun res!648569 () Bool)

(declare-datatypes ((SeekEntryResult!9200 0))(
  ( (MissingZero!9200 (index!39171 (_ BitVec 32))) (Found!9200 (index!39172 (_ BitVec 32))) (Intermediate!9200 (undefined!10012 Bool) (index!39173 (_ BitVec 32)) (x!83650 (_ BitVec 32))) (Undefined!9200) (MissingVacant!9200 (index!39174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59953 (_ BitVec 32)) SeekEntryResult!9200)

(assert (=> b!968890 (= res!648569 (= (seekEntryOrOpen!0 (select (arr!28841 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9200 #b00000000000000000000000000000000)))))

(assert (=> b!968890 (=> (not res!648569) (not e!546118))))

(declare-fun b!968891 () Bool)

(assert (=> b!968891 (= e!546116 call!41741)))

(assert (= (and d!116285 (not res!648570)) b!968888))

(assert (= (and b!968888 c!99929) b!968890))

(assert (= (and b!968888 (not c!99929)) b!968891))

(assert (= (and b!968890 res!648569) b!968889))

(assert (= (or b!968889 b!968891) bm!41738))

(declare-fun m!897077 () Bool)

(assert (=> b!968888 m!897077))

(assert (=> b!968888 m!897077))

(declare-fun m!897079 () Bool)

(assert (=> b!968888 m!897079))

(declare-fun m!897081 () Bool)

(assert (=> bm!41738 m!897081))

(assert (=> b!968890 m!897077))

(declare-fun m!897083 () Bool)

(assert (=> b!968890 m!897083))

(declare-fun m!897085 () Bool)

(assert (=> b!968890 m!897085))

(assert (=> b!968890 m!897077))

(declare-fun m!897087 () Bool)

(assert (=> b!968890 m!897087))

(assert (=> b!968836 d!116285))

(declare-fun b!968899 () Bool)

(declare-fun e!546123 () Bool)

(assert (=> b!968899 (= e!546123 tp_is_empty!21939)))

(declare-fun mapIsEmpty!34921 () Bool)

(declare-fun mapRes!34921 () Bool)

(assert (=> mapIsEmpty!34921 mapRes!34921))

(declare-fun b!968898 () Bool)

(declare-fun e!546124 () Bool)

(assert (=> b!968898 (= e!546124 tp_is_empty!21939)))

(declare-fun mapNonEmpty!34921 () Bool)

(declare-fun tp!66489 () Bool)

(assert (=> mapNonEmpty!34921 (= mapRes!34921 (and tp!66489 e!546124))))

(declare-fun mapRest!34921 () (Array (_ BitVec 32) ValueCell!10488))

(declare-fun mapKey!34921 () (_ BitVec 32))

(declare-fun mapValue!34921 () ValueCell!10488)

(assert (=> mapNonEmpty!34921 (= mapRest!34915 (store mapRest!34921 mapKey!34921 mapValue!34921))))

(declare-fun condMapEmpty!34921 () Bool)

(declare-fun mapDefault!34921 () ValueCell!10488)

(assert (=> mapNonEmpty!34915 (= condMapEmpty!34921 (= mapRest!34915 ((as const (Array (_ BitVec 32) ValueCell!10488)) mapDefault!34921)))))

(assert (=> mapNonEmpty!34915 (= tp!66483 (and e!546123 mapRes!34921))))

(assert (= (and mapNonEmpty!34915 condMapEmpty!34921) mapIsEmpty!34921))

(assert (= (and mapNonEmpty!34915 (not condMapEmpty!34921)) mapNonEmpty!34921))

(assert (= (and mapNonEmpty!34921 ((_ is ValueCellFull!10488) mapValue!34921)) b!968898))

(assert (= (and mapNonEmpty!34915 ((_ is ValueCellFull!10488) mapDefault!34921)) b!968899))

(declare-fun m!897089 () Bool)

(assert (=> mapNonEmpty!34921 m!897089))

(check-sat (not b!968877) (not d!116273) tp_is_empty!21939 (not d!116283) (not b!968888) (not bm!41738) (not b!968876) (not b!968879) (not b!968890) (not b!968871) (not mapNonEmpty!34921))
(check-sat)
