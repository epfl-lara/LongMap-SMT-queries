; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120380 () Bool)

(assert start!120380)

(declare-fun b!1401278 () Bool)

(declare-fun e!793432 () Bool)

(declare-fun e!793430 () Bool)

(assert (=> b!1401278 (= e!793432 e!793430)))

(declare-fun res!939797 () Bool)

(assert (=> b!1401278 (=> res!939797 e!793430)))

(declare-datatypes ((array!95789 0))(
  ( (array!95790 (arr!46245 (Array (_ BitVec 32) (_ BitVec 64))) (size!46795 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95789)

(declare-fun lt!616821 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10562 0))(
  ( (MissingZero!10562 (index!44625 (_ BitVec 32))) (Found!10562 (index!44626 (_ BitVec 32))) (Intermediate!10562 (undefined!11374 Bool) (index!44627 (_ BitVec 32)) (x!126261 (_ BitVec 32))) (Undefined!10562) (MissingVacant!10562 (index!44628 (_ BitVec 32))) )
))
(declare-fun lt!616814 () SeekEntryResult!10562)

(declare-fun lt!616815 () SeekEntryResult!10562)

(assert (=> b!1401278 (= res!939797 (or (bvslt (x!126261 lt!616815) #b00000000000000000000000000000000) (bvsgt (x!126261 lt!616815) #b01111111111111111111111111111110) (bvslt (x!126261 lt!616814) #b00000000000000000000000000000000) (bvsgt (x!126261 lt!616814) #b01111111111111111111111111111110) (bvslt lt!616821 #b00000000000000000000000000000000) (bvsge lt!616821 (size!46795 a!2901)) (bvslt (index!44627 lt!616815) #b00000000000000000000000000000000) (bvsge (index!44627 lt!616815) (size!46795 a!2901)) (bvslt (index!44627 lt!616814) #b00000000000000000000000000000000) (bvsge (index!44627 lt!616814) (size!46795 a!2901)) (not (= lt!616815 (Intermediate!10562 false (index!44627 lt!616815) (x!126261 lt!616815)))) (not (= lt!616814 (Intermediate!10562 false (index!44627 lt!616814) (x!126261 lt!616814))))))))

(declare-fun e!793433 () Bool)

(assert (=> b!1401278 e!793433))

(declare-fun res!939795 () Bool)

(assert (=> b!1401278 (=> (not res!939795) (not e!793433))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401278 (= res!939795 (and (not (undefined!11374 lt!616814)) (= (index!44627 lt!616814) i!1037) (bvslt (x!126261 lt!616814) (x!126261 lt!616815)) (= (select (store (arr!46245 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44627 lt!616814)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47128 0))(
  ( (Unit!47129) )
))
(declare-fun lt!616817 () Unit!47128)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47128)

(assert (=> b!1401278 (= lt!616817 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616821 (x!126261 lt!616815) (index!44627 lt!616815) (x!126261 lt!616814) (index!44627 lt!616814) (undefined!11374 lt!616814) mask!2840))))

(declare-fun lt!616820 () (_ BitVec 64))

(declare-fun b!1401279 () Bool)

(declare-fun lt!616818 () array!95789)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95789 (_ BitVec 32)) SeekEntryResult!10562)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95789 (_ BitVec 32)) SeekEntryResult!10562)

(assert (=> b!1401279 (= e!793433 (= (seekEntryOrOpen!0 lt!616820 lt!616818 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126261 lt!616814) (index!44627 lt!616814) (index!44627 lt!616814) (select (arr!46245 a!2901) j!112) lt!616818 mask!2840)))))

(declare-fun b!1401280 () Bool)

(declare-fun res!939792 () Bool)

(declare-fun e!793436 () Bool)

(assert (=> b!1401280 (=> (not res!939792) (not e!793436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401280 (= res!939792 (validKeyInArray!0 (select (arr!46245 a!2901) i!1037)))))

(declare-fun b!1401281 () Bool)

(declare-fun res!939791 () Bool)

(assert (=> b!1401281 (=> (not res!939791) (not e!793436))))

(declare-datatypes ((List!32764 0))(
  ( (Nil!32761) (Cons!32760 (h!34008 (_ BitVec 64)) (t!47458 List!32764)) )
))
(declare-fun arrayNoDuplicates!0 (array!95789 (_ BitVec 32) List!32764) Bool)

(assert (=> b!1401281 (= res!939791 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32761))))

(declare-fun b!1401282 () Bool)

(declare-fun e!793431 () Bool)

(assert (=> b!1401282 (= e!793431 e!793432)))

(declare-fun res!939798 () Bool)

(assert (=> b!1401282 (=> res!939798 e!793432)))

(get-info :version)

(assert (=> b!1401282 (= res!939798 (or (= lt!616815 lt!616814) (not ((_ is Intermediate!10562) lt!616814))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95789 (_ BitVec 32)) SeekEntryResult!10562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401282 (= lt!616814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616820 mask!2840) lt!616820 lt!616818 mask!2840))))

(assert (=> b!1401282 (= lt!616820 (select (store (arr!46245 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401282 (= lt!616818 (array!95790 (store (arr!46245 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46795 a!2901)))))

(declare-fun b!1401283 () Bool)

(declare-fun res!939794 () Bool)

(assert (=> b!1401283 (=> (not res!939794) (not e!793436))))

(assert (=> b!1401283 (= res!939794 (and (= (size!46795 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46795 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46795 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401284 () Bool)

(declare-fun res!939789 () Bool)

(assert (=> b!1401284 (=> (not res!939789) (not e!793436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95789 (_ BitVec 32)) Bool)

(assert (=> b!1401284 (= res!939789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!939790 () Bool)

(assert (=> start!120380 (=> (not res!939790) (not e!793436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120380 (= res!939790 (validMask!0 mask!2840))))

(assert (=> start!120380 e!793436))

(assert (=> start!120380 true))

(declare-fun array_inv!35273 (array!95789) Bool)

(assert (=> start!120380 (array_inv!35273 a!2901)))

(declare-fun e!793434 () Bool)

(declare-fun b!1401285 () Bool)

(assert (=> b!1401285 (= e!793434 (= (seekEntryOrOpen!0 (select (arr!46245 a!2901) j!112) a!2901 mask!2840) (Found!10562 j!112)))))

(declare-fun b!1401286 () Bool)

(assert (=> b!1401286 (= e!793430 true)))

(declare-fun lt!616816 () SeekEntryResult!10562)

(assert (=> b!1401286 (= lt!616816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616821 lt!616820 lt!616818 mask!2840))))

(declare-fun b!1401287 () Bool)

(declare-fun res!939793 () Bool)

(assert (=> b!1401287 (=> (not res!939793) (not e!793436))))

(assert (=> b!1401287 (= res!939793 (validKeyInArray!0 (select (arr!46245 a!2901) j!112)))))

(declare-fun b!1401288 () Bool)

(assert (=> b!1401288 (= e!793436 (not e!793431))))

(declare-fun res!939799 () Bool)

(assert (=> b!1401288 (=> res!939799 e!793431)))

(assert (=> b!1401288 (= res!939799 (or (not ((_ is Intermediate!10562) lt!616815)) (undefined!11374 lt!616815)))))

(assert (=> b!1401288 e!793434))

(declare-fun res!939796 () Bool)

(assert (=> b!1401288 (=> (not res!939796) (not e!793434))))

(assert (=> b!1401288 (= res!939796 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616819 () Unit!47128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47128)

(assert (=> b!1401288 (= lt!616819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401288 (= lt!616815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616821 (select (arr!46245 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401288 (= lt!616821 (toIndex!0 (select (arr!46245 a!2901) j!112) mask!2840))))

(assert (= (and start!120380 res!939790) b!1401283))

(assert (= (and b!1401283 res!939794) b!1401280))

(assert (= (and b!1401280 res!939792) b!1401287))

(assert (= (and b!1401287 res!939793) b!1401284))

(assert (= (and b!1401284 res!939789) b!1401281))

(assert (= (and b!1401281 res!939791) b!1401288))

(assert (= (and b!1401288 res!939796) b!1401285))

(assert (= (and b!1401288 (not res!939799)) b!1401282))

(assert (= (and b!1401282 (not res!939798)) b!1401278))

(assert (= (and b!1401278 res!939795) b!1401279))

(assert (= (and b!1401278 (not res!939797)) b!1401286))

(declare-fun m!1289009 () Bool)

(assert (=> b!1401282 m!1289009))

(assert (=> b!1401282 m!1289009))

(declare-fun m!1289011 () Bool)

(assert (=> b!1401282 m!1289011))

(declare-fun m!1289013 () Bool)

(assert (=> b!1401282 m!1289013))

(declare-fun m!1289015 () Bool)

(assert (=> b!1401282 m!1289015))

(declare-fun m!1289017 () Bool)

(assert (=> start!120380 m!1289017))

(declare-fun m!1289019 () Bool)

(assert (=> start!120380 m!1289019))

(declare-fun m!1289021 () Bool)

(assert (=> b!1401284 m!1289021))

(declare-fun m!1289023 () Bool)

(assert (=> b!1401287 m!1289023))

(assert (=> b!1401287 m!1289023))

(declare-fun m!1289025 () Bool)

(assert (=> b!1401287 m!1289025))

(assert (=> b!1401278 m!1289013))

(declare-fun m!1289027 () Bool)

(assert (=> b!1401278 m!1289027))

(declare-fun m!1289029 () Bool)

(assert (=> b!1401278 m!1289029))

(assert (=> b!1401285 m!1289023))

(assert (=> b!1401285 m!1289023))

(declare-fun m!1289031 () Bool)

(assert (=> b!1401285 m!1289031))

(declare-fun m!1289033 () Bool)

(assert (=> b!1401280 m!1289033))

(assert (=> b!1401280 m!1289033))

(declare-fun m!1289035 () Bool)

(assert (=> b!1401280 m!1289035))

(declare-fun m!1289037 () Bool)

(assert (=> b!1401281 m!1289037))

(declare-fun m!1289039 () Bool)

(assert (=> b!1401279 m!1289039))

(assert (=> b!1401279 m!1289023))

(assert (=> b!1401279 m!1289023))

(declare-fun m!1289041 () Bool)

(assert (=> b!1401279 m!1289041))

(assert (=> b!1401288 m!1289023))

(declare-fun m!1289043 () Bool)

(assert (=> b!1401288 m!1289043))

(assert (=> b!1401288 m!1289023))

(assert (=> b!1401288 m!1289023))

(declare-fun m!1289045 () Bool)

(assert (=> b!1401288 m!1289045))

(declare-fun m!1289047 () Bool)

(assert (=> b!1401288 m!1289047))

(declare-fun m!1289049 () Bool)

(assert (=> b!1401288 m!1289049))

(declare-fun m!1289051 () Bool)

(assert (=> b!1401286 m!1289051))

(check-sat (not b!1401288) (not b!1401280) (not b!1401279) (not start!120380) (not b!1401286) (not b!1401285) (not b!1401281) (not b!1401282) (not b!1401284) (not b!1401278) (not b!1401287))
(check-sat)
