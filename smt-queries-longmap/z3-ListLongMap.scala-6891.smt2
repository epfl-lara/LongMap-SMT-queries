; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86592 () Bool)

(assert start!86592)

(declare-fun b!1004131 () Bool)

(declare-fun e!565437 () Bool)

(declare-fun e!565439 () Bool)

(assert (=> b!1004131 (= e!565437 e!565439)))

(declare-fun res!673741 () Bool)

(assert (=> b!1004131 (=> (not res!673741) (not e!565439))))

(declare-datatypes ((SeekEntryResult!9452 0))(
  ( (MissingZero!9452 (index!40179 (_ BitVec 32))) (Found!9452 (index!40180 (_ BitVec 32))) (Intermediate!9452 (undefined!10264 Bool) (index!40181 (_ BitVec 32)) (x!87595 (_ BitVec 32))) (Undefined!9452) (MissingVacant!9452 (index!40182 (_ BitVec 32))) )
))
(declare-fun lt!443905 () SeekEntryResult!9452)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004131 (= res!673741 (or (= lt!443905 (MissingVacant!9452 i!1194)) (= lt!443905 (MissingZero!9452 i!1194))))))

(declare-datatypes ((array!63340 0))(
  ( (array!63341 (arr!30495 (Array (_ BitVec 32) (_ BitVec 64))) (size!30999 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63340)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63340 (_ BitVec 32)) SeekEntryResult!9452)

(assert (=> b!1004131 (= lt!443905 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!673748 () Bool)

(assert (=> start!86592 (=> (not res!673748) (not e!565437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86592 (= res!673748 (validMask!0 mask!3464))))

(assert (=> start!86592 e!565437))

(declare-fun array_inv!23638 (array!63340) Bool)

(assert (=> start!86592 (array_inv!23638 a!3219)))

(assert (=> start!86592 true))

(declare-fun b!1004132 () Bool)

(declare-fun e!565438 () Bool)

(declare-fun e!565441 () Bool)

(assert (=> b!1004132 (= e!565438 e!565441)))

(declare-fun res!673746 () Bool)

(assert (=> b!1004132 (=> (not res!673746) (not e!565441))))

(declare-fun lt!443901 () SeekEntryResult!9452)

(declare-fun lt!443903 () (_ BitVec 64))

(declare-fun lt!443898 () array!63340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63340 (_ BitVec 32)) SeekEntryResult!9452)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004132 (= res!673746 (not (= lt!443901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443903 mask!3464) lt!443903 lt!443898 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1004132 (= lt!443903 (select (store (arr!30495 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004132 (= lt!443898 (array!63341 (store (arr!30495 a!3219) i!1194 k0!2224) (size!30999 a!3219)))))

(declare-fun b!1004133 () Bool)

(declare-fun res!673740 () Bool)

(assert (=> b!1004133 (=> (not res!673740) (not e!565437))))

(declare-fun arrayContainsKey!0 (array!63340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004133 (= res!673740 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004134 () Bool)

(declare-fun e!565436 () Bool)

(assert (=> b!1004134 (= e!565436 false)))

(declare-fun lt!443899 () SeekEntryResult!9452)

(declare-fun lt!443900 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1004134 (= lt!443899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443900 lt!443903 lt!443898 mask!3464))))

(declare-fun b!1004135 () Bool)

(declare-fun res!673742 () Bool)

(assert (=> b!1004135 (=> (not res!673742) (not e!565439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63340 (_ BitVec 32)) Bool)

(assert (=> b!1004135 (= res!673742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004136 () Bool)

(declare-fun res!673743 () Bool)

(assert (=> b!1004136 (=> (not res!673743) (not e!565437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004136 (= res!673743 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004137 () Bool)

(declare-fun res!673735 () Bool)

(assert (=> b!1004137 (=> (not res!673735) (not e!565441))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1004137 (= res!673735 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004138 () Bool)

(declare-fun res!673739 () Bool)

(assert (=> b!1004138 (=> (not res!673739) (not e!565439))))

(declare-datatypes ((List!21237 0))(
  ( (Nil!21234) (Cons!21233 (h!22410 (_ BitVec 64)) (t!30229 List!21237)) )
))
(declare-fun arrayNoDuplicates!0 (array!63340 (_ BitVec 32) List!21237) Bool)

(assert (=> b!1004138 (= res!673739 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21234))))

(declare-fun b!1004139 () Bool)

(declare-fun e!565440 () Bool)

(assert (=> b!1004139 (= e!565439 e!565440)))

(declare-fun res!673733 () Bool)

(assert (=> b!1004139 (=> (not res!673733) (not e!565440))))

(declare-fun lt!443902 () SeekEntryResult!9452)

(assert (=> b!1004139 (= res!673733 (= lt!443901 lt!443902))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004139 (= lt!443902 (Intermediate!9452 false resIndex!38 resX!38))))

(assert (=> b!1004139 (= lt!443901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30495 a!3219) j!170) mask!3464) (select (arr!30495 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004140 () Bool)

(declare-fun res!673745 () Bool)

(assert (=> b!1004140 (=> (not res!673745) (not e!565437))))

(assert (=> b!1004140 (= res!673745 (validKeyInArray!0 (select (arr!30495 a!3219) j!170)))))

(declare-fun b!1004141 () Bool)

(declare-fun res!673737 () Bool)

(assert (=> b!1004141 (=> (not res!673737) (not e!565441))))

(declare-fun lt!443904 () SeekEntryResult!9452)

(assert (=> b!1004141 (= res!673737 (not (= lt!443904 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443903 lt!443898 mask!3464))))))

(declare-fun b!1004142 () Bool)

(assert (=> b!1004142 (= e!565440 e!565438)))

(declare-fun res!673734 () Bool)

(assert (=> b!1004142 (=> (not res!673734) (not e!565438))))

(assert (=> b!1004142 (= res!673734 (= lt!443904 lt!443902))))

(assert (=> b!1004142 (= lt!443904 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30495 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004143 () Bool)

(declare-fun res!673744 () Bool)

(assert (=> b!1004143 (=> (not res!673744) (not e!565436))))

(assert (=> b!1004143 (= res!673744 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443900 (select (arr!30495 a!3219) j!170) a!3219 mask!3464) lt!443902))))

(declare-fun b!1004144 () Bool)

(assert (=> b!1004144 (= e!565441 e!565436)))

(declare-fun res!673738 () Bool)

(assert (=> b!1004144 (=> (not res!673738) (not e!565436))))

(assert (=> b!1004144 (= res!673738 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443900 #b00000000000000000000000000000000) (bvslt lt!443900 (size!30999 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004144 (= lt!443900 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004145 () Bool)

(declare-fun res!673736 () Bool)

(assert (=> b!1004145 (=> (not res!673736) (not e!565439))))

(assert (=> b!1004145 (= res!673736 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30999 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30999 a!3219))))))

(declare-fun b!1004146 () Bool)

(declare-fun res!673747 () Bool)

(assert (=> b!1004146 (=> (not res!673747) (not e!565437))))

(assert (=> b!1004146 (= res!673747 (and (= (size!30999 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30999 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30999 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86592 res!673748) b!1004146))

(assert (= (and b!1004146 res!673747) b!1004140))

(assert (= (and b!1004140 res!673745) b!1004136))

(assert (= (and b!1004136 res!673743) b!1004133))

(assert (= (and b!1004133 res!673740) b!1004131))

(assert (= (and b!1004131 res!673741) b!1004135))

(assert (= (and b!1004135 res!673742) b!1004138))

(assert (= (and b!1004138 res!673739) b!1004145))

(assert (= (and b!1004145 res!673736) b!1004139))

(assert (= (and b!1004139 res!673733) b!1004142))

(assert (= (and b!1004142 res!673734) b!1004132))

(assert (= (and b!1004132 res!673746) b!1004141))

(assert (= (and b!1004141 res!673737) b!1004137))

(assert (= (and b!1004137 res!673735) b!1004144))

(assert (= (and b!1004144 res!673738) b!1004143))

(assert (= (and b!1004143 res!673744) b!1004134))

(declare-fun m!929179 () Bool)

(assert (=> b!1004133 m!929179))

(declare-fun m!929181 () Bool)

(assert (=> b!1004144 m!929181))

(declare-fun m!929183 () Bool)

(assert (=> b!1004141 m!929183))

(declare-fun m!929185 () Bool)

(assert (=> b!1004139 m!929185))

(assert (=> b!1004139 m!929185))

(declare-fun m!929187 () Bool)

(assert (=> b!1004139 m!929187))

(assert (=> b!1004139 m!929187))

(assert (=> b!1004139 m!929185))

(declare-fun m!929189 () Bool)

(assert (=> b!1004139 m!929189))

(declare-fun m!929191 () Bool)

(assert (=> b!1004136 m!929191))

(declare-fun m!929193 () Bool)

(assert (=> start!86592 m!929193))

(declare-fun m!929195 () Bool)

(assert (=> start!86592 m!929195))

(declare-fun m!929197 () Bool)

(assert (=> b!1004131 m!929197))

(declare-fun m!929199 () Bool)

(assert (=> b!1004132 m!929199))

(assert (=> b!1004132 m!929199))

(declare-fun m!929201 () Bool)

(assert (=> b!1004132 m!929201))

(declare-fun m!929203 () Bool)

(assert (=> b!1004132 m!929203))

(declare-fun m!929205 () Bool)

(assert (=> b!1004132 m!929205))

(declare-fun m!929207 () Bool)

(assert (=> b!1004135 m!929207))

(assert (=> b!1004140 m!929185))

(assert (=> b!1004140 m!929185))

(declare-fun m!929209 () Bool)

(assert (=> b!1004140 m!929209))

(assert (=> b!1004142 m!929185))

(assert (=> b!1004142 m!929185))

(declare-fun m!929211 () Bool)

(assert (=> b!1004142 m!929211))

(declare-fun m!929213 () Bool)

(assert (=> b!1004134 m!929213))

(declare-fun m!929215 () Bool)

(assert (=> b!1004138 m!929215))

(assert (=> b!1004143 m!929185))

(assert (=> b!1004143 m!929185))

(declare-fun m!929217 () Bool)

(assert (=> b!1004143 m!929217))

(check-sat (not b!1004134) (not b!1004140) (not b!1004135) (not b!1004131) (not b!1004132) (not b!1004136) (not b!1004141) (not b!1004142) (not start!86592) (not b!1004138) (not b!1004143) (not b!1004144) (not b!1004133) (not b!1004139))
(check-sat)
