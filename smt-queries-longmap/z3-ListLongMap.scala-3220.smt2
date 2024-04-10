; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45068 () Bool)

(assert start!45068)

(declare-fun b!494666 () Bool)

(declare-fun res!297238 () Bool)

(declare-fun e!290276 () Bool)

(assert (=> b!494666 (=> (not res!297238) (not e!290276))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494666 (= res!297238 (validKeyInArray!0 k0!2280))))

(declare-fun b!494667 () Bool)

(declare-fun e!290277 () Bool)

(declare-fun e!290274 () Bool)

(assert (=> b!494667 (= e!290277 (not e!290274))))

(declare-fun res!297243 () Bool)

(assert (=> b!494667 (=> res!297243 e!290274)))

(declare-fun lt!223908 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3858 0))(
  ( (MissingZero!3858 (index!17611 (_ BitVec 32))) (Found!3858 (index!17612 (_ BitVec 32))) (Intermediate!3858 (undefined!4670 Bool) (index!17613 (_ BitVec 32)) (x!46680 (_ BitVec 32))) (Undefined!3858) (MissingVacant!3858 (index!17614 (_ BitVec 32))) )
))
(declare-fun lt!223912 () SeekEntryResult!3858)

(declare-datatypes ((array!32013 0))(
  ( (array!32014 (arr!15391 (Array (_ BitVec 32) (_ BitVec 64))) (size!15755 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32013)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32013 (_ BitVec 32)) SeekEntryResult!3858)

(assert (=> b!494667 (= res!297243 (= lt!223912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223908 (select (store (arr!15391 a!3235) i!1204 k0!2280) j!176) (array!32014 (store (arr!15391 a!3235) i!1204 k0!2280) (size!15755 a!3235)) mask!3524)))))

(declare-fun lt!223910 () (_ BitVec 32))

(assert (=> b!494667 (= lt!223912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223910 (select (arr!15391 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494667 (= lt!223908 (toIndex!0 (select (store (arr!15391 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494667 (= lt!223910 (toIndex!0 (select (arr!15391 a!3235) j!176) mask!3524))))

(declare-fun lt!223909 () SeekEntryResult!3858)

(assert (=> b!494667 (= lt!223909 (Found!3858 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32013 (_ BitVec 32)) SeekEntryResult!3858)

(assert (=> b!494667 (= lt!223909 (seekEntryOrOpen!0 (select (arr!15391 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32013 (_ BitVec 32)) Bool)

(assert (=> b!494667 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14662 0))(
  ( (Unit!14663) )
))
(declare-fun lt!223911 () Unit!14662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14662)

(assert (=> b!494667 (= lt!223911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494668 () Bool)

(declare-fun res!297242 () Bool)

(assert (=> b!494668 (=> (not res!297242) (not e!290276))))

(declare-fun arrayContainsKey!0 (array!32013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494668 (= res!297242 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494669 () Bool)

(assert (=> b!494669 (= e!290274 true)))

(assert (=> b!494669 (= lt!223909 Undefined!3858)))

(declare-fun b!494670 () Bool)

(declare-fun res!297240 () Bool)

(assert (=> b!494670 (=> (not res!297240) (not e!290277))))

(declare-datatypes ((List!9549 0))(
  ( (Nil!9546) (Cons!9545 (h!10413 (_ BitVec 64)) (t!15777 List!9549)) )
))
(declare-fun arrayNoDuplicates!0 (array!32013 (_ BitVec 32) List!9549) Bool)

(assert (=> b!494670 (= res!297240 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9546))))

(declare-fun b!494671 () Bool)

(assert (=> b!494671 (= e!290276 e!290277)))

(declare-fun res!297244 () Bool)

(assert (=> b!494671 (=> (not res!297244) (not e!290277))))

(declare-fun lt!223907 () SeekEntryResult!3858)

(assert (=> b!494671 (= res!297244 (or (= lt!223907 (MissingZero!3858 i!1204)) (= lt!223907 (MissingVacant!3858 i!1204))))))

(assert (=> b!494671 (= lt!223907 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!297236 () Bool)

(assert (=> start!45068 (=> (not res!297236) (not e!290276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45068 (= res!297236 (validMask!0 mask!3524))))

(assert (=> start!45068 e!290276))

(assert (=> start!45068 true))

(declare-fun array_inv!11187 (array!32013) Bool)

(assert (=> start!45068 (array_inv!11187 a!3235)))

(declare-fun b!494672 () Bool)

(declare-fun res!297241 () Bool)

(assert (=> b!494672 (=> res!297241 e!290274)))

(get-info :version)

(assert (=> b!494672 (= res!297241 (or (not ((_ is Intermediate!3858) lt!223912)) (not (undefined!4670 lt!223912))))))

(declare-fun b!494673 () Bool)

(declare-fun res!297237 () Bool)

(assert (=> b!494673 (=> (not res!297237) (not e!290276))))

(assert (=> b!494673 (= res!297237 (and (= (size!15755 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15755 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15755 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494674 () Bool)

(declare-fun res!297245 () Bool)

(assert (=> b!494674 (=> (not res!297245) (not e!290277))))

(assert (=> b!494674 (= res!297245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494675 () Bool)

(declare-fun res!297239 () Bool)

(assert (=> b!494675 (=> (not res!297239) (not e!290276))))

(assert (=> b!494675 (= res!297239 (validKeyInArray!0 (select (arr!15391 a!3235) j!176)))))

(assert (= (and start!45068 res!297236) b!494673))

(assert (= (and b!494673 res!297237) b!494675))

(assert (= (and b!494675 res!297239) b!494666))

(assert (= (and b!494666 res!297238) b!494668))

(assert (= (and b!494668 res!297242) b!494671))

(assert (= (and b!494671 res!297244) b!494674))

(assert (= (and b!494674 res!297245) b!494670))

(assert (= (and b!494670 res!297240) b!494667))

(assert (= (and b!494667 (not res!297243)) b!494672))

(assert (= (and b!494672 (not res!297241)) b!494669))

(declare-fun m!475755 () Bool)

(assert (=> b!494668 m!475755))

(declare-fun m!475757 () Bool)

(assert (=> b!494670 m!475757))

(declare-fun m!475759 () Bool)

(assert (=> b!494675 m!475759))

(assert (=> b!494675 m!475759))

(declare-fun m!475761 () Bool)

(assert (=> b!494675 m!475761))

(declare-fun m!475763 () Bool)

(assert (=> b!494666 m!475763))

(declare-fun m!475765 () Bool)

(assert (=> start!45068 m!475765))

(declare-fun m!475767 () Bool)

(assert (=> start!45068 m!475767))

(declare-fun m!475769 () Bool)

(assert (=> b!494667 m!475769))

(declare-fun m!475771 () Bool)

(assert (=> b!494667 m!475771))

(declare-fun m!475773 () Bool)

(assert (=> b!494667 m!475773))

(declare-fun m!475775 () Bool)

(assert (=> b!494667 m!475775))

(assert (=> b!494667 m!475771))

(assert (=> b!494667 m!475759))

(declare-fun m!475777 () Bool)

(assert (=> b!494667 m!475777))

(assert (=> b!494667 m!475759))

(declare-fun m!475779 () Bool)

(assert (=> b!494667 m!475779))

(assert (=> b!494667 m!475759))

(declare-fun m!475781 () Bool)

(assert (=> b!494667 m!475781))

(assert (=> b!494667 m!475759))

(declare-fun m!475783 () Bool)

(assert (=> b!494667 m!475783))

(assert (=> b!494667 m!475771))

(declare-fun m!475785 () Bool)

(assert (=> b!494667 m!475785))

(declare-fun m!475787 () Bool)

(assert (=> b!494674 m!475787))

(declare-fun m!475789 () Bool)

(assert (=> b!494671 m!475789))

(check-sat (not b!494670) (not b!494675) (not start!45068) (not b!494674) (not b!494668) (not b!494671) (not b!494667) (not b!494666))
(check-sat)
