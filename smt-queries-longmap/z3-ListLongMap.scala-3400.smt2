; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46982 () Bool)

(assert start!46982)

(declare-fun b!518073 () Bool)

(declare-fun res!317148 () Bool)

(declare-fun e!302298 () Bool)

(assert (=> b!518073 (=> (not res!317148) (not e!302298))))

(declare-datatypes ((array!33124 0))(
  ( (array!33125 (arr!15925 (Array (_ BitVec 32) (_ BitVec 64))) (size!16289 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33124)

(declare-datatypes ((List!9990 0))(
  ( (Nil!9987) (Cons!9986 (h!10893 (_ BitVec 64)) (t!16210 List!9990)) )
))
(declare-fun arrayNoDuplicates!0 (array!33124 (_ BitVec 32) List!9990) Bool)

(assert (=> b!518073 (= res!317148 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9987))))

(declare-fun b!518074 () Bool)

(declare-fun e!302295 () Bool)

(assert (=> b!518074 (= e!302298 (not e!302295))))

(declare-fun res!317145 () Bool)

(assert (=> b!518074 (=> res!317145 e!302295)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4348 0))(
  ( (MissingZero!4348 (index!19580 (_ BitVec 32))) (Found!4348 (index!19581 (_ BitVec 32))) (Intermediate!4348 (undefined!5160 Bool) (index!19582 (_ BitVec 32)) (x!48694 (_ BitVec 32))) (Undefined!4348) (MissingVacant!4348 (index!19583 (_ BitVec 32))) )
))
(declare-fun lt!237191 () SeekEntryResult!4348)

(declare-fun lt!237193 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33124 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!518074 (= res!317145 (= lt!237191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237193 (select (store (arr!15925 a!3235) i!1204 k0!2280) j!176) (array!33125 (store (arr!15925 a!3235) i!1204 k0!2280) (size!16289 a!3235)) mask!3524)))))

(declare-fun lt!237190 () (_ BitVec 32))

