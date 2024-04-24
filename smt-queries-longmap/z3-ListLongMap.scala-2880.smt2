; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41386 () Bool)

(assert start!41386)

(declare-fun b!462612 () Bool)

(declare-fun e!270000 () Bool)

(declare-fun tp_is_empty!12517 () Bool)

(assert (=> b!462612 (= e!270000 tp_is_empty!12517)))

(declare-fun b!462613 () Bool)

(declare-fun e!270002 () Bool)

(declare-datatypes ((array!28832 0))(
  ( (array!28833 (arr!13849 (Array (_ BitVec 32) (_ BitVec 64))) (size!14201 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28832)

(assert (=> b!462613 (= e!270002 (bvsgt #b00000000000000000000000000000000 (size!14201 _keys!1025)))))

(declare-fun mapNonEmpty!20446 () Bool)

(declare-fun mapRes!20446 () Bool)

(declare-fun tp!39265 () Bool)

(assert (=> mapNonEmpty!20446 (= mapRes!20446 (and tp!39265 e!270000))))

(declare-datatypes ((V!17795 0))(
  ( (V!17796 (val!6303 Int)) )
))
(declare-datatypes ((ValueCell!5915 0))(
  ( (ValueCellFull!5915 (v!8591 V!17795)) (EmptyCell!5915) )
))
(declare-datatypes ((array!28834 0))(
  ( (array!28835 (arr!13850 (Array (_ BitVec 32) ValueCell!5915)) (size!14202 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28834)

(declare-fun mapRest!20446 () (Array (_ BitVec 32) ValueCell!5915))

(declare-fun mapKey!20446 () (_ BitVec 32))

(declare-fun mapValue!20446 () ValueCell!5915)

(assert (=> mapNonEmpty!20446 (= (arr!13850 _values!833) (store mapRest!20446 mapKey!20446 mapValue!20446))))

(declare-fun b!462614 () Bool)

(declare-fun e!269999 () Bool)

(declare-fun e!270003 () Bool)

(assert (=> b!462614 (= e!269999 (and e!270003 mapRes!20446))))

(declare-fun condMapEmpty!20446 () Bool)

(declare-fun mapDefault!20446 () ValueCell!5915)

(assert (=> b!462614 (= condMapEmpty!20446 (= (arr!13850 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5915)) mapDefault!20446)))))

(declare-fun mapIsEmpty!20446 () Bool)

(assert (=> mapIsEmpty!20446 mapRes!20446))

(declare-fun res!276677 () Bool)

(assert (=> start!41386 (=> (not res!276677) (not e!270002))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41386 (= res!276677 (validMask!0 mask!1365))))

(assert (=> start!41386 e!270002))

(assert (=> start!41386 true))

(declare-fun array_inv!10094 (array!28832) Bool)

(assert (=> start!41386 (array_inv!10094 _keys!1025)))

(declare-fun array_inv!10095 (array!28834) Bool)

(assert (=> start!41386 (and (array_inv!10095 _values!833) e!269999)))

(declare-fun b!462615 () Bool)

(declare-fun res!276679 () Bool)

(assert (=> b!462615 (=> (not res!276679) (not e!270002))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462615 (= res!276679 (and (= (size!14202 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14201 _keys!1025) (size!14202 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462616 () Bool)

(declare-fun res!276676 () Bool)

(assert (=> b!462616 (=> (not res!276676) (not e!270002))))

(declare-datatypes ((List!8277 0))(
  ( (Nil!8274) (Cons!8273 (h!9129 (_ BitVec 64)) (t!14213 List!8277)) )
))
(declare-fun arrayNoDuplicates!0 (array!28832 (_ BitVec 32) List!8277) Bool)

(assert (=> b!462616 (= res!276676 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8274))))

(declare-fun b!462617 () Bool)

(assert (=> b!462617 (= e!270003 tp_is_empty!12517)))

(declare-fun b!462618 () Bool)

(declare-fun res!276678 () Bool)

(assert (=> b!462618 (=> (not res!276678) (not e!270002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28832 (_ BitVec 32)) Bool)

(assert (=> b!462618 (= res!276678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41386 res!276677) b!462615))

(assert (= (and b!462615 res!276679) b!462618))

(assert (= (and b!462618 res!276678) b!462616))

(assert (= (and b!462616 res!276676) b!462613))

(assert (= (and b!462614 condMapEmpty!20446) mapIsEmpty!20446))

(assert (= (and b!462614 (not condMapEmpty!20446)) mapNonEmpty!20446))

(get-info :version)

(assert (= (and mapNonEmpty!20446 ((_ is ValueCellFull!5915) mapValue!20446)) b!462612))

(assert (= (and b!462614 ((_ is ValueCellFull!5915) mapDefault!20446)) b!462617))

(assert (= start!41386 b!462614))

(declare-fun m!445715 () Bool)

(assert (=> mapNonEmpty!20446 m!445715))

(declare-fun m!445717 () Bool)

(assert (=> start!41386 m!445717))

(declare-fun m!445719 () Bool)

(assert (=> start!41386 m!445719))

(declare-fun m!445721 () Bool)

(assert (=> start!41386 m!445721))

(declare-fun m!445723 () Bool)

(assert (=> b!462616 m!445723))

(declare-fun m!445725 () Bool)

(assert (=> b!462618 m!445725))

(check-sat (not b!462618) (not mapNonEmpty!20446) (not start!41386) (not b!462616) tp_is_empty!12517)
(check-sat)
(get-model)

(declare-fun b!462669 () Bool)

(declare-fun e!270040 () Bool)

(declare-fun call!30192 () Bool)

(assert (=> b!462669 (= e!270040 call!30192)))

(declare-fun b!462670 () Bool)

(declare-fun e!270041 () Bool)

(assert (=> b!462670 (= e!270041 e!270040)))

(declare-fun lt!209265 () (_ BitVec 64))

(assert (=> b!462670 (= lt!209265 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13442 0))(
  ( (Unit!13443) )
))
(declare-fun lt!209267 () Unit!13442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28832 (_ BitVec 64) (_ BitVec 32)) Unit!13442)

(assert (=> b!462670 (= lt!209267 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209265 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462670 (arrayContainsKey!0 _keys!1025 lt!209265 #b00000000000000000000000000000000)))

(declare-fun lt!209266 () Unit!13442)

(assert (=> b!462670 (= lt!209266 lt!209267)))

(declare-fun res!276709 () Bool)

(declare-datatypes ((SeekEntryResult!3491 0))(
  ( (MissingZero!3491 (index!16143 (_ BitVec 32))) (Found!3491 (index!16144 (_ BitVec 32))) (Intermediate!3491 (undefined!4303 Bool) (index!16145 (_ BitVec 32)) (x!43106 (_ BitVec 32))) (Undefined!3491) (MissingVacant!3491 (index!16146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28832 (_ BitVec 32)) SeekEntryResult!3491)

(assert (=> b!462670 (= res!276709 (= (seekEntryOrOpen!0 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3491 #b00000000000000000000000000000000)))))

(assert (=> b!462670 (=> (not res!276709) (not e!270040))))

(declare-fun bm!30189 () Bool)

(assert (=> bm!30189 (= call!30192 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75003 () Bool)

(declare-fun res!276708 () Bool)

(declare-fun e!270042 () Bool)

(assert (=> d!75003 (=> res!276708 e!270042)))

(assert (=> d!75003 (= res!276708 (bvsge #b00000000000000000000000000000000 (size!14201 _keys!1025)))))

(assert (=> d!75003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!270042)))

(declare-fun b!462671 () Bool)

(assert (=> b!462671 (= e!270041 call!30192)))

(declare-fun b!462672 () Bool)

(assert (=> b!462672 (= e!270042 e!270041)))

(declare-fun c!56604 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462672 (= c!56604 (validKeyInArray!0 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75003 (not res!276708)) b!462672))

(assert (= (and b!462672 c!56604) b!462670))

(assert (= (and b!462672 (not c!56604)) b!462671))

(assert (= (and b!462670 res!276709) b!462669))

(assert (= (or b!462669 b!462671) bm!30189))

(declare-fun m!445751 () Bool)

(assert (=> b!462670 m!445751))

(declare-fun m!445753 () Bool)

(assert (=> b!462670 m!445753))

(declare-fun m!445755 () Bool)

(assert (=> b!462670 m!445755))

(assert (=> b!462670 m!445751))

(declare-fun m!445757 () Bool)

(assert (=> b!462670 m!445757))

(declare-fun m!445759 () Bool)

(assert (=> bm!30189 m!445759))

(assert (=> b!462672 m!445751))

(assert (=> b!462672 m!445751))

(declare-fun m!445761 () Bool)

(assert (=> b!462672 m!445761))

(assert (=> b!462618 d!75003))

(declare-fun b!462683 () Bool)

(declare-fun e!270054 () Bool)

(declare-fun e!270053 () Bool)

(assert (=> b!462683 (= e!270054 e!270053)))

(declare-fun res!276716 () Bool)

(assert (=> b!462683 (=> (not res!276716) (not e!270053))))

(declare-fun e!270052 () Bool)

(assert (=> b!462683 (= res!276716 (not e!270052))))

(declare-fun res!276718 () Bool)

(assert (=> b!462683 (=> (not res!276718) (not e!270052))))

(assert (=> b!462683 (= res!276718 (validKeyInArray!0 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462684 () Bool)

(declare-fun e!270051 () Bool)

(declare-fun call!30195 () Bool)

(assert (=> b!462684 (= e!270051 call!30195)))

(declare-fun bm!30192 () Bool)

(declare-fun c!56607 () Bool)

(assert (=> bm!30192 (= call!30195 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56607 (Cons!8273 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000) Nil!8274) Nil!8274)))))

(declare-fun b!462685 () Bool)

(assert (=> b!462685 (= e!270053 e!270051)))

(assert (=> b!462685 (= c!56607 (validKeyInArray!0 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462686 () Bool)

(declare-fun contains!2498 (List!8277 (_ BitVec 64)) Bool)

(assert (=> b!462686 (= e!270052 (contains!2498 Nil!8274 (select (arr!13849 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75005 () Bool)

(declare-fun res!276717 () Bool)

(assert (=> d!75005 (=> res!276717 e!270054)))

(assert (=> d!75005 (= res!276717 (bvsge #b00000000000000000000000000000000 (size!14201 _keys!1025)))))

(assert (=> d!75005 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8274) e!270054)))

(declare-fun b!462687 () Bool)

(assert (=> b!462687 (= e!270051 call!30195)))

(assert (= (and d!75005 (not res!276717)) b!462683))

(assert (= (and b!462683 res!276718) b!462686))

(assert (= (and b!462683 res!276716) b!462685))

(assert (= (and b!462685 c!56607) b!462687))

(assert (= (and b!462685 (not c!56607)) b!462684))

(assert (= (or b!462687 b!462684) bm!30192))

(assert (=> b!462683 m!445751))

(assert (=> b!462683 m!445751))

(assert (=> b!462683 m!445761))

(assert (=> bm!30192 m!445751))

(declare-fun m!445763 () Bool)

(assert (=> bm!30192 m!445763))

(assert (=> b!462685 m!445751))

(assert (=> b!462685 m!445751))

(assert (=> b!462685 m!445761))

(assert (=> b!462686 m!445751))

(assert (=> b!462686 m!445751))

(declare-fun m!445765 () Bool)

(assert (=> b!462686 m!445765))

(assert (=> b!462616 d!75005))

(declare-fun d!75007 () Bool)

(assert (=> d!75007 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41386 d!75007))

(declare-fun d!75009 () Bool)

(assert (=> d!75009 (= (array_inv!10094 _keys!1025) (bvsge (size!14201 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41386 d!75009))

(declare-fun d!75011 () Bool)

(assert (=> d!75011 (= (array_inv!10095 _values!833) (bvsge (size!14202 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41386 d!75011))

(declare-fun b!462694 () Bool)

(declare-fun e!270059 () Bool)

(assert (=> b!462694 (= e!270059 tp_is_empty!12517)))

(declare-fun mapIsEmpty!20455 () Bool)

(declare-fun mapRes!20455 () Bool)

(assert (=> mapIsEmpty!20455 mapRes!20455))

(declare-fun condMapEmpty!20455 () Bool)

(declare-fun mapDefault!20455 () ValueCell!5915)

(assert (=> mapNonEmpty!20446 (= condMapEmpty!20455 (= mapRest!20446 ((as const (Array (_ BitVec 32) ValueCell!5915)) mapDefault!20455)))))

(declare-fun e!270060 () Bool)

(assert (=> mapNonEmpty!20446 (= tp!39265 (and e!270060 mapRes!20455))))

(declare-fun mapNonEmpty!20455 () Bool)

(declare-fun tp!39274 () Bool)

(assert (=> mapNonEmpty!20455 (= mapRes!20455 (and tp!39274 e!270059))))

(declare-fun mapKey!20455 () (_ BitVec 32))

(declare-fun mapValue!20455 () ValueCell!5915)

(declare-fun mapRest!20455 () (Array (_ BitVec 32) ValueCell!5915))

(assert (=> mapNonEmpty!20455 (= mapRest!20446 (store mapRest!20455 mapKey!20455 mapValue!20455))))

(declare-fun b!462695 () Bool)

(assert (=> b!462695 (= e!270060 tp_is_empty!12517)))

(assert (= (and mapNonEmpty!20446 condMapEmpty!20455) mapIsEmpty!20455))

(assert (= (and mapNonEmpty!20446 (not condMapEmpty!20455)) mapNonEmpty!20455))

(assert (= (and mapNonEmpty!20455 ((_ is ValueCellFull!5915) mapValue!20455)) b!462694))

(assert (= (and mapNonEmpty!20446 ((_ is ValueCellFull!5915) mapDefault!20455)) b!462695))

(declare-fun m!445767 () Bool)

(assert (=> mapNonEmpty!20455 m!445767))

(check-sat (not b!462685) (not mapNonEmpty!20455) (not bm!30192) (not b!462670) (not b!462686) (not bm!30189) (not b!462672) tp_is_empty!12517 (not b!462683))
(check-sat)
