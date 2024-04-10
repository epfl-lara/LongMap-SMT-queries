; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86450 () Bool)

(assert start!86450)

(declare-fun b!1000858 () Bool)

(declare-fun res!670341 () Bool)

(declare-fun e!564035 () Bool)

(assert (=> b!1000858 (=> (not res!670341) (not e!564035))))

(declare-datatypes ((array!63251 0))(
  ( (array!63252 (arr!30451 (Array (_ BitVec 32) (_ BitVec 64))) (size!30953 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63251)

(declare-datatypes ((List!21127 0))(
  ( (Nil!21124) (Cons!21123 (h!22300 (_ BitVec 64)) (t!30128 List!21127)) )
))
(declare-fun arrayNoDuplicates!0 (array!63251 (_ BitVec 32) List!21127) Bool)

(assert (=> b!1000858 (= res!670341 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21124))))

(declare-fun b!1000859 () Bool)

(declare-fun res!670337 () Bool)

(declare-fun e!564036 () Bool)

(assert (=> b!1000859 (=> (not res!670337) (not e!564036))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000859 (= res!670337 (validKeyInArray!0 k!2224))))

(declare-fun b!1000860 () Bool)

(declare-fun e!564034 () Bool)

(assert (=> b!1000860 (= e!564035 e!564034)))

(declare-fun res!670340 () Bool)

(assert (=> b!1000860 (=> (not res!670340) (not e!564034))))

(declare-datatypes ((SeekEntryResult!9383 0))(
  ( (MissingZero!9383 (index!39903 (_ BitVec 32))) (Found!9383 (index!39904 (_ BitVec 32))) (Intermediate!9383 (undefined!10195 Bool) (index!39905 (_ BitVec 32)) (x!87331 (_ BitVec 32))) (Undefined!9383) (MissingVacant!9383 (index!39906 (_ BitVec 32))) )
))
(declare-fun lt!442400 () SeekEntryResult!9383)

(declare-fun lt!442402 () SeekEntryResult!9383)

(assert (=> b!1000860 (= res!670340 (= lt!442400 lt!442402))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000860 (= lt!442402 (Intermediate!9383 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63251 (_ BitVec 32)) SeekEntryResult!9383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000860 (= lt!442400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30451 a!3219) j!170) mask!3464) (select (arr!30451 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000861 () Bool)

(declare-fun res!670338 () Bool)

(assert (=> b!1000861 (=> (not res!670338) (not e!564036))))

(assert (=> b!1000861 (= res!670338 (validKeyInArray!0 (select (arr!30451 a!3219) j!170)))))

(declare-fun b!1000862 () Bool)

(assert (=> b!1000862 (= e!564036 e!564035)))

(declare-fun res!670343 () Bool)

(assert (=> b!1000862 (=> (not res!670343) (not e!564035))))

(declare-fun lt!442403 () SeekEntryResult!9383)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000862 (= res!670343 (or (= lt!442403 (MissingVacant!9383 i!1194)) (= lt!442403 (MissingZero!9383 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63251 (_ BitVec 32)) SeekEntryResult!9383)

(assert (=> b!1000862 (= lt!442403 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000863 () Bool)

(declare-fun e!564033 () Bool)

(assert (=> b!1000863 (= e!564033 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442399 () array!63251)

(declare-fun lt!442398 () (_ BitVec 64))

(declare-fun lt!442401 () SeekEntryResult!9383)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000863 (= lt!442401 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442398 lt!442399 mask!3464))))

(declare-fun b!1000864 () Bool)

(declare-fun res!670336 () Bool)

(assert (=> b!1000864 (=> (not res!670336) (not e!564036))))

(assert (=> b!1000864 (= res!670336 (and (= (size!30953 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30953 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30953 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000865 () Bool)

(declare-fun res!670346 () Bool)

(assert (=> b!1000865 (=> (not res!670346) (not e!564034))))

(assert (=> b!1000865 (= res!670346 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30451 a!3219) j!170) a!3219 mask!3464) lt!442402))))

(declare-fun res!670347 () Bool)

(assert (=> start!86450 (=> (not res!670347) (not e!564036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86450 (= res!670347 (validMask!0 mask!3464))))

(assert (=> start!86450 e!564036))

(declare-fun array_inv!23575 (array!63251) Bool)

(assert (=> start!86450 (array_inv!23575 a!3219)))

(assert (=> start!86450 true))

(declare-fun b!1000866 () Bool)

(declare-fun res!670339 () Bool)

(assert (=> b!1000866 (=> (not res!670339) (not e!564035))))

(assert (=> b!1000866 (= res!670339 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30953 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30953 a!3219))))))

(declare-fun b!1000867 () Bool)

(declare-fun res!670345 () Bool)

(assert (=> b!1000867 (=> (not res!670345) (not e!564036))))

(declare-fun arrayContainsKey!0 (array!63251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000867 (= res!670345 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000868 () Bool)

(assert (=> b!1000868 (= e!564034 e!564033)))

(declare-fun res!670344 () Bool)

(assert (=> b!1000868 (=> (not res!670344) (not e!564033))))

(assert (=> b!1000868 (= res!670344 (not (= lt!442400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442398 mask!3464) lt!442398 lt!442399 mask!3464))))))

(assert (=> b!1000868 (= lt!442398 (select (store (arr!30451 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1000868 (= lt!442399 (array!63252 (store (arr!30451 a!3219) i!1194 k!2224) (size!30953 a!3219)))))

(declare-fun b!1000869 () Bool)

(declare-fun res!670342 () Bool)

(assert (=> b!1000869 (=> (not res!670342) (not e!564035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63251 (_ BitVec 32)) Bool)

(assert (=> b!1000869 (= res!670342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86450 res!670347) b!1000864))

(assert (= (and b!1000864 res!670336) b!1000861))

(assert (= (and b!1000861 res!670338) b!1000859))

(assert (= (and b!1000859 res!670337) b!1000867))

(assert (= (and b!1000867 res!670345) b!1000862))

(assert (= (and b!1000862 res!670343) b!1000869))

(assert (= (and b!1000869 res!670342) b!1000858))

(assert (= (and b!1000858 res!670341) b!1000866))

(assert (= (and b!1000866 res!670339) b!1000860))

(assert (= (and b!1000860 res!670340) b!1000865))

(assert (= (and b!1000865 res!670346) b!1000868))

(assert (= (and b!1000868 res!670344) b!1000863))

(declare-fun m!926981 () Bool)

(assert (=> b!1000867 m!926981))

(declare-fun m!926983 () Bool)

(assert (=> b!1000861 m!926983))

(assert (=> b!1000861 m!926983))

(declare-fun m!926985 () Bool)

(assert (=> b!1000861 m!926985))

(declare-fun m!926987 () Bool)

(assert (=> b!1000863 m!926987))

(declare-fun m!926989 () Bool)

(assert (=> b!1000859 m!926989))

(declare-fun m!926991 () Bool)

(assert (=> b!1000868 m!926991))

(assert (=> b!1000868 m!926991))

(declare-fun m!926993 () Bool)

(assert (=> b!1000868 m!926993))

(declare-fun m!926995 () Bool)

(assert (=> b!1000868 m!926995))

(declare-fun m!926997 () Bool)

(assert (=> b!1000868 m!926997))

(assert (=> b!1000865 m!926983))

(assert (=> b!1000865 m!926983))

(declare-fun m!926999 () Bool)

(assert (=> b!1000865 m!926999))

(declare-fun m!927001 () Bool)

(assert (=> b!1000862 m!927001))

(declare-fun m!927003 () Bool)

(assert (=> start!86450 m!927003))

(declare-fun m!927005 () Bool)

(assert (=> start!86450 m!927005))

(declare-fun m!927007 () Bool)

(assert (=> b!1000858 m!927007))

(assert (=> b!1000860 m!926983))

(assert (=> b!1000860 m!926983))

(declare-fun m!927009 () Bool)

(assert (=> b!1000860 m!927009))

(assert (=> b!1000860 m!927009))

(assert (=> b!1000860 m!926983))

(declare-fun m!927011 () Bool)

(assert (=> b!1000860 m!927011))

(declare-fun m!927013 () Bool)

(assert (=> b!1000869 m!927013))

(push 1)

