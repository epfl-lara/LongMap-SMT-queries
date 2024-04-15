; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47388 () Bool)

(assert start!47388)

(declare-fun b!521097 () Bool)

(declare-fun res!319054 () Bool)

(declare-fun e!304007 () Bool)

(assert (=> b!521097 (=> res!319054 e!304007)))

(declare-datatypes ((SeekEntryResult!4432 0))(
  ( (MissingZero!4432 (index!19931 (_ BitVec 32))) (Found!4432 (index!19932 (_ BitVec 32))) (Intermediate!4432 (undefined!5244 Bool) (index!19933 (_ BitVec 32)) (x!48925 (_ BitVec 32))) (Undefined!4432) (MissingVacant!4432 (index!19934 (_ BitVec 32))) )
))
(declare-fun lt!238682 () SeekEntryResult!4432)

(get-info :version)

(assert (=> b!521097 (= res!319054 (or (undefined!5244 lt!238682) (not ((_ is Intermediate!4432) lt!238682))))))

(declare-fun b!521098 () Bool)

(declare-datatypes ((Unit!16174 0))(
  ( (Unit!16175) )
))
(declare-fun e!304011 () Unit!16174)

(declare-fun Unit!16176 () Unit!16174)

(assert (=> b!521098 (= e!304011 Unit!16176)))

(declare-fun b!521099 () Bool)

(declare-fun res!319050 () Bool)

(declare-fun e!304009 () Bool)

(assert (=> b!521099 (=> (not res!319050) (not e!304009))))

