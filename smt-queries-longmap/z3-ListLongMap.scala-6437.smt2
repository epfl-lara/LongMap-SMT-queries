; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82406 () Bool)

(assert start!82406)

(declare-fun mapIsEmpty!34078 () Bool)

(declare-fun mapRes!34078 () Bool)

(assert (=> mapIsEmpty!34078 mapRes!34078))

(declare-fun b!960761 () Bool)

(declare-fun e!541609 () Bool)

(declare-datatypes ((array!58820 0))(
  ( (array!58821 (arr!28283 (Array (_ BitVec 32) (_ BitVec 64))) (size!28764 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58820)

(assert (=> b!960761 (= e!541609 (bvsgt #b00000000000000000000000000000000 (size!28764 _keys!1686)))))

(declare-fun b!960762 () Bool)

(declare-fun e!541611 () Bool)

(declare-fun e!541610 () Bool)

(assert (=> b!960762 (= e!541611 (and e!541610 mapRes!34078))))

(declare-fun condMapEmpty!34078 () Bool)

(declare-datatypes ((V!33513 0))(
  ( (V!33514 (val!10749 Int)) )
))
(declare-datatypes ((ValueCell!10217 0))(
  ( (ValueCellFull!10217 (v!13305 V!33513)) (EmptyCell!10217) )
))
(declare-datatypes ((array!58822 0))(
  ( (array!58823 (arr!28284 (Array (_ BitVec 32) ValueCell!10217)) (size!28765 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58822)

(declare-fun mapDefault!34078 () ValueCell!10217)

(assert (=> b!960762 (= condMapEmpty!34078 (= (arr!28284 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10217)) mapDefault!34078)))))

(declare-fun b!960763 () Bool)

(declare-fun e!541612 () Bool)

(declare-fun tp_is_empty!21397 () Bool)

(assert (=> b!960763 (= e!541612 tp_is_empty!21397)))

(declare-fun res!643132 () Bool)

(assert (=> start!82406 (=> (not res!643132) (not e!541609))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82406 (= res!643132 (validMask!0 mask!2110))))

(assert (=> start!82406 e!541609))

(assert (=> start!82406 true))

(declare-fun array_inv!21969 (array!58822) Bool)

(assert (=> start!82406 (and (array_inv!21969 _values!1400) e!541611)))

(declare-fun array_inv!21970 (array!58820) Bool)

(assert (=> start!82406 (array_inv!21970 _keys!1686)))

(declare-fun b!960764 () Bool)

(declare-fun res!643133 () Bool)

(assert (=> b!960764 (=> (not res!643133) (not e!541609))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!960764 (= res!643133 (and (= (size!28765 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28764 _keys!1686) (size!28765 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!960765 () Bool)

(declare-fun res!643134 () Bool)

(assert (=> b!960765 (=> (not res!643134) (not e!541609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58820 (_ BitVec 32)) Bool)

(assert (=> b!960765 (= res!643134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34078 () Bool)

(declare-fun tp!65008 () Bool)

(assert (=> mapNonEmpty!34078 (= mapRes!34078 (and tp!65008 e!541612))))

(declare-fun mapValue!34078 () ValueCell!10217)

(declare-fun mapKey!34078 () (_ BitVec 32))

(declare-fun mapRest!34078 () (Array (_ BitVec 32) ValueCell!10217))

(assert (=> mapNonEmpty!34078 (= (arr!28284 _values!1400) (store mapRest!34078 mapKey!34078 mapValue!34078))))

(declare-fun b!960766 () Bool)

(assert (=> b!960766 (= e!541610 tp_is_empty!21397)))

(assert (= (and start!82406 res!643132) b!960764))

(assert (= (and b!960764 res!643133) b!960765))

(assert (= (and b!960765 res!643134) b!960761))

(assert (= (and b!960762 condMapEmpty!34078) mapIsEmpty!34078))

(assert (= (and b!960762 (not condMapEmpty!34078)) mapNonEmpty!34078))

(get-info :version)

(assert (= (and mapNonEmpty!34078 ((_ is ValueCellFull!10217) mapValue!34078)) b!960763))

(assert (= (and b!960762 ((_ is ValueCellFull!10217) mapDefault!34078)) b!960766))

(assert (= start!82406 b!960762))

(declare-fun m!890357 () Bool)

(assert (=> start!82406 m!890357))

(declare-fun m!890359 () Bool)

(assert (=> start!82406 m!890359))

(declare-fun m!890361 () Bool)

(assert (=> start!82406 m!890361))

(declare-fun m!890363 () Bool)

(assert (=> b!960765 m!890363))

(declare-fun m!890365 () Bool)

(assert (=> mapNonEmpty!34078 m!890365))

(check-sat (not start!82406) (not b!960765) (not mapNonEmpty!34078) tp_is_empty!21397)
(check-sat)
(get-model)

(declare-fun d!115823 () Bool)

(assert (=> d!115823 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82406 d!115823))

(declare-fun d!115825 () Bool)

(assert (=> d!115825 (= (array_inv!21969 _values!1400) (bvsge (size!28765 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82406 d!115825))

(declare-fun d!115827 () Bool)

(assert (=> d!115827 (= (array_inv!21970 _keys!1686) (bvsge (size!28764 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82406 d!115827))

(declare-fun bm!41691 () Bool)

(declare-fun call!41694 () Bool)

(assert (=> bm!41691 (= call!41694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun d!115829 () Bool)

(declare-fun res!643158 () Bool)

(declare-fun e!541652 () Bool)

(assert (=> d!115829 (=> res!643158 e!541652)))

(assert (=> d!115829 (= res!643158 (bvsge #b00000000000000000000000000000000 (size!28764 _keys!1686)))))

(assert (=> d!115829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541652)))

(declare-fun b!960811 () Bool)

(declare-fun e!541650 () Bool)

(assert (=> b!960811 (= e!541652 e!541650)))

(declare-fun c!99843 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960811 (= c!99843 (validKeyInArray!0 (select (arr!28283 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!960812 () Bool)

(assert (=> b!960812 (= e!541650 call!41694)))

(declare-fun b!960813 () Bool)

(declare-fun e!541651 () Bool)

(assert (=> b!960813 (= e!541650 e!541651)))

(declare-fun lt!430470 () (_ BitVec 64))

(assert (=> b!960813 (= lt!430470 (select (arr!28283 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32062 0))(
  ( (Unit!32063) )
))
(declare-fun lt!430471 () Unit!32062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58820 (_ BitVec 64) (_ BitVec 32)) Unit!32062)

(assert (=> b!960813 (= lt!430471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430470 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!960813 (arrayContainsKey!0 _keys!1686 lt!430470 #b00000000000000000000000000000000)))

(declare-fun lt!430469 () Unit!32062)

(assert (=> b!960813 (= lt!430469 lt!430471)))

(declare-fun res!643157 () Bool)

(declare-datatypes ((SeekEntryResult!9188 0))(
  ( (MissingZero!9188 (index!39123 (_ BitVec 32))) (Found!9188 (index!39124 (_ BitVec 32))) (Intermediate!9188 (undefined!10000 Bool) (index!39125 (_ BitVec 32)) (x!82897 (_ BitVec 32))) (Undefined!9188) (MissingVacant!9188 (index!39126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58820 (_ BitVec 32)) SeekEntryResult!9188)

(assert (=> b!960813 (= res!643157 (= (seekEntryOrOpen!0 (select (arr!28283 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9188 #b00000000000000000000000000000000)))))

(assert (=> b!960813 (=> (not res!643157) (not e!541651))))

(declare-fun b!960814 () Bool)

(assert (=> b!960814 (= e!541651 call!41694)))

(assert (= (and d!115829 (not res!643158)) b!960811))

(assert (= (and b!960811 c!99843) b!960813))

(assert (= (and b!960811 (not c!99843)) b!960812))

(assert (= (and b!960813 res!643157) b!960814))

(assert (= (or b!960814 b!960812) bm!41691))

(declare-fun m!890387 () Bool)

(assert (=> bm!41691 m!890387))

(declare-fun m!890389 () Bool)

(assert (=> b!960811 m!890389))

(assert (=> b!960811 m!890389))

(declare-fun m!890391 () Bool)

(assert (=> b!960811 m!890391))

(assert (=> b!960813 m!890389))

(declare-fun m!890393 () Bool)

(assert (=> b!960813 m!890393))

(declare-fun m!890395 () Bool)

(assert (=> b!960813 m!890395))

(assert (=> b!960813 m!890389))

(declare-fun m!890397 () Bool)

(assert (=> b!960813 m!890397))

(assert (=> b!960765 d!115829))

(declare-fun mapIsEmpty!34087 () Bool)

(declare-fun mapRes!34087 () Bool)

(assert (=> mapIsEmpty!34087 mapRes!34087))

(declare-fun b!960822 () Bool)

(declare-fun e!541658 () Bool)

(assert (=> b!960822 (= e!541658 tp_is_empty!21397)))

(declare-fun mapNonEmpty!34087 () Bool)

(declare-fun tp!65017 () Bool)

(declare-fun e!541657 () Bool)

(assert (=> mapNonEmpty!34087 (= mapRes!34087 (and tp!65017 e!541657))))

(declare-fun mapValue!34087 () ValueCell!10217)

(declare-fun mapKey!34087 () (_ BitVec 32))

(declare-fun mapRest!34087 () (Array (_ BitVec 32) ValueCell!10217))

(assert (=> mapNonEmpty!34087 (= mapRest!34078 (store mapRest!34087 mapKey!34087 mapValue!34087))))

(declare-fun condMapEmpty!34087 () Bool)

(declare-fun mapDefault!34087 () ValueCell!10217)

(assert (=> mapNonEmpty!34078 (= condMapEmpty!34087 (= mapRest!34078 ((as const (Array (_ BitVec 32) ValueCell!10217)) mapDefault!34087)))))

(assert (=> mapNonEmpty!34078 (= tp!65008 (and e!541658 mapRes!34087))))

(declare-fun b!960821 () Bool)

(assert (=> b!960821 (= e!541657 tp_is_empty!21397)))

(assert (= (and mapNonEmpty!34078 condMapEmpty!34087) mapIsEmpty!34087))

(assert (= (and mapNonEmpty!34078 (not condMapEmpty!34087)) mapNonEmpty!34087))

(assert (= (and mapNonEmpty!34087 ((_ is ValueCellFull!10217) mapValue!34087)) b!960821))

(assert (= (and mapNonEmpty!34078 ((_ is ValueCellFull!10217) mapDefault!34087)) b!960822))

(declare-fun m!890399 () Bool)

(assert (=> mapNonEmpty!34087 m!890399))

(check-sat tp_is_empty!21397 (not b!960813) (not b!960811) (not bm!41691) (not mapNonEmpty!34087))
(check-sat)
