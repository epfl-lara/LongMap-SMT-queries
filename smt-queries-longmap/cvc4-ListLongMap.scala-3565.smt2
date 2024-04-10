; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49018 () Bool)

(assert start!49018)

(declare-fun b!540146 () Bool)

(declare-fun res!335197 () Bool)

(declare-fun e!312980 () Bool)

(assert (=> b!540146 (=> (not res!335197) (not e!312980))))

(declare-datatypes ((array!34179 0))(
  ( (array!34180 (arr!16427 (Array (_ BitVec 32) (_ BitVec 64))) (size!16791 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34179)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540146 (= res!335197 (validKeyInArray!0 (select (arr!16427 a!3154) j!147)))))

(declare-fun b!540147 () Bool)

(declare-fun e!312981 () Bool)

(assert (=> b!540147 (= e!312981 false)))

(declare-datatypes ((SeekEntryResult!4885 0))(
  ( (MissingZero!4885 (index!21764 (_ BitVec 32))) (Found!4885 (index!21765 (_ BitVec 32))) (Intermediate!4885 (undefined!5697 Bool) (index!21766 (_ BitVec 32)) (x!50674 (_ BitVec 32))) (Undefined!4885) (MissingVacant!4885 (index!21767 (_ BitVec 32))) )
))
(declare-fun lt!247320 () SeekEntryResult!4885)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34179 (_ BitVec 32)) SeekEntryResult!4885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540147 (= lt!247320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16427 a!3154) j!147) mask!3216) (select (arr!16427 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540148 () Bool)

(declare-fun res!335199 () Bool)

(assert (=> b!540148 (=> (not res!335199) (not e!312980))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!540148 (= res!335199 (validKeyInArray!0 k!1998))))

(declare-fun b!540149 () Bool)

(declare-fun res!335195 () Bool)

(assert (=> b!540149 (=> (not res!335195) (not e!312981))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540149 (= res!335195 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16791 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16791 a!3154)) (= (select (arr!16427 a!3154) resIndex!32) (select (arr!16427 a!3154) j!147))))))

(declare-fun b!540150 () Bool)

(declare-fun res!335194 () Bool)

(assert (=> b!540150 (=> (not res!335194) (not e!312981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34179 (_ BitVec 32)) Bool)

(assert (=> b!540150 (= res!335194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540151 () Bool)

(declare-fun res!335201 () Bool)

(assert (=> b!540151 (=> (not res!335201) (not e!312981))))

(assert (=> b!540151 (= res!335201 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16427 a!3154) j!147) a!3154 mask!3216) (Intermediate!4885 false resIndex!32 resX!32)))))

(declare-fun b!540152 () Bool)

(declare-fun res!335192 () Bool)

(assert (=> b!540152 (=> (not res!335192) (not e!312980))))

(declare-fun arrayContainsKey!0 (array!34179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540152 (= res!335192 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540153 () Bool)

(declare-fun res!335198 () Bool)

(assert (=> b!540153 (=> (not res!335198) (not e!312981))))

(declare-datatypes ((List!10546 0))(
  ( (Nil!10543) (Cons!10542 (h!11488 (_ BitVec 64)) (t!16774 List!10546)) )
))
(declare-fun arrayNoDuplicates!0 (array!34179 (_ BitVec 32) List!10546) Bool)

(assert (=> b!540153 (= res!335198 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10543))))

(declare-fun b!540154 () Bool)

(declare-fun res!335196 () Bool)

(assert (=> b!540154 (=> (not res!335196) (not e!312980))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540154 (= res!335196 (and (= (size!16791 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16791 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16791 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335193 () Bool)

(assert (=> start!49018 (=> (not res!335193) (not e!312980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49018 (= res!335193 (validMask!0 mask!3216))))

(assert (=> start!49018 e!312980))

(assert (=> start!49018 true))

(declare-fun array_inv!12223 (array!34179) Bool)

(assert (=> start!49018 (array_inv!12223 a!3154)))

(declare-fun b!540155 () Bool)

(assert (=> b!540155 (= e!312980 e!312981)))

(declare-fun res!335200 () Bool)

(assert (=> b!540155 (=> (not res!335200) (not e!312981))))

(declare-fun lt!247321 () SeekEntryResult!4885)

(assert (=> b!540155 (= res!335200 (or (= lt!247321 (MissingZero!4885 i!1153)) (= lt!247321 (MissingVacant!4885 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34179 (_ BitVec 32)) SeekEntryResult!4885)

(assert (=> b!540155 (= lt!247321 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49018 res!335193) b!540154))

(assert (= (and b!540154 res!335196) b!540146))

(assert (= (and b!540146 res!335197) b!540148))

(assert (= (and b!540148 res!335199) b!540152))

(assert (= (and b!540152 res!335192) b!540155))

(assert (= (and b!540155 res!335200) b!540150))

(assert (= (and b!540150 res!335194) b!540153))

(assert (= (and b!540153 res!335198) b!540149))

(assert (= (and b!540149 res!335195) b!540151))

(assert (= (and b!540151 res!335201) b!540147))

(declare-fun m!518983 () Bool)

(assert (=> b!540153 m!518983))

(declare-fun m!518985 () Bool)

(assert (=> b!540155 m!518985))

(declare-fun m!518987 () Bool)

(assert (=> start!49018 m!518987))

(declare-fun m!518989 () Bool)

(assert (=> start!49018 m!518989))

(declare-fun m!518991 () Bool)

(assert (=> b!540148 m!518991))

(declare-fun m!518993 () Bool)

(assert (=> b!540151 m!518993))

(assert (=> b!540151 m!518993))

(declare-fun m!518995 () Bool)

(assert (=> b!540151 m!518995))

(declare-fun m!518997 () Bool)

(assert (=> b!540152 m!518997))

(assert (=> b!540147 m!518993))

(assert (=> b!540147 m!518993))

(declare-fun m!518999 () Bool)

(assert (=> b!540147 m!518999))

(assert (=> b!540147 m!518999))

(assert (=> b!540147 m!518993))

(declare-fun m!519001 () Bool)

(assert (=> b!540147 m!519001))

(declare-fun m!519003 () Bool)

(assert (=> b!540150 m!519003))

(assert (=> b!540146 m!518993))

(assert (=> b!540146 m!518993))

(declare-fun m!519005 () Bool)

(assert (=> b!540146 m!519005))

(declare-fun m!519007 () Bool)

(assert (=> b!540149 m!519007))

(assert (=> b!540149 m!518993))

(push 1)

(assert (not b!540148))

(assert (not b!540155))

(assert (not b!540146))

(assert (not b!540150))

(assert (not b!540153))

(assert (not b!540152))

(assert (not b!540151))

(assert (not start!49018))

