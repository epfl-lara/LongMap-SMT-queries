; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119702 () Bool)

(assert start!119702)

(declare-fun b!1394386 () Bool)

(declare-fun res!933795 () Bool)

(declare-fun e!789480 () Bool)

(assert (=> b!1394386 (=> (not res!933795) (not e!789480))))

(declare-datatypes ((array!95384 0))(
  ( (array!95385 (arr!46050 (Array (_ BitVec 32) (_ BitVec 64))) (size!46600 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95384)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394386 (= res!933795 (validKeyInArray!0 (select (arr!46050 a!2901) i!1037)))))

(declare-fun b!1394387 () Bool)

(declare-fun e!789482 () Bool)

(assert (=> b!1394387 (= e!789482 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612431 () array!95384)

(declare-fun lt!612430 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10367 0))(
  ( (MissingZero!10367 (index!43839 (_ BitVec 32))) (Found!10367 (index!43840 (_ BitVec 32))) (Intermediate!10367 (undefined!11179 Bool) (index!43841 (_ BitVec 32)) (x!125507 (_ BitVec 32))) (Undefined!10367) (MissingVacant!10367 (index!43842 (_ BitVec 32))) )
))
(declare-fun lt!612434 () SeekEntryResult!10367)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95384 (_ BitVec 32)) SeekEntryResult!10367)

(assert (=> b!1394387 (= lt!612434 (seekEntryOrOpen!0 lt!612430 lt!612431 mask!2840))))

(declare-fun lt!612433 () SeekEntryResult!10367)

(declare-datatypes ((Unit!46738 0))(
  ( (Unit!46739) )
))
(declare-fun lt!612429 () Unit!46738)

(declare-fun lt!612432 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46738)

(assert (=> b!1394387 (= lt!612429 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612432 (x!125507 lt!612433) (index!43841 lt!612433) mask!2840))))

(declare-fun b!1394388 () Bool)

(declare-fun res!933794 () Bool)

(assert (=> b!1394388 (=> (not res!933794) (not e!789480))))

(assert (=> b!1394388 (= res!933794 (validKeyInArray!0 (select (arr!46050 a!2901) j!112)))))

(declare-fun b!1394389 () Bool)

(declare-fun res!933800 () Bool)

(assert (=> b!1394389 (=> (not res!933800) (not e!789480))))

