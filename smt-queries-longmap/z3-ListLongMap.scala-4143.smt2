; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56454 () Bool)

(assert start!56454)

(declare-fun b!625874 () Bool)

(declare-fun res!403884 () Bool)

(declare-fun e!358632 () Bool)

(assert (=> b!625874 (=> (not res!403884) (not e!358632))))

(declare-datatypes ((array!37834 0))(
  ( (array!37835 (arr!18160 (Array (_ BitVec 32) (_ BitVec 64))) (size!18524 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37834)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37834 (_ BitVec 32)) Bool)

(assert (=> b!625874 (= res!403884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625875 () Bool)

(declare-fun res!403886 () Bool)

(declare-fun e!358633 () Bool)

(assert (=> b!625875 (=> (not res!403886) (not e!358633))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625875 (= res!403886 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625876 () Bool)

(declare-fun e!358635 () Bool)

(assert (=> b!625876 (= e!358632 e!358635)))

(declare-fun res!403889 () Bool)

(assert (=> b!625876 (=> (not res!403889) (not e!358635))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6600 0))(
  ( (MissingZero!6600 (index!28684 (_ BitVec 32))) (Found!6600 (index!28685 (_ BitVec 32))) (Intermediate!6600 (undefined!7412 Bool) (index!28686 (_ BitVec 32)) (x!57430 (_ BitVec 32))) (Undefined!6600) (MissingVacant!6600 (index!28687 (_ BitVec 32))) )
))
(declare-fun lt!289920 () SeekEntryResult!6600)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625876 (= res!403889 (and (= lt!289920 (Found!6600 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18160 a!2986) index!984) (select (arr!18160 a!2986) j!136)) (= index!984 j!136)))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37834 (_ BitVec 32)) SeekEntryResult!6600)

(assert (=> b!625876 (= lt!289920 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625877 () Bool)

(declare-fun res!403882 () Bool)

(assert (=> b!625877 (=> (not res!403882) (not e!358632))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625877 (= res!403882 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18160 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18160 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625878 () Bool)

(assert (=> b!625878 (= e!358635 (not (= lt!289920 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18160 a!2986) i!1108 k0!1786) j!136) (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986)) mask!3053))))))

(declare-fun b!625879 () Bool)

(declare-fun res!403883 () Bool)

(assert (=> b!625879 (=> (not res!403883) (not e!358633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625879 (= res!403883 (validKeyInArray!0 k0!1786))))

(declare-fun res!403885 () Bool)

(assert (=> start!56454 (=> (not res!403885) (not e!358633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56454 (= res!403885 (validMask!0 mask!3053))))

(assert (=> start!56454 e!358633))

(assert (=> start!56454 true))

(declare-fun array_inv!13956 (array!37834) Bool)

(assert (=> start!56454 (array_inv!13956 a!2986)))

(declare-fun b!625880 () Bool)

(assert (=> b!625880 (= e!358633 e!358632)))

(declare-fun res!403880 () Bool)

(assert (=> b!625880 (=> (not res!403880) (not e!358632))))

(declare-fun lt!289921 () SeekEntryResult!6600)

(assert (=> b!625880 (= res!403880 (or (= lt!289921 (MissingZero!6600 i!1108)) (= lt!289921 (MissingVacant!6600 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37834 (_ BitVec 32)) SeekEntryResult!6600)

(assert (=> b!625880 (= lt!289921 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625881 () Bool)

(declare-fun res!403881 () Bool)

(assert (=> b!625881 (=> (not res!403881) (not e!358633))))

(assert (=> b!625881 (= res!403881 (and (= (size!18524 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18524 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18524 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625882 () Bool)

(declare-fun res!403887 () Bool)

(assert (=> b!625882 (=> (not res!403887) (not e!358633))))

(assert (=> b!625882 (= res!403887 (validKeyInArray!0 (select (arr!18160 a!2986) j!136)))))

(declare-fun b!625883 () Bool)

(declare-fun res!403888 () Bool)

(assert (=> b!625883 (=> (not res!403888) (not e!358632))))

(declare-datatypes ((List!12201 0))(
  ( (Nil!12198) (Cons!12197 (h!13242 (_ BitVec 64)) (t!18429 List!12201)) )
))
(declare-fun arrayNoDuplicates!0 (array!37834 (_ BitVec 32) List!12201) Bool)

(assert (=> b!625883 (= res!403888 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12198))))

(assert (= (and start!56454 res!403885) b!625881))

(assert (= (and b!625881 res!403881) b!625882))

(assert (= (and b!625882 res!403887) b!625879))

(assert (= (and b!625879 res!403883) b!625875))

(assert (= (and b!625875 res!403886) b!625880))

(assert (= (and b!625880 res!403880) b!625874))

(assert (= (and b!625874 res!403884) b!625883))

(assert (= (and b!625883 res!403888) b!625877))

(assert (= (and b!625877 res!403882) b!625876))

(assert (= (and b!625876 res!403889) b!625878))

(declare-fun m!601429 () Bool)

(assert (=> b!625876 m!601429))

(declare-fun m!601431 () Bool)

(assert (=> b!625876 m!601431))

(assert (=> b!625876 m!601431))

(declare-fun m!601433 () Bool)

(assert (=> b!625876 m!601433))

(declare-fun m!601435 () Bool)

(assert (=> b!625878 m!601435))

(declare-fun m!601437 () Bool)

(assert (=> b!625878 m!601437))

(assert (=> b!625878 m!601437))

(declare-fun m!601439 () Bool)

(assert (=> b!625878 m!601439))

(assert (=> b!625882 m!601431))

(assert (=> b!625882 m!601431))

(declare-fun m!601441 () Bool)

(assert (=> b!625882 m!601441))

(declare-fun m!601443 () Bool)

(assert (=> b!625874 m!601443))

(declare-fun m!601445 () Bool)

(assert (=> b!625879 m!601445))

(declare-fun m!601447 () Bool)

(assert (=> b!625880 m!601447))

(declare-fun m!601449 () Bool)

(assert (=> b!625877 m!601449))

(assert (=> b!625877 m!601435))

(declare-fun m!601451 () Bool)

(assert (=> b!625877 m!601451))

(declare-fun m!601453 () Bool)

(assert (=> start!56454 m!601453))

(declare-fun m!601455 () Bool)

(assert (=> start!56454 m!601455))

(declare-fun m!601457 () Bool)

(assert (=> b!625883 m!601457))

(declare-fun m!601459 () Bool)

(assert (=> b!625875 m!601459))

(check-sat (not b!625878) (not b!625874) (not b!625880) (not b!625883) (not start!56454) (not b!625879) (not b!625882) (not b!625876) (not b!625875))
(check-sat)
(get-model)

(declare-fun d!88835 () Bool)

(assert (=> d!88835 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56454 d!88835))

(declare-fun d!88837 () Bool)

(assert (=> d!88837 (= (array_inv!13956 a!2986) (bvsge (size!18524 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56454 d!88837))

(declare-fun b!625926 () Bool)

(declare-fun e!358655 () SeekEntryResult!6600)

(declare-fun e!358654 () SeekEntryResult!6600)

(assert (=> b!625926 (= e!358655 e!358654)))

(declare-fun lt!289934 () (_ BitVec 64))

(declare-fun lt!289936 () SeekEntryResult!6600)

(assert (=> b!625926 (= lt!289934 (select (arr!18160 a!2986) (index!28686 lt!289936)))))

(declare-fun c!71370 () Bool)

(assert (=> b!625926 (= c!71370 (= lt!289934 k0!1786))))

(declare-fun b!625927 () Bool)

(assert (=> b!625927 (= e!358654 (Found!6600 (index!28686 lt!289936)))))

(declare-fun b!625928 () Bool)

(declare-fun e!358656 () SeekEntryResult!6600)

(assert (=> b!625928 (= e!358656 (seekKeyOrZeroReturnVacant!0 (x!57430 lt!289936) (index!28686 lt!289936) (index!28686 lt!289936) k0!1786 a!2986 mask!3053))))

(declare-fun b!625929 () Bool)

(declare-fun c!71372 () Bool)

(assert (=> b!625929 (= c!71372 (= lt!289934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!625929 (= e!358654 e!358656)))

(declare-fun b!625930 () Bool)

(assert (=> b!625930 (= e!358655 Undefined!6600)))

(declare-fun d!88839 () Bool)

(declare-fun lt!289935 () SeekEntryResult!6600)

(get-info :version)

(assert (=> d!88839 (and (or ((_ is Undefined!6600) lt!289935) (not ((_ is Found!6600) lt!289935)) (and (bvsge (index!28685 lt!289935) #b00000000000000000000000000000000) (bvslt (index!28685 lt!289935) (size!18524 a!2986)))) (or ((_ is Undefined!6600) lt!289935) ((_ is Found!6600) lt!289935) (not ((_ is MissingZero!6600) lt!289935)) (and (bvsge (index!28684 lt!289935) #b00000000000000000000000000000000) (bvslt (index!28684 lt!289935) (size!18524 a!2986)))) (or ((_ is Undefined!6600) lt!289935) ((_ is Found!6600) lt!289935) ((_ is MissingZero!6600) lt!289935) (not ((_ is MissingVacant!6600) lt!289935)) (and (bvsge (index!28687 lt!289935) #b00000000000000000000000000000000) (bvslt (index!28687 lt!289935) (size!18524 a!2986)))) (or ((_ is Undefined!6600) lt!289935) (ite ((_ is Found!6600) lt!289935) (= (select (arr!18160 a!2986) (index!28685 lt!289935)) k0!1786) (ite ((_ is MissingZero!6600) lt!289935) (= (select (arr!18160 a!2986) (index!28684 lt!289935)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6600) lt!289935) (= (select (arr!18160 a!2986) (index!28687 lt!289935)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88839 (= lt!289935 e!358655)))

(declare-fun c!71371 () Bool)

(assert (=> d!88839 (= c!71371 (and ((_ is Intermediate!6600) lt!289936) (undefined!7412 lt!289936)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37834 (_ BitVec 32)) SeekEntryResult!6600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88839 (= lt!289936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88839 (validMask!0 mask!3053)))

(assert (=> d!88839 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289935)))

(declare-fun b!625931 () Bool)

(assert (=> b!625931 (= e!358656 (MissingZero!6600 (index!28686 lt!289936)))))

(assert (= (and d!88839 c!71371) b!625930))

(assert (= (and d!88839 (not c!71371)) b!625926))

(assert (= (and b!625926 c!71370) b!625927))

(assert (= (and b!625926 (not c!71370)) b!625929))

(assert (= (and b!625929 c!71372) b!625931))

(assert (= (and b!625929 (not c!71372)) b!625928))

(declare-fun m!601493 () Bool)

(assert (=> b!625926 m!601493))

(declare-fun m!601495 () Bool)

(assert (=> b!625928 m!601495))

(declare-fun m!601497 () Bool)

(assert (=> d!88839 m!601497))

(declare-fun m!601499 () Bool)

(assert (=> d!88839 m!601499))

(declare-fun m!601501 () Bool)

(assert (=> d!88839 m!601501))

(declare-fun m!601503 () Bool)

(assert (=> d!88839 m!601503))

(declare-fun m!601505 () Bool)

(assert (=> d!88839 m!601505))

(assert (=> d!88839 m!601453))

(assert (=> d!88839 m!601499))

(assert (=> b!625880 d!88839))

(declare-fun d!88841 () Bool)

(declare-fun res!403924 () Bool)

(declare-fun e!358661 () Bool)

(assert (=> d!88841 (=> res!403924 e!358661)))

(assert (=> d!88841 (= res!403924 (= (select (arr!18160 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88841 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358661)))

(declare-fun b!625936 () Bool)

(declare-fun e!358662 () Bool)

(assert (=> b!625936 (= e!358661 e!358662)))

(declare-fun res!403925 () Bool)

(assert (=> b!625936 (=> (not res!403925) (not e!358662))))

(assert (=> b!625936 (= res!403925 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18524 a!2986)))))

(declare-fun b!625937 () Bool)

(assert (=> b!625937 (= e!358662 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88841 (not res!403924)) b!625936))

(assert (= (and b!625936 res!403925) b!625937))

(declare-fun m!601507 () Bool)

(assert (=> d!88841 m!601507))

(declare-fun m!601509 () Bool)

(assert (=> b!625937 m!601509))

(assert (=> b!625875 d!88841))

(declare-fun b!625962 () Bool)

(declare-fun e!358675 () SeekEntryResult!6600)

(assert (=> b!625962 (= e!358675 Undefined!6600)))

(declare-fun b!625963 () Bool)

(declare-fun e!358676 () SeekEntryResult!6600)

(assert (=> b!625963 (= e!358675 e!358676)))

(declare-fun lt!289946 () (_ BitVec 64))

(declare-fun c!71387 () Bool)

(assert (=> b!625963 (= c!71387 (= lt!289946 (select (arr!18160 a!2986) j!136)))))

(declare-fun d!88843 () Bool)

(declare-fun lt!289945 () SeekEntryResult!6600)

(assert (=> d!88843 (and (or ((_ is Undefined!6600) lt!289945) (not ((_ is Found!6600) lt!289945)) (and (bvsge (index!28685 lt!289945) #b00000000000000000000000000000000) (bvslt (index!28685 lt!289945) (size!18524 a!2986)))) (or ((_ is Undefined!6600) lt!289945) ((_ is Found!6600) lt!289945) (not ((_ is MissingVacant!6600) lt!289945)) (not (= (index!28687 lt!289945) vacantSpotIndex!68)) (and (bvsge (index!28687 lt!289945) #b00000000000000000000000000000000) (bvslt (index!28687 lt!289945) (size!18524 a!2986)))) (or ((_ is Undefined!6600) lt!289945) (ite ((_ is Found!6600) lt!289945) (= (select (arr!18160 a!2986) (index!28685 lt!289945)) (select (arr!18160 a!2986) j!136)) (and ((_ is MissingVacant!6600) lt!289945) (= (index!28687 lt!289945) vacantSpotIndex!68) (= (select (arr!18160 a!2986) (index!28687 lt!289945)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88843 (= lt!289945 e!358675)))

(declare-fun c!71386 () Bool)

(assert (=> d!88843 (= c!71386 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88843 (= lt!289946 (select (arr!18160 a!2986) index!984))))

(assert (=> d!88843 (validMask!0 mask!3053)))

(assert (=> d!88843 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053) lt!289945)))

(declare-fun b!625964 () Bool)

(declare-fun c!71385 () Bool)

(assert (=> b!625964 (= c!71385 (= lt!289946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358677 () SeekEntryResult!6600)

(assert (=> b!625964 (= e!358676 e!358677)))

(declare-fun b!625965 () Bool)

(assert (=> b!625965 (= e!358676 (Found!6600 index!984))))

(declare-fun b!625966 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!625966 (= e!358677 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625967 () Bool)

(assert (=> b!625967 (= e!358677 (MissingVacant!6600 vacantSpotIndex!68))))

(assert (= (and d!88843 c!71386) b!625962))

(assert (= (and d!88843 (not c!71386)) b!625963))

(assert (= (and b!625963 c!71387) b!625965))

(assert (= (and b!625963 (not c!71387)) b!625964))

(assert (= (and b!625964 c!71385) b!625967))

(assert (= (and b!625964 (not c!71385)) b!625966))

(declare-fun m!601511 () Bool)

(assert (=> d!88843 m!601511))

(declare-fun m!601513 () Bool)

(assert (=> d!88843 m!601513))

(assert (=> d!88843 m!601429))

(assert (=> d!88843 m!601453))

(declare-fun m!601515 () Bool)

(assert (=> b!625966 m!601515))

(assert (=> b!625966 m!601515))

(assert (=> b!625966 m!601431))

(declare-fun m!601517 () Bool)

(assert (=> b!625966 m!601517))

(assert (=> b!625876 d!88843))

(declare-fun d!88851 () Bool)

(assert (=> d!88851 (= (validKeyInArray!0 (select (arr!18160 a!2986) j!136)) (and (not (= (select (arr!18160 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18160 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625882 d!88851))

(declare-fun d!88853 () Bool)

(declare-fun res!403934 () Bool)

(declare-fun e!358704 () Bool)

(assert (=> d!88853 (=> res!403934 e!358704)))

(assert (=> d!88853 (= res!403934 (bvsge #b00000000000000000000000000000000 (size!18524 a!2986)))))

(assert (=> d!88853 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12198) e!358704)))

(declare-fun b!626008 () Bool)

(declare-fun e!358702 () Bool)

(declare-fun call!33221 () Bool)

(assert (=> b!626008 (= e!358702 call!33221)))

(declare-fun b!626009 () Bool)

(assert (=> b!626009 (= e!358702 call!33221)))

(declare-fun bm!33218 () Bool)

(declare-fun c!71405 () Bool)

(assert (=> bm!33218 (= call!33221 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71405 (Cons!12197 (select (arr!18160 a!2986) #b00000000000000000000000000000000) Nil!12198) Nil!12198)))))

(declare-fun b!626010 () Bool)

(declare-fun e!358703 () Bool)

(assert (=> b!626010 (= e!358703 e!358702)))

(assert (=> b!626010 (= c!71405 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626011 () Bool)

(assert (=> b!626011 (= e!358704 e!358703)))

(declare-fun res!403932 () Bool)

(assert (=> b!626011 (=> (not res!403932) (not e!358703))))

(declare-fun e!358701 () Bool)

(assert (=> b!626011 (= res!403932 (not e!358701))))

(declare-fun res!403933 () Bool)

(assert (=> b!626011 (=> (not res!403933) (not e!358701))))

(assert (=> b!626011 (= res!403933 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626012 () Bool)

(declare-fun contains!3077 (List!12201 (_ BitVec 64)) Bool)

(assert (=> b!626012 (= e!358701 (contains!3077 Nil!12198 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88853 (not res!403934)) b!626011))

(assert (= (and b!626011 res!403933) b!626012))

(assert (= (and b!626011 res!403932) b!626010))

(assert (= (and b!626010 c!71405) b!626009))

(assert (= (and b!626010 (not c!71405)) b!626008))

(assert (= (or b!626009 b!626008) bm!33218))

(assert (=> bm!33218 m!601507))

(declare-fun m!601549 () Bool)

(assert (=> bm!33218 m!601549))

(assert (=> b!626010 m!601507))

(assert (=> b!626010 m!601507))

(declare-fun m!601551 () Bool)

(assert (=> b!626010 m!601551))

(assert (=> b!626011 m!601507))

(assert (=> b!626011 m!601507))

(assert (=> b!626011 m!601551))

(assert (=> b!626012 m!601507))

(assert (=> b!626012 m!601507))

(declare-fun m!601553 () Bool)

(assert (=> b!626012 m!601553))

(assert (=> b!625883 d!88853))

(declare-fun b!626015 () Bool)

(declare-fun e!358709 () SeekEntryResult!6600)

(assert (=> b!626015 (= e!358709 Undefined!6600)))

(declare-fun b!626016 () Bool)

(declare-fun e!358710 () SeekEntryResult!6600)

(assert (=> b!626016 (= e!358709 e!358710)))

(declare-fun c!71408 () Bool)

(declare-fun lt!289961 () (_ BitVec 64))

(assert (=> b!626016 (= c!71408 (= lt!289961 (select (store (arr!18160 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun d!88861 () Bool)

(declare-fun lt!289960 () SeekEntryResult!6600)

(assert (=> d!88861 (and (or ((_ is Undefined!6600) lt!289960) (not ((_ is Found!6600) lt!289960)) (and (bvsge (index!28685 lt!289960) #b00000000000000000000000000000000) (bvslt (index!28685 lt!289960) (size!18524 (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986)))))) (or ((_ is Undefined!6600) lt!289960) ((_ is Found!6600) lt!289960) (not ((_ is MissingVacant!6600) lt!289960)) (not (= (index!28687 lt!289960) vacantSpotIndex!68)) (and (bvsge (index!28687 lt!289960) #b00000000000000000000000000000000) (bvslt (index!28687 lt!289960) (size!18524 (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986)))))) (or ((_ is Undefined!6600) lt!289960) (ite ((_ is Found!6600) lt!289960) (= (select (arr!18160 (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986))) (index!28685 lt!289960)) (select (store (arr!18160 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6600) lt!289960) (= (index!28687 lt!289960) vacantSpotIndex!68) (= (select (arr!18160 (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986))) (index!28687 lt!289960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88861 (= lt!289960 e!358709)))

(declare-fun c!71407 () Bool)

(assert (=> d!88861 (= c!71407 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88861 (= lt!289961 (select (arr!18160 (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986))) index!984))))

(assert (=> d!88861 (validMask!0 mask!3053)))

(assert (=> d!88861 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (store (arr!18160 a!2986) i!1108 k0!1786) j!136) (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986)) mask!3053) lt!289960)))

(declare-fun b!626017 () Bool)

(declare-fun c!71406 () Bool)

(assert (=> b!626017 (= c!71406 (= lt!289961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358711 () SeekEntryResult!6600)

(assert (=> b!626017 (= e!358710 e!358711)))

(declare-fun b!626018 () Bool)

(assert (=> b!626018 (= e!358710 (Found!6600 index!984))))

(declare-fun b!626019 () Bool)

(assert (=> b!626019 (= e!358711 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (store (arr!18160 a!2986) i!1108 k0!1786) j!136) (array!37835 (store (arr!18160 a!2986) i!1108 k0!1786) (size!18524 a!2986)) mask!3053))))

(declare-fun b!626020 () Bool)

(assert (=> b!626020 (= e!358711 (MissingVacant!6600 vacantSpotIndex!68))))

(assert (= (and d!88861 c!71407) b!626015))

(assert (= (and d!88861 (not c!71407)) b!626016))

(assert (= (and b!626016 c!71408) b!626018))

(assert (= (and b!626016 (not c!71408)) b!626017))

(assert (= (and b!626017 c!71406) b!626020))

(assert (= (and b!626017 (not c!71406)) b!626019))

(declare-fun m!601555 () Bool)

(assert (=> d!88861 m!601555))

(declare-fun m!601557 () Bool)

(assert (=> d!88861 m!601557))

(declare-fun m!601559 () Bool)

(assert (=> d!88861 m!601559))

(assert (=> d!88861 m!601453))

(assert (=> b!626019 m!601515))

(assert (=> b!626019 m!601515))

(assert (=> b!626019 m!601437))

(declare-fun m!601561 () Bool)

(assert (=> b!626019 m!601561))

(assert (=> b!625878 d!88861))

(declare-fun d!88863 () Bool)

(assert (=> d!88863 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625879 d!88863))

(declare-fun bm!33221 () Bool)

(declare-fun call!33224 () Bool)

(assert (=> bm!33221 (= call!33224 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!626041 () Bool)

(declare-fun e!358727 () Bool)

(assert (=> b!626041 (= e!358727 call!33224)))

(declare-fun b!626042 () Bool)

(declare-fun e!358728 () Bool)

(declare-fun e!358726 () Bool)

(assert (=> b!626042 (= e!358728 e!358726)))

(declare-fun c!71411 () Bool)

(assert (=> b!626042 (= c!71411 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626043 () Bool)

(assert (=> b!626043 (= e!358726 e!358727)))

(declare-fun lt!289970 () (_ BitVec 64))

(assert (=> b!626043 (= lt!289970 (select (arr!18160 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21092 0))(
  ( (Unit!21093) )
))
(declare-fun lt!289969 () Unit!21092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37834 (_ BitVec 64) (_ BitVec 32)) Unit!21092)

(assert (=> b!626043 (= lt!289969 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289970 #b00000000000000000000000000000000))))

(assert (=> b!626043 (arrayContainsKey!0 a!2986 lt!289970 #b00000000000000000000000000000000)))

(declare-fun lt!289968 () Unit!21092)

(assert (=> b!626043 (= lt!289968 lt!289969)))

(declare-fun res!403951 () Bool)

(assert (=> b!626043 (= res!403951 (= (seekEntryOrOpen!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6600 #b00000000000000000000000000000000)))))

(assert (=> b!626043 (=> (not res!403951) (not e!358727))))

(declare-fun d!88865 () Bool)

(declare-fun res!403952 () Bool)

(assert (=> d!88865 (=> res!403952 e!358728)))

(assert (=> d!88865 (= res!403952 (bvsge #b00000000000000000000000000000000 (size!18524 a!2986)))))

(assert (=> d!88865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358728)))

(declare-fun b!626044 () Bool)

(assert (=> b!626044 (= e!358726 call!33224)))

(assert (= (and d!88865 (not res!403952)) b!626042))

(assert (= (and b!626042 c!71411) b!626043))

(assert (= (and b!626042 (not c!71411)) b!626044))

(assert (= (and b!626043 res!403951) b!626041))

(assert (= (or b!626041 b!626044) bm!33221))

(declare-fun m!601567 () Bool)

(assert (=> bm!33221 m!601567))

(assert (=> b!626042 m!601507))

(assert (=> b!626042 m!601507))

(assert (=> b!626042 m!601551))

(assert (=> b!626043 m!601507))

(declare-fun m!601569 () Bool)

(assert (=> b!626043 m!601569))

(declare-fun m!601571 () Bool)

(assert (=> b!626043 m!601571))

(assert (=> b!626043 m!601507))

(declare-fun m!601573 () Bool)

(assert (=> b!626043 m!601573))

(assert (=> b!625874 d!88865))

(check-sat (not b!626011) (not b!626042) (not bm!33218) (not d!88839) (not d!88861) (not b!626043) (not d!88843) (not bm!33221) (not b!625937) (not b!626019) (not b!625966) (not b!626010) (not b!625928) (not b!626012))
(check-sat)
