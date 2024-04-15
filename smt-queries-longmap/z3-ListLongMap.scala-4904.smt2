; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67646 () Bool)

(assert start!67646)

(declare-fun b!783508 () Bool)

(declare-fun res!530176 () Bool)

(declare-fun e!435623 () Bool)

(assert (=> b!783508 (=> (not res!530176) (not e!435623))))

(declare-datatypes ((array!42705 0))(
  ( (array!42706 (arr!20441 (Array (_ BitVec 32) (_ BitVec 64))) (size!20862 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42705)

(declare-datatypes ((List!14482 0))(
  ( (Nil!14479) (Cons!14478 (h!15601 (_ BitVec 64)) (t!20788 List!14482)) )
))
(declare-fun arrayNoDuplicates!0 (array!42705 (_ BitVec 32) List!14482) Bool)

(assert (=> b!783508 (= res!530176 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14479))))

(declare-fun b!783509 () Bool)

(declare-fun e!435630 () Bool)

(assert (=> b!783509 (= e!435630 true)))

(declare-fun e!435627 () Bool)

(assert (=> b!783509 e!435627))

(declare-fun res!530169 () Bool)

(assert (=> b!783509 (=> (not res!530169) (not e!435627))))

(declare-fun lt!349089 () (_ BitVec 64))

(assert (=> b!783509 (= res!530169 (= lt!349089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27020 0))(
  ( (Unit!27021) )
))
(declare-fun lt!349096 () Unit!27020)

(declare-fun e!435631 () Unit!27020)

(assert (=> b!783509 (= lt!349096 e!435631)))

(declare-fun c!87081 () Bool)

(assert (=> b!783509 (= c!87081 (= lt!349089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783510 () Bool)

(declare-fun Unit!27022 () Unit!27020)

(assert (=> b!783510 (= e!435631 Unit!27022)))

(assert (=> b!783510 false))

(declare-fun b!783511 () Bool)

(declare-fun res!530166 () Bool)

(assert (=> b!783511 (=> (not res!530166) (not e!435627))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349099 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!349090 () array!42705)

(declare-datatypes ((SeekEntryResult!8038 0))(
  ( (MissingZero!8038 (index!34520 (_ BitVec 32))) (Found!8038 (index!34521 (_ BitVec 32))) (Intermediate!8038 (undefined!8850 Bool) (index!34522 (_ BitVec 32)) (x!65485 (_ BitVec 32))) (Undefined!8038) (MissingVacant!8038 (index!34523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42705 (_ BitVec 32)) SeekEntryResult!8038)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42705 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!783511 (= res!530166 (= (seekEntryOrOpen!0 lt!349099 lt!349090 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349099 lt!349090 mask!3328)))))

(declare-fun b!783512 () Bool)

(declare-fun res!530180 () Bool)

(declare-fun e!435625 () Bool)

(assert (=> b!783512 (=> (not res!530180) (not e!435625))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783512 (= res!530180 (and (= (size!20862 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20862 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20862 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783513 () Bool)

(declare-fun res!530164 () Bool)

(declare-fun e!435633 () Bool)

(assert (=> b!783513 (=> (not res!530164) (not e!435633))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!783513 (= res!530164 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20441 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783514 () Bool)

(declare-fun e!435624 () Bool)

(assert (=> b!783514 (= e!435633 e!435624)))

(declare-fun res!530172 () Bool)

(assert (=> b!783514 (=> (not res!530172) (not e!435624))))

(declare-fun lt!349093 () SeekEntryResult!8038)

(declare-fun lt!349095 () SeekEntryResult!8038)

(assert (=> b!783514 (= res!530172 (= lt!349093 lt!349095))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42705 (_ BitVec 32)) SeekEntryResult!8038)

(assert (=> b!783514 (= lt!349095 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349099 lt!349090 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783514 (= lt!349093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349099 mask!3328) lt!349099 lt!349090 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783514 (= lt!349099 (select (store (arr!20441 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783514 (= lt!349090 (array!42706 (store (arr!20441 a!3186) i!1173 k0!2102) (size!20862 a!3186)))))

(declare-fun b!783515 () Bool)

(declare-fun res!530181 () Bool)

(assert (=> b!783515 (=> (not res!530181) (not e!435633))))

(declare-fun e!435632 () Bool)

(assert (=> b!783515 (= res!530181 e!435632)))

(declare-fun c!87080 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783515 (= c!87080 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783516 () Bool)

(declare-fun lt!349098 () SeekEntryResult!8038)

(assert (=> b!783516 (= e!435632 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349098))))

(declare-fun res!530165 () Bool)

(assert (=> start!67646 (=> (not res!530165) (not e!435625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67646 (= res!530165 (validMask!0 mask!3328))))

(assert (=> start!67646 e!435625))

(assert (=> start!67646 true))

(declare-fun array_inv!16324 (array!42705) Bool)

(assert (=> start!67646 (array_inv!16324 a!3186)))

(declare-fun b!783517 () Bool)

(declare-fun e!435628 () Bool)

(declare-fun e!435626 () Bool)

(assert (=> b!783517 (= e!435628 e!435626)))

(declare-fun res!530173 () Bool)

(assert (=> b!783517 (=> res!530173 e!435626)))

(declare-fun lt!349097 () SeekEntryResult!8038)

(declare-fun lt!349092 () SeekEntryResult!8038)

(assert (=> b!783517 (= res!530173 (not (= lt!349097 lt!349092)))))

(assert (=> b!783517 (= lt!349097 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783518 () Bool)

(assert (=> b!783518 (= e!435626 e!435630)))

(declare-fun res!530178 () Bool)

(assert (=> b!783518 (=> res!530178 e!435630)))

(assert (=> b!783518 (= res!530178 (= lt!349089 lt!349099))))

(assert (=> b!783518 (= lt!349089 (select (store (arr!20441 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783519 () Bool)

(assert (=> b!783519 (= e!435624 (not e!435628))))

(declare-fun res!530168 () Bool)

(assert (=> b!783519 (=> res!530168 e!435628)))

(get-info :version)

(assert (=> b!783519 (= res!530168 (or (not ((_ is Intermediate!8038) lt!349095)) (bvslt x!1131 (x!65485 lt!349095)) (not (= x!1131 (x!65485 lt!349095))) (not (= index!1321 (index!34522 lt!349095)))))))

(declare-fun e!435634 () Bool)

(assert (=> b!783519 e!435634))

(declare-fun res!530163 () Bool)

(assert (=> b!783519 (=> (not res!530163) (not e!435634))))

(declare-fun lt!349100 () SeekEntryResult!8038)

(assert (=> b!783519 (= res!530163 (= lt!349100 lt!349092))))

(assert (=> b!783519 (= lt!349092 (Found!8038 j!159))))

(assert (=> b!783519 (= lt!349100 (seekEntryOrOpen!0 (select (arr!20441 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42705 (_ BitVec 32)) Bool)

(assert (=> b!783519 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349094 () Unit!27020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27020)

(assert (=> b!783519 (= lt!349094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783520 () Bool)

(declare-fun res!530177 () Bool)

(assert (=> b!783520 (=> (not res!530177) (not e!435625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783520 (= res!530177 (validKeyInArray!0 (select (arr!20441 a!3186) j!159)))))

(declare-fun b!783521 () Bool)

(declare-fun Unit!27023 () Unit!27020)

(assert (=> b!783521 (= e!435631 Unit!27023)))

(declare-fun b!783522 () Bool)

(assert (=> b!783522 (= e!435625 e!435623)))

(declare-fun res!530167 () Bool)

(assert (=> b!783522 (=> (not res!530167) (not e!435623))))

(declare-fun lt!349091 () SeekEntryResult!8038)

(assert (=> b!783522 (= res!530167 (or (= lt!349091 (MissingZero!8038 i!1173)) (= lt!349091 (MissingVacant!8038 i!1173))))))

(assert (=> b!783522 (= lt!349091 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783523 () Bool)

(assert (=> b!783523 (= e!435632 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) (Found!8038 j!159)))))

(declare-fun b!783524 () Bool)

(assert (=> b!783524 (= e!435627 (= lt!349100 lt!349097))))

(declare-fun b!783525 () Bool)

(assert (=> b!783525 (= e!435634 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349092))))

(declare-fun b!783526 () Bool)

(declare-fun res!530170 () Bool)

(assert (=> b!783526 (=> (not res!530170) (not e!435623))))

(assert (=> b!783526 (= res!530170 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20862 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20862 a!3186))))))

(declare-fun b!783527 () Bool)

(assert (=> b!783527 (= e!435623 e!435633)))

(declare-fun res!530171 () Bool)

(assert (=> b!783527 (=> (not res!530171) (not e!435633))))

(assert (=> b!783527 (= res!530171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20441 a!3186) j!159) mask!3328) (select (arr!20441 a!3186) j!159) a!3186 mask!3328) lt!349098))))

(assert (=> b!783527 (= lt!349098 (Intermediate!8038 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783528 () Bool)

(declare-fun res!530175 () Bool)

(assert (=> b!783528 (=> (not res!530175) (not e!435623))))

(assert (=> b!783528 (= res!530175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783529 () Bool)

(declare-fun res!530174 () Bool)

(assert (=> b!783529 (=> (not res!530174) (not e!435625))))

(declare-fun arrayContainsKey!0 (array!42705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783529 (= res!530174 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783530 () Bool)

(declare-fun res!530179 () Bool)

(assert (=> b!783530 (=> (not res!530179) (not e!435625))))

(assert (=> b!783530 (= res!530179 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67646 res!530165) b!783512))

(assert (= (and b!783512 res!530180) b!783520))

(assert (= (and b!783520 res!530177) b!783530))

(assert (= (and b!783530 res!530179) b!783529))

(assert (= (and b!783529 res!530174) b!783522))

(assert (= (and b!783522 res!530167) b!783528))

(assert (= (and b!783528 res!530175) b!783508))

(assert (= (and b!783508 res!530176) b!783526))

(assert (= (and b!783526 res!530170) b!783527))

(assert (= (and b!783527 res!530171) b!783513))

(assert (= (and b!783513 res!530164) b!783515))

(assert (= (and b!783515 c!87080) b!783516))

(assert (= (and b!783515 (not c!87080)) b!783523))

(assert (= (and b!783515 res!530181) b!783514))

(assert (= (and b!783514 res!530172) b!783519))

(assert (= (and b!783519 res!530163) b!783525))

(assert (= (and b!783519 (not res!530168)) b!783517))

(assert (= (and b!783517 (not res!530173)) b!783518))

(assert (= (and b!783518 (not res!530178)) b!783509))

(assert (= (and b!783509 c!87081) b!783510))

(assert (= (and b!783509 (not c!87081)) b!783521))

(assert (= (and b!783509 res!530169) b!783511))

(assert (= (and b!783511 res!530166) b!783524))

(declare-fun m!725487 () Bool)

(assert (=> start!67646 m!725487))

(declare-fun m!725489 () Bool)

(assert (=> start!67646 m!725489))

(declare-fun m!725491 () Bool)

(assert (=> b!783517 m!725491))

(assert (=> b!783517 m!725491))

(declare-fun m!725493 () Bool)

(assert (=> b!783517 m!725493))

(assert (=> b!783520 m!725491))

(assert (=> b!783520 m!725491))

(declare-fun m!725495 () Bool)

(assert (=> b!783520 m!725495))

(declare-fun m!725497 () Bool)

(assert (=> b!783508 m!725497))

(declare-fun m!725499 () Bool)

(assert (=> b!783513 m!725499))

(declare-fun m!725501 () Bool)

(assert (=> b!783522 m!725501))

(declare-fun m!725503 () Bool)

(assert (=> b!783511 m!725503))

(declare-fun m!725505 () Bool)

(assert (=> b!783511 m!725505))

(assert (=> b!783516 m!725491))

(assert (=> b!783516 m!725491))

(declare-fun m!725507 () Bool)

(assert (=> b!783516 m!725507))

(assert (=> b!783519 m!725491))

(assert (=> b!783519 m!725491))

(declare-fun m!725509 () Bool)

(assert (=> b!783519 m!725509))

(declare-fun m!725511 () Bool)

(assert (=> b!783519 m!725511))

(declare-fun m!725513 () Bool)

(assert (=> b!783519 m!725513))

(assert (=> b!783523 m!725491))

(assert (=> b!783523 m!725491))

(assert (=> b!783523 m!725493))

(declare-fun m!725515 () Bool)

(assert (=> b!783514 m!725515))

(declare-fun m!725517 () Bool)

(assert (=> b!783514 m!725517))

(declare-fun m!725519 () Bool)

(assert (=> b!783514 m!725519))

(assert (=> b!783514 m!725519))

(declare-fun m!725521 () Bool)

(assert (=> b!783514 m!725521))

(declare-fun m!725523 () Bool)

(assert (=> b!783514 m!725523))

(assert (=> b!783527 m!725491))

(assert (=> b!783527 m!725491))

(declare-fun m!725525 () Bool)

(assert (=> b!783527 m!725525))

(assert (=> b!783527 m!725525))

(assert (=> b!783527 m!725491))

(declare-fun m!725527 () Bool)

(assert (=> b!783527 m!725527))

(declare-fun m!725529 () Bool)

(assert (=> b!783529 m!725529))

(declare-fun m!725531 () Bool)

(assert (=> b!783528 m!725531))

(assert (=> b!783525 m!725491))

(assert (=> b!783525 m!725491))

(declare-fun m!725533 () Bool)

(assert (=> b!783525 m!725533))

(assert (=> b!783518 m!725517))

(declare-fun m!725535 () Bool)

(assert (=> b!783518 m!725535))

(declare-fun m!725537 () Bool)

(assert (=> b!783530 m!725537))

(check-sat (not b!783519) (not b!783525) (not b!783528) (not b!783520) (not b!783523) (not b!783508) (not b!783517) (not b!783527) (not b!783514) (not start!67646) (not b!783522) (not b!783516) (not b!783530) (not b!783511) (not b!783529))
(check-sat)
