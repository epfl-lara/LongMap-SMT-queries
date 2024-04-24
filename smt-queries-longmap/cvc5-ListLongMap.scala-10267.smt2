; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120954 () Bool)

(assert start!120954)

(declare-fun b!1406340 () Bool)

(declare-fun e!796191 () Bool)

(assert (=> b!1406340 (= e!796191 (not true))))

(declare-fun e!796193 () Bool)

(assert (=> b!1406340 e!796193))

(declare-fun res!943878 () Bool)

(assert (=> b!1406340 (=> (not res!943878) (not e!796193))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96183 0))(
  ( (array!96184 (arr!46437 (Array (_ BitVec 32) (_ BitVec 64))) (size!46988 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96183)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96183 (_ BitVec 32)) Bool)

(assert (=> b!1406340 (= res!943878 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47303 0))(
  ( (Unit!47304) )
))
(declare-fun lt!619358 () Unit!47303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47303)

(assert (=> b!1406340 (= lt!619358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10651 0))(
  ( (MissingZero!10651 (index!44981 (_ BitVec 32))) (Found!10651 (index!44982 (_ BitVec 32))) (Intermediate!10651 (undefined!11463 Bool) (index!44983 (_ BitVec 32)) (x!126749 (_ BitVec 32))) (Undefined!10651) (MissingVacant!10651 (index!44984 (_ BitVec 32))) )
))
(declare-fun lt!619357 () SeekEntryResult!10651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406340 (= lt!619357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46437 a!2901) j!112) mask!2840) (select (arr!46437 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406342 () Bool)

(declare-fun res!943879 () Bool)

(assert (=> b!1406342 (=> (not res!943879) (not e!796191))))

(assert (=> b!1406342 (= res!943879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943874 () Bool)

(assert (=> start!120954 (=> (not res!943874) (not e!796191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120954 (= res!943874 (validMask!0 mask!2840))))

(assert (=> start!120954 e!796191))

(assert (=> start!120954 true))

(declare-fun array_inv!35718 (array!96183) Bool)

(assert (=> start!120954 (array_inv!35718 a!2901)))

(declare-fun b!1406341 () Bool)

(declare-fun res!943875 () Bool)

(assert (=> b!1406341 (=> (not res!943875) (not e!796191))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406341 (= res!943875 (and (= (size!46988 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46988 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46988 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406343 () Bool)

(declare-fun res!943873 () Bool)

(assert (=> b!1406343 (=> (not res!943873) (not e!796191))))

(declare-datatypes ((List!32943 0))(
  ( (Nil!32940) (Cons!32939 (h!34201 (_ BitVec 64)) (t!47629 List!32943)) )
))
(declare-fun arrayNoDuplicates!0 (array!96183 (_ BitVec 32) List!32943) Bool)

(assert (=> b!1406343 (= res!943873 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32940))))

(declare-fun b!1406344 () Bool)

(declare-fun res!943876 () Bool)

(assert (=> b!1406344 (=> (not res!943876) (not e!796191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406344 (= res!943876 (validKeyInArray!0 (select (arr!46437 a!2901) j!112)))))

(declare-fun b!1406345 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96183 (_ BitVec 32)) SeekEntryResult!10651)

(assert (=> b!1406345 (= e!796193 (= (seekEntryOrOpen!0 (select (arr!46437 a!2901) j!112) a!2901 mask!2840) (Found!10651 j!112)))))

(declare-fun b!1406346 () Bool)

(declare-fun res!943877 () Bool)

(assert (=> b!1406346 (=> (not res!943877) (not e!796191))))

(assert (=> b!1406346 (= res!943877 (validKeyInArray!0 (select (arr!46437 a!2901) i!1037)))))

(assert (= (and start!120954 res!943874) b!1406341))

(assert (= (and b!1406341 res!943875) b!1406346))

(assert (= (and b!1406346 res!943877) b!1406344))

(assert (= (and b!1406344 res!943876) b!1406342))

(assert (= (and b!1406342 res!943879) b!1406343))

(assert (= (and b!1406343 res!943873) b!1406340))

(assert (= (and b!1406340 res!943878) b!1406345))

(declare-fun m!1295297 () Bool)

(assert (=> b!1406342 m!1295297))

(declare-fun m!1295299 () Bool)

(assert (=> b!1406344 m!1295299))

(assert (=> b!1406344 m!1295299))

(declare-fun m!1295301 () Bool)

(assert (=> b!1406344 m!1295301))

(declare-fun m!1295303 () Bool)

(assert (=> b!1406343 m!1295303))

(declare-fun m!1295305 () Bool)

(assert (=> start!120954 m!1295305))

(declare-fun m!1295307 () Bool)

(assert (=> start!120954 m!1295307))

(assert (=> b!1406340 m!1295299))

(declare-fun m!1295309 () Bool)

(assert (=> b!1406340 m!1295309))

(assert (=> b!1406340 m!1295299))

(declare-fun m!1295311 () Bool)

(assert (=> b!1406340 m!1295311))

(assert (=> b!1406340 m!1295309))

(assert (=> b!1406340 m!1295299))

(declare-fun m!1295313 () Bool)

(assert (=> b!1406340 m!1295313))

(declare-fun m!1295315 () Bool)

(assert (=> b!1406340 m!1295315))

(declare-fun m!1295317 () Bool)

(assert (=> b!1406346 m!1295317))

(assert (=> b!1406346 m!1295317))

(declare-fun m!1295319 () Bool)

(assert (=> b!1406346 m!1295319))

(assert (=> b!1406345 m!1295299))

(assert (=> b!1406345 m!1295299))

(declare-fun m!1295321 () Bool)

(assert (=> b!1406345 m!1295321))

(push 1)

(assert (not b!1406343))

(assert (not start!120954))

(assert (not b!1406342))

(assert (not b!1406346))

(assert (not b!1406345))

(assert (not b!1406344))

(assert (not b!1406340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

