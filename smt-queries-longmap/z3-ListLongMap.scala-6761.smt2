; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84842 () Bool)

(assert start!84842)

(declare-fun b!991664 () Bool)

(declare-fun e!559307 () Bool)

(declare-fun tp_is_empty!23343 () Bool)

(assert (=> b!991664 (= e!559307 tp_is_empty!23343)))

(declare-fun mapNonEmpty!37080 () Bool)

(declare-fun mapRes!37080 () Bool)

(declare-fun tp!70151 () Bool)

(assert (=> mapNonEmpty!37080 (= mapRes!37080 (and tp!70151 e!559307))))

(declare-datatypes ((V!36107 0))(
  ( (V!36108 (val!11722 Int)) )
))
(declare-datatypes ((ValueCell!11190 0))(
  ( (ValueCellFull!11190 (v!14298 V!36107)) (EmptyCell!11190) )
))
(declare-fun mapRest!37080 () (Array (_ BitVec 32) ValueCell!11190))

(declare-datatypes ((array!62653 0))(
  ( (array!62654 (arr!30173 (Array (_ BitVec 32) ValueCell!11190)) (size!30652 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62653)

(declare-fun mapValue!37080 () ValueCell!11190)

(declare-fun mapKey!37080 () (_ BitVec 32))

(assert (=> mapNonEmpty!37080 (= (arr!30173 _values!1551) (store mapRest!37080 mapKey!37080 mapValue!37080))))

(declare-fun mapIsEmpty!37080 () Bool)

(assert (=> mapIsEmpty!37080 mapRes!37080))

(declare-fun b!991666 () Bool)

(declare-fun res!662850 () Bool)

(declare-fun e!559308 () Bool)

(assert (=> b!991666 (=> (not res!662850) (not e!559308))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62655 0))(
  ( (array!62656 (arr!30174 (Array (_ BitVec 32) (_ BitVec 64))) (size!30653 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62655)

(assert (=> b!991666 (= res!662850 (and (= (size!30652 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30653 _keys!1945) (size!30652 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991667 () Bool)

(declare-fun res!662849 () Bool)

(assert (=> b!991667 (=> (not res!662849) (not e!559308))))

(assert (=> b!991667 (= res!662849 (and (bvsle #b00000000000000000000000000000000 (size!30653 _keys!1945)) (bvslt (size!30653 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991668 () Bool)

(declare-datatypes ((List!20861 0))(
  ( (Nil!20858) (Cons!20857 (h!22019 (_ BitVec 64)) (t!29844 List!20861)) )
))
(declare-fun noDuplicate!1379 (List!20861) Bool)

(assert (=> b!991668 (= e!559308 (not (noDuplicate!1379 Nil!20858)))))

(declare-fun b!991669 () Bool)

(declare-fun e!559305 () Bool)

(assert (=> b!991669 (= e!559305 tp_is_empty!23343)))

(declare-fun b!991670 () Bool)

(declare-fun e!559309 () Bool)

(assert (=> b!991670 (= e!559309 (and e!559305 mapRes!37080))))

(declare-fun condMapEmpty!37080 () Bool)

(declare-fun mapDefault!37080 () ValueCell!11190)

(assert (=> b!991670 (= condMapEmpty!37080 (= (arr!30173 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11190)) mapDefault!37080)))))

(declare-fun b!991665 () Bool)

(declare-fun res!662851 () Bool)

(assert (=> b!991665 (=> (not res!662851) (not e!559308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62655 (_ BitVec 32)) Bool)

(assert (=> b!991665 (= res!662851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun res!662848 () Bool)

(assert (=> start!84842 (=> (not res!662848) (not e!559308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84842 (= res!662848 (validMask!0 mask!2471))))

(assert (=> start!84842 e!559308))

(assert (=> start!84842 true))

(declare-fun array_inv!23303 (array!62653) Bool)

(assert (=> start!84842 (and (array_inv!23303 _values!1551) e!559309)))

(declare-fun array_inv!23304 (array!62655) Bool)

(assert (=> start!84842 (array_inv!23304 _keys!1945)))

(assert (= (and start!84842 res!662848) b!991666))

(assert (= (and b!991666 res!662850) b!991665))

(assert (= (and b!991665 res!662851) b!991667))

(assert (= (and b!991667 res!662849) b!991668))

(assert (= (and b!991670 condMapEmpty!37080) mapIsEmpty!37080))

(assert (= (and b!991670 (not condMapEmpty!37080)) mapNonEmpty!37080))

(get-info :version)

(assert (= (and mapNonEmpty!37080 ((_ is ValueCellFull!11190) mapValue!37080)) b!991664))

(assert (= (and b!991670 ((_ is ValueCellFull!11190) mapDefault!37080)) b!991669))

(assert (= start!84842 b!991670))

(declare-fun m!919523 () Bool)

(assert (=> mapNonEmpty!37080 m!919523))

(declare-fun m!919525 () Bool)

(assert (=> b!991668 m!919525))

(declare-fun m!919527 () Bool)

(assert (=> b!991665 m!919527))

(declare-fun m!919529 () Bool)

(assert (=> start!84842 m!919529))

(declare-fun m!919531 () Bool)

(assert (=> start!84842 m!919531))

(declare-fun m!919533 () Bool)

(assert (=> start!84842 m!919533))

(check-sat tp_is_empty!23343 (not b!991665) (not b!991668) (not mapNonEmpty!37080) (not start!84842))
(check-sat)
(get-model)

(declare-fun b!991700 () Bool)

(declare-fun e!559332 () Bool)

(declare-fun call!42082 () Bool)

(assert (=> b!991700 (= e!559332 call!42082)))

(declare-fun d!117967 () Bool)

(declare-fun res!662868 () Bool)

(declare-fun e!559331 () Bool)

(assert (=> d!117967 (=> res!662868 e!559331)))

(assert (=> d!117967 (= res!662868 (bvsge #b00000000000000000000000000000000 (size!30653 _keys!1945)))))

(assert (=> d!117967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559331)))

(declare-fun bm!42079 () Bool)

(assert (=> bm!42079 (= call!42082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!991701 () Bool)

(declare-fun e!559333 () Bool)

(assert (=> b!991701 (= e!559333 call!42082)))

(declare-fun b!991702 () Bool)

(assert (=> b!991702 (= e!559332 e!559333)))

(declare-fun lt!440008 () (_ BitVec 64))

(assert (=> b!991702 (= lt!440008 (select (arr!30174 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32898 0))(
  ( (Unit!32899) )
))
(declare-fun lt!440009 () Unit!32898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62655 (_ BitVec 64) (_ BitVec 32)) Unit!32898)

(assert (=> b!991702 (= lt!440009 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440008 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991702 (arrayContainsKey!0 _keys!1945 lt!440008 #b00000000000000000000000000000000)))

(declare-fun lt!440010 () Unit!32898)

(assert (=> b!991702 (= lt!440010 lt!440009)))

(declare-fun res!662869 () Bool)

(declare-datatypes ((SeekEntryResult!9216 0))(
  ( (MissingZero!9216 (index!39235 (_ BitVec 32))) (Found!9216 (index!39236 (_ BitVec 32))) (Intermediate!9216 (undefined!10028 Bool) (index!39237 (_ BitVec 32)) (x!86287 (_ BitVec 32))) (Undefined!9216) (MissingVacant!9216 (index!39238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62655 (_ BitVec 32)) SeekEntryResult!9216)

(assert (=> b!991702 (= res!662869 (= (seekEntryOrOpen!0 (select (arr!30174 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9216 #b00000000000000000000000000000000)))))

(assert (=> b!991702 (=> (not res!662869) (not e!559333))))

(declare-fun b!991703 () Bool)

(assert (=> b!991703 (= e!559331 e!559332)))

(declare-fun c!100633 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991703 (= c!100633 (validKeyInArray!0 (select (arr!30174 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!117967 (not res!662868)) b!991703))

(assert (= (and b!991703 c!100633) b!991702))

(assert (= (and b!991703 (not c!100633)) b!991700))

(assert (= (and b!991702 res!662869) b!991701))

(assert (= (or b!991701 b!991700) bm!42079))

(declare-fun m!919547 () Bool)

(assert (=> bm!42079 m!919547))

(declare-fun m!919549 () Bool)

(assert (=> b!991702 m!919549))

(declare-fun m!919551 () Bool)

(assert (=> b!991702 m!919551))

(declare-fun m!919553 () Bool)

(assert (=> b!991702 m!919553))

(assert (=> b!991702 m!919549))

(declare-fun m!919555 () Bool)

(assert (=> b!991702 m!919555))

(assert (=> b!991703 m!919549))

(assert (=> b!991703 m!919549))

(declare-fun m!919557 () Bool)

(assert (=> b!991703 m!919557))

(assert (=> b!991665 d!117967))

(declare-fun d!117969 () Bool)

(declare-fun res!662874 () Bool)

(declare-fun e!559338 () Bool)

(assert (=> d!117969 (=> res!662874 e!559338)))

(assert (=> d!117969 (= res!662874 ((_ is Nil!20858) Nil!20858))))

(assert (=> d!117969 (= (noDuplicate!1379 Nil!20858) e!559338)))

(declare-fun b!991708 () Bool)

(declare-fun e!559339 () Bool)

(assert (=> b!991708 (= e!559338 e!559339)))

(declare-fun res!662875 () Bool)

(assert (=> b!991708 (=> (not res!662875) (not e!559339))))

(declare-fun contains!5729 (List!20861 (_ BitVec 64)) Bool)

(assert (=> b!991708 (= res!662875 (not (contains!5729 (t!29844 Nil!20858) (h!22019 Nil!20858))))))

(declare-fun b!991709 () Bool)

(assert (=> b!991709 (= e!559339 (noDuplicate!1379 (t!29844 Nil!20858)))))

(assert (= (and d!117969 (not res!662874)) b!991708))

(assert (= (and b!991708 res!662875) b!991709))

(declare-fun m!919559 () Bool)

(assert (=> b!991708 m!919559))

(declare-fun m!919561 () Bool)

(assert (=> b!991709 m!919561))

(assert (=> b!991668 d!117969))

(declare-fun d!117971 () Bool)

(assert (=> d!117971 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84842 d!117971))

(declare-fun d!117973 () Bool)

(assert (=> d!117973 (= (array_inv!23303 _values!1551) (bvsge (size!30652 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84842 d!117973))

(declare-fun d!117975 () Bool)

(assert (=> d!117975 (= (array_inv!23304 _keys!1945) (bvsge (size!30653 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84842 d!117975))

(declare-fun condMapEmpty!37086 () Bool)

(declare-fun mapDefault!37086 () ValueCell!11190)

(assert (=> mapNonEmpty!37080 (= condMapEmpty!37086 (= mapRest!37080 ((as const (Array (_ BitVec 32) ValueCell!11190)) mapDefault!37086)))))

(declare-fun e!559344 () Bool)

(declare-fun mapRes!37086 () Bool)

(assert (=> mapNonEmpty!37080 (= tp!70151 (and e!559344 mapRes!37086))))

(declare-fun b!991716 () Bool)

(declare-fun e!559345 () Bool)

(assert (=> b!991716 (= e!559345 tp_is_empty!23343)))

(declare-fun b!991717 () Bool)

(assert (=> b!991717 (= e!559344 tp_is_empty!23343)))

(declare-fun mapNonEmpty!37086 () Bool)

(declare-fun tp!70157 () Bool)

(assert (=> mapNonEmpty!37086 (= mapRes!37086 (and tp!70157 e!559345))))

(declare-fun mapKey!37086 () (_ BitVec 32))

(declare-fun mapRest!37086 () (Array (_ BitVec 32) ValueCell!11190))

(declare-fun mapValue!37086 () ValueCell!11190)

(assert (=> mapNonEmpty!37086 (= mapRest!37080 (store mapRest!37086 mapKey!37086 mapValue!37086))))

(declare-fun mapIsEmpty!37086 () Bool)

(assert (=> mapIsEmpty!37086 mapRes!37086))

(assert (= (and mapNonEmpty!37080 condMapEmpty!37086) mapIsEmpty!37086))

(assert (= (and mapNonEmpty!37080 (not condMapEmpty!37086)) mapNonEmpty!37086))

(assert (= (and mapNonEmpty!37086 ((_ is ValueCellFull!11190) mapValue!37086)) b!991716))

(assert (= (and mapNonEmpty!37080 ((_ is ValueCellFull!11190) mapDefault!37086)) b!991717))

(declare-fun m!919563 () Bool)

(assert (=> mapNonEmpty!37086 m!919563))

(check-sat (not b!991709) (not bm!42079) (not b!991708) (not mapNonEmpty!37086) (not b!991702) (not b!991703) tp_is_empty!23343)
(check-sat)
