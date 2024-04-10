; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48632 () Bool)

(assert start!48632)

(declare-fun b!534177 () Bool)

(declare-fun res!329388 () Bool)

(declare-fun e!310635 () Bool)

(assert (=> b!534177 (=> (not res!329388) (not e!310635))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534177 (= res!329388 (validKeyInArray!0 k0!1998))))

(declare-fun b!534178 () Bool)

(declare-fun e!310633 () Bool)

(assert (=> b!534178 (= e!310635 e!310633)))

(declare-fun res!329389 () Bool)

(assert (=> b!534178 (=> (not res!329389) (not e!310633))))

(declare-datatypes ((SeekEntryResult!4719 0))(
  ( (MissingZero!4719 (index!21100 (_ BitVec 32))) (Found!4719 (index!21101 (_ BitVec 32))) (Intermediate!4719 (undefined!5531 Bool) (index!21102 (_ BitVec 32)) (x!50062 (_ BitVec 32))) (Undefined!4719) (MissingVacant!4719 (index!21103 (_ BitVec 32))) )
))
(declare-fun lt!245580 () SeekEntryResult!4719)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534178 (= res!329389 (or (= lt!245580 (MissingZero!4719 i!1153)) (= lt!245580 (MissingVacant!4719 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33844 0))(
  ( (array!33845 (arr!16261 (Array (_ BitVec 32) (_ BitVec 64))) (size!16625 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33844)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33844 (_ BitVec 32)) SeekEntryResult!4719)

(assert (=> b!534178 (= lt!245580 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534179 () Bool)

(declare-fun res!329386 () Bool)

(assert (=> b!534179 (=> (not res!329386) (not e!310633))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33844 (_ BitVec 32)) SeekEntryResult!4719)

(assert (=> b!534179 (= res!329386 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16261 a!3154) j!147) a!3154 mask!3216) (Intermediate!4719 false resIndex!32 resX!32)))))

(declare-fun b!534180 () Bool)

(declare-fun res!329384 () Bool)

(assert (=> b!534180 (=> (not res!329384) (not e!310633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33844 (_ BitVec 32)) Bool)

(assert (=> b!534180 (= res!329384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534181 () Bool)

(declare-fun res!329390 () Bool)

(assert (=> b!534181 (=> (not res!329390) (not e!310633))))

(declare-datatypes ((List!10380 0))(
  ( (Nil!10377) (Cons!10376 (h!11319 (_ BitVec 64)) (t!16608 List!10380)) )
))
(declare-fun arrayNoDuplicates!0 (array!33844 (_ BitVec 32) List!10380) Bool)

(assert (=> b!534181 (= res!329390 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10377))))

(declare-fun b!534182 () Bool)

(declare-fun res!329387 () Bool)

(assert (=> b!534182 (=> (not res!329387) (not e!310635))))

(assert (=> b!534182 (= res!329387 (validKeyInArray!0 (select (arr!16261 a!3154) j!147)))))

(declare-fun b!534183 () Bool)

(declare-fun res!329382 () Bool)

(assert (=> b!534183 (=> (not res!329382) (not e!310635))))

(declare-fun arrayContainsKey!0 (array!33844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534183 (= res!329382 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534176 () Bool)

(assert (=> b!534176 (= e!310633 false)))

(declare-fun lt!245581 () SeekEntryResult!4719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534176 (= lt!245581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16261 a!3154) j!147) mask!3216) (select (arr!16261 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!329381 () Bool)

(assert (=> start!48632 (=> (not res!329381) (not e!310635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48632 (= res!329381 (validMask!0 mask!3216))))

(assert (=> start!48632 e!310635))

(assert (=> start!48632 true))

(declare-fun array_inv!12057 (array!33844) Bool)

(assert (=> start!48632 (array_inv!12057 a!3154)))

(declare-fun b!534184 () Bool)

(declare-fun res!329383 () Bool)

(assert (=> b!534184 (=> (not res!329383) (not e!310633))))

(assert (=> b!534184 (= res!329383 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16625 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16625 a!3154)) (= (select (arr!16261 a!3154) resIndex!32) (select (arr!16261 a!3154) j!147))))))

(declare-fun b!534185 () Bool)

(declare-fun res!329385 () Bool)

(assert (=> b!534185 (=> (not res!329385) (not e!310635))))

(assert (=> b!534185 (= res!329385 (and (= (size!16625 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16625 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16625 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48632 res!329381) b!534185))

(assert (= (and b!534185 res!329385) b!534182))

(assert (= (and b!534182 res!329387) b!534177))

(assert (= (and b!534177 res!329388) b!534183))

(assert (= (and b!534183 res!329382) b!534178))

(assert (= (and b!534178 res!329389) b!534180))

(assert (= (and b!534180 res!329384) b!534181))

(assert (= (and b!534181 res!329390) b!534184))

(assert (= (and b!534184 res!329383) b!534179))

(assert (= (and b!534179 res!329386) b!534176))

(declare-fun m!513929 () Bool)

(assert (=> b!534179 m!513929))

(assert (=> b!534179 m!513929))

(declare-fun m!513931 () Bool)

(assert (=> b!534179 m!513931))

(declare-fun m!513933 () Bool)

(assert (=> b!534181 m!513933))

(declare-fun m!513935 () Bool)

(assert (=> b!534178 m!513935))

(assert (=> b!534176 m!513929))

(assert (=> b!534176 m!513929))

(declare-fun m!513937 () Bool)

(assert (=> b!534176 m!513937))

(assert (=> b!534176 m!513937))

(assert (=> b!534176 m!513929))

(declare-fun m!513939 () Bool)

(assert (=> b!534176 m!513939))

(assert (=> b!534182 m!513929))

(assert (=> b!534182 m!513929))

(declare-fun m!513941 () Bool)

(assert (=> b!534182 m!513941))

(declare-fun m!513943 () Bool)

(assert (=> b!534180 m!513943))

(declare-fun m!513945 () Bool)

(assert (=> b!534184 m!513945))

(assert (=> b!534184 m!513929))

(declare-fun m!513947 () Bool)

(assert (=> b!534183 m!513947))

(declare-fun m!513949 () Bool)

(assert (=> start!48632 m!513949))

(declare-fun m!513951 () Bool)

(assert (=> start!48632 m!513951))

(declare-fun m!513953 () Bool)

(assert (=> b!534177 m!513953))

(check-sat (not b!534178) (not b!534180) (not b!534183) (not b!534176) (not b!534182) (not start!48632) (not b!534177) (not b!534181) (not b!534179))
(check-sat)
