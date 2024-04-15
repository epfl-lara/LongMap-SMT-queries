; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45030 () Bool)

(assert start!45030)

(declare-fun b!494005 () Bool)

(declare-fun res!296720 () Bool)

(declare-fun e!289944 () Bool)

(assert (=> b!494005 (=> res!296720 e!289944)))

(declare-datatypes ((SeekEntryResult!3841 0))(
  ( (MissingZero!3841 (index!17543 (_ BitVec 32))) (Found!3841 (index!17544 (_ BitVec 32))) (Intermediate!3841 (undefined!4653 Bool) (index!17545 (_ BitVec 32)) (x!46626 (_ BitVec 32))) (Undefined!3841) (MissingVacant!3841 (index!17546 (_ BitVec 32))) )
))
(declare-fun lt!223442 () SeekEntryResult!3841)

(get-info :version)

(assert (=> b!494005 (= res!296720 (or (not ((_ is Intermediate!3841) lt!223442)) (not (undefined!4653 lt!223442))))))

(declare-fun b!494006 () Bool)

(declare-fun e!289945 () Bool)

(assert (=> b!494006 (= e!289945 (not e!289944))))

(declare-fun res!296718 () Bool)

(assert (=> b!494006 (=> res!296718 e!289944)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31985 0))(
  ( (array!31986 (arr!15377 (Array (_ BitVec 32) (_ BitVec 64))) (size!15742 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31985)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31985 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!494006 (= res!296718 (= lt!223442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223439 (select (store (arr!15377 a!3235) i!1204 k0!2280) j!176) (array!31986 (store (arr!15377 a!3235) i!1204 k0!2280) (size!15742 a!3235)) mask!3524)))))

(declare-fun lt!223441 () (_ BitVec 32))

