; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31506 () Bool)

(assert start!31506)

(declare-fun res!170738 () Bool)

(declare-fun e!196276 () Bool)

(assert (=> start!31506 (=> (not res!170738) (not e!196276))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31506 (= res!170738 (validMask!0 mask!3709))))

(assert (=> start!31506 e!196276))

(declare-datatypes ((array!16081 0))(
  ( (array!16082 (arr!7612 (Array (_ BitVec 32) (_ BitVec 64))) (size!7964 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16081)

(declare-fun array_inv!5575 (array!16081) Bool)

(assert (=> start!31506 (array_inv!5575 a!3293)))

(assert (=> start!31506 true))

(declare-fun b!315285 () Bool)

(declare-fun e!196278 () Bool)

(declare-datatypes ((SeekEntryResult!2752 0))(
  ( (MissingZero!2752 (index!13184 (_ BitVec 32))) (Found!2752 (index!13185 (_ BitVec 32))) (Intermediate!2752 (undefined!3564 Bool) (index!13186 (_ BitVec 32)) (x!31421 (_ BitVec 32))) (Undefined!2752) (MissingVacant!2752 (index!13187 (_ BitVec 32))) )
))
(declare-fun lt!154203 () SeekEntryResult!2752)

(assert (=> b!315285 (= e!196278 (not (is-Intermediate!2752 lt!154203)))))

(declare-fun lt!154201 () SeekEntryResult!2752)

(assert (=> b!315285 (= lt!154201 lt!154203)))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16081 (_ BitVec 32)) SeekEntryResult!2752)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315285 (= lt!154203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!315286 () Bool)

(declare-fun res!170736 () Bool)

(assert (=> b!315286 (=> (not res!170736) (not e!196276))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315286 (= res!170736 (and (= (size!7964 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7964 a!3293))))))

(declare-fun b!315287 () Bool)

(declare-fun res!170734 () Bool)

(assert (=> b!315287 (=> (not res!170734) (not e!196276))))

(declare-fun arrayContainsKey!0 (array!16081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315287 (= res!170734 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315288 () Bool)

(declare-fun res!170739 () Bool)

(assert (=> b!315288 (=> (not res!170739) (not e!196276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315288 (= res!170739 (validKeyInArray!0 k!2441))))

(declare-fun b!315289 () Bool)

(declare-fun e!196279 () Bool)

(assert (=> b!315289 (= e!196279 e!196278)))

(declare-fun res!170741 () Bool)

(assert (=> b!315289 (=> (not res!170741) (not e!196278))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154202 () SeekEntryResult!2752)

(assert (=> b!315289 (= res!170741 (and (= lt!154201 lt!154202) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7612 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7612 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7612 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315289 (= lt!154201 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!315290 () Bool)

(declare-fun res!170740 () Bool)

(assert (=> b!315290 (=> (not res!170740) (not e!196276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16081 (_ BitVec 32)) Bool)

(assert (=> b!315290 (= res!170740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315291 () Bool)

(declare-fun res!170742 () Bool)

(assert (=> b!315291 (=> (not res!170742) (not e!196279))))

(assert (=> b!315291 (= res!170742 (and (= (select (arr!7612 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7964 a!3293))))))

(declare-fun b!315292 () Bool)

(declare-fun res!170737 () Bool)

(assert (=> b!315292 (=> (not res!170737) (not e!196276))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16081 (_ BitVec 32)) SeekEntryResult!2752)

(assert (=> b!315292 (= res!170737 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2752 i!1240)))))

(declare-fun b!315293 () Bool)

(assert (=> b!315293 (= e!196276 e!196279)))

(declare-fun res!170735 () Bool)

(assert (=> b!315293 (=> (not res!170735) (not e!196279))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315293 (= res!170735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154202))))

(assert (=> b!315293 (= lt!154202 (Intermediate!2752 false resIndex!52 resX!52))))

(assert (= (and start!31506 res!170738) b!315286))

(assert (= (and b!315286 res!170736) b!315288))

(assert (= (and b!315288 res!170739) b!315287))

(assert (= (and b!315287 res!170734) b!315292))

(assert (= (and b!315292 res!170737) b!315290))

(assert (= (and b!315290 res!170740) b!315293))

(assert (= (and b!315293 res!170735) b!315291))

(assert (= (and b!315291 res!170742) b!315289))

(assert (= (and b!315289 res!170741) b!315285))

(declare-fun m!324591 () Bool)

(assert (=> b!315291 m!324591))

(declare-fun m!324593 () Bool)

(assert (=> b!315292 m!324593))

(declare-fun m!324595 () Bool)

(assert (=> start!31506 m!324595))

(declare-fun m!324597 () Bool)

(assert (=> start!31506 m!324597))

(declare-fun m!324599 () Bool)

(assert (=> b!315288 m!324599))

(declare-fun m!324601 () Bool)

(assert (=> b!315287 m!324601))

(declare-fun m!324603 () Bool)

(assert (=> b!315290 m!324603))

(declare-fun m!324605 () Bool)

(assert (=> b!315289 m!324605))

(declare-fun m!324607 () Bool)

(assert (=> b!315289 m!324607))

(declare-fun m!324609 () Bool)

(assert (=> b!315285 m!324609))

(assert (=> b!315285 m!324609))

(declare-fun m!324611 () Bool)

(assert (=> b!315285 m!324611))

(declare-fun m!324613 () Bool)

(assert (=> b!315293 m!324613))

(assert (=> b!315293 m!324613))

(declare-fun m!324615 () Bool)

(assert (=> b!315293 m!324615))

(push 1)

(assert (not start!31506))

(assert (not b!315287))

(assert (not b!315290))

(assert (not b!315288))

(assert (not b!315292))

(assert (not b!315289))

(assert (not b!315293))

(assert (not b!315285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

