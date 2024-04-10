; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31578 () Bool)

(assert start!31578)

(declare-fun b!315856 () Bool)

(declare-fun res!171083 () Bool)

(declare-fun e!196552 () Bool)

(assert (=> b!315856 (=> (not res!171083) (not e!196552))))

(declare-datatypes ((array!16102 0))(
  ( (array!16103 (arr!7621 (Array (_ BitVec 32) (_ BitVec 64))) (size!7973 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16102)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2761 0))(
  ( (MissingZero!2761 (index!13220 (_ BitVec 32))) (Found!2761 (index!13221 (_ BitVec 32))) (Intermediate!2761 (undefined!3573 Bool) (index!13222 (_ BitVec 32)) (x!31463 (_ BitVec 32))) (Undefined!2761) (MissingVacant!2761 (index!13223 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16102 (_ BitVec 32)) SeekEntryResult!2761)

(assert (=> b!315856 (= res!171083 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2761 i!1240)))))

(declare-fun res!171078 () Bool)

(assert (=> start!31578 (=> (not res!171078) (not e!196552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31578 (= res!171078 (validMask!0 mask!3709))))

(assert (=> start!31578 e!196552))

(declare-fun array_inv!5584 (array!16102) Bool)

(assert (=> start!31578 (array_inv!5584 a!3293)))

(assert (=> start!31578 true))

(declare-fun b!315857 () Bool)

(declare-fun res!171079 () Bool)

(assert (=> b!315857 (=> (not res!171079) (not e!196552))))

(assert (=> b!315857 (= res!171079 (and (= (size!7973 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7973 a!3293))))))

(declare-fun b!315858 () Bool)

(declare-fun res!171082 () Bool)

(declare-fun e!196551 () Bool)

(assert (=> b!315858 (=> (not res!171082) (not e!196551))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315858 (= res!171082 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7621 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315859 () Bool)

(assert (=> b!315859 (= e!196551 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!315859 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9732 0))(
  ( (Unit!9733) )
))
(declare-fun lt!154393 () Unit!9732)

(declare-fun e!196548 () Unit!9732)

(assert (=> b!315859 (= lt!154393 e!196548)))

(declare-fun c!50006 () Bool)

(assert (=> b!315859 (= c!50006 (not (= resIndex!52 index!1781)))))

(declare-fun b!315860 () Bool)

(declare-fun res!171086 () Bool)

(assert (=> b!315860 (=> (not res!171086) (not e!196552))))

(declare-fun arrayContainsKey!0 (array!16102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315860 (= res!171086 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315861 () Bool)

(declare-fun e!196549 () Unit!9732)

(assert (=> b!315861 (= e!196548 e!196549)))

(declare-fun c!50007 () Bool)

(assert (=> b!315861 (= c!50007 (or (= (select (arr!7621 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7621 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315862 () Bool)

(declare-fun res!171084 () Bool)

(assert (=> b!315862 (=> (not res!171084) (not e!196552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315862 (= res!171084 (validKeyInArray!0 k!2441))))

(declare-fun b!315863 () Bool)

(declare-fun res!171081 () Bool)

(assert (=> b!315863 (=> (not res!171081) (not e!196552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16102 (_ BitVec 32)) Bool)

(assert (=> b!315863 (= res!171081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315864 () Bool)

(declare-fun res!171080 () Bool)

(assert (=> b!315864 (=> (not res!171080) (not e!196551))))

(declare-fun lt!154395 () SeekEntryResult!2761)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16102 (_ BitVec 32)) SeekEntryResult!2761)

(assert (=> b!315864 (= res!171080 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154395))))

(declare-fun b!315865 () Bool)

(assert (=> b!315865 false))

(declare-fun lt!154394 () SeekEntryResult!2761)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315865 (= lt!154394 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9734 () Unit!9732)

(assert (=> b!315865 (= e!196549 Unit!9734)))

(declare-fun b!315866 () Bool)

(declare-fun Unit!9735 () Unit!9732)

(assert (=> b!315866 (= e!196548 Unit!9735)))

(declare-fun b!315867 () Bool)

(assert (=> b!315867 (= e!196552 e!196551)))

(declare-fun res!171085 () Bool)

(assert (=> b!315867 (=> (not res!171085) (not e!196551))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315867 (= res!171085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154395))))

(assert (=> b!315867 (= lt!154395 (Intermediate!2761 false resIndex!52 resX!52))))

(declare-fun b!315868 () Bool)

(declare-fun res!171087 () Bool)

(assert (=> b!315868 (=> (not res!171087) (not e!196551))))

(assert (=> b!315868 (= res!171087 (and (= (select (arr!7621 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7973 a!3293))))))

(declare-fun b!315869 () Bool)

(assert (=> b!315869 false))

(declare-fun Unit!9736 () Unit!9732)

(assert (=> b!315869 (= e!196549 Unit!9736)))

(assert (= (and start!31578 res!171078) b!315857))

(assert (= (and b!315857 res!171079) b!315862))

(assert (= (and b!315862 res!171084) b!315860))

(assert (= (and b!315860 res!171086) b!315856))

(assert (= (and b!315856 res!171083) b!315863))

(assert (= (and b!315863 res!171081) b!315867))

(assert (= (and b!315867 res!171085) b!315868))

(assert (= (and b!315868 res!171087) b!315864))

(assert (= (and b!315864 res!171080) b!315858))

(assert (= (and b!315858 res!171082) b!315859))

(assert (= (and b!315859 c!50006) b!315861))

(assert (= (and b!315859 (not c!50006)) b!315866))

(assert (= (and b!315861 c!50007) b!315869))

(assert (= (and b!315861 (not c!50007)) b!315865))

(declare-fun m!324963 () Bool)

(assert (=> start!31578 m!324963))

(declare-fun m!324965 () Bool)

(assert (=> start!31578 m!324965))

(declare-fun m!324967 () Bool)

(assert (=> b!315862 m!324967))

(declare-fun m!324969 () Bool)

(assert (=> b!315863 m!324969))

(declare-fun m!324971 () Bool)

(assert (=> b!315868 m!324971))

(declare-fun m!324973 () Bool)

(assert (=> b!315856 m!324973))

(declare-fun m!324975 () Bool)

(assert (=> b!315865 m!324975))

(assert (=> b!315865 m!324975))

(declare-fun m!324977 () Bool)

(assert (=> b!315865 m!324977))

(declare-fun m!324979 () Bool)

(assert (=> b!315861 m!324979))

(declare-fun m!324981 () Bool)

(assert (=> b!315860 m!324981))

(declare-fun m!324983 () Bool)

(assert (=> b!315864 m!324983))

(assert (=> b!315858 m!324979))

(declare-fun m!324985 () Bool)

(assert (=> b!315867 m!324985))

(assert (=> b!315867 m!324985))

(declare-fun m!324987 () Bool)

(assert (=> b!315867 m!324987))

(push 1)

