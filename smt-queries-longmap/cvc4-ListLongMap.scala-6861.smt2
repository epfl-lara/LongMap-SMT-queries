; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86424 () Bool)

(assert start!86424)

(declare-fun b!1000390 () Bool)

(declare-fun res!669873 () Bool)

(declare-fun e!563875 () Bool)

(assert (=> b!1000390 (=> (not res!669873) (not e!563875))))

(declare-datatypes ((array!63225 0))(
  ( (array!63226 (arr!30438 (Array (_ BitVec 32) (_ BitVec 64))) (size!30940 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63225)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000390 (= res!669873 (and (= (size!30940 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30940 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30940 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000391 () Bool)

(declare-fun res!669874 () Bool)

(declare-fun e!563877 () Bool)

(assert (=> b!1000391 (=> (not res!669874) (not e!563877))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000391 (= res!669874 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30940 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30940 a!3219))))))

(declare-fun b!1000393 () Bool)

(declare-fun res!669868 () Bool)

(assert (=> b!1000393 (=> (not res!669868) (not e!563877))))

(declare-datatypes ((List!21114 0))(
  ( (Nil!21111) (Cons!21110 (h!22287 (_ BitVec 64)) (t!30115 List!21114)) )
))
(declare-fun arrayNoDuplicates!0 (array!63225 (_ BitVec 32) List!21114) Bool)

(assert (=> b!1000393 (= res!669868 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21111))))

(declare-fun b!1000394 () Bool)

(declare-fun e!563876 () Bool)

(assert (=> b!1000394 (= e!563876 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!1000395 () Bool)

(declare-fun res!669876 () Bool)

(assert (=> b!1000395 (=> (not res!669876) (not e!563875))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000395 (= res!669876 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000396 () Bool)

(assert (=> b!1000396 (= e!563877 e!563876)))

(declare-fun res!669879 () Bool)

(assert (=> b!1000396 (=> (not res!669879) (not e!563876))))

(declare-datatypes ((SeekEntryResult!9370 0))(
  ( (MissingZero!9370 (index!39851 (_ BitVec 32))) (Found!9370 (index!39852 (_ BitVec 32))) (Intermediate!9370 (undefined!10182 Bool) (index!39853 (_ BitVec 32)) (x!87278 (_ BitVec 32))) (Undefined!9370) (MissingVacant!9370 (index!39854 (_ BitVec 32))) )
))
(declare-fun lt!442275 () SeekEntryResult!9370)

(declare-fun lt!442276 () SeekEntryResult!9370)

(assert (=> b!1000396 (= res!669879 (= lt!442275 lt!442276))))

(assert (=> b!1000396 (= lt!442276 (Intermediate!9370 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63225 (_ BitVec 32)) SeekEntryResult!9370)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000396 (= lt!442275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30438 a!3219) j!170) mask!3464) (select (arr!30438 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000397 () Bool)

(declare-fun res!669870 () Bool)

(assert (=> b!1000397 (=> (not res!669870) (not e!563875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000397 (= res!669870 (validKeyInArray!0 (select (arr!30438 a!3219) j!170)))))

(declare-fun b!1000398 () Bool)

(declare-fun res!669878 () Bool)

(assert (=> b!1000398 (=> (not res!669878) (not e!563875))))

(assert (=> b!1000398 (= res!669878 (validKeyInArray!0 k!2224))))

(declare-fun b!1000399 () Bool)

(assert (=> b!1000399 (= e!563875 e!563877)))

(declare-fun res!669875 () Bool)

(assert (=> b!1000399 (=> (not res!669875) (not e!563877))))

(declare-fun lt!442277 () SeekEntryResult!9370)

(assert (=> b!1000399 (= res!669875 (or (= lt!442277 (MissingVacant!9370 i!1194)) (= lt!442277 (MissingZero!9370 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63225 (_ BitVec 32)) SeekEntryResult!9370)

(assert (=> b!1000399 (= lt!442277 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000392 () Bool)

(declare-fun res!669877 () Bool)

(assert (=> b!1000392 (=> (not res!669877) (not e!563876))))

(assert (=> b!1000392 (= res!669877 (not (= lt!442275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30438 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30438 a!3219) i!1194 k!2224) j!170) (array!63226 (store (arr!30438 a!3219) i!1194 k!2224) (size!30940 a!3219)) mask!3464))))))

(declare-fun res!669871 () Bool)

(assert (=> start!86424 (=> (not res!669871) (not e!563875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86424 (= res!669871 (validMask!0 mask!3464))))

(assert (=> start!86424 e!563875))

(declare-fun array_inv!23562 (array!63225) Bool)

(assert (=> start!86424 (array_inv!23562 a!3219)))

(assert (=> start!86424 true))

(declare-fun b!1000400 () Bool)

(declare-fun res!669872 () Bool)

(assert (=> b!1000400 (=> (not res!669872) (not e!563876))))

(assert (=> b!1000400 (= res!669872 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30438 a!3219) j!170) a!3219 mask!3464) lt!442276))))

(declare-fun b!1000401 () Bool)

(declare-fun res!669869 () Bool)

(assert (=> b!1000401 (=> (not res!669869) (not e!563877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63225 (_ BitVec 32)) Bool)

(assert (=> b!1000401 (= res!669869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86424 res!669871) b!1000390))

(assert (= (and b!1000390 res!669873) b!1000397))

(assert (= (and b!1000397 res!669870) b!1000398))

(assert (= (and b!1000398 res!669878) b!1000395))

(assert (= (and b!1000395 res!669876) b!1000399))

(assert (= (and b!1000399 res!669875) b!1000401))

(assert (= (and b!1000401 res!669869) b!1000393))

(assert (= (and b!1000393 res!669868) b!1000391))

(assert (= (and b!1000391 res!669874) b!1000396))

(assert (= (and b!1000396 res!669879) b!1000400))

(assert (= (and b!1000400 res!669872) b!1000392))

(assert (= (and b!1000392 res!669877) b!1000394))

(declare-fun m!926559 () Bool)

(assert (=> start!86424 m!926559))

(declare-fun m!926561 () Bool)

(assert (=> start!86424 m!926561))

(declare-fun m!926563 () Bool)

(assert (=> b!1000400 m!926563))

(assert (=> b!1000400 m!926563))

(declare-fun m!926565 () Bool)

(assert (=> b!1000400 m!926565))

(declare-fun m!926567 () Bool)

(assert (=> b!1000399 m!926567))

(declare-fun m!926569 () Bool)

(assert (=> b!1000393 m!926569))

(assert (=> b!1000396 m!926563))

(assert (=> b!1000396 m!926563))

(declare-fun m!926571 () Bool)

(assert (=> b!1000396 m!926571))

(assert (=> b!1000396 m!926571))

(assert (=> b!1000396 m!926563))

(declare-fun m!926573 () Bool)

(assert (=> b!1000396 m!926573))

(declare-fun m!926575 () Bool)

(assert (=> b!1000401 m!926575))

(assert (=> b!1000397 m!926563))

(assert (=> b!1000397 m!926563))

(declare-fun m!926577 () Bool)

(assert (=> b!1000397 m!926577))

(declare-fun m!926579 () Bool)

(assert (=> b!1000398 m!926579))

(declare-fun m!926581 () Bool)

(assert (=> b!1000395 m!926581))

(declare-fun m!926583 () Bool)

(assert (=> b!1000392 m!926583))

(declare-fun m!926585 () Bool)

(assert (=> b!1000392 m!926585))

(assert (=> b!1000392 m!926585))

(declare-fun m!926587 () Bool)

(assert (=> b!1000392 m!926587))

(assert (=> b!1000392 m!926587))

(assert (=> b!1000392 m!926585))

(declare-fun m!926589 () Bool)

(assert (=> b!1000392 m!926589))

(push 1)

(assert (not b!1000397))

(assert (not start!86424))

(assert (not b!1000401))

(assert (not b!1000398))

(assert (not b!1000399))

(assert (not b!1000396))

(assert (not b!1000400))

(assert (not b!1000393))

(assert (not b!1000392))

