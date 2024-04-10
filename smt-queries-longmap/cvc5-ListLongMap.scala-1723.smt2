; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31790 () Bool)

(assert start!31790)

(declare-fun b!317492 () Bool)

(declare-fun res!172080 () Bool)

(declare-fun e!197393 () Bool)

(assert (=> b!317492 (=> (not res!172080) (not e!197393))))

(declare-datatypes ((array!16161 0))(
  ( (array!16162 (arr!7646 (Array (_ BitVec 32) (_ BitVec 64))) (size!7998 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16161)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16161 (_ BitVec 32)) Bool)

(assert (=> b!317492 (= res!172080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317493 () Bool)

(declare-fun res!172077 () Bool)

(declare-fun e!197394 () Bool)

(assert (=> b!317493 (=> (not res!172077) (not e!197394))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317493 (= res!172077 (and (= (select (arr!7646 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7998 a!3293))))))

(declare-fun b!317494 () Bool)

(declare-fun e!197395 () Bool)

(assert (=> b!317494 (= e!197394 e!197395)))

(declare-fun res!172078 () Bool)

(assert (=> b!317494 (=> (not res!172078) (not e!197395))))

(declare-datatypes ((SeekEntryResult!2786 0))(
  ( (MissingZero!2786 (index!13320 (_ BitVec 32))) (Found!2786 (index!13321 (_ BitVec 32))) (Intermediate!2786 (undefined!3598 Bool) (index!13322 (_ BitVec 32)) (x!31587 (_ BitVec 32))) (Undefined!2786) (MissingVacant!2786 (index!13323 (_ BitVec 32))) )
))
(declare-fun lt!154974 () SeekEntryResult!2786)

(declare-fun lt!154971 () SeekEntryResult!2786)

(declare-fun k!2441 () (_ BitVec 64))

(assert (=> b!317494 (= res!172078 (and (= lt!154974 lt!154971) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7646 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16161 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!317494 (= lt!154974 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317495 () Bool)

(declare-fun res!172072 () Bool)

(assert (=> b!317495 (=> (not res!172072) (not e!197393))))

(assert (=> b!317495 (= res!172072 (and (= (size!7998 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7998 a!3293))))))

(declare-fun lt!154973 () array!16161)

(declare-fun b!317496 () Bool)

(declare-fun e!197392 () Bool)

(declare-fun lt!154972 () (_ BitVec 32))

(assert (=> b!317496 (= e!197392 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154973 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154972 k!2441 lt!154973 mask!3709)))))

(assert (=> b!317496 (= lt!154973 (array!16162 (store (arr!7646 a!3293) i!1240 k!2441) (size!7998 a!3293)))))

(declare-fun b!317497 () Bool)

(assert (=> b!317497 (= e!197393 e!197394)))

(declare-fun res!172075 () Bool)

(assert (=> b!317497 (=> (not res!172075) (not e!197394))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317497 (= res!172075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154971))))

(assert (=> b!317497 (= lt!154971 (Intermediate!2786 false resIndex!52 resX!52))))

(declare-fun res!172074 () Bool)

(assert (=> start!31790 (=> (not res!172074) (not e!197393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31790 (= res!172074 (validMask!0 mask!3709))))

(assert (=> start!31790 e!197393))

(declare-fun array_inv!5609 (array!16161) Bool)

(assert (=> start!31790 (array_inv!5609 a!3293)))

(assert (=> start!31790 true))

(declare-fun b!317498 () Bool)

(declare-fun res!172071 () Bool)

(assert (=> b!317498 (=> (not res!172071) (not e!197393))))

(declare-fun arrayContainsKey!0 (array!16161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317498 (= res!172071 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317499 () Bool)

(assert (=> b!317499 (= e!197395 (not true))))

(assert (=> b!317499 e!197392))

(declare-fun res!172073 () Bool)

(assert (=> b!317499 (=> (not res!172073) (not e!197392))))

(assert (=> b!317499 (= res!172073 (= lt!154974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154972 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317499 (= lt!154972 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317500 () Bool)

(declare-fun res!172076 () Bool)

(assert (=> b!317500 (=> (not res!172076) (not e!197393))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16161 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!317500 (= res!172076 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2786 i!1240)))))

(declare-fun b!317501 () Bool)

(declare-fun res!172079 () Bool)

(assert (=> b!317501 (=> (not res!172079) (not e!197393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317501 (= res!172079 (validKeyInArray!0 k!2441))))

(assert (= (and start!31790 res!172074) b!317495))

(assert (= (and b!317495 res!172072) b!317501))

(assert (= (and b!317501 res!172079) b!317498))

(assert (= (and b!317498 res!172071) b!317500))

(assert (= (and b!317500 res!172076) b!317492))

(assert (= (and b!317492 res!172080) b!317497))

(assert (= (and b!317497 res!172075) b!317493))

(assert (= (and b!317493 res!172077) b!317494))

(assert (= (and b!317494 res!172078) b!317499))

(assert (= (and b!317499 res!172073) b!317496))

(declare-fun m!326129 () Bool)

(assert (=> start!31790 m!326129))

(declare-fun m!326131 () Bool)

(assert (=> start!31790 m!326131))

(declare-fun m!326133 () Bool)

(assert (=> b!317499 m!326133))

(declare-fun m!326135 () Bool)

(assert (=> b!317499 m!326135))

(declare-fun m!326137 () Bool)

(assert (=> b!317496 m!326137))

(declare-fun m!326139 () Bool)

(assert (=> b!317496 m!326139))

(declare-fun m!326141 () Bool)

(assert (=> b!317496 m!326141))

(declare-fun m!326143 () Bool)

(assert (=> b!317498 m!326143))

(declare-fun m!326145 () Bool)

(assert (=> b!317492 m!326145))

(declare-fun m!326147 () Bool)

(assert (=> b!317501 m!326147))

(declare-fun m!326149 () Bool)

(assert (=> b!317497 m!326149))

(assert (=> b!317497 m!326149))

(declare-fun m!326151 () Bool)

(assert (=> b!317497 m!326151))

(declare-fun m!326153 () Bool)

(assert (=> b!317500 m!326153))

(declare-fun m!326155 () Bool)

(assert (=> b!317493 m!326155))

(declare-fun m!326157 () Bool)

(assert (=> b!317494 m!326157))

(declare-fun m!326159 () Bool)

(assert (=> b!317494 m!326159))

(push 1)

