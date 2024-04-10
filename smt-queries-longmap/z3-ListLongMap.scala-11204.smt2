; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130858 () Bool)

(assert start!130858)

(declare-fun b!1534704 () Bool)

(declare-fun res!1051790 () Bool)

(declare-fun e!854576 () Bool)

(assert (=> b!1534704 (=> (not res!1051790) (not e!854576))))

(declare-datatypes ((array!101956 0))(
  ( (array!101957 (arr!49194 (Array (_ BitVec 32) (_ BitVec 64))) (size!49744 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101956)

(declare-datatypes ((List!35668 0))(
  ( (Nil!35665) (Cons!35664 (h!37109 (_ BitVec 64)) (t!50362 List!35668)) )
))
(declare-fun arrayNoDuplicates!0 (array!101956 (_ BitVec 32) List!35668) Bool)

(assert (=> b!1534704 (= res!1051790 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35665))))

(declare-fun b!1534705 () Bool)

(declare-fun res!1051796 () Bool)

(assert (=> b!1534705 (=> (not res!1051796) (not e!854576))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534705 (= res!1051796 (not (= (select (arr!49194 a!2792) index!463) (select (arr!49194 a!2792) j!64))))))

(declare-fun b!1534706 () Bool)

(declare-fun res!1051793 () Bool)

(assert (=> b!1534706 (=> (not res!1051793) (not e!854576))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534706 (= res!1051793 (and (= (size!49744 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49744 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49744 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534707 () Bool)

(declare-fun res!1051794 () Bool)

(assert (=> b!1534707 (=> (not res!1051794) (not e!854576))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1534707 (= res!1051794 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49744 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49744 a!2792)) (= (select (arr!49194 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534708 () Bool)

(declare-fun e!854578 () Bool)

(assert (=> b!1534708 (= e!854578 false)))

(declare-datatypes ((SeekEntryResult!13326 0))(
  ( (MissingZero!13326 (index!55699 (_ BitVec 32))) (Found!13326 (index!55700 (_ BitVec 32))) (Intermediate!13326 (undefined!14138 Bool) (index!55701 (_ BitVec 32)) (x!137456 (_ BitVec 32))) (Undefined!13326) (MissingVacant!13326 (index!55702 (_ BitVec 32))) )
))
(declare-fun lt!663913 () SeekEntryResult!13326)

(declare-fun lt!663912 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101956 (_ BitVec 32)) SeekEntryResult!13326)

(assert (=> b!1534708 (= lt!663913 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663912 vacantIndex!5 (select (arr!49194 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1051792 () Bool)

(assert (=> start!130858 (=> (not res!1051792) (not e!854576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130858 (= res!1051792 (validMask!0 mask!2480))))

(assert (=> start!130858 e!854576))

(assert (=> start!130858 true))

(declare-fun array_inv!38222 (array!101956) Bool)

(assert (=> start!130858 (array_inv!38222 a!2792)))

(declare-fun b!1534703 () Bool)

(declare-fun res!1051789 () Bool)

(assert (=> b!1534703 (=> (not res!1051789) (not e!854576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101956 (_ BitVec 32)) Bool)

(assert (=> b!1534703 (= res!1051789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534709 () Bool)

(declare-fun res!1051795 () Bool)

(assert (=> b!1534709 (=> (not res!1051795) (not e!854576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534709 (= res!1051795 (validKeyInArray!0 (select (arr!49194 a!2792) j!64)))))

(declare-fun b!1534710 () Bool)

(declare-fun res!1051797 () Bool)

(assert (=> b!1534710 (=> (not res!1051797) (not e!854576))))

(assert (=> b!1534710 (= res!1051797 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49194 a!2792) j!64) a!2792 mask!2480) (Found!13326 j!64)))))

(declare-fun b!1534711 () Bool)

(declare-fun res!1051791 () Bool)

(assert (=> b!1534711 (=> (not res!1051791) (not e!854576))))

(assert (=> b!1534711 (= res!1051791 (validKeyInArray!0 (select (arr!49194 a!2792) i!951)))))

(declare-fun b!1534712 () Bool)

(assert (=> b!1534712 (= e!854576 e!854578)))

(declare-fun res!1051798 () Bool)

(assert (=> b!1534712 (=> (not res!1051798) (not e!854578))))

(assert (=> b!1534712 (= res!1051798 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663912 #b00000000000000000000000000000000) (bvslt lt!663912 (size!49744 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534712 (= lt!663912 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130858 res!1051792) b!1534706))

(assert (= (and b!1534706 res!1051793) b!1534711))

(assert (= (and b!1534711 res!1051791) b!1534709))

(assert (= (and b!1534709 res!1051795) b!1534703))

(assert (= (and b!1534703 res!1051789) b!1534704))

(assert (= (and b!1534704 res!1051790) b!1534707))

(assert (= (and b!1534707 res!1051794) b!1534710))

(assert (= (and b!1534710 res!1051797) b!1534705))

(assert (= (and b!1534705 res!1051796) b!1534712))

(assert (= (and b!1534712 res!1051798) b!1534708))

(declare-fun m!1417319 () Bool)

(assert (=> b!1534711 m!1417319))

(assert (=> b!1534711 m!1417319))

(declare-fun m!1417321 () Bool)

(assert (=> b!1534711 m!1417321))

(declare-fun m!1417323 () Bool)

(assert (=> b!1534710 m!1417323))

(assert (=> b!1534710 m!1417323))

(declare-fun m!1417325 () Bool)

(assert (=> b!1534710 m!1417325))

(declare-fun m!1417327 () Bool)

(assert (=> b!1534704 m!1417327))

(declare-fun m!1417329 () Bool)

(assert (=> b!1534703 m!1417329))

(declare-fun m!1417331 () Bool)

(assert (=> b!1534707 m!1417331))

(declare-fun m!1417333 () Bool)

(assert (=> start!130858 m!1417333))

(declare-fun m!1417335 () Bool)

(assert (=> start!130858 m!1417335))

(assert (=> b!1534709 m!1417323))

(assert (=> b!1534709 m!1417323))

(declare-fun m!1417337 () Bool)

(assert (=> b!1534709 m!1417337))

(declare-fun m!1417339 () Bool)

(assert (=> b!1534712 m!1417339))

(declare-fun m!1417341 () Bool)

(assert (=> b!1534705 m!1417341))

(assert (=> b!1534705 m!1417323))

(assert (=> b!1534708 m!1417323))

(assert (=> b!1534708 m!1417323))

(declare-fun m!1417343 () Bool)

(assert (=> b!1534708 m!1417343))

(check-sat (not start!130858) (not b!1534711) (not b!1534704) (not b!1534708) (not b!1534703) (not b!1534712) (not b!1534709) (not b!1534710))
(check-sat)
