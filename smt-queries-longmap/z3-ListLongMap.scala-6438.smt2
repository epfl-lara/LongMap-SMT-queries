; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82420 () Bool)

(assert start!82420)

(declare-fun b!960835 () Bool)

(declare-fun e!541669 () Bool)

(declare-fun tp_is_empty!21403 () Bool)

(assert (=> b!960835 (= e!541669 tp_is_empty!21403)))

(declare-fun b!960836 () Bool)

(declare-fun res!643166 () Bool)

(declare-fun e!541671 () Bool)

(assert (=> b!960836 (=> (not res!643166) (not e!541671))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33521 0))(
  ( (V!33522 (val!10752 Int)) )
))
(declare-datatypes ((ValueCell!10220 0))(
  ( (ValueCellFull!10220 (v!13308 V!33521)) (EmptyCell!10220) )
))
(declare-datatypes ((array!58834 0))(
  ( (array!58835 (arr!28289 (Array (_ BitVec 32) ValueCell!10220)) (size!28770 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58834)

(declare-datatypes ((array!58836 0))(
  ( (array!58837 (arr!28290 (Array (_ BitVec 32) (_ BitVec 64))) (size!28771 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58836)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!960836 (= res!643166 (and (= (size!28770 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28771 _keys!1686) (size!28770 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!960837 () Bool)

(declare-fun e!541672 () Bool)

(declare-fun mapRes!34090 () Bool)

(assert (=> b!960837 (= e!541672 (and e!541669 mapRes!34090))))

(declare-fun condMapEmpty!34090 () Bool)

(declare-fun mapDefault!34090 () ValueCell!10220)

(assert (=> b!960837 (= condMapEmpty!34090 (= (arr!28289 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10220)) mapDefault!34090)))))

(declare-fun res!643167 () Bool)

(assert (=> start!82420 (=> (not res!643167) (not e!541671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82420 (= res!643167 (validMask!0 mask!2110))))

(assert (=> start!82420 e!541671))

(assert (=> start!82420 true))

(declare-fun array_inv!21975 (array!58834) Bool)

(assert (=> start!82420 (and (array_inv!21975 _values!1400) e!541672)))

(declare-fun array_inv!21976 (array!58836) Bool)

(assert (=> start!82420 (array_inv!21976 _keys!1686)))

(declare-fun b!960838 () Bool)

(declare-fun res!643165 () Bool)

(assert (=> b!960838 (=> (not res!643165) (not e!541671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58836 (_ BitVec 32)) Bool)

(assert (=> b!960838 (= res!643165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34090 () Bool)

(declare-fun tp!65020 () Bool)

(declare-fun e!541673 () Bool)

(assert (=> mapNonEmpty!34090 (= mapRes!34090 (and tp!65020 e!541673))))

(declare-fun mapRest!34090 () (Array (_ BitVec 32) ValueCell!10220))

(declare-fun mapKey!34090 () (_ BitVec 32))

(declare-fun mapValue!34090 () ValueCell!10220)

(assert (=> mapNonEmpty!34090 (= (arr!28289 _values!1400) (store mapRest!34090 mapKey!34090 mapValue!34090))))

(declare-fun mapIsEmpty!34090 () Bool)

(assert (=> mapIsEmpty!34090 mapRes!34090))

(declare-fun b!960839 () Bool)

(assert (=> b!960839 (= e!541673 tp_is_empty!21403)))

(declare-fun b!960840 () Bool)

(assert (=> b!960840 (= e!541671 (and (bvsle #b00000000000000000000000000000000 (size!28771 _keys!1686)) (bvsge (size!28771 _keys!1686) #b01111111111111111111111111111111)))))

(assert (= (and start!82420 res!643167) b!960836))

(assert (= (and b!960836 res!643166) b!960838))

(assert (= (and b!960838 res!643165) b!960840))

(assert (= (and b!960837 condMapEmpty!34090) mapIsEmpty!34090))

(assert (= (and b!960837 (not condMapEmpty!34090)) mapNonEmpty!34090))

(get-info :version)

(assert (= (and mapNonEmpty!34090 ((_ is ValueCellFull!10220) mapValue!34090)) b!960839))

(assert (= (and b!960837 ((_ is ValueCellFull!10220) mapDefault!34090)) b!960835))

(assert (= start!82420 b!960837))

(declare-fun m!890401 () Bool)

(assert (=> start!82420 m!890401))

(declare-fun m!890403 () Bool)

(assert (=> start!82420 m!890403))

(declare-fun m!890405 () Bool)

(assert (=> start!82420 m!890405))

(declare-fun m!890407 () Bool)

(assert (=> b!960838 m!890407))

(declare-fun m!890409 () Bool)

(assert (=> mapNonEmpty!34090 m!890409))

(check-sat (not b!960838) (not start!82420) (not mapNonEmpty!34090) tp_is_empty!21403)
(check-sat)
(get-model)

(declare-fun b!960886 () Bool)

(declare-fun e!541712 () Bool)

(declare-fun e!541710 () Bool)

(assert (=> b!960886 (= e!541712 e!541710)))

(declare-fun lt!430479 () (_ BitVec 64))

(assert (=> b!960886 (= lt!430479 (select (arr!28290 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32064 0))(
  ( (Unit!32065) )
))
(declare-fun lt!430478 () Unit!32064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58836 (_ BitVec 64) (_ BitVec 32)) Unit!32064)

(assert (=> b!960886 (= lt!430478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430479 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!960886 (arrayContainsKey!0 _keys!1686 lt!430479 #b00000000000000000000000000000000)))

(declare-fun lt!430480 () Unit!32064)

(assert (=> b!960886 (= lt!430480 lt!430478)))

(declare-fun res!643191 () Bool)

(declare-datatypes ((SeekEntryResult!9189 0))(
  ( (MissingZero!9189 (index!39127 (_ BitVec 32))) (Found!9189 (index!39128 (_ BitVec 32))) (Intermediate!9189 (undefined!10001 Bool) (index!39129 (_ BitVec 32)) (x!82908 (_ BitVec 32))) (Undefined!9189) (MissingVacant!9189 (index!39130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58836 (_ BitVec 32)) SeekEntryResult!9189)

(assert (=> b!960886 (= res!643191 (= (seekEntryOrOpen!0 (select (arr!28290 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9189 #b00000000000000000000000000000000)))))

(assert (=> b!960886 (=> (not res!643191) (not e!541710))))

(declare-fun b!960887 () Bool)

(declare-fun e!541711 () Bool)

(assert (=> b!960887 (= e!541711 e!541712)))

(declare-fun c!99846 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960887 (= c!99846 (validKeyInArray!0 (select (arr!28290 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun bm!41694 () Bool)

(declare-fun call!41697 () Bool)

(assert (=> bm!41694 (= call!41697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!960888 () Bool)

(assert (=> b!960888 (= e!541712 call!41697)))

(declare-fun d!115833 () Bool)

(declare-fun res!643190 () Bool)

(assert (=> d!115833 (=> res!643190 e!541711)))

(assert (=> d!115833 (= res!643190 (bvsge #b00000000000000000000000000000000 (size!28771 _keys!1686)))))

(assert (=> d!115833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541711)))

(declare-fun b!960885 () Bool)

(assert (=> b!960885 (= e!541710 call!41697)))

(assert (= (and d!115833 (not res!643190)) b!960887))

(assert (= (and b!960887 c!99846) b!960886))

(assert (= (and b!960887 (not c!99846)) b!960888))

(assert (= (and b!960886 res!643191) b!960885))

(assert (= (or b!960885 b!960888) bm!41694))

(declare-fun m!890431 () Bool)

(assert (=> b!960886 m!890431))

(declare-fun m!890433 () Bool)

(assert (=> b!960886 m!890433))

(declare-fun m!890435 () Bool)

(assert (=> b!960886 m!890435))

(assert (=> b!960886 m!890431))

(declare-fun m!890437 () Bool)

(assert (=> b!960886 m!890437))

(assert (=> b!960887 m!890431))

(assert (=> b!960887 m!890431))

(declare-fun m!890439 () Bool)

(assert (=> b!960887 m!890439))

(declare-fun m!890441 () Bool)

(assert (=> bm!41694 m!890441))

(assert (=> b!960838 d!115833))

(declare-fun d!115835 () Bool)

(assert (=> d!115835 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82420 d!115835))

(declare-fun d!115837 () Bool)

(assert (=> d!115837 (= (array_inv!21975 _values!1400) (bvsge (size!28770 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82420 d!115837))

(declare-fun d!115839 () Bool)

(assert (=> d!115839 (= (array_inv!21976 _keys!1686) (bvsge (size!28771 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82420 d!115839))

(declare-fun mapNonEmpty!34099 () Bool)

(declare-fun mapRes!34099 () Bool)

(declare-fun tp!65029 () Bool)

(declare-fun e!541717 () Bool)

(assert (=> mapNonEmpty!34099 (= mapRes!34099 (and tp!65029 e!541717))))

(declare-fun mapRest!34099 () (Array (_ BitVec 32) ValueCell!10220))

(declare-fun mapKey!34099 () (_ BitVec 32))

(declare-fun mapValue!34099 () ValueCell!10220)

(assert (=> mapNonEmpty!34099 (= mapRest!34090 (store mapRest!34099 mapKey!34099 mapValue!34099))))

(declare-fun b!960896 () Bool)

(declare-fun e!541718 () Bool)

(assert (=> b!960896 (= e!541718 tp_is_empty!21403)))

(declare-fun b!960895 () Bool)

(assert (=> b!960895 (= e!541717 tp_is_empty!21403)))

(declare-fun condMapEmpty!34099 () Bool)

(declare-fun mapDefault!34099 () ValueCell!10220)

(assert (=> mapNonEmpty!34090 (= condMapEmpty!34099 (= mapRest!34090 ((as const (Array (_ BitVec 32) ValueCell!10220)) mapDefault!34099)))))

(assert (=> mapNonEmpty!34090 (= tp!65020 (and e!541718 mapRes!34099))))

(declare-fun mapIsEmpty!34099 () Bool)

(assert (=> mapIsEmpty!34099 mapRes!34099))

(assert (= (and mapNonEmpty!34090 condMapEmpty!34099) mapIsEmpty!34099))

(assert (= (and mapNonEmpty!34090 (not condMapEmpty!34099)) mapNonEmpty!34099))

(assert (= (and mapNonEmpty!34099 ((_ is ValueCellFull!10220) mapValue!34099)) b!960895))

(assert (= (and mapNonEmpty!34090 ((_ is ValueCellFull!10220) mapDefault!34099)) b!960896))

(declare-fun m!890443 () Bool)

(assert (=> mapNonEmpty!34099 m!890443))

(check-sat (not mapNonEmpty!34099) (not bm!41694) (not b!960886) tp_is_empty!21403 (not b!960887))
(check-sat)
