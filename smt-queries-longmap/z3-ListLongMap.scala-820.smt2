; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19998 () Bool)

(assert start!19998)

(declare-fun b!195988 () Bool)

(declare-fun res!92470 () Bool)

(declare-fun e!129006 () Bool)

(assert (=> b!195988 (=> (not res!92470) (not e!129006))))

(declare-datatypes ((array!8309 0))(
  ( (array!8310 (arr!3907 (Array (_ BitVec 32) (_ BitVec 64))) (size!4232 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8309)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5689 0))(
  ( (V!5690 (val!2310 Int)) )
))
(declare-datatypes ((ValueCell!1922 0))(
  ( (ValueCellFull!1922 (v!4280 V!5689)) (EmptyCell!1922) )
))
(declare-datatypes ((array!8311 0))(
  ( (array!8312 (arr!3908 (Array (_ BitVec 32) ValueCell!1922)) (size!4233 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8311)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195988 (= res!92470 (and (= (size!4233 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4232 _keys!825) (size!4233 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195989 () Bool)

(declare-fun res!92468 () Bool)

(assert (=> b!195989 (=> (not res!92468) (not e!129006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8309 (_ BitVec 32)) Bool)

(assert (=> b!195989 (= res!92468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7859 () Bool)

(declare-fun mapRes!7859 () Bool)

(assert (=> mapIsEmpty!7859 mapRes!7859))

(declare-fun b!195990 () Bool)

(declare-fun e!129005 () Bool)

(declare-fun tp_is_empty!4531 () Bool)

(assert (=> b!195990 (= e!129005 tp_is_empty!4531)))

(declare-fun b!195991 () Bool)

(declare-fun res!92471 () Bool)

(assert (=> b!195991 (=> (not res!92471) (not e!129006))))

(assert (=> b!195991 (= res!92471 (and (bvsle #b00000000000000000000000000000000 (size!4232 _keys!825)) (bvslt (size!4232 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195992 () Bool)

(declare-fun e!129007 () Bool)

(assert (=> b!195992 (= e!129007 tp_is_empty!4531)))

(declare-fun b!195993 () Bool)

(declare-fun e!129009 () Bool)

(assert (=> b!195993 (= e!129009 (and e!129007 mapRes!7859))))

(declare-fun condMapEmpty!7859 () Bool)

(declare-fun mapDefault!7859 () ValueCell!1922)

(assert (=> b!195993 (= condMapEmpty!7859 (= (arr!3908 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1922)) mapDefault!7859)))))

(declare-fun mapNonEmpty!7859 () Bool)

(declare-fun tp!17147 () Bool)

(assert (=> mapNonEmpty!7859 (= mapRes!7859 (and tp!17147 e!129005))))

(declare-fun mapValue!7859 () ValueCell!1922)

(declare-fun mapRest!7859 () (Array (_ BitVec 32) ValueCell!1922))

(declare-fun mapKey!7859 () (_ BitVec 32))

(assert (=> mapNonEmpty!7859 (= (arr!3908 _values!649) (store mapRest!7859 mapKey!7859 mapValue!7859))))

(declare-fun b!195994 () Bool)

(declare-datatypes ((List!2415 0))(
  ( (Nil!2412) (Cons!2411 (h!3053 (_ BitVec 64)) (t!7338 List!2415)) )
))
(declare-fun noDuplicate!58 (List!2415) Bool)

(assert (=> b!195994 (= e!129006 (not (noDuplicate!58 Nil!2412)))))

(declare-fun res!92469 () Bool)

(assert (=> start!19998 (=> (not res!92469) (not e!129006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19998 (= res!92469 (validMask!0 mask!1149))))

(assert (=> start!19998 e!129006))

(assert (=> start!19998 true))

(declare-fun array_inv!2529 (array!8311) Bool)

(assert (=> start!19998 (and (array_inv!2529 _values!649) e!129009)))

(declare-fun array_inv!2530 (array!8309) Bool)

(assert (=> start!19998 (array_inv!2530 _keys!825)))

(assert (= (and start!19998 res!92469) b!195988))

(assert (= (and b!195988 res!92470) b!195989))

(assert (= (and b!195989 res!92468) b!195991))

(assert (= (and b!195991 res!92471) b!195994))

(assert (= (and b!195993 condMapEmpty!7859) mapIsEmpty!7859))

(assert (= (and b!195993 (not condMapEmpty!7859)) mapNonEmpty!7859))

(get-info :version)

(assert (= (and mapNonEmpty!7859 ((_ is ValueCellFull!1922) mapValue!7859)) b!195990))

(assert (= (and b!195993 ((_ is ValueCellFull!1922) mapDefault!7859)) b!195992))

(assert (= start!19998 b!195993))

(declare-fun m!223571 () Bool)

(assert (=> b!195989 m!223571))

(declare-fun m!223573 () Bool)

(assert (=> mapNonEmpty!7859 m!223573))

(declare-fun m!223575 () Bool)

(assert (=> b!195994 m!223575))

(declare-fun m!223577 () Bool)

(assert (=> start!19998 m!223577))

(declare-fun m!223579 () Bool)

(assert (=> start!19998 m!223579))

(declare-fun m!223581 () Bool)

(assert (=> start!19998 m!223581))

(check-sat (not start!19998) (not b!195989) (not mapNonEmpty!7859) tp_is_empty!4531 (not b!195994))
(check-sat)
(get-model)

(declare-fun d!57627 () Bool)

(declare-fun res!92500 () Bool)

(declare-fun e!129044 () Bool)

(assert (=> d!57627 (=> res!92500 e!129044)))

(assert (=> d!57627 (= res!92500 ((_ is Nil!2412) Nil!2412))))

(assert (=> d!57627 (= (noDuplicate!58 Nil!2412) e!129044)))

(declare-fun b!196041 () Bool)

(declare-fun e!129045 () Bool)

(assert (=> b!196041 (= e!129044 e!129045)))

(declare-fun res!92501 () Bool)

(assert (=> b!196041 (=> (not res!92501) (not e!129045))))

(declare-fun contains!1369 (List!2415 (_ BitVec 64)) Bool)

(assert (=> b!196041 (= res!92501 (not (contains!1369 (t!7338 Nil!2412) (h!3053 Nil!2412))))))

(declare-fun b!196042 () Bool)

(assert (=> b!196042 (= e!129045 (noDuplicate!58 (t!7338 Nil!2412)))))

(assert (= (and d!57627 (not res!92500)) b!196041))

(assert (= (and b!196041 res!92501) b!196042))

(declare-fun m!223607 () Bool)

(assert (=> b!196041 m!223607))

(declare-fun m!223609 () Bool)

(assert (=> b!196042 m!223609))

(assert (=> b!195994 d!57627))

(declare-fun d!57629 () Bool)

(assert (=> d!57629 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19998 d!57629))

(declare-fun d!57631 () Bool)

(assert (=> d!57631 (= (array_inv!2529 _values!649) (bvsge (size!4233 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19998 d!57631))

(declare-fun d!57633 () Bool)

(assert (=> d!57633 (= (array_inv!2530 _keys!825) (bvsge (size!4232 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19998 d!57633))

(declare-fun b!196051 () Bool)

(declare-fun e!129054 () Bool)

(declare-fun e!129053 () Bool)

(assert (=> b!196051 (= e!129054 e!129053)))

(declare-fun lt!97610 () (_ BitVec 64))

(assert (=> b!196051 (= lt!97610 (select (arr!3907 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5926 0))(
  ( (Unit!5927) )
))
(declare-fun lt!97611 () Unit!5926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8309 (_ BitVec 64) (_ BitVec 32)) Unit!5926)

(assert (=> b!196051 (= lt!97611 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97610 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!196051 (arrayContainsKey!0 _keys!825 lt!97610 #b00000000000000000000000000000000)))

(declare-fun lt!97612 () Unit!5926)

(assert (=> b!196051 (= lt!97612 lt!97611)))

(declare-fun res!92506 () Bool)

(declare-datatypes ((SeekEntryResult!691 0))(
  ( (MissingZero!691 (index!4934 (_ BitVec 32))) (Found!691 (index!4935 (_ BitVec 32))) (Intermediate!691 (undefined!1503 Bool) (index!4936 (_ BitVec 32)) (x!20812 (_ BitVec 32))) (Undefined!691) (MissingVacant!691 (index!4937 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8309 (_ BitVec 32)) SeekEntryResult!691)

(assert (=> b!196051 (= res!92506 (= (seekEntryOrOpen!0 (select (arr!3907 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!691 #b00000000000000000000000000000000)))))

(assert (=> b!196051 (=> (not res!92506) (not e!129053))))

(declare-fun bm!19758 () Bool)

(declare-fun call!19761 () Bool)

(assert (=> bm!19758 (= call!19761 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!196052 () Bool)

(declare-fun e!129052 () Bool)

(assert (=> b!196052 (= e!129052 e!129054)))

(declare-fun c!35445 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196052 (= c!35445 (validKeyInArray!0 (select (arr!3907 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!196053 () Bool)

(assert (=> b!196053 (= e!129054 call!19761)))

(declare-fun b!196054 () Bool)

(assert (=> b!196054 (= e!129053 call!19761)))

(declare-fun d!57635 () Bool)

(declare-fun res!92507 () Bool)

(assert (=> d!57635 (=> res!92507 e!129052)))

(assert (=> d!57635 (= res!92507 (bvsge #b00000000000000000000000000000000 (size!4232 _keys!825)))))

(assert (=> d!57635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!129052)))

(assert (= (and d!57635 (not res!92507)) b!196052))

(assert (= (and b!196052 c!35445) b!196051))

(assert (= (and b!196052 (not c!35445)) b!196053))

(assert (= (and b!196051 res!92506) b!196054))

(assert (= (or b!196054 b!196053) bm!19758))

(declare-fun m!223611 () Bool)

(assert (=> b!196051 m!223611))

(declare-fun m!223613 () Bool)

(assert (=> b!196051 m!223613))

(declare-fun m!223615 () Bool)

(assert (=> b!196051 m!223615))

(assert (=> b!196051 m!223611))

(declare-fun m!223617 () Bool)

(assert (=> b!196051 m!223617))

(declare-fun m!223619 () Bool)

(assert (=> bm!19758 m!223619))

(assert (=> b!196052 m!223611))

(assert (=> b!196052 m!223611))

(declare-fun m!223621 () Bool)

(assert (=> b!196052 m!223621))

(assert (=> b!195989 d!57635))

(declare-fun b!196061 () Bool)

(declare-fun e!129059 () Bool)

(assert (=> b!196061 (= e!129059 tp_is_empty!4531)))

(declare-fun mapNonEmpty!7868 () Bool)

(declare-fun mapRes!7868 () Bool)

(declare-fun tp!17156 () Bool)

(assert (=> mapNonEmpty!7868 (= mapRes!7868 (and tp!17156 e!129059))))

(declare-fun mapRest!7868 () (Array (_ BitVec 32) ValueCell!1922))

(declare-fun mapValue!7868 () ValueCell!1922)

(declare-fun mapKey!7868 () (_ BitVec 32))

(assert (=> mapNonEmpty!7868 (= mapRest!7859 (store mapRest!7868 mapKey!7868 mapValue!7868))))

(declare-fun condMapEmpty!7868 () Bool)

(declare-fun mapDefault!7868 () ValueCell!1922)

(assert (=> mapNonEmpty!7859 (= condMapEmpty!7868 (= mapRest!7859 ((as const (Array (_ BitVec 32) ValueCell!1922)) mapDefault!7868)))))

(declare-fun e!129060 () Bool)

(assert (=> mapNonEmpty!7859 (= tp!17147 (and e!129060 mapRes!7868))))

(declare-fun b!196062 () Bool)

(assert (=> b!196062 (= e!129060 tp_is_empty!4531)))

(declare-fun mapIsEmpty!7868 () Bool)

(assert (=> mapIsEmpty!7868 mapRes!7868))

(assert (= (and mapNonEmpty!7859 condMapEmpty!7868) mapIsEmpty!7868))

(assert (= (and mapNonEmpty!7859 (not condMapEmpty!7868)) mapNonEmpty!7868))

(assert (= (and mapNonEmpty!7868 ((_ is ValueCellFull!1922) mapValue!7868)) b!196061))

(assert (= (and mapNonEmpty!7859 ((_ is ValueCellFull!1922) mapDefault!7868)) b!196062))

(declare-fun m!223623 () Bool)

(assert (=> mapNonEmpty!7868 m!223623))

(check-sat (not b!196042) (not b!196041) (not b!196051) (not mapNonEmpty!7868) (not bm!19758) (not b!196052) tp_is_empty!4531)
(check-sat)
