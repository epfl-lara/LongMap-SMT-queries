; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31566 () Bool)

(assert start!31566)

(declare-fun b!315845 () Bool)

(declare-fun res!171112 () Bool)

(declare-fun e!196530 () Bool)

(assert (=> b!315845 (=> (not res!171112) (not e!196530))))

(declare-datatypes ((array!16103 0))(
  ( (array!16104 (arr!7621 (Array (_ BitVec 32) (_ BitVec 64))) (size!7973 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16103)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2726 0))(
  ( (MissingZero!2726 (index!13080 (_ BitVec 32))) (Found!2726 (index!13081 (_ BitVec 32))) (Intermediate!2726 (undefined!3538 Bool) (index!13082 (_ BitVec 32)) (x!31433 (_ BitVec 32))) (Undefined!2726) (MissingVacant!2726 (index!13083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16103 (_ BitVec 32)) SeekEntryResult!2726)

(assert (=> b!315845 (= res!171112 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2726 i!1240)))))

(declare-fun res!171114 () Bool)

(assert (=> start!31566 (=> (not res!171114) (not e!196530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31566 (= res!171114 (validMask!0 mask!3709))))

(assert (=> start!31566 e!196530))

(declare-fun array_inv!5571 (array!16103) Bool)

(assert (=> start!31566 (array_inv!5571 a!3293)))

(assert (=> start!31566 true))

(declare-fun b!315846 () Bool)

(declare-fun e!196533 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315846 (= e!196533 (not (= (select (arr!7621 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!315846 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9701 0))(
  ( (Unit!9702) )
))
(declare-fun lt!154420 () Unit!9701)

(declare-fun e!196531 () Unit!9701)

(assert (=> b!315846 (= lt!154420 e!196531)))

(declare-fun c!49987 () Bool)

(assert (=> b!315846 (= c!49987 (not (= resIndex!52 index!1781)))))

(declare-fun b!315847 () Bool)

(declare-fun res!171111 () Bool)

(assert (=> b!315847 (=> (not res!171111) (not e!196533))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!315847 (= res!171111 (and (= (select (arr!7621 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7973 a!3293))))))

(declare-fun b!315848 () Bool)

(assert (=> b!315848 false))

(declare-fun lt!154422 () SeekEntryResult!2726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16103 (_ BitVec 32)) SeekEntryResult!2726)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315848 (= lt!154422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun e!196532 () Unit!9701)

(declare-fun Unit!9703 () Unit!9701)

(assert (=> b!315848 (= e!196532 Unit!9703)))

(declare-fun b!315849 () Bool)

(assert (=> b!315849 (= e!196530 e!196533)))

(declare-fun res!171107 () Bool)

(assert (=> b!315849 (=> (not res!171107) (not e!196533))))

(declare-fun lt!154421 () SeekEntryResult!2726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315849 (= res!171107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154421))))

(assert (=> b!315849 (= lt!154421 (Intermediate!2726 false resIndex!52 resX!52))))

(declare-fun b!315850 () Bool)

(declare-fun res!171105 () Bool)

(assert (=> b!315850 (=> (not res!171105) (not e!196530))))

(declare-fun arrayContainsKey!0 (array!16103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315850 (= res!171105 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315851 () Bool)

(assert (=> b!315851 (= e!196531 e!196532)))

(declare-fun c!49988 () Bool)

(assert (=> b!315851 (= c!49988 (or (= (select (arr!7621 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7621 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315852 () Bool)

(declare-fun res!171108 () Bool)

(assert (=> b!315852 (=> (not res!171108) (not e!196530))))

(assert (=> b!315852 (= res!171108 (and (= (size!7973 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7973 a!3293))))))

(declare-fun b!315853 () Bool)

(declare-fun res!171113 () Bool)

(assert (=> b!315853 (=> (not res!171113) (not e!196530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315853 (= res!171113 (validKeyInArray!0 k0!2441))))

(declare-fun b!315854 () Bool)

(declare-fun res!171110 () Bool)

(assert (=> b!315854 (=> (not res!171110) (not e!196533))))

(assert (=> b!315854 (= res!171110 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154421))))

(declare-fun b!315855 () Bool)

(declare-fun Unit!9704 () Unit!9701)

(assert (=> b!315855 (= e!196531 Unit!9704)))

(declare-fun b!315856 () Bool)

(declare-fun res!171106 () Bool)

(assert (=> b!315856 (=> (not res!171106) (not e!196530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16103 (_ BitVec 32)) Bool)

(assert (=> b!315856 (= res!171106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315857 () Bool)

(assert (=> b!315857 false))

(declare-fun Unit!9705 () Unit!9701)

(assert (=> b!315857 (= e!196532 Unit!9705)))

(declare-fun b!315858 () Bool)

(declare-fun res!171109 () Bool)

(assert (=> b!315858 (=> (not res!171109) (not e!196533))))

(assert (=> b!315858 (= res!171109 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7621 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!31566 res!171114) b!315852))

(assert (= (and b!315852 res!171108) b!315853))

(assert (= (and b!315853 res!171113) b!315850))

(assert (= (and b!315850 res!171105) b!315845))

(assert (= (and b!315845 res!171112) b!315856))

(assert (= (and b!315856 res!171106) b!315849))

(assert (= (and b!315849 res!171107) b!315847))

(assert (= (and b!315847 res!171111) b!315854))

(assert (= (and b!315854 res!171110) b!315858))

(assert (= (and b!315858 res!171109) b!315846))

(assert (= (and b!315846 c!49987) b!315851))

(assert (= (and b!315846 (not c!49987)) b!315855))

(assert (= (and b!315851 c!49988) b!315857))

(assert (= (and b!315851 (not c!49988)) b!315848))

(declare-fun m!325141 () Bool)

(assert (=> b!315856 m!325141))

(declare-fun m!325143 () Bool)

(assert (=> b!315858 m!325143))

(assert (=> b!315851 m!325143))

(declare-fun m!325145 () Bool)

(assert (=> b!315850 m!325145))

(declare-fun m!325147 () Bool)

(assert (=> b!315845 m!325147))

(declare-fun m!325149 () Bool)

(assert (=> b!315854 m!325149))

(declare-fun m!325151 () Bool)

(assert (=> b!315848 m!325151))

(assert (=> b!315848 m!325151))

(declare-fun m!325153 () Bool)

(assert (=> b!315848 m!325153))

(declare-fun m!325155 () Bool)

(assert (=> b!315847 m!325155))

(declare-fun m!325157 () Bool)

(assert (=> start!31566 m!325157))

(declare-fun m!325159 () Bool)

(assert (=> start!31566 m!325159))

(declare-fun m!325161 () Bool)

(assert (=> b!315849 m!325161))

(assert (=> b!315849 m!325161))

(declare-fun m!325163 () Bool)

(assert (=> b!315849 m!325163))

(declare-fun m!325165 () Bool)

(assert (=> b!315853 m!325165))

(assert (=> b!315846 m!325143))

(check-sat (not b!315845) (not b!315856) (not start!31566) (not b!315854) (not b!315853) (not b!315848) (not b!315850) (not b!315849))
(check-sat)
