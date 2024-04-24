; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120230 () Bool)

(assert start!120230)

(declare-fun b!1398667 () Bool)

(declare-fun e!791917 () Bool)

(declare-fun e!791920 () Bool)

(assert (=> b!1398667 (= e!791917 (not e!791920))))

(declare-fun res!936904 () Bool)

(assert (=> b!1398667 (=> res!936904 e!791920)))

(declare-datatypes ((SeekEntryResult!10412 0))(
  ( (MissingZero!10412 (index!44019 (_ BitVec 32))) (Found!10412 (index!44020 (_ BitVec 32))) (Intermediate!10412 (undefined!11224 Bool) (index!44021 (_ BitVec 32)) (x!125829 (_ BitVec 32))) (Undefined!10412) (MissingVacant!10412 (index!44022 (_ BitVec 32))) )
))
(declare-fun lt!614674 () SeekEntryResult!10412)

(get-info :version)

(assert (=> b!1398667 (= res!936904 (or (not ((_ is Intermediate!10412) lt!614674)) (undefined!11224 lt!614674)))))

(declare-fun e!791921 () Bool)

(assert (=> b!1398667 e!791921))

(declare-fun res!936897 () Bool)

(assert (=> b!1398667 (=> (not res!936897) (not e!791921))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95681 0))(
  ( (array!95682 (arr!46192 (Array (_ BitVec 32) (_ BitVec 64))) (size!46743 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95681)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95681 (_ BitVec 32)) Bool)

(assert (=> b!1398667 (= res!936897 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46855 0))(
  ( (Unit!46856) )
))
(declare-fun lt!614670 () Unit!46855)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46855)

