; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48628 () Bool)

(assert start!48628)

(declare-fun b!534175 () Bool)

(declare-fun res!329440 () Bool)

(declare-fun e!310614 () Bool)

(assert (=> b!534175 (=> (not res!329440) (not e!310614))))

(declare-datatypes ((array!33839 0))(
  ( (array!33840 (arr!16258 (Array (_ BitVec 32) (_ BitVec 64))) (size!16622 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33839)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33839 (_ BitVec 32)) Bool)

(assert (=> b!534175 (= res!329440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534176 () Bool)

(declare-fun e!310613 () Bool)

(assert (=> b!534176 (= e!310613 e!310614)))

(declare-fun res!329439 () Bool)

(assert (=> b!534176 (=> (not res!329439) (not e!310614))))

(declare-datatypes ((SeekEntryResult!4672 0))(
  ( (MissingZero!4672 (index!20912 (_ BitVec 32))) (Found!4672 (index!20913 (_ BitVec 32))) (Intermediate!4672 (undefined!5484 Bool) (index!20914 (_ BitVec 32)) (x!50020 (_ BitVec 32))) (Undefined!4672) (MissingVacant!4672 (index!20915 (_ BitVec 32))) )
))
(declare-fun lt!245604 () SeekEntryResult!4672)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534176 (= res!329439 (or (= lt!245604 (MissingZero!4672 i!1153)) (= lt!245604 (MissingVacant!4672 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33839 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!534176 (= lt!245604 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534177 () Bool)

(declare-fun res!329438 () Bool)

(assert (=> b!534177 (=> (not res!329438) (not e!310613))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!534177 (= res!329438 (and (= (size!16622 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16622 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16622 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!329442 () Bool)

(assert (=> start!48628 (=> (not res!329442) (not e!310613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48628 (= res!329442 (validMask!0 mask!3216))))

(assert (=> start!48628 e!310613))

(assert (=> start!48628 true))

(declare-fun array_inv!12117 (array!33839) Bool)

(assert (=> start!48628 (array_inv!12117 a!3154)))

(declare-fun b!534178 () Bool)

(declare-fun res!329434 () Bool)

(assert (=> b!534178 (=> (not res!329434) (not e!310613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534178 (= res!329434 (validKeyInArray!0 (select (arr!16258 a!3154) j!147)))))

(declare-fun b!534179 () Bool)

(declare-fun res!329435 () Bool)

(assert (=> b!534179 (=> (not res!329435) (not e!310613))))

(assert (=> b!534179 (= res!329435 (validKeyInArray!0 k0!1998))))

(declare-fun b!534180 () Bool)

(declare-fun res!329437 () Bool)

(assert (=> b!534180 (=> (not res!329437) (not e!310614))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33839 (_ BitVec 32)) SeekEntryResult!4672)

(assert (=> b!534180 (= res!329437 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16258 a!3154) j!147) a!3154 mask!3216) (Intermediate!4672 false resIndex!32 resX!32)))))

(declare-fun b!534181 () Bool)

(declare-fun res!329443 () Bool)

(assert (=> b!534181 (=> (not res!329443) (not e!310614))))

(declare-datatypes ((List!10284 0))(
  ( (Nil!10281) (Cons!10280 (h!11223 (_ BitVec 64)) (t!16504 List!10284)) )
))
(declare-fun arrayNoDuplicates!0 (array!33839 (_ BitVec 32) List!10284) Bool)

(assert (=> b!534181 (= res!329443 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10281))))

(declare-fun b!534182 () Bool)

(declare-fun res!329441 () Bool)

(assert (=> b!534182 (=> (not res!329441) (not e!310614))))

(assert (=> b!534182 (= res!329441 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16622 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16622 a!3154)) (= (select (arr!16258 a!3154) resIndex!32) (select (arr!16258 a!3154) j!147))))))

(declare-fun b!534183 () Bool)

(assert (=> b!534183 (= e!310614 false)))

(declare-fun lt!245605 () SeekEntryResult!4672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534183 (= lt!245605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16258 a!3154) j!147) mask!3216) (select (arr!16258 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534184 () Bool)

(declare-fun res!329436 () Bool)

(assert (=> b!534184 (=> (not res!329436) (not e!310613))))

(declare-fun arrayContainsKey!0 (array!33839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534184 (= res!329436 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48628 res!329442) b!534177))

(assert (= (and b!534177 res!329438) b!534178))

(assert (= (and b!534178 res!329434) b!534179))

(assert (= (and b!534179 res!329435) b!534184))

(assert (= (and b!534184 res!329436) b!534176))

(assert (= (and b!534176 res!329439) b!534175))

(assert (= (and b!534175 res!329440) b!534181))

(assert (= (and b!534181 res!329443) b!534182))

(assert (= (and b!534182 res!329441) b!534180))

(assert (= (and b!534180 res!329437) b!534183))

(declare-fun m!514165 () Bool)

(assert (=> b!534184 m!514165))

(declare-fun m!514167 () Bool)

(assert (=> b!534176 m!514167))

(declare-fun m!514169 () Bool)

(assert (=> b!534182 m!514169))

(declare-fun m!514171 () Bool)

(assert (=> b!534182 m!514171))

(declare-fun m!514173 () Bool)

(assert (=> b!534179 m!514173))

(declare-fun m!514175 () Bool)

(assert (=> start!48628 m!514175))

(declare-fun m!514177 () Bool)

(assert (=> start!48628 m!514177))

(assert (=> b!534180 m!514171))

(assert (=> b!534180 m!514171))

(declare-fun m!514179 () Bool)

(assert (=> b!534180 m!514179))

(assert (=> b!534178 m!514171))

(assert (=> b!534178 m!514171))

(declare-fun m!514181 () Bool)

(assert (=> b!534178 m!514181))

(assert (=> b!534183 m!514171))

(assert (=> b!534183 m!514171))

(declare-fun m!514183 () Bool)

(assert (=> b!534183 m!514183))

(assert (=> b!534183 m!514183))

(assert (=> b!534183 m!514171))

(declare-fun m!514185 () Bool)

(assert (=> b!534183 m!514185))

(declare-fun m!514187 () Bool)

(assert (=> b!534175 m!514187))

(declare-fun m!514189 () Bool)

(assert (=> b!534181 m!514189))

(check-sat (not b!534184) (not b!534179) (not b!534178) (not b!534176) (not b!534180) (not b!534183) (not start!48628) (not b!534181) (not b!534175))
(check-sat)
