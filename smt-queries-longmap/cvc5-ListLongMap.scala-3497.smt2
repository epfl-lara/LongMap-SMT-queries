; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48552 () Bool)

(assert start!48552)

(declare-fun b!533003 () Bool)

(declare-fun res!328211 () Bool)

(declare-fun e!310274 () Bool)

(assert (=> b!533003 (=> (not res!328211) (not e!310274))))

(declare-datatypes ((array!33764 0))(
  ( (array!33765 (arr!16221 (Array (_ BitVec 32) (_ BitVec 64))) (size!16585 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33764)

(declare-datatypes ((List!10340 0))(
  ( (Nil!10337) (Cons!10336 (h!11279 (_ BitVec 64)) (t!16568 List!10340)) )
))
(declare-fun arrayNoDuplicates!0 (array!33764 (_ BitVec 32) List!10340) Bool)

(assert (=> b!533003 (= res!328211 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10337))))

(declare-fun b!533005 () Bool)

(declare-fun res!328212 () Bool)

(assert (=> b!533005 (=> (not res!328212) (not e!310274))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33764 (_ BitVec 32)) Bool)

(assert (=> b!533005 (= res!328212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533006 () Bool)

(declare-fun res!328214 () Bool)

(assert (=> b!533006 (=> (not res!328214) (not e!310274))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533006 (= res!328214 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16585 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16585 a!3154)) (= (select (arr!16221 a!3154) resIndex!32) (select (arr!16221 a!3154) j!147))))))

(declare-fun b!533007 () Bool)

(declare-fun res!328210 () Bool)

(declare-fun e!310273 () Bool)

(assert (=> b!533007 (=> (not res!328210) (not e!310273))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533007 (= res!328210 (and (= (size!16585 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16585 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16585 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533008 () Bool)

(assert (=> b!533008 (= e!310274 false)))

(declare-fun lt!245367 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533008 (= lt!245367 (toIndex!0 (select (arr!16221 a!3154) j!147) mask!3216))))

(declare-fun b!533009 () Bool)

(declare-fun res!328215 () Bool)

(assert (=> b!533009 (=> (not res!328215) (not e!310273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533009 (= res!328215 (validKeyInArray!0 (select (arr!16221 a!3154) j!147)))))

(declare-fun b!533010 () Bool)

(declare-fun res!328208 () Bool)

(assert (=> b!533010 (=> (not res!328208) (not e!310273))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533010 (= res!328208 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533011 () Bool)

(assert (=> b!533011 (= e!310273 e!310274)))

(declare-fun res!328217 () Bool)

(assert (=> b!533011 (=> (not res!328217) (not e!310274))))

(declare-datatypes ((SeekEntryResult!4679 0))(
  ( (MissingZero!4679 (index!20940 (_ BitVec 32))) (Found!4679 (index!20941 (_ BitVec 32))) (Intermediate!4679 (undefined!5491 Bool) (index!20942 (_ BitVec 32)) (x!49918 (_ BitVec 32))) (Undefined!4679) (MissingVacant!4679 (index!20943 (_ BitVec 32))) )
))
(declare-fun lt!245368 () SeekEntryResult!4679)

(assert (=> b!533011 (= res!328217 (or (= lt!245368 (MissingZero!4679 i!1153)) (= lt!245368 (MissingVacant!4679 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33764 (_ BitVec 32)) SeekEntryResult!4679)

(assert (=> b!533011 (= lt!245368 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533012 () Bool)

(declare-fun res!328216 () Bool)

(assert (=> b!533012 (=> (not res!328216) (not e!310274))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33764 (_ BitVec 32)) SeekEntryResult!4679)

(assert (=> b!533012 (= res!328216 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16221 a!3154) j!147) a!3154 mask!3216) (Intermediate!4679 false resIndex!32 resX!32)))))

(declare-fun b!533004 () Bool)

(declare-fun res!328209 () Bool)

(assert (=> b!533004 (=> (not res!328209) (not e!310273))))

(assert (=> b!533004 (= res!328209 (validKeyInArray!0 k!1998))))

(declare-fun res!328213 () Bool)

(assert (=> start!48552 (=> (not res!328213) (not e!310273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48552 (= res!328213 (validMask!0 mask!3216))))

(assert (=> start!48552 e!310273))

(assert (=> start!48552 true))

(declare-fun array_inv!12017 (array!33764) Bool)

(assert (=> start!48552 (array_inv!12017 a!3154)))

(assert (= (and start!48552 res!328213) b!533007))

(assert (= (and b!533007 res!328210) b!533009))

(assert (= (and b!533009 res!328215) b!533004))

(assert (= (and b!533004 res!328209) b!533010))

(assert (= (and b!533010 res!328208) b!533011))

(assert (= (and b!533011 res!328217) b!533005))

(assert (= (and b!533005 res!328212) b!533003))

(assert (= (and b!533003 res!328211) b!533006))

(assert (= (and b!533006 res!328214) b!533012))

(assert (= (and b!533012 res!328216) b!533008))

(declare-fun m!512973 () Bool)

(assert (=> b!533012 m!512973))

(assert (=> b!533012 m!512973))

(declare-fun m!512975 () Bool)

(assert (=> b!533012 m!512975))

(declare-fun m!512977 () Bool)

(assert (=> b!533006 m!512977))

(assert (=> b!533006 m!512973))

(declare-fun m!512979 () Bool)

(assert (=> b!533011 m!512979))

(declare-fun m!512981 () Bool)

(assert (=> start!48552 m!512981))

(declare-fun m!512983 () Bool)

(assert (=> start!48552 m!512983))

(declare-fun m!512985 () Bool)

(assert (=> b!533003 m!512985))

(declare-fun m!512987 () Bool)

(assert (=> b!533005 m!512987))

(assert (=> b!533008 m!512973))

(assert (=> b!533008 m!512973))

(declare-fun m!512989 () Bool)

(assert (=> b!533008 m!512989))

(declare-fun m!512991 () Bool)

(assert (=> b!533010 m!512991))

(declare-fun m!512993 () Bool)

(assert (=> b!533004 m!512993))

(assert (=> b!533009 m!512973))

(assert (=> b!533009 m!512973))

(declare-fun m!512995 () Bool)

(assert (=> b!533009 m!512995))

(push 1)

