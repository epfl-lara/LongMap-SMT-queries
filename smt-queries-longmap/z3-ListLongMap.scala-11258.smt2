; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131302 () Bool)

(assert start!131302)

(declare-fun res!1056510 () Bool)

(declare-fun e!856399 () Bool)

(assert (=> start!131302 (=> (not res!1056510) (not e!856399))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131302 (= res!1056510 (validMask!0 mask!2480))))

(assert (=> start!131302 e!856399))

(assert (=> start!131302 true))

(declare-datatypes ((array!102289 0))(
  ( (array!102290 (arr!49356 (Array (_ BitVec 32) (_ BitVec 64))) (size!49906 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102289)

(declare-fun array_inv!38384 (array!102289) Bool)

(assert (=> start!131302 (array_inv!38384 a!2792)))

(declare-fun b!1539711 () Bool)

(assert (=> b!1539711 (= e!856399 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun lt!665119 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539711 (= lt!665119 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539712 () Bool)

(declare-fun res!1056516 () Bool)

(assert (=> b!1539712 (=> (not res!1056516) (not e!856399))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539712 (= res!1056516 (validKeyInArray!0 (select (arr!49356 a!2792) j!64)))))

(declare-fun b!1539713 () Bool)

(declare-fun res!1056509 () Bool)

(assert (=> b!1539713 (=> (not res!1056509) (not e!856399))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539713 (= res!1056509 (and (= (size!49906 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49906 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49906 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539714 () Bool)

(declare-fun res!1056515 () Bool)

(assert (=> b!1539714 (=> (not res!1056515) (not e!856399))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1539714 (= res!1056515 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49906 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49906 a!2792)) (= (select (arr!49356 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539715 () Bool)

(declare-fun res!1056512 () Bool)

(assert (=> b!1539715 (=> (not res!1056512) (not e!856399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102289 (_ BitVec 32)) Bool)

(assert (=> b!1539715 (= res!1056512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539716 () Bool)

(declare-fun res!1056513 () Bool)

(assert (=> b!1539716 (=> (not res!1056513) (not e!856399))))

(declare-datatypes ((List!35830 0))(
  ( (Nil!35827) (Cons!35826 (h!37271 (_ BitVec 64)) (t!50524 List!35830)) )
))
(declare-fun arrayNoDuplicates!0 (array!102289 (_ BitVec 32) List!35830) Bool)

(assert (=> b!1539716 (= res!1056513 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35827))))

(declare-fun b!1539717 () Bool)

(declare-fun res!1056511 () Bool)

(assert (=> b!1539717 (=> (not res!1056511) (not e!856399))))

(declare-datatypes ((SeekEntryResult!13482 0))(
  ( (MissingZero!13482 (index!56323 (_ BitVec 32))) (Found!13482 (index!56324 (_ BitVec 32))) (Intermediate!13482 (undefined!14294 Bool) (index!56325 (_ BitVec 32)) (x!138059 (_ BitVec 32))) (Undefined!13482) (MissingVacant!13482 (index!56326 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102289 (_ BitVec 32)) SeekEntryResult!13482)

(assert (=> b!1539717 (= res!1056511 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49356 a!2792) j!64) a!2792 mask!2480) (Found!13482 j!64)))))

(declare-fun b!1539718 () Bool)

(declare-fun res!1056514 () Bool)

(assert (=> b!1539718 (=> (not res!1056514) (not e!856399))))

(assert (=> b!1539718 (= res!1056514 (validKeyInArray!0 (select (arr!49356 a!2792) i!951)))))

(declare-fun b!1539719 () Bool)

(declare-fun res!1056517 () Bool)

(assert (=> b!1539719 (=> (not res!1056517) (not e!856399))))

(assert (=> b!1539719 (= res!1056517 (not (= (select (arr!49356 a!2792) index!463) (select (arr!49356 a!2792) j!64))))))

(assert (= (and start!131302 res!1056510) b!1539713))

(assert (= (and b!1539713 res!1056509) b!1539718))

(assert (= (and b!1539718 res!1056514) b!1539712))

(assert (= (and b!1539712 res!1056516) b!1539715))

(assert (= (and b!1539715 res!1056512) b!1539716))

(assert (= (and b!1539716 res!1056513) b!1539714))

(assert (= (and b!1539714 res!1056515) b!1539717))

(assert (= (and b!1539717 res!1056511) b!1539719))

(assert (= (and b!1539719 res!1056517) b!1539711))

(declare-fun m!1421907 () Bool)

(assert (=> b!1539711 m!1421907))

(declare-fun m!1421909 () Bool)

(assert (=> b!1539712 m!1421909))

(assert (=> b!1539712 m!1421909))

(declare-fun m!1421911 () Bool)

(assert (=> b!1539712 m!1421911))

(assert (=> b!1539717 m!1421909))

(assert (=> b!1539717 m!1421909))

(declare-fun m!1421913 () Bool)

(assert (=> b!1539717 m!1421913))

(declare-fun m!1421915 () Bool)

(assert (=> b!1539715 m!1421915))

(declare-fun m!1421917 () Bool)

(assert (=> b!1539714 m!1421917))

(declare-fun m!1421919 () Bool)

(assert (=> b!1539719 m!1421919))

(assert (=> b!1539719 m!1421909))

(declare-fun m!1421921 () Bool)

(assert (=> b!1539718 m!1421921))

(assert (=> b!1539718 m!1421921))

(declare-fun m!1421923 () Bool)

(assert (=> b!1539718 m!1421923))

(declare-fun m!1421925 () Bool)

(assert (=> b!1539716 m!1421925))

(declare-fun m!1421927 () Bool)

(assert (=> start!131302 m!1421927))

(declare-fun m!1421929 () Bool)

(assert (=> start!131302 m!1421929))

(check-sat (not b!1539718) (not start!131302) (not b!1539712) (not b!1539711) (not b!1539717) (not b!1539715) (not b!1539716))
