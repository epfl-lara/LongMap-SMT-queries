; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86466 () Bool)

(assert start!86466)

(declare-fun b!1001163 () Bool)

(declare-fun e!564170 () Bool)

(declare-fun e!564173 () Bool)

(assert (=> b!1001163 (= e!564170 e!564173)))

(declare-fun res!670645 () Bool)

(assert (=> b!1001163 (=> (not res!670645) (not e!564173))))

(declare-datatypes ((SeekEntryResult!9391 0))(
  ( (MissingZero!9391 (index!39935 (_ BitVec 32))) (Found!9391 (index!39936 (_ BitVec 32))) (Intermediate!9391 (undefined!10203 Bool) (index!39937 (_ BitVec 32)) (x!87355 (_ BitVec 32))) (Undefined!9391) (MissingVacant!9391 (index!39938 (_ BitVec 32))) )
))
(declare-fun lt!442542 () SeekEntryResult!9391)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001163 (= res!670645 (or (= lt!442542 (MissingVacant!9391 i!1194)) (= lt!442542 (MissingZero!9391 i!1194))))))

(declare-datatypes ((array!63267 0))(
  ( (array!63268 (arr!30459 (Array (_ BitVec 32) (_ BitVec 64))) (size!30961 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63267)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63267 (_ BitVec 32)) SeekEntryResult!9391)

(assert (=> b!1001163 (= lt!442542 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001164 () Bool)

(declare-fun res!670649 () Bool)

(assert (=> b!1001164 (=> (not res!670649) (not e!564173))))

(declare-datatypes ((List!21135 0))(
  ( (Nil!21132) (Cons!21131 (h!22308 (_ BitVec 64)) (t!30136 List!21135)) )
))
(declare-fun arrayNoDuplicates!0 (array!63267 (_ BitVec 32) List!21135) Bool)

(assert (=> b!1001164 (= res!670649 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21132))))

(declare-fun b!1001165 () Bool)

(declare-fun e!564175 () Bool)

(declare-fun e!564174 () Bool)

(assert (=> b!1001165 (= e!564175 e!564174)))

(declare-fun res!670644 () Bool)

(assert (=> b!1001165 (=> (not res!670644) (not e!564174))))

(declare-fun lt!442546 () SeekEntryResult!9391)

(declare-fun lt!442543 () (_ BitVec 64))

(declare-fun lt!442545 () array!63267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63267 (_ BitVec 32)) SeekEntryResult!9391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001165 (= res!670644 (not (= lt!442546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442543 mask!3464) lt!442543 lt!442545 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1001165 (= lt!442543 (select (store (arr!30459 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001165 (= lt!442545 (array!63268 (store (arr!30459 a!3219) i!1194 k!2224) (size!30961 a!3219)))))

(declare-fun b!1001166 () Bool)

(declare-fun res!670643 () Bool)

(assert (=> b!1001166 (=> (not res!670643) (not e!564170))))

(assert (=> b!1001166 (= res!670643 (and (= (size!30961 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30961 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30961 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001167 () Bool)

(declare-fun res!670650 () Bool)

(assert (=> b!1001167 (=> (not res!670650) (not e!564170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001167 (= res!670650 (validKeyInArray!0 (select (arr!30459 a!3219) j!170)))))

(declare-fun b!1001168 () Bool)

(declare-fun res!670646 () Bool)

(assert (=> b!1001168 (=> (not res!670646) (not e!564173))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001168 (= res!670646 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30961 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30961 a!3219))))))

(declare-fun b!1001169 () Bool)

(declare-fun e!564172 () Bool)

(assert (=> b!1001169 (= e!564172 e!564175)))

(declare-fun res!670648 () Bool)

(assert (=> b!1001169 (=> (not res!670648) (not e!564175))))

(declare-fun lt!442547 () SeekEntryResult!9391)

(declare-fun lt!442544 () SeekEntryResult!9391)

(assert (=> b!1001169 (= res!670648 (= lt!442547 lt!442544))))

(assert (=> b!1001169 (= lt!442547 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30459 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001170 () Bool)

(declare-fun res!670653 () Bool)

(assert (=> b!1001170 (=> (not res!670653) (not e!564170))))

(assert (=> b!1001170 (= res!670653 (validKeyInArray!0 k!2224))))

(declare-fun b!1001171 () Bool)

(assert (=> b!1001171 (= e!564174 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1001172 () Bool)

(declare-fun res!670651 () Bool)

(assert (=> b!1001172 (=> (not res!670651) (not e!564174))))

(assert (=> b!1001172 (= res!670651 (not (= lt!442547 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442543 lt!442545 mask!3464))))))

(declare-fun b!1001173 () Bool)

(declare-fun res!670647 () Bool)

(assert (=> b!1001173 (=> (not res!670647) (not e!564173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63267 (_ BitVec 32)) Bool)

(assert (=> b!1001173 (= res!670647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!670652 () Bool)

(assert (=> start!86466 (=> (not res!670652) (not e!564170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86466 (= res!670652 (validMask!0 mask!3464))))

(assert (=> start!86466 e!564170))

(declare-fun array_inv!23583 (array!63267) Bool)

(assert (=> start!86466 (array_inv!23583 a!3219)))

(assert (=> start!86466 true))

(declare-fun b!1001174 () Bool)

(assert (=> b!1001174 (= e!564173 e!564172)))

(declare-fun res!670642 () Bool)

(assert (=> b!1001174 (=> (not res!670642) (not e!564172))))

(assert (=> b!1001174 (= res!670642 (= lt!442546 lt!442544))))

(assert (=> b!1001174 (= lt!442544 (Intermediate!9391 false resIndex!38 resX!38))))

(assert (=> b!1001174 (= lt!442546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30459 a!3219) j!170) mask!3464) (select (arr!30459 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001175 () Bool)

(declare-fun res!670641 () Bool)

(assert (=> b!1001175 (=> (not res!670641) (not e!564170))))

(declare-fun arrayContainsKey!0 (array!63267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001175 (= res!670641 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86466 res!670652) b!1001166))

(assert (= (and b!1001166 res!670643) b!1001167))

(assert (= (and b!1001167 res!670650) b!1001170))

(assert (= (and b!1001170 res!670653) b!1001175))

(assert (= (and b!1001175 res!670641) b!1001163))

(assert (= (and b!1001163 res!670645) b!1001173))

(assert (= (and b!1001173 res!670647) b!1001164))

(assert (= (and b!1001164 res!670649) b!1001168))

(assert (= (and b!1001168 res!670646) b!1001174))

(assert (= (and b!1001174 res!670642) b!1001169))

(assert (= (and b!1001169 res!670648) b!1001165))

(assert (= (and b!1001165 res!670644) b!1001172))

(assert (= (and b!1001172 res!670651) b!1001171))

(declare-fun m!927253 () Bool)

(assert (=> b!1001167 m!927253))

(assert (=> b!1001167 m!927253))

(declare-fun m!927255 () Bool)

(assert (=> b!1001167 m!927255))

(declare-fun m!927257 () Bool)

(assert (=> b!1001170 m!927257))

(assert (=> b!1001174 m!927253))

(assert (=> b!1001174 m!927253))

(declare-fun m!927259 () Bool)

(assert (=> b!1001174 m!927259))

(assert (=> b!1001174 m!927259))

(assert (=> b!1001174 m!927253))

(declare-fun m!927261 () Bool)

(assert (=> b!1001174 m!927261))

(declare-fun m!927263 () Bool)

(assert (=> b!1001163 m!927263))

(declare-fun m!927265 () Bool)

(assert (=> b!1001172 m!927265))

(declare-fun m!927267 () Bool)

(assert (=> b!1001165 m!927267))

(assert (=> b!1001165 m!927267))

(declare-fun m!927269 () Bool)

(assert (=> b!1001165 m!927269))

(declare-fun m!927271 () Bool)

(assert (=> b!1001165 m!927271))

(declare-fun m!927273 () Bool)

(assert (=> b!1001165 m!927273))

(declare-fun m!927275 () Bool)

(assert (=> start!86466 m!927275))

(declare-fun m!927277 () Bool)

(assert (=> start!86466 m!927277))

(declare-fun m!927279 () Bool)

(assert (=> b!1001173 m!927279))

(declare-fun m!927281 () Bool)

(assert (=> b!1001164 m!927281))

(declare-fun m!927283 () Bool)

(assert (=> b!1001175 m!927283))

(assert (=> b!1001169 m!927253))

(assert (=> b!1001169 m!927253))

(declare-fun m!927285 () Bool)

(assert (=> b!1001169 m!927285))

(push 1)

(assert (not b!1001175))

(assert (not b!1001169))

(assert (not b!1001163))

(assert (not b!1001170))

(assert (not b!1001167))

(assert (not b!1001172))

(assert (not b!1001174))

(assert (not b!1001173))

(assert (not b!1001165))

(assert (not b!1001164))

(assert (not start!86466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

