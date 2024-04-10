; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49296 () Bool)

(assert start!49296)

(declare-fun b!542826 () Bool)

(declare-fun res!337385 () Bool)

(declare-fun e!314095 () Bool)

(assert (=> b!542826 (=> (not res!337385) (not e!314095))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34304 0))(
  ( (array!34305 (arr!16485 (Array (_ BitVec 32) (_ BitVec 64))) (size!16849 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34304)

(assert (=> b!542826 (= res!337385 (and (not (= (select (arr!16485 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16485 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16485 a!3154) index!1177) (select (arr!16485 a!3154) j!147)))))))

(declare-fun b!542827 () Bool)

(declare-fun res!337379 () Bool)

(declare-fun e!314094 () Bool)

(assert (=> b!542827 (=> (not res!337379) (not e!314094))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542827 (= res!337379 (and (= (size!16849 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16849 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16849 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542828 () Bool)

(declare-fun e!314097 () Bool)

(assert (=> b!542828 (= e!314097 e!314095)))

(declare-fun res!337383 () Bool)

(assert (=> b!542828 (=> (not res!337383) (not e!314095))))

(declare-datatypes ((SeekEntryResult!4943 0))(
  ( (MissingZero!4943 (index!21996 (_ BitVec 32))) (Found!4943 (index!21997 (_ BitVec 32))) (Intermediate!4943 (undefined!5755 Bool) (index!21998 (_ BitVec 32)) (x!50910 (_ BitVec 32))) (Undefined!4943) (MissingVacant!4943 (index!21999 (_ BitVec 32))) )
))
(declare-fun lt!248018 () SeekEntryResult!4943)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542828 (= res!337383 (= lt!248018 (Intermediate!4943 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34304 (_ BitVec 32)) SeekEntryResult!4943)

(assert (=> b!542828 (= lt!248018 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16485 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542829 () Bool)

(declare-fun res!337384 () Bool)

(assert (=> b!542829 (=> (not res!337384) (not e!314094))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542829 (= res!337384 (validKeyInArray!0 k!1998))))

(declare-fun b!542830 () Bool)

(declare-fun res!337380 () Bool)

(assert (=> b!542830 (=> (not res!337380) (not e!314094))))

(assert (=> b!542830 (= res!337380 (validKeyInArray!0 (select (arr!16485 a!3154) j!147)))))

(declare-fun b!542831 () Bool)

(assert (=> b!542831 (= e!314095 false)))

(declare-fun lt!248019 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542831 (= lt!248019 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542832 () Bool)

(declare-fun res!337388 () Bool)

(assert (=> b!542832 (=> (not res!337388) (not e!314097))))

(declare-datatypes ((List!10604 0))(
  ( (Nil!10601) (Cons!10600 (h!11555 (_ BitVec 64)) (t!16832 List!10604)) )
))
(declare-fun arrayNoDuplicates!0 (array!34304 (_ BitVec 32) List!10604) Bool)

(assert (=> b!542832 (= res!337388 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10601))))

(declare-fun b!542833 () Bool)

(assert (=> b!542833 (= e!314094 e!314097)))

(declare-fun res!337381 () Bool)

(assert (=> b!542833 (=> (not res!337381) (not e!314097))))

(declare-fun lt!248020 () SeekEntryResult!4943)

(assert (=> b!542833 (= res!337381 (or (= lt!248020 (MissingZero!4943 i!1153)) (= lt!248020 (MissingVacant!4943 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34304 (_ BitVec 32)) SeekEntryResult!4943)

(assert (=> b!542833 (= lt!248020 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!337382 () Bool)

(assert (=> start!49296 (=> (not res!337382) (not e!314094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49296 (= res!337382 (validMask!0 mask!3216))))

(assert (=> start!49296 e!314094))

(assert (=> start!49296 true))

(declare-fun array_inv!12281 (array!34304) Bool)

(assert (=> start!49296 (array_inv!12281 a!3154)))

(declare-fun b!542834 () Bool)

(declare-fun res!337378 () Bool)

(assert (=> b!542834 (=> (not res!337378) (not e!314095))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542834 (= res!337378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16485 a!3154) j!147) mask!3216) (select (arr!16485 a!3154) j!147) a!3154 mask!3216) lt!248018))))

(declare-fun b!542835 () Bool)

(declare-fun res!337387 () Bool)

(assert (=> b!542835 (=> (not res!337387) (not e!314094))))

(declare-fun arrayContainsKey!0 (array!34304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542835 (= res!337387 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542836 () Bool)

(declare-fun res!337377 () Bool)

(assert (=> b!542836 (=> (not res!337377) (not e!314097))))

(assert (=> b!542836 (= res!337377 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16849 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16849 a!3154)) (= (select (arr!16485 a!3154) resIndex!32) (select (arr!16485 a!3154) j!147))))))

(declare-fun b!542837 () Bool)

(declare-fun res!337386 () Bool)

(assert (=> b!542837 (=> (not res!337386) (not e!314097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34304 (_ BitVec 32)) Bool)

(assert (=> b!542837 (= res!337386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49296 res!337382) b!542827))

(assert (= (and b!542827 res!337379) b!542830))

(assert (= (and b!542830 res!337380) b!542829))

(assert (= (and b!542829 res!337384) b!542835))

(assert (= (and b!542835 res!337387) b!542833))

(assert (= (and b!542833 res!337381) b!542837))

(assert (= (and b!542837 res!337386) b!542832))

(assert (= (and b!542832 res!337388) b!542836))

(assert (= (and b!542836 res!337377) b!542828))

(assert (= (and b!542828 res!337383) b!542834))

(assert (= (and b!542834 res!337378) b!542826))

(assert (= (and b!542826 res!337385) b!542831))

(declare-fun m!521019 () Bool)

(assert (=> b!542831 m!521019))

(declare-fun m!521021 () Bool)

(assert (=> b!542826 m!521021))

(declare-fun m!521023 () Bool)

(assert (=> b!542826 m!521023))

(declare-fun m!521025 () Bool)

(assert (=> b!542829 m!521025))

(assert (=> b!542830 m!521023))

(assert (=> b!542830 m!521023))

(declare-fun m!521027 () Bool)

(assert (=> b!542830 m!521027))

(declare-fun m!521029 () Bool)

(assert (=> b!542833 m!521029))

(declare-fun m!521031 () Bool)

(assert (=> b!542832 m!521031))

(assert (=> b!542834 m!521023))

(assert (=> b!542834 m!521023))

(declare-fun m!521033 () Bool)

(assert (=> b!542834 m!521033))

(assert (=> b!542834 m!521033))

(assert (=> b!542834 m!521023))

(declare-fun m!521035 () Bool)

(assert (=> b!542834 m!521035))

(declare-fun m!521037 () Bool)

(assert (=> b!542835 m!521037))

(declare-fun m!521039 () Bool)

(assert (=> b!542836 m!521039))

(assert (=> b!542836 m!521023))

(assert (=> b!542828 m!521023))

(assert (=> b!542828 m!521023))

(declare-fun m!521041 () Bool)

(assert (=> b!542828 m!521041))

(declare-fun m!521043 () Bool)

(assert (=> start!49296 m!521043))

(declare-fun m!521045 () Bool)

(assert (=> start!49296 m!521045))

(declare-fun m!521047 () Bool)

(assert (=> b!542837 m!521047))

(push 1)

