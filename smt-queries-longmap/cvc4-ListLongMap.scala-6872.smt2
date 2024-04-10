; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86490 () Bool)

(assert start!86490)

(declare-fun b!1001709 () Bool)

(declare-fun res!671195 () Bool)

(declare-fun e!564415 () Bool)

(assert (=> b!1001709 (=> (not res!671195) (not e!564415))))

(declare-datatypes ((array!63291 0))(
  ( (array!63292 (arr!30471 (Array (_ BitVec 32) (_ BitVec 64))) (size!30973 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63291)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001709 (= res!671195 (and (= (size!30973 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30973 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30973 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001710 () Bool)

(declare-fun res!671187 () Bool)

(declare-fun e!564416 () Bool)

(assert (=> b!1001710 (=> (not res!671187) (not e!564416))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001710 (= res!671187 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30973 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30973 a!3219))))))

(declare-fun b!1001711 () Bool)

(declare-fun res!671196 () Bool)

(declare-fun e!564414 () Bool)

(assert (=> b!1001711 (=> (not res!671196) (not e!564414))))

(declare-fun lt!442815 () (_ BitVec 64))

(declare-fun lt!442814 () array!63291)

(declare-datatypes ((SeekEntryResult!9403 0))(
  ( (MissingZero!9403 (index!39983 (_ BitVec 32))) (Found!9403 (index!39984 (_ BitVec 32))) (Intermediate!9403 (undefined!10215 Bool) (index!39985 (_ BitVec 32)) (x!87399 (_ BitVec 32))) (Undefined!9403) (MissingVacant!9403 (index!39986 (_ BitVec 32))) )
))
(declare-fun lt!442816 () SeekEntryResult!9403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63291 (_ BitVec 32)) SeekEntryResult!9403)

(assert (=> b!1001711 (= res!671196 (not (= lt!442816 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442815 lt!442814 mask!3464))))))

(declare-fun b!1001712 () Bool)

(declare-fun res!671194 () Bool)

(assert (=> b!1001712 (=> (not res!671194) (not e!564416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63291 (_ BitVec 32)) Bool)

(assert (=> b!1001712 (= res!671194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001713 () Bool)

(declare-fun res!671191 () Bool)

(assert (=> b!1001713 (=> (not res!671191) (not e!564415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001713 (= res!671191 (validKeyInArray!0 (select (arr!30471 a!3219) j!170)))))

(declare-fun b!1001714 () Bool)

(declare-fun res!671198 () Bool)

(assert (=> b!1001714 (=> (not res!671198) (not e!564415))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001714 (= res!671198 (validKeyInArray!0 k!2224))))

(declare-fun b!1001715 () Bool)

(declare-fun e!564417 () Bool)

(assert (=> b!1001715 (= e!564417 false)))

(declare-fun lt!442812 () (_ BitVec 32))

(declare-fun lt!442817 () SeekEntryResult!9403)

(assert (=> b!1001715 (= lt!442817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442812 lt!442815 lt!442814 mask!3464))))

(declare-fun b!1001716 () Bool)

(assert (=> b!1001716 (= e!564414 e!564417)))

(declare-fun res!671189 () Bool)

(assert (=> b!1001716 (=> (not res!671189) (not e!564417))))

(assert (=> b!1001716 (= res!671189 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442812 #b00000000000000000000000000000000) (bvslt lt!442812 (size!30973 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001716 (= lt!442812 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001717 () Bool)

(declare-fun e!564413 () Bool)

(assert (=> b!1001717 (= e!564416 e!564413)))

(declare-fun res!671188 () Bool)

(assert (=> b!1001717 (=> (not res!671188) (not e!564413))))

(declare-fun lt!442810 () SeekEntryResult!9403)

(declare-fun lt!442811 () SeekEntryResult!9403)

(assert (=> b!1001717 (= res!671188 (= lt!442810 lt!442811))))

(assert (=> b!1001717 (= lt!442811 (Intermediate!9403 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001717 (= lt!442810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30471 a!3219) j!170) mask!3464) (select (arr!30471 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!671200 () Bool)

(assert (=> start!86490 (=> (not res!671200) (not e!564415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86490 (= res!671200 (validMask!0 mask!3464))))

(assert (=> start!86490 e!564415))

(declare-fun array_inv!23595 (array!63291) Bool)

(assert (=> start!86490 (array_inv!23595 a!3219)))

(assert (=> start!86490 true))

(declare-fun b!1001718 () Bool)

(assert (=> b!1001718 (= e!564415 e!564416)))

(declare-fun res!671193 () Bool)

(assert (=> b!1001718 (=> (not res!671193) (not e!564416))))

(declare-fun lt!442813 () SeekEntryResult!9403)

(assert (=> b!1001718 (= res!671193 (or (= lt!442813 (MissingVacant!9403 i!1194)) (= lt!442813 (MissingZero!9403 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63291 (_ BitVec 32)) SeekEntryResult!9403)

(assert (=> b!1001718 (= lt!442813 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001719 () Bool)

(declare-fun e!564412 () Bool)

(assert (=> b!1001719 (= e!564413 e!564412)))

(declare-fun res!671192 () Bool)

(assert (=> b!1001719 (=> (not res!671192) (not e!564412))))

(assert (=> b!1001719 (= res!671192 (= lt!442816 lt!442811))))

(assert (=> b!1001719 (= lt!442816 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30471 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001720 () Bool)

(declare-fun res!671202 () Bool)

(assert (=> b!1001720 (=> (not res!671202) (not e!564416))))

(declare-datatypes ((List!21147 0))(
  ( (Nil!21144) (Cons!21143 (h!22320 (_ BitVec 64)) (t!30148 List!21147)) )
))
(declare-fun arrayNoDuplicates!0 (array!63291 (_ BitVec 32) List!21147) Bool)

(assert (=> b!1001720 (= res!671202 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21144))))

(declare-fun b!1001721 () Bool)

(declare-fun res!671197 () Bool)

(assert (=> b!1001721 (=> (not res!671197) (not e!564417))))

(assert (=> b!1001721 (= res!671197 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442812 (select (arr!30471 a!3219) j!170) a!3219 mask!3464) lt!442811))))

(declare-fun b!1001722 () Bool)

(declare-fun res!671190 () Bool)

(assert (=> b!1001722 (=> (not res!671190) (not e!564414))))

(assert (=> b!1001722 (= res!671190 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001723 () Bool)

(assert (=> b!1001723 (= e!564412 e!564414)))

(declare-fun res!671201 () Bool)

(assert (=> b!1001723 (=> (not res!671201) (not e!564414))))

(assert (=> b!1001723 (= res!671201 (not (= lt!442810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442815 mask!3464) lt!442815 lt!442814 mask!3464))))))

(assert (=> b!1001723 (= lt!442815 (select (store (arr!30471 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001723 (= lt!442814 (array!63292 (store (arr!30471 a!3219) i!1194 k!2224) (size!30973 a!3219)))))

(declare-fun b!1001724 () Bool)

(declare-fun res!671199 () Bool)

(assert (=> b!1001724 (=> (not res!671199) (not e!564415))))

(declare-fun arrayContainsKey!0 (array!63291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001724 (= res!671199 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86490 res!671200) b!1001709))

(assert (= (and b!1001709 res!671195) b!1001713))

(assert (= (and b!1001713 res!671191) b!1001714))

(assert (= (and b!1001714 res!671198) b!1001724))

(assert (= (and b!1001724 res!671199) b!1001718))

(assert (= (and b!1001718 res!671193) b!1001712))

(assert (= (and b!1001712 res!671194) b!1001720))

(assert (= (and b!1001720 res!671202) b!1001710))

(assert (= (and b!1001710 res!671187) b!1001717))

(assert (= (and b!1001717 res!671188) b!1001719))

(assert (= (and b!1001719 res!671192) b!1001723))

(assert (= (and b!1001723 res!671201) b!1001711))

(assert (= (and b!1001711 res!671196) b!1001722))

(assert (= (and b!1001722 res!671190) b!1001716))

(assert (= (and b!1001716 res!671189) b!1001721))

(assert (= (and b!1001721 res!671197) b!1001715))

(declare-fun m!927709 () Bool)

(assert (=> start!86490 m!927709))

(declare-fun m!927711 () Bool)

(assert (=> start!86490 m!927711))

(declare-fun m!927713 () Bool)

(assert (=> b!1001718 m!927713))

(declare-fun m!927715 () Bool)

(assert (=> b!1001719 m!927715))

(assert (=> b!1001719 m!927715))

(declare-fun m!927717 () Bool)

(assert (=> b!1001719 m!927717))

(declare-fun m!927719 () Bool)

(assert (=> b!1001716 m!927719))

(declare-fun m!927721 () Bool)

(assert (=> b!1001720 m!927721))

(assert (=> b!1001721 m!927715))

(assert (=> b!1001721 m!927715))

(declare-fun m!927723 () Bool)

(assert (=> b!1001721 m!927723))

(declare-fun m!927725 () Bool)

(assert (=> b!1001715 m!927725))

(declare-fun m!927727 () Bool)

(assert (=> b!1001711 m!927727))

(declare-fun m!927729 () Bool)

(assert (=> b!1001723 m!927729))

(assert (=> b!1001723 m!927729))

(declare-fun m!927731 () Bool)

(assert (=> b!1001723 m!927731))

(declare-fun m!927733 () Bool)

(assert (=> b!1001723 m!927733))

(declare-fun m!927735 () Bool)

(assert (=> b!1001723 m!927735))

(declare-fun m!927737 () Bool)

(assert (=> b!1001714 m!927737))

(declare-fun m!927739 () Bool)

(assert (=> b!1001712 m!927739))

(assert (=> b!1001717 m!927715))

(assert (=> b!1001717 m!927715))

(declare-fun m!927741 () Bool)

(assert (=> b!1001717 m!927741))

(assert (=> b!1001717 m!927741))

(assert (=> b!1001717 m!927715))

(declare-fun m!927743 () Bool)

(assert (=> b!1001717 m!927743))

(declare-fun m!927745 () Bool)

(assert (=> b!1001724 m!927745))

(assert (=> b!1001713 m!927715))

(assert (=> b!1001713 m!927715))

(declare-fun m!927747 () Bool)

(assert (=> b!1001713 m!927747))

(push 1)

