; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45676 () Bool)

(assert start!45676)

(declare-fun b!504166 () Bool)

(declare-datatypes ((Unit!15328 0))(
  ( (Unit!15329) )
))
(declare-fun e!295213 () Unit!15328)

(declare-fun Unit!15330 () Unit!15328)

(assert (=> b!504166 (= e!295213 Unit!15330)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32432 0))(
  ( (array!32433 (arr!15596 (Array (_ BitVec 32) (_ BitVec 64))) (size!15960 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32432)

(declare-fun lt!229501 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4063 0))(
  ( (MissingZero!4063 (index!18440 (_ BitVec 32))) (Found!4063 (index!18441 (_ BitVec 32))) (Intermediate!4063 (undefined!4875 Bool) (index!18442 (_ BitVec 32)) (x!47456 (_ BitVec 32))) (Undefined!4063) (MissingVacant!4063 (index!18443 (_ BitVec 32))) )
))
(declare-fun lt!229504 () SeekEntryResult!4063)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229497 () Unit!15328)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32432 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15328)

(assert (=> b!504166 (= lt!229497 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229501 #b00000000000000000000000000000000 (index!18442 lt!229504) (x!47456 lt!229504) mask!3524))))

(declare-fun lt!229495 () array!32432)

(declare-fun res!305385 () Bool)

(declare-fun lt!229494 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504166 (= res!305385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229501 lt!229494 lt!229495 mask!3524) (Intermediate!4063 false (index!18442 lt!229504) (x!47456 lt!229504))))))

(declare-fun e!295207 () Bool)

(assert (=> b!504166 (=> (not res!305385) (not e!295207))))

(assert (=> b!504166 e!295207))

(declare-fun b!504167 () Bool)

(declare-fun e!295212 () Bool)

(assert (=> b!504167 (= e!295212 true)))

(declare-fun lt!229499 () SeekEntryResult!4063)

(assert (=> b!504167 (= lt!229499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229501 lt!229494 lt!229495 mask!3524))))

(declare-fun b!504168 () Bool)

(declare-fun Unit!15331 () Unit!15328)

(assert (=> b!504168 (= e!295213 Unit!15331)))

(declare-fun b!504170 () Bool)

(declare-fun e!295209 () Bool)

(declare-fun e!295211 () Bool)

(assert (=> b!504170 (= e!295209 (not e!295211))))

(declare-fun res!305393 () Bool)

(assert (=> b!504170 (=> res!305393 e!295211)))

(declare-fun lt!229502 () (_ BitVec 32))

(assert (=> b!504170 (= res!305393 (= lt!229504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229502 lt!229494 lt!229495 mask!3524)))))

