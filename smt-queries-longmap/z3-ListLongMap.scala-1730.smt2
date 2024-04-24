; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31818 () Bool)

(assert start!31818)

(declare-fun b!318069 () Bool)

(declare-fun res!172703 () Bool)

(declare-fun e!197675 () Bool)

(assert (=> b!318069 (=> (not res!172703) (not e!197675))))

(declare-datatypes ((array!16202 0))(
  ( (array!16203 (arr!7666 (Array (_ BitVec 32) (_ BitVec 64))) (size!8018 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16202)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318069 (= res!172703 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318070 () Bool)

(declare-fun res!172702 () Bool)

(declare-fun e!197674 () Bool)

(assert (=> b!318070 (=> (not res!172702) (not e!197674))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318070 (= res!172702 (and (= (select (arr!7666 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8018 a!3293))))))

(declare-fun b!318071 () Bool)

(declare-fun res!172705 () Bool)

(assert (=> b!318071 (=> (not res!172705) (not e!197675))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16202 (_ BitVec 32)) Bool)

(assert (=> b!318071 (= res!172705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318072 () Bool)

(declare-fun res!172704 () Bool)

(assert (=> b!318072 (=> (not res!172704) (not e!197675))))

(assert (=> b!318072 (= res!172704 (and (= (size!8018 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8018 a!3293))))))

(declare-fun res!172700 () Bool)

(assert (=> start!31818 (=> (not res!172700) (not e!197675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31818 (= res!172700 (validMask!0 mask!3709))))

(assert (=> start!31818 e!197675))

(declare-fun array_inv!5616 (array!16202) Bool)

(assert (=> start!31818 (array_inv!5616 a!3293)))

(assert (=> start!31818 true))

(declare-fun b!318073 () Bool)

(declare-fun lt!155243 () array!16202)

(declare-fun lt!155241 () (_ BitVec 32))

(declare-fun e!197676 () Bool)

(declare-datatypes ((SeekEntryResult!2771 0))(
  ( (MissingZero!2771 (index!13260 (_ BitVec 32))) (Found!2771 (index!13261 (_ BitVec 32))) (Intermediate!2771 (undefined!3583 Bool) (index!13262 (_ BitVec 32)) (x!31625 (_ BitVec 32))) (Undefined!2771) (MissingVacant!2771 (index!13263 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16202 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!318073 (= e!197676 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155243 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155241 k0!2441 lt!155243 mask!3709)))))

(assert (=> b!318073 (= lt!155243 (array!16203 (store (arr!7666 a!3293) i!1240 k0!2441) (size!8018 a!3293)))))

(declare-fun b!318074 () Bool)

(assert (=> b!318074 (= e!197675 e!197674)))

(declare-fun res!172698 () Bool)

(assert (=> b!318074 (=> (not res!172698) (not e!197674))))

(declare-fun lt!155244 () SeekEntryResult!2771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318074 (= res!172698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155244))))

(assert (=> b!318074 (= lt!155244 (Intermediate!2771 false resIndex!52 resX!52))))

(declare-fun b!318075 () Bool)

(declare-fun e!197672 () Bool)

(assert (=> b!318075 (= e!197674 e!197672)))

(declare-fun res!172701 () Bool)

(assert (=> b!318075 (=> (not res!172701) (not e!197672))))

(declare-fun lt!155242 () SeekEntryResult!2771)

(assert (=> b!318075 (= res!172701 (and (= lt!155242 lt!155244) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7666 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318075 (= lt!155242 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318076 () Bool)

(declare-fun res!172706 () Bool)

(assert (=> b!318076 (=> (not res!172706) (not e!197675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318076 (= res!172706 (validKeyInArray!0 k0!2441))))

(declare-fun b!318077 () Bool)

(declare-fun res!172707 () Bool)

(assert (=> b!318077 (=> (not res!172707) (not e!197675))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16202 (_ BitVec 32)) SeekEntryResult!2771)

(assert (=> b!318077 (= res!172707 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2771 i!1240)))))

(declare-fun b!318078 () Bool)

(assert (=> b!318078 (= e!197672 (not true))))

(assert (=> b!318078 e!197676))

(declare-fun res!172699 () Bool)

(assert (=> b!318078 (=> (not res!172699) (not e!197676))))

(assert (=> b!318078 (= res!172699 (= lt!155242 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155241 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318078 (= lt!155241 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!31818 res!172700) b!318072))

(assert (= (and b!318072 res!172704) b!318076))

(assert (= (and b!318076 res!172706) b!318069))

(assert (= (and b!318069 res!172703) b!318077))

(assert (= (and b!318077 res!172707) b!318071))

(assert (= (and b!318071 res!172705) b!318074))

(assert (= (and b!318074 res!172698) b!318070))

(assert (= (and b!318070 res!172702) b!318075))

(assert (= (and b!318075 res!172701) b!318078))

(assert (= (and b!318078 res!172699) b!318073))

(declare-fun m!326971 () Bool)

(assert (=> b!318078 m!326971))

(declare-fun m!326973 () Bool)

(assert (=> b!318078 m!326973))

(declare-fun m!326975 () Bool)

(assert (=> b!318074 m!326975))

(assert (=> b!318074 m!326975))

(declare-fun m!326977 () Bool)

(assert (=> b!318074 m!326977))

(declare-fun m!326979 () Bool)

(assert (=> b!318076 m!326979))

(declare-fun m!326981 () Bool)

(assert (=> b!318071 m!326981))

(declare-fun m!326983 () Bool)

(assert (=> start!31818 m!326983))

(declare-fun m!326985 () Bool)

(assert (=> start!31818 m!326985))

(declare-fun m!326987 () Bool)

(assert (=> b!318077 m!326987))

(declare-fun m!326989 () Bool)

(assert (=> b!318073 m!326989))

(declare-fun m!326991 () Bool)

(assert (=> b!318073 m!326991))

(declare-fun m!326993 () Bool)

(assert (=> b!318073 m!326993))

(declare-fun m!326995 () Bool)

(assert (=> b!318075 m!326995))

(declare-fun m!326997 () Bool)

(assert (=> b!318075 m!326997))

(declare-fun m!326999 () Bool)

(assert (=> b!318069 m!326999))

(declare-fun m!327001 () Bool)

(assert (=> b!318070 m!327001))

(check-sat (not start!31818) (not b!318075) (not b!318069) (not b!318076) (not b!318074) (not b!318071) (not b!318073) (not b!318078) (not b!318077))
(check-sat)
