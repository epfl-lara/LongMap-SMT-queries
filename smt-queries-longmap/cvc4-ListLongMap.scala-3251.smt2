; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45382 () Bool)

(assert start!45382)

(declare-fun b!498558 () Bool)

(declare-fun e!292199 () Bool)

(assert (=> b!498558 (= e!292199 false)))

(declare-fun b!498559 () Bool)

(declare-datatypes ((Unit!14884 0))(
  ( (Unit!14885) )
))
(declare-fun e!292206 () Unit!14884)

(declare-fun Unit!14886 () Unit!14884)

(assert (=> b!498559 (= e!292206 Unit!14886)))

(declare-fun b!498560 () Bool)

(declare-fun res!300639 () Bool)

(declare-fun e!292201 () Bool)

(assert (=> b!498560 (=> (not res!300639) (not e!292201))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498560 (= res!300639 (validKeyInArray!0 k!2280))))

(declare-fun b!498561 () Bool)

(declare-fun res!300648 () Bool)

(declare-fun e!292204 () Bool)

(assert (=> b!498561 (=> res!300648 e!292204)))

(declare-datatypes ((SeekEntryResult!3952 0))(
  ( (MissingZero!3952 (index!17990 (_ BitVec 32))) (Found!3952 (index!17991 (_ BitVec 32))) (Intermediate!3952 (undefined!4764 Bool) (index!17992 (_ BitVec 32)) (x!47037 (_ BitVec 32))) (Undefined!3952) (MissingVacant!3952 (index!17993 (_ BitVec 32))) )
))
(declare-fun lt!225864 () SeekEntryResult!3952)

(assert (=> b!498561 (= res!300648 (or (undefined!4764 lt!225864) (not (is-Intermediate!3952 lt!225864))))))

(declare-fun b!498562 () Bool)

(declare-fun res!300641 () Bool)

(declare-fun e!292200 () Bool)

(assert (=> b!498562 (=> (not res!300641) (not e!292200))))

