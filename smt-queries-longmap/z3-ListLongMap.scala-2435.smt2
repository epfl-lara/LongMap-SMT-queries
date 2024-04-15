; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38396 () Bool)

(assert start!38396)

(declare-fun b!395891 () Bool)

(declare-fun e!239579 () Bool)

(declare-datatypes ((List!6482 0))(
  ( (Nil!6479) (Cons!6478 (h!7334 (_ BitVec 64)) (t!11647 List!6482)) )
))
(declare-fun contains!2472 (List!6482 (_ BitVec 64)) Bool)

(assert (=> b!395891 (= e!239579 (contains!2472 Nil!6479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!395892 () Bool)

(declare-fun res!227098 () Bool)

(declare-fun e!239584 () Bool)

(assert (=> b!395892 (=> (not res!227098) (not e!239584))))

(declare-datatypes ((array!23591 0))(
  ( (array!23592 (arr!11246 (Array (_ BitVec 32) (_ BitVec 64))) (size!11599 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23591)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23591 (_ BitVec 32)) Bool)

(assert (=> b!395892 (= res!227098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395893 () Bool)

(declare-fun res!227094 () Bool)

(assert (=> b!395893 (=> (not res!227094) (not e!239584))))

(declare-fun noDuplicate!202 (List!6482) Bool)

(assert (=> b!395893 (= res!227094 (noDuplicate!202 Nil!6479))))

(declare-fun b!395894 () Bool)

(declare-fun res!227099 () Bool)

(assert (=> b!395894 (=> (not res!227099) (not e!239584))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395894 (= res!227099 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11599 _keys!709))))))

(declare-fun b!395895 () Bool)

(declare-fun res!227102 () Bool)

(assert (=> b!395895 (=> (not res!227102) (not e!239584))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395895 (= res!227102 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395897 () Bool)

(declare-fun res!227105 () Bool)

(assert (=> b!395897 (=> (not res!227105) (not e!239584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395897 (= res!227105 (validMask!0 mask!1025))))

(declare-fun b!395898 () Bool)

(declare-fun e!239581 () Bool)

(declare-fun tp_is_empty!9847 () Bool)

(assert (=> b!395898 (= e!239581 tp_is_empty!9847)))

(declare-fun b!395899 () Bool)

(declare-fun res!227095 () Bool)

(assert (=> b!395899 (=> (not res!227095) (not e!239584))))

(assert (=> b!395899 (= res!227095 (and (bvsle #b00000000000000000000000000000000 (size!11599 _keys!709)) (bvslt (size!11599 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395900 () Bool)

(declare-fun res!227104 () Bool)

(assert (=> b!395900 (=> (not res!227104) (not e!239584))))

(assert (=> b!395900 (= res!227104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) mask!1025))))

(declare-fun b!395901 () Bool)

(declare-fun res!227100 () Bool)

(assert (=> b!395901 (=> (not res!227100) (not e!239584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395901 (= res!227100 (validKeyInArray!0 k0!794))))

(declare-fun b!395902 () Bool)

(declare-fun res!227093 () Bool)

(assert (=> b!395902 (=> (not res!227093) (not e!239584))))

(declare-fun arrayNoDuplicates!0 (array!23591 (_ BitVec 32) List!6482) Bool)

(assert (=> b!395902 (= res!227093 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6479))))

(declare-fun b!395903 () Bool)

(assert (=> b!395903 (= e!239584 e!239579)))

(declare-fun res!227101 () Bool)

(assert (=> b!395903 (=> res!227101 e!239579)))

(assert (=> b!395903 (= res!227101 (contains!2472 Nil!6479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!16389 () Bool)

(declare-fun mapRes!16389 () Bool)

(assert (=> mapIsEmpty!16389 mapRes!16389))

(declare-fun b!395904 () Bool)

(declare-fun e!239583 () Bool)

(assert (=> b!395904 (= e!239583 tp_is_empty!9847)))

(declare-fun b!395905 () Bool)

(declare-fun e!239582 () Bool)

(assert (=> b!395905 (= e!239582 (and e!239581 mapRes!16389))))

(declare-fun condMapEmpty!16389 () Bool)

(declare-datatypes ((V!14235 0))(
  ( (V!14236 (val!4968 Int)) )
))
(declare-datatypes ((ValueCell!4580 0))(
  ( (ValueCellFull!4580 (v!7208 V!14235)) (EmptyCell!4580) )
))
(declare-datatypes ((array!23593 0))(
  ( (array!23594 (arr!11247 (Array (_ BitVec 32) ValueCell!4580)) (size!11600 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23593)

(declare-fun mapDefault!16389 () ValueCell!4580)

(assert (=> b!395905 (= condMapEmpty!16389 (= (arr!11247 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4580)) mapDefault!16389)))))

(declare-fun res!227103 () Bool)

(assert (=> start!38396 (=> (not res!227103) (not e!239584))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38396 (= res!227103 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11599 _keys!709))))))

(assert (=> start!38396 e!239584))

(assert (=> start!38396 true))

(declare-fun array_inv!8252 (array!23593) Bool)

(assert (=> start!38396 (and (array_inv!8252 _values!549) e!239582)))

(declare-fun array_inv!8253 (array!23591) Bool)

(assert (=> start!38396 (array_inv!8253 _keys!709)))

(declare-fun b!395896 () Bool)

(declare-fun res!227096 () Bool)

(assert (=> b!395896 (=> (not res!227096) (not e!239584))))

(assert (=> b!395896 (= res!227096 (or (= (select (arr!11246 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11246 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395906 () Bool)

(declare-fun res!227097 () Bool)

(assert (=> b!395906 (=> (not res!227097) (not e!239584))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395906 (= res!227097 (and (= (size!11600 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11599 _keys!709) (size!11600 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16389 () Bool)

(declare-fun tp!32184 () Bool)

(assert (=> mapNonEmpty!16389 (= mapRes!16389 (and tp!32184 e!239583))))

(declare-fun mapKey!16389 () (_ BitVec 32))

(declare-fun mapRest!16389 () (Array (_ BitVec 32) ValueCell!4580))

(declare-fun mapValue!16389 () ValueCell!4580)

(assert (=> mapNonEmpty!16389 (= (arr!11247 _values!549) (store mapRest!16389 mapKey!16389 mapValue!16389))))

(assert (= (and start!38396 res!227103) b!395897))

(assert (= (and b!395897 res!227105) b!395906))

(assert (= (and b!395906 res!227097) b!395892))

(assert (= (and b!395892 res!227098) b!395902))

(assert (= (and b!395902 res!227093) b!395894))

(assert (= (and b!395894 res!227099) b!395901))

(assert (= (and b!395901 res!227100) b!395896))

(assert (= (and b!395896 res!227096) b!395895))

(assert (= (and b!395895 res!227102) b!395900))

(assert (= (and b!395900 res!227104) b!395899))

(assert (= (and b!395899 res!227095) b!395893))

(assert (= (and b!395893 res!227094) b!395903))

(assert (= (and b!395903 (not res!227101)) b!395891))

(assert (= (and b!395905 condMapEmpty!16389) mapIsEmpty!16389))

(assert (= (and b!395905 (not condMapEmpty!16389)) mapNonEmpty!16389))

(get-info :version)

(assert (= (and mapNonEmpty!16389 ((_ is ValueCellFull!4580) mapValue!16389)) b!395904))

(assert (= (and b!395905 ((_ is ValueCellFull!4580) mapDefault!16389)) b!395898))

(assert (= start!38396 b!395905))

(declare-fun m!391169 () Bool)

(assert (=> b!395897 m!391169))

(declare-fun m!391171 () Bool)

(assert (=> b!395902 m!391171))

(declare-fun m!391173 () Bool)

(assert (=> b!395896 m!391173))

(declare-fun m!391175 () Bool)

(assert (=> b!395903 m!391175))

(declare-fun m!391177 () Bool)

(assert (=> b!395893 m!391177))

(declare-fun m!391179 () Bool)

(assert (=> b!395900 m!391179))

(declare-fun m!391181 () Bool)

(assert (=> b!395900 m!391181))

(declare-fun m!391183 () Bool)

(assert (=> b!395895 m!391183))

(declare-fun m!391185 () Bool)

(assert (=> b!395892 m!391185))

(declare-fun m!391187 () Bool)

(assert (=> mapNonEmpty!16389 m!391187))

(declare-fun m!391189 () Bool)

(assert (=> b!395891 m!391189))

(declare-fun m!391191 () Bool)

(assert (=> b!395901 m!391191))

(declare-fun m!391193 () Bool)

(assert (=> start!38396 m!391193))

(declare-fun m!391195 () Bool)

(assert (=> start!38396 m!391195))

(check-sat (not b!395900) (not b!395895) (not b!395897) (not b!395891) (not b!395903) (not mapNonEmpty!16389) (not b!395901) (not b!395902) tp_is_empty!9847 (not b!395892) (not b!395893) (not start!38396))
(check-sat)
(get-model)

(declare-fun d!73191 () Bool)

(declare-fun res!227188 () Bool)

(declare-fun e!239625 () Bool)

(assert (=> d!73191 (=> res!227188 e!239625)))

(assert (=> d!73191 (= res!227188 ((_ is Nil!6479) Nil!6479))))

(assert (=> d!73191 (= (noDuplicate!202 Nil!6479) e!239625)))

(declare-fun b!396007 () Bool)

(declare-fun e!239626 () Bool)

(assert (=> b!396007 (= e!239625 e!239626)))

(declare-fun res!227189 () Bool)

(assert (=> b!396007 (=> (not res!227189) (not e!239626))))

(assert (=> b!396007 (= res!227189 (not (contains!2472 (t!11647 Nil!6479) (h!7334 Nil!6479))))))

(declare-fun b!396008 () Bool)

(assert (=> b!396008 (= e!239626 (noDuplicate!202 (t!11647 Nil!6479)))))

(assert (= (and d!73191 (not res!227188)) b!396007))

(assert (= (and b!396007 res!227189) b!396008))

(declare-fun m!391253 () Bool)

(assert (=> b!396007 m!391253))

(declare-fun m!391255 () Bool)

(assert (=> b!396008 m!391255))

(assert (=> b!395893 d!73191))

(declare-fun call!27867 () Bool)

(declare-fun bm!27864 () Bool)

(assert (=> bm!27864 (= call!27867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) mask!1025))))

(declare-fun b!396017 () Bool)

(declare-fun e!239633 () Bool)

(assert (=> b!396017 (= e!239633 call!27867)))

(declare-fun d!73193 () Bool)

(declare-fun res!227194 () Bool)

(declare-fun e!239635 () Bool)

(assert (=> d!73193 (=> res!227194 e!239635)))

(assert (=> d!73193 (= res!227194 (bvsge #b00000000000000000000000000000000 (size!11599 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)))))))

(assert (=> d!73193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) mask!1025) e!239635)))

(declare-fun b!396018 () Bool)

(assert (=> b!396018 (= e!239635 e!239633)))

(declare-fun c!54497 () Bool)

(assert (=> b!396018 (= c!54497 (validKeyInArray!0 (select (arr!11246 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun b!396019 () Bool)

(declare-fun e!239634 () Bool)

(assert (=> b!396019 (= e!239633 e!239634)))

(declare-fun lt!186891 () (_ BitVec 64))

(assert (=> b!396019 (= lt!186891 (select (arr!11246 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12046 0))(
  ( (Unit!12047) )
))
(declare-fun lt!186892 () Unit!12046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23591 (_ BitVec 64) (_ BitVec 32)) Unit!12046)

(assert (=> b!396019 (= lt!186892 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) lt!186891 #b00000000000000000000000000000000))))

(assert (=> b!396019 (arrayContainsKey!0 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) lt!186891 #b00000000000000000000000000000000)))

(declare-fun lt!186890 () Unit!12046)

(assert (=> b!396019 (= lt!186890 lt!186892)))

(declare-fun res!227195 () Bool)

(declare-datatypes ((SeekEntryResult!3521 0))(
  ( (MissingZero!3521 (index!16263 (_ BitVec 32))) (Found!3521 (index!16264 (_ BitVec 32))) (Intermediate!3521 (undefined!4333 Bool) (index!16265 (_ BitVec 32)) (x!38684 (_ BitVec 32))) (Undefined!3521) (MissingVacant!3521 (index!16266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23591 (_ BitVec 32)) SeekEntryResult!3521)

(assert (=> b!396019 (= res!227195 (= (seekEntryOrOpen!0 (select (arr!11246 (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709))) #b00000000000000000000000000000000) (array!23592 (store (arr!11246 _keys!709) i!563 k0!794) (size!11599 _keys!709)) mask!1025) (Found!3521 #b00000000000000000000000000000000)))))

(assert (=> b!396019 (=> (not res!227195) (not e!239634))))

(declare-fun b!396020 () Bool)

(assert (=> b!396020 (= e!239634 call!27867)))

(assert (= (and d!73193 (not res!227194)) b!396018))

(assert (= (and b!396018 c!54497) b!396019))

(assert (= (and b!396018 (not c!54497)) b!396017))

(assert (= (and b!396019 res!227195) b!396020))

(assert (= (or b!396020 b!396017) bm!27864))

(declare-fun m!391257 () Bool)

(assert (=> bm!27864 m!391257))

(declare-fun m!391259 () Bool)

(assert (=> b!396018 m!391259))

(assert (=> b!396018 m!391259))

(declare-fun m!391261 () Bool)

(assert (=> b!396018 m!391261))

(assert (=> b!396019 m!391259))

(declare-fun m!391263 () Bool)

(assert (=> b!396019 m!391263))

(declare-fun m!391265 () Bool)

(assert (=> b!396019 m!391265))

(assert (=> b!396019 m!391259))

(declare-fun m!391267 () Bool)

(assert (=> b!396019 m!391267))

(assert (=> b!395900 d!73193))

(declare-fun d!73195 () Bool)

(declare-fun res!227200 () Bool)

(declare-fun e!239640 () Bool)

(assert (=> d!73195 (=> res!227200 e!239640)))

(assert (=> d!73195 (= res!227200 (= (select (arr!11246 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73195 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239640)))

(declare-fun b!396025 () Bool)

(declare-fun e!239641 () Bool)

(assert (=> b!396025 (= e!239640 e!239641)))

(declare-fun res!227201 () Bool)

(assert (=> b!396025 (=> (not res!227201) (not e!239641))))

(assert (=> b!396025 (= res!227201 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11599 _keys!709)))))

(declare-fun b!396026 () Bool)

(assert (=> b!396026 (= e!239641 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73195 (not res!227200)) b!396025))

(assert (= (and b!396025 res!227201) b!396026))

(declare-fun m!391269 () Bool)

(assert (=> d!73195 m!391269))

(declare-fun m!391271 () Bool)

(assert (=> b!396026 m!391271))

(assert (=> b!395895 d!73195))

(declare-fun d!73197 () Bool)

(declare-fun lt!186895 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!203 (List!6482) (InoxSet (_ BitVec 64)))

(assert (=> d!73197 (= lt!186895 (select (content!203 Nil!6479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239647 () Bool)

(assert (=> d!73197 (= lt!186895 e!239647)))

(declare-fun res!227207 () Bool)

(assert (=> d!73197 (=> (not res!227207) (not e!239647))))

(assert (=> d!73197 (= res!227207 ((_ is Cons!6478) Nil!6479))))

(assert (=> d!73197 (= (contains!2472 Nil!6479 #b1000000000000000000000000000000000000000000000000000000000000000) lt!186895)))

(declare-fun b!396031 () Bool)

(declare-fun e!239646 () Bool)

(assert (=> b!396031 (= e!239647 e!239646)))

(declare-fun res!227206 () Bool)

(assert (=> b!396031 (=> res!227206 e!239646)))

(assert (=> b!396031 (= res!227206 (= (h!7334 Nil!6479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396032 () Bool)

(assert (=> b!396032 (= e!239646 (contains!2472 (t!11647 Nil!6479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73197 res!227207) b!396031))

(assert (= (and b!396031 (not res!227206)) b!396032))

(declare-fun m!391273 () Bool)

(assert (=> d!73197 m!391273))

(declare-fun m!391275 () Bool)

(assert (=> d!73197 m!391275))

(declare-fun m!391277 () Bool)

(assert (=> b!396032 m!391277))

(assert (=> b!395891 d!73197))

(declare-fun d!73199 () Bool)

(assert (=> d!73199 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395901 d!73199))

(declare-fun bm!27865 () Bool)

(declare-fun call!27868 () Bool)

(assert (=> bm!27865 (= call!27868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!396033 () Bool)

(declare-fun e!239648 () Bool)

(assert (=> b!396033 (= e!239648 call!27868)))

(declare-fun d!73201 () Bool)

(declare-fun res!227208 () Bool)

(declare-fun e!239650 () Bool)

(assert (=> d!73201 (=> res!227208 e!239650)))

(assert (=> d!73201 (= res!227208 (bvsge #b00000000000000000000000000000000 (size!11599 _keys!709)))))

(assert (=> d!73201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239650)))

(declare-fun b!396034 () Bool)

(assert (=> b!396034 (= e!239650 e!239648)))

(declare-fun c!54498 () Bool)

(assert (=> b!396034 (= c!54498 (validKeyInArray!0 (select (arr!11246 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396035 () Bool)

(declare-fun e!239649 () Bool)

(assert (=> b!396035 (= e!239648 e!239649)))

(declare-fun lt!186897 () (_ BitVec 64))

(assert (=> b!396035 (= lt!186897 (select (arr!11246 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!186898 () Unit!12046)

(assert (=> b!396035 (= lt!186898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186897 #b00000000000000000000000000000000))))

(assert (=> b!396035 (arrayContainsKey!0 _keys!709 lt!186897 #b00000000000000000000000000000000)))

(declare-fun lt!186896 () Unit!12046)

(assert (=> b!396035 (= lt!186896 lt!186898)))

(declare-fun res!227209 () Bool)

(assert (=> b!396035 (= res!227209 (= (seekEntryOrOpen!0 (select (arr!11246 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3521 #b00000000000000000000000000000000)))))

(assert (=> b!396035 (=> (not res!227209) (not e!239649))))

(declare-fun b!396036 () Bool)

(assert (=> b!396036 (= e!239649 call!27868)))

(assert (= (and d!73201 (not res!227208)) b!396034))

(assert (= (and b!396034 c!54498) b!396035))

(assert (= (and b!396034 (not c!54498)) b!396033))

(assert (= (and b!396035 res!227209) b!396036))

(assert (= (or b!396036 b!396033) bm!27865))

(declare-fun m!391279 () Bool)

(assert (=> bm!27865 m!391279))

(assert (=> b!396034 m!391269))

(assert (=> b!396034 m!391269))

(declare-fun m!391281 () Bool)

(assert (=> b!396034 m!391281))

(assert (=> b!396035 m!391269))

(declare-fun m!391283 () Bool)

(assert (=> b!396035 m!391283))

(declare-fun m!391285 () Bool)

(assert (=> b!396035 m!391285))

(assert (=> b!396035 m!391269))

(declare-fun m!391287 () Bool)

(assert (=> b!396035 m!391287))

(assert (=> b!395892 d!73201))

(declare-fun d!73203 () Bool)

(declare-fun lt!186899 () Bool)

(assert (=> d!73203 (= lt!186899 (select (content!203 Nil!6479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239652 () Bool)

(assert (=> d!73203 (= lt!186899 e!239652)))

(declare-fun res!227211 () Bool)

(assert (=> d!73203 (=> (not res!227211) (not e!239652))))

(assert (=> d!73203 (= res!227211 ((_ is Cons!6478) Nil!6479))))

(assert (=> d!73203 (= (contains!2472 Nil!6479 #b0000000000000000000000000000000000000000000000000000000000000000) lt!186899)))

(declare-fun b!396037 () Bool)

(declare-fun e!239651 () Bool)

(assert (=> b!396037 (= e!239652 e!239651)))

(declare-fun res!227210 () Bool)

(assert (=> b!396037 (=> res!227210 e!239651)))

(assert (=> b!396037 (= res!227210 (= (h!7334 Nil!6479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396038 () Bool)

(assert (=> b!396038 (= e!239651 (contains!2472 (t!11647 Nil!6479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73203 res!227211) b!396037))

(assert (= (and b!396037 (not res!227210)) b!396038))

(assert (=> d!73203 m!391273))

(declare-fun m!391289 () Bool)

(assert (=> d!73203 m!391289))

(declare-fun m!391291 () Bool)

(assert (=> b!396038 m!391291))

(assert (=> b!395903 d!73203))

(declare-fun d!73205 () Bool)

(declare-fun res!227219 () Bool)

(declare-fun e!239663 () Bool)

(assert (=> d!73205 (=> res!227219 e!239663)))

(assert (=> d!73205 (= res!227219 (bvsge #b00000000000000000000000000000000 (size!11599 _keys!709)))))

(assert (=> d!73205 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6479) e!239663)))

(declare-fun b!396049 () Bool)

(declare-fun e!239664 () Bool)

(declare-fun call!27871 () Bool)

(assert (=> b!396049 (= e!239664 call!27871)))

(declare-fun bm!27868 () Bool)

(declare-fun c!54501 () Bool)

(assert (=> bm!27868 (= call!27871 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54501 (Cons!6478 (select (arr!11246 _keys!709) #b00000000000000000000000000000000) Nil!6479) Nil!6479)))))

(declare-fun b!396050 () Bool)

(declare-fun e!239661 () Bool)

(assert (=> b!396050 (= e!239661 e!239664)))

(assert (=> b!396050 (= c!54501 (validKeyInArray!0 (select (arr!11246 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396051 () Bool)

(assert (=> b!396051 (= e!239663 e!239661)))

(declare-fun res!227220 () Bool)

(assert (=> b!396051 (=> (not res!227220) (not e!239661))))

(declare-fun e!239662 () Bool)

(assert (=> b!396051 (= res!227220 (not e!239662))))

(declare-fun res!227218 () Bool)

(assert (=> b!396051 (=> (not res!227218) (not e!239662))))

(assert (=> b!396051 (= res!227218 (validKeyInArray!0 (select (arr!11246 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396052 () Bool)

(assert (=> b!396052 (= e!239662 (contains!2472 Nil!6479 (select (arr!11246 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396053 () Bool)

(assert (=> b!396053 (= e!239664 call!27871)))

(assert (= (and d!73205 (not res!227219)) b!396051))

(assert (= (and b!396051 res!227218) b!396052))

(assert (= (and b!396051 res!227220) b!396050))

(assert (= (and b!396050 c!54501) b!396053))

(assert (= (and b!396050 (not c!54501)) b!396049))

(assert (= (or b!396053 b!396049) bm!27868))

(assert (=> bm!27868 m!391269))

(declare-fun m!391293 () Bool)

(assert (=> bm!27868 m!391293))

(assert (=> b!396050 m!391269))

(assert (=> b!396050 m!391269))

(assert (=> b!396050 m!391281))

(assert (=> b!396051 m!391269))

(assert (=> b!396051 m!391269))

(assert (=> b!396051 m!391281))

(assert (=> b!396052 m!391269))

(assert (=> b!396052 m!391269))

(declare-fun m!391295 () Bool)

(assert (=> b!396052 m!391295))

(assert (=> b!395902 d!73205))

(declare-fun d!73207 () Bool)

(assert (=> d!73207 (= (array_inv!8252 _values!549) (bvsge (size!11600 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38396 d!73207))

(declare-fun d!73209 () Bool)

(assert (=> d!73209 (= (array_inv!8253 _keys!709) (bvsge (size!11599 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38396 d!73209))

(declare-fun d!73211 () Bool)

(assert (=> d!73211 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395897 d!73211))

(declare-fun condMapEmpty!16398 () Bool)

(declare-fun mapDefault!16398 () ValueCell!4580)

(assert (=> mapNonEmpty!16389 (= condMapEmpty!16398 (= mapRest!16389 ((as const (Array (_ BitVec 32) ValueCell!4580)) mapDefault!16398)))))

(declare-fun e!239670 () Bool)

(declare-fun mapRes!16398 () Bool)

(assert (=> mapNonEmpty!16389 (= tp!32184 (and e!239670 mapRes!16398))))

(declare-fun b!396060 () Bool)

(declare-fun e!239669 () Bool)

(assert (=> b!396060 (= e!239669 tp_is_empty!9847)))

(declare-fun mapNonEmpty!16398 () Bool)

(declare-fun tp!32193 () Bool)

(assert (=> mapNonEmpty!16398 (= mapRes!16398 (and tp!32193 e!239669))))

(declare-fun mapValue!16398 () ValueCell!4580)

(declare-fun mapKey!16398 () (_ BitVec 32))

(declare-fun mapRest!16398 () (Array (_ BitVec 32) ValueCell!4580))

(assert (=> mapNonEmpty!16398 (= mapRest!16389 (store mapRest!16398 mapKey!16398 mapValue!16398))))

(declare-fun mapIsEmpty!16398 () Bool)

(assert (=> mapIsEmpty!16398 mapRes!16398))

(declare-fun b!396061 () Bool)

(assert (=> b!396061 (= e!239670 tp_is_empty!9847)))

(assert (= (and mapNonEmpty!16389 condMapEmpty!16398) mapIsEmpty!16398))

(assert (= (and mapNonEmpty!16389 (not condMapEmpty!16398)) mapNonEmpty!16398))

(assert (= (and mapNonEmpty!16398 ((_ is ValueCellFull!4580) mapValue!16398)) b!396060))

(assert (= (and mapNonEmpty!16389 ((_ is ValueCellFull!4580) mapDefault!16398)) b!396061))

(declare-fun m!391297 () Bool)

(assert (=> mapNonEmpty!16398 m!391297))

(check-sat (not b!396008) (not b!396007) (not bm!27865) tp_is_empty!9847 (not mapNonEmpty!16398) (not b!396034) (not b!396026) (not b!396035) (not bm!27868) (not bm!27864) (not d!73203) (not b!396052) (not b!396032) (not b!396018) (not b!396050) (not b!396038) (not b!396019) (not b!396051) (not d!73197))
(check-sat)
