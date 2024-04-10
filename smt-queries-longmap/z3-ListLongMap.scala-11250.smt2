; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131170 () Bool)

(assert start!131170)

(declare-fun b!1538793 () Bool)

(declare-fun res!1055777 () Bool)

(declare-fun e!856074 () Bool)

(assert (=> b!1538793 (=> (not res!1055777) (not e!856074))))

(declare-datatypes ((array!102235 0))(
  ( (array!102236 (arr!49332 (Array (_ BitVec 32) (_ BitVec 64))) (size!49882 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102235)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538793 (= res!1055777 (validKeyInArray!0 (select (arr!49332 a!2792) j!64)))))

(declare-fun b!1538794 () Bool)

(declare-fun res!1055779 () Bool)

(assert (=> b!1538794 (=> (not res!1055779) (not e!856074))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538794 (= res!1055779 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49882 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49882 a!2792)) (= (select (arr!49332 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538795 () Bool)

(declare-fun res!1055773 () Bool)

(assert (=> b!1538795 (=> (not res!1055773) (not e!856074))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13458 0))(
  ( (MissingZero!13458 (index!56227 (_ BitVec 32))) (Found!13458 (index!56228 (_ BitVec 32))) (Intermediate!13458 (undefined!14270 Bool) (index!56229 (_ BitVec 32)) (x!137959 (_ BitVec 32))) (Undefined!13458) (MissingVacant!13458 (index!56230 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102235 (_ BitVec 32)) SeekEntryResult!13458)

(assert (=> b!1538795 (= res!1055773 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49332 a!2792) j!64) a!2792 mask!2480) (Found!13458 j!64)))))

(declare-fun b!1538796 () Bool)

(declare-fun res!1055778 () Bool)

(assert (=> b!1538796 (=> (not res!1055778) (not e!856074))))

(assert (=> b!1538796 (= res!1055778 (not (= (select (arr!49332 a!2792) index!463) (select (arr!49332 a!2792) j!64))))))

(declare-fun b!1538797 () Bool)

(declare-fun res!1055775 () Bool)

(assert (=> b!1538797 (=> (not res!1055775) (not e!856074))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538797 (= res!1055775 (validKeyInArray!0 (select (arr!49332 a!2792) i!951)))))

(declare-fun b!1538798 () Bool)

(declare-fun res!1055772 () Bool)

(assert (=> b!1538798 (=> (not res!1055772) (not e!856074))))

(assert (=> b!1538798 (= res!1055772 (and (= (size!49882 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49882 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49882 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538799 () Bool)

(declare-fun res!1055776 () Bool)

(assert (=> b!1538799 (=> (not res!1055776) (not e!856074))))

(declare-datatypes ((List!35806 0))(
  ( (Nil!35803) (Cons!35802 (h!37247 (_ BitVec 64)) (t!50500 List!35806)) )
))
(declare-fun arrayNoDuplicates!0 (array!102235 (_ BitVec 32) List!35806) Bool)

(assert (=> b!1538799 (= res!1055776 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35803))))

(declare-fun res!1055771 () Bool)

(assert (=> start!131170 (=> (not res!1055771) (not e!856074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131170 (= res!1055771 (validMask!0 mask!2480))))

(assert (=> start!131170 e!856074))

(assert (=> start!131170 true))

(declare-fun array_inv!38360 (array!102235) Bool)

(assert (=> start!131170 (array_inv!38360 a!2792)))

(declare-fun b!1538800 () Bool)

(assert (=> b!1538800 (= e!856074 false)))

(declare-fun lt!664939 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538800 (= lt!664939 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538801 () Bool)

(declare-fun res!1055774 () Bool)

(assert (=> b!1538801 (=> (not res!1055774) (not e!856074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102235 (_ BitVec 32)) Bool)

(assert (=> b!1538801 (= res!1055774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131170 res!1055771) b!1538798))

(assert (= (and b!1538798 res!1055772) b!1538797))

(assert (= (and b!1538797 res!1055775) b!1538793))

(assert (= (and b!1538793 res!1055777) b!1538801))

(assert (= (and b!1538801 res!1055774) b!1538799))

(assert (= (and b!1538799 res!1055776) b!1538794))

(assert (= (and b!1538794 res!1055779) b!1538795))

(assert (= (and b!1538795 res!1055773) b!1538796))

(assert (= (and b!1538796 res!1055778) b!1538800))

(declare-fun m!1421187 () Bool)

(assert (=> b!1538800 m!1421187))

(declare-fun m!1421189 () Bool)

(assert (=> b!1538797 m!1421189))

(assert (=> b!1538797 m!1421189))

(declare-fun m!1421191 () Bool)

(assert (=> b!1538797 m!1421191))

(declare-fun m!1421193 () Bool)

(assert (=> b!1538793 m!1421193))

(assert (=> b!1538793 m!1421193))

(declare-fun m!1421195 () Bool)

(assert (=> b!1538793 m!1421195))

(declare-fun m!1421197 () Bool)

(assert (=> b!1538796 m!1421197))

(assert (=> b!1538796 m!1421193))

(declare-fun m!1421199 () Bool)

(assert (=> b!1538801 m!1421199))

(declare-fun m!1421201 () Bool)

(assert (=> b!1538794 m!1421201))

(declare-fun m!1421203 () Bool)

(assert (=> start!131170 m!1421203))

(declare-fun m!1421205 () Bool)

(assert (=> start!131170 m!1421205))

(declare-fun m!1421207 () Bool)

(assert (=> b!1538799 m!1421207))

(assert (=> b!1538795 m!1421193))

(assert (=> b!1538795 m!1421193))

(declare-fun m!1421209 () Bool)

(assert (=> b!1538795 m!1421209))

(check-sat (not b!1538801) (not start!131170) (not b!1538800) (not b!1538799) (not b!1538795) (not b!1538797) (not b!1538793))
