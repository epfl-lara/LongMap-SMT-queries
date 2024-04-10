; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119700 () Bool)

(assert start!119700)

(declare-fun b!1394359 () Bool)

(declare-fun res!933774 () Bool)

(declare-fun e!789469 () Bool)

(assert (=> b!1394359 (=> (not res!933774) (not e!789469))))

(declare-datatypes ((array!95382 0))(
  ( (array!95383 (arr!46049 (Array (_ BitVec 32) (_ BitVec 64))) (size!46599 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95382)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394359 (= res!933774 (validKeyInArray!0 (select (arr!46049 a!2901) i!1037)))))

(declare-fun b!1394360 () Bool)

(declare-fun res!933775 () Bool)

(assert (=> b!1394360 (=> (not res!933775) (not e!789469))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394360 (= res!933775 (validKeyInArray!0 (select (arr!46049 a!2901) j!112)))))

(declare-fun b!1394361 () Bool)

(declare-fun res!933771 () Bool)

(assert (=> b!1394361 (=> (not res!933771) (not e!789469))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394361 (= res!933771 (and (= (size!46599 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46599 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46599 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394362 () Bool)

(declare-fun e!789468 () Bool)

(declare-fun e!789470 () Bool)

(assert (=> b!1394362 (= e!789468 e!789470)))

(declare-fun res!933769 () Bool)

(assert (=> b!1394362 (=> res!933769 e!789470)))

(declare-fun lt!612408 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10366 0))(
  ( (MissingZero!10366 (index!43835 (_ BitVec 32))) (Found!10366 (index!43836 (_ BitVec 32))) (Intermediate!10366 (undefined!11178 Bool) (index!43837 (_ BitVec 32)) (x!125506 (_ BitVec 32))) (Undefined!10366) (MissingVacant!10366 (index!43838 (_ BitVec 32))) )
))
(declare-fun lt!612411 () SeekEntryResult!10366)

(declare-fun lt!612413 () array!95382)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95382 (_ BitVec 32)) SeekEntryResult!10366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394362 (= res!933769 (not (= lt!612411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612408 mask!2840) lt!612408 lt!612413 mask!2840))))))

(assert (=> b!1394362 (= lt!612408 (select (store (arr!46049 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394362 (= lt!612413 (array!95383 (store (arr!46049 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46599 a!2901)))))

(declare-fun b!1394364 () Bool)

(declare-fun res!933772 () Bool)

(assert (=> b!1394364 (=> (not res!933772) (not e!789469))))

(declare-datatypes ((List!32568 0))(
  ( (Nil!32565) (Cons!32564 (h!33797 (_ BitVec 64)) (t!47262 List!32568)) )
))
(declare-fun arrayNoDuplicates!0 (array!95382 (_ BitVec 32) List!32568) Bool)

(assert (=> b!1394364 (= res!933772 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32565))))

(declare-fun b!1394365 () Bool)

(assert (=> b!1394365 (= e!789470 true)))

(declare-fun lt!612414 () SeekEntryResult!10366)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95382 (_ BitVec 32)) SeekEntryResult!10366)

(assert (=> b!1394365 (= lt!612414 (seekEntryOrOpen!0 lt!612408 lt!612413 mask!2840))))

(declare-fun lt!612410 () (_ BitVec 32))

(declare-datatypes ((Unit!46736 0))(
  ( (Unit!46737) )
))
(declare-fun lt!612412 () Unit!46736)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46736)

(assert (=> b!1394365 (= lt!612412 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612410 (x!125506 lt!612411) (index!43837 lt!612411) mask!2840))))

(declare-fun b!1394366 () Bool)

(declare-fun res!933767 () Bool)

(assert (=> b!1394366 (=> res!933767 e!789470)))