(assert (=> b!1398667 (= lt!614670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614669 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95681 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1398667 (= lt!614674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614669 (select (arr!46192 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398667 (= lt!614669 (toIndex!0 (select (arr!46192 a!2901) j!112) mask!2840))))

(declare-fun b!1398668 () Bool)

(declare-fun res!936903 () Bool)

(assert (=> b!1398668 (=> (not res!936903) (not e!791917))))

(declare-datatypes ((List!32698 0))(
  ( (Nil!32695) (Cons!32694 (h!33944 (_ BitVec 64)) (t!47384 List!32698)) )
))
(declare-fun arrayNoDuplicates!0 (array!95681 (_ BitVec 32) List!32698) Bool)

(assert (=> b!1398668 (= res!936903 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32695))))

(declare-fun b!1398669 () Bool)

(declare-fun res!936896 () Bool)

(assert (=> b!1398669 (=> (not res!936896) (not e!791917))))

(assert (=> b!1398669 (= res!936896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936901 () Bool)

(assert (=> start!120230 (=> (not res!936901) (not e!791917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120230 (= res!936901 (validMask!0 mask!2840))))

(assert (=> start!120230 e!791917))

(assert (=> start!120230 true))

(declare-fun array_inv!35473 (array!95681) Bool)

(assert (=> start!120230 (array_inv!35473 a!2901)))

(declare-fun b!1398670 () Bool)

(declare-fun res!936902 () Bool)

(assert (=> b!1398670 (=> (not res!936902) (not e!791917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398670 (= res!936902 (validKeyInArray!0 (select (arr!46192 a!2901) j!112)))))

(declare-fun b!1398671 () Bool)

(declare-fun res!936898 () Bool)

(assert (=> b!1398671 (=> (not res!936898) (not e!791917))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398671 (= res!936898 (and (= (size!46743 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46743 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46743 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398672 () Bool)

(declare-fun e!791919 () Bool)

(assert (=> b!1398672 (= e!791920 e!791919)))

(declare-fun res!936900 () Bool)

(assert (=> b!1398672 (=> res!936900 e!791919)))

(declare-fun lt!614675 () SeekEntryResult!10412)

(assert (=> b!1398672 (= res!936900 (or (= lt!614674 lt!614675) (not ((_ is Intermediate!10412) lt!614675)) (bvslt (x!125829 lt!614674) #b00000000000000000000000000000000) (bvsgt (x!125829 lt!614674) #b01111111111111111111111111111110) (bvslt lt!614669 #b00000000000000000000000000000000) (bvsge lt!614669 (size!46743 a!2901)) (bvslt (index!44021 lt!614674) #b00000000000000000000000000000000) (bvsge (index!44021 lt!614674) (size!46743 a!2901)) (not (= lt!614674 (Intermediate!10412 false (index!44021 lt!614674) (x!125829 lt!614674)))) (not (= lt!614675 (Intermediate!10412 (undefined!11224 lt!614675) (index!44021 lt!614675) (x!125829 lt!614675))))))))

(declare-fun lt!614672 () array!95681)

(declare-fun lt!614671 () (_ BitVec 64))

(assert (=> b!1398672 (= lt!614675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614671 mask!2840) lt!614671 lt!614672 mask!2840))))

(assert (=> b!1398672 (= lt!614671 (select (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398672 (= lt!614672 (array!95682 (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46743 a!2901)))))

(declare-fun b!1398673 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95681 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1398673 (= e!791921 (= (seekEntryOrOpen!0 (select (arr!46192 a!2901) j!112) a!2901 mask!2840) (Found!10412 j!112)))))

(declare-fun b!1398674 () Bool)

(assert (=> b!1398674 (= e!791919 true)))

(declare-fun lt!614673 () SeekEntryResult!10412)

(assert (=> b!1398674 (= lt!614673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614669 lt!614671 lt!614672 mask!2840))))

(declare-fun b!1398675 () Bool)

(declare-fun res!936899 () Bool)

(assert (=> b!1398675 (=> (not res!936899) (not e!791917))))

(assert (=> b!1398675 (= res!936899 (validKeyInArray!0 (select (arr!46192 a!2901) i!1037)))))

(assert (= (and start!120230 res!936901) b!1398671))

(assert (= (and b!1398671 res!936898) b!1398675))

(assert (= (and b!1398675 res!936899) b!1398670))

(assert (= (and b!1398670 res!936902) b!1398669))

(assert (= (and b!1398669 res!936896) b!1398668))

(assert (= (and b!1398668 res!936903) b!1398667))

(assert (= (and b!1398667 res!936897) b!1398673))

(assert (= (and b!1398667 (not res!936904)) b!1398672))

(assert (= (and b!1398672 (not res!936900)) b!1398674))

(declare-fun m!1285699 () Bool)

(assert (=> b!1398669 m!1285699))

(declare-fun m!1285701 () Bool)

(assert (=> b!1398673 m!1285701))

(assert (=> b!1398673 m!1285701))

(declare-fun m!1285703 () Bool)

(assert (=> b!1398673 m!1285703))

(declare-fun m!1285705 () Bool)

(assert (=> start!120230 m!1285705))

(declare-fun m!1285707 () Bool)

(assert (=> start!120230 m!1285707))

(declare-fun m!1285709 () Bool)

(assert (=> b!1398668 m!1285709))

(declare-fun m!1285711 () Bool)

(assert (=> b!1398672 m!1285711))

(assert (=> b!1398672 m!1285711))

(declare-fun m!1285713 () Bool)

(assert (=> b!1398672 m!1285713))

(declare-fun m!1285715 () Bool)

(assert (=> b!1398672 m!1285715))

(declare-fun m!1285717 () Bool)

(assert (=> b!1398672 m!1285717))

(declare-fun m!1285719 () Bool)

(assert (=> b!1398675 m!1285719))

(assert (=> b!1398675 m!1285719))

(declare-fun m!1285721 () Bool)

(assert (=> b!1398675 m!1285721))

(assert (=> b!1398670 m!1285701))

(assert (=> b!1398670 m!1285701))

(declare-fun m!1285723 () Bool)

(assert (=> b!1398670 m!1285723))

(assert (=> b!1398667 m!1285701))

(declare-fun m!1285725 () Bool)

(assert (=> b!1398667 m!1285725))

(assert (=> b!1398667 m!1285701))

(declare-fun m!1285727 () Bool)

(assert (=> b!1398667 m!1285727))

(assert (=> b!1398667 m!1285701))

(declare-fun m!1285729 () Bool)

(assert (=> b!1398667 m!1285729))

(declare-fun m!1285731 () Bool)

(assert (=> b!1398667 m!1285731))

(declare-fun m!1285733 () Bool)

(assert (=> b!1398674 m!1285733))

(check-sat (not b!1398667) (not b!1398672) (not b!1398669) (not b!1398673) (not b!1398668) (not b!1398670) (not b!1398674) (not start!120230) (not b!1398675))
(check-sat)
