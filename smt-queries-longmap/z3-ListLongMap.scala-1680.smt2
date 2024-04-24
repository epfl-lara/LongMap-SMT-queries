; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30954 () Bool)

(assert start!30954)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152222 () (_ BitVec 32))

(declare-fun b!311004 () Bool)

(declare-datatypes ((array!15869 0))(
  ( (array!15870 (arr!7516 (Array (_ BitVec 32) (_ BitVec 64))) (size!7868 (_ BitVec 32))) )
))
(declare-fun lt!152223 () array!15869)

(declare-fun e!194094 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2621 0))(
  ( (MissingZero!2621 (index!12660 (_ BitVec 32))) (Found!2621 (index!12661 (_ BitVec 32))) (Intermediate!2621 (undefined!3433 Bool) (index!12662 (_ BitVec 32)) (x!30991 (_ BitVec 32))) (Undefined!2621) (MissingVacant!2621 (index!12663 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15869 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!311004 (= e!194094 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152223 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152222 k0!2441 lt!152223 mask!3709)))))

(declare-fun a!3293 () array!15869)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311004 (= lt!152223 (array!15870 (store (arr!7516 a!3293) i!1240 k0!2441) (size!7868 a!3293)))))

(declare-fun b!311005 () Bool)

(declare-fun e!194097 () Bool)

(declare-fun e!194095 () Bool)

(assert (=> b!311005 (= e!194097 e!194095)))

(declare-fun res!167516 () Bool)

(assert (=> b!311005 (=> (not res!167516) (not e!194095))))

(declare-fun lt!152220 () SeekEntryResult!2621)

(declare-fun lt!152221 () SeekEntryResult!2621)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311005 (= res!167516 (and (= lt!152221 lt!152220) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7516 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311005 (= lt!152221 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311006 () Bool)

(declare-fun res!167517 () Bool)

(declare-fun e!194093 () Bool)

(assert (=> b!311006 (=> (not res!167517) (not e!194093))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15869 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!311006 (= res!167517 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2621 i!1240)))))

(declare-fun b!311007 () Bool)

(assert (=> b!311007 (= e!194095 (not true))))

(assert (=> b!311007 e!194094))

(declare-fun res!167511 () Bool)

(assert (=> b!311007 (=> (not res!167511) (not e!194094))))

(assert (=> b!311007 (= res!167511 (= lt!152221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152222 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311007 (= lt!152222 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311008 () Bool)

(assert (=> b!311008 (= e!194093 e!194097)))

(declare-fun res!167514 () Bool)

(assert (=> b!311008 (=> (not res!167514) (not e!194097))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311008 (= res!167514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152220))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311008 (= lt!152220 (Intermediate!2621 false resIndex!52 resX!52))))

(declare-fun b!311009 () Bool)

(declare-fun res!167509 () Bool)

(assert (=> b!311009 (=> (not res!167509) (not e!194093))))

(assert (=> b!311009 (= res!167509 (and (= (size!7868 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7868 a!3293))))))

(declare-fun b!311010 () Bool)

(declare-fun res!167513 () Bool)

(assert (=> b!311010 (=> (not res!167513) (not e!194093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311010 (= res!167513 (validKeyInArray!0 k0!2441))))

(declare-fun res!167512 () Bool)

(assert (=> start!30954 (=> (not res!167512) (not e!194093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30954 (= res!167512 (validMask!0 mask!3709))))

(assert (=> start!30954 e!194093))

(declare-fun array_inv!5466 (array!15869) Bool)

(assert (=> start!30954 (array_inv!5466 a!3293)))

(assert (=> start!30954 true))

(declare-fun b!311011 () Bool)

(declare-fun res!167510 () Bool)

(assert (=> b!311011 (=> (not res!167510) (not e!194097))))

(assert (=> b!311011 (= res!167510 (and (= (select (arr!7516 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7868 a!3293))))))

(declare-fun b!311012 () Bool)

(declare-fun res!167515 () Bool)

(assert (=> b!311012 (=> (not res!167515) (not e!194093))))

(declare-fun arrayContainsKey!0 (array!15869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311012 (= res!167515 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311013 () Bool)

(declare-fun res!167508 () Bool)

(assert (=> b!311013 (=> (not res!167508) (not e!194093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15869 (_ BitVec 32)) Bool)

(assert (=> b!311013 (= res!167508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30954 res!167512) b!311009))

(assert (= (and b!311009 res!167509) b!311010))

(assert (= (and b!311010 res!167513) b!311012))

(assert (= (and b!311012 res!167515) b!311006))

(assert (= (and b!311006 res!167517) b!311013))

(assert (= (and b!311013 res!167508) b!311008))

(assert (= (and b!311008 res!167514) b!311011))

(assert (= (and b!311011 res!167510) b!311005))

(assert (= (and b!311005 res!167516) b!311007))

(assert (= (and b!311007 res!167511) b!311004))

(declare-fun m!321139 () Bool)

(assert (=> b!311012 m!321139))

(declare-fun m!321141 () Bool)

(assert (=> b!311013 m!321141))

(declare-fun m!321143 () Bool)

(assert (=> b!311004 m!321143))

(declare-fun m!321145 () Bool)

(assert (=> b!311004 m!321145))

(declare-fun m!321147 () Bool)

(assert (=> b!311004 m!321147))

(declare-fun m!321149 () Bool)

(assert (=> b!311007 m!321149))

(declare-fun m!321151 () Bool)

(assert (=> b!311007 m!321151))

(declare-fun m!321153 () Bool)

(assert (=> start!30954 m!321153))

(declare-fun m!321155 () Bool)

(assert (=> start!30954 m!321155))

(declare-fun m!321157 () Bool)

(assert (=> b!311008 m!321157))

(assert (=> b!311008 m!321157))

(declare-fun m!321159 () Bool)

(assert (=> b!311008 m!321159))

(declare-fun m!321161 () Bool)

(assert (=> b!311006 m!321161))

(declare-fun m!321163 () Bool)

(assert (=> b!311005 m!321163))

(declare-fun m!321165 () Bool)

(assert (=> b!311005 m!321165))

(declare-fun m!321167 () Bool)

(assert (=> b!311010 m!321167))

(declare-fun m!321169 () Bool)

(assert (=> b!311011 m!321169))

(check-sat (not b!311008) (not start!30954) (not b!311004) (not b!311005) (not b!311007) (not b!311012) (not b!311006) (not b!311010) (not b!311013))
(check-sat)
