; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27552 () Bool)

(assert start!27552)

(declare-fun b!284729 () Bool)

(declare-fun res!147215 () Bool)

(declare-fun e!180578 () Bool)

(assert (=> b!284729 (=> (not res!147215) (not e!180578))))

(declare-datatypes ((array!14201 0))(
  ( (array!14202 (arr!6739 (Array (_ BitVec 32) (_ BitVec 64))) (size!7091 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14201)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284729 (= res!147215 (and (= (size!7091 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7091 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7091 a!3325))))))

(declare-fun b!284730 () Bool)

(declare-fun res!147214 () Bool)

(assert (=> b!284730 (=> (not res!147214) (not e!180578))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284730 (= res!147214 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147216 () Bool)

(assert (=> start!27552 (=> (not res!147216) (not e!180578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27552 (= res!147216 (validMask!0 mask!3868))))

(assert (=> start!27552 e!180578))

(declare-fun array_inv!4689 (array!14201) Bool)

(assert (=> start!27552 (array_inv!4689 a!3325)))

(assert (=> start!27552 true))

(declare-fun b!284731 () Bool)

(declare-fun e!180576 () Bool)

(assert (=> b!284731 (= e!180576 false)))

(declare-fun lt!140642 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14201 (_ BitVec 32)) Bool)

(assert (=> b!284731 (= lt!140642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284732 () Bool)

(declare-fun res!147212 () Bool)

(assert (=> b!284732 (=> (not res!147212) (not e!180578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284732 (= res!147212 (validKeyInArray!0 k0!2581))))

(declare-fun b!284733 () Bool)

(assert (=> b!284733 (= e!180578 e!180576)))

(declare-fun res!147211 () Bool)

(assert (=> b!284733 (=> (not res!147211) (not e!180576))))

(declare-datatypes ((SeekEntryResult!1862 0))(
  ( (MissingZero!1862 (index!9618 (_ BitVec 32))) (Found!1862 (index!9619 (_ BitVec 32))) (Intermediate!1862 (undefined!2674 Bool) (index!9620 (_ BitVec 32)) (x!27933 (_ BitVec 32))) (Undefined!1862) (MissingVacant!1862 (index!9621 (_ BitVec 32))) )
))
(declare-fun lt!140643 () SeekEntryResult!1862)

(assert (=> b!284733 (= res!147211 (or (= lt!140643 (MissingZero!1862 i!1267)) (= lt!140643 (MissingVacant!1862 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14201 (_ BitVec 32)) SeekEntryResult!1862)

(assert (=> b!284733 (= lt!140643 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284734 () Bool)

(declare-fun res!147213 () Bool)

(assert (=> b!284734 (=> (not res!147213) (not e!180578))))

(declare-datatypes ((List!4460 0))(
  ( (Nil!4457) (Cons!4456 (h!5129 (_ BitVec 64)) (t!9534 List!4460)) )
))
(declare-fun arrayNoDuplicates!0 (array!14201 (_ BitVec 32) List!4460) Bool)

(assert (=> b!284734 (= res!147213 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4457))))

(assert (= (and start!27552 res!147216) b!284729))

(assert (= (and b!284729 res!147215) b!284732))

(assert (= (and b!284732 res!147212) b!284734))

(assert (= (and b!284734 res!147213) b!284730))

(assert (= (and b!284730 res!147214) b!284733))

(assert (= (and b!284733 res!147211) b!284731))

(declare-fun m!299849 () Bool)

(assert (=> b!284732 m!299849))

(declare-fun m!299851 () Bool)

(assert (=> b!284730 m!299851))

(declare-fun m!299853 () Bool)

(assert (=> b!284731 m!299853))

(declare-fun m!299855 () Bool)

(assert (=> b!284733 m!299855))

(declare-fun m!299857 () Bool)

(assert (=> start!27552 m!299857))

(declare-fun m!299859 () Bool)

(assert (=> start!27552 m!299859))

(declare-fun m!299861 () Bool)

(assert (=> b!284734 m!299861))

(check-sat (not b!284731) (not b!284734) (not b!284732) (not b!284730) (not b!284733) (not start!27552))
(check-sat)
