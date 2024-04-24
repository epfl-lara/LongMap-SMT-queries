; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45476 () Bool)

(assert start!45476)

(declare-fun res!302659 () Bool)

(declare-fun e!293411 () Bool)

(assert (=> start!45476 (=> (not res!302659) (not e!293411))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45476 (= res!302659 (validMask!0 mask!3524))))

(assert (=> start!45476 e!293411))

(assert (=> start!45476 true))

(declare-datatypes ((array!32302 0))(
  ( (array!32303 (arr!15532 (Array (_ BitVec 32) (_ BitVec 64))) (size!15896 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32302)

(declare-fun array_inv!11391 (array!32302) Bool)

(assert (=> start!45476 (array_inv!11391 a!3235)))

(declare-fun e!293412 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!500837 () Bool)

(declare-datatypes ((SeekEntryResult!3955 0))(
  ( (MissingZero!3955 (index!18002 (_ BitVec 32))) (Found!3955 (index!18003 (_ BitVec 32))) (Intermediate!3955 (undefined!4767 Bool) (index!18004 (_ BitVec 32)) (x!47181 (_ BitVec 32))) (Undefined!3955) (MissingVacant!3955 (index!18005 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32302 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!500837 (= e!293412 (= (seekEntryOrOpen!0 (select (arr!15532 a!3235) j!176) a!3235 mask!3524) (Found!3955 j!176)))))

(declare-fun b!500838 () Bool)

(declare-fun res!302668 () Bool)

(assert (=> b!500838 (=> (not res!302668) (not e!293411))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500838 (= res!302668 (and (= (size!15896 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15896 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15896 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500839 () Bool)

(declare-fun e!293410 () Bool)

(assert (=> b!500839 (= e!293411 e!293410)))

(declare-fun res!302670 () Bool)

(assert (=> b!500839 (=> (not res!302670) (not e!293410))))

(declare-fun lt!227432 () SeekEntryResult!3955)

(assert (=> b!500839 (= res!302670 (or (= lt!227432 (MissingZero!3955 i!1204)) (= lt!227432 (MissingVacant!3955 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!500839 (= lt!227432 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500840 () Bool)

(declare-fun e!293408 () Bool)

(assert (=> b!500840 (= e!293408 false)))

(declare-fun b!500841 () Bool)

(declare-fun res!302662 () Bool)

(assert (=> b!500841 (=> (not res!302662) (not e!293410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32302 (_ BitVec 32)) Bool)

(assert (=> b!500841 (= res!302662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500842 () Bool)

(declare-fun res!302660 () Bool)

(assert (=> b!500842 (=> (not res!302660) (not e!293410))))

(declare-datatypes ((List!9597 0))(
  ( (Nil!9594) (Cons!9593 (h!10467 (_ BitVec 64)) (t!15817 List!9597)) )
))
(declare-fun arrayNoDuplicates!0 (array!32302 (_ BitVec 32) List!9597) Bool)

(assert (=> b!500842 (= res!302660 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9594))))

(declare-fun b!500843 () Bool)

(declare-fun res!302666 () Bool)

(assert (=> b!500843 (=> (not res!302666) (not e!293411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500843 (= res!302666 (validKeyInArray!0 k0!2280))))

(declare-fun b!500844 () Bool)

(declare-datatypes ((Unit!15055 0))(
  ( (Unit!15056) )
))
(declare-fun e!293413 () Unit!15055)

(declare-fun Unit!15057 () Unit!15055)

(assert (=> b!500844 (= e!293413 Unit!15057)))

(declare-fun lt!227440 () Unit!15055)

(declare-fun lt!227434 () SeekEntryResult!3955)

(declare-fun lt!227439 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32302 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15055)

(assert (=> b!500844 (= lt!227440 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227439 #b00000000000000000000000000000000 (index!18004 lt!227434) (x!47181 lt!227434) mask!3524))))

(declare-fun res!302663 () Bool)

(declare-fun lt!227437 () (_ BitVec 64))

(declare-fun lt!227435 () array!32302)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32302 (_ BitVec 32)) SeekEntryResult!3955)

(assert (=> b!500844 (= res!302663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227439 lt!227437 lt!227435 mask!3524) (Intermediate!3955 false (index!18004 lt!227434) (x!47181 lt!227434))))))

(assert (=> b!500844 (=> (not res!302663) (not e!293408))))

(assert (=> b!500844 e!293408))

(declare-fun b!500845 () Bool)

(declare-fun e!293409 () Bool)

(assert (=> b!500845 (= e!293409 true)))

(declare-fun lt!227438 () SeekEntryResult!3955)

(assert (=> b!500845 (= lt!227438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227439 lt!227437 lt!227435 mask!3524))))

(declare-fun b!500846 () Bool)

(declare-fun e!293414 () Bool)

(assert (=> b!500846 (= e!293410 (not e!293414))))

(declare-fun res!302669 () Bool)

(assert (=> b!500846 (=> res!302669 e!293414)))

(declare-fun lt!227431 () (_ BitVec 32))

(assert (=> b!500846 (= res!302669 (= lt!227434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227431 lt!227437 lt!227435 mask!3524)))))

(assert (=> b!500846 (= lt!227434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227439 (select (arr!15532 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500846 (= lt!227431 (toIndex!0 lt!227437 mask!3524))))

(assert (=> b!500846 (= lt!227437 (select (store (arr!15532 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500846 (= lt!227439 (toIndex!0 (select (arr!15532 a!3235) j!176) mask!3524))))

(assert (=> b!500846 (= lt!227435 (array!32303 (store (arr!15532 a!3235) i!1204 k0!2280) (size!15896 a!3235)))))

(assert (=> b!500846 e!293412))

(declare-fun res!302664 () Bool)

(assert (=> b!500846 (=> (not res!302664) (not e!293412))))

(assert (=> b!500846 (= res!302664 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227433 () Unit!15055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15055)

(assert (=> b!500846 (= lt!227433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500847 () Bool)

(declare-fun Unit!15058 () Unit!15055)

(assert (=> b!500847 (= e!293413 Unit!15058)))

(declare-fun b!500848 () Bool)

(assert (=> b!500848 (= e!293414 e!293409)))

(declare-fun res!302667 () Bool)

(assert (=> b!500848 (=> res!302667 e!293409)))

(assert (=> b!500848 (= res!302667 (or (bvsgt #b00000000000000000000000000000000 (x!47181 lt!227434)) (bvsgt (x!47181 lt!227434) #b01111111111111111111111111111110) (bvslt lt!227439 #b00000000000000000000000000000000) (bvsge lt!227439 (size!15896 a!3235)) (bvslt (index!18004 lt!227434) #b00000000000000000000000000000000) (bvsge (index!18004 lt!227434) (size!15896 a!3235)) (not (= lt!227434 (Intermediate!3955 false (index!18004 lt!227434) (x!47181 lt!227434))))))))

(assert (=> b!500848 (and (or (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227436 () Unit!15055)

(assert (=> b!500848 (= lt!227436 e!293413)))

(declare-fun c!59366 () Bool)

(assert (=> b!500848 (= c!59366 (= (select (arr!15532 a!3235) (index!18004 lt!227434)) (select (arr!15532 a!3235) j!176)))))

(assert (=> b!500848 (and (bvslt (x!47181 lt!227434) #b01111111111111111111111111111110) (or (= (select (arr!15532 a!3235) (index!18004 lt!227434)) (select (arr!15532 a!3235) j!176)) (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15532 a!3235) (index!18004 lt!227434)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500849 () Bool)

(declare-fun res!302671 () Bool)

(assert (=> b!500849 (=> (not res!302671) (not e!293411))))

(assert (=> b!500849 (= res!302671 (validKeyInArray!0 (select (arr!15532 a!3235) j!176)))))

(declare-fun b!500850 () Bool)

(declare-fun res!302665 () Bool)

(assert (=> b!500850 (=> res!302665 e!293414)))

(get-info :version)

(assert (=> b!500850 (= res!302665 (or (undefined!4767 lt!227434) (not ((_ is Intermediate!3955) lt!227434))))))

(declare-fun b!500851 () Bool)

(declare-fun res!302661 () Bool)

(assert (=> b!500851 (=> (not res!302661) (not e!293411))))

(declare-fun arrayContainsKey!0 (array!32302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500851 (= res!302661 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45476 res!302659) b!500838))

(assert (= (and b!500838 res!302668) b!500849))

(assert (= (and b!500849 res!302671) b!500843))

(assert (= (and b!500843 res!302666) b!500851))

(assert (= (and b!500851 res!302661) b!500839))

(assert (= (and b!500839 res!302670) b!500841))

(assert (= (and b!500841 res!302662) b!500842))

(assert (= (and b!500842 res!302660) b!500846))

(assert (= (and b!500846 res!302664) b!500837))

(assert (= (and b!500846 (not res!302669)) b!500850))

(assert (= (and b!500850 (not res!302665)) b!500848))

(assert (= (and b!500848 c!59366) b!500844))

(assert (= (and b!500848 (not c!59366)) b!500847))

(assert (= (and b!500844 res!302663) b!500840))

(assert (= (and b!500848 (not res!302667)) b!500845))

(declare-fun m!482185 () Bool)

(assert (=> b!500844 m!482185))

(declare-fun m!482187 () Bool)

(assert (=> b!500844 m!482187))

(declare-fun m!482189 () Bool)

(assert (=> b!500839 m!482189))

(declare-fun m!482191 () Bool)

(assert (=> b!500843 m!482191))

(declare-fun m!482193 () Bool)

(assert (=> b!500842 m!482193))

(declare-fun m!482195 () Bool)

(assert (=> b!500848 m!482195))

(declare-fun m!482197 () Bool)

(assert (=> b!500848 m!482197))

(declare-fun m!482199 () Bool)

(assert (=> start!45476 m!482199))

(declare-fun m!482201 () Bool)

(assert (=> start!45476 m!482201))

(declare-fun m!482203 () Bool)

(assert (=> b!500846 m!482203))

(declare-fun m!482205 () Bool)

(assert (=> b!500846 m!482205))

(declare-fun m!482207 () Bool)

(assert (=> b!500846 m!482207))

(declare-fun m!482209 () Bool)

(assert (=> b!500846 m!482209))

(assert (=> b!500846 m!482197))

(declare-fun m!482211 () Bool)

(assert (=> b!500846 m!482211))

(assert (=> b!500846 m!482197))

(declare-fun m!482213 () Bool)

(assert (=> b!500846 m!482213))

(declare-fun m!482215 () Bool)

(assert (=> b!500846 m!482215))

(assert (=> b!500846 m!482197))

(declare-fun m!482217 () Bool)

(assert (=> b!500846 m!482217))

(assert (=> b!500837 m!482197))

(assert (=> b!500837 m!482197))

(declare-fun m!482219 () Bool)

(assert (=> b!500837 m!482219))

(declare-fun m!482221 () Bool)

(assert (=> b!500851 m!482221))

(assert (=> b!500849 m!482197))

(assert (=> b!500849 m!482197))

(declare-fun m!482223 () Bool)

(assert (=> b!500849 m!482223))

(declare-fun m!482225 () Bool)

(assert (=> b!500841 m!482225))

(assert (=> b!500845 m!482187))

(check-sat (not b!500841) (not start!45476) (not b!500845) (not b!500851) (not b!500846) (not b!500837) (not b!500844) (not b!500842) (not b!500843) (not b!500849) (not b!500839))
(check-sat)
