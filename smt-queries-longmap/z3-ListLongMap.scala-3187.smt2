; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44736 () Bool)

(assert start!44736)

(declare-fun res!294009 () Bool)

(declare-fun e!288475 () Bool)

(assert (=> start!44736 (=> (not res!294009) (not e!288475))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44736 (= res!294009 (validMask!0 mask!3524))))

(assert (=> start!44736 e!288475))

(assert (=> start!44736 true))

(declare-datatypes ((array!31805 0))(
  ( (array!31806 (arr!15290 (Array (_ BitVec 32) (_ BitVec 64))) (size!15655 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31805)

(declare-fun array_inv!11173 (array!31805) Bool)

(assert (=> start!44736 (array_inv!11173 a!3235)))

(declare-fun b!490928 () Bool)

(declare-fun e!288477 () Bool)

(assert (=> b!490928 (= e!288475 e!288477)))

(declare-fun res!294007 () Bool)

(assert (=> b!490928 (=> (not res!294007) (not e!288477))))

(declare-datatypes ((SeekEntryResult!3754 0))(
  ( (MissingZero!3754 (index!17195 (_ BitVec 32))) (Found!3754 (index!17196 (_ BitVec 32))) (Intermediate!3754 (undefined!4566 Bool) (index!17197 (_ BitVec 32)) (x!46295 (_ BitVec 32))) (Undefined!3754) (MissingVacant!3754 (index!17198 (_ BitVec 32))) )
))
(declare-fun lt!221759 () SeekEntryResult!3754)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490928 (= res!294007 (or (= lt!221759 (MissingZero!3754 i!1204)) (= lt!221759 (MissingVacant!3754 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31805 (_ BitVec 32)) SeekEntryResult!3754)

(assert (=> b!490928 (= lt!221759 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490929 () Bool)

(declare-fun e!288476 () Bool)

(assert (=> b!490929 (= e!288477 (not e!288476))))

(declare-fun res!294011 () Bool)

(assert (=> b!490929 (=> res!294011 e!288476)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221761 () array!31805)

(declare-fun lt!221764 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31805 (_ BitVec 32)) SeekEntryResult!3754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490929 (= res!294011 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15290 a!3235) j!176) mask!3524) (select (arr!15290 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221764 mask!3524) lt!221764 lt!221761 mask!3524))))))

(assert (=> b!490929 (= lt!221764 (select (store (arr!15290 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490929 (= lt!221761 (array!31806 (store (arr!15290 a!3235) i!1204 k0!2280) (size!15655 a!3235)))))

(declare-fun lt!221762 () SeekEntryResult!3754)

(assert (=> b!490929 (= lt!221762 (Found!3754 j!176))))

(assert (=> b!490929 (= lt!221762 (seekEntryOrOpen!0 (select (arr!15290 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31805 (_ BitVec 32)) Bool)

(assert (=> b!490929 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14440 0))(
  ( (Unit!14441) )
))
(declare-fun lt!221760 () Unit!14440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14440)

(assert (=> b!490929 (= lt!221760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490930 () Bool)

(assert (=> b!490930 (= e!288476 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!490930 (= lt!221762 (seekEntryOrOpen!0 lt!221764 lt!221761 mask!3524))))

(declare-fun lt!221763 () Unit!14440)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31805 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14440)

(assert (=> b!490930 (= lt!221763 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490931 () Bool)

(declare-fun res!294013 () Bool)

(assert (=> b!490931 (=> (not res!294013) (not e!288475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490931 (= res!294013 (validKeyInArray!0 (select (arr!15290 a!3235) j!176)))))

(declare-fun b!490932 () Bool)

(declare-fun res!294012 () Bool)

(assert (=> b!490932 (=> (not res!294012) (not e!288475))))

(assert (=> b!490932 (= res!294012 (validKeyInArray!0 k0!2280))))

(declare-fun b!490933 () Bool)

(declare-fun res!294006 () Bool)

(assert (=> b!490933 (=> (not res!294006) (not e!288475))))

(declare-fun arrayContainsKey!0 (array!31805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490933 (= res!294006 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490934 () Bool)

(declare-fun res!294010 () Bool)

(assert (=> b!490934 (=> (not res!294010) (not e!288475))))

(assert (=> b!490934 (= res!294010 (and (= (size!15655 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15655 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15655 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490935 () Bool)

(declare-fun res!294014 () Bool)

(assert (=> b!490935 (=> (not res!294014) (not e!288477))))

(assert (=> b!490935 (= res!294014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490936 () Bool)

(declare-fun res!294008 () Bool)

(assert (=> b!490936 (=> (not res!294008) (not e!288477))))

(declare-datatypes ((List!9487 0))(
  ( (Nil!9484) (Cons!9483 (h!10345 (_ BitVec 64)) (t!15706 List!9487)) )
))
(declare-fun arrayNoDuplicates!0 (array!31805 (_ BitVec 32) List!9487) Bool)

(assert (=> b!490936 (= res!294008 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9484))))

(assert (= (and start!44736 res!294009) b!490934))

(assert (= (and b!490934 res!294010) b!490931))

(assert (= (and b!490931 res!294013) b!490932))

(assert (= (and b!490932 res!294012) b!490933))

(assert (= (and b!490933 res!294006) b!490928))

(assert (= (and b!490928 res!294007) b!490935))

(assert (= (and b!490935 res!294014) b!490936))

(assert (= (and b!490936 res!294008) b!490929))

(assert (= (and b!490929 (not res!294011)) b!490930))

(declare-fun m!470911 () Bool)

(assert (=> b!490935 m!470911))

(declare-fun m!470913 () Bool)

(assert (=> b!490928 m!470913))

(declare-fun m!470915 () Bool)

(assert (=> start!44736 m!470915))

(declare-fun m!470917 () Bool)

(assert (=> start!44736 m!470917))

(declare-fun m!470919 () Bool)

(assert (=> b!490932 m!470919))

(declare-fun m!470921 () Bool)

(assert (=> b!490931 m!470921))

(assert (=> b!490931 m!470921))

(declare-fun m!470923 () Bool)

(assert (=> b!490931 m!470923))

(declare-fun m!470925 () Bool)

(assert (=> b!490936 m!470925))

(declare-fun m!470927 () Bool)

(assert (=> b!490933 m!470927))

(declare-fun m!470929 () Bool)

(assert (=> b!490929 m!470929))

(declare-fun m!470931 () Bool)

(assert (=> b!490929 m!470931))

(declare-fun m!470933 () Bool)

(assert (=> b!490929 m!470933))

(declare-fun m!470935 () Bool)

(assert (=> b!490929 m!470935))

(assert (=> b!490929 m!470921))

(declare-fun m!470937 () Bool)

(assert (=> b!490929 m!470937))

(declare-fun m!470939 () Bool)

(assert (=> b!490929 m!470939))

(declare-fun m!470941 () Bool)

(assert (=> b!490929 m!470941))

(assert (=> b!490929 m!470921))

(assert (=> b!490929 m!470935))

(assert (=> b!490929 m!470939))

(assert (=> b!490929 m!470921))

(declare-fun m!470943 () Bool)

(assert (=> b!490929 m!470943))

(assert (=> b!490929 m!470921))

(declare-fun m!470945 () Bool)

(assert (=> b!490929 m!470945))

(declare-fun m!470947 () Bool)

(assert (=> b!490930 m!470947))

(declare-fun m!470949 () Bool)

(assert (=> b!490930 m!470949))

(check-sat (not b!490933) (not b!490935) (not b!490932) (not b!490930) (not start!44736) (not b!490929) (not b!490928) (not b!490936) (not b!490931))
(check-sat)
