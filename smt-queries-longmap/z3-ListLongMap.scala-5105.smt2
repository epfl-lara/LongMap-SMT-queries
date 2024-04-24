; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69404 () Bool)

(assert start!69404)

(declare-fun b!808622 () Bool)

(declare-fun res!552200 () Bool)

(declare-fun e!447760 () Bool)

(assert (=> b!808622 (=> (not res!552200) (not e!447760))))

(declare-datatypes ((array!43936 0))(
  ( (array!43937 (arr!21040 (Array (_ BitVec 32) (_ BitVec 64))) (size!21460 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43936)

(declare-datatypes ((List!14910 0))(
  ( (Nil!14907) (Cons!14906 (h!16041 (_ BitVec 64)) (t!21217 List!14910)) )
))
(declare-fun arrayNoDuplicates!0 (array!43936 (_ BitVec 32) List!14910) Bool)

(assert (=> b!808622 (= res!552200 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14907))))

(declare-fun b!808623 () Bool)

(declare-fun e!447757 () Bool)

(assert (=> b!808623 (= e!447757 false)))

(declare-fun lt!362247 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808623 (= lt!362247 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808624 () Bool)

(declare-fun res!552204 () Bool)

(assert (=> b!808624 (=> (not res!552204) (not e!447760))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808624 (= res!552204 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21460 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21040 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21460 a!3170)) (= (select (arr!21040 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808625 () Bool)

(declare-fun e!447759 () Bool)

(assert (=> b!808625 (= e!447759 e!447757)))

(declare-fun res!552206 () Bool)

(assert (=> b!808625 (=> (not res!552206) (not e!447757))))

(declare-datatypes ((SeekEntryResult!8587 0))(
  ( (MissingZero!8587 (index!36716 (_ BitVec 32))) (Found!8587 (index!36717 (_ BitVec 32))) (Intermediate!8587 (undefined!9399 Bool) (index!36718 (_ BitVec 32)) (x!67685 (_ BitVec 32))) (Undefined!8587) (MissingVacant!8587 (index!36719 (_ BitVec 32))) )
))
(declare-fun lt!362251 () SeekEntryResult!8587)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362252 () SeekEntryResult!8587)

(assert (=> b!808625 (= res!552206 (and (= lt!362251 lt!362252) (= lt!362252 (Found!8587 j!153)) (not (= (select (arr!21040 a!3170) index!1236) (select (arr!21040 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43936 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!808625 (= lt!362252 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21040 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43936 (_ BitVec 32)) SeekEntryResult!8587)

(assert (=> b!808625 (= lt!362251 (seekEntryOrOpen!0 (select (arr!21040 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808626 () Bool)

(declare-fun e!447758 () Bool)

(assert (=> b!808626 (= e!447758 e!447760)))

(declare-fun res!552205 () Bool)

(assert (=> b!808626 (=> (not res!552205) (not e!447760))))

(declare-fun lt!362250 () SeekEntryResult!8587)

(assert (=> b!808626 (= res!552205 (or (= lt!362250 (MissingZero!8587 i!1163)) (= lt!362250 (MissingVacant!8587 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!808626 (= lt!362250 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808627 () Bool)

(declare-fun res!552201 () Bool)

(assert (=> b!808627 (=> (not res!552201) (not e!447758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808627 (= res!552201 (validKeyInArray!0 (select (arr!21040 a!3170) j!153)))))

(declare-fun b!808628 () Bool)

(declare-fun res!552198 () Bool)

(assert (=> b!808628 (=> (not res!552198) (not e!447758))))

(assert (=> b!808628 (= res!552198 (validKeyInArray!0 k0!2044))))

(declare-fun b!808629 () Bool)

(assert (=> b!808629 (= e!447760 e!447759)))

(declare-fun res!552197 () Bool)

(assert (=> b!808629 (=> (not res!552197) (not e!447759))))

(declare-fun lt!362249 () (_ BitVec 64))

(declare-fun lt!362248 () array!43936)

(assert (=> b!808629 (= res!552197 (= (seekEntryOrOpen!0 lt!362249 lt!362248 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362249 lt!362248 mask!3266)))))

(assert (=> b!808629 (= lt!362249 (select (store (arr!21040 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808629 (= lt!362248 (array!43937 (store (arr!21040 a!3170) i!1163 k0!2044) (size!21460 a!3170)))))

(declare-fun res!552203 () Bool)

(assert (=> start!69404 (=> (not res!552203) (not e!447758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69404 (= res!552203 (validMask!0 mask!3266))))

(assert (=> start!69404 e!447758))

(assert (=> start!69404 true))

(declare-fun array_inv!16899 (array!43936) Bool)

(assert (=> start!69404 (array_inv!16899 a!3170)))

(declare-fun b!808630 () Bool)

(declare-fun res!552207 () Bool)

(assert (=> b!808630 (=> (not res!552207) (not e!447758))))

(assert (=> b!808630 (= res!552207 (and (= (size!21460 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21460 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21460 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808631 () Bool)

(declare-fun res!552202 () Bool)

(assert (=> b!808631 (=> (not res!552202) (not e!447758))))

(declare-fun arrayContainsKey!0 (array!43936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808631 (= res!552202 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808632 () Bool)

(declare-fun res!552199 () Bool)

(assert (=> b!808632 (=> (not res!552199) (not e!447760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43936 (_ BitVec 32)) Bool)

(assert (=> b!808632 (= res!552199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69404 res!552203) b!808630))

(assert (= (and b!808630 res!552207) b!808627))

(assert (= (and b!808627 res!552201) b!808628))

(assert (= (and b!808628 res!552198) b!808631))

(assert (= (and b!808631 res!552202) b!808626))

(assert (= (and b!808626 res!552205) b!808632))

(assert (= (and b!808632 res!552199) b!808622))

(assert (= (and b!808622 res!552200) b!808624))

(assert (= (and b!808624 res!552204) b!808629))

(assert (= (and b!808629 res!552197) b!808625))

(assert (= (and b!808625 res!552206) b!808623))

(declare-fun m!751069 () Bool)

(assert (=> b!808625 m!751069))

(declare-fun m!751071 () Bool)

(assert (=> b!808625 m!751071))

(assert (=> b!808625 m!751071))

(declare-fun m!751073 () Bool)

(assert (=> b!808625 m!751073))

(assert (=> b!808625 m!751071))

(declare-fun m!751075 () Bool)

(assert (=> b!808625 m!751075))

(assert (=> b!808627 m!751071))

(assert (=> b!808627 m!751071))

(declare-fun m!751077 () Bool)

(assert (=> b!808627 m!751077))

(declare-fun m!751079 () Bool)

(assert (=> b!808631 m!751079))

(declare-fun m!751081 () Bool)

(assert (=> start!69404 m!751081))

(declare-fun m!751083 () Bool)

(assert (=> start!69404 m!751083))

(declare-fun m!751085 () Bool)

(assert (=> b!808623 m!751085))

(declare-fun m!751087 () Bool)

(assert (=> b!808626 m!751087))

(declare-fun m!751089 () Bool)

(assert (=> b!808622 m!751089))

(declare-fun m!751091 () Bool)

(assert (=> b!808628 m!751091))

(declare-fun m!751093 () Bool)

(assert (=> b!808624 m!751093))

(declare-fun m!751095 () Bool)

(assert (=> b!808624 m!751095))

(declare-fun m!751097 () Bool)

(assert (=> b!808632 m!751097))

(declare-fun m!751099 () Bool)

(assert (=> b!808629 m!751099))

(declare-fun m!751101 () Bool)

(assert (=> b!808629 m!751101))

(declare-fun m!751103 () Bool)

(assert (=> b!808629 m!751103))

(declare-fun m!751105 () Bool)

(assert (=> b!808629 m!751105))

(check-sat (not b!808629) (not b!808623) (not b!808631) (not b!808627) (not b!808626) (not start!69404) (not b!808628) (not b!808622) (not b!808632) (not b!808625))
(check-sat)
