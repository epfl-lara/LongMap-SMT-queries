; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53004 () Bool)

(assert start!53004)

(declare-fun b!577168 () Bool)

(declare-fun e!332064 () Bool)

(declare-datatypes ((array!35982 0))(
  ( (array!35983 (arr!17269 (Array (_ BitVec 32) (_ BitVec 64))) (size!17633 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35982)

(assert (=> b!577168 (= e!332064 (and (bvslt #b00000000000000000000000000000000 (size!17633 a!2986)) (bvsge (size!17633 a!2986) #b01111111111111111111111111111111)))))

(declare-fun res!365095 () Bool)

(assert (=> start!53004 (=> (not res!365095) (not e!332064))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53004 (= res!365095 (validMask!0 mask!3053))))

(assert (=> start!53004 e!332064))

(assert (=> start!53004 true))

(declare-fun array_inv!13128 (array!35982) Bool)

(assert (=> start!53004 (array_inv!13128 a!2986)))

(declare-fun b!577166 () Bool)

(declare-fun res!365092 () Bool)

(assert (=> b!577166 (=> (not res!365092) (not e!332064))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577166 (= res!365092 (validKeyInArray!0 (select (arr!17269 a!2986) j!136)))))

(declare-fun b!577167 () Bool)

(declare-fun res!365094 () Bool)

(assert (=> b!577167 (=> (not res!365094) (not e!332064))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!577167 (= res!365094 (validKeyInArray!0 k0!1786))))

(declare-fun b!577165 () Bool)

(declare-fun res!365093 () Bool)

(assert (=> b!577165 (=> (not res!365093) (not e!332064))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577165 (= res!365093 (and (= (size!17633 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17633 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17633 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53004 res!365095) b!577165))

(assert (= (and b!577165 res!365093) b!577166))

(assert (= (and b!577166 res!365092) b!577167))

(assert (= (and b!577167 res!365094) b!577168))

(declare-fun m!556247 () Bool)

(assert (=> start!53004 m!556247))

(declare-fun m!556249 () Bool)

(assert (=> start!53004 m!556249))

(declare-fun m!556251 () Bool)

(assert (=> b!577166 m!556251))

(assert (=> b!577166 m!556251))

(declare-fun m!556253 () Bool)

(assert (=> b!577166 m!556253))

(declare-fun m!556255 () Bool)

(assert (=> b!577167 m!556255))

(check-sat (not start!53004) (not b!577166) (not b!577167))
(check-sat)
(get-model)

(declare-fun d!85613 () Bool)

(assert (=> d!85613 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53004 d!85613))

(declare-fun d!85619 () Bool)

(assert (=> d!85619 (= (array_inv!13128 a!2986) (bvsge (size!17633 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53004 d!85619))

(declare-fun d!85621 () Bool)

(assert (=> d!85621 (= (validKeyInArray!0 (select (arr!17269 a!2986) j!136)) (and (not (= (select (arr!17269 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17269 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577166 d!85621))

(declare-fun d!85623 () Bool)

(assert (=> d!85623 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577167 d!85623))

(check-sat)
