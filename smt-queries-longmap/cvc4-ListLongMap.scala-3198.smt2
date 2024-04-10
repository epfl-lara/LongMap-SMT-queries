; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44878 () Bool)

(assert start!44878)

(declare-fun b!492471 () Bool)

(declare-fun res!295224 () Bool)

(declare-fun e!289292 () Bool)

(assert (=> b!492471 (=> (not res!295224) (not e!289292))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492471 (= res!295224 (validKeyInArray!0 k!2280))))

(declare-fun b!492472 () Bool)

(declare-fun e!289291 () Bool)

(assert (=> b!492472 (= e!289291 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31880 0))(
  ( (array!31881 (arr!15326 (Array (_ BitVec 32) (_ BitVec 64))) (size!15690 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31880)

(declare-fun lt!222646 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3793 0))(
  ( (MissingZero!3793 (index!17351 (_ BitVec 32))) (Found!3793 (index!17352 (_ BitVec 32))) (Intermediate!3793 (undefined!4605 Bool) (index!17353 (_ BitVec 32)) (x!46433 (_ BitVec 32))) (Undefined!3793) (MissingVacant!3793 (index!17354 (_ BitVec 32))) )
))
(declare-fun lt!222644 () SeekEntryResult!3793)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31880 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!492472 (= lt!222644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222646 (select (store (arr!15326 a!3235) i!1204 k!2280) j!176) (array!31881 (store (arr!15326 a!3235) i!1204 k!2280) (size!15690 a!3235)) mask!3524))))

(declare-fun lt!222649 () (_ BitVec 32))

(declare-fun lt!222645 () SeekEntryResult!3793)

(assert (=> b!492472 (= lt!222645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222649 (select (arr!15326 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492472 (= lt!222646 (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492472 (= lt!222649 (toIndex!0 (select (arr!15326 a!3235) j!176) mask!3524))))

(declare-fun e!289290 () Bool)

(assert (=> b!492472 e!289290))

(declare-fun res!295230 () Bool)

(assert (=> b!492472 (=> (not res!295230) (not e!289290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31880 (_ BitVec 32)) Bool)

(assert (=> b!492472 (= res!295230 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14532 0))(
  ( (Unit!14533) )
))
(declare-fun lt!222648 () Unit!14532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14532)

(assert (=> b!492472 (= lt!222648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492473 () Bool)

(declare-fun res!295232 () Bool)

(assert (=> b!492473 (=> (not res!295232) (not e!289292))))

(assert (=> b!492473 (= res!295232 (validKeyInArray!0 (select (arr!15326 a!3235) j!176)))))

(declare-fun res!295231 () Bool)

(assert (=> start!44878 (=> (not res!295231) (not e!289292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44878 (= res!295231 (validMask!0 mask!3524))))

(assert (=> start!44878 e!289292))

(assert (=> start!44878 true))

(declare-fun array_inv!11122 (array!31880) Bool)

(assert (=> start!44878 (array_inv!11122 a!3235)))

(declare-fun b!492474 () Bool)

(declare-fun res!295227 () Bool)

(assert (=> b!492474 (=> (not res!295227) (not e!289291))))

(assert (=> b!492474 (= res!295227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492475 () Bool)

(declare-fun res!295228 () Bool)

(assert (=> b!492475 (=> (not res!295228) (not e!289292))))

(assert (=> b!492475 (= res!295228 (and (= (size!15690 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15690 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15690 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492476 () Bool)

(declare-fun res!295229 () Bool)

(assert (=> b!492476 (=> (not res!295229) (not e!289292))))

(declare-fun arrayContainsKey!0 (array!31880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492476 (= res!295229 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31880 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!492477 (= e!289290 (= (seekEntryOrOpen!0 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) (Found!3793 j!176)))))

(declare-fun b!492478 () Bool)

(declare-fun res!295225 () Bool)

(assert (=> b!492478 (=> (not res!295225) (not e!289291))))

(declare-datatypes ((List!9484 0))(
  ( (Nil!9481) (Cons!9480 (h!10345 (_ BitVec 64)) (t!15712 List!9484)) )
))
(declare-fun arrayNoDuplicates!0 (array!31880 (_ BitVec 32) List!9484) Bool)

(assert (=> b!492478 (= res!295225 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9481))))

(declare-fun b!492479 () Bool)

(assert (=> b!492479 (= e!289292 e!289291)))

(declare-fun res!295226 () Bool)

(assert (=> b!492479 (=> (not res!295226) (not e!289291))))

(declare-fun lt!222647 () SeekEntryResult!3793)

(assert (=> b!492479 (= res!295226 (or (= lt!222647 (MissingZero!3793 i!1204)) (= lt!222647 (MissingVacant!3793 i!1204))))))

(assert (=> b!492479 (= lt!222647 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44878 res!295231) b!492475))

(assert (= (and b!492475 res!295228) b!492473))

(assert (= (and b!492473 res!295232) b!492471))

(assert (= (and b!492471 res!295224) b!492476))

(assert (= (and b!492476 res!295229) b!492479))

(assert (= (and b!492479 res!295226) b!492474))

(assert (= (and b!492474 res!295227) b!492478))

(assert (= (and b!492478 res!295225) b!492472))

(assert (= (and b!492472 res!295230) b!492477))

(declare-fun m!473211 () Bool)

(assert (=> b!492474 m!473211))

(declare-fun m!473213 () Bool)

(assert (=> b!492471 m!473213))

(declare-fun m!473215 () Bool)

(assert (=> start!44878 m!473215))

(declare-fun m!473217 () Bool)

(assert (=> start!44878 m!473217))

(declare-fun m!473219 () Bool)

(assert (=> b!492473 m!473219))

(assert (=> b!492473 m!473219))

(declare-fun m!473221 () Bool)

(assert (=> b!492473 m!473221))

(assert (=> b!492477 m!473219))

(assert (=> b!492477 m!473219))

(declare-fun m!473223 () Bool)

(assert (=> b!492477 m!473223))

(declare-fun m!473225 () Bool)

(assert (=> b!492478 m!473225))

(declare-fun m!473227 () Bool)

(assert (=> b!492476 m!473227))

(assert (=> b!492472 m!473219))

(declare-fun m!473229 () Bool)

(assert (=> b!492472 m!473229))

(declare-fun m!473231 () Bool)

(assert (=> b!492472 m!473231))

(declare-fun m!473233 () Bool)

(assert (=> b!492472 m!473233))

(declare-fun m!473235 () Bool)

(assert (=> b!492472 m!473235))

(assert (=> b!492472 m!473219))

(declare-fun m!473237 () Bool)

(assert (=> b!492472 m!473237))

(assert (=> b!492472 m!473219))

(declare-fun m!473239 () Bool)

(assert (=> b!492472 m!473239))

(assert (=> b!492472 m!473235))

(declare-fun m!473241 () Bool)

(assert (=> b!492472 m!473241))

(assert (=> b!492472 m!473235))

(declare-fun m!473243 () Bool)

(assert (=> b!492472 m!473243))

(declare-fun m!473245 () Bool)

(assert (=> b!492479 m!473245))

(push 1)

