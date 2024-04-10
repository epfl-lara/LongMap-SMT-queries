; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45800 () Bool)

(assert start!45800)

(declare-fun b!506983 () Bool)

(declare-fun e!296714 () Bool)

(declare-fun e!296716 () Bool)

(assert (=> b!506983 (= e!296714 e!296716)))

(declare-fun res!307943 () Bool)

(assert (=> b!506983 (=> res!307943 e!296716)))

(declare-fun lt!231392 () Bool)

(declare-datatypes ((SeekEntryResult!4125 0))(
  ( (MissingZero!4125 (index!18688 (_ BitVec 32))) (Found!4125 (index!18689 (_ BitVec 32))) (Intermediate!4125 (undefined!4937 Bool) (index!18690 (_ BitVec 32)) (x!47686 (_ BitVec 32))) (Undefined!4125) (MissingVacant!4125 (index!18691 (_ BitVec 32))) )
))
(declare-fun lt!231390 () SeekEntryResult!4125)

(assert (=> b!506983 (= res!307943 (or (and (not lt!231392) (undefined!4937 lt!231390)) (and (not lt!231392) (not (undefined!4937 lt!231390)))))))

(get-info :version)

(assert (=> b!506983 (= lt!231392 (not ((_ is Intermediate!4125) lt!231390)))))

(declare-fun b!506984 () Bool)

(declare-fun res!307946 () Bool)

(declare-fun e!296715 () Bool)

(assert (=> b!506984 (=> (not res!307946) (not e!296715))))

