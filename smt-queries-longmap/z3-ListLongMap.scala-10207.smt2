; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120290 () Bool)

(assert start!120290)

(declare-fun b!1399778 () Bool)

(declare-fun res!938349 () Bool)

(declare-fun e!792489 () Bool)

(assert (=> b!1399778 (=> (not res!938349) (not e!792489))))

(declare-datatypes ((array!95652 0))(
  ( (array!95653 (arr!46177 (Array (_ BitVec 32) (_ BitVec 64))) (size!46729 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95652)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399778 (= res!938349 (validKeyInArray!0 (select (arr!46177 a!2901) i!1037)))))

(declare-fun b!1399779 () Bool)

(declare-fun res!938347 () Bool)

(assert (=> b!1399779 (=> (not res!938347) (not e!792489))))

(declare-datatypes ((List!32774 0))(
  ( (Nil!32771) (Cons!32770 (h!34018 (_ BitVec 64)) (t!47460 List!32774)) )
))
(declare-fun arrayNoDuplicates!0 (array!95652 (_ BitVec 32) List!32774) Bool)

(assert (=> b!1399779 (= res!938347 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32771))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!792490 () Bool)

(declare-fun b!1399780 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10520 0))(
  ( (MissingZero!10520 (index!44457 (_ BitVec 32))) (Found!10520 (index!44458 (_ BitVec 32))) (Intermediate!10520 (undefined!11332 Bool) (index!44459 (_ BitVec 32)) (x!126104 (_ BitVec 32))) (Undefined!10520) (MissingVacant!10520 (index!44460 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95652 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1399780 (= e!792490 (= (seekEntryOrOpen!0 (select (arr!46177 a!2901) j!112) a!2901 mask!2840) (Found!10520 j!112)))))

(declare-fun b!1399781 () Bool)

(declare-fun e!792492 () Bool)

(assert (=> b!1399781 (= e!792489 (not e!792492))))

(declare-fun res!938341 () Bool)

(assert (=> b!1399781 (=> res!938341 e!792492)))

(declare-fun lt!615592 () SeekEntryResult!10520)

(get-info :version)

(assert (=> b!1399781 (= res!938341 (or (not ((_ is Intermediate!10520) lt!615592)) (undefined!11332 lt!615592)))))

(assert (=> b!1399781 e!792490))

(declare-fun res!938345 () Bool)

(assert (=> b!1399781 (=> (not res!938345) (not e!792490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95652 (_ BitVec 32)) Bool)

(assert (=> b!1399781 (= res!938345 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46887 0))(
  ( (Unit!46888) )
))
(declare-fun lt!615593 () Unit!46887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46887)

(assert (=> b!1399781 (= lt!615593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615598 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95652 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1399781 (= lt!615592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615598 (select (arr!46177 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399781 (= lt!615598 (toIndex!0 (select (arr!46177 a!2901) j!112) mask!2840))))

(declare-fun b!1399783 () Bool)

(declare-fun e!792494 () Bool)

(declare-fun e!792493 () Bool)

(assert (=> b!1399783 (= e!792494 e!792493)))

(declare-fun res!938350 () Bool)

(assert (=> b!1399783 (=> res!938350 e!792493)))

(declare-fun lt!615599 () SeekEntryResult!10520)

(assert (=> b!1399783 (= res!938350 (or (bvslt (x!126104 lt!615592) #b00000000000000000000000000000000) (bvsgt (x!126104 lt!615592) #b01111111111111111111111111111110) (bvslt (x!126104 lt!615599) #b00000000000000000000000000000000) (bvsgt (x!126104 lt!615599) #b01111111111111111111111111111110) (bvslt lt!615598 #b00000000000000000000000000000000) (bvsge lt!615598 (size!46729 a!2901)) (bvslt (index!44459 lt!615592) #b00000000000000000000000000000000) (bvsge (index!44459 lt!615592) (size!46729 a!2901)) (bvslt (index!44459 lt!615599) #b00000000000000000000000000000000) (bvsge (index!44459 lt!615599) (size!46729 a!2901)) (not (= lt!615592 (Intermediate!10520 false (index!44459 lt!615592) (x!126104 lt!615592)))) (not (= lt!615599 (Intermediate!10520 false (index!44459 lt!615599) (x!126104 lt!615599))))))))

(declare-fun e!792491 () Bool)

(assert (=> b!1399783 e!792491))

(declare-fun res!938348 () Bool)

(assert (=> b!1399783 (=> (not res!938348) (not e!792491))))

(assert (=> b!1399783 (= res!938348 (and (not (undefined!11332 lt!615599)) (= (index!44459 lt!615599) i!1037) (bvslt (x!126104 lt!615599) (x!126104 lt!615592)) (= (select (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44459 lt!615599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615597 () Unit!46887)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46887)

(assert (=> b!1399783 (= lt!615597 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615598 (x!126104 lt!615592) (index!44459 lt!615592) (x!126104 lt!615599) (index!44459 lt!615599) (undefined!11332 lt!615599) mask!2840))))

(declare-fun b!1399784 () Bool)

(declare-fun res!938346 () Bool)

(assert (=> b!1399784 (=> (not res!938346) (not e!792489))))

(assert (=> b!1399784 (= res!938346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399785 () Bool)

(declare-fun res!938343 () Bool)

(assert (=> b!1399785 (=> (not res!938343) (not e!792489))))

(assert (=> b!1399785 (= res!938343 (and (= (size!46729 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46729 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46729 a!2901)) (not (= i!1037 j!112))))))

(declare-fun lt!615595 () (_ BitVec 64))

(declare-fun lt!615596 () array!95652)

(declare-fun b!1399786 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95652 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1399786 (= e!792491 (= (seekEntryOrOpen!0 lt!615595 lt!615596 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126104 lt!615599) (index!44459 lt!615599) (index!44459 lt!615599) (select (arr!46177 a!2901) j!112) lt!615596 mask!2840)))))

(declare-fun b!1399787 () Bool)

(assert (=> b!1399787 (= e!792492 e!792494)))

(declare-fun res!938340 () Bool)

(assert (=> b!1399787 (=> res!938340 e!792494)))

(assert (=> b!1399787 (= res!938340 (or (= lt!615592 lt!615599) (not ((_ is Intermediate!10520) lt!615599))))))

(assert (=> b!1399787 (= lt!615599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615595 mask!2840) lt!615595 lt!615596 mask!2840))))

(assert (=> b!1399787 (= lt!615595 (select (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399787 (= lt!615596 (array!95653 (store (arr!46177 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46729 a!2901)))))

(declare-fun b!1399788 () Bool)

(assert (=> b!1399788 (= e!792493 true)))

(declare-fun lt!615594 () SeekEntryResult!10520)

(assert (=> b!1399788 (= lt!615594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615598 lt!615595 lt!615596 mask!2840))))

(declare-fun b!1399782 () Bool)

(declare-fun res!938344 () Bool)

(assert (=> b!1399782 (=> (not res!938344) (not e!792489))))

(assert (=> b!1399782 (= res!938344 (validKeyInArray!0 (select (arr!46177 a!2901) j!112)))))

(declare-fun res!938342 () Bool)

(assert (=> start!120290 (=> (not res!938342) (not e!792489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120290 (= res!938342 (validMask!0 mask!2840))))

(assert (=> start!120290 e!792489))

(assert (=> start!120290 true))

(declare-fun array_inv!35410 (array!95652) Bool)

(assert (=> start!120290 (array_inv!35410 a!2901)))

(assert (= (and start!120290 res!938342) b!1399785))

(assert (= (and b!1399785 res!938343) b!1399778))

(assert (= (and b!1399778 res!938349) b!1399782))

(assert (= (and b!1399782 res!938344) b!1399784))

(assert (= (and b!1399784 res!938346) b!1399779))

(assert (= (and b!1399779 res!938347) b!1399781))

(assert (= (and b!1399781 res!938345) b!1399780))

(assert (= (and b!1399781 (not res!938341)) b!1399787))

(assert (= (and b!1399787 (not res!938340)) b!1399783))

(assert (= (and b!1399783 res!938348) b!1399786))

(assert (= (and b!1399783 (not res!938350)) b!1399788))

(declare-fun m!1286581 () Bool)

(assert (=> b!1399781 m!1286581))

(declare-fun m!1286583 () Bool)

(assert (=> b!1399781 m!1286583))

(assert (=> b!1399781 m!1286581))

(declare-fun m!1286585 () Bool)

(assert (=> b!1399781 m!1286585))

(declare-fun m!1286587 () Bool)

(assert (=> b!1399781 m!1286587))

(assert (=> b!1399781 m!1286581))

(declare-fun m!1286589 () Bool)

(assert (=> b!1399781 m!1286589))

(declare-fun m!1286591 () Bool)

(assert (=> b!1399787 m!1286591))

(assert (=> b!1399787 m!1286591))

(declare-fun m!1286593 () Bool)

(assert (=> b!1399787 m!1286593))

(declare-fun m!1286595 () Bool)

(assert (=> b!1399787 m!1286595))

(declare-fun m!1286597 () Bool)

(assert (=> b!1399787 m!1286597))

(assert (=> b!1399780 m!1286581))

(assert (=> b!1399780 m!1286581))

(declare-fun m!1286599 () Bool)

(assert (=> b!1399780 m!1286599))

(declare-fun m!1286601 () Bool)

(assert (=> b!1399788 m!1286601))

(assert (=> b!1399782 m!1286581))

(assert (=> b!1399782 m!1286581))

(declare-fun m!1286603 () Bool)

(assert (=> b!1399782 m!1286603))

(assert (=> b!1399783 m!1286595))

(declare-fun m!1286605 () Bool)

(assert (=> b!1399783 m!1286605))

(declare-fun m!1286607 () Bool)

(assert (=> b!1399783 m!1286607))

(declare-fun m!1286609 () Bool)

(assert (=> b!1399784 m!1286609))

(declare-fun m!1286611 () Bool)

(assert (=> b!1399786 m!1286611))

(assert (=> b!1399786 m!1286581))

(assert (=> b!1399786 m!1286581))

(declare-fun m!1286613 () Bool)

(assert (=> b!1399786 m!1286613))

(declare-fun m!1286615 () Bool)

(assert (=> start!120290 m!1286615))

(declare-fun m!1286617 () Bool)

(assert (=> start!120290 m!1286617))

(declare-fun m!1286619 () Bool)

(assert (=> b!1399779 m!1286619))

(declare-fun m!1286621 () Bool)

(assert (=> b!1399778 m!1286621))

(assert (=> b!1399778 m!1286621))

(declare-fun m!1286623 () Bool)

(assert (=> b!1399778 m!1286623))

(check-sat (not b!1399788) (not start!120290) (not b!1399778) (not b!1399786) (not b!1399782) (not b!1399784) (not b!1399779) (not b!1399783) (not b!1399787) (not b!1399780) (not b!1399781))
(check-sat)
