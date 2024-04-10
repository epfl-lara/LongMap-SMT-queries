; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45276 () Bool)

(assert start!45276)

(declare-fun b!497378 () Bool)

(declare-fun res!299774 () Bool)

(declare-fun e!291552 () Bool)

(assert (=> b!497378 (=> (not res!299774) (not e!291552))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497378 (= res!299774 (validKeyInArray!0 k!2280))))

(declare-fun b!497379 () Bool)

(declare-fun res!299771 () Bool)

(assert (=> b!497379 (=> (not res!299771) (not e!291552))))

(declare-datatypes ((array!32164 0))(
  ( (array!32165 (arr!15465 (Array (_ BitVec 32) (_ BitVec 64))) (size!15829 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32164)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497379 (= res!299771 (validKeyInArray!0 (select (arr!15465 a!3235) j!176)))))

(declare-fun b!497380 () Bool)

(declare-fun e!291549 () Bool)

(declare-fun e!291551 () Bool)

(assert (=> b!497380 (= e!291549 (not e!291551))))

(declare-fun res!299764 () Bool)

(assert (=> b!497380 (=> res!299764 e!291551)))

(declare-fun lt!225168 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3932 0))(
  ( (MissingZero!3932 (index!17907 (_ BitVec 32))) (Found!3932 (index!17908 (_ BitVec 32))) (Intermediate!3932 (undefined!4744 Bool) (index!17909 (_ BitVec 32)) (x!46960 (_ BitVec 32))) (Undefined!3932) (MissingVacant!3932 (index!17910 (_ BitVec 32))) )
))
(declare-fun lt!225169 () SeekEntryResult!3932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32164 (_ BitVec 32)) SeekEntryResult!3932)

(assert (=> b!497380 (= res!299764 (= lt!225169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225168 (select (store (arr!15465 a!3235) i!1204 k!2280) j!176) (array!32165 (store (arr!15465 a!3235) i!1204 k!2280) (size!15829 a!3235)) mask!3524)))))

(declare-fun lt!225172 () (_ BitVec 32))

