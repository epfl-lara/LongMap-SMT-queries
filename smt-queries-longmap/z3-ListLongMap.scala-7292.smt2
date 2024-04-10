; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93176 () Bool)

(assert start!93176)

(declare-fun b!1056678 () Bool)

(declare-fun e!600778 () Bool)

(declare-fun e!600780 () Bool)

(assert (=> b!1056678 (= e!600778 e!600780)))

(declare-fun res!705422 () Bool)

(assert (=> b!1056678 (=> res!705422 e!600780)))

(declare-fun lt!466173 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056678 (= res!705422 (or (bvsgt lt!466173 i!1381) (bvsle i!1381 lt!466173)))))

(declare-fun b!1056679 () Bool)

(declare-fun e!600784 () Bool)

(declare-fun e!600783 () Bool)

(assert (=> b!1056679 (= e!600784 (not e!600783))))

(declare-fun res!705425 () Bool)

(assert (=> b!1056679 (=> res!705425 e!600783)))

(assert (=> b!1056679 (= res!705425 (or (bvsgt lt!466173 i!1381) (bvsle i!1381 lt!466173)))))

(assert (=> b!1056679 e!600778))

(declare-fun res!705424 () Bool)

(assert (=> b!1056679 (=> (not res!705424) (not e!600778))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66647 0))(
  ( (array!66648 (arr!32048 (Array (_ BitVec 32) (_ BitVec 64))) (size!32584 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66647)

(assert (=> b!1056679 (= res!705424 (= (select (store (arr!32048 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466173) k0!2747))))

(declare-fun b!1056680 () Bool)

(assert (=> b!1056680 (= e!600783 true)))

(declare-datatypes ((List!22360 0))(
  ( (Nil!22357) (Cons!22356 (h!23565 (_ BitVec 64)) (t!31667 List!22360)) )
))
(declare-fun arrayNoDuplicates!0 (array!66647 (_ BitVec 32) List!22360) Bool)

(assert (=> b!1056680 (arrayNoDuplicates!0 a!3488 lt!466173 Nil!22357)))

(declare-datatypes ((Unit!34618 0))(
  ( (Unit!34619) )
))
(declare-fun lt!466171 () Unit!34618)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66647 (_ BitVec 32) (_ BitVec 32)) Unit!34618)

(assert (=> b!1056680 (= lt!466171 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466173))))

(declare-fun b!1056681 () Bool)

(declare-fun res!705423 () Bool)

(declare-fun e!600779 () Bool)

(assert (=> b!1056681 (=> (not res!705423) (not e!600779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056681 (= res!705423 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056682 () Bool)

(declare-fun arrayContainsKey!0 (array!66647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056682 (= e!600780 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056683 () Bool)

(declare-fun res!705420 () Bool)

(assert (=> b!1056683 (=> (not res!705420) (not e!600779))))

(assert (=> b!1056683 (= res!705420 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22357))))

(declare-fun b!1056684 () Bool)

(declare-fun res!705428 () Bool)

(assert (=> b!1056684 (=> (not res!705428) (not e!600779))))

(assert (=> b!1056684 (= res!705428 (= (select (arr!32048 a!3488) i!1381) k0!2747))))

(declare-fun b!1056685 () Bool)

(declare-fun e!600781 () Bool)

(assert (=> b!1056685 (= e!600781 e!600784)))

(declare-fun res!705427 () Bool)

(assert (=> b!1056685 (=> (not res!705427) (not e!600784))))

(assert (=> b!1056685 (= res!705427 (not (= lt!466173 i!1381)))))

(declare-fun lt!466172 () array!66647)

(declare-fun arrayScanForKey!0 (array!66647 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056685 (= lt!466173 (arrayScanForKey!0 lt!466172 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!705421 () Bool)

(assert (=> start!93176 (=> (not res!705421) (not e!600779))))

(assert (=> start!93176 (= res!705421 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32584 a!3488)) (bvslt (size!32584 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93176 e!600779))

(assert (=> start!93176 true))

(declare-fun array_inv!24828 (array!66647) Bool)

(assert (=> start!93176 (array_inv!24828 a!3488)))

(declare-fun b!1056686 () Bool)

(assert (=> b!1056686 (= e!600779 e!600781)))

(declare-fun res!705426 () Bool)

(assert (=> b!1056686 (=> (not res!705426) (not e!600781))))

(assert (=> b!1056686 (= res!705426 (arrayContainsKey!0 lt!466172 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056686 (= lt!466172 (array!66648 (store (arr!32048 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32584 a!3488)))))

(assert (= (and start!93176 res!705421) b!1056683))

(assert (= (and b!1056683 res!705420) b!1056681))

(assert (= (and b!1056681 res!705423) b!1056684))

(assert (= (and b!1056684 res!705428) b!1056686))

(assert (= (and b!1056686 res!705426) b!1056685))

(assert (= (and b!1056685 res!705427) b!1056679))

(assert (= (and b!1056679 res!705424) b!1056678))

(assert (= (and b!1056678 (not res!705422)) b!1056682))

(assert (= (and b!1056679 (not res!705425)) b!1056680))

(declare-fun m!976473 () Bool)

(assert (=> start!93176 m!976473))

(declare-fun m!976475 () Bool)

(assert (=> b!1056682 m!976475))

(declare-fun m!976477 () Bool)

(assert (=> b!1056684 m!976477))

(declare-fun m!976479 () Bool)

(assert (=> b!1056681 m!976479))

(declare-fun m!976481 () Bool)

(assert (=> b!1056683 m!976481))

(declare-fun m!976483 () Bool)

(assert (=> b!1056680 m!976483))

(declare-fun m!976485 () Bool)

(assert (=> b!1056680 m!976485))

(declare-fun m!976487 () Bool)

(assert (=> b!1056679 m!976487))

(declare-fun m!976489 () Bool)

(assert (=> b!1056679 m!976489))

(declare-fun m!976491 () Bool)

(assert (=> b!1056685 m!976491))

(declare-fun m!976493 () Bool)

(assert (=> b!1056686 m!976493))

(assert (=> b!1056686 m!976487))

(check-sat (not b!1056685) (not start!93176) (not b!1056682) (not b!1056681) (not b!1056683) (not b!1056680) (not b!1056686))
(check-sat)
