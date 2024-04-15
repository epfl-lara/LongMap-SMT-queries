; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130512 () Bool)

(assert start!130512)

(declare-fun res!1049365 () Bool)

(declare-fun e!853588 () Bool)

(assert (=> start!130512 (=> (not res!1049365) (not e!853588))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130512 (= res!1049365 (validMask!0 mask!2480))))

(assert (=> start!130512 e!853588))

(assert (=> start!130512 true))

(declare-datatypes ((array!101689 0))(
  ( (array!101690 (arr!49066 (Array (_ BitVec 32) (_ BitVec 64))) (size!49618 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101689)

(declare-fun array_inv!38299 (array!101689) Bool)

(assert (=> start!130512 (array_inv!38299 a!2792)))

(declare-fun b!1532040 () Bool)

(declare-fun res!1049366 () Bool)

(assert (=> b!1532040 (=> (not res!1049366) (not e!853588))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532040 (= res!1049366 (validKeyInArray!0 (select (arr!49066 a!2792) i!951)))))

(declare-fun b!1532041 () Bool)

(declare-fun res!1049367 () Bool)

(assert (=> b!1532041 (=> (not res!1049367) (not e!853588))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532041 (= res!1049367 (and (= (size!49618 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49618 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49618 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532042 () Bool)

(declare-fun res!1049368 () Bool)

(assert (=> b!1532042 (=> (not res!1049368) (not e!853588))))

(assert (=> b!1532042 (= res!1049368 (validKeyInArray!0 (select (arr!49066 a!2792) j!64)))))

(declare-fun b!1532043 () Bool)

(declare-fun res!1049364 () Bool)

(assert (=> b!1532043 (=> (not res!1049364) (not e!853588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101689 (_ BitVec 32)) Bool)

(assert (=> b!1532043 (= res!1049364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532044 () Bool)

(assert (=> b!1532044 (= e!853588 (bvsgt #b00000000000000000000000000000000 (size!49618 a!2792)))))

(assert (= (and start!130512 res!1049365) b!1532041))

(assert (= (and b!1532041 res!1049367) b!1532040))

(assert (= (and b!1532040 res!1049366) b!1532042))

(assert (= (and b!1532042 res!1049368) b!1532043))

(assert (= (and b!1532043 res!1049364) b!1532044))

(declare-fun m!1414193 () Bool)

(assert (=> start!130512 m!1414193))

(declare-fun m!1414195 () Bool)

(assert (=> start!130512 m!1414195))

(declare-fun m!1414197 () Bool)

(assert (=> b!1532040 m!1414197))

(assert (=> b!1532040 m!1414197))

(declare-fun m!1414199 () Bool)

(assert (=> b!1532040 m!1414199))

(declare-fun m!1414201 () Bool)

(assert (=> b!1532042 m!1414201))

(assert (=> b!1532042 m!1414201))

(declare-fun m!1414203 () Bool)

(assert (=> b!1532042 m!1414203))

(declare-fun m!1414205 () Bool)

(assert (=> b!1532043 m!1414205))

(check-sat (not b!1532043) (not start!130512) (not b!1532040) (not b!1532042))
(check-sat)
