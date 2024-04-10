; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122590 () Bool)

(assert start!122590)

(declare-fun b!1419878 () Bool)

(declare-fun res!955312 () Bool)

(declare-fun e!803246 () Bool)

(assert (=> b!1419878 (=> (not res!955312) (not e!803246))))

(declare-datatypes ((array!96955 0))(
  ( (array!96956 (arr!46795 (Array (_ BitVec 32) (_ BitVec 64))) (size!47345 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96955)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419878 (= res!955312 (validKeyInArray!0 (select (arr!46795 a!2831) j!81)))))

(declare-fun b!1419879 () Bool)

(declare-fun res!955317 () Bool)

(assert (=> b!1419879 (=> (not res!955317) (not e!803246))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96955 (_ BitVec 32)) Bool)

(assert (=> b!1419879 (= res!955317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955311 () Bool)

(assert (=> start!122590 (=> (not res!955311) (not e!803246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122590 (= res!955311 (validMask!0 mask!2608))))

(assert (=> start!122590 e!803246))

(assert (=> start!122590 true))

(declare-fun array_inv!35823 (array!96955) Bool)

(assert (=> start!122590 (array_inv!35823 a!2831)))

(declare-fun b!1419880 () Bool)

(declare-fun res!955315 () Bool)

(assert (=> b!1419880 (=> (not res!955315) (not e!803246))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419880 (= res!955315 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47345 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47345 a!2831))))))

(declare-fun b!1419881 () Bool)

(declare-fun res!955318 () Bool)

(assert (=> b!1419881 (=> (not res!955318) (not e!803246))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419881 (= res!955318 (and (= (size!47345 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47345 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47345 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419882 () Bool)

(assert (=> b!1419882 (= e!803246 false)))

(declare-datatypes ((SeekEntryResult!11080 0))(
  ( (MissingZero!11080 (index!46712 (_ BitVec 32))) (Found!11080 (index!46713 (_ BitVec 32))) (Intermediate!11080 (undefined!11892 Bool) (index!46714 (_ BitVec 32)) (x!128378 (_ BitVec 32))) (Undefined!11080) (MissingVacant!11080 (index!46715 (_ BitVec 32))) )
))
(declare-fun lt!625863 () SeekEntryResult!11080)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96955 (_ BitVec 32)) SeekEntryResult!11080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419882 (= lt!625863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96956 (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47345 a!2831)) mask!2608))))

(declare-fun b!1419883 () Bool)

(declare-fun res!955316 () Bool)

(assert (=> b!1419883 (=> (not res!955316) (not e!803246))))

(assert (=> b!1419883 (= res!955316 (validKeyInArray!0 (select (arr!46795 a!2831) i!982)))))

(declare-fun b!1419884 () Bool)

(declare-fun res!955313 () Bool)

(assert (=> b!1419884 (=> (not res!955313) (not e!803246))))

(assert (=> b!1419884 (= res!955313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46795 a!2831) j!81) mask!2608) (select (arr!46795 a!2831) j!81) a!2831 mask!2608) (Intermediate!11080 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419885 () Bool)

(declare-fun res!955314 () Bool)

(assert (=> b!1419885 (=> (not res!955314) (not e!803246))))

(declare-datatypes ((List!33305 0))(
  ( (Nil!33302) (Cons!33301 (h!34603 (_ BitVec 64)) (t!47999 List!33305)) )
))
(declare-fun arrayNoDuplicates!0 (array!96955 (_ BitVec 32) List!33305) Bool)

(assert (=> b!1419885 (= res!955314 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33302))))

(assert (= (and start!122590 res!955311) b!1419881))

(assert (= (and b!1419881 res!955318) b!1419883))

(assert (= (and b!1419883 res!955316) b!1419878))

(assert (= (and b!1419878 res!955312) b!1419879))

(assert (= (and b!1419879 res!955317) b!1419885))

(assert (= (and b!1419885 res!955314) b!1419880))

(assert (= (and b!1419880 res!955315) b!1419884))

(assert (= (and b!1419884 res!955313) b!1419882))

(declare-fun m!1310345 () Bool)

(assert (=> b!1419882 m!1310345))

(declare-fun m!1310347 () Bool)

(assert (=> b!1419882 m!1310347))

(assert (=> b!1419882 m!1310347))

(declare-fun m!1310349 () Bool)

(assert (=> b!1419882 m!1310349))

(assert (=> b!1419882 m!1310349))

(assert (=> b!1419882 m!1310347))

(declare-fun m!1310351 () Bool)

(assert (=> b!1419882 m!1310351))

(declare-fun m!1310353 () Bool)

(assert (=> b!1419879 m!1310353))

(declare-fun m!1310355 () Bool)

(assert (=> b!1419883 m!1310355))

(assert (=> b!1419883 m!1310355))

(declare-fun m!1310357 () Bool)

(assert (=> b!1419883 m!1310357))

(declare-fun m!1310359 () Bool)

(assert (=> b!1419884 m!1310359))

(assert (=> b!1419884 m!1310359))

(declare-fun m!1310361 () Bool)

(assert (=> b!1419884 m!1310361))

(assert (=> b!1419884 m!1310361))

(assert (=> b!1419884 m!1310359))

(declare-fun m!1310363 () Bool)

(assert (=> b!1419884 m!1310363))

(declare-fun m!1310365 () Bool)

(assert (=> b!1419885 m!1310365))

(assert (=> b!1419878 m!1310359))

(assert (=> b!1419878 m!1310359))

(declare-fun m!1310367 () Bool)

(assert (=> b!1419878 m!1310367))

(declare-fun m!1310369 () Bool)

(assert (=> start!122590 m!1310369))

(declare-fun m!1310371 () Bool)

(assert (=> start!122590 m!1310371))

(push 1)

(assert (not b!1419882))

(assert (not b!1419884))

(assert (not start!122590))

(assert (not b!1419885))

(assert (not b!1419883))

(assert (not b!1419878))

(assert (not b!1419879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

