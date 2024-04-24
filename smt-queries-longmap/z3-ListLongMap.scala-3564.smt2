; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49054 () Bool)

(assert start!49054)

(declare-fun b!540196 () Bool)

(declare-fun res!335138 () Bool)

(declare-fun e!313064 () Bool)

(assert (=> b!540196 (=> (not res!335138) (not e!313064))))

(declare-datatypes ((array!34163 0))(
  ( (array!34164 (arr!16417 (Array (_ BitVec 32) (_ BitVec 64))) (size!16781 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34163)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540196 (= res!335138 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540197 () Bool)

(declare-fun res!335145 () Bool)

(declare-fun e!313065 () Bool)

(assert (=> b!540197 (=> (not res!335145) (not e!313065))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4831 0))(
  ( (MissingZero!4831 (index!21548 (_ BitVec 32))) (Found!4831 (index!21549 (_ BitVec 32))) (Intermediate!4831 (undefined!5643 Bool) (index!21550 (_ BitVec 32)) (x!50615 (_ BitVec 32))) (Undefined!4831) (MissingVacant!4831 (index!21551 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34163 (_ BitVec 32)) SeekEntryResult!4831)

(assert (=> b!540197 (= res!335145 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16417 a!3154) j!147) a!3154 mask!3216) (Intermediate!4831 false resIndex!32 resX!32)))))

(declare-fun b!540198 () Bool)

(declare-fun res!335139 () Bool)

(assert (=> b!540198 (=> (not res!335139) (not e!313065))))

(assert (=> b!540198 (= res!335139 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16781 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16781 a!3154)) (= (select (arr!16417 a!3154) resIndex!32) (select (arr!16417 a!3154) j!147))))))

(declare-fun b!540199 () Bool)

(declare-fun res!335142 () Bool)

(assert (=> b!540199 (=> (not res!335142) (not e!313065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34163 (_ BitVec 32)) Bool)

(assert (=> b!540199 (= res!335142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540201 () Bool)

(declare-fun res!335144 () Bool)

(assert (=> b!540201 (=> (not res!335144) (not e!313065))))

(declare-datatypes ((List!10443 0))(
  ( (Nil!10440) (Cons!10439 (h!11388 (_ BitVec 64)) (t!16663 List!10443)) )
))
(declare-fun arrayNoDuplicates!0 (array!34163 (_ BitVec 32) List!10443) Bool)

(assert (=> b!540201 (= res!335144 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10440))))

(declare-fun b!540202 () Bool)

(declare-fun res!335146 () Bool)

(assert (=> b!540202 (=> (not res!335146) (not e!313064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540202 (= res!335146 (validKeyInArray!0 (select (arr!16417 a!3154) j!147)))))

(declare-fun b!540203 () Bool)

(assert (=> b!540203 (= e!313065 false)))

(declare-fun lt!247398 () SeekEntryResult!4831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540203 (= lt!247398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16417 a!3154) j!147) mask!3216) (select (arr!16417 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540204 () Bool)

(declare-fun res!335140 () Bool)

(assert (=> b!540204 (=> (not res!335140) (not e!313064))))

(assert (=> b!540204 (= res!335140 (validKeyInArray!0 k0!1998))))

(declare-fun b!540205 () Bool)

(assert (=> b!540205 (= e!313064 e!313065)))

(declare-fun res!335141 () Bool)

(assert (=> b!540205 (=> (not res!335141) (not e!313065))))

(declare-fun lt!247399 () SeekEntryResult!4831)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540205 (= res!335141 (or (= lt!247399 (MissingZero!4831 i!1153)) (= lt!247399 (MissingVacant!4831 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34163 (_ BitVec 32)) SeekEntryResult!4831)

(assert (=> b!540205 (= lt!247399 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540200 () Bool)

(declare-fun res!335137 () Bool)

(assert (=> b!540200 (=> (not res!335137) (not e!313064))))

(assert (=> b!540200 (= res!335137 (and (= (size!16781 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16781 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16781 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335143 () Bool)

(assert (=> start!49054 (=> (not res!335143) (not e!313064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49054 (= res!335143 (validMask!0 mask!3216))))

(assert (=> start!49054 e!313064))

(assert (=> start!49054 true))

(declare-fun array_inv!12276 (array!34163) Bool)

(assert (=> start!49054 (array_inv!12276 a!3154)))

(assert (= (and start!49054 res!335143) b!540200))

(assert (= (and b!540200 res!335137) b!540202))

(assert (= (and b!540202 res!335146) b!540204))

(assert (= (and b!540204 res!335140) b!540196))

(assert (= (and b!540196 res!335138) b!540205))

(assert (= (and b!540205 res!335141) b!540199))

(assert (= (and b!540199 res!335142) b!540201))

(assert (= (and b!540201 res!335144) b!540198))

(assert (= (and b!540198 res!335139) b!540197))

(assert (= (and b!540197 res!335145) b!540203))

(declare-fun m!519175 () Bool)

(assert (=> b!540196 m!519175))

(declare-fun m!519177 () Bool)

(assert (=> b!540197 m!519177))

(assert (=> b!540197 m!519177))

(declare-fun m!519179 () Bool)

(assert (=> b!540197 m!519179))

(declare-fun m!519181 () Bool)

(assert (=> b!540201 m!519181))

(declare-fun m!519183 () Bool)

(assert (=> b!540198 m!519183))

(assert (=> b!540198 m!519177))

(declare-fun m!519185 () Bool)

(assert (=> b!540204 m!519185))

(assert (=> b!540202 m!519177))

(assert (=> b!540202 m!519177))

(declare-fun m!519187 () Bool)

(assert (=> b!540202 m!519187))

(declare-fun m!519189 () Bool)

(assert (=> start!49054 m!519189))

(declare-fun m!519191 () Bool)

(assert (=> start!49054 m!519191))

(declare-fun m!519193 () Bool)

(assert (=> b!540205 m!519193))

(assert (=> b!540203 m!519177))

(assert (=> b!540203 m!519177))

(declare-fun m!519195 () Bool)

(assert (=> b!540203 m!519195))

(assert (=> b!540203 m!519195))

(assert (=> b!540203 m!519177))

(declare-fun m!519197 () Bool)

(assert (=> b!540203 m!519197))

(declare-fun m!519199 () Bool)

(assert (=> b!540199 m!519199))

(check-sat (not b!540205) (not b!540199) (not b!540201) (not b!540197) (not start!49054) (not b!540204) (not b!540203) (not b!540202) (not b!540196))
(check-sat)
