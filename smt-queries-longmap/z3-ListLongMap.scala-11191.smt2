; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130728 () Bool)

(assert start!130728)

(declare-fun b!1533438 () Bool)

(declare-datatypes ((array!101824 0))(
  ( (array!101825 (arr!49129 (Array (_ BitVec 32) (_ BitVec 64))) (size!49681 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101824)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun e!854116 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533438 (= e!854116 (and (= (select (arr!49129 a!2792) index!463) (select (arr!49129 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533439 () Bool)

(declare-fun res!1050708 () Bool)

(assert (=> b!1533439 (=> (not res!1050708) (not e!854116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101824 (_ BitVec 32)) Bool)

(assert (=> b!1533439 (= res!1050708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533440 () Bool)

(declare-fun res!1050714 () Bool)

(assert (=> b!1533440 (=> (not res!1050714) (not e!854116))))

(declare-datatypes ((List!35681 0))(
  ( (Nil!35678) (Cons!35677 (h!37123 (_ BitVec 64)) (t!50367 List!35681)) )
))
(declare-fun arrayNoDuplicates!0 (array!101824 (_ BitVec 32) List!35681) Bool)

(assert (=> b!1533440 (= res!1050714 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35678))))

(declare-fun b!1533441 () Bool)

(declare-fun res!1050715 () Bool)

(assert (=> b!1533441 (=> (not res!1050715) (not e!854116))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533441 (= res!1050715 (and (= (size!49681 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49681 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49681 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050711 () Bool)

(assert (=> start!130728 (=> (not res!1050711) (not e!854116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130728 (= res!1050711 (validMask!0 mask!2480))))

(assert (=> start!130728 e!854116))

(assert (=> start!130728 true))

(declare-fun array_inv!38362 (array!101824) Bool)

(assert (=> start!130728 (array_inv!38362 a!2792)))

(declare-fun b!1533442 () Bool)

(declare-fun res!1050712 () Bool)

(assert (=> b!1533442 (=> (not res!1050712) (not e!854116))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533442 (= res!1050712 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49681 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49681 a!2792)) (= (select (arr!49129 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533443 () Bool)

(declare-fun res!1050709 () Bool)

(assert (=> b!1533443 (=> (not res!1050709) (not e!854116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533443 (= res!1050709 (validKeyInArray!0 (select (arr!49129 a!2792) j!64)))))

(declare-fun b!1533444 () Bool)

(declare-fun res!1050713 () Bool)

(assert (=> b!1533444 (=> (not res!1050713) (not e!854116))))

(declare-datatypes ((SeekEntryResult!13286 0))(
  ( (MissingZero!13286 (index!55539 (_ BitVec 32))) (Found!13286 (index!55540 (_ BitVec 32))) (Intermediate!13286 (undefined!14098 Bool) (index!55541 (_ BitVec 32)) (x!137307 (_ BitVec 32))) (Undefined!13286) (MissingVacant!13286 (index!55542 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101824 (_ BitVec 32)) SeekEntryResult!13286)

(assert (=> b!1533444 (= res!1050713 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49129 a!2792) j!64) a!2792 mask!2480) (Found!13286 j!64)))))

(declare-fun b!1533445 () Bool)

(declare-fun res!1050710 () Bool)

(assert (=> b!1533445 (=> (not res!1050710) (not e!854116))))

(assert (=> b!1533445 (= res!1050710 (validKeyInArray!0 (select (arr!49129 a!2792) i!951)))))

(assert (= (and start!130728 res!1050711) b!1533441))

(assert (= (and b!1533441 res!1050715) b!1533445))

(assert (= (and b!1533445 res!1050710) b!1533443))

(assert (= (and b!1533443 res!1050709) b!1533439))

(assert (= (and b!1533439 res!1050708) b!1533440))

(assert (= (and b!1533440 res!1050714) b!1533442))

(assert (= (and b!1533442 res!1050712) b!1533444))

(assert (= (and b!1533444 res!1050713) b!1533438))

(declare-fun m!1415555 () Bool)

(assert (=> b!1533444 m!1415555))

(assert (=> b!1533444 m!1415555))

(declare-fun m!1415557 () Bool)

(assert (=> b!1533444 m!1415557))

(declare-fun m!1415559 () Bool)

(assert (=> b!1533442 m!1415559))

(declare-fun m!1415561 () Bool)

(assert (=> b!1533445 m!1415561))

(assert (=> b!1533445 m!1415561))

(declare-fun m!1415563 () Bool)

(assert (=> b!1533445 m!1415563))

(assert (=> b!1533443 m!1415555))

(assert (=> b!1533443 m!1415555))

(declare-fun m!1415565 () Bool)

(assert (=> b!1533443 m!1415565))

(declare-fun m!1415567 () Bool)

(assert (=> b!1533438 m!1415567))

(assert (=> b!1533438 m!1415555))

(declare-fun m!1415569 () Bool)

(assert (=> b!1533440 m!1415569))

(declare-fun m!1415571 () Bool)

(assert (=> b!1533439 m!1415571))

(declare-fun m!1415573 () Bool)

(assert (=> start!130728 m!1415573))

(declare-fun m!1415575 () Bool)

(assert (=> start!130728 m!1415575))

(check-sat (not b!1533445) (not b!1533440) (not b!1533439) (not b!1533444) (not start!130728) (not b!1533443))
(check-sat)
