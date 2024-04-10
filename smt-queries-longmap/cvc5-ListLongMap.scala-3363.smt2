; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46230 () Bool)

(assert start!46230)

(declare-fun b!511940 () Bool)

(declare-fun res!312605 () Bool)

(declare-fun e!299064 () Bool)

(assert (=> b!511940 (=> (not res!312605) (not e!299064))))

(declare-datatypes ((array!32884 0))(
  ( (array!32885 (arr!15819 (Array (_ BitVec 32) (_ BitVec 64))) (size!16183 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32884)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32884 (_ BitVec 32)) Bool)

(assert (=> b!511940 (= res!312605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511941 () Bool)

(declare-fun e!299066 () Bool)

(assert (=> b!511941 (= e!299066 e!299064)))

(declare-fun res!312607 () Bool)

(assert (=> b!511941 (=> (not res!312607) (not e!299064))))

(declare-datatypes ((SeekEntryResult!4286 0))(
  ( (MissingZero!4286 (index!19332 (_ BitVec 32))) (Found!4286 (index!19333 (_ BitVec 32))) (Intermediate!4286 (undefined!5098 Bool) (index!19334 (_ BitVec 32)) (x!48285 (_ BitVec 32))) (Undefined!4286) (MissingVacant!4286 (index!19335 (_ BitVec 32))) )
))
(declare-fun lt!234286 () SeekEntryResult!4286)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511941 (= res!312607 (or (= lt!234286 (MissingZero!4286 i!1204)) (= lt!234286 (MissingVacant!4286 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32884 (_ BitVec 32)) SeekEntryResult!4286)

(assert (=> b!511941 (= lt!234286 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511942 () Bool)

(declare-fun res!312608 () Bool)

(assert (=> b!511942 (=> (not res!312608) (not e!299064))))

(declare-datatypes ((List!9977 0))(
  ( (Nil!9974) (Cons!9973 (h!10853 (_ BitVec 64)) (t!16205 List!9977)) )
))
(declare-fun arrayNoDuplicates!0 (array!32884 (_ BitVec 32) List!9977) Bool)

(assert (=> b!511942 (= res!312608 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9974))))

(declare-fun b!511943 () Bool)

(declare-fun res!312606 () Bool)

(declare-fun e!299065 () Bool)

(assert (=> b!511943 (=> res!312606 e!299065)))

(declare-fun lt!234285 () SeekEntryResult!4286)

(assert (=> b!511943 (= res!312606 (or (not (is-Intermediate!4286 lt!234285)) (not (undefined!5098 lt!234285))))))

(declare-fun b!511944 () Bool)

(declare-fun res!312603 () Bool)

(assert (=> b!511944 (=> (not res!312603) (not e!299066))))

(declare-fun arrayContainsKey!0 (array!32884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511944 (= res!312603 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511946 () Bool)

(assert (=> b!511946 (= e!299064 (not e!299065))))

(declare-fun res!312602 () Bool)

(assert (=> b!511946 (=> res!312602 e!299065)))

(declare-fun lt!234283 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32884 (_ BitVec 32)) SeekEntryResult!4286)

(assert (=> b!511946 (= res!312602 (= lt!234285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234283 (select (store (arr!15819 a!3235) i!1204 k!2280) j!176) (array!32885 (store (arr!15819 a!3235) i!1204 k!2280) (size!16183 a!3235)) mask!3524)))))

(declare-fun lt!234281 () (_ BitVec 32))

(assert (=> b!511946 (= lt!234285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234281 (select (arr!15819 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511946 (= lt!234283 (toIndex!0 (select (store (arr!15819 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511946 (= lt!234281 (toIndex!0 (select (arr!15819 a!3235) j!176) mask!3524))))

(declare-fun lt!234282 () SeekEntryResult!4286)

(assert (=> b!511946 (= lt!234282 (Found!4286 j!176))))

(assert (=> b!511946 (= lt!234282 (seekEntryOrOpen!0 (select (arr!15819 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511946 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15830 0))(
  ( (Unit!15831) )
))
(declare-fun lt!234284 () Unit!15830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15830)

(assert (=> b!511946 (= lt!234284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511947 () Bool)

(declare-fun res!312611 () Bool)

(assert (=> b!511947 (=> (not res!312611) (not e!299066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511947 (= res!312611 (validKeyInArray!0 k!2280))))

(declare-fun b!511948 () Bool)

(declare-fun res!312604 () Bool)

(assert (=> b!511948 (=> (not res!312604) (not e!299066))))

(assert (=> b!511948 (= res!312604 (and (= (size!16183 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16183 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16183 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511949 () Bool)

(declare-fun res!312609 () Bool)

(assert (=> b!511949 (=> (not res!312609) (not e!299066))))

(assert (=> b!511949 (= res!312609 (validKeyInArray!0 (select (arr!15819 a!3235) j!176)))))

(declare-fun res!312610 () Bool)

(assert (=> start!46230 (=> (not res!312610) (not e!299066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46230 (= res!312610 (validMask!0 mask!3524))))

(assert (=> start!46230 e!299066))

(assert (=> start!46230 true))

(declare-fun array_inv!11615 (array!32884) Bool)

(assert (=> start!46230 (array_inv!11615 a!3235)))

(declare-fun b!511945 () Bool)

(assert (=> b!511945 (= e!299065 true)))

(assert (=> b!511945 (= lt!234282 Undefined!4286)))

(assert (= (and start!46230 res!312610) b!511948))

(assert (= (and b!511948 res!312604) b!511949))

(assert (= (and b!511949 res!312609) b!511947))

(assert (= (and b!511947 res!312611) b!511944))

(assert (= (and b!511944 res!312603) b!511941))

(assert (= (and b!511941 res!312607) b!511940))

(assert (= (and b!511940 res!312605) b!511942))

(assert (= (and b!511942 res!312608) b!511946))

(assert (= (and b!511946 (not res!312602)) b!511943))

(assert (= (and b!511943 (not res!312606)) b!511945))

(declare-fun m!493497 () Bool)

(assert (=> b!511941 m!493497))

(declare-fun m!493499 () Bool)

(assert (=> start!46230 m!493499))

(declare-fun m!493501 () Bool)

(assert (=> start!46230 m!493501))

(declare-fun m!493503 () Bool)

(assert (=> b!511947 m!493503))

(declare-fun m!493505 () Bool)

(assert (=> b!511949 m!493505))

(assert (=> b!511949 m!493505))

(declare-fun m!493507 () Bool)

(assert (=> b!511949 m!493507))

(declare-fun m!493509 () Bool)

(assert (=> b!511946 m!493509))

(declare-fun m!493511 () Bool)

(assert (=> b!511946 m!493511))

(assert (=> b!511946 m!493505))

(declare-fun m!493513 () Bool)

(assert (=> b!511946 m!493513))

(assert (=> b!511946 m!493505))

(declare-fun m!493515 () Bool)

(assert (=> b!511946 m!493515))

(assert (=> b!511946 m!493505))

(declare-fun m!493517 () Bool)

(assert (=> b!511946 m!493517))

(assert (=> b!511946 m!493511))

(declare-fun m!493519 () Bool)

(assert (=> b!511946 m!493519))

(assert (=> b!511946 m!493511))

(declare-fun m!493521 () Bool)

(assert (=> b!511946 m!493521))

(declare-fun m!493523 () Bool)

(assert (=> b!511946 m!493523))

(assert (=> b!511946 m!493505))

(declare-fun m!493525 () Bool)

(assert (=> b!511946 m!493525))

(declare-fun m!493527 () Bool)

(assert (=> b!511940 m!493527))

(declare-fun m!493529 () Bool)

(assert (=> b!511942 m!493529))

(declare-fun m!493531 () Bool)

(assert (=> b!511944 m!493531))

(push 1)

