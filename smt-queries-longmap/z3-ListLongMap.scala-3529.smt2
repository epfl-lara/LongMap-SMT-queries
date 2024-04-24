; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48790 () Bool)

(assert start!48790)

(declare-fun b!536188 () Bool)

(declare-fun res!331293 () Bool)

(declare-fun e!311370 () Bool)

(assert (=> b!536188 (=> (not res!331293) (not e!311370))))

(declare-datatypes ((array!33950 0))(
  ( (array!33951 (arr!16312 (Array (_ BitVec 32) (_ BitVec 64))) (size!16676 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33950)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536188 (= res!331293 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536189 () Bool)

(declare-fun e!311373 () Bool)

(assert (=> b!536189 (= e!311373 false)))

(declare-fun lt!246064 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4726 0))(
  ( (MissingZero!4726 (index!21128 (_ BitVec 32))) (Found!4726 (index!21129 (_ BitVec 32))) (Intermediate!4726 (undefined!5538 Bool) (index!21130 (_ BitVec 32)) (x!50224 (_ BitVec 32))) (Undefined!4726) (MissingVacant!4726 (index!21131 (_ BitVec 32))) )
))
(declare-fun lt!246067 () SeekEntryResult!4726)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33950 (_ BitVec 32)) SeekEntryResult!4726)

