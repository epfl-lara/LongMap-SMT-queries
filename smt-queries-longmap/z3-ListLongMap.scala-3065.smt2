; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43234 () Bool)

(assert start!43234)

(declare-fun b!479097 () Bool)

(declare-fun res!285798 () Bool)

(declare-fun e!281823 () Bool)

(assert (=> b!479097 (=> (not res!285798) (not e!281823))))

(declare-datatypes ((array!30919 0))(
  ( (array!30920 (arr!14867 (Array (_ BitVec 32) (_ BitVec 64))) (size!15225 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30919)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30919 (_ BitVec 32)) Bool)

(assert (=> b!479097 (= res!285798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22129 () Bool)

(declare-fun mapRes!22129 () Bool)

(assert (=> mapIsEmpty!22129 mapRes!22129))

(declare-fun b!479098 () Bool)

(declare-fun e!281821 () Bool)

(declare-fun tp_is_empty!13623 () Bool)

(assert (=> b!479098 (= e!281821 tp_is_empty!13623)))

(declare-fun b!479099 () Bool)

(declare-fun e!281822 () Bool)

(assert (=> b!479099 (= e!281822 tp_is_empty!13623)))

(declare-fun b!479101 () Bool)

(declare-fun e!281819 () Bool)

(assert (=> b!479101 (= e!281819 (and e!281822 mapRes!22129))))

(declare-fun condMapEmpty!22129 () Bool)

(declare-datatypes ((V!19235 0))(
  ( (V!19236 (val!6859 Int)) )
))
(declare-datatypes ((ValueCell!6450 0))(
  ( (ValueCellFull!6450 (v!9148 V!19235)) (EmptyCell!6450) )
))
(declare-datatypes ((array!30921 0))(
  ( (array!30922 (arr!14868 (Array (_ BitVec 32) ValueCell!6450)) (size!15226 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30921)

(declare-fun mapDefault!22129 () ValueCell!6450)

(assert (=> b!479101 (= condMapEmpty!22129 (= (arr!14868 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6450)) mapDefault!22129)))))

(declare-fun b!479102 () Bool)

(assert (=> b!479102 (= e!281823 (bvsgt #b00000000000000000000000000000000 (size!15225 _keys!1874)))))

(declare-fun b!479100 () Bool)

(declare-fun res!285799 () Bool)

(assert (=> b!479100 (=> (not res!285799) (not e!281823))))

(declare-datatypes ((List!9082 0))(
  ( (Nil!9079) (Cons!9078 (h!9934 (_ BitVec 64)) (t!15288 List!9082)) )
))
(declare-fun arrayNoDuplicates!0 (array!30919 (_ BitVec 32) List!9082) Bool)

(assert (=> b!479100 (= res!285799 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9079))))

(declare-fun res!285801 () Bool)

(assert (=> start!43234 (=> (not res!285801) (not e!281823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43234 (= res!285801 (validMask!0 mask!2352))))

(assert (=> start!43234 e!281823))

(assert (=> start!43234 true))

(declare-fun array_inv!10728 (array!30921) Bool)

(assert (=> start!43234 (and (array_inv!10728 _values!1516) e!281819)))

(declare-fun array_inv!10729 (array!30919) Bool)

(assert (=> start!43234 (array_inv!10729 _keys!1874)))

(declare-fun b!479103 () Bool)

(declare-fun res!285800 () Bool)

(assert (=> b!479103 (=> (not res!285800) (not e!281823))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479103 (= res!285800 (and (= (size!15226 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15225 _keys!1874) (size!15226 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22129 () Bool)

(declare-fun tp!42604 () Bool)

(assert (=> mapNonEmpty!22129 (= mapRes!22129 (and tp!42604 e!281821))))

(declare-fun mapKey!22129 () (_ BitVec 32))

(declare-fun mapValue!22129 () ValueCell!6450)

(declare-fun mapRest!22129 () (Array (_ BitVec 32) ValueCell!6450))

(assert (=> mapNonEmpty!22129 (= (arr!14868 _values!1516) (store mapRest!22129 mapKey!22129 mapValue!22129))))

(assert (= (and start!43234 res!285801) b!479103))

(assert (= (and b!479103 res!285800) b!479097))

(assert (= (and b!479097 res!285798) b!479100))

(assert (= (and b!479100 res!285799) b!479102))

(assert (= (and b!479101 condMapEmpty!22129) mapIsEmpty!22129))

(assert (= (and b!479101 (not condMapEmpty!22129)) mapNonEmpty!22129))

(get-info :version)

(assert (= (and mapNonEmpty!22129 ((_ is ValueCellFull!6450) mapValue!22129)) b!479098))

(assert (= (and b!479101 ((_ is ValueCellFull!6450) mapDefault!22129)) b!479099))

(assert (= start!43234 b!479101))

(declare-fun m!461141 () Bool)

(assert (=> b!479097 m!461141))

(declare-fun m!461143 () Bool)

(assert (=> b!479100 m!461143))

(declare-fun m!461145 () Bool)

(assert (=> start!43234 m!461145))

(declare-fun m!461147 () Bool)

(assert (=> start!43234 m!461147))

(declare-fun m!461149 () Bool)

(assert (=> start!43234 m!461149))

(declare-fun m!461151 () Bool)

(assert (=> mapNonEmpty!22129 m!461151))

(check-sat (not start!43234) (not b!479097) (not b!479100) tp_is_empty!13623 (not mapNonEmpty!22129))
(check-sat)
(get-model)

(declare-fun d!76653 () Bool)

(assert (=> d!76653 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43234 d!76653))

(declare-fun d!76655 () Bool)

(assert (=> d!76655 (= (array_inv!10728 _values!1516) (bvsge (size!15226 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43234 d!76655))

(declare-fun d!76657 () Bool)

(assert (=> d!76657 (= (array_inv!10729 _keys!1874) (bvsge (size!15225 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43234 d!76657))

(declare-fun b!479133 () Bool)

(declare-fun e!281845 () Bool)

(declare-fun e!281847 () Bool)

(assert (=> b!479133 (= e!281845 e!281847)))

(declare-fun c!57673 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479133 (= c!57673 (validKeyInArray!0 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479134 () Bool)

(declare-fun e!281846 () Bool)

(declare-fun call!30844 () Bool)

(assert (=> b!479134 (= e!281846 call!30844)))

(declare-fun b!479135 () Bool)

(assert (=> b!479135 (= e!281847 call!30844)))

(declare-fun d!76659 () Bool)

(declare-fun res!285819 () Bool)

(assert (=> d!76659 (=> res!285819 e!281845)))

(assert (=> d!76659 (= res!285819 (bvsge #b00000000000000000000000000000000 (size!15225 _keys!1874)))))

(assert (=> d!76659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281845)))

(declare-fun bm!30841 () Bool)

(assert (=> bm!30841 (= call!30844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!479136 () Bool)

(assert (=> b!479136 (= e!281847 e!281846)))

(declare-fun lt!217821 () (_ BitVec 64))

(assert (=> b!479136 (= lt!217821 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14066 0))(
  ( (Unit!14067) )
))
(declare-fun lt!217820 () Unit!14066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30919 (_ BitVec 64) (_ BitVec 32)) Unit!14066)

(assert (=> b!479136 (= lt!217820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217821 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479136 (arrayContainsKey!0 _keys!1874 lt!217821 #b00000000000000000000000000000000)))

(declare-fun lt!217822 () Unit!14066)

(assert (=> b!479136 (= lt!217822 lt!217820)))

(declare-fun res!285818 () Bool)

(declare-datatypes ((SeekEntryResult!3567 0))(
  ( (MissingZero!3567 (index!16447 (_ BitVec 32))) (Found!3567 (index!16448 (_ BitVec 32))) (Intermediate!3567 (undefined!4379 Bool) (index!16449 (_ BitVec 32)) (x!44991 (_ BitVec 32))) (Undefined!3567) (MissingVacant!3567 (index!16450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30919 (_ BitVec 32)) SeekEntryResult!3567)

(assert (=> b!479136 (= res!285818 (= (seekEntryOrOpen!0 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3567 #b00000000000000000000000000000000)))))

(assert (=> b!479136 (=> (not res!285818) (not e!281846))))

(assert (= (and d!76659 (not res!285819)) b!479133))

(assert (= (and b!479133 c!57673) b!479136))

(assert (= (and b!479133 (not c!57673)) b!479135))

(assert (= (and b!479136 res!285818) b!479134))

(assert (= (or b!479134 b!479135) bm!30841))

(declare-fun m!461165 () Bool)

(assert (=> b!479133 m!461165))

(assert (=> b!479133 m!461165))

(declare-fun m!461167 () Bool)

(assert (=> b!479133 m!461167))

(declare-fun m!461169 () Bool)

(assert (=> bm!30841 m!461169))

(assert (=> b!479136 m!461165))

(declare-fun m!461171 () Bool)

(assert (=> b!479136 m!461171))

(declare-fun m!461173 () Bool)

(assert (=> b!479136 m!461173))

(assert (=> b!479136 m!461165))

(declare-fun m!461175 () Bool)

(assert (=> b!479136 m!461175))

(assert (=> b!479097 d!76659))

(declare-fun d!76661 () Bool)

(declare-fun res!285828 () Bool)

(declare-fun e!281857 () Bool)

(assert (=> d!76661 (=> res!285828 e!281857)))

(assert (=> d!76661 (= res!285828 (bvsge #b00000000000000000000000000000000 (size!15225 _keys!1874)))))

(assert (=> d!76661 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9079) e!281857)))

(declare-fun b!479147 () Bool)

(declare-fun e!281856 () Bool)

(declare-fun call!30847 () Bool)

(assert (=> b!479147 (= e!281856 call!30847)))

(declare-fun b!479148 () Bool)

(declare-fun e!281859 () Bool)

(assert (=> b!479148 (= e!281857 e!281859)))

(declare-fun res!285827 () Bool)

(assert (=> b!479148 (=> (not res!285827) (not e!281859))))

(declare-fun e!281858 () Bool)

(assert (=> b!479148 (= res!285827 (not e!281858))))

(declare-fun res!285826 () Bool)

(assert (=> b!479148 (=> (not res!285826) (not e!281858))))

(assert (=> b!479148 (= res!285826 (validKeyInArray!0 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479149 () Bool)

(declare-fun contains!2583 (List!9082 (_ BitVec 64)) Bool)

(assert (=> b!479149 (= e!281858 (contains!2583 Nil!9079 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479150 () Bool)

(assert (=> b!479150 (= e!281859 e!281856)))

(declare-fun c!57676 () Bool)

(assert (=> b!479150 (= c!57676 (validKeyInArray!0 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479151 () Bool)

(assert (=> b!479151 (= e!281856 call!30847)))

(declare-fun bm!30844 () Bool)

(assert (=> bm!30844 (= call!30847 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57676 (Cons!9078 (select (arr!14867 _keys!1874) #b00000000000000000000000000000000) Nil!9079) Nil!9079)))))

(assert (= (and d!76661 (not res!285828)) b!479148))

(assert (= (and b!479148 res!285826) b!479149))

(assert (= (and b!479148 res!285827) b!479150))

(assert (= (and b!479150 c!57676) b!479147))

(assert (= (and b!479150 (not c!57676)) b!479151))

(assert (= (or b!479147 b!479151) bm!30844))

(assert (=> b!479148 m!461165))

(assert (=> b!479148 m!461165))

(assert (=> b!479148 m!461167))

(assert (=> b!479149 m!461165))

(assert (=> b!479149 m!461165))

(declare-fun m!461177 () Bool)

(assert (=> b!479149 m!461177))

(assert (=> b!479150 m!461165))

(assert (=> b!479150 m!461165))

(assert (=> b!479150 m!461167))

(assert (=> bm!30844 m!461165))

(declare-fun m!461179 () Bool)

(assert (=> bm!30844 m!461179))

(assert (=> b!479100 d!76661))

(declare-fun condMapEmpty!22135 () Bool)

(declare-fun mapDefault!22135 () ValueCell!6450)

(assert (=> mapNonEmpty!22129 (= condMapEmpty!22135 (= mapRest!22129 ((as const (Array (_ BitVec 32) ValueCell!6450)) mapDefault!22135)))))

(declare-fun e!281865 () Bool)

(declare-fun mapRes!22135 () Bool)

(assert (=> mapNonEmpty!22129 (= tp!42604 (and e!281865 mapRes!22135))))

(declare-fun mapNonEmpty!22135 () Bool)

(declare-fun tp!42610 () Bool)

(declare-fun e!281864 () Bool)

(assert (=> mapNonEmpty!22135 (= mapRes!22135 (and tp!42610 e!281864))))

(declare-fun mapValue!22135 () ValueCell!6450)

(declare-fun mapRest!22135 () (Array (_ BitVec 32) ValueCell!6450))

(declare-fun mapKey!22135 () (_ BitVec 32))

(assert (=> mapNonEmpty!22135 (= mapRest!22129 (store mapRest!22135 mapKey!22135 mapValue!22135))))

(declare-fun b!479159 () Bool)

(assert (=> b!479159 (= e!281865 tp_is_empty!13623)))

(declare-fun mapIsEmpty!22135 () Bool)

(assert (=> mapIsEmpty!22135 mapRes!22135))

(declare-fun b!479158 () Bool)

(assert (=> b!479158 (= e!281864 tp_is_empty!13623)))

(assert (= (and mapNonEmpty!22129 condMapEmpty!22135) mapIsEmpty!22135))

(assert (= (and mapNonEmpty!22129 (not condMapEmpty!22135)) mapNonEmpty!22135))

(assert (= (and mapNonEmpty!22135 ((_ is ValueCellFull!6450) mapValue!22135)) b!479158))

(assert (= (and mapNonEmpty!22129 ((_ is ValueCellFull!6450) mapDefault!22135)) b!479159))

(declare-fun m!461181 () Bool)

(assert (=> mapNonEmpty!22135 m!461181))

(check-sat (not b!479149) (not b!479150) (not bm!30841) tp_is_empty!13623 (not b!479133) (not b!479148) (not mapNonEmpty!22135) (not b!479136) (not bm!30844))
(check-sat)
