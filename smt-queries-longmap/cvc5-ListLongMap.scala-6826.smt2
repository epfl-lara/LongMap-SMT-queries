; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85946 () Bool)

(assert start!85946)

(declare-fun b!995839 () Bool)

(declare-fun res!666041 () Bool)

(declare-fun e!561944 () Bool)

(assert (=> b!995839 (=> (not res!666041) (not e!561944))))

(declare-datatypes ((array!62996 0))(
  ( (array!62997 (arr!30331 (Array (_ BitVec 32) (_ BitVec 64))) (size!30833 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62996)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995839 (= res!666041 (and (= (size!30833 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30833 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30833 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995840 () Bool)

(declare-fun res!666047 () Bool)

(assert (=> b!995840 (=> (not res!666047) (not e!561944))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995840 (= res!666047 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995841 () Bool)

(declare-fun res!666042 () Bool)

(declare-fun e!561945 () Bool)

(assert (=> b!995841 (=> (not res!666042) (not e!561945))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995841 (= res!666042 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30833 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30833 a!3219))))))

(declare-fun b!995842 () Bool)

(declare-fun res!666040 () Bool)

(assert (=> b!995842 (=> (not res!666040) (not e!561945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62996 (_ BitVec 32)) Bool)

(assert (=> b!995842 (= res!666040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995843 () Bool)

(declare-fun res!666048 () Bool)

(assert (=> b!995843 (=> (not res!666048) (not e!561944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995843 (= res!666048 (validKeyInArray!0 (select (arr!30331 a!3219) j!170)))))

(declare-fun b!995844 () Bool)

(declare-fun res!666046 () Bool)

(assert (=> b!995844 (=> (not res!666046) (not e!561944))))

(assert (=> b!995844 (= res!666046 (validKeyInArray!0 k!2224))))

(declare-fun b!995845 () Bool)

(declare-fun res!666043 () Bool)

(assert (=> b!995845 (=> (not res!666043) (not e!561945))))

(declare-datatypes ((List!21007 0))(
  ( (Nil!21004) (Cons!21003 (h!22165 (_ BitVec 64)) (t!30008 List!21007)) )
))
(declare-fun arrayNoDuplicates!0 (array!62996 (_ BitVec 32) List!21007) Bool)

(assert (=> b!995845 (= res!666043 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21004))))

(declare-fun res!666044 () Bool)

(assert (=> start!85946 (=> (not res!666044) (not e!561944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85946 (= res!666044 (validMask!0 mask!3464))))

(assert (=> start!85946 e!561944))

(declare-fun array_inv!23455 (array!62996) Bool)

(assert (=> start!85946 (array_inv!23455 a!3219)))

(assert (=> start!85946 true))

(declare-fun b!995846 () Bool)

(assert (=> b!995846 (= e!561945 false)))

(declare-fun lt!441064 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995846 (= lt!441064 (toIndex!0 (select (arr!30331 a!3219) j!170) mask!3464))))

(declare-fun b!995847 () Bool)

(assert (=> b!995847 (= e!561944 e!561945)))

(declare-fun res!666045 () Bool)

(assert (=> b!995847 (=> (not res!666045) (not e!561945))))

(declare-datatypes ((SeekEntryResult!9263 0))(
  ( (MissingZero!9263 (index!39423 (_ BitVec 32))) (Found!9263 (index!39424 (_ BitVec 32))) (Intermediate!9263 (undefined!10075 Bool) (index!39425 (_ BitVec 32)) (x!86864 (_ BitVec 32))) (Undefined!9263) (MissingVacant!9263 (index!39426 (_ BitVec 32))) )
))
(declare-fun lt!441065 () SeekEntryResult!9263)

(assert (=> b!995847 (= res!666045 (or (= lt!441065 (MissingVacant!9263 i!1194)) (= lt!441065 (MissingZero!9263 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62996 (_ BitVec 32)) SeekEntryResult!9263)

(assert (=> b!995847 (= lt!441065 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85946 res!666044) b!995839))

(assert (= (and b!995839 res!666041) b!995843))

(assert (= (and b!995843 res!666048) b!995844))

(assert (= (and b!995844 res!666046) b!995840))

(assert (= (and b!995840 res!666047) b!995847))

(assert (= (and b!995847 res!666045) b!995842))

(assert (= (and b!995842 res!666040) b!995845))

(assert (= (and b!995845 res!666043) b!995841))

(assert (= (and b!995841 res!666042) b!995846))

(declare-fun m!923129 () Bool)

(assert (=> b!995844 m!923129))

(declare-fun m!923131 () Bool)

(assert (=> start!85946 m!923131))

(declare-fun m!923133 () Bool)

(assert (=> start!85946 m!923133))

(declare-fun m!923135 () Bool)

(assert (=> b!995845 m!923135))

(declare-fun m!923137 () Bool)

(assert (=> b!995843 m!923137))

(assert (=> b!995843 m!923137))

(declare-fun m!923139 () Bool)

(assert (=> b!995843 m!923139))

(assert (=> b!995846 m!923137))

(assert (=> b!995846 m!923137))

(declare-fun m!923141 () Bool)

(assert (=> b!995846 m!923141))

(declare-fun m!923143 () Bool)

(assert (=> b!995842 m!923143))

(declare-fun m!923145 () Bool)

(assert (=> b!995840 m!923145))

(declare-fun m!923147 () Bool)

(assert (=> b!995847 m!923147))

(push 1)