(declare-datatypes ((array!33224 0))(
  ( (array!33225 (arr!15968 (Array (_ BitVec 32) (_ BitVec 64))) (size!16333 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33224)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521099 (= res!319050 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521100 () Bool)

(assert (=> b!521100 (= e!304007 true)))

(assert (=> b!521100 (and (or (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238684 () Unit!16174)

(assert (=> b!521100 (= lt!238684 e!304011)))

(declare-fun c!61326 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521100 (= c!61326 (= (select (arr!15968 a!3235) (index!19933 lt!238682)) (select (arr!15968 a!3235) j!176)))))

(assert (=> b!521100 (and (bvslt (x!48925 lt!238682) #b01111111111111111111111111111110) (or (= (select (arr!15968 a!3235) (index!19933 lt!238682)) (select (arr!15968 a!3235) j!176)) (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15968 a!3235) (index!19933 lt!238682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521101 () Bool)

(declare-fun e!304008 () Bool)

(assert (=> b!521101 (= e!304008 false)))

(declare-fun b!521102 () Bool)

(declare-fun res!319052 () Bool)

(declare-fun e!304005 () Bool)

(assert (=> b!521102 (=> (not res!319052) (not e!304005))))

(declare-datatypes ((List!10165 0))(
  ( (Nil!10162) (Cons!10161 (h!11083 (_ BitVec 64)) (t!16384 List!10165)) )
))
(declare-fun arrayNoDuplicates!0 (array!33224 (_ BitVec 32) List!10165) Bool)

(assert (=> b!521102 (= res!319052 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10162))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!304010 () Bool)

(declare-fun b!521103 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33224 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!521103 (= e!304010 (= (seekEntryOrOpen!0 (select (arr!15968 a!3235) j!176) a!3235 mask!3524) (Found!4432 j!176)))))

(declare-fun b!521104 () Bool)

(declare-fun res!319056 () Bool)

(assert (=> b!521104 (=> (not res!319056) (not e!304009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521104 (= res!319056 (validKeyInArray!0 k0!2280))))

(declare-fun b!521105 () Bool)

(declare-fun res!319057 () Bool)

(assert (=> b!521105 (=> (not res!319057) (not e!304009))))

(assert (=> b!521105 (= res!319057 (validKeyInArray!0 (select (arr!15968 a!3235) j!176)))))

(declare-fun b!521106 () Bool)

(declare-fun Unit!16177 () Unit!16174)

(assert (=> b!521106 (= e!304011 Unit!16177)))

(declare-fun lt!238683 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238687 () Unit!16174)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16174)

(assert (=> b!521106 (= lt!238687 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238683 #b00000000000000000000000000000000 (index!19933 lt!238682) (x!48925 lt!238682) mask!3524))))

(declare-fun lt!238680 () (_ BitVec 64))

(declare-fun lt!238681 () array!33224)

(declare-fun res!319058 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33224 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!521106 (= res!319058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238683 lt!238680 lt!238681 mask!3524) (Intermediate!4432 false (index!19933 lt!238682) (x!48925 lt!238682))))))

(assert (=> b!521106 (=> (not res!319058) (not e!304008))))

(assert (=> b!521106 e!304008))

(declare-fun b!521107 () Bool)

(assert (=> b!521107 (= e!304009 e!304005)))

(declare-fun res!319051 () Bool)

(assert (=> b!521107 (=> (not res!319051) (not e!304005))))

(declare-fun lt!238679 () SeekEntryResult!4432)

(assert (=> b!521107 (= res!319051 (or (= lt!238679 (MissingZero!4432 i!1204)) (= lt!238679 (MissingVacant!4432 i!1204))))))

(assert (=> b!521107 (= lt!238679 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521109 () Bool)

(assert (=> b!521109 (= e!304005 (not e!304007))))

(declare-fun res!319048 () Bool)

(assert (=> b!521109 (=> res!319048 e!304007)))

(declare-fun lt!238686 () (_ BitVec 32))

(assert (=> b!521109 (= res!319048 (= lt!238682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238686 lt!238680 lt!238681 mask!3524)))))

(assert (=> b!521109 (= lt!238682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238683 (select (arr!15968 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521109 (= lt!238686 (toIndex!0 lt!238680 mask!3524))))

(assert (=> b!521109 (= lt!238680 (select (store (arr!15968 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521109 (= lt!238683 (toIndex!0 (select (arr!15968 a!3235) j!176) mask!3524))))

(assert (=> b!521109 (= lt!238681 (array!33225 (store (arr!15968 a!3235) i!1204 k0!2280) (size!16333 a!3235)))))

(assert (=> b!521109 e!304010))

(declare-fun res!319055 () Bool)

(assert (=> b!521109 (=> (not res!319055) (not e!304010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33224 (_ BitVec 32)) Bool)

(assert (=> b!521109 (= res!319055 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238685 () Unit!16174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16174)

(assert (=> b!521109 (= lt!238685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521110 () Bool)

(declare-fun res!319053 () Bool)

(assert (=> b!521110 (=> (not res!319053) (not e!304009))))

(assert (=> b!521110 (= res!319053 (and (= (size!16333 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16333 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16333 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!319047 () Bool)

(assert (=> start!47388 (=> (not res!319047) (not e!304009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47388 (= res!319047 (validMask!0 mask!3524))))

(assert (=> start!47388 e!304009))

(assert (=> start!47388 true))

(declare-fun array_inv!11851 (array!33224) Bool)

(assert (=> start!47388 (array_inv!11851 a!3235)))

(declare-fun b!521108 () Bool)

(declare-fun res!319049 () Bool)

(assert (=> b!521108 (=> (not res!319049) (not e!304005))))

(assert (=> b!521108 (= res!319049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47388 res!319047) b!521110))

(assert (= (and b!521110 res!319053) b!521105))

(assert (= (and b!521105 res!319057) b!521104))

(assert (= (and b!521104 res!319056) b!521099))

(assert (= (and b!521099 res!319050) b!521107))

(assert (= (and b!521107 res!319051) b!521108))

(assert (= (and b!521108 res!319049) b!521102))

(assert (= (and b!521102 res!319052) b!521109))

(assert (= (and b!521109 res!319055) b!521103))

(assert (= (and b!521109 (not res!319048)) b!521097))

(assert (= (and b!521097 (not res!319054)) b!521100))

(assert (= (and b!521100 c!61326) b!521106))

(assert (= (and b!521100 (not c!61326)) b!521098))

(assert (= (and b!521106 res!319058) b!521101))

(declare-fun m!501529 () Bool)

(assert (=> b!521099 m!501529))

(declare-fun m!501531 () Bool)

(assert (=> b!521108 m!501531))

(declare-fun m!501533 () Bool)

(assert (=> b!521106 m!501533))

(declare-fun m!501535 () Bool)

(assert (=> b!521106 m!501535))

(declare-fun m!501537 () Bool)

(assert (=> b!521100 m!501537))

(declare-fun m!501539 () Bool)

(assert (=> b!521100 m!501539))

(declare-fun m!501541 () Bool)

(assert (=> start!47388 m!501541))

(declare-fun m!501543 () Bool)

(assert (=> start!47388 m!501543))

(assert (=> b!521103 m!501539))

(assert (=> b!521103 m!501539))

(declare-fun m!501545 () Bool)

(assert (=> b!521103 m!501545))

(assert (=> b!521109 m!501539))

(declare-fun m!501547 () Bool)

(assert (=> b!521109 m!501547))

(declare-fun m!501549 () Bool)

(assert (=> b!521109 m!501549))

(declare-fun m!501551 () Bool)

(assert (=> b!521109 m!501551))

(declare-fun m!501553 () Bool)

(assert (=> b!521109 m!501553))

(assert (=> b!521109 m!501539))

(declare-fun m!501555 () Bool)

(assert (=> b!521109 m!501555))

(assert (=> b!521109 m!501539))

(declare-fun m!501557 () Bool)

(assert (=> b!521109 m!501557))

(declare-fun m!501559 () Bool)

(assert (=> b!521109 m!501559))

(declare-fun m!501561 () Bool)

(assert (=> b!521109 m!501561))

(declare-fun m!501563 () Bool)

(assert (=> b!521102 m!501563))

(declare-fun m!501565 () Bool)

(assert (=> b!521104 m!501565))

(assert (=> b!521105 m!501539))

(assert (=> b!521105 m!501539))

(declare-fun m!501567 () Bool)

(assert (=> b!521105 m!501567))

(declare-fun m!501569 () Bool)

(assert (=> b!521107 m!501569))

(check-sat (not b!521108) (not b!521105) (not b!521109) (not b!521106) (not b!521099) (not b!521104) (not b!521107) (not start!47388) (not b!521103) (not b!521102))
(check-sat)