(assert (=> b!1394389 (= res!933800 (and (= (size!46600 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46600 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46600 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394390 () Bool)

(declare-fun res!933802 () Bool)

(assert (=> b!1394390 (=> (not res!933802) (not e!789480))))

(declare-datatypes ((List!32569 0))(
  ( (Nil!32566) (Cons!32565 (h!33798 (_ BitVec 64)) (t!47263 List!32569)) )
))
(declare-fun arrayNoDuplicates!0 (array!95384 (_ BitVec 32) List!32569) Bool)

(assert (=> b!1394390 (= res!933802 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32566))))

(declare-fun b!1394391 () Bool)

(declare-fun e!789481 () Bool)

(assert (=> b!1394391 (= e!789481 e!789482)))

(declare-fun res!933798 () Bool)

(assert (=> b!1394391 (=> res!933798 e!789482)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95384 (_ BitVec 32)) SeekEntryResult!10367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394391 (= res!933798 (not (= lt!612433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612430 mask!2840) lt!612430 lt!612431 mask!2840))))))

(assert (=> b!1394391 (= lt!612430 (select (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394391 (= lt!612431 (array!95385 (store (arr!46050 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46600 a!2901)))))

(declare-fun res!933799 () Bool)

(assert (=> start!119702 (=> (not res!933799) (not e!789480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119702 (= res!933799 (validMask!0 mask!2840))))

(assert (=> start!119702 e!789480))

(assert (=> start!119702 true))

(declare-fun array_inv!35078 (array!95384) Bool)

(assert (=> start!119702 (array_inv!35078 a!2901)))

(declare-fun b!1394392 () Bool)

(declare-fun res!933801 () Bool)

(assert (=> b!1394392 (=> res!933801 e!789482)))

(assert (=> b!1394392 (= res!933801 (or (bvslt (x!125507 lt!612433) #b00000000000000000000000000000000) (bvsgt (x!125507 lt!612433) #b01111111111111111111111111111110) (bvslt lt!612432 #b00000000000000000000000000000000) (bvsge lt!612432 (size!46600 a!2901)) (bvslt (index!43841 lt!612433) #b00000000000000000000000000000000) (bvsge (index!43841 lt!612433) (size!46600 a!2901)) (not (= lt!612433 (Intermediate!10367 false (index!43841 lt!612433) (x!125507 lt!612433))))))))

(declare-fun b!1394393 () Bool)

(assert (=> b!1394393 (= e!789480 (not e!789481))))

(declare-fun res!933797 () Bool)

(assert (=> b!1394393 (=> res!933797 e!789481)))

(get-info :version)

(assert (=> b!1394393 (= res!933797 (or (not ((_ is Intermediate!10367) lt!612433)) (undefined!11179 lt!612433)))))

(assert (=> b!1394393 (= lt!612434 (Found!10367 j!112))))

(assert (=> b!1394393 (= lt!612434 (seekEntryOrOpen!0 (select (arr!46050 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95384 (_ BitVec 32)) Bool)

(assert (=> b!1394393 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612435 () Unit!46738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46738)

(assert (=> b!1394393 (= lt!612435 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394393 (= lt!612433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612432 (select (arr!46050 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394393 (= lt!612432 (toIndex!0 (select (arr!46050 a!2901) j!112) mask!2840))))

(declare-fun b!1394394 () Bool)

(declare-fun res!933796 () Bool)

(assert (=> b!1394394 (=> (not res!933796) (not e!789480))))

(assert (=> b!1394394 (= res!933796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119702 res!933799) b!1394389))

(assert (= (and b!1394389 res!933800) b!1394386))

(assert (= (and b!1394386 res!933795) b!1394388))

(assert (= (and b!1394388 res!933794) b!1394394))

(assert (= (and b!1394394 res!933796) b!1394390))

(assert (= (and b!1394390 res!933802) b!1394393))

(assert (= (and b!1394393 (not res!933797)) b!1394391))

(assert (= (and b!1394391 (not res!933798)) b!1394392))

(assert (= (and b!1394392 (not res!933801)) b!1394387))

(declare-fun m!1280687 () Bool)

(assert (=> b!1394390 m!1280687))

(declare-fun m!1280689 () Bool)

(assert (=> b!1394388 m!1280689))

(assert (=> b!1394388 m!1280689))

(declare-fun m!1280691 () Bool)

(assert (=> b!1394388 m!1280691))

(assert (=> b!1394393 m!1280689))

(declare-fun m!1280693 () Bool)

(assert (=> b!1394393 m!1280693))

(assert (=> b!1394393 m!1280689))

(declare-fun m!1280695 () Bool)

(assert (=> b!1394393 m!1280695))

(assert (=> b!1394393 m!1280689))

(declare-fun m!1280697 () Bool)

(assert (=> b!1394393 m!1280697))

(declare-fun m!1280699 () Bool)

(assert (=> b!1394393 m!1280699))

(assert (=> b!1394393 m!1280689))

(declare-fun m!1280701 () Bool)

(assert (=> b!1394393 m!1280701))

(declare-fun m!1280703 () Bool)

(assert (=> b!1394394 m!1280703))

(declare-fun m!1280705 () Bool)

(assert (=> b!1394386 m!1280705))

(assert (=> b!1394386 m!1280705))

(declare-fun m!1280707 () Bool)

(assert (=> b!1394386 m!1280707))

(declare-fun m!1280709 () Bool)

(assert (=> b!1394391 m!1280709))

(assert (=> b!1394391 m!1280709))

(declare-fun m!1280711 () Bool)

(assert (=> b!1394391 m!1280711))

(declare-fun m!1280713 () Bool)

(assert (=> b!1394391 m!1280713))

(declare-fun m!1280715 () Bool)

(assert (=> b!1394391 m!1280715))

(declare-fun m!1280717 () Bool)

(assert (=> b!1394387 m!1280717))

(declare-fun m!1280719 () Bool)

(assert (=> b!1394387 m!1280719))

(declare-fun m!1280721 () Bool)

(assert (=> start!119702 m!1280721))

(declare-fun m!1280723 () Bool)

(assert (=> start!119702 m!1280723))

(check-sat (not b!1394391) (not b!1394393) (not b!1394387) (not b!1394386) (not start!119702) (not b!1394394) (not b!1394390) (not b!1394388))
(check-sat)