(assert (=> b!1394366 (= res!933767 (or (bvslt (x!125506 lt!612411) #b00000000000000000000000000000000) (bvsgt (x!125506 lt!612411) #b01111111111111111111111111111110) (bvslt lt!612410 #b00000000000000000000000000000000) (bvsge lt!612410 (size!46599 a!2901)) (bvslt (index!43837 lt!612411) #b00000000000000000000000000000000) (bvsge (index!43837 lt!612411) (size!46599 a!2901)) (not (= lt!612411 (Intermediate!10366 false (index!43837 lt!612411) (x!125506 lt!612411))))))))

(declare-fun b!1394367 () Bool)

(declare-fun res!933770 () Bool)

(assert (=> b!1394367 (=> (not res!933770) (not e!789469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95382 (_ BitVec 32)) Bool)

(assert (=> b!1394367 (= res!933770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933768 () Bool)

(assert (=> start!119700 (=> (not res!933768) (not e!789469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119700 (= res!933768 (validMask!0 mask!2840))))

(assert (=> start!119700 e!789469))

(assert (=> start!119700 true))

(declare-fun array_inv!35077 (array!95382) Bool)

(assert (=> start!119700 (array_inv!35077 a!2901)))

(declare-fun b!1394363 () Bool)

(assert (=> b!1394363 (= e!789469 (not e!789468))))

(declare-fun res!933773 () Bool)

(assert (=> b!1394363 (=> res!933773 e!789468)))

(assert (=> b!1394363 (= res!933773 (or (not (is-Intermediate!10366 lt!612411)) (undefined!11178 lt!612411)))))

(assert (=> b!1394363 (= lt!612414 (Found!10366 j!112))))

(assert (=> b!1394363 (= lt!612414 (seekEntryOrOpen!0 (select (arr!46049 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394363 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612409 () Unit!46736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46736)

(assert (=> b!1394363 (= lt!612409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394363 (= lt!612411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612410 (select (arr!46049 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394363 (= lt!612410 (toIndex!0 (select (arr!46049 a!2901) j!112) mask!2840))))

(assert (= (and start!119700 res!933768) b!1394361))

(assert (= (and b!1394361 res!933771) b!1394359))

(assert (= (and b!1394359 res!933774) b!1394360))

(assert (= (and b!1394360 res!933775) b!1394367))

(assert (= (and b!1394367 res!933770) b!1394364))

(assert (= (and b!1394364 res!933772) b!1394363))

(assert (= (and b!1394363 (not res!933773)) b!1394362))

(assert (= (and b!1394362 (not res!933769)) b!1394366))

(assert (= (and b!1394366 (not res!933767)) b!1394365))

(declare-fun m!1280649 () Bool)

(assert (=> b!1394365 m!1280649))

(declare-fun m!1280651 () Bool)

(assert (=> b!1394365 m!1280651))

(declare-fun m!1280653 () Bool)

(assert (=> b!1394362 m!1280653))

(assert (=> b!1394362 m!1280653))

(declare-fun m!1280655 () Bool)

(assert (=> b!1394362 m!1280655))

(declare-fun m!1280657 () Bool)

(assert (=> b!1394362 m!1280657))

(declare-fun m!1280659 () Bool)

(assert (=> b!1394362 m!1280659))

(declare-fun m!1280661 () Bool)

(assert (=> b!1394363 m!1280661))

(declare-fun m!1280663 () Bool)

(assert (=> b!1394363 m!1280663))

(assert (=> b!1394363 m!1280661))

(declare-fun m!1280665 () Bool)

(assert (=> b!1394363 m!1280665))

(assert (=> b!1394363 m!1280661))

(declare-fun m!1280667 () Bool)

(assert (=> b!1394363 m!1280667))

(assert (=> b!1394363 m!1280661))

(declare-fun m!1280669 () Bool)

(assert (=> b!1394363 m!1280669))

(declare-fun m!1280671 () Bool)

(assert (=> b!1394363 m!1280671))

(declare-fun m!1280673 () Bool)

(assert (=> b!1394367 m!1280673))

(declare-fun m!1280675 () Bool)

(assert (=> start!119700 m!1280675))

(declare-fun m!1280677 () Bool)

(assert (=> start!119700 m!1280677))

(assert (=> b!1394360 m!1280661))

(assert (=> b!1394360 m!1280661))

(declare-fun m!1280679 () Bool)

(assert (=> b!1394360 m!1280679))

(declare-fun m!1280681 () Bool)

(assert (=> b!1394359 m!1280681))

(assert (=> b!1394359 m!1280681))

(declare-fun m!1280683 () Bool)

(assert (=> b!1394359 m!1280683))

(declare-fun m!1280685 () Bool)

(assert (=> b!1394364 m!1280685))

(push 1)

