; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86514 () Bool)

(assert start!86514)

(declare-fun res!671775 () Bool)

(declare-fun e!564666 () Bool)

(assert (=> start!86514 (=> (not res!671775) (not e!564666))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86514 (= res!671775 (validMask!0 mask!3464))))

(assert (=> start!86514 e!564666))

(declare-datatypes ((array!63315 0))(
  ( (array!63316 (arr!30483 (Array (_ BitVec 32) (_ BitVec 64))) (size!30985 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63315)

(declare-fun array_inv!23607 (array!63315) Bool)

(assert (=> start!86514 (array_inv!23607 a!3219)))

(assert (=> start!86514 true))

(declare-fun b!1002285 () Bool)

(declare-fun res!671772 () Bool)

(declare-fun e!564668 () Bool)

(assert (=> b!1002285 (=> (not res!671772) (not e!564668))))

(declare-datatypes ((List!21159 0))(
  ( (Nil!21156) (Cons!21155 (h!22332 (_ BitVec 64)) (t!30160 List!21159)) )
))
(declare-fun arrayNoDuplicates!0 (array!63315 (_ BitVec 32) List!21159) Bool)

(assert (=> b!1002285 (= res!671772 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21156))))

(declare-fun b!1002286 () Bool)

(declare-fun res!671768 () Bool)

(assert (=> b!1002286 (=> (not res!671768) (not e!564668))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002286 (= res!671768 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30985 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30985 a!3219))))))

(declare-fun b!1002287 () Bool)

(declare-fun e!564670 () Bool)

(declare-fun e!564665 () Bool)

(assert (=> b!1002287 (= e!564670 e!564665)))

(declare-fun res!671769 () Bool)

(assert (=> b!1002287 (=> (not res!671769) (not e!564665))))

(declare-fun lt!443102 () (_ BitVec 64))

(declare-fun lt!443104 () array!63315)

