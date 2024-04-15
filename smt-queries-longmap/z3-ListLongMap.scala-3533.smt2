; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48756 () Bool)

(assert start!48756)

(declare-fun b!536185 () Bool)

(declare-fun res!331535 () Bool)

(declare-fun e!311248 () Bool)

(assert (=> b!536185 (=> (not res!331535) (not e!311248))))

(declare-datatypes ((SeekEntryResult!4783 0))(
  ( (MissingZero!4783 (index!21356 (_ BitVec 32))) (Found!4783 (index!21357 (_ BitVec 32))) (Intermediate!4783 (undefined!5595 Bool) (index!21358 (_ BitVec 32)) (x!50305 (_ BitVec 32))) (Undefined!4783) (MissingVacant!4783 (index!21359 (_ BitVec 32))) )
))
(declare-fun lt!245869 () SeekEntryResult!4783)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33978 0))(
  ( (array!33979 (arr!16328 (Array (_ BitVec 32) (_ BitVec 64))) (size!16693 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33978 (_ BitVec 32)) SeekEntryResult!4783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536185 (= res!331535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16328 a!3154) j!147) mask!3216) (select (arr!16328 a!3154) j!147) a!3154 mask!3216) lt!245869))))

(declare-fun b!536186 () Bool)

(declare-fun res!331544 () Bool)

(declare-fun e!311250 () Bool)

