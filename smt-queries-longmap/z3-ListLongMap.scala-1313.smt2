; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26438 () Bool)

(assert start!26438)

(declare-fun b!274169 () Bool)

(declare-fun e!175552 () Bool)

(assert (=> b!274169 (= e!175552 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13524 0))(
  ( (array!13525 (arr!6411 (Array (_ BitVec 32) (_ BitVec 64))) (size!6764 (_ BitVec 32))) )
))
(declare-fun lt!136696 () array!13524)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13524 (_ BitVec 32)) Bool)

(assert (=> b!274169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136696 mask!3868)))

(declare-fun a!3325 () array!13524)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((Unit!8589 0))(
  ( (Unit!8590) )
))
(declare-fun lt!136698 () Unit!8589)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8589)

(assert (=> b!274169 (= lt!136698 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274170 () Bool)

(declare-fun e!175553 () Bool)

(declare-fun e!175554 () Bool)

(assert (=> b!274170 (= e!175553 e!175554)))

(declare-fun res!138218 () Bool)

(assert (=> b!274170 (=> (not res!138218) (not e!175554))))

(assert (=> b!274170 (= res!138218 (not (= startIndex!26 i!1267)))))

(assert (=> b!274170 (= lt!136696 (array!13525 (store (arr!6411 a!3325) i!1267 k0!2581) (size!6764 a!3325)))))

(declare-fun b!274171 () Bool)

(assert (=> b!274171 (= e!175554 (not e!175552))))

(declare-fun res!138214 () Bool)

(assert (=> b!274171 (=> res!138214 e!175552)))

(assert (=> b!274171 (= res!138214 (or (bvsge startIndex!26 (bvsub (size!6764 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274171 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136695 () Unit!8589)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8589)

(assert (=> b!274171 (= lt!136695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1568 0))(
  ( (MissingZero!1568 (index!8442 (_ BitVec 32))) (Found!1568 (index!8443 (_ BitVec 32))) (Intermediate!1568 (undefined!2380 Bool) (index!8444 (_ BitVec 32)) (x!26756 (_ BitVec 32))) (Undefined!1568) (MissingVacant!1568 (index!8445 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13524 (_ BitVec 32)) SeekEntryResult!1568)

(assert (=> b!274171 (= (seekEntryOrOpen!0 (select (arr!6411 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6411 a!3325) i!1267 k0!2581) startIndex!26) lt!136696 mask!3868))))

(declare-fun lt!136697 () Unit!8589)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13524 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8589)

(assert (=> b!274171 (= lt!136697 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4192 0))(
  ( (Nil!4189) (Cons!4188 (h!4855 (_ BitVec 64)) (t!9265 List!4192)) )
))
(declare-fun arrayNoDuplicates!0 (array!13524 (_ BitVec 32) List!4192) Bool)

(assert (=> b!274171 (arrayNoDuplicates!0 lt!136696 #b00000000000000000000000000000000 Nil!4189)))

(declare-fun lt!136694 () Unit!8589)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4192) Unit!8589)

(assert (=> b!274171 (= lt!136694 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4189))))

(declare-fun b!274172 () Bool)

(declare-fun res!138212 () Bool)

(declare-fun e!175551 () Bool)

(assert (=> b!274172 (=> (not res!138212) (not e!175551))))

(assert (=> b!274172 (= res!138212 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4189))))

(declare-fun b!274173 () Bool)

(declare-fun res!138213 () Bool)

(assert (=> b!274173 (=> (not res!138213) (not e!175553))))

(assert (=> b!274173 (= res!138213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274174 () Bool)

(declare-fun res!138215 () Bool)

(assert (=> b!274174 (=> (not res!138215) (not e!175554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274174 (= res!138215 (validKeyInArray!0 (select (arr!6411 a!3325) startIndex!26)))))

(declare-fun b!274175 () Bool)

(declare-fun res!138217 () Bool)

(assert (=> b!274175 (=> (not res!138217) (not e!175551))))

(assert (=> b!274175 (= res!138217 (and (= (size!6764 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6764 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6764 a!3325))))))

(declare-fun b!274176 () Bool)

(assert (=> b!274176 (= e!175551 e!175553)))

(declare-fun res!138216 () Bool)

(assert (=> b!274176 (=> (not res!138216) (not e!175553))))

(declare-fun lt!136693 () SeekEntryResult!1568)

(assert (=> b!274176 (= res!138216 (or (= lt!136693 (MissingZero!1568 i!1267)) (= lt!136693 (MissingVacant!1568 i!1267))))))

(assert (=> b!274176 (= lt!136693 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!138219 () Bool)

(assert (=> start!26438 (=> (not res!138219) (not e!175551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26438 (= res!138219 (validMask!0 mask!3868))))

(assert (=> start!26438 e!175551))

(declare-fun array_inv!4383 (array!13524) Bool)

(assert (=> start!26438 (array_inv!4383 a!3325)))

(assert (=> start!26438 true))

(declare-fun b!274177 () Bool)

(declare-fun res!138211 () Bool)

(assert (=> b!274177 (=> (not res!138211) (not e!175551))))

(declare-fun arrayContainsKey!0 (array!13524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274177 (= res!138211 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274178 () Bool)

(declare-fun res!138220 () Bool)

(assert (=> b!274178 (=> (not res!138220) (not e!175551))))

(assert (=> b!274178 (= res!138220 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26438 res!138219) b!274175))

(assert (= (and b!274175 res!138217) b!274178))

(assert (= (and b!274178 res!138220) b!274172))

(assert (= (and b!274172 res!138212) b!274177))

(assert (= (and b!274177 res!138211) b!274176))

(assert (= (and b!274176 res!138216) b!274173))

(assert (= (and b!274173 res!138213) b!274170))

(assert (= (and b!274170 res!138218) b!274174))

(assert (= (and b!274174 res!138215) b!274171))

(assert (= (and b!274171 (not res!138214)) b!274169))

(declare-fun m!289205 () Bool)

(assert (=> b!274178 m!289205))

(declare-fun m!289207 () Bool)

(assert (=> b!274169 m!289207))

(declare-fun m!289209 () Bool)

(assert (=> b!274169 m!289209))

(declare-fun m!289211 () Bool)

(assert (=> b!274176 m!289211))

(declare-fun m!289213 () Bool)

(assert (=> b!274170 m!289213))

(declare-fun m!289215 () Bool)

(assert (=> b!274177 m!289215))

(declare-fun m!289217 () Bool)

(assert (=> start!26438 m!289217))

(declare-fun m!289219 () Bool)

(assert (=> start!26438 m!289219))

(declare-fun m!289221 () Bool)

(assert (=> b!274172 m!289221))

(declare-fun m!289223 () Bool)

(assert (=> b!274173 m!289223))

(declare-fun m!289225 () Bool)

(assert (=> b!274174 m!289225))

(assert (=> b!274174 m!289225))

(declare-fun m!289227 () Bool)

(assert (=> b!274174 m!289227))

(declare-fun m!289229 () Bool)

(assert (=> b!274171 m!289229))

(declare-fun m!289231 () Bool)

(assert (=> b!274171 m!289231))

(assert (=> b!274171 m!289213))

(declare-fun m!289233 () Bool)

(assert (=> b!274171 m!289233))

(assert (=> b!274171 m!289225))

(declare-fun m!289235 () Bool)

(assert (=> b!274171 m!289235))

(declare-fun m!289237 () Bool)

(assert (=> b!274171 m!289237))

(assert (=> b!274171 m!289225))

(declare-fun m!289239 () Bool)

(assert (=> b!274171 m!289239))

(assert (=> b!274171 m!289231))

(declare-fun m!289241 () Bool)

(assert (=> b!274171 m!289241))

(declare-fun m!289243 () Bool)

(assert (=> b!274171 m!289243))

(check-sat (not b!274173) (not b!274178) (not b!274172) (not b!274176) (not start!26438) (not b!274171) (not b!274169) (not b!274177) (not b!274174))
(check-sat)
