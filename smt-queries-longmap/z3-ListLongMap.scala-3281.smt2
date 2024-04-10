; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45632 () Bool)

(assert start!45632)

(declare-fun b!503045 () Bool)

(declare-fun res!304395 () Bool)

(declare-fun e!294614 () Bool)

(assert (=> b!503045 (=> (not res!304395) (not e!294614))))

(declare-datatypes ((array!32388 0))(
  ( (array!32389 (arr!15574 (Array (_ BitVec 32) (_ BitVec 64))) (size!15938 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32388)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32388 (_ BitVec 32)) Bool)

(assert (=> b!503045 (= res!304395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503046 () Bool)

(declare-fun e!294617 () Bool)

(assert (=> b!503046 (= e!294617 false)))

(declare-fun b!503047 () Bool)

(declare-fun res!304392 () Bool)

(declare-fun e!294613 () Bool)

(assert (=> b!503047 (=> (not res!304392) (not e!294613))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503047 (= res!304392 (validKeyInArray!0 (select (arr!15574 a!3235) j!176)))))

(declare-fun b!503048 () Bool)

(declare-fun res!304396 () Bool)

(declare-fun e!294615 () Bool)

(assert (=> b!503048 (=> res!304396 e!294615)))

(declare-fun e!294621 () Bool)

(assert (=> b!503048 (= res!304396 e!294621)))

(declare-fun res!304391 () Bool)

(assert (=> b!503048 (=> (not res!304391) (not e!294621))))

(declare-datatypes ((SeekEntryResult!4041 0))(
  ( (MissingZero!4041 (index!18352 (_ BitVec 32))) (Found!4041 (index!18353 (_ BitVec 32))) (Intermediate!4041 (undefined!4853 Bool) (index!18354 (_ BitVec 32)) (x!47378 (_ BitVec 32))) (Undefined!4041) (MissingVacant!4041 (index!18355 (_ BitVec 32))) )
))
(declare-fun lt!228775 () SeekEntryResult!4041)

(assert (=> b!503048 (= res!304391 (bvsgt #b00000000000000000000000000000000 (x!47378 lt!228775)))))

(declare-fun b!503049 () Bool)

(assert (=> b!503049 (= e!294615 true)))

(declare-fun lt!228768 () SeekEntryResult!4041)

(declare-fun lt!228776 () (_ BitVec 32))

(declare-fun lt!228772 () array!32388)

(declare-fun lt!228771 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32388 (_ BitVec 32)) SeekEntryResult!4041)

(assert (=> b!503049 (= lt!228768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228776 lt!228771 lt!228772 mask!3524))))

(declare-fun b!503050 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32388 (_ BitVec 32)) SeekEntryResult!4041)

(assert (=> b!503050 (= e!294621 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228776 (index!18354 lt!228775) (select (arr!15574 a!3235) j!176) a!3235 mask!3524) (Found!4041 j!176))))))

(declare-fun b!503051 () Bool)

(assert (=> b!503051 (= e!294613 e!294614)))

(declare-fun res!304400 () Bool)

(assert (=> b!503051 (=> (not res!304400) (not e!294614))))

(declare-fun lt!228773 () SeekEntryResult!4041)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503051 (= res!304400 (or (= lt!228773 (MissingZero!4041 i!1204)) (= lt!228773 (MissingVacant!4041 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32388 (_ BitVec 32)) SeekEntryResult!4041)

(assert (=> b!503051 (= lt!228773 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503052 () Bool)

(declare-fun e!294618 () Bool)

(assert (=> b!503052 (= e!294618 (= (seekEntryOrOpen!0 (select (arr!15574 a!3235) j!176) a!3235 mask!3524) (Found!4041 j!176)))))

(declare-fun b!503053 () Bool)

(declare-fun e!294616 () Bool)

(assert (=> b!503053 (= e!294616 e!294615)))

(declare-fun res!304393 () Bool)

(assert (=> b!503053 (=> res!304393 e!294615)))

(assert (=> b!503053 (= res!304393 (or (bvsgt (x!47378 lt!228775) #b01111111111111111111111111111110) (bvslt lt!228776 #b00000000000000000000000000000000) (bvsge lt!228776 (size!15938 a!3235)) (bvslt (index!18354 lt!228775) #b00000000000000000000000000000000) (bvsge (index!18354 lt!228775) (size!15938 a!3235)) (not (= lt!228775 (Intermediate!4041 false (index!18354 lt!228775) (x!47378 lt!228775))))))))

(assert (=> b!503053 (= (index!18354 lt!228775) i!1204)))

(declare-datatypes ((Unit!15240 0))(
  ( (Unit!15241) )
))
(declare-fun lt!228778 () Unit!15240)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15240)

(assert (=> b!503053 (= lt!228778 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228776 #b00000000000000000000000000000000 (index!18354 lt!228775) (x!47378 lt!228775) mask!3524))))

(assert (=> b!503053 (and (or (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228774 () Unit!15240)

(declare-fun e!294620 () Unit!15240)

(assert (=> b!503053 (= lt!228774 e!294620)))

(declare-fun c!59606 () Bool)

(assert (=> b!503053 (= c!59606 (= (select (arr!15574 a!3235) (index!18354 lt!228775)) (select (arr!15574 a!3235) j!176)))))

(assert (=> b!503053 (and (bvslt (x!47378 lt!228775) #b01111111111111111111111111111110) (or (= (select (arr!15574 a!3235) (index!18354 lt!228775)) (select (arr!15574 a!3235) j!176)) (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15574 a!3235) (index!18354 lt!228775)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503054 () Bool)

(assert (=> b!503054 (= e!294614 (not e!294616))))

(declare-fun res!304399 () Bool)

(assert (=> b!503054 (=> res!304399 e!294616)))

(declare-fun lt!228770 () (_ BitVec 32))

(assert (=> b!503054 (= res!304399 (= lt!228775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228770 lt!228771 lt!228772 mask!3524)))))

(assert (=> b!503054 (= lt!228775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228776 (select (arr!15574 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503054 (= lt!228770 (toIndex!0 lt!228771 mask!3524))))

(assert (=> b!503054 (= lt!228771 (select (store (arr!15574 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503054 (= lt!228776 (toIndex!0 (select (arr!15574 a!3235) j!176) mask!3524))))

(assert (=> b!503054 (= lt!228772 (array!32389 (store (arr!15574 a!3235) i!1204 k0!2280) (size!15938 a!3235)))))

(assert (=> b!503054 e!294618))

(declare-fun res!304403 () Bool)

(assert (=> b!503054 (=> (not res!304403) (not e!294618))))

(assert (=> b!503054 (= res!304403 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228777 () Unit!15240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15240)

(assert (=> b!503054 (= lt!228777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503055 () Bool)

(declare-fun res!304402 () Bool)

(assert (=> b!503055 (=> res!304402 e!294616)))

(get-info :version)

(assert (=> b!503055 (= res!304402 (or (undefined!4853 lt!228775) (not ((_ is Intermediate!4041) lt!228775))))))

(declare-fun b!503056 () Bool)

(declare-fun res!304389 () Bool)

(assert (=> b!503056 (=> (not res!304389) (not e!294613))))

(assert (=> b!503056 (= res!304389 (validKeyInArray!0 k0!2280))))

(declare-fun b!503044 () Bool)

(declare-fun res!304397 () Bool)

(assert (=> b!503044 (=> (not res!304397) (not e!294614))))

(declare-datatypes ((List!9732 0))(
  ( (Nil!9729) (Cons!9728 (h!10605 (_ BitVec 64)) (t!15960 List!9732)) )
))
(declare-fun arrayNoDuplicates!0 (array!32388 (_ BitVec 32) List!9732) Bool)

(assert (=> b!503044 (= res!304397 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9729))))

(declare-fun res!304398 () Bool)

(assert (=> start!45632 (=> (not res!304398) (not e!294613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45632 (= res!304398 (validMask!0 mask!3524))))

(assert (=> start!45632 e!294613))

(assert (=> start!45632 true))

(declare-fun array_inv!11370 (array!32388) Bool)

(assert (=> start!45632 (array_inv!11370 a!3235)))

(declare-fun b!503057 () Bool)

(declare-fun Unit!15242 () Unit!15240)

(assert (=> b!503057 (= e!294620 Unit!15242)))

(declare-fun b!503058 () Bool)

(declare-fun res!304390 () Bool)

(assert (=> b!503058 (=> (not res!304390) (not e!294613))))

(declare-fun arrayContainsKey!0 (array!32388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503058 (= res!304390 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503059 () Bool)

(declare-fun Unit!15243 () Unit!15240)

(assert (=> b!503059 (= e!294620 Unit!15243)))

(declare-fun lt!228769 () Unit!15240)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15240)

(assert (=> b!503059 (= lt!228769 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228776 #b00000000000000000000000000000000 (index!18354 lt!228775) (x!47378 lt!228775) mask!3524))))

(declare-fun res!304401 () Bool)

(assert (=> b!503059 (= res!304401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228776 lt!228771 lt!228772 mask!3524) (Intermediate!4041 false (index!18354 lt!228775) (x!47378 lt!228775))))))

(assert (=> b!503059 (=> (not res!304401) (not e!294617))))

(assert (=> b!503059 e!294617))

(declare-fun b!503060 () Bool)

(declare-fun res!304394 () Bool)

(assert (=> b!503060 (=> (not res!304394) (not e!294613))))

(assert (=> b!503060 (= res!304394 (and (= (size!15938 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15938 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15938 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45632 res!304398) b!503060))

(assert (= (and b!503060 res!304394) b!503047))

(assert (= (and b!503047 res!304392) b!503056))

(assert (= (and b!503056 res!304389) b!503058))

(assert (= (and b!503058 res!304390) b!503051))

(assert (= (and b!503051 res!304400) b!503045))

(assert (= (and b!503045 res!304395) b!503044))

(assert (= (and b!503044 res!304397) b!503054))

(assert (= (and b!503054 res!304403) b!503052))

(assert (= (and b!503054 (not res!304399)) b!503055))

(assert (= (and b!503055 (not res!304402)) b!503053))

(assert (= (and b!503053 c!59606) b!503059))

(assert (= (and b!503053 (not c!59606)) b!503057))

(assert (= (and b!503059 res!304401) b!503046))

(assert (= (and b!503053 (not res!304393)) b!503048))

(assert (= (and b!503048 res!304391) b!503050))

(assert (= (and b!503048 (not res!304396)) b!503049))

(declare-fun m!483919 () Bool)

(assert (=> b!503044 m!483919))

(declare-fun m!483921 () Bool)

(assert (=> b!503050 m!483921))

(assert (=> b!503050 m!483921))

(declare-fun m!483923 () Bool)

(assert (=> b!503050 m!483923))

(declare-fun m!483925 () Bool)

(assert (=> start!45632 m!483925))

(declare-fun m!483927 () Bool)

(assert (=> start!45632 m!483927))

(assert (=> b!503047 m!483921))

(assert (=> b!503047 m!483921))

(declare-fun m!483929 () Bool)

(assert (=> b!503047 m!483929))

(declare-fun m!483931 () Bool)

(assert (=> b!503053 m!483931))

(declare-fun m!483933 () Bool)

(assert (=> b!503053 m!483933))

(assert (=> b!503053 m!483921))

(declare-fun m!483935 () Bool)

(assert (=> b!503045 m!483935))

(declare-fun m!483937 () Bool)

(assert (=> b!503058 m!483937))

(declare-fun m!483939 () Bool)

(assert (=> b!503059 m!483939))

(declare-fun m!483941 () Bool)

(assert (=> b!503059 m!483941))

(assert (=> b!503049 m!483941))

(assert (=> b!503052 m!483921))

(assert (=> b!503052 m!483921))

(declare-fun m!483943 () Bool)

(assert (=> b!503052 m!483943))

(declare-fun m!483945 () Bool)

(assert (=> b!503054 m!483945))

(declare-fun m!483947 () Bool)

(assert (=> b!503054 m!483947))

(declare-fun m!483949 () Bool)

(assert (=> b!503054 m!483949))

(declare-fun m!483951 () Bool)

(assert (=> b!503054 m!483951))

(assert (=> b!503054 m!483921))

(declare-fun m!483953 () Bool)

(assert (=> b!503054 m!483953))

(assert (=> b!503054 m!483921))

(declare-fun m!483955 () Bool)

(assert (=> b!503054 m!483955))

(declare-fun m!483957 () Bool)

(assert (=> b!503054 m!483957))

(assert (=> b!503054 m!483921))

(declare-fun m!483959 () Bool)

(assert (=> b!503054 m!483959))

(declare-fun m!483961 () Bool)

(assert (=> b!503051 m!483961))

(declare-fun m!483963 () Bool)

(assert (=> b!503056 m!483963))

(check-sat (not b!503045) (not b!503047) (not b!503056) (not b!503044) (not b!503052) (not b!503049) (not b!503059) (not b!503054) (not b!503058) (not start!45632) (not b!503053) (not b!503050) (not b!503051))
(check-sat)
