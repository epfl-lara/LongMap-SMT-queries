; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86044 () Bool)

(assert start!86044)

(declare-fun b!996574 () Bool)

(declare-fun e!562182 () Bool)

(declare-fun e!562184 () Bool)

(assert (=> b!996574 (= e!562182 e!562184)))

(declare-fun res!666813 () Bool)

(assert (=> b!996574 (=> (not res!666813) (not e!562184))))

(declare-datatypes ((SeekEntryResult!9286 0))(
  ( (MissingZero!9286 (index!39515 (_ BitVec 32))) (Found!9286 (index!39516 (_ BitVec 32))) (Intermediate!9286 (undefined!10098 Bool) (index!39517 (_ BitVec 32)) (x!86957 (_ BitVec 32))) (Undefined!9286) (MissingVacant!9286 (index!39518 (_ BitVec 32))) )
))
(declare-fun lt!441061 () SeekEntryResult!9286)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996574 (= res!666813 (or (= lt!441061 (MissingVacant!9286 i!1194)) (= lt!441061 (MissingZero!9286 i!1194))))))

(declare-datatypes ((array!62996 0))(
  ( (array!62997 (arr!30329 (Array (_ BitVec 32) (_ BitVec 64))) (size!30833 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62996)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62996 (_ BitVec 32)) SeekEntryResult!9286)

(assert (=> b!996574 (= lt!441061 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996575 () Bool)

(declare-fun res!666819 () Bool)

(assert (=> b!996575 (=> (not res!666819) (not e!562182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996575 (= res!666819 (validKeyInArray!0 k!2224))))

(declare-fun b!996576 () Bool)

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996576 (= e!562184 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!996577 () Bool)

(declare-fun res!666820 () Bool)

(assert (=> b!996577 (=> (not res!666820) (not e!562182))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996577 (= res!666820 (and (= (size!30833 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30833 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30833 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996578 () Bool)

(declare-fun res!666812 () Bool)

(assert (=> b!996578 (=> (not res!666812) (not e!562182))))

(declare-fun arrayContainsKey!0 (array!62996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996578 (= res!666812 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996579 () Bool)

(declare-fun res!666814 () Bool)

(assert (=> b!996579 (=> (not res!666814) (not e!562182))))

(assert (=> b!996579 (= res!666814 (validKeyInArray!0 (select (arr!30329 a!3219) j!170)))))

(declare-fun res!666816 () Bool)

(assert (=> start!86044 (=> (not res!666816) (not e!562182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86044 (= res!666816 (validMask!0 mask!3464))))

(assert (=> start!86044 e!562182))

(declare-fun array_inv!23472 (array!62996) Bool)

(assert (=> start!86044 (array_inv!23472 a!3219)))

(assert (=> start!86044 true))

(declare-fun b!996580 () Bool)

(declare-fun res!666821 () Bool)

(assert (=> b!996580 (=> (not res!666821) (not e!562184))))

(declare-datatypes ((List!21071 0))(
  ( (Nil!21068) (Cons!21067 (h!22232 (_ BitVec 64)) (t!30063 List!21071)) )
))
(declare-fun arrayNoDuplicates!0 (array!62996 (_ BitVec 32) List!21071) Bool)

(assert (=> b!996580 (= res!666821 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21068))))

(declare-fun b!996581 () Bool)

(declare-fun res!666815 () Bool)

(assert (=> b!996581 (=> (not res!666815) (not e!562184))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996581 (= res!666815 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30833 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30833 a!3219))))))

(declare-fun b!996582 () Bool)

(declare-fun res!666817 () Bool)

(assert (=> b!996582 (=> (not res!666817) (not e!562184))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62996 (_ BitVec 32)) SeekEntryResult!9286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996582 (= res!666817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30329 a!3219) j!170) mask!3464) (select (arr!30329 a!3219) j!170) a!3219 mask!3464) (Intermediate!9286 false resIndex!38 resX!38)))))

(declare-fun b!996583 () Bool)

(declare-fun res!666818 () Bool)

(assert (=> b!996583 (=> (not res!666818) (not e!562184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62996 (_ BitVec 32)) Bool)

(assert (=> b!996583 (= res!666818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86044 res!666816) b!996577))

(assert (= (and b!996577 res!666820) b!996579))

(assert (= (and b!996579 res!666814) b!996575))

(assert (= (and b!996575 res!666819) b!996578))

(assert (= (and b!996578 res!666812) b!996574))

(assert (= (and b!996574 res!666813) b!996583))

(assert (= (and b!996583 res!666818) b!996580))

(assert (= (and b!996580 res!666821) b!996581))

(assert (= (and b!996581 res!666815) b!996582))

(assert (= (and b!996582 res!666817) b!996576))

(declare-fun m!923097 () Bool)

(assert (=> b!996579 m!923097))

(assert (=> b!996579 m!923097))

(declare-fun m!923099 () Bool)

(assert (=> b!996579 m!923099))

(declare-fun m!923101 () Bool)

(assert (=> b!996580 m!923101))

(declare-fun m!923103 () Bool)

(assert (=> b!996574 m!923103))

(declare-fun m!923105 () Bool)

(assert (=> b!996578 m!923105))

(declare-fun m!923107 () Bool)

(assert (=> b!996575 m!923107))

(assert (=> b!996582 m!923097))

(assert (=> b!996582 m!923097))

(declare-fun m!923109 () Bool)

(assert (=> b!996582 m!923109))

(assert (=> b!996582 m!923109))

(assert (=> b!996582 m!923097))

(declare-fun m!923111 () Bool)

(assert (=> b!996582 m!923111))

(declare-fun m!923113 () Bool)

(assert (=> b!996583 m!923113))

(declare-fun m!923115 () Bool)

(assert (=> start!86044 m!923115))

(declare-fun m!923117 () Bool)

(assert (=> start!86044 m!923117))

(push 1)

(assert (not b!996580))

(assert (not b!996575))

(assert (not b!996579))

(assert (not b!996583))

(assert (not start!86044))

(assert (not b!996578))

(assert (not b!996574))

(assert (not b!996582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