(assert (=> b!504170 (= lt!229504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229501 (select (arr!15596 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504170 (= lt!229502 (toIndex!0 lt!229494 mask!3524))))

(assert (=> b!504170 (= lt!229494 (select (store (arr!15596 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504170 (= lt!229501 (toIndex!0 (select (arr!15596 a!3235) j!176) mask!3524))))

(assert (=> b!504170 (= lt!229495 (array!32433 (store (arr!15596 a!3235) i!1204 k!2280) (size!15960 a!3235)))))

(declare-fun e!295214 () Bool)

(assert (=> b!504170 e!295214))

(declare-fun res!305380 () Bool)

(assert (=> b!504170 (=> (not res!305380) (not e!295214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32432 (_ BitVec 32)) Bool)

(assert (=> b!504170 (= res!305380 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229496 () Unit!15328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15328)

(assert (=> b!504170 (= lt!229496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504171 () Bool)

(declare-fun res!305386 () Bool)

(declare-fun e!295208 () Bool)

(assert (=> b!504171 (=> (not res!305386) (not e!295208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504171 (= res!305386 (validKeyInArray!0 (select (arr!15596 a!3235) j!176)))))

(declare-fun b!504172 () Bool)

(declare-fun res!305389 () Bool)

(assert (=> b!504172 (=> (not res!305389) (not e!295209))))

(assert (=> b!504172 (= res!305389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504173 () Bool)

(declare-fun e!295210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504173 (= e!295210 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229501 (index!18442 lt!229504) (select (arr!15596 a!3235) j!176) a!3235 mask!3524) (Found!4063 j!176))))))

(declare-fun b!504174 () Bool)

(declare-fun res!305387 () Bool)

(assert (=> b!504174 (=> (not res!305387) (not e!295208))))

(declare-fun arrayContainsKey!0 (array!32432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504174 (= res!305387 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504175 () Bool)

(assert (=> b!504175 (= e!295208 e!295209)))

(declare-fun res!305379 () Bool)

(assert (=> b!504175 (=> (not res!305379) (not e!295209))))

(declare-fun lt!229503 () SeekEntryResult!4063)

(assert (=> b!504175 (= res!305379 (or (= lt!229503 (MissingZero!4063 i!1204)) (= lt!229503 (MissingVacant!4063 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32432 (_ BitVec 32)) SeekEntryResult!4063)

(assert (=> b!504175 (= lt!229503 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504176 () Bool)

(assert (=> b!504176 (= e!295214 (= (seekEntryOrOpen!0 (select (arr!15596 a!3235) j!176) a!3235 mask!3524) (Found!4063 j!176)))))

(declare-fun b!504177 () Bool)

(declare-fun res!305382 () Bool)

(assert (=> b!504177 (=> res!305382 e!295212)))

(assert (=> b!504177 (= res!305382 e!295210)))

(declare-fun res!305384 () Bool)

(assert (=> b!504177 (=> (not res!305384) (not e!295210))))

(assert (=> b!504177 (= res!305384 (bvsgt #b00000000000000000000000000000000 (x!47456 lt!229504)))))

(declare-fun b!504178 () Bool)

(assert (=> b!504178 (= e!295211 e!295212)))

(declare-fun res!305392 () Bool)

(assert (=> b!504178 (=> res!305392 e!295212)))

(assert (=> b!504178 (= res!305392 (or (bvsgt (x!47456 lt!229504) #b01111111111111111111111111111110) (bvslt lt!229501 #b00000000000000000000000000000000) (bvsge lt!229501 (size!15960 a!3235)) (bvslt (index!18442 lt!229504) #b00000000000000000000000000000000) (bvsge (index!18442 lt!229504) (size!15960 a!3235)) (not (= lt!229504 (Intermediate!4063 false (index!18442 lt!229504) (x!47456 lt!229504))))))))

(assert (=> b!504178 (= (index!18442 lt!229504) i!1204)))

(declare-fun lt!229498 () Unit!15328)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32432 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15328)

(assert (=> b!504178 (= lt!229498 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229501 #b00000000000000000000000000000000 (index!18442 lt!229504) (x!47456 lt!229504) mask!3524))))

(assert (=> b!504178 (and (or (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229500 () Unit!15328)

(assert (=> b!504178 (= lt!229500 e!295213)))

(declare-fun c!59672 () Bool)

(assert (=> b!504178 (= c!59672 (= (select (arr!15596 a!3235) (index!18442 lt!229504)) (select (arr!15596 a!3235) j!176)))))

(assert (=> b!504178 (and (bvslt (x!47456 lt!229504) #b01111111111111111111111111111110) (or (= (select (arr!15596 a!3235) (index!18442 lt!229504)) (select (arr!15596 a!3235) j!176)) (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15596 a!3235) (index!18442 lt!229504)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504169 () Bool)

(declare-fun res!305390 () Bool)

(assert (=> b!504169 (=> (not res!305390) (not e!295208))))

(assert (=> b!504169 (= res!305390 (and (= (size!15960 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15960 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15960 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!305391 () Bool)

(assert (=> start!45676 (=> (not res!305391) (not e!295208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45676 (= res!305391 (validMask!0 mask!3524))))

(assert (=> start!45676 e!295208))

(assert (=> start!45676 true))

(declare-fun array_inv!11392 (array!32432) Bool)

(assert (=> start!45676 (array_inv!11392 a!3235)))

(declare-fun b!504179 () Bool)

(declare-fun res!305383 () Bool)

(assert (=> b!504179 (=> (not res!305383) (not e!295208))))

(assert (=> b!504179 (= res!305383 (validKeyInArray!0 k!2280))))

(declare-fun b!504180 () Bool)

(declare-fun res!305381 () Bool)

(assert (=> b!504180 (=> (not res!305381) (not e!295209))))

(declare-datatypes ((List!9754 0))(
  ( (Nil!9751) (Cons!9750 (h!10627 (_ BitVec 64)) (t!15982 List!9754)) )
))
(declare-fun arrayNoDuplicates!0 (array!32432 (_ BitVec 32) List!9754) Bool)

(assert (=> b!504180 (= res!305381 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9751))))

(declare-fun b!504181 () Bool)

(assert (=> b!504181 (= e!295207 false)))

(declare-fun b!504182 () Bool)

(declare-fun res!305388 () Bool)

(assert (=> b!504182 (=> res!305388 e!295211)))

(assert (=> b!504182 (= res!305388 (or (undefined!4875 lt!229504) (not (is-Intermediate!4063 lt!229504))))))

(assert (= (and start!45676 res!305391) b!504169))

(assert (= (and b!504169 res!305390) b!504171))

(assert (= (and b!504171 res!305386) b!504179))

(assert (= (and b!504179 res!305383) b!504174))

(assert (= (and b!504174 res!305387) b!504175))

(assert (= (and b!504175 res!305379) b!504172))

(assert (= (and b!504172 res!305389) b!504180))

(assert (= (and b!504180 res!305381) b!504170))

(assert (= (and b!504170 res!305380) b!504176))

(assert (= (and b!504170 (not res!305393)) b!504182))

(assert (= (and b!504182 (not res!305388)) b!504178))

(assert (= (and b!504178 c!59672) b!504166))

(assert (= (and b!504178 (not c!59672)) b!504168))

(assert (= (and b!504166 res!305385) b!504181))

(assert (= (and b!504178 (not res!305392)) b!504177))

(assert (= (and b!504177 res!305384) b!504173))

(assert (= (and b!504177 (not res!305382)) b!504167))

(declare-fun m!484931 () Bool)

(assert (=> b!504180 m!484931))

(declare-fun m!484933 () Bool)

(assert (=> b!504170 m!484933))

(declare-fun m!484935 () Bool)

(assert (=> b!504170 m!484935))

(declare-fun m!484937 () Bool)

(assert (=> b!504170 m!484937))

(declare-fun m!484939 () Bool)

(assert (=> b!504170 m!484939))

(declare-fun m!484941 () Bool)

(assert (=> b!504170 m!484941))

(assert (=> b!504170 m!484933))

(declare-fun m!484943 () Bool)

(assert (=> b!504170 m!484943))

(assert (=> b!504170 m!484933))

(declare-fun m!484945 () Bool)

(assert (=> b!504170 m!484945))

(declare-fun m!484947 () Bool)

(assert (=> b!504170 m!484947))

(declare-fun m!484949 () Bool)

(assert (=> b!504170 m!484949))

(declare-fun m!484951 () Bool)

(assert (=> b!504175 m!484951))

(assert (=> b!504171 m!484933))

(assert (=> b!504171 m!484933))

(declare-fun m!484953 () Bool)

(assert (=> b!504171 m!484953))

(declare-fun m!484955 () Bool)

(assert (=> start!45676 m!484955))

(declare-fun m!484957 () Bool)

(assert (=> start!45676 m!484957))

(declare-fun m!484959 () Bool)

(assert (=> b!504172 m!484959))

(declare-fun m!484961 () Bool)

(assert (=> b!504178 m!484961))

(declare-fun m!484963 () Bool)

(assert (=> b!504178 m!484963))

(assert (=> b!504178 m!484933))

(declare-fun m!484965 () Bool)

(assert (=> b!504166 m!484965))

(declare-fun m!484967 () Bool)

(assert (=> b!504166 m!484967))

(assert (=> b!504167 m!484967))

(assert (=> b!504176 m!484933))

(assert (=> b!504176 m!484933))

(declare-fun m!484969 () Bool)

(assert (=> b!504176 m!484969))

(declare-fun m!484971 () Bool)

(assert (=> b!504179 m!484971))

(declare-fun m!484973 () Bool)

(assert (=> b!504174 m!484973))

(assert (=> b!504173 m!484933))

(assert (=> b!504173 m!484933))

(declare-fun m!484975 () Bool)

(assert (=> b!504173 m!484975))

(push 1)

