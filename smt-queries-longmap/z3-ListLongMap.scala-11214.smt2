; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130866 () Bool)

(assert start!130866)

(declare-fun b!1535260 () Bool)

(declare-fun res!1052534 () Bool)

(declare-fun e!854639 () Bool)

(assert (=> b!1535260 (=> (not res!1052534) (not e!854639))))

(declare-datatypes ((array!101962 0))(
  ( (array!101963 (arr!49198 (Array (_ BitVec 32) (_ BitVec 64))) (size!49750 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101962)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535260 (= res!1052534 (not (= (select (arr!49198 a!2792) index!463) (select (arr!49198 a!2792) j!64))))))

(declare-fun res!1052539 () Bool)

(assert (=> start!130866 (=> (not res!1052539) (not e!854639))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130866 (= res!1052539 (validMask!0 mask!2480))))

(assert (=> start!130866 e!854639))

(assert (=> start!130866 true))

(declare-fun array_inv!38431 (array!101962) Bool)

(assert (=> start!130866 (array_inv!38431 a!2792)))

(declare-fun b!1535261 () Bool)

(declare-fun res!1052538 () Bool)

(assert (=> b!1535261 (=> (not res!1052538) (not e!854639))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535261 (= res!1052538 (and (= (size!49750 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49750 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49750 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535262 () Bool)

(declare-fun res!1052533 () Bool)

(assert (=> b!1535262 (=> (not res!1052533) (not e!854639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535262 (= res!1052533 (validKeyInArray!0 (select (arr!49198 a!2792) i!951)))))

(declare-fun b!1535263 () Bool)

(declare-fun e!854641 () Bool)

(assert (=> b!1535263 (= e!854641 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13355 0))(
  ( (MissingZero!13355 (index!55815 (_ BitVec 32))) (Found!13355 (index!55816 (_ BitVec 32))) (Intermediate!13355 (undefined!14167 Bool) (index!55817 (_ BitVec 32)) (x!137560 (_ BitVec 32))) (Undefined!13355) (MissingVacant!13355 (index!55818 (_ BitVec 32))) )
))
(declare-fun lt!663800 () SeekEntryResult!13355)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!663801 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101962 (_ BitVec 32)) SeekEntryResult!13355)

(assert (=> b!1535263 (= lt!663800 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663801 vacantIndex!5 (select (arr!49198 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535264 () Bool)

(assert (=> b!1535264 (= e!854639 e!854641)))

(declare-fun res!1052536 () Bool)

(assert (=> b!1535264 (=> (not res!1052536) (not e!854641))))

(assert (=> b!1535264 (= res!1052536 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663801 #b00000000000000000000000000000000) (bvslt lt!663801 (size!49750 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535264 (= lt!663801 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535265 () Bool)

(declare-fun res!1052537 () Bool)

(assert (=> b!1535265 (=> (not res!1052537) (not e!854639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101962 (_ BitVec 32)) Bool)

(assert (=> b!1535265 (= res!1052537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535266 () Bool)

(declare-fun res!1052535 () Bool)

(assert (=> b!1535266 (=> (not res!1052535) (not e!854639))))

(assert (=> b!1535266 (= res!1052535 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49750 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49750 a!2792)) (= (select (arr!49198 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535267 () Bool)

(declare-fun res!1052532 () Bool)

(assert (=> b!1535267 (=> (not res!1052532) (not e!854639))))

(assert (=> b!1535267 (= res!1052532 (validKeyInArray!0 (select (arr!49198 a!2792) j!64)))))

(declare-fun b!1535268 () Bool)

(declare-fun res!1052531 () Bool)

(assert (=> b!1535268 (=> (not res!1052531) (not e!854639))))

(assert (=> b!1535268 (= res!1052531 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49198 a!2792) j!64) a!2792 mask!2480) (Found!13355 j!64)))))

(declare-fun b!1535269 () Bool)

(declare-fun res!1052530 () Bool)

(assert (=> b!1535269 (=> (not res!1052530) (not e!854639))))

(declare-datatypes ((List!35750 0))(
  ( (Nil!35747) (Cons!35746 (h!37192 (_ BitVec 64)) (t!50436 List!35750)) )
))
(declare-fun arrayNoDuplicates!0 (array!101962 (_ BitVec 32) List!35750) Bool)

(assert (=> b!1535269 (= res!1052530 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35747))))

(assert (= (and start!130866 res!1052539) b!1535261))

(assert (= (and b!1535261 res!1052538) b!1535262))

(assert (= (and b!1535262 res!1052533) b!1535267))

(assert (= (and b!1535267 res!1052532) b!1535265))

(assert (= (and b!1535265 res!1052537) b!1535269))

(assert (= (and b!1535269 res!1052530) b!1535266))

(assert (= (and b!1535266 res!1052535) b!1535268))

(assert (= (and b!1535268 res!1052531) b!1535260))

(assert (= (and b!1535260 res!1052534) b!1535264))

(assert (= (and b!1535264 res!1052536) b!1535263))

(declare-fun m!1417181 () Bool)

(assert (=> start!130866 m!1417181))

(declare-fun m!1417183 () Bool)

(assert (=> start!130866 m!1417183))

(declare-fun m!1417185 () Bool)

(assert (=> b!1535260 m!1417185))

(declare-fun m!1417187 () Bool)

(assert (=> b!1535260 m!1417187))

(declare-fun m!1417189 () Bool)

(assert (=> b!1535264 m!1417189))

(declare-fun m!1417191 () Bool)

(assert (=> b!1535269 m!1417191))

(declare-fun m!1417193 () Bool)

(assert (=> b!1535266 m!1417193))

(assert (=> b!1535267 m!1417187))

(assert (=> b!1535267 m!1417187))

(declare-fun m!1417195 () Bool)

(assert (=> b!1535267 m!1417195))

(assert (=> b!1535263 m!1417187))

(assert (=> b!1535263 m!1417187))

(declare-fun m!1417197 () Bool)

(assert (=> b!1535263 m!1417197))

(declare-fun m!1417199 () Bool)

(assert (=> b!1535265 m!1417199))

(assert (=> b!1535268 m!1417187))

(assert (=> b!1535268 m!1417187))

(declare-fun m!1417201 () Bool)

(assert (=> b!1535268 m!1417201))

(declare-fun m!1417203 () Bool)

(assert (=> b!1535262 m!1417203))

(assert (=> b!1535262 m!1417203))

(declare-fun m!1417205 () Bool)

(assert (=> b!1535262 m!1417205))

(check-sat (not start!130866) (not b!1535263) (not b!1535262) (not b!1535265) (not b!1535268) (not b!1535269) (not b!1535267) (not b!1535264))
(check-sat)
