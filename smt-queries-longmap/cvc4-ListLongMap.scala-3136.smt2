; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44116 () Bool)

(assert start!44116)

(declare-fun b!486116 () Bool)

(declare-fun res!289720 () Bool)

(declare-fun e!286131 () Bool)

(assert (=> b!486116 (=> (not res!289720) (not e!286131))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31484 0))(
  ( (array!31485 (arr!15140 (Array (_ BitVec 32) (_ BitVec 64))) (size!15504 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31484)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486116 (= res!289720 (and (= (size!15504 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15504 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15504 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486117 () Bool)

(declare-fun res!289719 () Bool)

(assert (=> b!486117 (=> (not res!289719) (not e!286131))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486117 (= res!289719 (validKeyInArray!0 k!2280))))

(declare-fun b!486118 () Bool)

(declare-fun res!289723 () Bool)

(assert (=> b!486118 (=> (not res!289723) (not e!286131))))

(declare-fun arrayContainsKey!0 (array!31484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486118 (= res!289723 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486119 () Bool)

(declare-fun res!289722 () Bool)

(assert (=> b!486119 (=> (not res!289722) (not e!286131))))

(assert (=> b!486119 (= res!289722 (validKeyInArray!0 (select (arr!15140 a!3235) j!176)))))

(declare-fun b!486120 () Bool)

(declare-fun e!286129 () Bool)

(assert (=> b!486120 (= e!286131 e!286129)))

(declare-fun res!289724 () Bool)

(assert (=> b!486120 (=> (not res!289724) (not e!286129))))

(declare-datatypes ((SeekEntryResult!3607 0))(
  ( (MissingZero!3607 (index!16607 (_ BitVec 32))) (Found!3607 (index!16608 (_ BitVec 32))) (Intermediate!3607 (undefined!4419 Bool) (index!16609 (_ BitVec 32)) (x!45739 (_ BitVec 32))) (Undefined!3607) (MissingVacant!3607 (index!16610 (_ BitVec 32))) )
))
(declare-fun lt!219628 () SeekEntryResult!3607)

(assert (=> b!486120 (= res!289724 (or (= lt!219628 (MissingZero!3607 i!1204)) (= lt!219628 (MissingVacant!3607 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31484 (_ BitVec 32)) SeekEntryResult!3607)

(assert (=> b!486120 (= lt!219628 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486121 () Bool)

(assert (=> b!486121 (= e!286129 (and (bvsle #b00000000000000000000000000000000 (size!15504 a!3235)) (bvsge (size!15504 a!3235) #b01111111111111111111111111111111)))))

(declare-fun res!289721 () Bool)

(assert (=> start!44116 (=> (not res!289721) (not e!286131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44116 (= res!289721 (validMask!0 mask!3524))))

(assert (=> start!44116 e!286131))

(assert (=> start!44116 true))

(declare-fun array_inv!10936 (array!31484) Bool)

(assert (=> start!44116 (array_inv!10936 a!3235)))

(declare-fun b!486122 () Bool)

(declare-fun res!289718 () Bool)

(assert (=> b!486122 (=> (not res!289718) (not e!286129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31484 (_ BitVec 32)) Bool)

(assert (=> b!486122 (= res!289718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44116 res!289721) b!486116))

(assert (= (and b!486116 res!289720) b!486119))

(assert (= (and b!486119 res!289722) b!486117))

(assert (= (and b!486117 res!289719) b!486118))

(assert (= (and b!486118 res!289723) b!486120))

(assert (= (and b!486120 res!289724) b!486122))

(assert (= (and b!486122 res!289718) b!486121))

(declare-fun m!466145 () Bool)

(assert (=> b!486122 m!466145))

(declare-fun m!466147 () Bool)

(assert (=> b!486119 m!466147))

(assert (=> b!486119 m!466147))

(declare-fun m!466149 () Bool)

(assert (=> b!486119 m!466149))

(declare-fun m!466151 () Bool)

(assert (=> b!486117 m!466151))

(declare-fun m!466153 () Bool)

(assert (=> b!486118 m!466153))

(declare-fun m!466155 () Bool)

(assert (=> start!44116 m!466155))

(declare-fun m!466157 () Bool)

(assert (=> start!44116 m!466157))

(declare-fun m!466159 () Bool)

(assert (=> b!486120 m!466159))

(push 1)

(assert (not start!44116))

(assert (not b!486118))

(assert (not b!486120))

(assert (not b!486119))

(assert (not b!486117))

(assert (not b!486122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77461 () Bool)

(declare-fun lt!219659 () SeekEntryResult!3607)

(assert (=> d!77461 (and (or (is-Undefined!3607 lt!219659) (not (is-Found!3607 lt!219659)) (and (bvsge (index!16608 lt!219659) #b00000000000000000000000000000000) (bvslt (index!16608 lt!219659) (size!15504 a!3235)))) (or (is-Undefined!3607 lt!219659) (is-Found!3607 lt!219659) (not (is-MissingZero!3607 lt!219659)) (and (bvsge (index!16607 lt!219659) #b00000000000000000000000000000000) (bvslt (index!16607 lt!219659) (size!15504 a!3235)))) (or (is-Undefined!3607 lt!219659) (is-Found!3607 lt!219659) (is-MissingZero!3607 lt!219659) (not (is-MissingVacant!3607 lt!219659)) (and (bvsge (index!16610 lt!219659) #b00000000000000000000000000000000) (bvslt (index!16610 lt!219659) (size!15504 a!3235)))) (or (is-Undefined!3607 lt!219659) (ite (is-Found!3607 lt!219659) (= (select (arr!15140 a!3235) (index!16608 lt!219659)) k!2280) (ite (is-MissingZero!3607 lt!219659) (= (select (arr!15140 a!3235) (index!16607 lt!219659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3607 lt!219659) (= (select (arr!15140 a!3235) (index!16610 lt!219659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286163 () SeekEntryResult!3607)

(assert (=> d!77461 (= lt!219659 e!286163)))

(declare-fun c!58493 () Bool)

(declare-fun lt!219661 () SeekEntryResult!3607)

(assert (=> d!77461 (= c!58493 (and (is-Intermediate!3607 lt!219661) (undefined!4419 lt!219661)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31484 (_ BitVec 32)) SeekEntryResult!3607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77461 (= lt!219661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77461 (validMask!0 mask!3524)))

(assert (=> d!77461 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!219659)))

(declare-fun e!286162 () SeekEntryResult!3607)

(declare-fun b!486179 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31484 (_ BitVec 32)) SeekEntryResult!3607)

(assert (=> b!486179 (= e!286162 (seekKeyOrZeroReturnVacant!0 (x!45739 lt!219661) (index!16609 lt!219661) (index!16609 lt!219661) k!2280 a!3235 mask!3524))))

(declare-fun b!486180 () Bool)

(assert (=> b!486180 (= e!286162 (MissingZero!3607 (index!16609 lt!219661)))))

(declare-fun b!486181 () Bool)

(assert (=> b!486181 (= e!286163 Undefined!3607)))

(declare-fun b!486182 () Bool)

(declare-fun e!286164 () SeekEntryResult!3607)

(assert (=> b!486182 (= e!286164 (Found!3607 (index!16609 lt!219661)))))

(declare-fun b!486183 () Bool)

(declare-fun c!58495 () Bool)

(declare-fun lt!219660 () (_ BitVec 64))

(assert (=> b!486183 (= c!58495 (= lt!219660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486183 (= e!286164 e!286162)))

(declare-fun b!486184 () Bool)

(assert (=> b!486184 (= e!286163 e!286164)))

(assert (=> b!486184 (= lt!219660 (select (arr!15140 a!3235) (index!16609 lt!219661)))))

(declare-fun c!58494 () Bool)

(assert (=> b!486184 (= c!58494 (= lt!219660 k!2280))))

(assert (= (and d!77461 c!58493) b!486181))

(assert (= (and d!77461 (not c!58493)) b!486184))

(assert (= (and b!486184 c!58494) b!486182))

(assert (= (and b!486184 (not c!58494)) b!486183))

(assert (= (and b!486183 c!58495) b!486180))

(assert (= (and b!486183 (not c!58495)) b!486179))

(declare-fun m!466189 () Bool)

(assert (=> d!77461 m!466189))

(declare-fun m!466191 () Bool)

(assert (=> d!77461 m!466191))