(assert (=> b!494006 (= lt!223442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223441 (select (arr!15377 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494006 (= lt!223439 (toIndex!0 (select (store (arr!15377 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494006 (= lt!223441 (toIndex!0 (select (arr!15377 a!3235) j!176) mask!3524))))

(declare-fun lt!223443 () SeekEntryResult!3841)

(assert (=> b!494006 (= lt!223443 (Found!3841 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31985 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!494006 (= lt!223443 (seekEntryOrOpen!0 (select (arr!15377 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31985 (_ BitVec 32)) Bool)

(assert (=> b!494006 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14614 0))(
  ( (Unit!14615) )
))
(declare-fun lt!223444 () Unit!14614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14614)

(assert (=> b!494006 (= lt!223444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494007 () Bool)

(declare-fun res!296726 () Bool)

(declare-fun e!289947 () Bool)

(assert (=> b!494007 (=> (not res!296726) (not e!289947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494007 (= res!296726 (validKeyInArray!0 (select (arr!15377 a!3235) j!176)))))

(declare-fun res!296717 () Bool)

(assert (=> start!45030 (=> (not res!296717) (not e!289947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45030 (= res!296717 (validMask!0 mask!3524))))

(assert (=> start!45030 e!289947))

(assert (=> start!45030 true))

(declare-fun array_inv!11260 (array!31985) Bool)

(assert (=> start!45030 (array_inv!11260 a!3235)))

(declare-fun b!494008 () Bool)

(declare-fun res!296723 () Bool)

(assert (=> b!494008 (=> (not res!296723) (not e!289945))))

(declare-datatypes ((List!9574 0))(
  ( (Nil!9571) (Cons!9570 (h!10438 (_ BitVec 64)) (t!15793 List!9574)) )
))
(declare-fun arrayNoDuplicates!0 (array!31985 (_ BitVec 32) List!9574) Bool)

(assert (=> b!494008 (= res!296723 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9571))))

(declare-fun b!494009 () Bool)

(declare-fun res!296724 () Bool)

(assert (=> b!494009 (=> (not res!296724) (not e!289947))))

(assert (=> b!494009 (= res!296724 (and (= (size!15742 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15742 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15742 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494010 () Bool)

(declare-fun res!296725 () Bool)

(assert (=> b!494010 (=> (not res!296725) (not e!289947))))

(declare-fun arrayContainsKey!0 (array!31985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494010 (= res!296725 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494011 () Bool)

(declare-fun res!296719 () Bool)

(assert (=> b!494011 (=> (not res!296719) (not e!289945))))

(assert (=> b!494011 (= res!296719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494012 () Bool)

(declare-fun res!296721 () Bool)

(assert (=> b!494012 (=> (not res!296721) (not e!289947))))

(assert (=> b!494012 (= res!296721 (validKeyInArray!0 k0!2280))))

(declare-fun b!494013 () Bool)

(assert (=> b!494013 (= e!289944 true)))

(assert (=> b!494013 (= lt!223443 Undefined!3841)))

(declare-fun b!494014 () Bool)

(assert (=> b!494014 (= e!289947 e!289945)))

(declare-fun res!296722 () Bool)

(assert (=> b!494014 (=> (not res!296722) (not e!289945))))

(declare-fun lt!223440 () SeekEntryResult!3841)

(assert (=> b!494014 (= res!296722 (or (= lt!223440 (MissingZero!3841 i!1204)) (= lt!223440 (MissingVacant!3841 i!1204))))))

(assert (=> b!494014 (= lt!223440 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45030 res!296717) b!494009))

(assert (= (and b!494009 res!296724) b!494007))

(assert (= (and b!494007 res!296726) b!494012))

(assert (= (and b!494012 res!296721) b!494010))

(assert (= (and b!494010 res!296725) b!494014))

(assert (= (and b!494014 res!296722) b!494011))

(assert (= (and b!494011 res!296719) b!494008))

(assert (= (and b!494008 res!296723) b!494006))

(assert (= (and b!494006 (not res!296718)) b!494005))

(assert (= (and b!494005 (not res!296720)) b!494013))

(declare-fun m!474535 () Bool)

(assert (=> b!494008 m!474535))

(declare-fun m!474537 () Bool)

(assert (=> b!494010 m!474537))

(declare-fun m!474539 () Bool)

(assert (=> b!494006 m!474539))

(declare-fun m!474541 () Bool)

(assert (=> b!494006 m!474541))

(declare-fun m!474543 () Bool)

(assert (=> b!494006 m!474543))

(declare-fun m!474545 () Bool)

(assert (=> b!494006 m!474545))

(declare-fun m!474547 () Bool)

(assert (=> b!494006 m!474547))

(assert (=> b!494006 m!474545))

(declare-fun m!474549 () Bool)

(assert (=> b!494006 m!474549))

(assert (=> b!494006 m!474545))

(declare-fun m!474551 () Bool)

(assert (=> b!494006 m!474551))

(assert (=> b!494006 m!474543))

(declare-fun m!474553 () Bool)

(assert (=> b!494006 m!474553))

(assert (=> b!494006 m!474545))

(declare-fun m!474555 () Bool)

(assert (=> b!494006 m!474555))

(assert (=> b!494006 m!474543))

(declare-fun m!474557 () Bool)

(assert (=> b!494006 m!474557))

(declare-fun m!474559 () Bool)

(assert (=> b!494011 m!474559))

(assert (=> b!494007 m!474545))

(assert (=> b!494007 m!474545))

(declare-fun m!474561 () Bool)

(assert (=> b!494007 m!474561))

(declare-fun m!474563 () Bool)

(assert (=> b!494012 m!474563))

(declare-fun m!474565 () Bool)

(assert (=> b!494014 m!474565))

(declare-fun m!474567 () Bool)

(assert (=> start!45030 m!474567))

(declare-fun m!474569 () Bool)

(assert (=> start!45030 m!474569))

(check-sat (not b!494012) (not b!494014) (not b!494010) (not b!494006) (not b!494007) (not b!494008) (not b!494011) (not start!45030))
(check-sat)