(declare-datatypes ((array!32556 0))(
  ( (array!32557 (arr!15658 (Array (_ BitVec 32) (_ BitVec 64))) (size!16022 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32556)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506984 (= res!307946 (validKeyInArray!0 (select (arr!15658 a!3235) j!176)))))

(declare-fun b!506985 () Bool)

(declare-fun e!296718 () Bool)

(assert (=> b!506985 (= e!296715 e!296718)))

(declare-fun res!307950 () Bool)

(assert (=> b!506985 (=> (not res!307950) (not e!296718))))

(declare-fun lt!231393 () SeekEntryResult!4125)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506985 (= res!307950 (or (= lt!231393 (MissingZero!4125 i!1204)) (= lt!231393 (MissingVacant!4125 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32556 (_ BitVec 32)) SeekEntryResult!4125)

(assert (=> b!506985 (= lt!231393 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506987 () Bool)

(declare-fun res!307949 () Bool)

(assert (=> b!506987 (=> (not res!307949) (not e!296718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32556 (_ BitVec 32)) Bool)

(assert (=> b!506987 (= res!307949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506988 () Bool)

(declare-fun res!307945 () Bool)

(assert (=> b!506988 (=> (not res!307945) (not e!296715))))

(assert (=> b!506988 (= res!307945 (and (= (size!16022 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16022 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16022 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506989 () Bool)

(declare-fun e!296713 () Bool)

(assert (=> b!506989 (= e!296713 (= (seekEntryOrOpen!0 (select (arr!15658 a!3235) j!176) a!3235 mask!3524) (Found!4125 j!176)))))

(declare-fun b!506990 () Bool)

(assert (=> b!506990 (= e!296718 (not e!296714))))

(declare-fun res!307951 () Bool)

(assert (=> b!506990 (=> res!307951 e!296714)))

(declare-fun lt!231391 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32556 (_ BitVec 32)) SeekEntryResult!4125)

(assert (=> b!506990 (= res!307951 (= lt!231390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231391 (select (store (arr!15658 a!3235) i!1204 k0!2280) j!176) (array!32557 (store (arr!15658 a!3235) i!1204 k0!2280) (size!16022 a!3235)) mask!3524)))))

(declare-fun lt!231394 () (_ BitVec 32))

(assert (=> b!506990 (= lt!231390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231394 (select (arr!15658 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506990 (= lt!231391 (toIndex!0 (select (store (arr!15658 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506990 (= lt!231394 (toIndex!0 (select (arr!15658 a!3235) j!176) mask!3524))))

(assert (=> b!506990 e!296713))

(declare-fun res!307948 () Bool)

(assert (=> b!506990 (=> (not res!307948) (not e!296713))))

(assert (=> b!506990 (= res!307948 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15538 0))(
  ( (Unit!15539) )
))
(declare-fun lt!231389 () Unit!15538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15538)

(assert (=> b!506990 (= lt!231389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506991 () Bool)

(declare-fun res!307947 () Bool)

(assert (=> b!506991 (=> (not res!307947) (not e!296715))))

(assert (=> b!506991 (= res!307947 (validKeyInArray!0 k0!2280))))

(declare-fun res!307942 () Bool)

(assert (=> start!45800 (=> (not res!307942) (not e!296715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45800 (= res!307942 (validMask!0 mask!3524))))

(assert (=> start!45800 e!296715))

(assert (=> start!45800 true))

(declare-fun array_inv!11454 (array!32556) Bool)

(assert (=> start!45800 (array_inv!11454 a!3235)))

(declare-fun b!506986 () Bool)

(assert (=> b!506986 (= e!296716 true)))

(assert (=> b!506986 false))

(declare-fun b!506992 () Bool)

(declare-fun res!307952 () Bool)

(assert (=> b!506992 (=> (not res!307952) (not e!296715))))

(declare-fun arrayContainsKey!0 (array!32556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506992 (= res!307952 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506993 () Bool)

(declare-fun res!307944 () Bool)

(assert (=> b!506993 (=> (not res!307944) (not e!296718))))

(declare-datatypes ((List!9816 0))(
  ( (Nil!9813) (Cons!9812 (h!10689 (_ BitVec 64)) (t!16044 List!9816)) )
))
(declare-fun arrayNoDuplicates!0 (array!32556 (_ BitVec 32) List!9816) Bool)

(assert (=> b!506993 (= res!307944 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9813))))

(assert (= (and start!45800 res!307942) b!506988))

(assert (= (and b!506988 res!307945) b!506984))

(assert (= (and b!506984 res!307946) b!506991))

(assert (= (and b!506991 res!307947) b!506992))

(assert (= (and b!506992 res!307952) b!506985))

(assert (= (and b!506985 res!307950) b!506987))

(assert (= (and b!506987 res!307949) b!506993))

(assert (= (and b!506993 res!307944) b!506990))

(assert (= (and b!506990 res!307948) b!506989))

(assert (= (and b!506990 (not res!307951)) b!506983))

(assert (= (and b!506983 (not res!307943)) b!506986))

(declare-fun m!487695 () Bool)

(assert (=> b!506985 m!487695))

(declare-fun m!487697 () Bool)

(assert (=> b!506989 m!487697))

(assert (=> b!506989 m!487697))

(declare-fun m!487699 () Bool)

(assert (=> b!506989 m!487699))

(declare-fun m!487701 () Bool)

(assert (=> start!45800 m!487701))

(declare-fun m!487703 () Bool)

(assert (=> start!45800 m!487703))

(declare-fun m!487705 () Bool)

(assert (=> b!506991 m!487705))

(declare-fun m!487707 () Bool)

(assert (=> b!506990 m!487707))

(declare-fun m!487709 () Bool)

(assert (=> b!506990 m!487709))

(declare-fun m!487711 () Bool)

(assert (=> b!506990 m!487711))

(assert (=> b!506990 m!487697))

(declare-fun m!487713 () Bool)

(assert (=> b!506990 m!487713))

(assert (=> b!506990 m!487697))

(declare-fun m!487715 () Bool)

(assert (=> b!506990 m!487715))

(assert (=> b!506990 m!487697))

(declare-fun m!487717 () Bool)

(assert (=> b!506990 m!487717))

(assert (=> b!506990 m!487711))

(declare-fun m!487719 () Bool)

(assert (=> b!506990 m!487719))

(assert (=> b!506990 m!487711))

(declare-fun m!487721 () Bool)

(assert (=> b!506990 m!487721))

(declare-fun m!487723 () Bool)

(assert (=> b!506987 m!487723))

(declare-fun m!487725 () Bool)

(assert (=> b!506992 m!487725))

(assert (=> b!506984 m!487697))

(assert (=> b!506984 m!487697))

(declare-fun m!487727 () Bool)

(assert (=> b!506984 m!487727))

(declare-fun m!487729 () Bool)

(assert (=> b!506993 m!487729))

(check-sat (not start!45800) (not b!506992) (not b!506984) (not b!506991) (not b!506993) (not b!506985) (not b!506989) (not b!506987) (not b!506990))
(check-sat)
