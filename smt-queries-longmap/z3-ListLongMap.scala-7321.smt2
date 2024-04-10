; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93572 () Bool)

(assert start!93572)

(declare-fun res!707502 () Bool)

(declare-fun e!602657 () Bool)

(assert (=> start!93572 (=> (not res!707502) (not e!602657))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93572 (= res!707502 (validMask!0 mask!1515))))

(assert (=> start!93572 e!602657))

(assert (=> start!93572 true))

(declare-datatypes ((V!38355 0))(
  ( (V!38356 (val!12508 Int)) )
))
(declare-datatypes ((ValueCell!11754 0))(
  ( (ValueCellFull!11754 (v!15117 V!38355)) (EmptyCell!11754) )
))
(declare-datatypes ((array!66855 0))(
  ( (array!66856 (arr!32141 (Array (_ BitVec 32) ValueCell!11754)) (size!32677 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66855)

(declare-fun e!602655 () Bool)

(declare-fun array_inv!24920 (array!66855) Bool)

(assert (=> start!93572 (and (array_inv!24920 _values!955) e!602655)))

(declare-datatypes ((array!66857 0))(
  ( (array!66858 (arr!32142 (Array (_ BitVec 32) (_ BitVec 64))) (size!32678 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66857)

(declare-fun array_inv!24921 (array!66857) Bool)

(assert (=> start!93572 (array_inv!24921 _keys!1163)))

(declare-fun mapNonEmpty!39025 () Bool)

(declare-fun mapRes!39025 () Bool)

(declare-fun tp!74831 () Bool)

(declare-fun e!602659 () Bool)

(assert (=> mapNonEmpty!39025 (= mapRes!39025 (and tp!74831 e!602659))))

(declare-fun mapValue!39025 () ValueCell!11754)

(declare-fun mapKey!39025 () (_ BitVec 32))

(declare-fun mapRest!39025 () (Array (_ BitVec 32) ValueCell!11754))

(assert (=> mapNonEmpty!39025 (= (arr!32141 _values!955) (store mapRest!39025 mapKey!39025 mapValue!39025))))

(declare-fun b!1059023 () Bool)

(assert (=> b!1059023 (= e!602657 (bvsgt #b00000000000000000000000000000000 (size!32678 _keys!1163)))))

(declare-fun b!1059024 () Bool)

(declare-fun res!707504 () Bool)

(assert (=> b!1059024 (=> (not res!707504) (not e!602657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66857 (_ BitVec 32)) Bool)

(assert (=> b!1059024 (= res!707504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059025 () Bool)

(declare-fun e!602656 () Bool)

(assert (=> b!1059025 (= e!602655 (and e!602656 mapRes!39025))))

(declare-fun condMapEmpty!39025 () Bool)

(declare-fun mapDefault!39025 () ValueCell!11754)

(assert (=> b!1059025 (= condMapEmpty!39025 (= (arr!32141 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11754)) mapDefault!39025)))))

(declare-fun b!1059026 () Bool)

(declare-fun res!707503 () Bool)

(assert (=> b!1059026 (=> (not res!707503) (not e!602657))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059026 (= res!707503 (and (= (size!32677 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32678 _keys!1163) (size!32677 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39025 () Bool)

(assert (=> mapIsEmpty!39025 mapRes!39025))

(declare-fun b!1059027 () Bool)

(declare-fun tp_is_empty!24915 () Bool)

(assert (=> b!1059027 (= e!602656 tp_is_empty!24915)))

(declare-fun b!1059028 () Bool)

(assert (=> b!1059028 (= e!602659 tp_is_empty!24915)))

(assert (= (and start!93572 res!707502) b!1059026))

(assert (= (and b!1059026 res!707503) b!1059024))

(assert (= (and b!1059024 res!707504) b!1059023))

(assert (= (and b!1059025 condMapEmpty!39025) mapIsEmpty!39025))

(assert (= (and b!1059025 (not condMapEmpty!39025)) mapNonEmpty!39025))

(get-info :version)

(assert (= (and mapNonEmpty!39025 ((_ is ValueCellFull!11754) mapValue!39025)) b!1059028))

(assert (= (and b!1059025 ((_ is ValueCellFull!11754) mapDefault!39025)) b!1059027))

(assert (= start!93572 b!1059025))

(declare-fun m!978603 () Bool)

(assert (=> start!93572 m!978603))

(declare-fun m!978605 () Bool)

(assert (=> start!93572 m!978605))

(declare-fun m!978607 () Bool)

(assert (=> start!93572 m!978607))

(declare-fun m!978609 () Bool)

(assert (=> mapNonEmpty!39025 m!978609))

(declare-fun m!978611 () Bool)

(assert (=> b!1059024 m!978611))

(check-sat (not b!1059024) (not start!93572) (not mapNonEmpty!39025) tp_is_empty!24915)
(check-sat)
(get-model)

(declare-fun b!1059055 () Bool)

(declare-fun e!602681 () Bool)

(declare-fun e!602682 () Bool)

(assert (=> b!1059055 (= e!602681 e!602682)))

(declare-fun lt!467076 () (_ BitVec 64))

(assert (=> b!1059055 (= lt!467076 (select (arr!32142 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34718 0))(
  ( (Unit!34719) )
))
(declare-fun lt!467075 () Unit!34718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66857 (_ BitVec 64) (_ BitVec 32)) Unit!34718)

(assert (=> b!1059055 (= lt!467075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467076 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059055 (arrayContainsKey!0 _keys!1163 lt!467076 #b00000000000000000000000000000000)))

(declare-fun lt!467074 () Unit!34718)

(assert (=> b!1059055 (= lt!467074 lt!467075)))

(declare-fun res!707519 () Bool)

(declare-datatypes ((SeekEntryResult!9865 0))(
  ( (MissingZero!9865 (index!41831 (_ BitVec 32))) (Found!9865 (index!41832 (_ BitVec 32))) (Intermediate!9865 (undefined!10677 Bool) (index!41833 (_ BitVec 32)) (x!94622 (_ BitVec 32))) (Undefined!9865) (MissingVacant!9865 (index!41834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66857 (_ BitVec 32)) SeekEntryResult!9865)

(assert (=> b!1059055 (= res!707519 (= (seekEntryOrOpen!0 (select (arr!32142 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9865 #b00000000000000000000000000000000)))))

(assert (=> b!1059055 (=> (not res!707519) (not e!602682))))

(declare-fun b!1059056 () Bool)

(declare-fun e!602683 () Bool)

(assert (=> b!1059056 (= e!602683 e!602681)))

(declare-fun c!107184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059056 (= c!107184 (validKeyInArray!0 (select (arr!32142 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059057 () Bool)

(declare-fun call!44875 () Bool)

(assert (=> b!1059057 (= e!602681 call!44875)))

(declare-fun d!128683 () Bool)

(declare-fun res!707518 () Bool)

(assert (=> d!128683 (=> res!707518 e!602683)))

(assert (=> d!128683 (= res!707518 (bvsge #b00000000000000000000000000000000 (size!32678 _keys!1163)))))

(assert (=> d!128683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602683)))

(declare-fun bm!44872 () Bool)

(assert (=> bm!44872 (= call!44875 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059058 () Bool)

(assert (=> b!1059058 (= e!602682 call!44875)))

(assert (= (and d!128683 (not res!707518)) b!1059056))

(assert (= (and b!1059056 c!107184) b!1059055))

(assert (= (and b!1059056 (not c!107184)) b!1059057))

(assert (= (and b!1059055 res!707519) b!1059058))

(assert (= (or b!1059058 b!1059057) bm!44872))

(declare-fun m!978623 () Bool)

(assert (=> b!1059055 m!978623))

(declare-fun m!978625 () Bool)

(assert (=> b!1059055 m!978625))

(declare-fun m!978627 () Bool)

(assert (=> b!1059055 m!978627))

(assert (=> b!1059055 m!978623))

(declare-fun m!978629 () Bool)

(assert (=> b!1059055 m!978629))

(assert (=> b!1059056 m!978623))

(assert (=> b!1059056 m!978623))

(declare-fun m!978631 () Bool)

(assert (=> b!1059056 m!978631))

(declare-fun m!978633 () Bool)

(assert (=> bm!44872 m!978633))

(assert (=> b!1059024 d!128683))

(declare-fun d!128685 () Bool)

(assert (=> d!128685 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93572 d!128685))

(declare-fun d!128687 () Bool)

(assert (=> d!128687 (= (array_inv!24920 _values!955) (bvsge (size!32677 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93572 d!128687))

(declare-fun d!128689 () Bool)

(assert (=> d!128689 (= (array_inv!24921 _keys!1163) (bvsge (size!32678 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93572 d!128689))

(declare-fun mapNonEmpty!39031 () Bool)

(declare-fun mapRes!39031 () Bool)

(declare-fun tp!74837 () Bool)

(declare-fun e!602689 () Bool)

(assert (=> mapNonEmpty!39031 (= mapRes!39031 (and tp!74837 e!602689))))

(declare-fun mapRest!39031 () (Array (_ BitVec 32) ValueCell!11754))

(declare-fun mapKey!39031 () (_ BitVec 32))

(declare-fun mapValue!39031 () ValueCell!11754)

(assert (=> mapNonEmpty!39031 (= mapRest!39025 (store mapRest!39031 mapKey!39031 mapValue!39031))))

(declare-fun mapIsEmpty!39031 () Bool)

(assert (=> mapIsEmpty!39031 mapRes!39031))

(declare-fun b!1059066 () Bool)

(declare-fun e!602688 () Bool)

(assert (=> b!1059066 (= e!602688 tp_is_empty!24915)))

(declare-fun condMapEmpty!39031 () Bool)

(declare-fun mapDefault!39031 () ValueCell!11754)

(assert (=> mapNonEmpty!39025 (= condMapEmpty!39031 (= mapRest!39025 ((as const (Array (_ BitVec 32) ValueCell!11754)) mapDefault!39031)))))

(assert (=> mapNonEmpty!39025 (= tp!74831 (and e!602688 mapRes!39031))))

(declare-fun b!1059065 () Bool)

(assert (=> b!1059065 (= e!602689 tp_is_empty!24915)))

(assert (= (and mapNonEmpty!39025 condMapEmpty!39031) mapIsEmpty!39031))

(assert (= (and mapNonEmpty!39025 (not condMapEmpty!39031)) mapNonEmpty!39031))

(assert (= (and mapNonEmpty!39031 ((_ is ValueCellFull!11754) mapValue!39031)) b!1059065))

(assert (= (and mapNonEmpty!39025 ((_ is ValueCellFull!11754) mapDefault!39031)) b!1059066))

(declare-fun m!978635 () Bool)

(assert (=> mapNonEmpty!39031 m!978635))

(check-sat (not bm!44872) (not mapNonEmpty!39031) tp_is_empty!24915 (not b!1059055) (not b!1059056))
(check-sat)
