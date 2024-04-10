; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44968 () Bool)

(assert start!44968)

(declare-fun res!295761 () Bool)

(declare-fun e!289677 () Bool)

(assert (=> start!44968 (=> (not res!295761) (not e!289677))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44968 (= res!295761 (validMask!0 mask!3524))))

(assert (=> start!44968 e!289677))

(assert (=> start!44968 true))

(declare-datatypes ((array!31913 0))(
  ( (array!31914 (arr!15341 (Array (_ BitVec 32) (_ BitVec 64))) (size!15705 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31913)

(declare-fun array_inv!11137 (array!31913) Bool)

(assert (=> start!44968 (array_inv!11137 a!3235)))

(declare-fun b!493184 () Bool)

(declare-fun e!289674 () Bool)

(declare-datatypes ((SeekEntryResult!3808 0))(
  ( (MissingZero!3808 (index!17411 (_ BitVec 32))) (Found!3808 (index!17412 (_ BitVec 32))) (Intermediate!3808 (undefined!4620 Bool) (index!17413 (_ BitVec 32)) (x!46494 (_ BitVec 32))) (Undefined!3808) (MissingVacant!3808 (index!17414 (_ BitVec 32))) )
))
(declare-fun lt!223008 () SeekEntryResult!3808)

(assert (=> b!493184 (= e!289674 (or (not (is-Intermediate!3808 lt!223008)) (not (undefined!4620 lt!223008)) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun b!493185 () Bool)

(declare-fun res!295756 () Bool)

(assert (=> b!493185 (=> (not res!295756) (not e!289677))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493185 (= res!295756 (and (= (size!15705 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15705 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15705 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493186 () Bool)

(declare-fun res!295762 () Bool)

(declare-fun e!289676 () Bool)

(assert (=> b!493186 (=> (not res!295762) (not e!289676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31913 (_ BitVec 32)) Bool)

(assert (=> b!493186 (= res!295762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493187 () Bool)

(declare-fun res!295759 () Bool)

(assert (=> b!493187 (=> (not res!295759) (not e!289677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493187 (= res!295759 (validKeyInArray!0 (select (arr!15341 a!3235) j!176)))))

(declare-fun b!493188 () Bool)

(declare-fun res!295755 () Bool)

(assert (=> b!493188 (=> (not res!295755) (not e!289677))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493188 (= res!295755 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493189 () Bool)

(declare-fun res!295760 () Bool)

(assert (=> b!493189 (=> (not res!295760) (not e!289677))))

(assert (=> b!493189 (= res!295760 (validKeyInArray!0 k!2280))))

(declare-fun b!493190 () Bool)

(assert (=> b!493190 (= e!289676 (not e!289674))))

(declare-fun res!295754 () Bool)

(assert (=> b!493190 (=> res!295754 e!289674)))

(declare-fun lt!223012 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31913 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!493190 (= res!295754 (= lt!223008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223012 (select (store (arr!15341 a!3235) i!1204 k!2280) j!176) (array!31914 (store (arr!15341 a!3235) i!1204 k!2280) (size!15705 a!3235)) mask!3524)))))

(declare-fun lt!223011 () (_ BitVec 32))

(assert (=> b!493190 (= lt!223008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223011 (select (arr!15341 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493190 (= lt!223012 (toIndex!0 (select (store (arr!15341 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493190 (= lt!223011 (toIndex!0 (select (arr!15341 a!3235) j!176) mask!3524))))

(declare-fun e!289675 () Bool)

(assert (=> b!493190 e!289675))

(declare-fun res!295758 () Bool)

(assert (=> b!493190 (=> (not res!295758) (not e!289675))))

(assert (=> b!493190 (= res!295758 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14562 0))(
  ( (Unit!14563) )
))
(declare-fun lt!223009 () Unit!14562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14562)

(assert (=> b!493190 (= lt!223009 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493191 () Bool)

(declare-fun res!295763 () Bool)

(assert (=> b!493191 (=> (not res!295763) (not e!289676))))

(declare-datatypes ((List!9499 0))(
  ( (Nil!9496) (Cons!9495 (h!10363 (_ BitVec 64)) (t!15727 List!9499)) )
))
(declare-fun arrayNoDuplicates!0 (array!31913 (_ BitVec 32) List!9499) Bool)

(assert (=> b!493191 (= res!295763 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9496))))

(declare-fun b!493192 () Bool)

(assert (=> b!493192 (= e!289677 e!289676)))

(declare-fun res!295757 () Bool)

(assert (=> b!493192 (=> (not res!295757) (not e!289676))))

(declare-fun lt!223010 () SeekEntryResult!3808)

(assert (=> b!493192 (= res!295757 (or (= lt!223010 (MissingZero!3808 i!1204)) (= lt!223010 (MissingVacant!3808 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31913 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!493192 (= lt!223010 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493193 () Bool)

(assert (=> b!493193 (= e!289675 (= (seekEntryOrOpen!0 (select (arr!15341 a!3235) j!176) a!3235 mask!3524) (Found!3808 j!176)))))

(assert (= (and start!44968 res!295761) b!493185))

(assert (= (and b!493185 res!295756) b!493187))

(assert (= (and b!493187 res!295759) b!493189))

(assert (= (and b!493189 res!295760) b!493188))

(assert (= (and b!493188 res!295755) b!493192))

(assert (= (and b!493192 res!295757) b!493186))

(assert (= (and b!493186 res!295762) b!493191))

(assert (= (and b!493191 res!295763) b!493190))

(assert (= (and b!493190 res!295758) b!493193))

(assert (= (and b!493190 (not res!295754)) b!493184))

(declare-fun m!473955 () Bool)

(assert (=> b!493189 m!473955))

(declare-fun m!473957 () Bool)

(assert (=> b!493188 m!473957))

(declare-fun m!473959 () Bool)

(assert (=> b!493190 m!473959))

(declare-fun m!473961 () Bool)

(assert (=> b!493190 m!473961))

(declare-fun m!473963 () Bool)

(assert (=> b!493190 m!473963))

(declare-fun m!473965 () Bool)

(assert (=> b!493190 m!473965))

(declare-fun m!473967 () Bool)

(assert (=> b!493190 m!473967))

(assert (=> b!493190 m!473963))

(declare-fun m!473969 () Bool)

(assert (=> b!493190 m!473969))

(assert (=> b!493190 m!473965))

(declare-fun m!473971 () Bool)

(assert (=> b!493190 m!473971))

(assert (=> b!493190 m!473965))

(declare-fun m!473973 () Bool)

(assert (=> b!493190 m!473973))

(assert (=> b!493190 m!473963))

(declare-fun m!473975 () Bool)

(assert (=> b!493190 m!473975))

(assert (=> b!493187 m!473965))

(assert (=> b!493187 m!473965))

(declare-fun m!473977 () Bool)

(assert (=> b!493187 m!473977))

(declare-fun m!473979 () Bool)

(assert (=> b!493186 m!473979))

(assert (=> b!493193 m!473965))

(assert (=> b!493193 m!473965))

(declare-fun m!473981 () Bool)

(assert (=> b!493193 m!473981))

(declare-fun m!473983 () Bool)

(assert (=> start!44968 m!473983))

(declare-fun m!473985 () Bool)

(assert (=> start!44968 m!473985))

(declare-fun m!473987 () Bool)

(assert (=> b!493192 m!473987))

(declare-fun m!473989 () Bool)

(assert (=> b!493191 m!473989))

(push 1)