(assert (=> b!536189 (= lt!246067 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246064 (select (arr!16312 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536190 () Bool)

(declare-fun res!331297 () Bool)

(assert (=> b!536190 (=> (not res!331297) (not e!311370))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536190 (= res!331297 (and (= (size!16676 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16676 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16676 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536192 () Bool)

(declare-fun res!331300 () Bool)

(declare-fun e!311372 () Bool)

(assert (=> b!536192 (=> (not res!331300) (not e!311372))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536192 (= res!331300 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16676 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16676 a!3154)) (= (select (arr!16312 a!3154) resIndex!32) (select (arr!16312 a!3154) j!147))))))

(declare-fun b!536193 () Bool)

(declare-fun e!311369 () Bool)

(assert (=> b!536193 (= e!311369 e!311373)))

(declare-fun res!331299 () Bool)

(assert (=> b!536193 (=> (not res!331299) (not e!311373))))

(assert (=> b!536193 (= res!331299 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246064 #b00000000000000000000000000000000) (bvslt lt!246064 (size!16676 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536193 (= lt!246064 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536194 () Bool)

(declare-fun res!331289 () Bool)

(assert (=> b!536194 (=> (not res!331289) (not e!311369))))

(assert (=> b!536194 (= res!331289 (and (not (= (select (arr!16312 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16312 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16312 a!3154) index!1177) (select (arr!16312 a!3154) j!147)))))))

(declare-fun b!536195 () Bool)

(declare-fun res!331294 () Bool)

(assert (=> b!536195 (=> (not res!331294) (not e!311372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33950 (_ BitVec 32)) Bool)

(assert (=> b!536195 (= res!331294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536196 () Bool)

(declare-fun res!331296 () Bool)

(assert (=> b!536196 (=> (not res!331296) (not e!311370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536196 (= res!331296 (validKeyInArray!0 (select (arr!16312 a!3154) j!147)))))

(declare-fun b!536197 () Bool)

(declare-fun res!331288 () Bool)

(assert (=> b!536197 (=> (not res!331288) (not e!311372))))

(declare-datatypes ((List!10338 0))(
  ( (Nil!10335) (Cons!10334 (h!11280 (_ BitVec 64)) (t!16558 List!10338)) )
))
(declare-fun arrayNoDuplicates!0 (array!33950 (_ BitVec 32) List!10338) Bool)

(assert (=> b!536197 (= res!331288 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10335))))

(declare-fun b!536198 () Bool)

(declare-fun res!331292 () Bool)

(assert (=> b!536198 (=> (not res!331292) (not e!311370))))

(assert (=> b!536198 (= res!331292 (validKeyInArray!0 k0!1998))))

(declare-fun b!536199 () Bool)

(declare-fun res!331290 () Bool)

(assert (=> b!536199 (=> (not res!331290) (not e!311369))))

(declare-fun lt!246066 () SeekEntryResult!4726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536199 (= res!331290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16312 a!3154) j!147) mask!3216) (select (arr!16312 a!3154) j!147) a!3154 mask!3216) lt!246066))))

(declare-fun b!536200 () Bool)

(assert (=> b!536200 (= e!311370 e!311372)))

(declare-fun res!331295 () Bool)

(assert (=> b!536200 (=> (not res!331295) (not e!311372))))

(declare-fun lt!246065 () SeekEntryResult!4726)

(assert (=> b!536200 (= res!331295 (or (= lt!246065 (MissingZero!4726 i!1153)) (= lt!246065 (MissingVacant!4726 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33950 (_ BitVec 32)) SeekEntryResult!4726)

(assert (=> b!536200 (= lt!246065 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536191 () Bool)

(assert (=> b!536191 (= e!311372 e!311369)))

(declare-fun res!331291 () Bool)

(assert (=> b!536191 (=> (not res!331291) (not e!311369))))

(assert (=> b!536191 (= res!331291 (= lt!246066 (Intermediate!4726 false resIndex!32 resX!32)))))

(assert (=> b!536191 (= lt!246066 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16312 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331298 () Bool)

(assert (=> start!48790 (=> (not res!331298) (not e!311370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48790 (= res!331298 (validMask!0 mask!3216))))

(assert (=> start!48790 e!311370))

(assert (=> start!48790 true))

(declare-fun array_inv!12171 (array!33950) Bool)

(assert (=> start!48790 (array_inv!12171 a!3154)))

(assert (= (and start!48790 res!331298) b!536190))

(assert (= (and b!536190 res!331297) b!536196))

(assert (= (and b!536196 res!331296) b!536198))

(assert (= (and b!536198 res!331292) b!536188))

(assert (= (and b!536188 res!331293) b!536200))

(assert (= (and b!536200 res!331295) b!536195))

(assert (= (and b!536195 res!331294) b!536197))

(assert (= (and b!536197 res!331288) b!536192))

(assert (= (and b!536192 res!331300) b!536191))

(assert (= (and b!536191 res!331291) b!536199))

(assert (= (and b!536199 res!331290) b!536194))

(assert (= (and b!536194 res!331289) b!536193))

(assert (= (and b!536193 res!331299) b!536189))

(declare-fun m!515803 () Bool)

(assert (=> b!536199 m!515803))

(assert (=> b!536199 m!515803))

(declare-fun m!515805 () Bool)

(assert (=> b!536199 m!515805))

(assert (=> b!536199 m!515805))

(assert (=> b!536199 m!515803))

(declare-fun m!515807 () Bool)

(assert (=> b!536199 m!515807))

(declare-fun m!515809 () Bool)

(assert (=> b!536188 m!515809))

(assert (=> b!536189 m!515803))

(assert (=> b!536189 m!515803))

(declare-fun m!515811 () Bool)

(assert (=> b!536189 m!515811))

(declare-fun m!515813 () Bool)

(assert (=> b!536193 m!515813))

(assert (=> b!536196 m!515803))

(assert (=> b!536196 m!515803))

(declare-fun m!515815 () Bool)

(assert (=> b!536196 m!515815))

(declare-fun m!515817 () Bool)

(assert (=> b!536194 m!515817))

(assert (=> b!536194 m!515803))

(declare-fun m!515819 () Bool)

(assert (=> b!536197 m!515819))

(declare-fun m!515821 () Bool)

(assert (=> b!536200 m!515821))

(declare-fun m!515823 () Bool)

(assert (=> b!536192 m!515823))

(assert (=> b!536192 m!515803))

(declare-fun m!515825 () Bool)

(assert (=> b!536195 m!515825))

(assert (=> b!536191 m!515803))

(assert (=> b!536191 m!515803))

(declare-fun m!515827 () Bool)

(assert (=> b!536191 m!515827))

(declare-fun m!515829 () Bool)

(assert (=> b!536198 m!515829))

(declare-fun m!515831 () Bool)

(assert (=> start!48790 m!515831))

(declare-fun m!515833 () Bool)

(assert (=> start!48790 m!515833))

(check-sat (not b!536191) (not b!536188) (not b!536197) (not b!536198) (not b!536200) (not b!536189) (not b!536195) (not b!536199) (not b!536193) (not b!536196) (not start!48790))
(check-sat)
