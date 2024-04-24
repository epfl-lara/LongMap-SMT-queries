; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123176 () Bool)

(assert start!123176)

(declare-fun b!1427459 () Bool)

(declare-fun res!962012 () Bool)

(declare-fun e!806478 () Bool)

(assert (=> b!1427459 (=> (not res!962012) (not e!806478))))

(declare-datatypes ((array!97412 0))(
  ( (array!97413 (arr!47020 (Array (_ BitVec 32) (_ BitVec 64))) (size!47571 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97412)

(declare-datatypes ((List!33517 0))(
  ( (Nil!33514) (Cons!33513 (h!34826 (_ BitVec 64)) (t!48203 List!33517)) )
))
(declare-fun arrayNoDuplicates!0 (array!97412 (_ BitVec 32) List!33517) Bool)

(assert (=> b!1427459 (= res!962012 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33514))))

(declare-fun b!1427460 () Bool)

(declare-fun e!806480 () Bool)

(declare-fun e!806479 () Bool)

(assert (=> b!1427460 (= e!806480 e!806479)))

(declare-fun res!962009 () Bool)

(assert (=> b!1427460 (=> (not res!962009) (not e!806479))))

(declare-fun lt!628520 () array!97412)

(declare-fun lt!628519 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11201 0))(
  ( (MissingZero!11201 (index!47196 (_ BitVec 32))) (Found!11201 (index!47197 (_ BitVec 32))) (Intermediate!11201 (undefined!12013 Bool) (index!47198 (_ BitVec 32)) (x!128988 (_ BitVec 32))) (Undefined!11201) (MissingVacant!11201 (index!47199 (_ BitVec 32))) )
))
(declare-fun lt!628517 () SeekEntryResult!11201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97412 (_ BitVec 32)) SeekEntryResult!11201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427460 (= res!962009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628519 mask!2608) lt!628519 lt!628520 mask!2608) lt!628517))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427460 (= lt!628517 (Intermediate!11201 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427460 (= lt!628519 (select (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427460 (= lt!628520 (array!97413 (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47571 a!2831)))))

(declare-fun res!962008 () Bool)

(assert (=> start!123176 (=> (not res!962008) (not e!806478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123176 (= res!962008 (validMask!0 mask!2608))))

(assert (=> start!123176 e!806478))

(assert (=> start!123176 true))

(declare-fun array_inv!36301 (array!97412) Bool)

(assert (=> start!123176 (array_inv!36301 a!2831)))

(declare-fun b!1427461 () Bool)

(declare-fun res!962007 () Bool)

(assert (=> b!1427461 (=> (not res!962007) (not e!806478))))

(assert (=> b!1427461 (= res!962007 (and (= (size!47571 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47571 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47571 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427462 () Bool)

(declare-fun res!962014 () Bool)

(assert (=> b!1427462 (=> (not res!962014) (not e!806478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97412 (_ BitVec 32)) Bool)

(assert (=> b!1427462 (= res!962014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427463 () Bool)

(declare-fun res!962011 () Bool)

(assert (=> b!1427463 (=> (not res!962011) (not e!806479))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427463 (= res!962011 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628519 lt!628520 mask!2608) lt!628517))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1427464 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1427464 (= e!806479 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsle #b00000000000000000000000000000000 (size!47571 a!2831)) (bvsgt j!81 (size!47571 a!2831))))))

(declare-fun b!1427465 () Bool)

(declare-fun res!962010 () Bool)

(assert (=> b!1427465 (=> (not res!962010) (not e!806478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427465 (= res!962010 (validKeyInArray!0 (select (arr!47020 a!2831) i!982)))))

(declare-fun b!1427466 () Bool)

(declare-fun res!962013 () Bool)

(assert (=> b!1427466 (=> (not res!962013) (not e!806478))))

(assert (=> b!1427466 (= res!962013 (validKeyInArray!0 (select (arr!47020 a!2831) j!81)))))

(declare-fun b!1427467 () Bool)

(assert (=> b!1427467 (= e!806478 e!806480)))

(declare-fun res!962016 () Bool)

(assert (=> b!1427467 (=> (not res!962016) (not e!806480))))

(declare-fun lt!628518 () SeekEntryResult!11201)

(assert (=> b!1427467 (= res!962016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!628518))))

(assert (=> b!1427467 (= lt!628518 (Intermediate!11201 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427468 () Bool)

(declare-fun res!962015 () Bool)

(assert (=> b!1427468 (=> (not res!962015) (not e!806479))))

(assert (=> b!1427468 (= res!962015 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!628518))))

(declare-fun b!1427469 () Bool)

(declare-fun res!962017 () Bool)

(assert (=> b!1427469 (=> (not res!962017) (not e!806478))))

(assert (=> b!1427469 (= res!962017 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47571 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47571 a!2831))))))

(assert (= (and start!123176 res!962008) b!1427461))

(assert (= (and b!1427461 res!962007) b!1427465))

(assert (= (and b!1427465 res!962010) b!1427466))

(assert (= (and b!1427466 res!962013) b!1427462))

(assert (= (and b!1427462 res!962014) b!1427459))

(assert (= (and b!1427459 res!962012) b!1427469))

(assert (= (and b!1427469 res!962017) b!1427467))

(assert (= (and b!1427467 res!962016) b!1427460))

(assert (= (and b!1427460 res!962009) b!1427468))

(assert (= (and b!1427468 res!962015) b!1427463))

(assert (= (and b!1427463 res!962011) b!1427464))

(declare-fun m!1318185 () Bool)

(assert (=> b!1427460 m!1318185))

(assert (=> b!1427460 m!1318185))

(declare-fun m!1318187 () Bool)

(assert (=> b!1427460 m!1318187))

(declare-fun m!1318189 () Bool)

(assert (=> b!1427460 m!1318189))

(declare-fun m!1318191 () Bool)

(assert (=> b!1427460 m!1318191))

(declare-fun m!1318193 () Bool)

(assert (=> b!1427459 m!1318193))

(declare-fun m!1318195 () Bool)

(assert (=> b!1427462 m!1318195))

(declare-fun m!1318197 () Bool)

(assert (=> b!1427465 m!1318197))

(assert (=> b!1427465 m!1318197))

(declare-fun m!1318199 () Bool)

(assert (=> b!1427465 m!1318199))

(declare-fun m!1318201 () Bool)

(assert (=> b!1427467 m!1318201))

(assert (=> b!1427467 m!1318201))

(declare-fun m!1318203 () Bool)

(assert (=> b!1427467 m!1318203))

(assert (=> b!1427467 m!1318203))

(assert (=> b!1427467 m!1318201))

(declare-fun m!1318205 () Bool)

(assert (=> b!1427467 m!1318205))

(assert (=> b!1427466 m!1318201))

(assert (=> b!1427466 m!1318201))

(declare-fun m!1318207 () Bool)

(assert (=> b!1427466 m!1318207))

(declare-fun m!1318209 () Bool)

(assert (=> start!123176 m!1318209))

(declare-fun m!1318211 () Bool)

(assert (=> start!123176 m!1318211))

(declare-fun m!1318213 () Bool)

(assert (=> b!1427463 m!1318213))

(assert (=> b!1427468 m!1318201))

(assert (=> b!1427468 m!1318201))

(declare-fun m!1318215 () Bool)

(assert (=> b!1427468 m!1318215))

(check-sat (not start!123176) (not b!1427460) (not b!1427465) (not b!1427459) (not b!1427463) (not b!1427467) (not b!1427466) (not b!1427468) (not b!1427462))
(check-sat)
