; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45464 () Bool)

(assert start!45464)

(declare-fun b!500567 () Bool)

(declare-fun e!293271 () Bool)

(assert (=> b!500567 (= e!293271 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!500568 () Bool)

(declare-fun e!293265 () Bool)

(declare-datatypes ((array!32290 0))(
  ( (array!32291 (arr!15526 (Array (_ BitVec 32) (_ BitVec 64))) (size!15890 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32290)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3949 0))(
  ( (MissingZero!3949 (index!17978 (_ BitVec 32))) (Found!3949 (index!17979 (_ BitVec 32))) (Intermediate!3949 (undefined!4761 Bool) (index!17980 (_ BitVec 32)) (x!47159 (_ BitVec 32))) (Undefined!3949) (MissingVacant!3949 (index!17981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32290 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!500568 (= e!293265 (= (seekEntryOrOpen!0 (select (arr!15526 a!3235) j!176) a!3235 mask!3524) (Found!3949 j!176)))))

(declare-fun b!500569 () Bool)

(declare-fun res!302428 () Bool)

(declare-fun e!293267 () Bool)

(assert (=> b!500569 (=> res!302428 e!293267)))

(declare-fun lt!227258 () SeekEntryResult!3949)

(get-info :version)

(assert (=> b!500569 (= res!302428 (or (undefined!4761 lt!227258) (not ((_ is Intermediate!3949) lt!227258))))))

(declare-fun b!500570 () Bool)

(declare-fun res!302426 () Bool)

(declare-fun e!293269 () Bool)

(assert (=> b!500570 (=> (not res!302426) (not e!293269))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500570 (= res!302426 (and (= (size!15890 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15890 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15890 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500571 () Bool)

(declare-fun e!293264 () Bool)

(assert (=> b!500571 (= e!293267 e!293264)))

(declare-fun res!302437 () Bool)

(assert (=> b!500571 (=> res!302437 e!293264)))

(declare-fun lt!227252 () (_ BitVec 32))

(assert (=> b!500571 (= res!302437 (or (bvsgt #b00000000000000000000000000000000 (x!47159 lt!227258)) (bvsgt (x!47159 lt!227258) #b01111111111111111111111111111110) (bvslt lt!227252 #b00000000000000000000000000000000) (bvsge lt!227252 (size!15890 a!3235)) (bvslt (index!17980 lt!227258) #b00000000000000000000000000000000) (bvsge (index!17980 lt!227258) (size!15890 a!3235)) (not (= lt!227258 (Intermediate!3949 false (index!17980 lt!227258) (x!47159 lt!227258))))))))

(assert (=> b!500571 (and (or (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15031 0))(
  ( (Unit!15032) )
))
(declare-fun lt!227253 () Unit!15031)

(declare-fun e!293268 () Unit!15031)

(assert (=> b!500571 (= lt!227253 e!293268)))

(declare-fun c!59348 () Bool)

(assert (=> b!500571 (= c!59348 (= (select (arr!15526 a!3235) (index!17980 lt!227258)) (select (arr!15526 a!3235) j!176)))))

(assert (=> b!500571 (and (bvslt (x!47159 lt!227258) #b01111111111111111111111111111110) (or (= (select (arr!15526 a!3235) (index!17980 lt!227258)) (select (arr!15526 a!3235) j!176)) (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15526 a!3235) (index!17980 lt!227258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302431 () Bool)

(assert (=> start!45464 (=> (not res!302431) (not e!293269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45464 (= res!302431 (validMask!0 mask!3524))))

(assert (=> start!45464 e!293269))

(assert (=> start!45464 true))

(declare-fun array_inv!11385 (array!32290) Bool)

(assert (=> start!45464 (array_inv!11385 a!3235)))

(declare-fun b!500572 () Bool)

(declare-fun Unit!15033 () Unit!15031)

(assert (=> b!500572 (= e!293268 Unit!15033)))

(declare-fun b!500573 () Bool)

(declare-fun res!302436 () Bool)

(declare-fun e!293266 () Bool)

(assert (=> b!500573 (=> (not res!302436) (not e!293266))))

(declare-datatypes ((List!9591 0))(
  ( (Nil!9588) (Cons!9587 (h!10461 (_ BitVec 64)) (t!15811 List!9591)) )
))
(declare-fun arrayNoDuplicates!0 (array!32290 (_ BitVec 32) List!9591) Bool)

(assert (=> b!500573 (= res!302436 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9588))))

(declare-fun b!500574 () Bool)

(assert (=> b!500574 (= e!293264 true)))

(declare-fun lt!227255 () array!32290)

(declare-fun lt!227251 () SeekEntryResult!3949)

(declare-fun lt!227260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32290 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!500574 (= lt!227251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227252 lt!227260 lt!227255 mask!3524))))

(declare-fun b!500575 () Bool)

(declare-fun Unit!15034 () Unit!15031)

(assert (=> b!500575 (= e!293268 Unit!15034)))

(declare-fun lt!227257 () Unit!15031)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32290 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15031)

(assert (=> b!500575 (= lt!227257 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227252 #b00000000000000000000000000000000 (index!17980 lt!227258) (x!47159 lt!227258) mask!3524))))

(declare-fun res!302435 () Bool)

(assert (=> b!500575 (= res!302435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227252 lt!227260 lt!227255 mask!3524) (Intermediate!3949 false (index!17980 lt!227258) (x!47159 lt!227258))))))

(assert (=> b!500575 (=> (not res!302435) (not e!293271))))

(assert (=> b!500575 e!293271))

(declare-fun b!500576 () Bool)

(declare-fun res!302425 () Bool)

(assert (=> b!500576 (=> (not res!302425) (not e!293269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500576 (= res!302425 (validKeyInArray!0 (select (arr!15526 a!3235) j!176)))))

(declare-fun b!500577 () Bool)

(assert (=> b!500577 (= e!293266 (not e!293267))))

(declare-fun res!302433 () Bool)

(assert (=> b!500577 (=> res!302433 e!293267)))

(declare-fun lt!227254 () (_ BitVec 32))

(assert (=> b!500577 (= res!302433 (= lt!227258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227254 lt!227260 lt!227255 mask!3524)))))

(assert (=> b!500577 (= lt!227258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227252 (select (arr!15526 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500577 (= lt!227254 (toIndex!0 lt!227260 mask!3524))))

(assert (=> b!500577 (= lt!227260 (select (store (arr!15526 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500577 (= lt!227252 (toIndex!0 (select (arr!15526 a!3235) j!176) mask!3524))))

(assert (=> b!500577 (= lt!227255 (array!32291 (store (arr!15526 a!3235) i!1204 k0!2280) (size!15890 a!3235)))))

(assert (=> b!500577 e!293265))

(declare-fun res!302427 () Bool)

(assert (=> b!500577 (=> (not res!302427) (not e!293265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32290 (_ BitVec 32)) Bool)

(assert (=> b!500577 (= res!302427 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227256 () Unit!15031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15031)

(assert (=> b!500577 (= lt!227256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500578 () Bool)

(declare-fun res!302432 () Bool)

(assert (=> b!500578 (=> (not res!302432) (not e!293266))))

(assert (=> b!500578 (= res!302432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500579 () Bool)

(assert (=> b!500579 (= e!293269 e!293266)))

(declare-fun res!302434 () Bool)

(assert (=> b!500579 (=> (not res!302434) (not e!293266))))

(declare-fun lt!227259 () SeekEntryResult!3949)

(assert (=> b!500579 (= res!302434 (or (= lt!227259 (MissingZero!3949 i!1204)) (= lt!227259 (MissingVacant!3949 i!1204))))))

(assert (=> b!500579 (= lt!227259 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500580 () Bool)

(declare-fun res!302430 () Bool)

(assert (=> b!500580 (=> (not res!302430) (not e!293269))))

(declare-fun arrayContainsKey!0 (array!32290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500580 (= res!302430 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500581 () Bool)

(declare-fun res!302429 () Bool)

(assert (=> b!500581 (=> (not res!302429) (not e!293269))))

(assert (=> b!500581 (= res!302429 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45464 res!302431) b!500570))

(assert (= (and b!500570 res!302426) b!500576))

(assert (= (and b!500576 res!302425) b!500581))

(assert (= (and b!500581 res!302429) b!500580))

(assert (= (and b!500580 res!302430) b!500579))

(assert (= (and b!500579 res!302434) b!500578))

(assert (= (and b!500578 res!302432) b!500573))

(assert (= (and b!500573 res!302436) b!500577))

(assert (= (and b!500577 res!302427) b!500568))

(assert (= (and b!500577 (not res!302433)) b!500569))

(assert (= (and b!500569 (not res!302428)) b!500571))

(assert (= (and b!500571 c!59348) b!500575))

(assert (= (and b!500571 (not c!59348)) b!500572))

(assert (= (and b!500575 res!302435) b!500567))

(assert (= (and b!500571 (not res!302437)) b!500574))

(declare-fun m!481933 () Bool)

(assert (=> b!500571 m!481933))

(declare-fun m!481935 () Bool)

(assert (=> b!500571 m!481935))

(declare-fun m!481937 () Bool)

(assert (=> b!500580 m!481937))

(assert (=> b!500568 m!481935))

(assert (=> b!500568 m!481935))

(declare-fun m!481939 () Bool)

(assert (=> b!500568 m!481939))

(declare-fun m!481941 () Bool)

(assert (=> b!500575 m!481941))

(declare-fun m!481943 () Bool)

(assert (=> b!500575 m!481943))

(declare-fun m!481945 () Bool)

(assert (=> b!500578 m!481945))

(declare-fun m!481947 () Bool)

(assert (=> b!500581 m!481947))

(assert (=> b!500577 m!481935))

(declare-fun m!481949 () Bool)

(assert (=> b!500577 m!481949))

(declare-fun m!481951 () Bool)

(assert (=> b!500577 m!481951))

(declare-fun m!481953 () Bool)

(assert (=> b!500577 m!481953))

(declare-fun m!481955 () Bool)

(assert (=> b!500577 m!481955))

(assert (=> b!500577 m!481935))

(declare-fun m!481957 () Bool)

(assert (=> b!500577 m!481957))

(declare-fun m!481959 () Bool)

(assert (=> b!500577 m!481959))

(declare-fun m!481961 () Bool)

(assert (=> b!500577 m!481961))

(declare-fun m!481963 () Bool)

(assert (=> b!500577 m!481963))

(assert (=> b!500577 m!481935))

(declare-fun m!481965 () Bool)

(assert (=> b!500573 m!481965))

(declare-fun m!481967 () Bool)

(assert (=> start!45464 m!481967))

(declare-fun m!481969 () Bool)

(assert (=> start!45464 m!481969))

(assert (=> b!500576 m!481935))

(assert (=> b!500576 m!481935))

(declare-fun m!481971 () Bool)

(assert (=> b!500576 m!481971))

(declare-fun m!481973 () Bool)

(assert (=> b!500579 m!481973))

(assert (=> b!500574 m!481943))

(check-sat (not b!500574) (not b!500568) (not b!500580) (not start!45464) (not b!500578) (not b!500577) (not b!500576) (not b!500573) (not b!500579) (not b!500575) (not b!500581))
(check-sat)
