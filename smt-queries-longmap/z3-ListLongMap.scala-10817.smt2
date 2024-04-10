; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126552 () Bool)

(assert start!126552)

(declare-fun b!1485178 () Bool)

(declare-fun res!1009897 () Bool)

(declare-fun e!832632 () Bool)

(assert (=> b!1485178 (=> (not res!1009897) (not e!832632))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99514 0))(
  ( (array!99515 (arr!48033 (Array (_ BitVec 32) (_ BitVec 64))) (size!48583 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99514)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485178 (= res!1009897 (or (= (select (arr!48033 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48033 a!2862) intermediateBeforeIndex!19) (select (arr!48033 a!2862) j!93))))))

(declare-fun b!1485179 () Bool)

(declare-fun e!832631 () Bool)

(declare-fun e!832630 () Bool)

(assert (=> b!1485179 (= e!832631 (not e!832630))))

(declare-fun res!1009889 () Bool)

(assert (=> b!1485179 (=> res!1009889 e!832630)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485179 (= res!1009889 (or (and (= (select (arr!48033 a!2862) index!646) (select (store (arr!48033 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48033 a!2862) index!646) (select (arr!48033 a!2862) j!93))) (= (select (arr!48033 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485179 e!832632))

(declare-fun res!1009896 () Bool)

(assert (=> b!1485179 (=> (not res!1009896) (not e!832632))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99514 (_ BitVec 32)) Bool)

(assert (=> b!1485179 (= res!1009896 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49886 0))(
  ( (Unit!49887) )
))
(declare-fun lt!648007 () Unit!49886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49886)

(assert (=> b!1485179 (= lt!648007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485180 () Bool)

(declare-fun res!1009886 () Bool)

(assert (=> b!1485180 (=> (not res!1009886) (not e!832632))))

(declare-datatypes ((SeekEntryResult!12273 0))(
  ( (MissingZero!12273 (index!51484 (_ BitVec 32))) (Found!12273 (index!51485 (_ BitVec 32))) (Intermediate!12273 (undefined!13085 Bool) (index!51486 (_ BitVec 32)) (x!133061 (_ BitVec 32))) (Undefined!12273) (MissingVacant!12273 (index!51487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99514 (_ BitVec 32)) SeekEntryResult!12273)

(assert (=> b!1485180 (= res!1009886 (= (seekEntryOrOpen!0 (select (arr!48033 a!2862) j!93) a!2862 mask!2687) (Found!12273 j!93)))))

(declare-fun b!1485181 () Bool)

(declare-fun lt!648012 () array!99514)

(declare-fun e!832628 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!648011 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99514 (_ BitVec 32)) SeekEntryResult!12273)

(assert (=> b!1485181 (= e!832628 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648011 lt!648012 mask!2687) (seekEntryOrOpen!0 lt!648011 lt!648012 mask!2687)))))

(declare-fun b!1485182 () Bool)

(declare-fun e!832636 () Bool)

(assert (=> b!1485182 (= e!832636 e!832631)))

(declare-fun res!1009899 () Bool)

(assert (=> b!1485182 (=> (not res!1009899) (not e!832631))))

(declare-fun lt!648010 () SeekEntryResult!12273)

(assert (=> b!1485182 (= res!1009899 (= lt!648010 (Intermediate!12273 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99514 (_ BitVec 32)) SeekEntryResult!12273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485182 (= lt!648010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648011 mask!2687) lt!648011 lt!648012 mask!2687))))

(assert (=> b!1485182 (= lt!648011 (select (store (arr!48033 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485183 () Bool)

(declare-fun e!832629 () Bool)

(declare-fun e!832634 () Bool)

(assert (=> b!1485183 (= e!832629 e!832634)))

(declare-fun res!1009892 () Bool)

(assert (=> b!1485183 (=> (not res!1009892) (not e!832634))))

(declare-fun lt!648009 () (_ BitVec 64))

(assert (=> b!1485183 (= res!1009892 (and (= index!646 intermediateAfterIndex!19) (= lt!648009 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485184 () Bool)

(declare-fun res!1009900 () Bool)

(declare-fun e!832637 () Bool)

(assert (=> b!1485184 (=> (not res!1009900) (not e!832637))))

(declare-datatypes ((List!34534 0))(
  ( (Nil!34531) (Cons!34530 (h!35904 (_ BitVec 64)) (t!49228 List!34534)) )
))
(declare-fun arrayNoDuplicates!0 (array!99514 (_ BitVec 32) List!34534) Bool)

(assert (=> b!1485184 (= res!1009900 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34531))))

(declare-fun b!1485185 () Bool)

(declare-fun res!1009885 () Bool)

(assert (=> b!1485185 (=> (not res!1009885) (not e!832637))))

(assert (=> b!1485185 (= res!1009885 (and (= (size!48583 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48583 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48583 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485186 () Bool)

(declare-fun res!1009895 () Bool)

(assert (=> b!1485186 (=> (not res!1009895) (not e!832631))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485186 (= res!1009895 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485187 () Bool)

(declare-fun res!1009887 () Bool)

(assert (=> b!1485187 (=> (not res!1009887) (not e!832637))))

(assert (=> b!1485187 (= res!1009887 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48583 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48583 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48583 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485188 () Bool)

(declare-fun res!1009890 () Bool)

(assert (=> b!1485188 (=> (not res!1009890) (not e!832637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485188 (= res!1009890 (validKeyInArray!0 (select (arr!48033 a!2862) j!93)))))

(declare-fun b!1485189 () Bool)

(declare-fun res!1009894 () Bool)

(assert (=> b!1485189 (=> (not res!1009894) (not e!832636))))

(declare-fun lt!648008 () SeekEntryResult!12273)

(assert (=> b!1485189 (= res!1009894 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48033 a!2862) j!93) a!2862 mask!2687) lt!648008))))

(declare-fun b!1485191 () Bool)

(assert (=> b!1485191 (= e!832628 (= lt!648010 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648011 lt!648012 mask!2687)))))

(declare-fun b!1485192 () Bool)

(declare-fun res!1009902 () Bool)

(assert (=> b!1485192 (=> (not res!1009902) (not e!832631))))

(assert (=> b!1485192 (= res!1009902 e!832628)))

(declare-fun c!137169 () Bool)

(assert (=> b!1485192 (= c!137169 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485193 () Bool)

(assert (=> b!1485193 (= e!832632 e!832629)))

(declare-fun res!1009891 () Bool)

(assert (=> b!1485193 (=> res!1009891 e!832629)))

(assert (=> b!1485193 (= res!1009891 (or (and (= (select (arr!48033 a!2862) index!646) lt!648009) (= (select (arr!48033 a!2862) index!646) (select (arr!48033 a!2862) j!93))) (= (select (arr!48033 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485193 (= lt!648009 (select (store (arr!48033 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485194 () Bool)

(assert (=> b!1485194 (= e!832630 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!648006 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485194 (= lt!648006 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485195 () Bool)

(assert (=> b!1485195 (= e!832634 (= (seekEntryOrOpen!0 lt!648011 lt!648012 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648011 lt!648012 mask!2687)))))

(declare-fun b!1485196 () Bool)

(declare-fun res!1009903 () Bool)

(assert (=> b!1485196 (=> (not res!1009903) (not e!832637))))

(assert (=> b!1485196 (= res!1009903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485197 () Bool)

(declare-fun e!832635 () Bool)

(assert (=> b!1485197 (= e!832637 e!832635)))

(declare-fun res!1009888 () Bool)

(assert (=> b!1485197 (=> (not res!1009888) (not e!832635))))

(assert (=> b!1485197 (= res!1009888 (= (select (store (arr!48033 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485197 (= lt!648012 (array!99515 (store (arr!48033 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48583 a!2862)))))

(declare-fun b!1485198 () Bool)

(assert (=> b!1485198 (= e!832635 e!832636)))

(declare-fun res!1009893 () Bool)

(assert (=> b!1485198 (=> (not res!1009893) (not e!832636))))

(assert (=> b!1485198 (= res!1009893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48033 a!2862) j!93) mask!2687) (select (arr!48033 a!2862) j!93) a!2862 mask!2687) lt!648008))))

(assert (=> b!1485198 (= lt!648008 (Intermediate!12273 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1009901 () Bool)

(assert (=> start!126552 (=> (not res!1009901) (not e!832637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126552 (= res!1009901 (validMask!0 mask!2687))))

(assert (=> start!126552 e!832637))

(assert (=> start!126552 true))

(declare-fun array_inv!37061 (array!99514) Bool)

(assert (=> start!126552 (array_inv!37061 a!2862)))

(declare-fun b!1485190 () Bool)

(declare-fun res!1009898 () Bool)

(assert (=> b!1485190 (=> (not res!1009898) (not e!832637))))

(assert (=> b!1485190 (= res!1009898 (validKeyInArray!0 (select (arr!48033 a!2862) i!1006)))))

(assert (= (and start!126552 res!1009901) b!1485185))

(assert (= (and b!1485185 res!1009885) b!1485190))

(assert (= (and b!1485190 res!1009898) b!1485188))

(assert (= (and b!1485188 res!1009890) b!1485196))

(assert (= (and b!1485196 res!1009903) b!1485184))

(assert (= (and b!1485184 res!1009900) b!1485187))

(assert (= (and b!1485187 res!1009887) b!1485197))

(assert (= (and b!1485197 res!1009888) b!1485198))

(assert (= (and b!1485198 res!1009893) b!1485189))

(assert (= (and b!1485189 res!1009894) b!1485182))

(assert (= (and b!1485182 res!1009899) b!1485192))

(assert (= (and b!1485192 c!137169) b!1485191))

(assert (= (and b!1485192 (not c!137169)) b!1485181))

(assert (= (and b!1485192 res!1009902) b!1485186))

(assert (= (and b!1485186 res!1009895) b!1485179))

(assert (= (and b!1485179 res!1009896) b!1485180))

(assert (= (and b!1485180 res!1009886) b!1485178))

(assert (= (and b!1485178 res!1009897) b!1485193))

(assert (= (and b!1485193 (not res!1009891)) b!1485183))

(assert (= (and b!1485183 res!1009892) b!1485195))

(assert (= (and b!1485179 (not res!1009889)) b!1485194))

(declare-fun m!1370357 () Bool)

(assert (=> b!1485178 m!1370357))

(declare-fun m!1370359 () Bool)

(assert (=> b!1485178 m!1370359))

(declare-fun m!1370361 () Bool)

(assert (=> b!1485197 m!1370361))

(declare-fun m!1370363 () Bool)

(assert (=> b!1485197 m!1370363))

(assert (=> b!1485188 m!1370359))

(assert (=> b!1485188 m!1370359))

(declare-fun m!1370365 () Bool)

(assert (=> b!1485188 m!1370365))

(declare-fun m!1370367 () Bool)

(assert (=> b!1485196 m!1370367))

(declare-fun m!1370369 () Bool)

(assert (=> b!1485194 m!1370369))

(declare-fun m!1370371 () Bool)

(assert (=> b!1485184 m!1370371))

(declare-fun m!1370373 () Bool)

(assert (=> b!1485191 m!1370373))

(declare-fun m!1370375 () Bool)

(assert (=> b!1485190 m!1370375))

(assert (=> b!1485190 m!1370375))

(declare-fun m!1370377 () Bool)

(assert (=> b!1485190 m!1370377))

(declare-fun m!1370379 () Bool)

(assert (=> start!126552 m!1370379))

(declare-fun m!1370381 () Bool)

(assert (=> start!126552 m!1370381))

(assert (=> b!1485189 m!1370359))

(assert (=> b!1485189 m!1370359))

(declare-fun m!1370383 () Bool)

(assert (=> b!1485189 m!1370383))

(assert (=> b!1485180 m!1370359))

(assert (=> b!1485180 m!1370359))

(declare-fun m!1370385 () Bool)

(assert (=> b!1485180 m!1370385))

(declare-fun m!1370387 () Bool)

(assert (=> b!1485181 m!1370387))

(declare-fun m!1370389 () Bool)

(assert (=> b!1485181 m!1370389))

(assert (=> b!1485198 m!1370359))

(assert (=> b!1485198 m!1370359))

(declare-fun m!1370391 () Bool)

(assert (=> b!1485198 m!1370391))

(assert (=> b!1485198 m!1370391))

(assert (=> b!1485198 m!1370359))

(declare-fun m!1370393 () Bool)

(assert (=> b!1485198 m!1370393))

(declare-fun m!1370395 () Bool)

(assert (=> b!1485193 m!1370395))

(assert (=> b!1485193 m!1370359))

(assert (=> b!1485193 m!1370361))

(declare-fun m!1370397 () Bool)

(assert (=> b!1485193 m!1370397))

(declare-fun m!1370399 () Bool)

(assert (=> b!1485179 m!1370399))

(assert (=> b!1485179 m!1370361))

(assert (=> b!1485179 m!1370397))

(assert (=> b!1485179 m!1370395))

(declare-fun m!1370401 () Bool)

(assert (=> b!1485179 m!1370401))

(assert (=> b!1485179 m!1370359))

(assert (=> b!1485195 m!1370389))

(assert (=> b!1485195 m!1370387))

(declare-fun m!1370403 () Bool)

(assert (=> b!1485182 m!1370403))

(assert (=> b!1485182 m!1370403))

(declare-fun m!1370405 () Bool)

(assert (=> b!1485182 m!1370405))

(assert (=> b!1485182 m!1370361))

(declare-fun m!1370407 () Bool)

(assert (=> b!1485182 m!1370407))

(check-sat (not b!1485181) (not b!1485191) (not b!1485198) (not b!1485196) (not b!1485179) (not b!1485180) (not b!1485194) (not b!1485195) (not b!1485182) (not start!126552) (not b!1485184) (not b!1485189) (not b!1485190) (not b!1485188))
(check-sat)
