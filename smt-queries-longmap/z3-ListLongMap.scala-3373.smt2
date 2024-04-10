; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46412 () Bool)

(assert start!46412)

(declare-fun b!513457 () Bool)

(declare-fun e!299835 () Bool)

(declare-fun e!299834 () Bool)

(assert (=> b!513457 (= e!299835 e!299834)))

(declare-fun res!313763 () Bool)

(assert (=> b!513457 (=> (not res!313763) (not e!299834))))

(declare-datatypes ((SeekEntryResult!4317 0))(
  ( (MissingZero!4317 (index!19456 (_ BitVec 32))) (Found!4317 (index!19457 (_ BitVec 32))) (Intermediate!4317 (undefined!5129 Bool) (index!19458 (_ BitVec 32)) (x!48408 (_ BitVec 32))) (Undefined!4317) (MissingVacant!4317 (index!19459 (_ BitVec 32))) )
))
(declare-fun lt!235075 () SeekEntryResult!4317)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513457 (= res!313763 (or (= lt!235075 (MissingZero!4317 i!1204)) (= lt!235075 (MissingVacant!4317 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32952 0))(
  ( (array!32953 (arr!15850 (Array (_ BitVec 32) (_ BitVec 64))) (size!16214 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32952)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32952 (_ BitVec 32)) SeekEntryResult!4317)

(assert (=> b!513457 (= lt!235075 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513458 () Bool)

(declare-fun res!313762 () Bool)

(assert (=> b!513458 (=> (not res!313762) (not e!299835))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513458 (= res!313762 (validKeyInArray!0 (select (arr!15850 a!3235) j!176)))))

(declare-fun res!313760 () Bool)

(assert (=> start!46412 (=> (not res!313760) (not e!299835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46412 (= res!313760 (validMask!0 mask!3524))))

(assert (=> start!46412 e!299835))

(assert (=> start!46412 true))

(declare-fun array_inv!11646 (array!32952) Bool)

(assert (=> start!46412 (array_inv!11646 a!3235)))

(declare-fun b!513459 () Bool)

(declare-fun res!313755 () Bool)

(declare-fun e!299831 () Bool)

(assert (=> b!513459 (=> res!313755 e!299831)))

(declare-fun lt!235076 () SeekEntryResult!4317)

(get-info :version)

(assert (=> b!513459 (= res!313755 (or (undefined!5129 lt!235076) (not ((_ is Intermediate!4317) lt!235076))))))

(declare-fun b!513460 () Bool)

(declare-fun res!313758 () Bool)

(assert (=> b!513460 (=> (not res!313758) (not e!299834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32952 (_ BitVec 32)) Bool)

(assert (=> b!513460 (= res!313758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513461 () Bool)

(declare-fun res!313761 () Bool)

(assert (=> b!513461 (=> (not res!313761) (not e!299835))))

(declare-fun arrayContainsKey!0 (array!32952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513461 (= res!313761 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513462 () Bool)

(assert (=> b!513462 (= e!299834 (not e!299831))))

(declare-fun res!313756 () Bool)

(assert (=> b!513462 (=> res!313756 e!299831)))

(declare-fun lt!235074 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32952 (_ BitVec 32)) SeekEntryResult!4317)

(assert (=> b!513462 (= res!313756 (= lt!235076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235074 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (array!32953 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)) mask!3524)))))

(declare-fun lt!235078 () (_ BitVec 32))

(assert (=> b!513462 (= lt!235076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235078 (select (arr!15850 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513462 (= lt!235074 (toIndex!0 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513462 (= lt!235078 (toIndex!0 (select (arr!15850 a!3235) j!176) mask!3524))))

(declare-fun e!299832 () Bool)

(assert (=> b!513462 e!299832))

(declare-fun res!313759 () Bool)

(assert (=> b!513462 (=> (not res!313759) (not e!299832))))

(assert (=> b!513462 (= res!313759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15892 0))(
  ( (Unit!15893) )
))
(declare-fun lt!235077 () Unit!15892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15892)

(assert (=> b!513462 (= lt!235077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513463 () Bool)

(assert (=> b!513463 (= e!299832 (= (seekEntryOrOpen!0 (select (arr!15850 a!3235) j!176) a!3235 mask!3524) (Found!4317 j!176)))))

(declare-fun b!513464 () Bool)

(declare-fun res!313753 () Bool)

(assert (=> b!513464 (=> (not res!313753) (not e!299835))))

(assert (=> b!513464 (= res!313753 (and (= (size!16214 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16214 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16214 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513465 () Bool)

(declare-fun res!313754 () Bool)

(assert (=> b!513465 (=> (not res!313754) (not e!299834))))

(declare-datatypes ((List!10008 0))(
  ( (Nil!10005) (Cons!10004 (h!10890 (_ BitVec 64)) (t!16236 List!10008)) )
))
(declare-fun arrayNoDuplicates!0 (array!32952 (_ BitVec 32) List!10008) Bool)

(assert (=> b!513465 (= res!313754 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10005))))

(declare-fun b!513466 () Bool)

(declare-fun res!313757 () Bool)

(assert (=> b!513466 (=> (not res!313757) (not e!299835))))

(assert (=> b!513466 (= res!313757 (validKeyInArray!0 k0!2280))))

(declare-fun b!513467 () Bool)

(assert (=> b!513467 (= e!299831 true)))

(assert (=> b!513467 (bvslt (x!48408 lt!235076) #b01111111111111111111111111111110)))

(assert (= (and start!46412 res!313760) b!513464))

(assert (= (and b!513464 res!313753) b!513458))

(assert (= (and b!513458 res!313762) b!513466))

(assert (= (and b!513466 res!313757) b!513461))

(assert (= (and b!513461 res!313761) b!513457))

(assert (= (and b!513457 res!313763) b!513460))

(assert (= (and b!513460 res!313758) b!513465))

(assert (= (and b!513465 res!313754) b!513462))

(assert (= (and b!513462 res!313759) b!513463))

(assert (= (and b!513462 (not res!313756)) b!513459))

(assert (= (and b!513459 (not res!313755)) b!513467))

(declare-fun m!495021 () Bool)

(assert (=> b!513461 m!495021))

(declare-fun m!495023 () Bool)

(assert (=> b!513463 m!495023))

(assert (=> b!513463 m!495023))

(declare-fun m!495025 () Bool)

(assert (=> b!513463 m!495025))

(declare-fun m!495027 () Bool)

(assert (=> b!513465 m!495027))

(declare-fun m!495029 () Bool)

(assert (=> b!513457 m!495029))

(declare-fun m!495031 () Bool)

(assert (=> b!513460 m!495031))

(declare-fun m!495033 () Bool)

(assert (=> b!513462 m!495033))

(declare-fun m!495035 () Bool)

(assert (=> b!513462 m!495035))

(assert (=> b!513462 m!495023))

(declare-fun m!495037 () Bool)

(assert (=> b!513462 m!495037))

(assert (=> b!513462 m!495023))

(declare-fun m!495039 () Bool)

(assert (=> b!513462 m!495039))

(assert (=> b!513462 m!495023))

(declare-fun m!495041 () Bool)

(assert (=> b!513462 m!495041))

(assert (=> b!513462 m!495035))

(declare-fun m!495043 () Bool)

(assert (=> b!513462 m!495043))

(assert (=> b!513462 m!495035))

(declare-fun m!495045 () Bool)

(assert (=> b!513462 m!495045))

(declare-fun m!495047 () Bool)

(assert (=> b!513462 m!495047))

(declare-fun m!495049 () Bool)

(assert (=> start!46412 m!495049))

(declare-fun m!495051 () Bool)

(assert (=> start!46412 m!495051))

(assert (=> b!513458 m!495023))

(assert (=> b!513458 m!495023))

(declare-fun m!495053 () Bool)

(assert (=> b!513458 m!495053))

(declare-fun m!495055 () Bool)

(assert (=> b!513466 m!495055))

(check-sat (not b!513465) (not b!513466) (not b!513462) (not b!513463) (not b!513460) (not b!513458) (not start!46412) (not b!513457) (not b!513461))
(check-sat)
