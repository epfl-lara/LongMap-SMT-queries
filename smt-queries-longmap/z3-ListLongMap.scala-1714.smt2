; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31576 () Bool)

(assert start!31576)

(declare-fun b!315814 () Bool)

(declare-fun res!171049 () Bool)

(declare-fun e!196536 () Bool)

(assert (=> b!315814 (=> (not res!171049) (not e!196536))))

(declare-datatypes ((array!16100 0))(
  ( (array!16101 (arr!7620 (Array (_ BitVec 32) (_ BitVec 64))) (size!7972 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16100)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315814 (= res!171049 (and (= (select (arr!7620 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7972 a!3293))))))

(declare-fun b!315815 () Bool)

(assert (=> b!315815 false))

(declare-datatypes ((Unit!9727 0))(
  ( (Unit!9728) )
))
(declare-fun e!196537 () Unit!9727)

(declare-fun Unit!9729 () Unit!9727)

(assert (=> b!315815 (= e!196537 Unit!9729)))

(declare-fun b!315816 () Bool)

(declare-fun res!171054 () Bool)

(assert (=> b!315816 (=> (not res!171054) (not e!196536))))

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!315816 (= res!171054 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7620 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315817 () Bool)

(declare-fun e!196535 () Unit!9727)

(declare-fun Unit!9730 () Unit!9727)

(assert (=> b!315817 (= e!196535 Unit!9730)))

(declare-fun b!315818 () Bool)

(declare-fun e!196533 () Bool)

(assert (=> b!315818 (= e!196533 e!196536)))

(declare-fun res!171053 () Bool)

(assert (=> b!315818 (=> (not res!171053) (not e!196536))))

(declare-datatypes ((SeekEntryResult!2760 0))(
  ( (MissingZero!2760 (index!13216 (_ BitVec 32))) (Found!2760 (index!13217 (_ BitVec 32))) (Intermediate!2760 (undefined!3572 Bool) (index!13218 (_ BitVec 32)) (x!31462 (_ BitVec 32))) (Undefined!2760) (MissingVacant!2760 (index!13219 (_ BitVec 32))) )
))
(declare-fun lt!154386 () SeekEntryResult!2760)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16100 (_ BitVec 32)) SeekEntryResult!2760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315818 (= res!171053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154386))))

(assert (=> b!315818 (= lt!154386 (Intermediate!2760 false resIndex!52 resX!52))))

(declare-fun b!315819 () Bool)

(declare-fun res!171048 () Bool)

(assert (=> b!315819 (=> (not res!171048) (not e!196533))))

(assert (=> b!315819 (= res!171048 (and (= (size!7972 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7972 a!3293))))))

(declare-fun b!315820 () Bool)

(assert (=> b!315820 false))

(declare-fun lt!154384 () SeekEntryResult!2760)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315820 (= lt!154384 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9731 () Unit!9727)

(assert (=> b!315820 (= e!196537 Unit!9731)))

(declare-fun res!171052 () Bool)

(assert (=> start!31576 (=> (not res!171052) (not e!196533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31576 (= res!171052 (validMask!0 mask!3709))))

(assert (=> start!31576 e!196533))

(declare-fun array_inv!5583 (array!16100) Bool)

(assert (=> start!31576 (array_inv!5583 a!3293)))

(assert (=> start!31576 true))

(declare-fun b!315821 () Bool)

(assert (=> b!315821 (= e!196535 e!196537)))

(declare-fun c!50000 () Bool)

(assert (=> b!315821 (= c!50000 (or (= (select (arr!7620 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7620 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315822 () Bool)

(declare-fun res!171050 () Bool)

(assert (=> b!315822 (=> (not res!171050) (not e!196533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315822 (= res!171050 (validKeyInArray!0 k0!2441))))

(declare-fun b!315823 () Bool)

(declare-fun res!171056 () Bool)

(assert (=> b!315823 (=> (not res!171056) (not e!196533))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16100 (_ BitVec 32)) SeekEntryResult!2760)

(assert (=> b!315823 (= res!171056 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2760 i!1240)))))

(declare-fun b!315824 () Bool)

(assert (=> b!315824 (= e!196536 (not true))))

(assert (=> b!315824 (= index!1781 resIndex!52)))

(declare-fun lt!154385 () Unit!9727)

(assert (=> b!315824 (= lt!154385 e!196535)))

(declare-fun c!50001 () Bool)

(assert (=> b!315824 (= c!50001 (not (= resIndex!52 index!1781)))))

(declare-fun b!315825 () Bool)

(declare-fun res!171051 () Bool)

(assert (=> b!315825 (=> (not res!171051) (not e!196536))))

(assert (=> b!315825 (= res!171051 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154386))))

(declare-fun b!315826 () Bool)

(declare-fun res!171057 () Bool)

(assert (=> b!315826 (=> (not res!171057) (not e!196533))))

(declare-fun arrayContainsKey!0 (array!16100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315826 (= res!171057 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315827 () Bool)

(declare-fun res!171055 () Bool)

(assert (=> b!315827 (=> (not res!171055) (not e!196533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16100 (_ BitVec 32)) Bool)

(assert (=> b!315827 (= res!171055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31576 res!171052) b!315819))

(assert (= (and b!315819 res!171048) b!315822))

(assert (= (and b!315822 res!171050) b!315826))

(assert (= (and b!315826 res!171057) b!315823))

(assert (= (and b!315823 res!171056) b!315827))

(assert (= (and b!315827 res!171055) b!315818))

(assert (= (and b!315818 res!171053) b!315814))

(assert (= (and b!315814 res!171049) b!315825))

(assert (= (and b!315825 res!171051) b!315816))

(assert (= (and b!315816 res!171054) b!315824))

(assert (= (and b!315824 c!50001) b!315821))

(assert (= (and b!315824 (not c!50001)) b!315817))

(assert (= (and b!315821 c!50000) b!315815))

(assert (= (and b!315821 (not c!50000)) b!315820))

(declare-fun m!324937 () Bool)

(assert (=> b!315825 m!324937))

(declare-fun m!324939 () Bool)

(assert (=> b!315827 m!324939))

(declare-fun m!324941 () Bool)

(assert (=> b!315820 m!324941))

(assert (=> b!315820 m!324941))

(declare-fun m!324943 () Bool)

(assert (=> b!315820 m!324943))

(declare-fun m!324945 () Bool)

(assert (=> b!315822 m!324945))

(declare-fun m!324947 () Bool)

(assert (=> b!315816 m!324947))

(declare-fun m!324949 () Bool)

(assert (=> b!315814 m!324949))

(declare-fun m!324951 () Bool)

(assert (=> b!315826 m!324951))

(declare-fun m!324953 () Bool)

(assert (=> b!315818 m!324953))

(assert (=> b!315818 m!324953))

(declare-fun m!324955 () Bool)

(assert (=> b!315818 m!324955))

(declare-fun m!324957 () Bool)

(assert (=> start!31576 m!324957))

(declare-fun m!324959 () Bool)

(assert (=> start!31576 m!324959))

(assert (=> b!315821 m!324947))

(declare-fun m!324961 () Bool)

(assert (=> b!315823 m!324961))

(check-sat (not b!315827) (not b!315825) (not b!315820) (not b!315823) (not start!31576) (not b!315818) (not b!315822) (not b!315826))
(check-sat)
