; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31572 () Bool)

(assert start!31572)

(declare-fun b!315971 () Bool)

(declare-fun res!171199 () Bool)

(declare-fun e!196578 () Bool)

(assert (=> b!315971 (=> (not res!171199) (not e!196578))))

(declare-datatypes ((array!16109 0))(
  ( (array!16110 (arr!7624 (Array (_ BitVec 32) (_ BitVec 64))) (size!7976 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16109)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315971 (= res!171199 (and (= (select (arr!7624 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7976 a!3293))))))

(declare-fun res!171196 () Bool)

(declare-fun e!196576 () Bool)

(assert (=> start!31572 (=> (not res!171196) (not e!196576))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31572 (= res!171196 (validMask!0 mask!3709))))

(assert (=> start!31572 e!196576))

(declare-fun array_inv!5574 (array!16109) Bool)

(assert (=> start!31572 (array_inv!5574 a!3293)))

(assert (=> start!31572 true))

(declare-fun b!315972 () Bool)

(declare-fun res!171195 () Bool)

(assert (=> b!315972 (=> (not res!171195) (not e!196576))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2729 0))(
  ( (MissingZero!2729 (index!13092 (_ BitVec 32))) (Found!2729 (index!13093 (_ BitVec 32))) (Intermediate!2729 (undefined!3541 Bool) (index!13094 (_ BitVec 32)) (x!31444 (_ BitVec 32))) (Undefined!2729) (MissingVacant!2729 (index!13095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16109 (_ BitVec 32)) SeekEntryResult!2729)

(assert (=> b!315972 (= res!171195 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2729 i!1240)))))

(declare-fun b!315973 () Bool)

(declare-fun res!171204 () Bool)

(assert (=> b!315973 (=> (not res!171204) (not e!196578))))

(declare-fun lt!154447 () SeekEntryResult!2729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16109 (_ BitVec 32)) SeekEntryResult!2729)

(assert (=> b!315973 (= res!171204 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154447))))

(declare-fun b!315974 () Bool)

(declare-fun res!171203 () Bool)

(assert (=> b!315974 (=> (not res!171203) (not e!196576))))

(assert (=> b!315974 (= res!171203 (and (= (size!7976 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7976 a!3293))))))

(declare-fun b!315975 () Bool)

(declare-fun res!171198 () Bool)

(assert (=> b!315975 (=> (not res!171198) (not e!196576))))

(declare-fun arrayContainsKey!0 (array!16109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315975 (= res!171198 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315976 () Bool)

(assert (=> b!315976 (= e!196578 (not true))))

(assert (=> b!315976 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9716 0))(
  ( (Unit!9717) )
))
(declare-fun lt!154449 () Unit!9716)

(declare-fun e!196574 () Unit!9716)

(assert (=> b!315976 (= lt!154449 e!196574)))

(declare-fun c!50006 () Bool)

(assert (=> b!315976 (= c!50006 (not (= resIndex!52 index!1781)))))

(declare-fun b!315977 () Bool)

(assert (=> b!315977 (= e!196576 e!196578)))

(declare-fun res!171197 () Bool)

(assert (=> b!315977 (=> (not res!171197) (not e!196578))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315977 (= res!171197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154447))))

(assert (=> b!315977 (= lt!154447 (Intermediate!2729 false resIndex!52 resX!52))))

(declare-fun b!315978 () Bool)

(declare-fun res!171200 () Bool)

(assert (=> b!315978 (=> (not res!171200) (not e!196576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315978 (= res!171200 (validKeyInArray!0 k0!2441))))

(declare-fun b!315979 () Bool)

(assert (=> b!315979 false))

(declare-fun e!196575 () Unit!9716)

(declare-fun Unit!9718 () Unit!9716)

(assert (=> b!315979 (= e!196575 Unit!9718)))

(declare-fun b!315980 () Bool)

(assert (=> b!315980 false))

(declare-fun lt!154448 () SeekEntryResult!2729)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315980 (= lt!154448 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9719 () Unit!9716)

(assert (=> b!315980 (= e!196575 Unit!9719)))

(declare-fun b!315981 () Bool)

(declare-fun res!171201 () Bool)

(assert (=> b!315981 (=> (not res!171201) (not e!196576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16109 (_ BitVec 32)) Bool)

(assert (=> b!315981 (= res!171201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315982 () Bool)

(declare-fun res!171202 () Bool)

(assert (=> b!315982 (=> (not res!171202) (not e!196578))))

(assert (=> b!315982 (= res!171202 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7624 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315983 () Bool)

(assert (=> b!315983 (= e!196574 e!196575)))

(declare-fun c!50005 () Bool)

(assert (=> b!315983 (= c!50005 (or (= (select (arr!7624 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7624 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315984 () Bool)

(declare-fun Unit!9720 () Unit!9716)

(assert (=> b!315984 (= e!196574 Unit!9720)))

(assert (= (and start!31572 res!171196) b!315974))

(assert (= (and b!315974 res!171203) b!315978))

(assert (= (and b!315978 res!171200) b!315975))

(assert (= (and b!315975 res!171198) b!315972))

(assert (= (and b!315972 res!171195) b!315981))

(assert (= (and b!315981 res!171201) b!315977))

(assert (= (and b!315977 res!171197) b!315971))

(assert (= (and b!315971 res!171199) b!315973))

(assert (= (and b!315973 res!171204) b!315982))

(assert (= (and b!315982 res!171202) b!315976))

(assert (= (and b!315976 c!50006) b!315983))

(assert (= (and b!315976 (not c!50006)) b!315984))

(assert (= (and b!315983 c!50005) b!315979))

(assert (= (and b!315983 (not c!50005)) b!315980))

(declare-fun m!325219 () Bool)

(assert (=> b!315972 m!325219))

(declare-fun m!325221 () Bool)

(assert (=> b!315981 m!325221))

(declare-fun m!325223 () Bool)

(assert (=> start!31572 m!325223))

(declare-fun m!325225 () Bool)

(assert (=> start!31572 m!325225))

(declare-fun m!325227 () Bool)

(assert (=> b!315982 m!325227))

(declare-fun m!325229 () Bool)

(assert (=> b!315975 m!325229))

(declare-fun m!325231 () Bool)

(assert (=> b!315978 m!325231))

(assert (=> b!315983 m!325227))

(declare-fun m!325233 () Bool)

(assert (=> b!315980 m!325233))

(assert (=> b!315980 m!325233))

(declare-fun m!325235 () Bool)

(assert (=> b!315980 m!325235))

(declare-fun m!325237 () Bool)

(assert (=> b!315977 m!325237))

(assert (=> b!315977 m!325237))

(declare-fun m!325239 () Bool)

(assert (=> b!315977 m!325239))

(declare-fun m!325241 () Bool)

(assert (=> b!315973 m!325241))

(declare-fun m!325243 () Bool)

(assert (=> b!315971 m!325243))

(check-sat (not b!315978) (not start!31572) (not b!315975) (not b!315981) (not b!315972) (not b!315980) (not b!315973) (not b!315977))
(check-sat)
