; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19970 () Bool)

(assert start!19970)

(declare-fun mapIsEmpty!7835 () Bool)

(declare-fun mapRes!7835 () Bool)

(assert (=> mapIsEmpty!7835 mapRes!7835))

(declare-fun b!195838 () Bool)

(declare-fun e!128886 () Bool)

(declare-datatypes ((array!8281 0))(
  ( (array!8282 (arr!3895 (Array (_ BitVec 32) (_ BitVec 64))) (size!4220 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8281)

(assert (=> b!195838 (= e!128886 (bvsgt #b00000000000000000000000000000000 (size!4220 _keys!825)))))

(declare-fun b!195839 () Bool)

(declare-fun e!128888 () Bool)

(declare-fun e!128887 () Bool)

(assert (=> b!195839 (= e!128888 (and e!128887 mapRes!7835))))

(declare-fun condMapEmpty!7835 () Bool)

(declare-datatypes ((V!5673 0))(
  ( (V!5674 (val!2304 Int)) )
))
(declare-datatypes ((ValueCell!1916 0))(
  ( (ValueCellFull!1916 (v!4274 V!5673)) (EmptyCell!1916) )
))
(declare-datatypes ((array!8283 0))(
  ( (array!8284 (arr!3896 (Array (_ BitVec 32) ValueCell!1916)) (size!4221 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8283)

(declare-fun mapDefault!7835 () ValueCell!1916)

(assert (=> b!195839 (= condMapEmpty!7835 (= (arr!3896 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1916)) mapDefault!7835)))))

(declare-fun b!195840 () Bool)

(declare-fun e!128889 () Bool)

(declare-fun tp_is_empty!4519 () Bool)

(assert (=> b!195840 (= e!128889 tp_is_empty!4519)))

(declare-fun res!92400 () Bool)

(assert (=> start!19970 (=> (not res!92400) (not e!128886))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19970 (= res!92400 (validMask!0 mask!1149))))

(assert (=> start!19970 e!128886))

(assert (=> start!19970 true))

(declare-fun array_inv!2517 (array!8283) Bool)

(assert (=> start!19970 (and (array_inv!2517 _values!649) e!128888)))

(declare-fun array_inv!2518 (array!8281) Bool)

(assert (=> start!19970 (array_inv!2518 _keys!825)))

(declare-fun b!195841 () Bool)

(declare-fun res!92401 () Bool)

(assert (=> b!195841 (=> (not res!92401) (not e!128886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8281 (_ BitVec 32)) Bool)

(assert (=> b!195841 (= res!92401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195842 () Bool)

(assert (=> b!195842 (= e!128887 tp_is_empty!4519)))

(declare-fun b!195843 () Bool)

(declare-fun res!92402 () Bool)

(assert (=> b!195843 (=> (not res!92402) (not e!128886))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195843 (= res!92402 (and (= (size!4221 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4220 _keys!825) (size!4221 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7835 () Bool)

(declare-fun tp!17123 () Bool)

(assert (=> mapNonEmpty!7835 (= mapRes!7835 (and tp!17123 e!128889))))

(declare-fun mapRest!7835 () (Array (_ BitVec 32) ValueCell!1916))

(declare-fun mapKey!7835 () (_ BitVec 32))

(declare-fun mapValue!7835 () ValueCell!1916)

(assert (=> mapNonEmpty!7835 (= (arr!3896 _values!649) (store mapRest!7835 mapKey!7835 mapValue!7835))))

(assert (= (and start!19970 res!92400) b!195843))

(assert (= (and b!195843 res!92402) b!195841))

(assert (= (and b!195841 res!92401) b!195838))

(assert (= (and b!195839 condMapEmpty!7835) mapIsEmpty!7835))

(assert (= (and b!195839 (not condMapEmpty!7835)) mapNonEmpty!7835))

(get-info :version)

(assert (= (and mapNonEmpty!7835 ((_ is ValueCellFull!1916) mapValue!7835)) b!195840))

(assert (= (and b!195839 ((_ is ValueCellFull!1916) mapDefault!7835)) b!195842))

(assert (= start!19970 b!195839))

(declare-fun m!223483 () Bool)

(assert (=> start!19970 m!223483))

(declare-fun m!223485 () Bool)

(assert (=> start!19970 m!223485))

(declare-fun m!223487 () Bool)

(assert (=> start!19970 m!223487))

(declare-fun m!223489 () Bool)

(assert (=> b!195841 m!223489))

(declare-fun m!223491 () Bool)

(assert (=> mapNonEmpty!7835 m!223491))

(check-sat (not b!195841) (not start!19970) (not mapNonEmpty!7835) tp_is_empty!4519)
(check-sat)
(get-model)

(declare-fun b!195888 () Bool)

(declare-fun e!128926 () Bool)

(declare-fun e!128928 () Bool)

(assert (=> b!195888 (= e!128926 e!128928)))

(declare-fun lt!97594 () (_ BitVec 64))

(assert (=> b!195888 (= lt!97594 (select (arr!3895 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5922 0))(
  ( (Unit!5923) )
))
(declare-fun lt!97592 () Unit!5922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8281 (_ BitVec 64) (_ BitVec 32)) Unit!5922)

(assert (=> b!195888 (= lt!97592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97594 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195888 (arrayContainsKey!0 _keys!825 lt!97594 #b00000000000000000000000000000000)))

(declare-fun lt!97593 () Unit!5922)

(assert (=> b!195888 (= lt!97593 lt!97592)))

(declare-fun res!92426 () Bool)

(declare-datatypes ((SeekEntryResult!689 0))(
  ( (MissingZero!689 (index!4926 (_ BitVec 32))) (Found!689 (index!4927 (_ BitVec 32))) (Intermediate!689 (undefined!1501 Bool) (index!4928 (_ BitVec 32)) (x!20790 (_ BitVec 32))) (Undefined!689) (MissingVacant!689 (index!4929 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8281 (_ BitVec 32)) SeekEntryResult!689)

(assert (=> b!195888 (= res!92426 (= (seekEntryOrOpen!0 (select (arr!3895 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!689 #b00000000000000000000000000000000)))))

(assert (=> b!195888 (=> (not res!92426) (not e!128928))))

(declare-fun b!195889 () Bool)

(declare-fun call!19755 () Bool)

(assert (=> b!195889 (= e!128928 call!19755)))

(declare-fun b!195890 () Bool)

(declare-fun e!128927 () Bool)

(assert (=> b!195890 (= e!128927 e!128926)))

(declare-fun c!35439 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195890 (= c!35439 (validKeyInArray!0 (select (arr!3895 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57607 () Bool)

(declare-fun res!92425 () Bool)

(assert (=> d!57607 (=> res!92425 e!128927)))

(assert (=> d!57607 (= res!92425 (bvsge #b00000000000000000000000000000000 (size!4220 _keys!825)))))

(assert (=> d!57607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128927)))

(declare-fun bm!19752 () Bool)

(assert (=> bm!19752 (= call!19755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195891 () Bool)

(assert (=> b!195891 (= e!128926 call!19755)))

(assert (= (and d!57607 (not res!92425)) b!195890))

(assert (= (and b!195890 c!35439) b!195888))

(assert (= (and b!195890 (not c!35439)) b!195891))

(assert (= (and b!195888 res!92426) b!195889))

(assert (= (or b!195889 b!195891) bm!19752))

(declare-fun m!223513 () Bool)

(assert (=> b!195888 m!223513))

(declare-fun m!223515 () Bool)

(assert (=> b!195888 m!223515))

(declare-fun m!223517 () Bool)

(assert (=> b!195888 m!223517))

(assert (=> b!195888 m!223513))

(declare-fun m!223519 () Bool)

(assert (=> b!195888 m!223519))

(assert (=> b!195890 m!223513))

(assert (=> b!195890 m!223513))

(declare-fun m!223521 () Bool)

(assert (=> b!195890 m!223521))

(declare-fun m!223523 () Bool)

(assert (=> bm!19752 m!223523))

(assert (=> b!195841 d!57607))

(declare-fun d!57609 () Bool)

(assert (=> d!57609 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19970 d!57609))

(declare-fun d!57611 () Bool)

(assert (=> d!57611 (= (array_inv!2517 _values!649) (bvsge (size!4221 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19970 d!57611))

(declare-fun d!57613 () Bool)

(assert (=> d!57613 (= (array_inv!2518 _keys!825) (bvsge (size!4220 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19970 d!57613))

(declare-fun mapNonEmpty!7844 () Bool)

(declare-fun mapRes!7844 () Bool)

(declare-fun tp!17132 () Bool)

(declare-fun e!128933 () Bool)

(assert (=> mapNonEmpty!7844 (= mapRes!7844 (and tp!17132 e!128933))))

(declare-fun mapKey!7844 () (_ BitVec 32))

(declare-fun mapRest!7844 () (Array (_ BitVec 32) ValueCell!1916))

(declare-fun mapValue!7844 () ValueCell!1916)

(assert (=> mapNonEmpty!7844 (= mapRest!7835 (store mapRest!7844 mapKey!7844 mapValue!7844))))

(declare-fun b!195899 () Bool)

(declare-fun e!128934 () Bool)

(assert (=> b!195899 (= e!128934 tp_is_empty!4519)))

(declare-fun b!195898 () Bool)

(assert (=> b!195898 (= e!128933 tp_is_empty!4519)))

(declare-fun mapIsEmpty!7844 () Bool)

(assert (=> mapIsEmpty!7844 mapRes!7844))

(declare-fun condMapEmpty!7844 () Bool)

(declare-fun mapDefault!7844 () ValueCell!1916)

(assert (=> mapNonEmpty!7835 (= condMapEmpty!7844 (= mapRest!7835 ((as const (Array (_ BitVec 32) ValueCell!1916)) mapDefault!7844)))))

(assert (=> mapNonEmpty!7835 (= tp!17123 (and e!128934 mapRes!7844))))

(assert (= (and mapNonEmpty!7835 condMapEmpty!7844) mapIsEmpty!7844))

(assert (= (and mapNonEmpty!7835 (not condMapEmpty!7844)) mapNonEmpty!7844))

(assert (= (and mapNonEmpty!7844 ((_ is ValueCellFull!1916) mapValue!7844)) b!195898))

(assert (= (and mapNonEmpty!7835 ((_ is ValueCellFull!1916) mapDefault!7844)) b!195899))

(declare-fun m!223525 () Bool)

(assert (=> mapNonEmpty!7844 m!223525))

(check-sat (not b!195888) (not bm!19752) (not b!195890) (not mapNonEmpty!7844) tp_is_empty!4519)
(check-sat)