(assert (=> b!497380 (= lt!225169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225172 (select (arr!15465 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497380 (= lt!225168 (toIndex!0 (select (store (arr!15465 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497380 (= lt!225172 (toIndex!0 (select (arr!15465 a!3235) j!176) mask!3524))))

(declare-fun e!291548 () Bool)

(assert (=> b!497380 e!291548))

(declare-fun res!299767 () Bool)

(assert (=> b!497380 (=> (not res!299767) (not e!291548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32164 (_ BitVec 32)) Bool)

(assert (=> b!497380 (= res!299767 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14810 0))(
  ( (Unit!14811) )
))
(declare-fun lt!225170 () Unit!14810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14810)

(assert (=> b!497380 (= lt!225170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497381 () Bool)

(assert (=> b!497381 (= e!291551 true)))

(assert (=> b!497381 (and (bvslt (x!46960 lt!225169) #b01111111111111111111111111111110) (or (= (select (arr!15465 a!3235) (index!17909 lt!225169)) (select (arr!15465 a!3235) j!176)) (= (select (arr!15465 a!3235) (index!17909 lt!225169)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15465 a!3235) (index!17909 lt!225169)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497382 () Bool)

(declare-fun res!299765 () Bool)

(assert (=> b!497382 (=> (not res!299765) (not e!291552))))

(declare-fun arrayContainsKey!0 (array!32164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497382 (= res!299765 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497383 () Bool)

(declare-fun res!299773 () Bool)

(assert (=> b!497383 (=> (not res!299773) (not e!291549))))

(assert (=> b!497383 (= res!299773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497384 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32164 (_ BitVec 32)) SeekEntryResult!3932)

(assert (=> b!497384 (= e!291548 (= (seekEntryOrOpen!0 (select (arr!15465 a!3235) j!176) a!3235 mask!3524) (Found!3932 j!176)))))

(declare-fun b!497385 () Bool)

(assert (=> b!497385 (= e!291552 e!291549)))

(declare-fun res!299772 () Bool)

(assert (=> b!497385 (=> (not res!299772) (not e!291549))))

(declare-fun lt!225171 () SeekEntryResult!3932)

(assert (=> b!497385 (= res!299772 (or (= lt!225171 (MissingZero!3932 i!1204)) (= lt!225171 (MissingVacant!3932 i!1204))))))

(assert (=> b!497385 (= lt!225171 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!299769 () Bool)

(assert (=> start!45276 (=> (not res!299769) (not e!291552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45276 (= res!299769 (validMask!0 mask!3524))))

(assert (=> start!45276 e!291552))

(assert (=> start!45276 true))

(declare-fun array_inv!11261 (array!32164) Bool)

(assert (=> start!45276 (array_inv!11261 a!3235)))

(declare-fun b!497377 () Bool)

(declare-fun res!299770 () Bool)

(assert (=> b!497377 (=> res!299770 e!291551)))

(assert (=> b!497377 (= res!299770 (or (undefined!4744 lt!225169) (not (is-Intermediate!3932 lt!225169))))))

(declare-fun b!497386 () Bool)

(declare-fun res!299766 () Bool)

(assert (=> b!497386 (=> (not res!299766) (not e!291552))))

(assert (=> b!497386 (= res!299766 (and (= (size!15829 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15829 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15829 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497387 () Bool)

(declare-fun res!299768 () Bool)

(assert (=> b!497387 (=> (not res!299768) (not e!291549))))

(declare-datatypes ((List!9623 0))(
  ( (Nil!9620) (Cons!9619 (h!10490 (_ BitVec 64)) (t!15851 List!9623)) )
))
(declare-fun arrayNoDuplicates!0 (array!32164 (_ BitVec 32) List!9623) Bool)

(assert (=> b!497387 (= res!299768 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9620))))

(assert (= (and start!45276 res!299769) b!497386))

(assert (= (and b!497386 res!299766) b!497379))

(assert (= (and b!497379 res!299771) b!497378))

(assert (= (and b!497378 res!299774) b!497382))

(assert (= (and b!497382 res!299765) b!497385))

(assert (= (and b!497385 res!299772) b!497383))

(assert (= (and b!497383 res!299773) b!497387))

(assert (= (and b!497387 res!299768) b!497380))

(assert (= (and b!497380 res!299767) b!497384))

(assert (= (and b!497380 (not res!299764)) b!497377))

(assert (= (and b!497377 (not res!299770)) b!497381))

(declare-fun m!478755 () Bool)

(assert (=> start!45276 m!478755))

(declare-fun m!478757 () Bool)

(assert (=> start!45276 m!478757))

(declare-fun m!478759 () Bool)

(assert (=> b!497382 m!478759))

(declare-fun m!478761 () Bool)

(assert (=> b!497379 m!478761))

(assert (=> b!497379 m!478761))

(declare-fun m!478763 () Bool)

(assert (=> b!497379 m!478763))

(declare-fun m!478765 () Bool)

(assert (=> b!497383 m!478765))

(declare-fun m!478767 () Bool)

(assert (=> b!497378 m!478767))

(assert (=> b!497384 m!478761))

(assert (=> b!497384 m!478761))

(declare-fun m!478769 () Bool)

(assert (=> b!497384 m!478769))

(declare-fun m!478771 () Bool)

(assert (=> b!497381 m!478771))

(assert (=> b!497381 m!478761))

(declare-fun m!478773 () Bool)

(assert (=> b!497387 m!478773))

(declare-fun m!478775 () Bool)

(assert (=> b!497380 m!478775))

(declare-fun m!478777 () Bool)

(assert (=> b!497380 m!478777))

(declare-fun m!478779 () Bool)

(assert (=> b!497380 m!478779))

(assert (=> b!497380 m!478779))

(declare-fun m!478781 () Bool)

(assert (=> b!497380 m!478781))

(assert (=> b!497380 m!478761))

(declare-fun m!478783 () Bool)

(assert (=> b!497380 m!478783))

(assert (=> b!497380 m!478761))

(declare-fun m!478785 () Bool)

(assert (=> b!497380 m!478785))

(assert (=> b!497380 m!478761))

(declare-fun m!478787 () Bool)

(assert (=> b!497380 m!478787))

(assert (=> b!497380 m!478779))

(declare-fun m!478789 () Bool)

(assert (=> b!497380 m!478789))

(declare-fun m!478791 () Bool)

(assert (=> b!497385 m!478791))

(push 1)

(assert (not b!497380))

(assert (not start!45276))

