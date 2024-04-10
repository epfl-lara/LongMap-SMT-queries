; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19982 () Bool)

(assert start!19982)

(declare-fun b!195883 () Bool)

(declare-fun e!128938 () Bool)

(declare-fun e!128940 () Bool)

(declare-fun mapRes!7850 () Bool)

(assert (=> b!195883 (= e!128938 (and e!128940 mapRes!7850))))

(declare-fun condMapEmpty!7850 () Bool)

(declare-datatypes ((V!5683 0))(
  ( (V!5684 (val!2308 Int)) )
))
(declare-datatypes ((ValueCell!1920 0))(
  ( (ValueCellFull!1920 (v!4277 V!5683)) (EmptyCell!1920) )
))
(declare-datatypes ((array!8311 0))(
  ( (array!8312 (arr!3909 (Array (_ BitVec 32) ValueCell!1920)) (size!4234 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8311)

(declare-fun mapDefault!7850 () ValueCell!1920)

(assert (=> b!195883 (= condMapEmpty!7850 (= (arr!3909 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1920)) mapDefault!7850)))))

(declare-fun b!195884 () Bool)

(declare-fun res!92422 () Bool)

(declare-fun e!128936 () Bool)

(assert (=> b!195884 (=> (not res!92422) (not e!128936))))

(declare-datatypes ((array!8313 0))(
  ( (array!8314 (arr!3910 (Array (_ BitVec 32) (_ BitVec 64))) (size!4235 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8313)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195884 (= res!92422 (and (= (size!4234 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4235 _keys!825) (size!4234 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195885 () Bool)

(declare-fun res!92421 () Bool)

(assert (=> b!195885 (=> (not res!92421) (not e!128936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8313 (_ BitVec 32)) Bool)

(assert (=> b!195885 (= res!92421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195886 () Bool)

(declare-fun e!128937 () Bool)

(declare-fun tp_is_empty!4527 () Bool)

(assert (=> b!195886 (= e!128937 tp_is_empty!4527)))

(declare-fun mapNonEmpty!7850 () Bool)

(declare-fun tp!17138 () Bool)

(assert (=> mapNonEmpty!7850 (= mapRes!7850 (and tp!17138 e!128937))))

(declare-fun mapValue!7850 () ValueCell!1920)

(declare-fun mapKey!7850 () (_ BitVec 32))

(declare-fun mapRest!7850 () (Array (_ BitVec 32) ValueCell!1920))

(assert (=> mapNonEmpty!7850 (= (arr!3909 _values!649) (store mapRest!7850 mapKey!7850 mapValue!7850))))

(declare-fun b!195887 () Bool)

(assert (=> b!195887 (= e!128940 tp_is_empty!4527)))

(declare-fun mapIsEmpty!7850 () Bool)

(assert (=> mapIsEmpty!7850 mapRes!7850))

(declare-fun b!195888 () Bool)

(assert (=> b!195888 (= e!128936 (and (bvsle #b00000000000000000000000000000000 (size!4235 _keys!825)) (bvsge (size!4235 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun res!92423 () Bool)

(assert (=> start!19982 (=> (not res!92423) (not e!128936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19982 (= res!92423 (validMask!0 mask!1149))))

(assert (=> start!19982 e!128936))

(assert (=> start!19982 true))

(declare-fun array_inv!2539 (array!8311) Bool)

(assert (=> start!19982 (and (array_inv!2539 _values!649) e!128938)))

(declare-fun array_inv!2540 (array!8313) Bool)

(assert (=> start!19982 (array_inv!2540 _keys!825)))

(assert (= (and start!19982 res!92423) b!195884))

(assert (= (and b!195884 res!92422) b!195885))

(assert (= (and b!195885 res!92421) b!195888))

(assert (= (and b!195883 condMapEmpty!7850) mapIsEmpty!7850))

(assert (= (and b!195883 (not condMapEmpty!7850)) mapNonEmpty!7850))

(get-info :version)

(assert (= (and mapNonEmpty!7850 ((_ is ValueCellFull!1920) mapValue!7850)) b!195886))

(assert (= (and b!195883 ((_ is ValueCellFull!1920) mapDefault!7850)) b!195887))

(assert (= start!19982 b!195883))

(declare-fun m!223355 () Bool)

(assert (=> b!195885 m!223355))

(declare-fun m!223357 () Bool)

(assert (=> mapNonEmpty!7850 m!223357))

(declare-fun m!223359 () Bool)

(assert (=> start!19982 m!223359))

(declare-fun m!223361 () Bool)

(assert (=> start!19982 m!223361))

(declare-fun m!223363 () Bool)

(assert (=> start!19982 m!223363))

(check-sat (not b!195885) (not start!19982) (not mapNonEmpty!7850) tp_is_empty!4527)
(check-sat)
(get-model)

(declare-fun bm!19767 () Bool)

(declare-fun call!19770 () Bool)

(assert (=> bm!19767 (= call!19770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!57543 () Bool)

(declare-fun res!92437 () Bool)

(declare-fun e!128964 () Bool)

(assert (=> d!57543 (=> res!92437 e!128964)))

(assert (=> d!57543 (= res!92437 (bvsge #b00000000000000000000000000000000 (size!4235 _keys!825)))))

(assert (=> d!57543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128964)))

(declare-fun b!195915 () Bool)

(declare-fun e!128962 () Bool)

(assert (=> b!195915 (= e!128962 call!19770)))

(declare-fun b!195916 () Bool)

(declare-fun e!128963 () Bool)

(assert (=> b!195916 (= e!128963 call!19770)))

(declare-fun b!195917 () Bool)

(assert (=> b!195917 (= e!128964 e!128963)))

(declare-fun c!35429 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195917 (= c!35429 (validKeyInArray!0 (select (arr!3910 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!195918 () Bool)

(assert (=> b!195918 (= e!128963 e!128962)))

(declare-fun lt!97543 () (_ BitVec 64))

(assert (=> b!195918 (= lt!97543 (select (arr!3910 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5944 0))(
  ( (Unit!5945) )
))
(declare-fun lt!97544 () Unit!5944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8313 (_ BitVec 64) (_ BitVec 32)) Unit!5944)

(assert (=> b!195918 (= lt!97544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97543 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195918 (arrayContainsKey!0 _keys!825 lt!97543 #b00000000000000000000000000000000)))

(declare-fun lt!97542 () Unit!5944)

(assert (=> b!195918 (= lt!97542 lt!97544)))

(declare-fun res!92438 () Bool)

(declare-datatypes ((SeekEntryResult!701 0))(
  ( (MissingZero!701 (index!4974 (_ BitVec 32))) (Found!701 (index!4975 (_ BitVec 32))) (Intermediate!701 (undefined!1513 Bool) (index!4976 (_ BitVec 32)) (x!20812 (_ BitVec 32))) (Undefined!701) (MissingVacant!701 (index!4977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8313 (_ BitVec 32)) SeekEntryResult!701)

(assert (=> b!195918 (= res!92438 (= (seekEntryOrOpen!0 (select (arr!3910 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!701 #b00000000000000000000000000000000)))))

(assert (=> b!195918 (=> (not res!92438) (not e!128962))))

(assert (= (and d!57543 (not res!92437)) b!195917))

(assert (= (and b!195917 c!35429) b!195918))

(assert (= (and b!195917 (not c!35429)) b!195916))

(assert (= (and b!195918 res!92438) b!195915))

(assert (= (or b!195915 b!195916) bm!19767))

(declare-fun m!223375 () Bool)

(assert (=> bm!19767 m!223375))

(declare-fun m!223377 () Bool)

(assert (=> b!195917 m!223377))

(assert (=> b!195917 m!223377))

(declare-fun m!223379 () Bool)

(assert (=> b!195917 m!223379))

(assert (=> b!195918 m!223377))

(declare-fun m!223381 () Bool)

(assert (=> b!195918 m!223381))

(declare-fun m!223383 () Bool)

(assert (=> b!195918 m!223383))

(assert (=> b!195918 m!223377))

(declare-fun m!223385 () Bool)

(assert (=> b!195918 m!223385))

(assert (=> b!195885 d!57543))

(declare-fun d!57545 () Bool)

(assert (=> d!57545 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19982 d!57545))

(declare-fun d!57547 () Bool)

(assert (=> d!57547 (= (array_inv!2539 _values!649) (bvsge (size!4234 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19982 d!57547))

(declare-fun d!57549 () Bool)

(assert (=> d!57549 (= (array_inv!2540 _keys!825) (bvsge (size!4235 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19982 d!57549))

(declare-fun mapNonEmpty!7856 () Bool)

(declare-fun mapRes!7856 () Bool)

(declare-fun tp!17144 () Bool)

(declare-fun e!128970 () Bool)

(assert (=> mapNonEmpty!7856 (= mapRes!7856 (and tp!17144 e!128970))))

(declare-fun mapKey!7856 () (_ BitVec 32))

(declare-fun mapRest!7856 () (Array (_ BitVec 32) ValueCell!1920))

(declare-fun mapValue!7856 () ValueCell!1920)

(assert (=> mapNonEmpty!7856 (= mapRest!7850 (store mapRest!7856 mapKey!7856 mapValue!7856))))

(declare-fun b!195926 () Bool)

(declare-fun e!128969 () Bool)

(assert (=> b!195926 (= e!128969 tp_is_empty!4527)))

(declare-fun condMapEmpty!7856 () Bool)

(declare-fun mapDefault!7856 () ValueCell!1920)

(assert (=> mapNonEmpty!7850 (= condMapEmpty!7856 (= mapRest!7850 ((as const (Array (_ BitVec 32) ValueCell!1920)) mapDefault!7856)))))

(assert (=> mapNonEmpty!7850 (= tp!17138 (and e!128969 mapRes!7856))))

(declare-fun mapIsEmpty!7856 () Bool)

(assert (=> mapIsEmpty!7856 mapRes!7856))

(declare-fun b!195925 () Bool)

(assert (=> b!195925 (= e!128970 tp_is_empty!4527)))

(assert (= (and mapNonEmpty!7850 condMapEmpty!7856) mapIsEmpty!7856))

(assert (= (and mapNonEmpty!7850 (not condMapEmpty!7856)) mapNonEmpty!7856))

(assert (= (and mapNonEmpty!7856 ((_ is ValueCellFull!1920) mapValue!7856)) b!195925))

(assert (= (and mapNonEmpty!7850 ((_ is ValueCellFull!1920) mapDefault!7856)) b!195926))

(declare-fun m!223387 () Bool)

(assert (=> mapNonEmpty!7856 m!223387))

(check-sat (not b!195918) (not bm!19767) tp_is_empty!4527 (not mapNonEmpty!7856) (not b!195917))
(check-sat)
