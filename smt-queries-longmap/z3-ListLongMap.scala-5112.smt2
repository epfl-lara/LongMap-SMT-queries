; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69500 () Bool)

(assert start!69500)

(declare-fun b!809576 () Bool)

(declare-fun e!448237 () Bool)

(declare-fun e!448235 () Bool)

(assert (=> b!809576 (= e!448237 e!448235)))

(declare-fun res!552958 () Bool)

(assert (=> b!809576 (=> (not res!552958) (not e!448235))))

(declare-datatypes ((SeekEntryResult!8608 0))(
  ( (MissingZero!8608 (index!36800 (_ BitVec 32))) (Found!8608 (index!36801 (_ BitVec 32))) (Intermediate!8608 (undefined!9420 Bool) (index!36802 (_ BitVec 32)) (x!67768 (_ BitVec 32))) (Undefined!8608) (MissingVacant!8608 (index!36803 (_ BitVec 32))) )
))
(declare-fun lt!362731 () SeekEntryResult!8608)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809576 (= res!552958 (or (= lt!362731 (MissingZero!8608 i!1163)) (= lt!362731 (MissingVacant!8608 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43981 0))(
  ( (array!43982 (arr!21061 (Array (_ BitVec 32) (_ BitVec 64))) (size!21481 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43981)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8608)

(assert (=> b!809576 (= lt!362731 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809577 () Bool)

(declare-fun res!552955 () Bool)

(assert (=> b!809577 (=> (not res!552955) (not e!448235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43981 (_ BitVec 32)) Bool)

(assert (=> b!809577 (= res!552955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809578 () Bool)

(declare-fun res!552962 () Bool)

(assert (=> b!809578 (=> (not res!552962) (not e!448235))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809578 (= res!552962 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21481 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21061 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21481 a!3170)) (= (select (arr!21061 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809579 () Bool)

(declare-fun res!552957 () Bool)

(assert (=> b!809579 (=> (not res!552957) (not e!448237))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809579 (= res!552957 (validKeyInArray!0 (select (arr!21061 a!3170) j!153)))))

(declare-fun res!552954 () Bool)

(assert (=> start!69500 (=> (not res!552954) (not e!448237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69500 (= res!552954 (validMask!0 mask!3266))))

(assert (=> start!69500 e!448237))

(assert (=> start!69500 true))

(declare-fun array_inv!16920 (array!43981) Bool)

(assert (=> start!69500 (array_inv!16920 a!3170)))

(declare-fun b!809580 () Bool)

(declare-fun e!448236 () Bool)

(assert (=> b!809580 (= e!448235 e!448236)))

(declare-fun res!552953 () Bool)

(assert (=> b!809580 (=> (not res!552953) (not e!448236))))

(declare-fun lt!362732 () (_ BitVec 64))

(declare-fun lt!362730 () array!43981)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8608)

(assert (=> b!809580 (= res!552953 (= (seekEntryOrOpen!0 lt!362732 lt!362730 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362732 lt!362730 mask!3266)))))

(assert (=> b!809580 (= lt!362732 (select (store (arr!21061 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809580 (= lt!362730 (array!43982 (store (arr!21061 a!3170) i!1163 k0!2044) (size!21481 a!3170)))))

(declare-fun b!809581 () Bool)

(declare-fun res!552960 () Bool)

(assert (=> b!809581 (=> (not res!552960) (not e!448237))))

(assert (=> b!809581 (= res!552960 (validKeyInArray!0 k0!2044))))

(declare-fun b!809582 () Bool)

(declare-fun res!552961 () Bool)

(assert (=> b!809582 (=> (not res!552961) (not e!448235))))

(declare-datatypes ((List!14931 0))(
  ( (Nil!14928) (Cons!14927 (h!16062 (_ BitVec 64)) (t!21238 List!14931)) )
))
(declare-fun arrayNoDuplicates!0 (array!43981 (_ BitVec 32) List!14931) Bool)

(assert (=> b!809582 (= res!552961 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14928))))

(declare-fun b!809583 () Bool)

(declare-fun res!552956 () Bool)

(assert (=> b!809583 (=> (not res!552956) (not e!448237))))

(declare-fun arrayContainsKey!0 (array!43981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809583 (= res!552956 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!362735 () (_ BitVec 32))

(declare-fun e!448233 () Bool)

(declare-fun b!809584 () Bool)

(assert (=> b!809584 (= e!448233 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (or (bvslt lt!362735 #b00000000000000000000000000000000) (bvsge lt!362735 (size!21481 a!3170)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809584 (= lt!362735 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!809585 () Bool)

(declare-fun res!552959 () Bool)

(assert (=> b!809585 (=> (not res!552959) (not e!448237))))

(assert (=> b!809585 (= res!552959 (and (= (size!21481 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21481 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21481 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809586 () Bool)

(assert (=> b!809586 (= e!448236 e!448233)))

(declare-fun res!552963 () Bool)

(assert (=> b!809586 (=> (not res!552963) (not e!448233))))

(declare-fun lt!362734 () SeekEntryResult!8608)

(declare-fun lt!362733 () SeekEntryResult!8608)

(assert (=> b!809586 (= res!552963 (and (= lt!362734 lt!362733) (= lt!362733 (Found!8608 j!153)) (not (= (select (arr!21061 a!3170) index!1236) (select (arr!21061 a!3170) j!153)))))))

(assert (=> b!809586 (= lt!362733 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809586 (= lt!362734 (seekEntryOrOpen!0 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69500 res!552954) b!809585))

(assert (= (and b!809585 res!552959) b!809579))

(assert (= (and b!809579 res!552957) b!809581))

(assert (= (and b!809581 res!552960) b!809583))

(assert (= (and b!809583 res!552956) b!809576))

(assert (= (and b!809576 res!552958) b!809577))

(assert (= (and b!809577 res!552955) b!809582))

(assert (= (and b!809582 res!552961) b!809578))

(assert (= (and b!809578 res!552962) b!809580))

(assert (= (and b!809580 res!552953) b!809586))

(assert (= (and b!809586 res!552963) b!809584))

(declare-fun m!752101 () Bool)

(assert (=> b!809582 m!752101))

(declare-fun m!752103 () Bool)

(assert (=> b!809584 m!752103))

(declare-fun m!752105 () Bool)

(assert (=> b!809578 m!752105))

(declare-fun m!752107 () Bool)

(assert (=> b!809578 m!752107))

(declare-fun m!752109 () Bool)

(assert (=> b!809583 m!752109))

(declare-fun m!752111 () Bool)

(assert (=> b!809576 m!752111))

(declare-fun m!752113 () Bool)

(assert (=> b!809580 m!752113))

(declare-fun m!752115 () Bool)

(assert (=> b!809580 m!752115))

(declare-fun m!752117 () Bool)

(assert (=> b!809580 m!752117))

(declare-fun m!752119 () Bool)

(assert (=> b!809580 m!752119))

(declare-fun m!752121 () Bool)

(assert (=> b!809586 m!752121))

(declare-fun m!752123 () Bool)

(assert (=> b!809586 m!752123))

(assert (=> b!809586 m!752123))

(declare-fun m!752125 () Bool)

(assert (=> b!809586 m!752125))

(assert (=> b!809586 m!752123))

(declare-fun m!752127 () Bool)

(assert (=> b!809586 m!752127))

(assert (=> b!809579 m!752123))

(assert (=> b!809579 m!752123))

(declare-fun m!752129 () Bool)

(assert (=> b!809579 m!752129))

(declare-fun m!752131 () Bool)

(assert (=> b!809581 m!752131))

(declare-fun m!752133 () Bool)

(assert (=> start!69500 m!752133))

(declare-fun m!752135 () Bool)

(assert (=> start!69500 m!752135))

(declare-fun m!752137 () Bool)

(assert (=> b!809577 m!752137))

(check-sat (not b!809582) (not b!809586) (not b!809583) (not b!809580) (not b!809576) (not start!69500) (not b!809581) (not b!809584) (not b!809577) (not b!809579))
(check-sat)
(get-model)

(declare-fun d!104145 () Bool)

(declare-fun res!553034 () Bool)

(declare-fun e!448272 () Bool)

(assert (=> d!104145 (=> res!553034 e!448272)))

(assert (=> d!104145 (= res!553034 (= (select (arr!21061 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104145 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448272)))

(declare-fun b!809657 () Bool)

(declare-fun e!448273 () Bool)

(assert (=> b!809657 (= e!448272 e!448273)))

(declare-fun res!553035 () Bool)

(assert (=> b!809657 (=> (not res!553035) (not e!448273))))

(assert (=> b!809657 (= res!553035 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21481 a!3170)))))

(declare-fun b!809658 () Bool)

(assert (=> b!809658 (= e!448273 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104145 (not res!553034)) b!809657))

(assert (= (and b!809657 res!553035) b!809658))

(declare-fun m!752215 () Bool)

(assert (=> d!104145 m!752215))

(declare-fun m!752217 () Bool)

(assert (=> b!809658 m!752217))

(assert (=> b!809583 d!104145))

(declare-fun d!104147 () Bool)

(assert (=> d!104147 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69500 d!104147))

(declare-fun d!104149 () Bool)

(assert (=> d!104149 (= (array_inv!16920 a!3170) (bvsge (size!21481 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69500 d!104149))

(declare-fun b!809667 () Bool)

(declare-fun e!448281 () Bool)

(declare-fun e!448282 () Bool)

(assert (=> b!809667 (= e!448281 e!448282)))

(declare-fun c!88727 () Bool)

(assert (=> b!809667 (= c!88727 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35445 () Bool)

(declare-fun call!35448 () Bool)

(assert (=> bm!35445 (= call!35448 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!104151 () Bool)

(declare-fun res!553041 () Bool)

(assert (=> d!104151 (=> res!553041 e!448281)))

(assert (=> d!104151 (= res!553041 (bvsge #b00000000000000000000000000000000 (size!21481 a!3170)))))

(assert (=> d!104151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448281)))

(declare-fun b!809668 () Bool)

(declare-fun e!448280 () Bool)

(assert (=> b!809668 (= e!448280 call!35448)))

(declare-fun b!809669 () Bool)

(assert (=> b!809669 (= e!448282 e!448280)))

(declare-fun lt!362780 () (_ BitVec 64))

(assert (=> b!809669 (= lt!362780 (select (arr!21061 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27603 0))(
  ( (Unit!27604) )
))
(declare-fun lt!362779 () Unit!27603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43981 (_ BitVec 64) (_ BitVec 32)) Unit!27603)

(assert (=> b!809669 (= lt!362779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362780 #b00000000000000000000000000000000))))

(assert (=> b!809669 (arrayContainsKey!0 a!3170 lt!362780 #b00000000000000000000000000000000)))

(declare-fun lt!362778 () Unit!27603)

(assert (=> b!809669 (= lt!362778 lt!362779)))

(declare-fun res!553040 () Bool)

(assert (=> b!809669 (= res!553040 (= (seekEntryOrOpen!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8608 #b00000000000000000000000000000000)))))

(assert (=> b!809669 (=> (not res!553040) (not e!448280))))

(declare-fun b!809670 () Bool)

(assert (=> b!809670 (= e!448282 call!35448)))

(assert (= (and d!104151 (not res!553041)) b!809667))

(assert (= (and b!809667 c!88727) b!809669))

(assert (= (and b!809667 (not c!88727)) b!809670))

(assert (= (and b!809669 res!553040) b!809668))

(assert (= (or b!809668 b!809670) bm!35445))

(assert (=> b!809667 m!752215))

(assert (=> b!809667 m!752215))

(declare-fun m!752219 () Bool)

(assert (=> b!809667 m!752219))

(declare-fun m!752221 () Bool)

(assert (=> bm!35445 m!752221))

(assert (=> b!809669 m!752215))

(declare-fun m!752223 () Bool)

(assert (=> b!809669 m!752223))

(declare-fun m!752225 () Bool)

(assert (=> b!809669 m!752225))

(assert (=> b!809669 m!752215))

(declare-fun m!752227 () Bool)

(assert (=> b!809669 m!752227))

(assert (=> b!809577 d!104151))

(declare-fun d!104153 () Bool)

(assert (=> d!104153 (= (validKeyInArray!0 (select (arr!21061 a!3170) j!153)) (and (not (= (select (arr!21061 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21061 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809579 d!104153))

(declare-fun d!104155 () Bool)

(declare-fun lt!362783 () (_ BitVec 32))

(assert (=> d!104155 (and (bvsge lt!362783 #b00000000000000000000000000000000) (bvslt lt!362783 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104155 (= lt!362783 (choose!52 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (=> d!104155 (validMask!0 mask!3266)))

(assert (=> d!104155 (= (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) lt!362783)))

(declare-fun bs!22418 () Bool)

(assert (= bs!22418 d!104155))

(declare-fun m!752229 () Bool)

(assert (=> bs!22418 m!752229))

(assert (=> bs!22418 m!752133))

(assert (=> b!809584 d!104155))

(declare-fun b!809698 () Bool)

(declare-fun e!448301 () SeekEntryResult!8608)

(assert (=> b!809698 (= e!448301 (MissingVacant!8608 vacantBefore!23))))

(declare-fun d!104157 () Bool)

(declare-fun lt!362791 () SeekEntryResult!8608)

(get-info :version)

(assert (=> d!104157 (and (or ((_ is Undefined!8608) lt!362791) (not ((_ is Found!8608) lt!362791)) (and (bvsge (index!36801 lt!362791) #b00000000000000000000000000000000) (bvslt (index!36801 lt!362791) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362791) ((_ is Found!8608) lt!362791) (not ((_ is MissingVacant!8608) lt!362791)) (not (= (index!36803 lt!362791) vacantBefore!23)) (and (bvsge (index!36803 lt!362791) #b00000000000000000000000000000000) (bvslt (index!36803 lt!362791) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362791) (ite ((_ is Found!8608) lt!362791) (= (select (arr!21061 a!3170) (index!36801 lt!362791)) (select (arr!21061 a!3170) j!153)) (and ((_ is MissingVacant!8608) lt!362791) (= (index!36803 lt!362791) vacantBefore!23) (= (select (arr!21061 a!3170) (index!36803 lt!362791)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448303 () SeekEntryResult!8608)

(assert (=> d!104157 (= lt!362791 e!448303)))

(declare-fun c!88738 () Bool)

(assert (=> d!104157 (= c!88738 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362792 () (_ BitVec 64))

(assert (=> d!104157 (= lt!362792 (select (arr!21061 a!3170) index!1236))))

(assert (=> d!104157 (validMask!0 mask!3266)))

(assert (=> d!104157 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266) lt!362791)))

(declare-fun b!809699 () Bool)

(declare-fun c!88739 () Bool)

(assert (=> b!809699 (= c!88739 (= lt!362792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448302 () SeekEntryResult!8608)

(assert (=> b!809699 (= e!448302 e!448301)))

(declare-fun b!809700 () Bool)

(assert (=> b!809700 (= e!448303 Undefined!8608)))

(declare-fun b!809701 () Bool)

(assert (=> b!809701 (= e!448303 e!448302)))

(declare-fun c!88737 () Bool)

(assert (=> b!809701 (= c!88737 (= lt!362792 (select (arr!21061 a!3170) j!153)))))

(declare-fun b!809702 () Bool)

(assert (=> b!809702 (= e!448302 (Found!8608 index!1236))))

(declare-fun b!809703 () Bool)

(assert (=> b!809703 (= e!448301 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!104157 c!88738) b!809700))

(assert (= (and d!104157 (not c!88738)) b!809701))

(assert (= (and b!809701 c!88737) b!809702))

(assert (= (and b!809701 (not c!88737)) b!809699))

(assert (= (and b!809699 c!88739) b!809698))

(assert (= (and b!809699 (not c!88739)) b!809703))

(declare-fun m!752241 () Bool)

(assert (=> d!104157 m!752241))

(declare-fun m!752243 () Bool)

(assert (=> d!104157 m!752243))

(assert (=> d!104157 m!752121))

(assert (=> d!104157 m!752133))

(declare-fun m!752245 () Bool)

(assert (=> b!809703 m!752245))

(assert (=> b!809703 m!752245))

(assert (=> b!809703 m!752123))

(declare-fun m!752247 () Bool)

(assert (=> b!809703 m!752247))

(assert (=> b!809586 d!104157))

(declare-fun b!809746 () Bool)

(declare-fun e!448332 () SeekEntryResult!8608)

(declare-fun lt!362818 () SeekEntryResult!8608)

(assert (=> b!809746 (= e!448332 (MissingZero!8608 (index!36802 lt!362818)))))

(declare-fun b!809748 () Bool)

(declare-fun e!448331 () SeekEntryResult!8608)

(assert (=> b!809748 (= e!448331 Undefined!8608)))

(declare-fun b!809749 () Bool)

(declare-fun c!88756 () Bool)

(declare-fun lt!362819 () (_ BitVec 64))

(assert (=> b!809749 (= c!88756 (= lt!362819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448333 () SeekEntryResult!8608)

(assert (=> b!809749 (= e!448333 e!448332)))

(declare-fun b!809750 () Bool)

(assert (=> b!809750 (= e!448332 (seekKeyOrZeroReturnVacant!0 (x!67768 lt!362818) (index!36802 lt!362818) (index!36802 lt!362818) (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809751 () Bool)

(assert (=> b!809751 (= e!448333 (Found!8608 (index!36802 lt!362818)))))

(declare-fun b!809747 () Bool)

(assert (=> b!809747 (= e!448331 e!448333)))

(assert (=> b!809747 (= lt!362819 (select (arr!21061 a!3170) (index!36802 lt!362818)))))

(declare-fun c!88755 () Bool)

(assert (=> b!809747 (= c!88755 (= lt!362819 (select (arr!21061 a!3170) j!153)))))

(declare-fun d!104169 () Bool)

(declare-fun lt!362817 () SeekEntryResult!8608)

(assert (=> d!104169 (and (or ((_ is Undefined!8608) lt!362817) (not ((_ is Found!8608) lt!362817)) (and (bvsge (index!36801 lt!362817) #b00000000000000000000000000000000) (bvslt (index!36801 lt!362817) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362817) ((_ is Found!8608) lt!362817) (not ((_ is MissingZero!8608) lt!362817)) (and (bvsge (index!36800 lt!362817) #b00000000000000000000000000000000) (bvslt (index!36800 lt!362817) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362817) ((_ is Found!8608) lt!362817) ((_ is MissingZero!8608) lt!362817) (not ((_ is MissingVacant!8608) lt!362817)) (and (bvsge (index!36803 lt!362817) #b00000000000000000000000000000000) (bvslt (index!36803 lt!362817) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362817) (ite ((_ is Found!8608) lt!362817) (= (select (arr!21061 a!3170) (index!36801 lt!362817)) (select (arr!21061 a!3170) j!153)) (ite ((_ is MissingZero!8608) lt!362817) (= (select (arr!21061 a!3170) (index!36800 lt!362817)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8608) lt!362817) (= (select (arr!21061 a!3170) (index!36803 lt!362817)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104169 (= lt!362817 e!448331)))

(declare-fun c!88757 () Bool)

(assert (=> d!104169 (= c!88757 (and ((_ is Intermediate!8608) lt!362818) (undefined!9420 lt!362818)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104169 (= lt!362818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21061 a!3170) j!153) mask!3266) (select (arr!21061 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104169 (validMask!0 mask!3266)))

(assert (=> d!104169 (= (seekEntryOrOpen!0 (select (arr!21061 a!3170) j!153) a!3170 mask!3266) lt!362817)))

(assert (= (and d!104169 c!88757) b!809748))

(assert (= (and d!104169 (not c!88757)) b!809747))

(assert (= (and b!809747 c!88755) b!809751))

(assert (= (and b!809747 (not c!88755)) b!809749))

(assert (= (and b!809749 c!88756) b!809746))

(assert (= (and b!809749 (not c!88756)) b!809750))

(assert (=> b!809750 m!752123))

(declare-fun m!752265 () Bool)

(assert (=> b!809750 m!752265))

(declare-fun m!752267 () Bool)

(assert (=> b!809747 m!752267))

(declare-fun m!752269 () Bool)

(assert (=> d!104169 m!752269))

(assert (=> d!104169 m!752123))

(declare-fun m!752271 () Bool)

(assert (=> d!104169 m!752271))

(declare-fun m!752273 () Bool)

(assert (=> d!104169 m!752273))

(declare-fun m!752275 () Bool)

(assert (=> d!104169 m!752275))

(assert (=> d!104169 m!752133))

(declare-fun m!752277 () Bool)

(assert (=> d!104169 m!752277))

(assert (=> d!104169 m!752123))

(assert (=> d!104169 m!752269))

(assert (=> b!809586 d!104169))

(declare-fun b!809752 () Bool)

(declare-fun e!448335 () SeekEntryResult!8608)

(declare-fun lt!362821 () SeekEntryResult!8608)

(assert (=> b!809752 (= e!448335 (MissingZero!8608 (index!36802 lt!362821)))))

(declare-fun b!809754 () Bool)

(declare-fun e!448334 () SeekEntryResult!8608)

(assert (=> b!809754 (= e!448334 Undefined!8608)))

(declare-fun b!809755 () Bool)

(declare-fun c!88759 () Bool)

(declare-fun lt!362822 () (_ BitVec 64))

(assert (=> b!809755 (= c!88759 (= lt!362822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448336 () SeekEntryResult!8608)

(assert (=> b!809755 (= e!448336 e!448335)))

(declare-fun b!809756 () Bool)

(assert (=> b!809756 (= e!448335 (seekKeyOrZeroReturnVacant!0 (x!67768 lt!362821) (index!36802 lt!362821) (index!36802 lt!362821) lt!362732 lt!362730 mask!3266))))

(declare-fun b!809757 () Bool)

(assert (=> b!809757 (= e!448336 (Found!8608 (index!36802 lt!362821)))))

(declare-fun b!809753 () Bool)

(assert (=> b!809753 (= e!448334 e!448336)))

(assert (=> b!809753 (= lt!362822 (select (arr!21061 lt!362730) (index!36802 lt!362821)))))

(declare-fun c!88758 () Bool)

(assert (=> b!809753 (= c!88758 (= lt!362822 lt!362732))))

(declare-fun d!104179 () Bool)

(declare-fun lt!362820 () SeekEntryResult!8608)

(assert (=> d!104179 (and (or ((_ is Undefined!8608) lt!362820) (not ((_ is Found!8608) lt!362820)) (and (bvsge (index!36801 lt!362820) #b00000000000000000000000000000000) (bvslt (index!36801 lt!362820) (size!21481 lt!362730)))) (or ((_ is Undefined!8608) lt!362820) ((_ is Found!8608) lt!362820) (not ((_ is MissingZero!8608) lt!362820)) (and (bvsge (index!36800 lt!362820) #b00000000000000000000000000000000) (bvslt (index!36800 lt!362820) (size!21481 lt!362730)))) (or ((_ is Undefined!8608) lt!362820) ((_ is Found!8608) lt!362820) ((_ is MissingZero!8608) lt!362820) (not ((_ is MissingVacant!8608) lt!362820)) (and (bvsge (index!36803 lt!362820) #b00000000000000000000000000000000) (bvslt (index!36803 lt!362820) (size!21481 lt!362730)))) (or ((_ is Undefined!8608) lt!362820) (ite ((_ is Found!8608) lt!362820) (= (select (arr!21061 lt!362730) (index!36801 lt!362820)) lt!362732) (ite ((_ is MissingZero!8608) lt!362820) (= (select (arr!21061 lt!362730) (index!36800 lt!362820)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8608) lt!362820) (= (select (arr!21061 lt!362730) (index!36803 lt!362820)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104179 (= lt!362820 e!448334)))

(declare-fun c!88760 () Bool)

(assert (=> d!104179 (= c!88760 (and ((_ is Intermediate!8608) lt!362821) (undefined!9420 lt!362821)))))

(assert (=> d!104179 (= lt!362821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362732 mask!3266) lt!362732 lt!362730 mask!3266))))

(assert (=> d!104179 (validMask!0 mask!3266)))

(assert (=> d!104179 (= (seekEntryOrOpen!0 lt!362732 lt!362730 mask!3266) lt!362820)))

(assert (= (and d!104179 c!88760) b!809754))

(assert (= (and d!104179 (not c!88760)) b!809753))

(assert (= (and b!809753 c!88758) b!809757))

(assert (= (and b!809753 (not c!88758)) b!809755))

(assert (= (and b!809755 c!88759) b!809752))

(assert (= (and b!809755 (not c!88759)) b!809756))

(declare-fun m!752279 () Bool)

(assert (=> b!809756 m!752279))

(declare-fun m!752281 () Bool)

(assert (=> b!809753 m!752281))

(declare-fun m!752283 () Bool)

(assert (=> d!104179 m!752283))

(declare-fun m!752285 () Bool)

(assert (=> d!104179 m!752285))

(declare-fun m!752287 () Bool)

(assert (=> d!104179 m!752287))

(declare-fun m!752289 () Bool)

(assert (=> d!104179 m!752289))

(assert (=> d!104179 m!752133))

(declare-fun m!752291 () Bool)

(assert (=> d!104179 m!752291))

(assert (=> d!104179 m!752283))

(assert (=> b!809580 d!104179))

(declare-fun b!809764 () Bool)

(declare-fun e!448340 () SeekEntryResult!8608)

(assert (=> b!809764 (= e!448340 (MissingVacant!8608 vacantAfter!23))))

(declare-fun d!104181 () Bool)

(declare-fun lt!362826 () SeekEntryResult!8608)

(assert (=> d!104181 (and (or ((_ is Undefined!8608) lt!362826) (not ((_ is Found!8608) lt!362826)) (and (bvsge (index!36801 lt!362826) #b00000000000000000000000000000000) (bvslt (index!36801 lt!362826) (size!21481 lt!362730)))) (or ((_ is Undefined!8608) lt!362826) ((_ is Found!8608) lt!362826) (not ((_ is MissingVacant!8608) lt!362826)) (not (= (index!36803 lt!362826) vacantAfter!23)) (and (bvsge (index!36803 lt!362826) #b00000000000000000000000000000000) (bvslt (index!36803 lt!362826) (size!21481 lt!362730)))) (or ((_ is Undefined!8608) lt!362826) (ite ((_ is Found!8608) lt!362826) (= (select (arr!21061 lt!362730) (index!36801 lt!362826)) lt!362732) (and ((_ is MissingVacant!8608) lt!362826) (= (index!36803 lt!362826) vacantAfter!23) (= (select (arr!21061 lt!362730) (index!36803 lt!362826)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448342 () SeekEntryResult!8608)

(assert (=> d!104181 (= lt!362826 e!448342)))

(declare-fun c!88765 () Bool)

(assert (=> d!104181 (= c!88765 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362827 () (_ BitVec 64))

(assert (=> d!104181 (= lt!362827 (select (arr!21061 lt!362730) index!1236))))

(assert (=> d!104181 (validMask!0 mask!3266)))

(assert (=> d!104181 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362732 lt!362730 mask!3266) lt!362826)))

(declare-fun b!809765 () Bool)

(declare-fun c!88766 () Bool)

(assert (=> b!809765 (= c!88766 (= lt!362827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448341 () SeekEntryResult!8608)

(assert (=> b!809765 (= e!448341 e!448340)))

(declare-fun b!809766 () Bool)

(assert (=> b!809766 (= e!448342 Undefined!8608)))

(declare-fun b!809767 () Bool)

(assert (=> b!809767 (= e!448342 e!448341)))

(declare-fun c!88764 () Bool)

(assert (=> b!809767 (= c!88764 (= lt!362827 lt!362732))))

(declare-fun b!809768 () Bool)

(assert (=> b!809768 (= e!448341 (Found!8608 index!1236))))

(declare-fun b!809769 () Bool)

(assert (=> b!809769 (= e!448340 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!362732 lt!362730 mask!3266))))

(assert (= (and d!104181 c!88765) b!809766))

(assert (= (and d!104181 (not c!88765)) b!809767))

(assert (= (and b!809767 c!88764) b!809768))

(assert (= (and b!809767 (not c!88764)) b!809765))

(assert (= (and b!809765 c!88766) b!809764))

(assert (= (and b!809765 (not c!88766)) b!809769))

(declare-fun m!752307 () Bool)

(assert (=> d!104181 m!752307))

(declare-fun m!752309 () Bool)

(assert (=> d!104181 m!752309))

(declare-fun m!752311 () Bool)

(assert (=> d!104181 m!752311))

(assert (=> d!104181 m!752133))

(assert (=> b!809769 m!752245))

(assert (=> b!809769 m!752245))

(declare-fun m!752313 () Bool)

(assert (=> b!809769 m!752313))

(assert (=> b!809580 d!104181))

(declare-fun d!104185 () Bool)

(declare-fun res!553069 () Bool)

(declare-fun e!448363 () Bool)

(assert (=> d!104185 (=> res!553069 e!448363)))

(assert (=> d!104185 (= res!553069 (bvsge #b00000000000000000000000000000000 (size!21481 a!3170)))))

(assert (=> d!104185 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14928) e!448363)))

(declare-fun b!809798 () Bool)

(declare-fun e!448361 () Bool)

(declare-fun contains!4107 (List!14931 (_ BitVec 64)) Bool)

(assert (=> b!809798 (= e!448361 (contains!4107 Nil!14928 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809799 () Bool)

(declare-fun e!448360 () Bool)

(declare-fun e!448362 () Bool)

(assert (=> b!809799 (= e!448360 e!448362)))

(declare-fun c!88778 () Bool)

(assert (=> b!809799 (= c!88778 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809800 () Bool)

(assert (=> b!809800 (= e!448363 e!448360)))

(declare-fun res!553071 () Bool)

(assert (=> b!809800 (=> (not res!553071) (not e!448360))))

(assert (=> b!809800 (= res!553071 (not e!448361))))

(declare-fun res!553070 () Bool)

(assert (=> b!809800 (=> (not res!553070) (not e!448361))))

(assert (=> b!809800 (= res!553070 (validKeyInArray!0 (select (arr!21061 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809801 () Bool)

(declare-fun call!35457 () Bool)

(assert (=> b!809801 (= e!448362 call!35457)))

(declare-fun bm!35454 () Bool)

(assert (=> bm!35454 (= call!35457 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88778 (Cons!14927 (select (arr!21061 a!3170) #b00000000000000000000000000000000) Nil!14928) Nil!14928)))))

(declare-fun b!809802 () Bool)

(assert (=> b!809802 (= e!448362 call!35457)))

(assert (= (and d!104185 (not res!553069)) b!809800))

(assert (= (and b!809800 res!553070) b!809798))

(assert (= (and b!809800 res!553071) b!809799))

(assert (= (and b!809799 c!88778) b!809801))

(assert (= (and b!809799 (not c!88778)) b!809802))

(assert (= (or b!809801 b!809802) bm!35454))

(assert (=> b!809798 m!752215))

(assert (=> b!809798 m!752215))

(declare-fun m!752329 () Bool)

(assert (=> b!809798 m!752329))

(assert (=> b!809799 m!752215))

(assert (=> b!809799 m!752215))

(assert (=> b!809799 m!752219))

(assert (=> b!809800 m!752215))

(assert (=> b!809800 m!752215))

(assert (=> b!809800 m!752219))

(assert (=> bm!35454 m!752215))

(declare-fun m!752331 () Bool)

(assert (=> bm!35454 m!752331))

(assert (=> b!809582 d!104185))

(declare-fun d!104189 () Bool)

(assert (=> d!104189 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809581 d!104189))

(declare-fun b!809803 () Bool)

(declare-fun e!448365 () SeekEntryResult!8608)

(declare-fun lt!362838 () SeekEntryResult!8608)

(assert (=> b!809803 (= e!448365 (MissingZero!8608 (index!36802 lt!362838)))))

(declare-fun b!809805 () Bool)

(declare-fun e!448364 () SeekEntryResult!8608)

(assert (=> b!809805 (= e!448364 Undefined!8608)))

(declare-fun b!809806 () Bool)

(declare-fun c!88780 () Bool)

(declare-fun lt!362839 () (_ BitVec 64))

(assert (=> b!809806 (= c!88780 (= lt!362839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448366 () SeekEntryResult!8608)

(assert (=> b!809806 (= e!448366 e!448365)))

(declare-fun b!809807 () Bool)

(assert (=> b!809807 (= e!448365 (seekKeyOrZeroReturnVacant!0 (x!67768 lt!362838) (index!36802 lt!362838) (index!36802 lt!362838) k0!2044 a!3170 mask!3266))))

(declare-fun b!809808 () Bool)

(assert (=> b!809808 (= e!448366 (Found!8608 (index!36802 lt!362838)))))

(declare-fun b!809804 () Bool)

(assert (=> b!809804 (= e!448364 e!448366)))

(assert (=> b!809804 (= lt!362839 (select (arr!21061 a!3170) (index!36802 lt!362838)))))

(declare-fun c!88779 () Bool)

(assert (=> b!809804 (= c!88779 (= lt!362839 k0!2044))))

(declare-fun d!104191 () Bool)

(declare-fun lt!362837 () SeekEntryResult!8608)

(assert (=> d!104191 (and (or ((_ is Undefined!8608) lt!362837) (not ((_ is Found!8608) lt!362837)) (and (bvsge (index!36801 lt!362837) #b00000000000000000000000000000000) (bvslt (index!36801 lt!362837) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362837) ((_ is Found!8608) lt!362837) (not ((_ is MissingZero!8608) lt!362837)) (and (bvsge (index!36800 lt!362837) #b00000000000000000000000000000000) (bvslt (index!36800 lt!362837) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362837) ((_ is Found!8608) lt!362837) ((_ is MissingZero!8608) lt!362837) (not ((_ is MissingVacant!8608) lt!362837)) (and (bvsge (index!36803 lt!362837) #b00000000000000000000000000000000) (bvslt (index!36803 lt!362837) (size!21481 a!3170)))) (or ((_ is Undefined!8608) lt!362837) (ite ((_ is Found!8608) lt!362837) (= (select (arr!21061 a!3170) (index!36801 lt!362837)) k0!2044) (ite ((_ is MissingZero!8608) lt!362837) (= (select (arr!21061 a!3170) (index!36800 lt!362837)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8608) lt!362837) (= (select (arr!21061 a!3170) (index!36803 lt!362837)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104191 (= lt!362837 e!448364)))

(declare-fun c!88781 () Bool)

(assert (=> d!104191 (= c!88781 (and ((_ is Intermediate!8608) lt!362838) (undefined!9420 lt!362838)))))

(assert (=> d!104191 (= lt!362838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104191 (validMask!0 mask!3266)))

(assert (=> d!104191 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362837)))

(assert (= (and d!104191 c!88781) b!809805))

(assert (= (and d!104191 (not c!88781)) b!809804))

(assert (= (and b!809804 c!88779) b!809808))

(assert (= (and b!809804 (not c!88779)) b!809806))

(assert (= (and b!809806 c!88780) b!809803))

(assert (= (and b!809806 (not c!88780)) b!809807))

(declare-fun m!752333 () Bool)

(assert (=> b!809807 m!752333))

(declare-fun m!752335 () Bool)

(assert (=> b!809804 m!752335))

(declare-fun m!752337 () Bool)

(assert (=> d!104191 m!752337))

(declare-fun m!752339 () Bool)

(assert (=> d!104191 m!752339))

(declare-fun m!752341 () Bool)

(assert (=> d!104191 m!752341))

(declare-fun m!752343 () Bool)

(assert (=> d!104191 m!752343))

(assert (=> d!104191 m!752133))

(declare-fun m!752345 () Bool)

(assert (=> d!104191 m!752345))

(assert (=> d!104191 m!752337))

(assert (=> b!809576 d!104191))

(check-sat (not bm!35454) (not b!809798) (not bm!35445) (not d!104169) (not d!104157) (not b!809669) (not d!104179) (not b!809807) (not b!809756) (not b!809769) (not b!809658) (not b!809667) (not d!104191) (not b!809800) (not b!809703) (not d!104181) (not d!104155) (not b!809750) (not b!809799))
(check-sat)
