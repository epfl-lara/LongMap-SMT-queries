; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67458 () Bool)

(assert start!67458)

(declare-fun b!780400 () Bool)

(declare-fun res!528008 () Bool)

(declare-fun e!434125 () Bool)

(assert (=> b!780400 (=> (not res!528008) (not e!434125))))

(declare-datatypes ((array!42624 0))(
  ( (array!42625 (arr!20403 (Array (_ BitVec 32) (_ BitVec 64))) (size!20824 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42624)

(declare-datatypes ((List!14405 0))(
  ( (Nil!14402) (Cons!14401 (h!15518 (_ BitVec 64)) (t!20720 List!14405)) )
))
(declare-fun arrayNoDuplicates!0 (array!42624 (_ BitVec 32) List!14405) Bool)

(assert (=> b!780400 (= res!528008 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14402))))

(declare-fun b!780401 () Bool)

(declare-fun e!434129 () Bool)

(declare-fun e!434130 () Bool)

(assert (=> b!780401 (= e!434129 e!434130)))

(declare-fun res!528004 () Bool)

(assert (=> b!780401 (=> (not res!528004) (not e!434130))))

(declare-datatypes ((SeekEntryResult!8003 0))(
  ( (MissingZero!8003 (index!34380 (_ BitVec 32))) (Found!8003 (index!34381 (_ BitVec 32))) (Intermediate!8003 (undefined!8815 Bool) (index!34382 (_ BitVec 32)) (x!65333 (_ BitVec 32))) (Undefined!8003) (MissingVacant!8003 (index!34383 (_ BitVec 32))) )
))
(declare-fun lt!347765 () SeekEntryResult!8003)

(declare-fun lt!347769 () SeekEntryResult!8003)

(assert (=> b!780401 (= res!528004 (= lt!347765 lt!347769))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!347770 () array!42624)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347772 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42624 (_ BitVec 32)) SeekEntryResult!8003)

(assert (=> b!780401 (= lt!347769 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347772 lt!347770 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780401 (= lt!347765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347772 mask!3328) lt!347772 lt!347770 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!780401 (= lt!347772 (select (store (arr!20403 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780401 (= lt!347770 (array!42625 (store (arr!20403 a!3186) i!1173 k!2102) (size!20824 a!3186)))))

(declare-fun b!780403 () Bool)

(declare-fun res!528007 () Bool)

(declare-fun e!434132 () Bool)

(assert (=> b!780403 (=> res!528007 e!434132)))

(assert (=> b!780403 (= res!528007 (= (select (store (arr!20403 a!3186) i!1173 k!2102) index!1321) lt!347772))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!780404 () Bool)

(declare-fun e!434127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42624 (_ BitVec 32)) SeekEntryResult!8003)

(assert (=> b!780404 (= e!434127 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20403 a!3186) j!159) a!3186 mask!3328) (Found!8003 j!159)))))

(declare-fun lt!347766 () SeekEntryResult!8003)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!780405 () Bool)

(declare-fun e!434128 () Bool)

(assert (=> b!780405 (= e!434128 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20403 a!3186) j!159) a!3186 mask!3328) lt!347766))))

(declare-fun b!780406 () Bool)

(declare-fun res!528010 () Bool)

(assert (=> b!780406 (=> (not res!528010) (not e!434125))))

(assert (=> b!780406 (= res!528010 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20824 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20824 a!3186))))))

(declare-fun b!780407 () Bool)

(declare-fun e!434124 () Bool)

(assert (=> b!780407 (= e!434124 e!434125)))

(declare-fun res!528009 () Bool)

(assert (=> b!780407 (=> (not res!528009) (not e!434125))))

(declare-fun lt!347774 () SeekEntryResult!8003)

