; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49304 () Bool)

(assert start!49304)

(declare-fun b!542970 () Bool)

(declare-fun e!314145 () Bool)

(declare-fun e!314142 () Bool)

(assert (=> b!542970 (= e!314145 e!314142)))

(declare-fun res!337522 () Bool)

(assert (=> b!542970 (=> (not res!337522) (not e!314142))))

(declare-datatypes ((SeekEntryResult!4947 0))(
  ( (MissingZero!4947 (index!22012 (_ BitVec 32))) (Found!4947 (index!22013 (_ BitVec 32))) (Intermediate!4947 (undefined!5759 Bool) (index!22014 (_ BitVec 32)) (x!50922 (_ BitVec 32))) (Undefined!4947) (MissingVacant!4947 (index!22015 (_ BitVec 32))) )
))
(declare-fun lt!248054 () SeekEntryResult!4947)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542970 (= res!337522 (or (= lt!248054 (MissingZero!4947 i!1153)) (= lt!248054 (MissingVacant!4947 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34312 0))(
  ( (array!34313 (arr!16489 (Array (_ BitVec 32) (_ BitVec 64))) (size!16853 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34312)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34312 (_ BitVec 32)) SeekEntryResult!4947)

(assert (=> b!542970 (= lt!248054 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542971 () Bool)

(declare-fun e!314144 () Bool)

(assert (=> b!542971 (= e!314142 e!314144)))

(declare-fun res!337529 () Bool)

(assert (=> b!542971 (=> (not res!337529) (not e!314144))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!248056 () SeekEntryResult!4947)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542971 (= res!337529 (= lt!248056 (Intermediate!4947 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34312 (_ BitVec 32)) SeekEntryResult!4947)

(assert (=> b!542971 (= lt!248056 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16489 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542972 () Bool)

(declare-fun res!337524 () Bool)

(assert (=> b!542972 (=> (not res!337524) (not e!314142))))

(assert (=> b!542972 (= res!337524 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16853 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16853 a!3154)) (= (select (arr!16489 a!3154) resIndex!32) (select (arr!16489 a!3154) j!147))))))

(declare-fun b!542973 () Bool)

(declare-fun res!337525 () Bool)

(assert (=> b!542973 (=> (not res!337525) (not e!314145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542973 (= res!337525 (validKeyInArray!0 (select (arr!16489 a!3154) j!147)))))

(declare-fun b!542974 () Bool)

(declare-fun res!337523 () Bool)

(assert (=> b!542974 (=> (not res!337523) (not e!314144))))

(assert (=> b!542974 (= res!337523 (and (not (= (select (arr!16489 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16489 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16489 a!3154) index!1177) (select (arr!16489 a!3154) j!147)))))))

(declare-fun b!542976 () Bool)

(declare-fun res!337531 () Bool)

(assert (=> b!542976 (=> (not res!337531) (not e!314145))))

(assert (=> b!542976 (= res!337531 (validKeyInArray!0 k0!1998))))

(declare-fun b!542977 () Bool)

(declare-fun res!337527 () Bool)

(assert (=> b!542977 (=> (not res!337527) (not e!314145))))

(assert (=> b!542977 (= res!337527 (and (= (size!16853 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16853 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16853 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542978 () Bool)

(declare-fun res!337532 () Bool)

(assert (=> b!542978 (=> (not res!337532) (not e!314142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34312 (_ BitVec 32)) Bool)

(assert (=> b!542978 (= res!337532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542979 () Bool)

(declare-fun res!337526 () Bool)

(assert (=> b!542979 (=> (not res!337526) (not e!314144))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542979 (= res!337526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16489 a!3154) j!147) mask!3216) (select (arr!16489 a!3154) j!147) a!3154 mask!3216) lt!248056))))

(declare-fun res!337521 () Bool)

(assert (=> start!49304 (=> (not res!337521) (not e!314145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49304 (= res!337521 (validMask!0 mask!3216))))

(assert (=> start!49304 e!314145))

(assert (=> start!49304 true))

(declare-fun array_inv!12285 (array!34312) Bool)

(assert (=> start!49304 (array_inv!12285 a!3154)))

(declare-fun b!542975 () Bool)

(declare-fun res!337528 () Bool)

(assert (=> b!542975 (=> (not res!337528) (not e!314142))))

(declare-datatypes ((List!10608 0))(
  ( (Nil!10605) (Cons!10604 (h!11559 (_ BitVec 64)) (t!16836 List!10608)) )
))
(declare-fun arrayNoDuplicates!0 (array!34312 (_ BitVec 32) List!10608) Bool)

(assert (=> b!542975 (= res!337528 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10605))))

(declare-fun b!542980 () Bool)

(assert (=> b!542980 (= e!314144 false)))

(declare-fun lt!248055 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542980 (= lt!248055 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542981 () Bool)

(declare-fun res!337530 () Bool)

(assert (=> b!542981 (=> (not res!337530) (not e!314145))))

(declare-fun arrayContainsKey!0 (array!34312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542981 (= res!337530 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49304 res!337521) b!542977))

(assert (= (and b!542977 res!337527) b!542973))

(assert (= (and b!542973 res!337525) b!542976))

(assert (= (and b!542976 res!337531) b!542981))

(assert (= (and b!542981 res!337530) b!542970))

(assert (= (and b!542970 res!337522) b!542978))

(assert (= (and b!542978 res!337532) b!542975))

(assert (= (and b!542975 res!337528) b!542972))

(assert (= (and b!542972 res!337524) b!542971))

(assert (= (and b!542971 res!337529) b!542979))

(assert (= (and b!542979 res!337526) b!542974))

(assert (= (and b!542974 res!337523) b!542980))

(declare-fun m!521139 () Bool)

(assert (=> b!542975 m!521139))

(declare-fun m!521141 () Bool)

(assert (=> b!542979 m!521141))

(assert (=> b!542979 m!521141))

(declare-fun m!521143 () Bool)

(assert (=> b!542979 m!521143))

(assert (=> b!542979 m!521143))

(assert (=> b!542979 m!521141))

(declare-fun m!521145 () Bool)

(assert (=> b!542979 m!521145))

(declare-fun m!521147 () Bool)

(assert (=> b!542972 m!521147))

(assert (=> b!542972 m!521141))

(declare-fun m!521149 () Bool)

(assert (=> b!542980 m!521149))

(declare-fun m!521151 () Bool)

(assert (=> b!542981 m!521151))

(assert (=> b!542971 m!521141))

(assert (=> b!542971 m!521141))

(declare-fun m!521153 () Bool)

(assert (=> b!542971 m!521153))

(declare-fun m!521155 () Bool)

(assert (=> b!542970 m!521155))

(declare-fun m!521157 () Bool)

(assert (=> b!542978 m!521157))

(declare-fun m!521159 () Bool)

(assert (=> b!542976 m!521159))

(declare-fun m!521161 () Bool)

(assert (=> start!49304 m!521161))

(declare-fun m!521163 () Bool)

(assert (=> start!49304 m!521163))

(assert (=> b!542973 m!521141))

(assert (=> b!542973 m!521141))

(declare-fun m!521165 () Bool)

(assert (=> b!542973 m!521165))

(declare-fun m!521167 () Bool)

(assert (=> b!542974 m!521167))

(assert (=> b!542974 m!521141))

(check-sat (not b!542975) (not b!542973) (not b!542980) (not b!542971) (not b!542978) (not b!542979) (not b!542976) (not start!49304) (not b!542970) (not b!542981))
(check-sat)
