; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86222 () Bool)

(assert start!86222)

(declare-fun b!998273 () Bool)

(declare-fun res!668071 () Bool)

(declare-fun e!562969 () Bool)

(assert (=> b!998273 (=> (not res!668071) (not e!562969))))

(declare-datatypes ((array!63125 0))(
  ( (array!63126 (arr!30391 (Array (_ BitVec 32) (_ BitVec 64))) (size!30893 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63125)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998273 (= res!668071 (and (= (size!30893 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30893 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30893 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998274 () Bool)

(declare-fun e!562967 () Bool)

(declare-fun e!562968 () Bool)

(assert (=> b!998274 (= e!562967 e!562968)))

(declare-fun res!668076 () Bool)

(assert (=> b!998274 (=> (not res!668076) (not e!562968))))

(declare-datatypes ((SeekEntryResult!9323 0))(
  ( (MissingZero!9323 (index!39663 (_ BitVec 32))) (Found!9323 (index!39664 (_ BitVec 32))) (Intermediate!9323 (undefined!10135 Bool) (index!39665 (_ BitVec 32)) (x!87099 (_ BitVec 32))) (Undefined!9323) (MissingVacant!9323 (index!39666 (_ BitVec 32))) )
))
(declare-fun lt!441670 () SeekEntryResult!9323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63125 (_ BitVec 32)) SeekEntryResult!9323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998274 (= res!668076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30391 a!3219) j!170) mask!3464) (select (arr!30391 a!3219) j!170) a!3219 mask!3464) lt!441670))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998274 (= lt!441670 (Intermediate!9323 false resIndex!38 resX!38))))

(declare-fun b!998275 () Bool)

(assert (=> b!998275 (= e!562969 e!562967)))

(declare-fun res!668072 () Bool)

(assert (=> b!998275 (=> (not res!668072) (not e!562967))))

(declare-fun lt!441671 () SeekEntryResult!9323)

(assert (=> b!998275 (= res!668072 (or (= lt!441671 (MissingVacant!9323 i!1194)) (= lt!441671 (MissingZero!9323 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63125 (_ BitVec 32)) SeekEntryResult!9323)

(assert (=> b!998275 (= lt!441671 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998276 () Bool)

(declare-fun res!668073 () Bool)

(assert (=> b!998276 (=> (not res!668073) (not e!562969))))

(declare-fun arrayContainsKey!0 (array!63125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998276 (= res!668073 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998277 () Bool)

(declare-fun res!668079 () Bool)

(assert (=> b!998277 (=> (not res!668079) (not e!562967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63125 (_ BitVec 32)) Bool)

(assert (=> b!998277 (= res!668079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998278 () Bool)

(declare-fun res!668078 () Bool)

(assert (=> b!998278 (=> (not res!668078) (not e!562968))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!998278 (= res!668078 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30391 a!3219) j!170) a!3219 mask!3464) lt!441670))))

(declare-fun b!998279 () Bool)

(declare-fun res!668075 () Bool)

(assert (=> b!998279 (=> (not res!668075) (not e!562969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998279 (= res!668075 (validKeyInArray!0 (select (arr!30391 a!3219) j!170)))))

(declare-fun b!998281 () Bool)

(declare-fun res!668069 () Bool)

(assert (=> b!998281 (=> (not res!668069) (not e!562967))))

(declare-datatypes ((List!21067 0))(
  ( (Nil!21064) (Cons!21063 (h!22234 (_ BitVec 64)) (t!30068 List!21067)) )
))
(declare-fun arrayNoDuplicates!0 (array!63125 (_ BitVec 32) List!21067) Bool)

(assert (=> b!998281 (= res!668069 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21064))))

(declare-fun b!998282 () Bool)

(assert (=> b!998282 (= e!562968 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!998283 () Bool)

(declare-fun res!668074 () Bool)

(assert (=> b!998283 (=> (not res!668074) (not e!562969))))

(assert (=> b!998283 (= res!668074 (validKeyInArray!0 k!2224))))

(declare-fun b!998280 () Bool)

(declare-fun res!668077 () Bool)

(assert (=> b!998280 (=> (not res!668077) (not e!562967))))

(assert (=> b!998280 (= res!668077 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30893 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30893 a!3219))))))

(declare-fun res!668070 () Bool)

(assert (=> start!86222 (=> (not res!668070) (not e!562969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86222 (= res!668070 (validMask!0 mask!3464))))

(assert (=> start!86222 e!562969))

(declare-fun array_inv!23515 (array!63125) Bool)

(assert (=> start!86222 (array_inv!23515 a!3219)))

(assert (=> start!86222 true))

(assert (= (and start!86222 res!668070) b!998273))

(assert (= (and b!998273 res!668071) b!998279))

(assert (= (and b!998279 res!668075) b!998283))

(assert (= (and b!998283 res!668074) b!998276))

(assert (= (and b!998276 res!668073) b!998275))

(assert (= (and b!998275 res!668072) b!998277))

(assert (= (and b!998277 res!668079) b!998281))

(assert (= (and b!998281 res!668069) b!998280))

(assert (= (and b!998280 res!668077) b!998274))

(assert (= (and b!998274 res!668076) b!998278))

(assert (= (and b!998278 res!668078) b!998282))

(declare-fun m!924845 () Bool)

(assert (=> b!998279 m!924845))

(assert (=> b!998279 m!924845))

(declare-fun m!924847 () Bool)

(assert (=> b!998279 m!924847))

(declare-fun m!924849 () Bool)

(assert (=> b!998276 m!924849))

(declare-fun m!924851 () Bool)

(assert (=> b!998283 m!924851))

(declare-fun m!924853 () Bool)

(assert (=> start!86222 m!924853))

(declare-fun m!924855 () Bool)

(assert (=> start!86222 m!924855))

(assert (=> b!998278 m!924845))

(assert (=> b!998278 m!924845))

(declare-fun m!924857 () Bool)

(assert (=> b!998278 m!924857))

(declare-fun m!924859 () Bool)

(assert (=> b!998281 m!924859))

(assert (=> b!998274 m!924845))

(assert (=> b!998274 m!924845))

(declare-fun m!924861 () Bool)

(assert (=> b!998274 m!924861))

(assert (=> b!998274 m!924861))

(assert (=> b!998274 m!924845))

(declare-fun m!924863 () Bool)

(assert (=> b!998274 m!924863))

(declare-fun m!924865 () Bool)

(assert (=> b!998275 m!924865))

(declare-fun m!924867 () Bool)

(assert (=> b!998277 m!924867))

(push 1)

