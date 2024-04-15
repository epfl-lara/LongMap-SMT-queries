; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82434 () Bool)

(assert start!82434)

(declare-fun b!960911 () Bool)

(declare-fun res!643201 () Bool)

(declare-fun e!541732 () Bool)

(assert (=> b!960911 (=> (not res!643201) (not e!541732))))

(declare-datatypes ((array!58846 0))(
  ( (array!58847 (arr!28294 (Array (_ BitVec 32) (_ BitVec 64))) (size!28775 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58846)

(assert (=> b!960911 (= res!643201 (and (bvsle #b00000000000000000000000000000000 (size!28775 _keys!1686)) (bvslt (size!28775 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!960912 () Bool)

(declare-fun e!541729 () Bool)

(declare-fun e!541730 () Bool)

(declare-fun mapRes!34102 () Bool)

(assert (=> b!960912 (= e!541729 (and e!541730 mapRes!34102))))

(declare-fun condMapEmpty!34102 () Bool)

(declare-datatypes ((V!33529 0))(
  ( (V!33530 (val!10755 Int)) )
))
(declare-datatypes ((ValueCell!10223 0))(
  ( (ValueCellFull!10223 (v!13311 V!33529)) (EmptyCell!10223) )
))
(declare-datatypes ((array!58848 0))(
  ( (array!58849 (arr!28295 (Array (_ BitVec 32) ValueCell!10223)) (size!28776 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58848)

(declare-fun mapDefault!34102 () ValueCell!10223)

(assert (=> b!960912 (= condMapEmpty!34102 (= (arr!28295 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10223)) mapDefault!34102)))))

(declare-fun b!960913 () Bool)

(declare-datatypes ((List!19695 0))(
  ( (Nil!19692) (Cons!19691 (h!20853 (_ BitVec 64)) (t!28049 List!19695)) )
))
(declare-fun noDuplicate!1375 (List!19695) Bool)

(assert (=> b!960913 (= e!541732 (not (noDuplicate!1375 Nil!19692)))))

(declare-fun b!960914 () Bool)

(declare-fun res!643202 () Bool)

(assert (=> b!960914 (=> (not res!643202) (not e!541732))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58846 (_ BitVec 32)) Bool)

(assert (=> b!960914 (= res!643202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!643203 () Bool)

(assert (=> start!82434 (=> (not res!643203) (not e!541732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82434 (= res!643203 (validMask!0 mask!2110))))

(assert (=> start!82434 e!541732))

(assert (=> start!82434 true))

(declare-fun array_inv!21979 (array!58848) Bool)

(assert (=> start!82434 (and (array_inv!21979 _values!1400) e!541729)))

(declare-fun array_inv!21980 (array!58846) Bool)

(assert (=> start!82434 (array_inv!21980 _keys!1686)))

(declare-fun mapIsEmpty!34102 () Bool)

(assert (=> mapIsEmpty!34102 mapRes!34102))

(declare-fun b!960915 () Bool)

(declare-fun res!643200 () Bool)

(assert (=> b!960915 (=> (not res!643200) (not e!541732))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!960915 (= res!643200 (and (= (size!28776 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28775 _keys!1686) (size!28776 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!960916 () Bool)

(declare-fun e!541731 () Bool)

(declare-fun tp_is_empty!21409 () Bool)

(assert (=> b!960916 (= e!541731 tp_is_empty!21409)))

(declare-fun b!960917 () Bool)

(assert (=> b!960917 (= e!541730 tp_is_empty!21409)))

(declare-fun mapNonEmpty!34102 () Bool)

(declare-fun tp!65032 () Bool)

(assert (=> mapNonEmpty!34102 (= mapRes!34102 (and tp!65032 e!541731))))

(declare-fun mapValue!34102 () ValueCell!10223)

(declare-fun mapKey!34102 () (_ BitVec 32))

(declare-fun mapRest!34102 () (Array (_ BitVec 32) ValueCell!10223))

(assert (=> mapNonEmpty!34102 (= (arr!28295 _values!1400) (store mapRest!34102 mapKey!34102 mapValue!34102))))

(assert (= (and start!82434 res!643203) b!960915))

(assert (= (and b!960915 res!643200) b!960914))

(assert (= (and b!960914 res!643202) b!960911))

(assert (= (and b!960911 res!643201) b!960913))

(assert (= (and b!960912 condMapEmpty!34102) mapIsEmpty!34102))

(assert (= (and b!960912 (not condMapEmpty!34102)) mapNonEmpty!34102))

(get-info :version)

(assert (= (and mapNonEmpty!34102 ((_ is ValueCellFull!10223) mapValue!34102)) b!960916))

(assert (= (and b!960912 ((_ is ValueCellFull!10223) mapDefault!34102)) b!960917))

(assert (= start!82434 b!960912))

(declare-fun m!890445 () Bool)

(assert (=> b!960913 m!890445))

(declare-fun m!890447 () Bool)

(assert (=> b!960914 m!890447))

(declare-fun m!890449 () Bool)

(assert (=> start!82434 m!890449))

(declare-fun m!890451 () Bool)

(assert (=> start!82434 m!890451))

(declare-fun m!890453 () Bool)

(assert (=> start!82434 m!890453))

(declare-fun m!890455 () Bool)

(assert (=> mapNonEmpty!34102 m!890455))

(check-sat (not start!82434) (not b!960913) tp_is_empty!21409 (not mapNonEmpty!34102) (not b!960914))
(check-sat)
(get-model)

(declare-fun d!115843 () Bool)

(declare-fun res!643232 () Bool)

(declare-fun e!541768 () Bool)

(assert (=> d!115843 (=> res!643232 e!541768)))

(assert (=> d!115843 (= res!643232 ((_ is Nil!19692) Nil!19692))))

(assert (=> d!115843 (= (noDuplicate!1375 Nil!19692) e!541768)))

(declare-fun b!960964 () Bool)

(declare-fun e!541769 () Bool)

(assert (=> b!960964 (= e!541768 e!541769)))

(declare-fun res!643233 () Bool)

(assert (=> b!960964 (=> (not res!643233) (not e!541769))))

(declare-fun contains!5358 (List!19695 (_ BitVec 64)) Bool)

(assert (=> b!960964 (= res!643233 (not (contains!5358 (t!28049 Nil!19692) (h!20853 Nil!19692))))))

(declare-fun b!960965 () Bool)

(assert (=> b!960965 (= e!541769 (noDuplicate!1375 (t!28049 Nil!19692)))))

(assert (= (and d!115843 (not res!643232)) b!960964))

(assert (= (and b!960964 res!643233) b!960965))

(declare-fun m!890481 () Bool)

(assert (=> b!960964 m!890481))

(declare-fun m!890483 () Bool)

(assert (=> b!960965 m!890483))

(assert (=> b!960913 d!115843))

(declare-fun b!960974 () Bool)

(declare-fun e!541776 () Bool)

(declare-fun e!541778 () Bool)

(assert (=> b!960974 (= e!541776 e!541778)))

(declare-fun lt!430487 () (_ BitVec 64))

(assert (=> b!960974 (= lt!430487 (select (arr!28294 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32066 0))(
  ( (Unit!32067) )
))
(declare-fun lt!430489 () Unit!32066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58846 (_ BitVec 64) (_ BitVec 32)) Unit!32066)

(assert (=> b!960974 (= lt!430489 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430487 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!960974 (arrayContainsKey!0 _keys!1686 lt!430487 #b00000000000000000000000000000000)))

(declare-fun lt!430488 () Unit!32066)

(assert (=> b!960974 (= lt!430488 lt!430489)))

(declare-fun res!643238 () Bool)

(declare-datatypes ((SeekEntryResult!9190 0))(
  ( (MissingZero!9190 (index!39131 (_ BitVec 32))) (Found!9190 (index!39132 (_ BitVec 32))) (Intermediate!9190 (undefined!10002 Bool) (index!39133 (_ BitVec 32)) (x!82919 (_ BitVec 32))) (Undefined!9190) (MissingVacant!9190 (index!39134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58846 (_ BitVec 32)) SeekEntryResult!9190)

(assert (=> b!960974 (= res!643238 (= (seekEntryOrOpen!0 (select (arr!28294 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9190 #b00000000000000000000000000000000)))))

(assert (=> b!960974 (=> (not res!643238) (not e!541778))))

(declare-fun b!960975 () Bool)

(declare-fun call!41700 () Bool)

(assert (=> b!960975 (= e!541776 call!41700)))

(declare-fun d!115845 () Bool)

(declare-fun res!643239 () Bool)

(declare-fun e!541777 () Bool)

(assert (=> d!115845 (=> res!643239 e!541777)))

(assert (=> d!115845 (= res!643239 (bvsge #b00000000000000000000000000000000 (size!28775 _keys!1686)))))

(assert (=> d!115845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541777)))

(declare-fun b!960976 () Bool)

(assert (=> b!960976 (= e!541778 call!41700)))

(declare-fun bm!41697 () Bool)

(assert (=> bm!41697 (= call!41700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!960977 () Bool)

(assert (=> b!960977 (= e!541777 e!541776)))

(declare-fun c!99849 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960977 (= c!99849 (validKeyInArray!0 (select (arr!28294 _keys!1686) #b00000000000000000000000000000000)))))

(assert (= (and d!115845 (not res!643239)) b!960977))

(assert (= (and b!960977 c!99849) b!960974))

(assert (= (and b!960977 (not c!99849)) b!960975))

(assert (= (and b!960974 res!643238) b!960976))

(assert (= (or b!960976 b!960975) bm!41697))

(declare-fun m!890485 () Bool)

(assert (=> b!960974 m!890485))

(declare-fun m!890487 () Bool)

(assert (=> b!960974 m!890487))

(declare-fun m!890489 () Bool)

(assert (=> b!960974 m!890489))

(assert (=> b!960974 m!890485))

(declare-fun m!890491 () Bool)

(assert (=> b!960974 m!890491))

(declare-fun m!890493 () Bool)

(assert (=> bm!41697 m!890493))

(assert (=> b!960977 m!890485))

(assert (=> b!960977 m!890485))

(declare-fun m!890495 () Bool)

(assert (=> b!960977 m!890495))

(assert (=> b!960914 d!115845))

(declare-fun d!115847 () Bool)

(assert (=> d!115847 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82434 d!115847))

(declare-fun d!115849 () Bool)

(assert (=> d!115849 (= (array_inv!21979 _values!1400) (bvsge (size!28776 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82434 d!115849))

(declare-fun d!115851 () Bool)

(assert (=> d!115851 (= (array_inv!21980 _keys!1686) (bvsge (size!28775 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82434 d!115851))

(declare-fun b!960984 () Bool)

(declare-fun e!541784 () Bool)

(assert (=> b!960984 (= e!541784 tp_is_empty!21409)))

(declare-fun mapIsEmpty!34111 () Bool)

(declare-fun mapRes!34111 () Bool)

(assert (=> mapIsEmpty!34111 mapRes!34111))

(declare-fun b!960985 () Bool)

(declare-fun e!541783 () Bool)

(assert (=> b!960985 (= e!541783 tp_is_empty!21409)))

(declare-fun condMapEmpty!34111 () Bool)

(declare-fun mapDefault!34111 () ValueCell!10223)

(assert (=> mapNonEmpty!34102 (= condMapEmpty!34111 (= mapRest!34102 ((as const (Array (_ BitVec 32) ValueCell!10223)) mapDefault!34111)))))

(assert (=> mapNonEmpty!34102 (= tp!65032 (and e!541783 mapRes!34111))))

(declare-fun mapNonEmpty!34111 () Bool)

(declare-fun tp!65041 () Bool)

(assert (=> mapNonEmpty!34111 (= mapRes!34111 (and tp!65041 e!541784))))

(declare-fun mapRest!34111 () (Array (_ BitVec 32) ValueCell!10223))

(declare-fun mapValue!34111 () ValueCell!10223)

(declare-fun mapKey!34111 () (_ BitVec 32))

(assert (=> mapNonEmpty!34111 (= mapRest!34102 (store mapRest!34111 mapKey!34111 mapValue!34111))))

(assert (= (and mapNonEmpty!34102 condMapEmpty!34111) mapIsEmpty!34111))

(assert (= (and mapNonEmpty!34102 (not condMapEmpty!34111)) mapNonEmpty!34111))

(assert (= (and mapNonEmpty!34111 ((_ is ValueCellFull!10223) mapValue!34111)) b!960984))

(assert (= (and mapNonEmpty!34102 ((_ is ValueCellFull!10223) mapDefault!34111)) b!960985))

(declare-fun m!890497 () Bool)

(assert (=> mapNonEmpty!34111 m!890497))

(check-sat (not b!960974) (not b!960977) (not b!960964) (not mapNonEmpty!34111) (not bm!41697) tp_is_empty!21409 (not b!960965))
(check-sat)
