; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122652 () Bool)

(assert start!122652)

(declare-fun b!1420743 () Bool)

(declare-fun res!956180 () Bool)

(declare-fun e!803482 () Bool)

(assert (=> b!1420743 (=> (not res!956180) (not e!803482))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97017 0))(
  ( (array!97018 (arr!46826 (Array (_ BitVec 32) (_ BitVec 64))) (size!47376 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97017)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420743 (= res!956180 (and (= (size!47376 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47376 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47376 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420744 () Bool)

(declare-fun res!956176 () Bool)

(assert (=> b!1420744 (=> (not res!956176) (not e!803482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420744 (= res!956176 (validKeyInArray!0 (select (arr!46826 a!2831) j!81)))))

(declare-fun b!1420746 () Bool)

(declare-fun res!956183 () Bool)

(assert (=> b!1420746 (=> (not res!956183) (not e!803482))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420746 (= res!956183 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47376 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47376 a!2831))))))

(declare-fun b!1420747 () Bool)

(declare-fun res!956181 () Bool)

(assert (=> b!1420747 (=> (not res!956181) (not e!803482))))

(declare-datatypes ((List!33336 0))(
  ( (Nil!33333) (Cons!33332 (h!34634 (_ BitVec 64)) (t!48030 List!33336)) )
))
(declare-fun arrayNoDuplicates!0 (array!97017 (_ BitVec 32) List!33336) Bool)

(assert (=> b!1420747 (= res!956181 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33333))))

(declare-fun b!1420748 () Bool)

(declare-fun e!803483 () Bool)

(declare-fun e!803480 () Bool)

(assert (=> b!1420748 (= e!803483 e!803480)))

(declare-fun res!956185 () Bool)

(assert (=> b!1420748 (=> (not res!956185) (not e!803480))))

(declare-fun lt!625982 () array!97017)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!625980 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11111 0))(
  ( (MissingZero!11111 (index!46836 (_ BitVec 32))) (Found!11111 (index!46837 (_ BitVec 32))) (Intermediate!11111 (undefined!11923 Bool) (index!46838 (_ BitVec 32)) (x!128497 (_ BitVec 32))) (Undefined!11111) (MissingVacant!11111 (index!46839 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97017 (_ BitVec 32)) SeekEntryResult!11111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420748 (= res!956185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625980 mask!2608) lt!625980 lt!625982 mask!2608) (Intermediate!11111 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420748 (= lt!625980 (select (store (arr!46826 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420748 (= lt!625982 (array!97018 (store (arr!46826 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47376 a!2831)))))

(declare-fun b!1420749 () Bool)

(declare-fun res!956184 () Bool)

(assert (=> b!1420749 (=> (not res!956184) (not e!803482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97017 (_ BitVec 32)) Bool)

(assert (=> b!1420749 (= res!956184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420750 () Bool)

(declare-fun res!956178 () Bool)

(assert (=> b!1420750 (=> (not res!956178) (not e!803482))))

(assert (=> b!1420750 (= res!956178 (validKeyInArray!0 (select (arr!46826 a!2831) i!982)))))

(declare-fun b!1420751 () Bool)

(assert (=> b!1420751 (= e!803480 false)))

(declare-fun lt!625981 () SeekEntryResult!11111)

(assert (=> b!1420751 (= lt!625981 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625980 lt!625982 mask!2608))))

(declare-fun b!1420752 () Bool)

(assert (=> b!1420752 (= e!803482 e!803483)))

(declare-fun res!956182 () Bool)

(assert (=> b!1420752 (=> (not res!956182) (not e!803483))))

(declare-fun lt!625983 () SeekEntryResult!11111)

(assert (=> b!1420752 (= res!956182 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46826 a!2831) j!81) mask!2608) (select (arr!46826 a!2831) j!81) a!2831 mask!2608) lt!625983))))

(assert (=> b!1420752 (= lt!625983 (Intermediate!11111 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!956179 () Bool)

(assert (=> start!122652 (=> (not res!956179) (not e!803482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122652 (= res!956179 (validMask!0 mask!2608))))

(assert (=> start!122652 e!803482))

(assert (=> start!122652 true))

(declare-fun array_inv!35854 (array!97017) Bool)

(assert (=> start!122652 (array_inv!35854 a!2831)))

(declare-fun b!1420745 () Bool)

(declare-fun res!956177 () Bool)

(assert (=> b!1420745 (=> (not res!956177) (not e!803480))))

(assert (=> b!1420745 (= res!956177 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46826 a!2831) j!81) a!2831 mask!2608) lt!625983))))

(assert (= (and start!122652 res!956179) b!1420743))

(assert (= (and b!1420743 res!956180) b!1420750))

(assert (= (and b!1420750 res!956178) b!1420744))

(assert (= (and b!1420744 res!956176) b!1420749))

(assert (= (and b!1420749 res!956184) b!1420747))

(assert (= (and b!1420747 res!956181) b!1420746))

(assert (= (and b!1420746 res!956183) b!1420752))

(assert (= (and b!1420752 res!956182) b!1420748))

(assert (= (and b!1420748 res!956185) b!1420745))

(assert (= (and b!1420745 res!956177) b!1420751))

(declare-fun m!1311267 () Bool)

(assert (=> b!1420747 m!1311267))

(declare-fun m!1311269 () Bool)

(assert (=> start!122652 m!1311269))

(declare-fun m!1311271 () Bool)

(assert (=> start!122652 m!1311271))

(declare-fun m!1311273 () Bool)

(assert (=> b!1420751 m!1311273))

(declare-fun m!1311275 () Bool)

(assert (=> b!1420744 m!1311275))

(assert (=> b!1420744 m!1311275))

(declare-fun m!1311277 () Bool)

(assert (=> b!1420744 m!1311277))

(declare-fun m!1311279 () Bool)

(assert (=> b!1420749 m!1311279))

(declare-fun m!1311281 () Bool)

(assert (=> b!1420748 m!1311281))

(assert (=> b!1420748 m!1311281))

(declare-fun m!1311283 () Bool)

(assert (=> b!1420748 m!1311283))

(declare-fun m!1311285 () Bool)

(assert (=> b!1420748 m!1311285))

(declare-fun m!1311287 () Bool)

(assert (=> b!1420748 m!1311287))

(declare-fun m!1311289 () Bool)

(assert (=> b!1420750 m!1311289))

(assert (=> b!1420750 m!1311289))

(declare-fun m!1311291 () Bool)

(assert (=> b!1420750 m!1311291))

(assert (=> b!1420745 m!1311275))

(assert (=> b!1420745 m!1311275))

(declare-fun m!1311293 () Bool)

(assert (=> b!1420745 m!1311293))

(assert (=> b!1420752 m!1311275))

(assert (=> b!1420752 m!1311275))

(declare-fun m!1311295 () Bool)

(assert (=> b!1420752 m!1311295))

(assert (=> b!1420752 m!1311295))

(assert (=> b!1420752 m!1311275))

(declare-fun m!1311297 () Bool)

(assert (=> b!1420752 m!1311297))

(push 1)