(assert (=> b!536186 (=> (not res!331544) (not e!311250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536186 (= res!331544 (validKeyInArray!0 (select (arr!16328 a!3154) j!147)))))

(declare-fun b!536187 () Bool)

(declare-fun res!331533 () Bool)

(assert (=> b!536187 (=> (not res!331533) (not e!311248))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536187 (= res!331533 (and (not (= (select (arr!16328 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16328 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16328 a!3154) index!1177) (select (arr!16328 a!3154) j!147)))))))

(declare-fun res!331537 () Bool)

(assert (=> start!48756 (=> (not res!331537) (not e!311250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48756 (= res!331537 (validMask!0 mask!3216))))

(assert (=> start!48756 e!311250))

(assert (=> start!48756 true))

(declare-fun array_inv!12211 (array!33978) Bool)

(assert (=> start!48756 (array_inv!12211 a!3154)))

(declare-fun b!536188 () Bool)

(declare-fun res!331538 () Bool)

(assert (=> b!536188 (=> (not res!331538) (not e!311250))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!536188 (= res!331538 (validKeyInArray!0 k0!1998))))

(declare-fun b!536189 () Bool)

(declare-fun res!331536 () Bool)

(declare-fun e!311246 () Bool)

(assert (=> b!536189 (=> (not res!331536) (not e!311246))))

(declare-datatypes ((List!10486 0))(
  ( (Nil!10483) (Cons!10482 (h!11425 (_ BitVec 64)) (t!16705 List!10486)) )
))
(declare-fun arrayNoDuplicates!0 (array!33978 (_ BitVec 32) List!10486) Bool)

(assert (=> b!536189 (= res!331536 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10483))))

(declare-fun b!536190 () Bool)

(declare-fun res!331534 () Bool)

(assert (=> b!536190 (=> (not res!331534) (not e!311246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33978 (_ BitVec 32)) Bool)

(assert (=> b!536190 (= res!331534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536191 () Bool)

(assert (=> b!536191 (= e!311246 e!311248)))

(declare-fun res!331543 () Bool)

(assert (=> b!536191 (=> (not res!331543) (not e!311248))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536191 (= res!331543 (= lt!245869 (Intermediate!4783 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!536191 (= lt!245869 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16328 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536192 () Bool)

(declare-fun res!331541 () Bool)

(assert (=> b!536192 (=> (not res!331541) (not e!311250))))

(declare-fun arrayContainsKey!0 (array!33978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536192 (= res!331541 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536193 () Bool)

(declare-fun res!331540 () Bool)

(assert (=> b!536193 (=> (not res!331540) (not e!311246))))

(assert (=> b!536193 (= res!331540 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16693 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16693 a!3154)) (= (select (arr!16328 a!3154) resIndex!32) (select (arr!16328 a!3154) j!147))))))

(declare-fun b!536194 () Bool)

(assert (=> b!536194 (= e!311250 e!311246)))

(declare-fun res!331542 () Bool)

(assert (=> b!536194 (=> (not res!331542) (not e!311246))))

(declare-fun lt!245866 () SeekEntryResult!4783)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536194 (= res!331542 (or (= lt!245866 (MissingZero!4783 i!1153)) (= lt!245866 (MissingVacant!4783 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33978 (_ BitVec 32)) SeekEntryResult!4783)

(assert (=> b!536194 (= lt!245866 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536195 () Bool)

(declare-fun res!331539 () Bool)

(assert (=> b!536195 (=> (not res!331539) (not e!311250))))

(assert (=> b!536195 (= res!331539 (and (= (size!16693 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16693 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16693 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536196 () Bool)

(declare-fun e!311247 () Bool)

(assert (=> b!536196 (= e!311247 false)))

(declare-fun lt!245868 () SeekEntryResult!4783)

(declare-fun lt!245867 () (_ BitVec 32))

(assert (=> b!536196 (= lt!245868 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245867 (select (arr!16328 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536197 () Bool)

(assert (=> b!536197 (= e!311248 e!311247)))

(declare-fun res!331532 () Bool)

(assert (=> b!536197 (=> (not res!331532) (not e!311247))))

(assert (=> b!536197 (= res!331532 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245867 #b00000000000000000000000000000000) (bvslt lt!245867 (size!16693 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536197 (= lt!245867 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!48756 res!331537) b!536195))

(assert (= (and b!536195 res!331539) b!536186))

(assert (= (and b!536186 res!331544) b!536188))

(assert (= (and b!536188 res!331538) b!536192))

(assert (= (and b!536192 res!331541) b!536194))

(assert (= (and b!536194 res!331542) b!536190))

(assert (= (and b!536190 res!331534) b!536189))

(assert (= (and b!536189 res!331536) b!536193))

(assert (= (and b!536193 res!331540) b!536191))

(assert (= (and b!536191 res!331543) b!536185))

(assert (= (and b!536185 res!331535) b!536187))

(assert (= (and b!536187 res!331533) b!536197))

(assert (= (and b!536197 res!331532) b!536196))

(declare-fun m!515113 () Bool)

(assert (=> b!536196 m!515113))

(assert (=> b!536196 m!515113))

(declare-fun m!515115 () Bool)

(assert (=> b!536196 m!515115))

(assert (=> b!536185 m!515113))

(assert (=> b!536185 m!515113))

(declare-fun m!515117 () Bool)

(assert (=> b!536185 m!515117))

(assert (=> b!536185 m!515117))

(assert (=> b!536185 m!515113))

(declare-fun m!515119 () Bool)

(assert (=> b!536185 m!515119))

(declare-fun m!515121 () Bool)

(assert (=> b!536187 m!515121))

(assert (=> b!536187 m!515113))

(assert (=> b!536191 m!515113))

(assert (=> b!536191 m!515113))

(declare-fun m!515123 () Bool)

(assert (=> b!536191 m!515123))

(declare-fun m!515125 () Bool)

(assert (=> b!536192 m!515125))

(declare-fun m!515127 () Bool)

(assert (=> b!536190 m!515127))

(assert (=> b!536186 m!515113))

(assert (=> b!536186 m!515113))

(declare-fun m!515129 () Bool)

(assert (=> b!536186 m!515129))

(declare-fun m!515131 () Bool)

(assert (=> b!536189 m!515131))

(declare-fun m!515133 () Bool)

(assert (=> b!536193 m!515133))

(assert (=> b!536193 m!515113))

(declare-fun m!515135 () Bool)

(assert (=> b!536197 m!515135))

(declare-fun m!515137 () Bool)

(assert (=> b!536194 m!515137))

(declare-fun m!515139 () Bool)

(assert (=> start!48756 m!515139))

(declare-fun m!515141 () Bool)

(assert (=> start!48756 m!515141))

(declare-fun m!515143 () Bool)

(assert (=> b!536188 m!515143))

(check-sat (not b!536196) (not b!536197) (not b!536185) (not b!536186) (not b!536190) (not b!536191) (not b!536188) (not b!536194) (not b!536189) (not b!536192) (not start!48756))
(check-sat)
