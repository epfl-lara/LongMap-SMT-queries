; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122432 () Bool)

(assert start!122432)

(declare-fun b!1418661 () Bool)

(declare-fun res!954272 () Bool)

(declare-fun e!802799 () Bool)

(assert (=> b!1418661 (=> (not res!954272) (not e!802799))))

(declare-datatypes ((array!96875 0))(
  ( (array!96876 (arr!46758 (Array (_ BitVec 32) (_ BitVec 64))) (size!47308 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96875)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418661 (= res!954272 (validKeyInArray!0 (select (arr!46758 a!2831) i!982)))))

(declare-fun b!1418662 () Bool)

(assert (=> b!1418662 (= e!802799 false)))

(declare-fun lt!625647 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418662 (= lt!625647 (toIndex!0 (select (arr!46758 a!2831) j!81) mask!2608))))

(declare-fun b!1418663 () Bool)

(declare-fun res!954270 () Bool)

(assert (=> b!1418663 (=> (not res!954270) (not e!802799))))

(assert (=> b!1418663 (= res!954270 (validKeyInArray!0 (select (arr!46758 a!2831) j!81)))))

(declare-fun res!954268 () Bool)

(assert (=> start!122432 (=> (not res!954268) (not e!802799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122432 (= res!954268 (validMask!0 mask!2608))))

(assert (=> start!122432 e!802799))

(assert (=> start!122432 true))

(declare-fun array_inv!35786 (array!96875) Bool)

(assert (=> start!122432 (array_inv!35786 a!2831)))

(declare-fun b!1418664 () Bool)

(declare-fun res!954271 () Bool)

(assert (=> b!1418664 (=> (not res!954271) (not e!802799))))

(declare-datatypes ((List!33268 0))(
  ( (Nil!33265) (Cons!33264 (h!34560 (_ BitVec 64)) (t!47962 List!33268)) )
))
(declare-fun arrayNoDuplicates!0 (array!96875 (_ BitVec 32) List!33268) Bool)

(assert (=> b!1418664 (= res!954271 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33265))))

(declare-fun b!1418665 () Bool)

(declare-fun res!954269 () Bool)

(assert (=> b!1418665 (=> (not res!954269) (not e!802799))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418665 (= res!954269 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47308 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47308 a!2831))))))

(declare-fun b!1418666 () Bool)

(declare-fun res!954273 () Bool)

(assert (=> b!1418666 (=> (not res!954273) (not e!802799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96875 (_ BitVec 32)) Bool)

(assert (=> b!1418666 (= res!954273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418667 () Bool)

(declare-fun res!954274 () Bool)

(assert (=> b!1418667 (=> (not res!954274) (not e!802799))))

(assert (=> b!1418667 (= res!954274 (and (= (size!47308 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47308 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47308 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122432 res!954268) b!1418667))

(assert (= (and b!1418667 res!954274) b!1418661))

(assert (= (and b!1418661 res!954272) b!1418663))

(assert (= (and b!1418663 res!954270) b!1418666))

(assert (= (and b!1418666 res!954273) b!1418664))

(assert (= (and b!1418664 res!954271) b!1418665))

(assert (= (and b!1418665 res!954269) b!1418662))

(declare-fun m!1309293 () Bool)

(assert (=> b!1418661 m!1309293))

(assert (=> b!1418661 m!1309293))

(declare-fun m!1309295 () Bool)

(assert (=> b!1418661 m!1309295))

(declare-fun m!1309297 () Bool)

(assert (=> start!122432 m!1309297))

(declare-fun m!1309299 () Bool)

(assert (=> start!122432 m!1309299))

(declare-fun m!1309301 () Bool)

(assert (=> b!1418664 m!1309301))

(declare-fun m!1309303 () Bool)

(assert (=> b!1418662 m!1309303))

(assert (=> b!1418662 m!1309303))

(declare-fun m!1309305 () Bool)

(assert (=> b!1418662 m!1309305))

(assert (=> b!1418663 m!1309303))

(assert (=> b!1418663 m!1309303))

(declare-fun m!1309307 () Bool)

(assert (=> b!1418663 m!1309307))

(declare-fun m!1309309 () Bool)

(assert (=> b!1418666 m!1309309))

(check-sat (not b!1418661) (not b!1418666) (not start!122432) (not b!1418664) (not b!1418662) (not b!1418663))