(declare-datatypes ((SeekEntryResult!9415 0))(
  ( (MissingZero!9415 (index!40031 (_ BitVec 32))) (Found!9415 (index!40032 (_ BitVec 32))) (Intermediate!9415 (undefined!10227 Bool) (index!40033 (_ BitVec 32)) (x!87443 (_ BitVec 32))) (Undefined!9415) (MissingVacant!9415 (index!40034 (_ BitVec 32))) )
))
(declare-fun lt!443100 () SeekEntryResult!9415)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63315 (_ BitVec 32)) SeekEntryResult!9415)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002287 (= res!671769 (not (= lt!443100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443102 mask!3464) lt!443102 lt!443104 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002287 (= lt!443102 (select (store (arr!30483 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002287 (= lt!443104 (array!63316 (store (arr!30483 a!3219) i!1194 k!2224) (size!30985 a!3219)))))

(declare-fun b!1002288 () Bool)

(assert (=> b!1002288 (= e!564666 e!564668)))

(declare-fun res!671776 () Bool)

(assert (=> b!1002288 (=> (not res!671776) (not e!564668))))

(declare-fun lt!443098 () SeekEntryResult!9415)

(assert (=> b!1002288 (= res!671776 (or (= lt!443098 (MissingVacant!9415 i!1194)) (= lt!443098 (MissingZero!9415 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63315 (_ BitVec 32)) SeekEntryResult!9415)

(assert (=> b!1002288 (= lt!443098 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002289 () Bool)

(declare-fun res!671770 () Bool)

(assert (=> b!1002289 (=> (not res!671770) (not e!564665))))

(assert (=> b!1002289 (= res!671770 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002290 () Bool)

(declare-fun res!671773 () Bool)

(assert (=> b!1002290 (=> (not res!671773) (not e!564668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63315 (_ BitVec 32)) Bool)

(assert (=> b!1002290 (= res!671773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002291 () Bool)

(declare-fun res!671765 () Bool)

(assert (=> b!1002291 (=> (not res!671765) (not e!564666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002291 (= res!671765 (validKeyInArray!0 k!2224))))

(declare-fun b!1002292 () Bool)

(declare-fun res!671777 () Bool)

(assert (=> b!1002292 (=> (not res!671777) (not e!564666))))

(assert (=> b!1002292 (= res!671777 (validKeyInArray!0 (select (arr!30483 a!3219) j!170)))))

(declare-fun b!1002293 () Bool)

(declare-fun e!564664 () Bool)

(assert (=> b!1002293 (= e!564664 false)))

(declare-fun lt!443099 () (_ BitVec 32))

(declare-fun lt!443101 () SeekEntryResult!9415)

(assert (=> b!1002293 (= lt!443101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443099 lt!443102 lt!443104 mask!3464))))

(declare-fun b!1002294 () Bool)

(declare-fun res!671771 () Bool)

(assert (=> b!1002294 (=> (not res!671771) (not e!564666))))

(assert (=> b!1002294 (= res!671771 (and (= (size!30985 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30985 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30985 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002295 () Bool)

(declare-fun res!671766 () Bool)

(assert (=> b!1002295 (=> (not res!671766) (not e!564665))))

(declare-fun lt!443105 () SeekEntryResult!9415)

(assert (=> b!1002295 (= res!671766 (not (= lt!443105 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443102 lt!443104 mask!3464))))))

(declare-fun b!1002296 () Bool)

(assert (=> b!1002296 (= e!564665 e!564664)))

(declare-fun res!671767 () Bool)

(assert (=> b!1002296 (=> (not res!671767) (not e!564664))))

(assert (=> b!1002296 (= res!671767 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443099 #b00000000000000000000000000000000) (bvslt lt!443099 (size!30985 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002296 (= lt!443099 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002297 () Bool)

(declare-fun res!671763 () Bool)

(assert (=> b!1002297 (=> (not res!671763) (not e!564666))))

(declare-fun arrayContainsKey!0 (array!63315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002297 (= res!671763 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002298 () Bool)

(declare-fun e!564667 () Bool)

(assert (=> b!1002298 (= e!564667 e!564670)))

(declare-fun res!671778 () Bool)

(assert (=> b!1002298 (=> (not res!671778) (not e!564670))))

(declare-fun lt!443103 () SeekEntryResult!9415)

(assert (=> b!1002298 (= res!671778 (= lt!443105 lt!443103))))

(assert (=> b!1002298 (= lt!443105 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30483 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002299 () Bool)

(assert (=> b!1002299 (= e!564668 e!564667)))

(declare-fun res!671764 () Bool)

(assert (=> b!1002299 (=> (not res!671764) (not e!564667))))

(assert (=> b!1002299 (= res!671764 (= lt!443100 lt!443103))))

(assert (=> b!1002299 (= lt!443103 (Intermediate!9415 false resIndex!38 resX!38))))

(assert (=> b!1002299 (= lt!443100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30483 a!3219) j!170) mask!3464) (select (arr!30483 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002300 () Bool)

(declare-fun res!671774 () Bool)

(assert (=> b!1002300 (=> (not res!671774) (not e!564664))))

(assert (=> b!1002300 (= res!671774 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443099 (select (arr!30483 a!3219) j!170) a!3219 mask!3464) lt!443103))))

(assert (= (and start!86514 res!671775) b!1002294))

(assert (= (and b!1002294 res!671771) b!1002292))

(assert (= (and b!1002292 res!671777) b!1002291))

(assert (= (and b!1002291 res!671765) b!1002297))

(assert (= (and b!1002297 res!671763) b!1002288))

(assert (= (and b!1002288 res!671776) b!1002290))

(assert (= (and b!1002290 res!671773) b!1002285))

(assert (= (and b!1002285 res!671772) b!1002286))

(assert (= (and b!1002286 res!671768) b!1002299))

(assert (= (and b!1002299 res!671764) b!1002298))

(assert (= (and b!1002298 res!671778) b!1002287))

(assert (= (and b!1002287 res!671769) b!1002295))

(assert (= (and b!1002295 res!671766) b!1002289))

(assert (= (and b!1002289 res!671770) b!1002296))

(assert (= (and b!1002296 res!671767) b!1002300))

(assert (= (and b!1002300 res!671774) b!1002293))

(declare-fun m!928189 () Bool)

(assert (=> b!1002293 m!928189))

(declare-fun m!928191 () Bool)

(assert (=> b!1002295 m!928191))

(declare-fun m!928193 () Bool)

(assert (=> b!1002287 m!928193))

(assert (=> b!1002287 m!928193))

(declare-fun m!928195 () Bool)

(assert (=> b!1002287 m!928195))

(declare-fun m!928197 () Bool)

(assert (=> b!1002287 m!928197))

(declare-fun m!928199 () Bool)

(assert (=> b!1002287 m!928199))

(declare-fun m!928201 () Bool)

(assert (=> b!1002288 m!928201))

(declare-fun m!928203 () Bool)

(assert (=> b!1002290 m!928203))

(declare-fun m!928205 () Bool)

(assert (=> b!1002296 m!928205))

(declare-fun m!928207 () Bool)

(assert (=> b!1002300 m!928207))

(assert (=> b!1002300 m!928207))

(declare-fun m!928209 () Bool)

(assert (=> b!1002300 m!928209))

(declare-fun m!928211 () Bool)

(assert (=> b!1002297 m!928211))

(assert (=> b!1002292 m!928207))

(assert (=> b!1002292 m!928207))

(declare-fun m!928213 () Bool)

(assert (=> b!1002292 m!928213))

(assert (=> b!1002298 m!928207))

(assert (=> b!1002298 m!928207))

(declare-fun m!928215 () Bool)

(assert (=> b!1002298 m!928215))

(declare-fun m!928217 () Bool)

(assert (=> b!1002285 m!928217))

(declare-fun m!928219 () Bool)

(assert (=> start!86514 m!928219))

(declare-fun m!928221 () Bool)

(assert (=> start!86514 m!928221))

(declare-fun m!928223 () Bool)

(assert (=> b!1002291 m!928223))

(assert (=> b!1002299 m!928207))

(assert (=> b!1002299 m!928207))

(declare-fun m!928225 () Bool)

(assert (=> b!1002299 m!928225))

(assert (=> b!1002299 m!928225))

(assert (=> b!1002299 m!928207))

(declare-fun m!928227 () Bool)

(assert (=> b!1002299 m!928227))

(push 1)