(assert (=> b!518074 (= lt!237191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237190 (select (arr!15925 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518074 (= lt!237193 (toIndex!0 (select (store (arr!15925 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!518074 (= lt!237190 (toIndex!0 (select (arr!15925 a!3235) j!176) mask!3524))))

(declare-fun e!302297 () Bool)

(assert (=> b!518074 e!302297))

(declare-fun res!317144 () Bool)

(assert (=> b!518074 (=> (not res!317144) (not e!302297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33124 (_ BitVec 32)) Bool)

(assert (=> b!518074 (= res!317144 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16015 0))(
  ( (Unit!16016) )
))
(declare-fun lt!237189 () Unit!16015)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16015)

(assert (=> b!518074 (= lt!237189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518075 () Bool)

(declare-fun res!317149 () Bool)

(assert (=> b!518075 (=> (not res!317149) (not e!302298))))

(assert (=> b!518075 (= res!317149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518076 () Bool)

(declare-fun res!317146 () Bool)

(declare-fun e!302296 () Bool)

(assert (=> b!518076 (=> (not res!317146) (not e!302296))))

(declare-fun arrayContainsKey!0 (array!33124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518076 (= res!317146 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!317151 () Bool)

(assert (=> start!46982 (=> (not res!317151) (not e!302296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46982 (= res!317151 (validMask!0 mask!3524))))

(assert (=> start!46982 e!302296))

(assert (=> start!46982 true))

(declare-fun array_inv!11784 (array!33124) Bool)

(assert (=> start!46982 (array_inv!11784 a!3235)))

(declare-fun b!518077 () Bool)

(declare-fun res!317152 () Bool)

(assert (=> b!518077 (=> (not res!317152) (not e!302296))))

(assert (=> b!518077 (= res!317152 (and (= (size!16289 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16289 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16289 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518078 () Bool)

(assert (=> b!518078 (= e!302296 e!302298)))

(declare-fun res!317150 () Bool)

(assert (=> b!518078 (=> (not res!317150) (not e!302298))))

(declare-fun lt!237192 () SeekEntryResult!4348)

(assert (=> b!518078 (= res!317150 (or (= lt!237192 (MissingZero!4348 i!1204)) (= lt!237192 (MissingVacant!4348 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33124 (_ BitVec 32)) SeekEntryResult!4348)

(assert (=> b!518078 (= lt!237192 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518079 () Bool)

(declare-fun res!317147 () Bool)

(assert (=> b!518079 (=> res!317147 e!302295)))

(get-info :version)

(assert (=> b!518079 (= res!317147 (or (undefined!5160 lt!237191) (not ((_ is Intermediate!4348) lt!237191))))))

(declare-fun b!518080 () Bool)

(declare-fun res!317143 () Bool)

(assert (=> b!518080 (=> (not res!317143) (not e!302296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518080 (= res!317143 (validKeyInArray!0 k0!2280))))

(declare-fun b!518081 () Bool)

(assert (=> b!518081 (= e!302297 (= (seekEntryOrOpen!0 (select (arr!15925 a!3235) j!176) a!3235 mask!3524) (Found!4348 j!176)))))

(declare-fun b!518082 () Bool)

(assert (=> b!518082 (= e!302295 true)))

(assert (=> b!518082 (and (bvslt (x!48694 lt!237191) #b01111111111111111111111111111110) (or (= (select (arr!15925 a!3235) (index!19582 lt!237191)) (select (arr!15925 a!3235) j!176)) (= (select (arr!15925 a!3235) (index!19582 lt!237191)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15925 a!3235) (index!19582 lt!237191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518083 () Bool)

(declare-fun res!317142 () Bool)

(assert (=> b!518083 (=> (not res!317142) (not e!302296))))

(assert (=> b!518083 (= res!317142 (validKeyInArray!0 (select (arr!15925 a!3235) j!176)))))

(assert (= (and start!46982 res!317151) b!518077))

(assert (= (and b!518077 res!317152) b!518083))

(assert (= (and b!518083 res!317142) b!518080))

(assert (= (and b!518080 res!317143) b!518076))

(assert (= (and b!518076 res!317146) b!518078))

(assert (= (and b!518078 res!317150) b!518075))

(assert (= (and b!518075 res!317149) b!518073))

(assert (= (and b!518073 res!317148) b!518074))

(assert (= (and b!518074 res!317144) b!518081))

(assert (= (and b!518074 (not res!317145)) b!518079))

(assert (= (and b!518079 (not res!317147)) b!518082))

(declare-fun m!499669 () Bool)

(assert (=> b!518075 m!499669))

(declare-fun m!499671 () Bool)

(assert (=> start!46982 m!499671))

(declare-fun m!499673 () Bool)

(assert (=> start!46982 m!499673))

(declare-fun m!499675 () Bool)

(assert (=> b!518074 m!499675))

(declare-fun m!499677 () Bool)

(assert (=> b!518074 m!499677))

(declare-fun m!499679 () Bool)

(assert (=> b!518074 m!499679))

(declare-fun m!499681 () Bool)

(assert (=> b!518074 m!499681))

(assert (=> b!518074 m!499675))

(declare-fun m!499683 () Bool)

(assert (=> b!518074 m!499683))

(declare-fun m!499685 () Bool)

(assert (=> b!518074 m!499685))

(assert (=> b!518074 m!499683))

(declare-fun m!499687 () Bool)

(assert (=> b!518074 m!499687))

(assert (=> b!518074 m!499683))

(declare-fun m!499689 () Bool)

(assert (=> b!518074 m!499689))

(assert (=> b!518074 m!499675))

(declare-fun m!499691 () Bool)

(assert (=> b!518074 m!499691))

(assert (=> b!518081 m!499683))

(assert (=> b!518081 m!499683))

(declare-fun m!499693 () Bool)

(assert (=> b!518081 m!499693))

(declare-fun m!499695 () Bool)

(assert (=> b!518080 m!499695))

(declare-fun m!499697 () Bool)

(assert (=> b!518076 m!499697))

(declare-fun m!499699 () Bool)

(assert (=> b!518073 m!499699))

(assert (=> b!518083 m!499683))

(assert (=> b!518083 m!499683))

(declare-fun m!499701 () Bool)

(assert (=> b!518083 m!499701))

(declare-fun m!499703 () Bool)

(assert (=> b!518078 m!499703))

(declare-fun m!499705 () Bool)

(assert (=> b!518082 m!499705))

(assert (=> b!518082 m!499683))

(check-sat (not b!518076) (not start!46982) (not b!518080) (not b!518083) (not b!518078) (not b!518073) (not b!518075) (not b!518074) (not b!518081))
(check-sat)