(declare-datatypes ((array!32207 0))(
  ( (array!32208 (arr!15485 (Array (_ BitVec 32) (_ BitVec 64))) (size!15849 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32207)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32207 (_ BitVec 32)) Bool)

(assert (=> b!498562 (= res!300641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!292205 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!498563 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32207 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!498563 (= e!292205 (= (seekEntryOrOpen!0 (select (arr!15485 a!3235) j!176) a!3235 mask!3524) (Found!3952 j!176)))))

(declare-fun b!498565 () Bool)

(declare-fun res!300646 () Bool)

(assert (=> b!498565 (=> (not res!300646) (not e!292201))))

(declare-fun arrayContainsKey!0 (array!32207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498565 (= res!300646 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498566 () Bool)

(declare-fun e!292202 () Bool)

(assert (=> b!498566 (= e!292202 true)))

(declare-fun lt!225861 () (_ BitVec 64))

(declare-fun lt!225865 () (_ BitVec 32))

(declare-fun lt!225862 () SeekEntryResult!3952)

(declare-fun lt!225866 () array!32207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32207 (_ BitVec 32)) SeekEntryResult!3952)

(assert (=> b!498566 (= lt!225862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225865 lt!225861 lt!225866 mask!3524))))

(declare-fun b!498567 () Bool)

(declare-fun res!300649 () Bool)

(assert (=> b!498567 (=> (not res!300649) (not e!292200))))

(declare-datatypes ((List!9643 0))(
  ( (Nil!9640) (Cons!9639 (h!10513 (_ BitVec 64)) (t!15871 List!9643)) )
))
(declare-fun arrayNoDuplicates!0 (array!32207 (_ BitVec 32) List!9643) Bool)

(assert (=> b!498567 (= res!300649 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9640))))

(declare-fun b!498568 () Bool)

(declare-fun res!300644 () Bool)

(assert (=> b!498568 (=> (not res!300644) (not e!292201))))

(assert (=> b!498568 (= res!300644 (validKeyInArray!0 (select (arr!15485 a!3235) j!176)))))

(declare-fun b!498569 () Bool)

(declare-fun Unit!14887 () Unit!14884)

(assert (=> b!498569 (= e!292206 Unit!14887)))

(declare-fun lt!225863 () Unit!14884)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32207 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14884)

(assert (=> b!498569 (= lt!225863 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225865 #b00000000000000000000000000000000 (index!17992 lt!225864) (x!47037 lt!225864) mask!3524))))

(declare-fun res!300647 () Bool)

(assert (=> b!498569 (= res!300647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225865 lt!225861 lt!225866 mask!3524) (Intermediate!3952 false (index!17992 lt!225864) (x!47037 lt!225864))))))

(assert (=> b!498569 (=> (not res!300647) (not e!292199))))

(assert (=> b!498569 e!292199))

(declare-fun b!498570 () Bool)

(assert (=> b!498570 (= e!292201 e!292200)))

(declare-fun res!300638 () Bool)

(assert (=> b!498570 (=> (not res!300638) (not e!292200))))

(declare-fun lt!225868 () SeekEntryResult!3952)

(assert (=> b!498570 (= res!300638 (or (= lt!225868 (MissingZero!3952 i!1204)) (= lt!225868 (MissingVacant!3952 i!1204))))))

(assert (=> b!498570 (= lt!225868 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498564 () Bool)

(assert (=> b!498564 (= e!292200 (not e!292204))))

(declare-fun res!300645 () Bool)

(assert (=> b!498564 (=> res!300645 e!292204)))

(declare-fun lt!225867 () (_ BitVec 32))

(assert (=> b!498564 (= res!300645 (= lt!225864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225867 lt!225861 lt!225866 mask!3524)))))

(assert (=> b!498564 (= lt!225864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225865 (select (arr!15485 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498564 (= lt!225867 (toIndex!0 lt!225861 mask!3524))))

(assert (=> b!498564 (= lt!225861 (select (store (arr!15485 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498564 (= lt!225865 (toIndex!0 (select (arr!15485 a!3235) j!176) mask!3524))))

(assert (=> b!498564 (= lt!225866 (array!32208 (store (arr!15485 a!3235) i!1204 k!2280) (size!15849 a!3235)))))

(assert (=> b!498564 e!292205))

(declare-fun res!300642 () Bool)

(assert (=> b!498564 (=> (not res!300642) (not e!292205))))

(assert (=> b!498564 (= res!300642 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225859 () Unit!14884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14884)

(assert (=> b!498564 (= lt!225859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!300650 () Bool)

(assert (=> start!45382 (=> (not res!300650) (not e!292201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45382 (= res!300650 (validMask!0 mask!3524))))

(assert (=> start!45382 e!292201))

(assert (=> start!45382 true))

(declare-fun array_inv!11281 (array!32207) Bool)

(assert (=> start!45382 (array_inv!11281 a!3235)))

(declare-fun b!498571 () Bool)

(assert (=> b!498571 (= e!292204 e!292202)))

(declare-fun res!300640 () Bool)

(assert (=> b!498571 (=> res!300640 e!292202)))

(assert (=> b!498571 (= res!300640 (or (bvsgt #b00000000000000000000000000000000 (x!47037 lt!225864)) (bvsgt (x!47037 lt!225864) #b01111111111111111111111111111110) (bvslt lt!225865 #b00000000000000000000000000000000) (bvsge lt!225865 (size!15849 a!3235)) (bvslt (index!17992 lt!225864) #b00000000000000000000000000000000) (bvsge (index!17992 lt!225864) (size!15849 a!3235)) (not (= lt!225864 (Intermediate!3952 false (index!17992 lt!225864) (x!47037 lt!225864))))))))

(assert (=> b!498571 (and (or (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225860 () Unit!14884)

(assert (=> b!498571 (= lt!225860 e!292206)))

(declare-fun c!59237 () Bool)

(assert (=> b!498571 (= c!59237 (= (select (arr!15485 a!3235) (index!17992 lt!225864)) (select (arr!15485 a!3235) j!176)))))

(assert (=> b!498571 (and (bvslt (x!47037 lt!225864) #b01111111111111111111111111111110) (or (= (select (arr!15485 a!3235) (index!17992 lt!225864)) (select (arr!15485 a!3235) j!176)) (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15485 a!3235) (index!17992 lt!225864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498572 () Bool)

(declare-fun res!300643 () Bool)

(assert (=> b!498572 (=> (not res!300643) (not e!292201))))

(assert (=> b!498572 (= res!300643 (and (= (size!15849 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15849 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15849 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45382 res!300650) b!498572))

(assert (= (and b!498572 res!300643) b!498568))

(assert (= (and b!498568 res!300644) b!498560))

(assert (= (and b!498560 res!300639) b!498565))

(assert (= (and b!498565 res!300646) b!498570))

(assert (= (and b!498570 res!300638) b!498562))

(assert (= (and b!498562 res!300641) b!498567))

(assert (= (and b!498567 res!300649) b!498564))

(assert (= (and b!498564 res!300642) b!498563))

(assert (= (and b!498564 (not res!300645)) b!498561))

(assert (= (and b!498561 (not res!300648)) b!498571))

(assert (= (and b!498571 c!59237) b!498569))

(assert (= (and b!498571 (not c!59237)) b!498559))

(assert (= (and b!498569 res!300647) b!498558))

(assert (= (and b!498571 (not res!300640)) b!498566))

(declare-fun m!479817 () Bool)

(assert (=> b!498563 m!479817))

(assert (=> b!498563 m!479817))

(declare-fun m!479819 () Bool)

(assert (=> b!498563 m!479819))

(declare-fun m!479821 () Bool)

(assert (=> b!498567 m!479821))

(declare-fun m!479823 () Bool)

(assert (=> b!498571 m!479823))

(assert (=> b!498571 m!479817))

(declare-fun m!479825 () Bool)

(assert (=> b!498570 m!479825))

(declare-fun m!479827 () Bool)

(assert (=> b!498562 m!479827))

(assert (=> b!498568 m!479817))

(assert (=> b!498568 m!479817))

(declare-fun m!479829 () Bool)

(assert (=> b!498568 m!479829))

(declare-fun m!479831 () Bool)

(assert (=> b!498565 m!479831))

(declare-fun m!479833 () Bool)

(assert (=> b!498564 m!479833))

(declare-fun m!479835 () Bool)

(assert (=> b!498564 m!479835))

(declare-fun m!479837 () Bool)

(assert (=> b!498564 m!479837))

(declare-fun m!479839 () Bool)

(assert (=> b!498564 m!479839))

(assert (=> b!498564 m!479817))

(declare-fun m!479841 () Bool)

(assert (=> b!498564 m!479841))

(assert (=> b!498564 m!479817))

(declare-fun m!479843 () Bool)

(assert (=> b!498564 m!479843))

(declare-fun m!479845 () Bool)

(assert (=> b!498564 m!479845))

(assert (=> b!498564 m!479817))

(declare-fun m!479847 () Bool)

(assert (=> b!498564 m!479847))

(declare-fun m!479849 () Bool)

(assert (=> b!498560 m!479849))

(declare-fun m!479851 () Bool)

(assert (=> b!498566 m!479851))

(declare-fun m!479853 () Bool)

(assert (=> start!45382 m!479853))

(declare-fun m!479855 () Bool)

(assert (=> start!45382 m!479855))

(declare-fun m!479857 () Bool)

(assert (=> b!498569 m!479857))

(assert (=> b!498569 m!479851))

(push 1)

