; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130732 () Bool)

(assert start!130732)

(declare-datatypes ((array!101830 0))(
  ( (array!101831 (arr!49131 (Array (_ BitVec 32) (_ BitVec 64))) (size!49681 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101830)

(declare-fun b!1533217 () Bool)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun e!854176 () Bool)

(assert (=> b!1533217 (= e!854176 (and (= (select (arr!49131 a!2792) index!463) (select (arr!49131 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533218 () Bool)

(declare-fun res!1050309 () Bool)

(assert (=> b!1533218 (=> (not res!1050309) (not e!854176))))

(declare-datatypes ((List!35605 0))(
  ( (Nil!35602) (Cons!35601 (h!37046 (_ BitVec 64)) (t!50299 List!35605)) )
))
(declare-fun arrayNoDuplicates!0 (array!101830 (_ BitVec 32) List!35605) Bool)

(assert (=> b!1533218 (= res!1050309 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35602))))

(declare-fun res!1050310 () Bool)

(assert (=> start!130732 (=> (not res!1050310) (not e!854176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130732 (= res!1050310 (validMask!0 mask!2480))))

(assert (=> start!130732 e!854176))

(assert (=> start!130732 true))

(declare-fun array_inv!38159 (array!101830) Bool)

(assert (=> start!130732 (array_inv!38159 a!2792)))

(declare-fun b!1533219 () Bool)

(declare-fun res!1050307 () Bool)

(assert (=> b!1533219 (=> (not res!1050307) (not e!854176))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533219 (= res!1050307 (validKeyInArray!0 (select (arr!49131 a!2792) i!951)))))

(declare-fun b!1533220 () Bool)

(declare-fun res!1050304 () Bool)

(assert (=> b!1533220 (=> (not res!1050304) (not e!854176))))

(assert (=> b!1533220 (= res!1050304 (and (= (size!49681 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49681 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49681 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533221 () Bool)

(declare-fun res!1050305 () Bool)

(assert (=> b!1533221 (=> (not res!1050305) (not e!854176))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533221 (= res!1050305 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49681 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49681 a!2792)) (= (select (arr!49131 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533222 () Bool)

(declare-fun res!1050306 () Bool)

(assert (=> b!1533222 (=> (not res!1050306) (not e!854176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101830 (_ BitVec 32)) Bool)

(assert (=> b!1533222 (= res!1050306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533223 () Bool)

(declare-fun res!1050308 () Bool)

(assert (=> b!1533223 (=> (not res!1050308) (not e!854176))))

(declare-datatypes ((SeekEntryResult!13263 0))(
  ( (MissingZero!13263 (index!55447 (_ BitVec 32))) (Found!13263 (index!55448 (_ BitVec 32))) (Intermediate!13263 (undefined!14075 Bool) (index!55449 (_ BitVec 32)) (x!137225 (_ BitVec 32))) (Undefined!13263) (MissingVacant!13263 (index!55450 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101830 (_ BitVec 32)) SeekEntryResult!13263)

(assert (=> b!1533223 (= res!1050308 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49131 a!2792) j!64) a!2792 mask!2480) (Found!13263 j!64)))))

(declare-fun b!1533224 () Bool)

(declare-fun res!1050303 () Bool)

(assert (=> b!1533224 (=> (not res!1050303) (not e!854176))))

(assert (=> b!1533224 (= res!1050303 (validKeyInArray!0 (select (arr!49131 a!2792) j!64)))))

(assert (= (and start!130732 res!1050310) b!1533220))

(assert (= (and b!1533220 res!1050304) b!1533219))

(assert (= (and b!1533219 res!1050307) b!1533224))

(assert (= (and b!1533224 res!1050303) b!1533222))

(assert (= (and b!1533222 res!1050306) b!1533218))

(assert (= (and b!1533218 res!1050309) b!1533221))

(assert (= (and b!1533221 res!1050305) b!1533223))

(assert (= (and b!1533223 res!1050308) b!1533217))

(declare-fun m!1415923 () Bool)

(assert (=> b!1533217 m!1415923))

(declare-fun m!1415925 () Bool)

(assert (=> b!1533217 m!1415925))

(declare-fun m!1415927 () Bool)

(assert (=> b!1533219 m!1415927))

(assert (=> b!1533219 m!1415927))

(declare-fun m!1415929 () Bool)

(assert (=> b!1533219 m!1415929))

(assert (=> b!1533224 m!1415925))

(assert (=> b!1533224 m!1415925))

(declare-fun m!1415931 () Bool)

(assert (=> b!1533224 m!1415931))

(assert (=> b!1533223 m!1415925))

(assert (=> b!1533223 m!1415925))

(declare-fun m!1415933 () Bool)

(assert (=> b!1533223 m!1415933))

(declare-fun m!1415935 () Bool)

(assert (=> b!1533222 m!1415935))

(declare-fun m!1415937 () Bool)

(assert (=> start!130732 m!1415937))

(declare-fun m!1415939 () Bool)

(assert (=> start!130732 m!1415939))

(declare-fun m!1415941 () Bool)

(assert (=> b!1533218 m!1415941))

(declare-fun m!1415943 () Bool)

(assert (=> b!1533221 m!1415943))

(check-sat (not b!1533222) (not b!1533224) (not b!1533223) (not b!1533218) (not start!130732) (not b!1533219))
(check-sat)
