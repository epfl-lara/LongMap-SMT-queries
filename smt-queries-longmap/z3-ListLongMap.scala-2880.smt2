; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41402 () Bool)

(assert start!41402)

(declare-fun mapIsEmpty!20449 () Bool)

(declare-fun mapRes!20449 () Bool)

(assert (=> mapIsEmpty!20449 mapRes!20449))

(declare-fun b!462694 () Bool)

(declare-fun e!270056 () Bool)

(declare-fun e!270053 () Bool)

(assert (=> b!462694 (= e!270056 (and e!270053 mapRes!20449))))

(declare-fun condMapEmpty!20449 () Bool)

(declare-datatypes ((V!17797 0))(
  ( (V!17798 (val!6304 Int)) )
))
(declare-datatypes ((ValueCell!5916 0))(
  ( (ValueCellFull!5916 (v!8591 V!17797)) (EmptyCell!5916) )
))
(declare-datatypes ((array!28837 0))(
  ( (array!28838 (arr!13852 (Array (_ BitVec 32) ValueCell!5916)) (size!14204 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28837)

(declare-fun mapDefault!20449 () ValueCell!5916)

(assert (=> b!462694 (= condMapEmpty!20449 (= (arr!13852 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5916)) mapDefault!20449)))))

(declare-fun b!462695 () Bool)

(declare-fun tp_is_empty!12519 () Bool)

(assert (=> b!462695 (= e!270053 tp_is_empty!12519)))

(declare-fun b!462696 () Bool)

(declare-fun res!276697 () Bool)

(declare-fun e!270055 () Bool)

(assert (=> b!462696 (=> (not res!276697) (not e!270055))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28839 0))(
  ( (array!28840 (arr!13853 (Array (_ BitVec 32) (_ BitVec 64))) (size!14205 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28839)

(assert (=> b!462696 (= res!276697 (and (= (size!14204 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14205 _keys!1025) (size!14204 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462697 () Bool)

(assert (=> b!462697 (= e!270055 (bvsgt #b00000000000000000000000000000000 (size!14205 _keys!1025)))))

(declare-fun b!462698 () Bool)

(declare-fun res!276696 () Bool)

(assert (=> b!462698 (=> (not res!276696) (not e!270055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28839 (_ BitVec 32)) Bool)

(assert (=> b!462698 (= res!276696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276698 () Bool)

(assert (=> start!41402 (=> (not res!276698) (not e!270055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41402 (= res!276698 (validMask!0 mask!1365))))

(assert (=> start!41402 e!270055))

(assert (=> start!41402 true))

(declare-fun array_inv!10016 (array!28839) Bool)

(assert (=> start!41402 (array_inv!10016 _keys!1025)))

(declare-fun array_inv!10017 (array!28837) Bool)

(assert (=> start!41402 (and (array_inv!10017 _values!833) e!270056)))

(declare-fun mapNonEmpty!20449 () Bool)

(declare-fun tp!39268 () Bool)

(declare-fun e!270057 () Bool)

(assert (=> mapNonEmpty!20449 (= mapRes!20449 (and tp!39268 e!270057))))

(declare-fun mapRest!20449 () (Array (_ BitVec 32) ValueCell!5916))

(declare-fun mapKey!20449 () (_ BitVec 32))

(declare-fun mapValue!20449 () ValueCell!5916)

(assert (=> mapNonEmpty!20449 (= (arr!13852 _values!833) (store mapRest!20449 mapKey!20449 mapValue!20449))))

(declare-fun b!462699 () Bool)

(declare-fun res!276695 () Bool)

(assert (=> b!462699 (=> (not res!276695) (not e!270055))))

(declare-datatypes ((List!8351 0))(
  ( (Nil!8348) (Cons!8347 (h!9203 (_ BitVec 64)) (t!14295 List!8351)) )
))
(declare-fun arrayNoDuplicates!0 (array!28839 (_ BitVec 32) List!8351) Bool)

(assert (=> b!462699 (= res!276695 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8348))))

(declare-fun b!462700 () Bool)

(assert (=> b!462700 (= e!270057 tp_is_empty!12519)))

(assert (= (and start!41402 res!276698) b!462696))

(assert (= (and b!462696 res!276697) b!462698))

(assert (= (and b!462698 res!276696) b!462699))

(assert (= (and b!462699 res!276695) b!462697))

(assert (= (and b!462694 condMapEmpty!20449) mapIsEmpty!20449))

(assert (= (and b!462694 (not condMapEmpty!20449)) mapNonEmpty!20449))

(get-info :version)

(assert (= (and mapNonEmpty!20449 ((_ is ValueCellFull!5916) mapValue!20449)) b!462700))

(assert (= (and b!462694 ((_ is ValueCellFull!5916) mapDefault!20449)) b!462695))

(assert (= start!41402 b!462694))

(declare-fun m!445545 () Bool)

(assert (=> b!462698 m!445545))

(declare-fun m!445547 () Bool)

(assert (=> start!41402 m!445547))

(declare-fun m!445549 () Bool)

(assert (=> start!41402 m!445549))

(declare-fun m!445551 () Bool)

(assert (=> start!41402 m!445551))

(declare-fun m!445553 () Bool)

(assert (=> mapNonEmpty!20449 m!445553))

(declare-fun m!445555 () Bool)

(assert (=> b!462699 m!445555))

(check-sat tp_is_empty!12519 (not start!41402) (not mapNonEmpty!20449) (not b!462699) (not b!462698))
(check-sat)
(get-model)

(declare-fun b!462732 () Bool)

(declare-fun e!270081 () Bool)

(declare-fun call!30206 () Bool)

(assert (=> b!462732 (= e!270081 call!30206)))

(declare-fun d!74975 () Bool)

(declare-fun res!276718 () Bool)

(declare-fun e!270082 () Bool)

(assert (=> d!74975 (=> res!276718 e!270082)))

(assert (=> d!74975 (= res!276718 (bvsge #b00000000000000000000000000000000 (size!14205 _keys!1025)))))

(assert (=> d!74975 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8348) e!270082)))

(declare-fun b!462733 () Bool)

(declare-fun e!270083 () Bool)

(declare-fun contains!2517 (List!8351 (_ BitVec 64)) Bool)

(assert (=> b!462733 (= e!270083 (contains!2517 Nil!8348 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462734 () Bool)

(declare-fun e!270084 () Bool)

(assert (=> b!462734 (= e!270082 e!270084)))

(declare-fun res!276717 () Bool)

(assert (=> b!462734 (=> (not res!276717) (not e!270084))))

(assert (=> b!462734 (= res!276717 (not e!270083))))

(declare-fun res!276719 () Bool)

(assert (=> b!462734 (=> (not res!276719) (not e!270083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462734 (= res!276719 (validKeyInArray!0 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462735 () Bool)

(assert (=> b!462735 (= e!270081 call!30206)))

(declare-fun b!462736 () Bool)

(assert (=> b!462736 (= e!270084 e!270081)))

(declare-fun c!56631 () Bool)

(assert (=> b!462736 (= c!56631 (validKeyInArray!0 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30203 () Bool)

(assert (=> bm!30203 (= call!30206 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56631 (Cons!8347 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000) Nil!8348) Nil!8348)))))

(assert (= (and d!74975 (not res!276718)) b!462734))

(assert (= (and b!462734 res!276719) b!462733))

(assert (= (and b!462734 res!276717) b!462736))

(assert (= (and b!462736 c!56631) b!462732))

(assert (= (and b!462736 (not c!56631)) b!462735))

(assert (= (or b!462732 b!462735) bm!30203))

(declare-fun m!445569 () Bool)

(assert (=> b!462733 m!445569))

(assert (=> b!462733 m!445569))

(declare-fun m!445571 () Bool)

(assert (=> b!462733 m!445571))

(assert (=> b!462734 m!445569))

(assert (=> b!462734 m!445569))

(declare-fun m!445573 () Bool)

(assert (=> b!462734 m!445573))

(assert (=> b!462736 m!445569))

(assert (=> b!462736 m!445569))

(assert (=> b!462736 m!445573))

(assert (=> bm!30203 m!445569))

(declare-fun m!445575 () Bool)

(assert (=> bm!30203 m!445575))

(assert (=> b!462699 d!74975))

(declare-fun b!462745 () Bool)

(declare-fun e!270092 () Bool)

(declare-fun e!270091 () Bool)

(assert (=> b!462745 (= e!270092 e!270091)))

(declare-fun c!56634 () Bool)

(assert (=> b!462745 (= c!56634 (validKeyInArray!0 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462746 () Bool)

(declare-fun e!270093 () Bool)

(declare-fun call!30209 () Bool)

(assert (=> b!462746 (= e!270093 call!30209)))

(declare-fun b!462747 () Bool)

(assert (=> b!462747 (= e!270091 e!270093)))

(declare-fun lt!209254 () (_ BitVec 64))

(assert (=> b!462747 (= lt!209254 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13446 0))(
  ( (Unit!13447) )
))
(declare-fun lt!209253 () Unit!13446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28839 (_ BitVec 64) (_ BitVec 32)) Unit!13446)

(assert (=> b!462747 (= lt!209253 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209254 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462747 (arrayContainsKey!0 _keys!1025 lt!209254 #b00000000000000000000000000000000)))

(declare-fun lt!209255 () Unit!13446)

(assert (=> b!462747 (= lt!209255 lt!209253)))

(declare-fun res!276725 () Bool)

(declare-datatypes ((SeekEntryResult!3542 0))(
  ( (MissingZero!3542 (index!16347 (_ BitVec 32))) (Found!3542 (index!16348 (_ BitVec 32))) (Intermediate!3542 (undefined!4354 Bool) (index!16349 (_ BitVec 32)) (x!43160 (_ BitVec 32))) (Undefined!3542) (MissingVacant!3542 (index!16350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28839 (_ BitVec 32)) SeekEntryResult!3542)

(assert (=> b!462747 (= res!276725 (= (seekEntryOrOpen!0 (select (arr!13853 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3542 #b00000000000000000000000000000000)))))

(assert (=> b!462747 (=> (not res!276725) (not e!270093))))

(declare-fun b!462748 () Bool)

(assert (=> b!462748 (= e!270091 call!30209)))

(declare-fun bm!30206 () Bool)

(assert (=> bm!30206 (= call!30209 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!74977 () Bool)

(declare-fun res!276724 () Bool)

(assert (=> d!74977 (=> res!276724 e!270092)))

(assert (=> d!74977 (= res!276724 (bvsge #b00000000000000000000000000000000 (size!14205 _keys!1025)))))

(assert (=> d!74977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!270092)))

(assert (= (and d!74977 (not res!276724)) b!462745))

(assert (= (and b!462745 c!56634) b!462747))

(assert (= (and b!462745 (not c!56634)) b!462748))

(assert (= (and b!462747 res!276725) b!462746))

(assert (= (or b!462746 b!462748) bm!30206))

(assert (=> b!462745 m!445569))

(assert (=> b!462745 m!445569))

(assert (=> b!462745 m!445573))

(assert (=> b!462747 m!445569))

(declare-fun m!445577 () Bool)

(assert (=> b!462747 m!445577))

(declare-fun m!445579 () Bool)

(assert (=> b!462747 m!445579))

(assert (=> b!462747 m!445569))

(declare-fun m!445581 () Bool)

(assert (=> b!462747 m!445581))

(declare-fun m!445583 () Bool)

(assert (=> bm!30206 m!445583))

(assert (=> b!462698 d!74977))

(declare-fun d!74979 () Bool)

(assert (=> d!74979 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41402 d!74979))

(declare-fun d!74981 () Bool)

(assert (=> d!74981 (= (array_inv!10016 _keys!1025) (bvsge (size!14205 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41402 d!74981))

(declare-fun d!74983 () Bool)

(assert (=> d!74983 (= (array_inv!10017 _values!833) (bvsge (size!14204 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41402 d!74983))

(declare-fun b!462756 () Bool)

(declare-fun e!270098 () Bool)

(assert (=> b!462756 (= e!270098 tp_is_empty!12519)))

(declare-fun mapNonEmpty!20455 () Bool)

(declare-fun mapRes!20455 () Bool)

(declare-fun tp!39274 () Bool)

(declare-fun e!270099 () Bool)

(assert (=> mapNonEmpty!20455 (= mapRes!20455 (and tp!39274 e!270099))))

(declare-fun mapValue!20455 () ValueCell!5916)

(declare-fun mapKey!20455 () (_ BitVec 32))

(declare-fun mapRest!20455 () (Array (_ BitVec 32) ValueCell!5916))

(assert (=> mapNonEmpty!20455 (= mapRest!20449 (store mapRest!20455 mapKey!20455 mapValue!20455))))

(declare-fun mapIsEmpty!20455 () Bool)

(assert (=> mapIsEmpty!20455 mapRes!20455))

(declare-fun condMapEmpty!20455 () Bool)

(declare-fun mapDefault!20455 () ValueCell!5916)

(assert (=> mapNonEmpty!20449 (= condMapEmpty!20455 (= mapRest!20449 ((as const (Array (_ BitVec 32) ValueCell!5916)) mapDefault!20455)))))

(assert (=> mapNonEmpty!20449 (= tp!39268 (and e!270098 mapRes!20455))))

(declare-fun b!462755 () Bool)

(assert (=> b!462755 (= e!270099 tp_is_empty!12519)))

(assert (= (and mapNonEmpty!20449 condMapEmpty!20455) mapIsEmpty!20455))

(assert (= (and mapNonEmpty!20449 (not condMapEmpty!20455)) mapNonEmpty!20455))

(assert (= (and mapNonEmpty!20455 ((_ is ValueCellFull!5916) mapValue!20455)) b!462755))

(assert (= (and mapNonEmpty!20449 ((_ is ValueCellFull!5916) mapDefault!20455)) b!462756))

(declare-fun m!445585 () Bool)

(assert (=> mapNonEmpty!20455 m!445585))

(check-sat (not b!462747) tp_is_empty!12519 (not mapNonEmpty!20455) (not b!462736) (not b!462745) (not bm!30203) (not bm!30206) (not b!462733) (not b!462734))
(check-sat)
