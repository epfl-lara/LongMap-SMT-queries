; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31588 () Bool)

(assert start!31588)

(declare-fun res!171231 () Bool)

(declare-fun e!196625 () Bool)

(assert (=> start!31588 (=> (not res!171231) (not e!196625))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31588 (= res!171231 (validMask!0 mask!3709))))

(assert (=> start!31588 e!196625))

(declare-datatypes ((array!16112 0))(
  ( (array!16113 (arr!7626 (Array (_ BitVec 32) (_ BitVec 64))) (size!7978 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16112)

(declare-fun array_inv!5589 (array!16112) Bool)

(assert (=> start!31588 (array_inv!5589 a!3293)))

(assert (=> start!31588 true))

(declare-fun b!316066 () Bool)

(declare-fun res!171232 () Bool)

(assert (=> b!316066 (=> (not res!171232) (not e!196625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16112 (_ BitVec 32)) Bool)

(assert (=> b!316066 (= res!171232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316067 () Bool)

(declare-fun res!171237 () Bool)

(declare-fun e!196626 () Bool)

(assert (=> b!316067 (=> (not res!171237) (not e!196626))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316067 (= res!171237 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7626 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!316068 () Bool)

(assert (=> b!316068 false))

(declare-datatypes ((SeekEntryResult!2766 0))(
  ( (MissingZero!2766 (index!13240 (_ BitVec 32))) (Found!2766 (index!13241 (_ BitVec 32))) (Intermediate!2766 (undefined!3578 Bool) (index!13242 (_ BitVec 32)) (x!31484 (_ BitVec 32))) (Undefined!2766) (MissingVacant!2766 (index!13243 (_ BitVec 32))) )
))
(declare-fun lt!154438 () SeekEntryResult!2766)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16112 (_ BitVec 32)) SeekEntryResult!2766)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316068 (= lt!154438 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9757 0))(
  ( (Unit!9758) )
))
(declare-fun e!196624 () Unit!9757)

(declare-fun Unit!9759 () Unit!9757)

(assert (=> b!316068 (= e!196624 Unit!9759)))

(declare-fun b!316069 () Bool)

(assert (=> b!316069 false))

(declare-fun Unit!9760 () Unit!9757)

(assert (=> b!316069 (= e!196624 Unit!9760)))

(declare-fun b!316070 () Bool)

(declare-fun res!171228 () Bool)

(assert (=> b!316070 (=> (not res!171228) (not e!196625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316070 (= res!171228 (validKeyInArray!0 k0!2441))))

(declare-fun b!316071 () Bool)

(declare-fun e!196627 () Unit!9757)

(declare-fun Unit!9761 () Unit!9757)

(assert (=> b!316071 (= e!196627 Unit!9761)))

(declare-fun b!316072 () Bool)

(declare-fun res!171236 () Bool)

(assert (=> b!316072 (=> (not res!171236) (not e!196625))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316072 (= res!171236 (and (= (size!7978 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7978 a!3293))))))

(declare-fun b!316073 () Bool)

(assert (=> b!316073 (= e!196627 e!196624)))

(declare-fun c!50036 () Bool)

(assert (=> b!316073 (= c!50036 (or (= (select (arr!7626 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7626 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316074 () Bool)

(declare-fun res!171235 () Bool)

(assert (=> b!316074 (=> (not res!171235) (not e!196626))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316074 (= res!171235 (and (= (select (arr!7626 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7978 a!3293))))))

(declare-fun b!316075 () Bool)

(declare-fun res!171234 () Bool)

(assert (=> b!316075 (=> (not res!171234) (not e!196625))))

(declare-fun arrayContainsKey!0 (array!16112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316075 (= res!171234 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316076 () Bool)

(assert (=> b!316076 (= e!196625 e!196626)))

(declare-fun res!171233 () Bool)

(assert (=> b!316076 (=> (not res!171233) (not e!196626))))

(declare-fun lt!154440 () SeekEntryResult!2766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316076 (= res!171233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154440))))

(assert (=> b!316076 (= lt!154440 (Intermediate!2766 false resIndex!52 resX!52))))

(declare-fun b!316077 () Bool)

(declare-fun res!171229 () Bool)

(assert (=> b!316077 (=> (not res!171229) (not e!196625))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16112 (_ BitVec 32)) SeekEntryResult!2766)

(assert (=> b!316077 (= res!171229 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2766 i!1240)))))

(declare-fun b!316078 () Bool)

(assert (=> b!316078 (= e!196626 (not true))))

(assert (=> b!316078 (= index!1781 resIndex!52)))

(declare-fun lt!154439 () Unit!9757)

(assert (=> b!316078 (= lt!154439 e!196627)))

(declare-fun c!50037 () Bool)

(assert (=> b!316078 (= c!50037 (not (= resIndex!52 index!1781)))))

(declare-fun b!316079 () Bool)

(declare-fun res!171230 () Bool)

(assert (=> b!316079 (=> (not res!171230) (not e!196626))))

(assert (=> b!316079 (= res!171230 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154440))))

(assert (= (and start!31588 res!171231) b!316072))

(assert (= (and b!316072 res!171236) b!316070))

(assert (= (and b!316070 res!171228) b!316075))

(assert (= (and b!316075 res!171234) b!316077))

(assert (= (and b!316077 res!171229) b!316066))

(assert (= (and b!316066 res!171232) b!316076))

(assert (= (and b!316076 res!171233) b!316074))

(assert (= (and b!316074 res!171235) b!316079))

(assert (= (and b!316079 res!171230) b!316067))

(assert (= (and b!316067 res!171237) b!316078))

(assert (= (and b!316078 c!50037) b!316073))

(assert (= (and b!316078 (not c!50037)) b!316071))

(assert (= (and b!316073 c!50036) b!316069))

(assert (= (and b!316073 (not c!50036)) b!316068))

(declare-fun m!325093 () Bool)

(assert (=> b!316073 m!325093))

(assert (=> b!316067 m!325093))

(declare-fun m!325095 () Bool)

(assert (=> b!316068 m!325095))

(assert (=> b!316068 m!325095))

(declare-fun m!325097 () Bool)

(assert (=> b!316068 m!325097))

(declare-fun m!325099 () Bool)

(assert (=> b!316075 m!325099))

(declare-fun m!325101 () Bool)

(assert (=> start!31588 m!325101))

(declare-fun m!325103 () Bool)

(assert (=> start!31588 m!325103))

(declare-fun m!325105 () Bool)

(assert (=> b!316070 m!325105))

(declare-fun m!325107 () Bool)

(assert (=> b!316077 m!325107))

(declare-fun m!325109 () Bool)

(assert (=> b!316076 m!325109))

(assert (=> b!316076 m!325109))

(declare-fun m!325111 () Bool)

(assert (=> b!316076 m!325111))

(declare-fun m!325113 () Bool)

(assert (=> b!316079 m!325113))

(declare-fun m!325115 () Bool)

(assert (=> b!316074 m!325115))

(declare-fun m!325117 () Bool)

(assert (=> b!316066 m!325117))

(check-sat (not b!316076) (not b!316070) (not b!316066) (not b!316077) (not b!316075) (not b!316068) (not b!316079) (not start!31588))
(check-sat)
