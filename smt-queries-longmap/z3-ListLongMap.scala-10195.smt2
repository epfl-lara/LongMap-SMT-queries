; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120284 () Bool)

(assert start!120284)

(declare-fun res!937635 () Bool)

(declare-fun e!792329 () Bool)

(assert (=> start!120284 (=> (not res!937635) (not e!792329))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120284 (= res!937635 (validMask!0 mask!2840))))

(assert (=> start!120284 e!792329))

(assert (=> start!120284 true))

(declare-datatypes ((array!95735 0))(
  ( (array!95736 (arr!46219 (Array (_ BitVec 32) (_ BitVec 64))) (size!46770 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95735)

(declare-fun array_inv!35500 (array!95735) Bool)

(assert (=> start!120284 (array_inv!35500 a!2901)))

(declare-fun b!1399398 () Bool)

(declare-fun e!792324 () Bool)

(declare-fun e!792325 () Bool)

(assert (=> b!1399398 (= e!792324 e!792325)))

(declare-fun res!937628 () Bool)

(assert (=> b!1399398 (=> res!937628 e!792325)))

(assert (=> b!1399398 (= res!937628 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10439 0))(
  ( (MissingZero!10439 (index!44127 (_ BitVec 32))) (Found!10439 (index!44128 (_ BitVec 32))) (Intermediate!10439 (undefined!11251 Bool) (index!44129 (_ BitVec 32)) (x!125928 (_ BitVec 32))) (Undefined!10439) (MissingVacant!10439 (index!44130 (_ BitVec 32))) )
))
(declare-fun lt!615207 () SeekEntryResult!10439)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615212 () SeekEntryResult!10439)

(assert (=> b!1399398 (and (not (undefined!11251 lt!615212)) (= (index!44129 lt!615212) i!1037) (bvslt (x!125928 lt!615212) (x!125928 lt!615207)) (= (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44129 lt!615212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615210 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!46909 0))(
  ( (Unit!46910) )
))
(declare-fun lt!615208 () Unit!46909)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46909)

(assert (=> b!1399398 (= lt!615208 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615210 (x!125928 lt!615207) (index!44129 lt!615207) (x!125928 lt!615212) (index!44129 lt!615212) (undefined!11251 lt!615212) mask!2840))))

(declare-fun e!792328 () Bool)

(declare-fun b!1399399 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95735 (_ BitVec 32)) SeekEntryResult!10439)

(assert (=> b!1399399 (= e!792328 (= (seekEntryOrOpen!0 (select (arr!46219 a!2901) j!112) a!2901 mask!2840) (Found!10439 j!112)))))

(declare-fun b!1399400 () Bool)

(declare-fun res!937632 () Bool)

(assert (=> b!1399400 (=> (not res!937632) (not e!792329))))

(assert (=> b!1399400 (= res!937632 (and (= (size!46770 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46770 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46770 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399401 () Bool)

(declare-fun res!937627 () Bool)

(assert (=> b!1399401 (=> (not res!937627) (not e!792329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399401 (= res!937627 (validKeyInArray!0 (select (arr!46219 a!2901) i!1037)))))

(declare-fun b!1399402 () Bool)

(declare-fun e!792327 () Bool)

(assert (=> b!1399402 (= e!792329 (not e!792327))))

(declare-fun res!937636 () Bool)

(assert (=> b!1399402 (=> res!937636 e!792327)))

(get-info :version)

(assert (=> b!1399402 (= res!937636 (or (not ((_ is Intermediate!10439) lt!615207)) (undefined!11251 lt!615207)))))

(assert (=> b!1399402 e!792328))

(declare-fun res!937631 () Bool)

(assert (=> b!1399402 (=> (not res!937631) (not e!792328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95735 (_ BitVec 32)) Bool)

(assert (=> b!1399402 (= res!937631 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615211 () Unit!46909)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46909)

(assert (=> b!1399402 (= lt!615211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95735 (_ BitVec 32)) SeekEntryResult!10439)

(assert (=> b!1399402 (= lt!615207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615210 (select (arr!46219 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399402 (= lt!615210 (toIndex!0 (select (arr!46219 a!2901) j!112) mask!2840))))

(declare-fun b!1399403 () Bool)

(declare-fun res!937634 () Bool)

(assert (=> b!1399403 (=> (not res!937634) (not e!792329))))

(declare-datatypes ((List!32725 0))(
  ( (Nil!32722) (Cons!32721 (h!33971 (_ BitVec 64)) (t!47411 List!32725)) )
))
(declare-fun arrayNoDuplicates!0 (array!95735 (_ BitVec 32) List!32725) Bool)

(assert (=> b!1399403 (= res!937634 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32722))))

(declare-fun b!1399404 () Bool)

(declare-fun res!937629 () Bool)

(assert (=> b!1399404 (=> (not res!937629) (not e!792329))))

(assert (=> b!1399404 (= res!937629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399405 () Bool)

(declare-fun lt!615209 () (_ BitVec 64))

(assert (=> b!1399405 (= e!792325 (validKeyInArray!0 lt!615209))))

(declare-fun b!1399406 () Bool)

(assert (=> b!1399406 (= e!792327 e!792324)))

(declare-fun res!937633 () Bool)

(assert (=> b!1399406 (=> res!937633 e!792324)))

(assert (=> b!1399406 (= res!937633 (or (= lt!615207 lt!615212) (not ((_ is Intermediate!10439) lt!615212))))))

(assert (=> b!1399406 (= lt!615212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615209 mask!2840) lt!615209 (array!95736 (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46770 a!2901)) mask!2840))))

(assert (=> b!1399406 (= lt!615209 (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399407 () Bool)

(declare-fun res!937630 () Bool)

(assert (=> b!1399407 (=> (not res!937630) (not e!792329))))

(assert (=> b!1399407 (= res!937630 (validKeyInArray!0 (select (arr!46219 a!2901) j!112)))))

(assert (= (and start!120284 res!937635) b!1399400))

(assert (= (and b!1399400 res!937632) b!1399401))

(assert (= (and b!1399401 res!937627) b!1399407))

(assert (= (and b!1399407 res!937630) b!1399404))

(assert (= (and b!1399404 res!937629) b!1399403))

(assert (= (and b!1399403 res!937634) b!1399402))

(assert (= (and b!1399402 res!937631) b!1399399))

(assert (= (and b!1399402 (not res!937636)) b!1399406))

(assert (= (and b!1399406 (not res!937633)) b!1399398))

(assert (= (and b!1399398 (not res!937628)) b!1399405))

(declare-fun m!1286689 () Bool)

(assert (=> b!1399402 m!1286689))

(declare-fun m!1286691 () Bool)

(assert (=> b!1399402 m!1286691))

(assert (=> b!1399402 m!1286689))

(declare-fun m!1286693 () Bool)

(assert (=> b!1399402 m!1286693))

(assert (=> b!1399402 m!1286689))

(declare-fun m!1286695 () Bool)

(assert (=> b!1399402 m!1286695))

(declare-fun m!1286697 () Bool)

(assert (=> b!1399402 m!1286697))

(declare-fun m!1286699 () Bool)

(assert (=> b!1399405 m!1286699))

(assert (=> b!1399407 m!1286689))

(assert (=> b!1399407 m!1286689))

(declare-fun m!1286701 () Bool)

(assert (=> b!1399407 m!1286701))

(declare-fun m!1286703 () Bool)

(assert (=> b!1399406 m!1286703))

(declare-fun m!1286705 () Bool)

(assert (=> b!1399406 m!1286705))

(assert (=> b!1399406 m!1286703))

(declare-fun m!1286707 () Bool)

(assert (=> b!1399406 m!1286707))

(declare-fun m!1286709 () Bool)

(assert (=> b!1399406 m!1286709))

(assert (=> b!1399399 m!1286689))

(assert (=> b!1399399 m!1286689))

(declare-fun m!1286711 () Bool)

(assert (=> b!1399399 m!1286711))

(declare-fun m!1286713 () Bool)

(assert (=> start!120284 m!1286713))

(declare-fun m!1286715 () Bool)

(assert (=> start!120284 m!1286715))

(declare-fun m!1286717 () Bool)

(assert (=> b!1399404 m!1286717))

(declare-fun m!1286719 () Bool)

(assert (=> b!1399403 m!1286719))

(declare-fun m!1286721 () Bool)

(assert (=> b!1399401 m!1286721))

(assert (=> b!1399401 m!1286721))

(declare-fun m!1286723 () Bool)

(assert (=> b!1399401 m!1286723))

(assert (=> b!1399398 m!1286705))

(declare-fun m!1286725 () Bool)

(assert (=> b!1399398 m!1286725))

(declare-fun m!1286727 () Bool)

(assert (=> b!1399398 m!1286727))

(check-sat (not b!1399402) (not b!1399403) (not b!1399405) (not start!120284) (not b!1399399) (not b!1399407) (not b!1399406) (not b!1399398) (not b!1399404) (not b!1399401))
(check-sat)