(assert (=> b!780407 (= res!528009 (or (= lt!347774 (MissingZero!8003 i!1173)) (= lt!347774 (MissingVacant!8003 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42624 (_ BitVec 32)) SeekEntryResult!8003)

(assert (=> b!780407 (= lt!347774 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780408 () Bool)

(assert (=> b!780408 (= e!434130 (not e!434132))))

(declare-fun res!528011 () Bool)

(assert (=> b!780408 (=> res!528011 e!434132)))

(assert (=> b!780408 (= res!528011 (or (not (is-Intermediate!8003 lt!347769)) (bvslt x!1131 (x!65333 lt!347769)) (not (= x!1131 (x!65333 lt!347769))) (not (= index!1321 (index!34382 lt!347769)))))))

(assert (=> b!780408 e!434128))

(declare-fun res!528016 () Bool)

(assert (=> b!780408 (=> (not res!528016) (not e!434128))))

(declare-fun lt!347773 () SeekEntryResult!8003)

(assert (=> b!780408 (= res!528016 (= lt!347773 lt!347766))))

(assert (=> b!780408 (= lt!347766 (Found!8003 j!159))))

(assert (=> b!780408 (= lt!347773 (seekEntryOrOpen!0 (select (arr!20403 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42624 (_ BitVec 32)) Bool)

(assert (=> b!780408 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26900 0))(
  ( (Unit!26901) )
))
(declare-fun lt!347767 () Unit!26900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26900)

(assert (=> b!780408 (= lt!347767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780409 () Bool)

(declare-fun e!434131 () Unit!26900)

(declare-fun Unit!26902 () Unit!26900)

(assert (=> b!780409 (= e!434131 Unit!26902)))

(declare-fun b!780410 () Bool)

(declare-fun res!528013 () Bool)

(assert (=> b!780410 (=> (not res!528013) (not e!434124))))

(assert (=> b!780410 (= res!528013 (and (= (size!20824 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20824 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20824 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780411 () Bool)

(declare-fun res!528005 () Bool)

(assert (=> b!780411 (=> (not res!528005) (not e!434124))))

(declare-fun arrayContainsKey!0 (array!42624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780411 (= res!528005 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780412 () Bool)

(declare-fun res!528017 () Bool)

(assert (=> b!780412 (=> (not res!528017) (not e!434125))))

(assert (=> b!780412 (= res!528017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!347771 () SeekEntryResult!8003)

(declare-fun b!780402 () Bool)

(assert (=> b!780402 (= e!434127 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20403 a!3186) j!159) a!3186 mask!3328) lt!347771))))

(declare-fun res!528002 () Bool)

(assert (=> start!67458 (=> (not res!528002) (not e!434124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67458 (= res!528002 (validMask!0 mask!3328))))

(assert (=> start!67458 e!434124))

(assert (=> start!67458 true))

(declare-fun array_inv!16199 (array!42624) Bool)

(assert (=> start!67458 (array_inv!16199 a!3186)))

(declare-fun b!780413 () Bool)

(declare-fun res!528014 () Bool)

(assert (=> b!780413 (=> (not res!528014) (not e!434124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780413 (= res!528014 (validKeyInArray!0 (select (arr!20403 a!3186) j!159)))))

(declare-fun b!780414 () Bool)

(assert (=> b!780414 (= e!434132 true)))

(declare-fun lt!347768 () Unit!26900)

(assert (=> b!780414 (= lt!347768 e!434131)))

(declare-fun c!86604 () Bool)

(assert (=> b!780414 (= c!86604 (= (select (store (arr!20403 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780415 () Bool)

(declare-fun res!528001 () Bool)

(assert (=> b!780415 (=> res!528001 e!434132)))

(assert (=> b!780415 (= res!528001 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20403 a!3186) j!159) a!3186 mask!3328) lt!347766)))))

(declare-fun b!780416 () Bool)

(declare-fun res!528006 () Bool)

(assert (=> b!780416 (=> (not res!528006) (not e!434129))))

(assert (=> b!780416 (= res!528006 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20403 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780417 () Bool)

(assert (=> b!780417 (= e!434125 e!434129)))

(declare-fun res!528012 () Bool)

(assert (=> b!780417 (=> (not res!528012) (not e!434129))))

(assert (=> b!780417 (= res!528012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20403 a!3186) j!159) mask!3328) (select (arr!20403 a!3186) j!159) a!3186 mask!3328) lt!347771))))

(assert (=> b!780417 (= lt!347771 (Intermediate!8003 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780418 () Bool)

(declare-fun res!528015 () Bool)

(assert (=> b!780418 (=> (not res!528015) (not e!434124))))

(assert (=> b!780418 (= res!528015 (validKeyInArray!0 k!2102))))

(declare-fun b!780419 () Bool)

(declare-fun Unit!26903 () Unit!26900)

(assert (=> b!780419 (= e!434131 Unit!26903)))

(assert (=> b!780419 false))

(declare-fun b!780420 () Bool)

(declare-fun res!528003 () Bool)

(assert (=> b!780420 (=> (not res!528003) (not e!434129))))

(assert (=> b!780420 (= res!528003 e!434127)))

(declare-fun c!86605 () Bool)

(assert (=> b!780420 (= c!86605 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67458 res!528002) b!780410))

(assert (= (and b!780410 res!528013) b!780413))

(assert (= (and b!780413 res!528014) b!780418))

(assert (= (and b!780418 res!528015) b!780411))

(assert (= (and b!780411 res!528005) b!780407))

(assert (= (and b!780407 res!528009) b!780412))

(assert (= (and b!780412 res!528017) b!780400))

(assert (= (and b!780400 res!528008) b!780406))

(assert (= (and b!780406 res!528010) b!780417))

(assert (= (and b!780417 res!528012) b!780416))

(assert (= (and b!780416 res!528006) b!780420))

(assert (= (and b!780420 c!86605) b!780402))

(assert (= (and b!780420 (not c!86605)) b!780404))

(assert (= (and b!780420 res!528003) b!780401))

(assert (= (and b!780401 res!528004) b!780408))

(assert (= (and b!780408 res!528016) b!780405))

(assert (= (and b!780408 (not res!528011)) b!780415))

(assert (= (and b!780415 (not res!528001)) b!780403))

(assert (= (and b!780403 (not res!528007)) b!780414))

(assert (= (and b!780414 c!86604) b!780419))

(assert (= (and b!780414 (not c!86604)) b!780409))

(declare-fun m!723713 () Bool)

(assert (=> b!780407 m!723713))

(declare-fun m!723715 () Bool)

(assert (=> b!780408 m!723715))

(assert (=> b!780408 m!723715))

(declare-fun m!723717 () Bool)

(assert (=> b!780408 m!723717))

(declare-fun m!723719 () Bool)

(assert (=> b!780408 m!723719))

(declare-fun m!723721 () Bool)

(assert (=> b!780408 m!723721))

(declare-fun m!723723 () Bool)

(assert (=> b!780403 m!723723))

(declare-fun m!723725 () Bool)

(assert (=> b!780403 m!723725))

(assert (=> b!780415 m!723715))

(assert (=> b!780415 m!723715))

(declare-fun m!723727 () Bool)

(assert (=> b!780415 m!723727))

(assert (=> b!780405 m!723715))

(assert (=> b!780405 m!723715))

(declare-fun m!723729 () Bool)

(assert (=> b!780405 m!723729))

(assert (=> b!780413 m!723715))

(assert (=> b!780413 m!723715))

(declare-fun m!723731 () Bool)

(assert (=> b!780413 m!723731))

(assert (=> b!780402 m!723715))

(assert (=> b!780402 m!723715))

(declare-fun m!723733 () Bool)

(assert (=> b!780402 m!723733))

(declare-fun m!723735 () Bool)

(assert (=> b!780416 m!723735))

(declare-fun m!723737 () Bool)

(assert (=> start!67458 m!723737))

(declare-fun m!723739 () Bool)

(assert (=> start!67458 m!723739))

(declare-fun m!723741 () Bool)

(assert (=> b!780400 m!723741))

(assert (=> b!780417 m!723715))

(assert (=> b!780417 m!723715))

(declare-fun m!723743 () Bool)

(assert (=> b!780417 m!723743))

(assert (=> b!780417 m!723743))

(assert (=> b!780417 m!723715))

(declare-fun m!723745 () Bool)

(assert (=> b!780417 m!723745))

(declare-fun m!723747 () Bool)

(assert (=> b!780401 m!723747))

(declare-fun m!723749 () Bool)

(assert (=> b!780401 m!723749))

(assert (=> b!780401 m!723723))

(declare-fun m!723751 () Bool)

(assert (=> b!780401 m!723751))

(assert (=> b!780401 m!723747))

(declare-fun m!723753 () Bool)

(assert (=> b!780401 m!723753))

(declare-fun m!723755 () Bool)

(assert (=> b!780411 m!723755))

(declare-fun m!723757 () Bool)

(assert (=> b!780418 m!723757))

(assert (=> b!780414 m!723723))

(assert (=> b!780414 m!723725))

(declare-fun m!723759 () Bool)

(assert (=> b!780412 m!723759))

(assert (=> b!780404 m!723715))

(assert (=> b!780404 m!723715))

(assert (=> b!780404 m!723727))

(push 1)

