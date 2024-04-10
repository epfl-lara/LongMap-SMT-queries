; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46130 () Bool)

(assert start!46130)

(declare-fun b!511053 () Bool)

(declare-fun res!311904 () Bool)

(declare-fun e!298640 () Bool)

(assert (=> b!511053 (=> (not res!311904) (not e!298640))))

(declare-datatypes ((array!32841 0))(
  ( (array!32842 (arr!15799 (Array (_ BitVec 32) (_ BitVec 64))) (size!16163 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32841)

(declare-datatypes ((List!9957 0))(
  ( (Nil!9954) (Cons!9953 (h!10830 (_ BitVec 64)) (t!16185 List!9957)) )
))
(declare-fun arrayNoDuplicates!0 (array!32841 (_ BitVec 32) List!9957) Bool)

(assert (=> b!511053 (= res!311904 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9954))))

(declare-fun b!511054 () Bool)

(declare-fun res!311905 () Bool)

(declare-fun e!298638 () Bool)

(assert (=> b!511054 (=> (not res!311905) (not e!298638))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511054 (= res!311905 (validKeyInArray!0 k0!2280))))

(declare-fun b!511055 () Bool)

(declare-fun e!298639 () Bool)

(assert (=> b!511055 (= e!298640 (not e!298639))))

(declare-fun res!311901 () Bool)

(assert (=> b!511055 (=> res!311901 e!298639)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4266 0))(
  ( (MissingZero!4266 (index!19252 (_ BitVec 32))) (Found!4266 (index!19253 (_ BitVec 32))) (Intermediate!4266 (undefined!5078 Bool) (index!19254 (_ BitVec 32)) (x!48203 (_ BitVec 32))) (Undefined!4266) (MissingVacant!4266 (index!19255 (_ BitVec 32))) )
))
(declare-fun lt!233792 () SeekEntryResult!4266)

(declare-fun lt!233794 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32841 (_ BitVec 32)) SeekEntryResult!4266)

(assert (=> b!511055 (= res!311901 (= lt!233792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233794 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)) mask!3524)))))

(declare-fun lt!233795 () (_ BitVec 32))

(assert (=> b!511055 (= lt!233792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233795 (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511055 (= lt!233794 (toIndex!0 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511055 (= lt!233795 (toIndex!0 (select (arr!15799 a!3235) j!176) mask!3524))))

(declare-fun lt!233793 () SeekEntryResult!4266)

(assert (=> b!511055 (= lt!233793 (Found!4266 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32841 (_ BitVec 32)) SeekEntryResult!4266)

(assert (=> b!511055 (= lt!233793 (seekEntryOrOpen!0 (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32841 (_ BitVec 32)) Bool)

(assert (=> b!511055 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15790 0))(
  ( (Unit!15791) )
))
(declare-fun lt!233796 () Unit!15790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15790)

(assert (=> b!511055 (= lt!233796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511056 () Bool)

(declare-fun res!311900 () Bool)

(assert (=> b!511056 (=> (not res!311900) (not e!298640))))

(assert (=> b!511056 (= res!311900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511057 () Bool)

(declare-fun res!311902 () Bool)

(assert (=> b!511057 (=> (not res!311902) (not e!298638))))

(declare-fun arrayContainsKey!0 (array!32841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511057 (= res!311902 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511058 () Bool)

(declare-fun res!311898 () Bool)

(assert (=> b!511058 (=> (not res!311898) (not e!298638))))

(assert (=> b!511058 (= res!311898 (and (= (size!16163 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16163 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16163 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311899 () Bool)

(assert (=> start!46130 (=> (not res!311899) (not e!298638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46130 (= res!311899 (validMask!0 mask!3524))))

(assert (=> start!46130 e!298638))

(assert (=> start!46130 true))

(declare-fun array_inv!11595 (array!32841) Bool)

(assert (=> start!46130 (array_inv!11595 a!3235)))

(declare-fun b!511059 () Bool)

(declare-fun res!311903 () Bool)

(assert (=> b!511059 (=> (not res!311903) (not e!298638))))

(assert (=> b!511059 (= res!311903 (validKeyInArray!0 (select (arr!15799 a!3235) j!176)))))

(declare-fun b!511060 () Bool)

(assert (=> b!511060 (= e!298638 e!298640)))

(declare-fun res!311906 () Bool)

(assert (=> b!511060 (=> (not res!311906) (not e!298640))))

(declare-fun lt!233797 () SeekEntryResult!4266)

(assert (=> b!511060 (= res!311906 (or (= lt!233797 (MissingZero!4266 i!1204)) (= lt!233797 (MissingVacant!4266 i!1204))))))

(assert (=> b!511060 (= lt!233797 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511061 () Bool)

(get-info :version)

(assert (=> b!511061 (= e!298639 (or (not ((_ is Intermediate!4266) lt!233792)) (not (undefined!5078 lt!233792)) (= lt!233793 Undefined!4266)))))

(assert (= (and start!46130 res!311899) b!511058))

(assert (= (and b!511058 res!311898) b!511059))

(assert (= (and b!511059 res!311903) b!511054))

(assert (= (and b!511054 res!311905) b!511057))

(assert (= (and b!511057 res!311902) b!511060))

(assert (= (and b!511060 res!311906) b!511056))

(assert (= (and b!511056 res!311900) b!511053))

(assert (= (and b!511053 res!311904) b!511055))

(assert (= (and b!511055 (not res!311901)) b!511061))

(declare-fun m!492573 () Bool)

(assert (=> start!46130 m!492573))

(declare-fun m!492575 () Bool)

(assert (=> start!46130 m!492575))

(declare-fun m!492577 () Bool)

(assert (=> b!511060 m!492577))

(declare-fun m!492579 () Bool)

(assert (=> b!511053 m!492579))

(declare-fun m!492581 () Bool)

(assert (=> b!511056 m!492581))

(declare-fun m!492583 () Bool)

(assert (=> b!511057 m!492583))

(declare-fun m!492585 () Bool)

(assert (=> b!511055 m!492585))

(declare-fun m!492587 () Bool)

(assert (=> b!511055 m!492587))

(declare-fun m!492589 () Bool)

(assert (=> b!511055 m!492589))

(assert (=> b!511055 m!492589))

(declare-fun m!492591 () Bool)

(assert (=> b!511055 m!492591))

(declare-fun m!492593 () Bool)

(assert (=> b!511055 m!492593))

(declare-fun m!492595 () Bool)

(assert (=> b!511055 m!492595))

(assert (=> b!511055 m!492593))

(declare-fun m!492597 () Bool)

(assert (=> b!511055 m!492597))

(assert (=> b!511055 m!492593))

(declare-fun m!492599 () Bool)

(assert (=> b!511055 m!492599))

(assert (=> b!511055 m!492589))

(declare-fun m!492601 () Bool)

(assert (=> b!511055 m!492601))

(assert (=> b!511055 m!492593))

(declare-fun m!492603 () Bool)

(assert (=> b!511055 m!492603))

(assert (=> b!511059 m!492593))

(assert (=> b!511059 m!492593))

(declare-fun m!492605 () Bool)

(assert (=> b!511059 m!492605))

(declare-fun m!492607 () Bool)

(assert (=> b!511054 m!492607))

(check-sat (not start!46130) (not b!511060) (not b!511059) (not b!511055) (not b!511056) (not b!511054) (not b!511057) (not b!511053))
(check-sat)
(get-model)

(declare-fun b!511099 () Bool)

(declare-fun e!298663 () Bool)

(declare-fun contains!2722 (List!9957 (_ BitVec 64)) Bool)

(assert (=> b!511099 (= e!298663 (contains!2722 Nil!9954 (select (arr!15799 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511100 () Bool)

(declare-fun e!298664 () Bool)

(declare-fun e!298665 () Bool)

(assert (=> b!511100 (= e!298664 e!298665)))

(declare-fun c!59858 () Bool)

(assert (=> b!511100 (= c!59858 (validKeyInArray!0 (select (arr!15799 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511101 () Bool)

(declare-fun call!31496 () Bool)

(assert (=> b!511101 (= e!298665 call!31496)))

(declare-fun b!511102 () Bool)

(declare-fun e!298662 () Bool)

(assert (=> b!511102 (= e!298662 e!298664)))

(declare-fun res!311941 () Bool)

(assert (=> b!511102 (=> (not res!311941) (not e!298664))))

(assert (=> b!511102 (= res!311941 (not e!298663))))

(declare-fun res!311940 () Bool)

(assert (=> b!511102 (=> (not res!311940) (not e!298663))))

(assert (=> b!511102 (= res!311940 (validKeyInArray!0 (select (arr!15799 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511103 () Bool)

(assert (=> b!511103 (= e!298665 call!31496)))

(declare-fun d!78869 () Bool)

(declare-fun res!311942 () Bool)

(assert (=> d!78869 (=> res!311942 e!298662)))

(assert (=> d!78869 (= res!311942 (bvsge #b00000000000000000000000000000000 (size!16163 a!3235)))))

(assert (=> d!78869 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9954) e!298662)))

(declare-fun bm!31493 () Bool)

(assert (=> bm!31493 (= call!31496 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59858 (Cons!9953 (select (arr!15799 a!3235) #b00000000000000000000000000000000) Nil!9954) Nil!9954)))))

(assert (= (and d!78869 (not res!311942)) b!511102))

(assert (= (and b!511102 res!311940) b!511099))

(assert (= (and b!511102 res!311941) b!511100))

(assert (= (and b!511100 c!59858) b!511103))

(assert (= (and b!511100 (not c!59858)) b!511101))

(assert (= (or b!511103 b!511101) bm!31493))

(declare-fun m!492645 () Bool)

(assert (=> b!511099 m!492645))

(assert (=> b!511099 m!492645))

(declare-fun m!492647 () Bool)

(assert (=> b!511099 m!492647))

(assert (=> b!511100 m!492645))

(assert (=> b!511100 m!492645))

(declare-fun m!492649 () Bool)

(assert (=> b!511100 m!492649))

(assert (=> b!511102 m!492645))

(assert (=> b!511102 m!492645))

(assert (=> b!511102 m!492649))

(assert (=> bm!31493 m!492645))

(declare-fun m!492651 () Bool)

(assert (=> bm!31493 m!492651))

(assert (=> b!511053 d!78869))

(declare-fun b!511124 () Bool)

(declare-fun e!298679 () SeekEntryResult!4266)

(declare-fun e!298678 () SeekEntryResult!4266)

(assert (=> b!511124 (= e!298679 e!298678)))

(declare-fun lt!233829 () (_ BitVec 64))

(declare-fun lt!233828 () SeekEntryResult!4266)

(assert (=> b!511124 (= lt!233829 (select (arr!15799 a!3235) (index!19254 lt!233828)))))

(declare-fun c!59869 () Bool)

(assert (=> b!511124 (= c!59869 (= lt!233829 k0!2280))))

(declare-fun b!511125 () Bool)

(assert (=> b!511125 (= e!298678 (Found!4266 (index!19254 lt!233828)))))

(declare-fun b!511126 () Bool)

(declare-fun c!59867 () Bool)

(assert (=> b!511126 (= c!59867 (= lt!233829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298680 () SeekEntryResult!4266)

(assert (=> b!511126 (= e!298678 e!298680)))

(declare-fun b!511127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32841 (_ BitVec 32)) SeekEntryResult!4266)

(assert (=> b!511127 (= e!298680 (seekKeyOrZeroReturnVacant!0 (x!48203 lt!233828) (index!19254 lt!233828) (index!19254 lt!233828) k0!2280 a!3235 mask!3524))))

(declare-fun d!78871 () Bool)

(declare-fun lt!233830 () SeekEntryResult!4266)

(assert (=> d!78871 (and (or ((_ is Undefined!4266) lt!233830) (not ((_ is Found!4266) lt!233830)) (and (bvsge (index!19253 lt!233830) #b00000000000000000000000000000000) (bvslt (index!19253 lt!233830) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233830) ((_ is Found!4266) lt!233830) (not ((_ is MissingZero!4266) lt!233830)) (and (bvsge (index!19252 lt!233830) #b00000000000000000000000000000000) (bvslt (index!19252 lt!233830) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233830) ((_ is Found!4266) lt!233830) ((_ is MissingZero!4266) lt!233830) (not ((_ is MissingVacant!4266) lt!233830)) (and (bvsge (index!19255 lt!233830) #b00000000000000000000000000000000) (bvslt (index!19255 lt!233830) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233830) (ite ((_ is Found!4266) lt!233830) (= (select (arr!15799 a!3235) (index!19253 lt!233830)) k0!2280) (ite ((_ is MissingZero!4266) lt!233830) (= (select (arr!15799 a!3235) (index!19252 lt!233830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4266) lt!233830) (= (select (arr!15799 a!3235) (index!19255 lt!233830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78871 (= lt!233830 e!298679)))

(declare-fun c!59868 () Bool)

(assert (=> d!78871 (= c!59868 (and ((_ is Intermediate!4266) lt!233828) (undefined!5078 lt!233828)))))

(assert (=> d!78871 (= lt!233828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78871 (validMask!0 mask!3524)))

(assert (=> d!78871 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!233830)))

(declare-fun b!511128 () Bool)

(assert (=> b!511128 (= e!298679 Undefined!4266)))

(declare-fun b!511129 () Bool)

(assert (=> b!511129 (= e!298680 (MissingZero!4266 (index!19254 lt!233828)))))

(assert (= (and d!78871 c!59868) b!511128))

(assert (= (and d!78871 (not c!59868)) b!511124))

(assert (= (and b!511124 c!59869) b!511125))

(assert (= (and b!511124 (not c!59869)) b!511126))

(assert (= (and b!511126 c!59867) b!511129))

(assert (= (and b!511126 (not c!59867)) b!511127))

(declare-fun m!492653 () Bool)

(assert (=> b!511124 m!492653))

(declare-fun m!492655 () Bool)

(assert (=> b!511127 m!492655))

(declare-fun m!492657 () Bool)

(assert (=> d!78871 m!492657))

(declare-fun m!492659 () Bool)

(assert (=> d!78871 m!492659))

(declare-fun m!492661 () Bool)

(assert (=> d!78871 m!492661))

(declare-fun m!492663 () Bool)

(assert (=> d!78871 m!492663))

(declare-fun m!492665 () Bool)

(assert (=> d!78871 m!492665))

(assert (=> d!78871 m!492573))

(assert (=> d!78871 m!492661))

(assert (=> b!511060 d!78871))

(declare-fun d!78879 () Bool)

(assert (=> d!78879 (= (validKeyInArray!0 (select (arr!15799 a!3235) j!176)) (and (not (= (select (arr!15799 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15799 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511059 d!78879))

(declare-fun d!78881 () Bool)

(assert (=> d!78881 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511054 d!78881))

(declare-fun bm!31499 () Bool)

(declare-fun call!31502 () Bool)

(assert (=> bm!31499 (= call!31502 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511143 () Bool)

(declare-fun e!298690 () Bool)

(declare-fun e!298691 () Bool)

(assert (=> b!511143 (= e!298690 e!298691)))

(declare-fun lt!233847 () (_ BitVec 64))

(assert (=> b!511143 (= lt!233847 (select (arr!15799 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!233848 () Unit!15790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32841 (_ BitVec 64) (_ BitVec 32)) Unit!15790)

(assert (=> b!511143 (= lt!233848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233847 #b00000000000000000000000000000000))))

(assert (=> b!511143 (arrayContainsKey!0 a!3235 lt!233847 #b00000000000000000000000000000000)))

(declare-fun lt!233846 () Unit!15790)

(assert (=> b!511143 (= lt!233846 lt!233848)))

(declare-fun res!311954 () Bool)

(assert (=> b!511143 (= res!311954 (= (seekEntryOrOpen!0 (select (arr!15799 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4266 #b00000000000000000000000000000000)))))

(assert (=> b!511143 (=> (not res!311954) (not e!298691))))

(declare-fun b!511144 () Bool)

(assert (=> b!511144 (= e!298690 call!31502)))

(declare-fun b!511145 () Bool)

(assert (=> b!511145 (= e!298691 call!31502)))

(declare-fun d!78883 () Bool)

(declare-fun res!311955 () Bool)

(declare-fun e!298692 () Bool)

(assert (=> d!78883 (=> res!311955 e!298692)))

(assert (=> d!78883 (= res!311955 (bvsge #b00000000000000000000000000000000 (size!16163 a!3235)))))

(assert (=> d!78883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!298692)))

(declare-fun b!511142 () Bool)

(assert (=> b!511142 (= e!298692 e!298690)))

(declare-fun c!59873 () Bool)

(assert (=> b!511142 (= c!59873 (validKeyInArray!0 (select (arr!15799 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78883 (not res!311955)) b!511142))

(assert (= (and b!511142 c!59873) b!511143))

(assert (= (and b!511142 (not c!59873)) b!511144))

(assert (= (and b!511143 res!311954) b!511145))

(assert (= (or b!511145 b!511144) bm!31499))

(declare-fun m!492679 () Bool)

(assert (=> bm!31499 m!492679))

(assert (=> b!511143 m!492645))

(declare-fun m!492681 () Bool)

(assert (=> b!511143 m!492681))

(declare-fun m!492683 () Bool)

(assert (=> b!511143 m!492683))

(assert (=> b!511143 m!492645))

(declare-fun m!492685 () Bool)

(assert (=> b!511143 m!492685))

(assert (=> b!511142 m!492645))

(assert (=> b!511142 m!492645))

(assert (=> b!511142 m!492649))

(assert (=> b!511056 d!78883))

(declare-fun d!78891 () Bool)

(declare-fun lt!233854 () (_ BitVec 32))

(declare-fun lt!233853 () (_ BitVec 32))

(assert (=> d!78891 (= lt!233854 (bvmul (bvxor lt!233853 (bvlshr lt!233853 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78891 (= lt!233853 ((_ extract 31 0) (bvand (bvxor (select (arr!15799 a!3235) j!176) (bvlshr (select (arr!15799 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78891 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311956 (let ((h!10833 ((_ extract 31 0) (bvand (bvxor (select (arr!15799 a!3235) j!176) (bvlshr (select (arr!15799 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48206 (bvmul (bvxor h!10833 (bvlshr h!10833 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48206 (bvlshr x!48206 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311956 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311956 #b00000000000000000000000000000000))))))

(assert (=> d!78891 (= (toIndex!0 (select (arr!15799 a!3235) j!176) mask!3524) (bvand (bvxor lt!233854 (bvlshr lt!233854 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511055 d!78891))

(declare-fun b!511146 () Bool)

(declare-fun e!298694 () SeekEntryResult!4266)

(declare-fun e!298693 () SeekEntryResult!4266)

(assert (=> b!511146 (= e!298694 e!298693)))

(declare-fun lt!233856 () (_ BitVec 64))

(declare-fun lt!233855 () SeekEntryResult!4266)

(assert (=> b!511146 (= lt!233856 (select (arr!15799 a!3235) (index!19254 lt!233855)))))

(declare-fun c!59876 () Bool)

(assert (=> b!511146 (= c!59876 (= lt!233856 (select (arr!15799 a!3235) j!176)))))

(declare-fun b!511147 () Bool)

(assert (=> b!511147 (= e!298693 (Found!4266 (index!19254 lt!233855)))))

(declare-fun b!511148 () Bool)

(declare-fun c!59874 () Bool)

(assert (=> b!511148 (= c!59874 (= lt!233856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298695 () SeekEntryResult!4266)

(assert (=> b!511148 (= e!298693 e!298695)))

(declare-fun b!511149 () Bool)

(assert (=> b!511149 (= e!298695 (seekKeyOrZeroReturnVacant!0 (x!48203 lt!233855) (index!19254 lt!233855) (index!19254 lt!233855) (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78893 () Bool)

(declare-fun lt!233857 () SeekEntryResult!4266)

(assert (=> d!78893 (and (or ((_ is Undefined!4266) lt!233857) (not ((_ is Found!4266) lt!233857)) (and (bvsge (index!19253 lt!233857) #b00000000000000000000000000000000) (bvslt (index!19253 lt!233857) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233857) ((_ is Found!4266) lt!233857) (not ((_ is MissingZero!4266) lt!233857)) (and (bvsge (index!19252 lt!233857) #b00000000000000000000000000000000) (bvslt (index!19252 lt!233857) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233857) ((_ is Found!4266) lt!233857) ((_ is MissingZero!4266) lt!233857) (not ((_ is MissingVacant!4266) lt!233857)) (and (bvsge (index!19255 lt!233857) #b00000000000000000000000000000000) (bvslt (index!19255 lt!233857) (size!16163 a!3235)))) (or ((_ is Undefined!4266) lt!233857) (ite ((_ is Found!4266) lt!233857) (= (select (arr!15799 a!3235) (index!19253 lt!233857)) (select (arr!15799 a!3235) j!176)) (ite ((_ is MissingZero!4266) lt!233857) (= (select (arr!15799 a!3235) (index!19252 lt!233857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4266) lt!233857) (= (select (arr!15799 a!3235) (index!19255 lt!233857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78893 (= lt!233857 e!298694)))

(declare-fun c!59875 () Bool)

(assert (=> d!78893 (= c!59875 (and ((_ is Intermediate!4266) lt!233855) (undefined!5078 lt!233855)))))

(assert (=> d!78893 (= lt!233855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15799 a!3235) j!176) mask!3524) (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78893 (validMask!0 mask!3524)))

(assert (=> d!78893 (= (seekEntryOrOpen!0 (select (arr!15799 a!3235) j!176) a!3235 mask!3524) lt!233857)))

(declare-fun b!511150 () Bool)

(assert (=> b!511150 (= e!298694 Undefined!4266)))

(declare-fun b!511151 () Bool)

(assert (=> b!511151 (= e!298695 (MissingZero!4266 (index!19254 lt!233855)))))

(assert (= (and d!78893 c!59875) b!511150))

(assert (= (and d!78893 (not c!59875)) b!511146))

(assert (= (and b!511146 c!59876) b!511147))

(assert (= (and b!511146 (not c!59876)) b!511148))

(assert (= (and b!511148 c!59874) b!511151))

(assert (= (and b!511148 (not c!59874)) b!511149))

(declare-fun m!492687 () Bool)

(assert (=> b!511146 m!492687))

(assert (=> b!511149 m!492593))

(declare-fun m!492689 () Bool)

(assert (=> b!511149 m!492689))

(declare-fun m!492691 () Bool)

(assert (=> d!78893 m!492691))

(declare-fun m!492693 () Bool)

(assert (=> d!78893 m!492693))

(assert (=> d!78893 m!492595))

(assert (=> d!78893 m!492593))

(declare-fun m!492695 () Bool)

(assert (=> d!78893 m!492695))

(declare-fun m!492697 () Bool)

(assert (=> d!78893 m!492697))

(assert (=> d!78893 m!492573))

(assert (=> d!78893 m!492593))

(assert (=> d!78893 m!492595))

(assert (=> b!511055 d!78893))

(declare-fun call!31503 () Bool)

(declare-fun bm!31500 () Bool)

(assert (=> bm!31500 (= call!31503 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511153 () Bool)

(declare-fun e!298696 () Bool)

(declare-fun e!298697 () Bool)

(assert (=> b!511153 (= e!298696 e!298697)))

(declare-fun lt!233859 () (_ BitVec 64))

(assert (=> b!511153 (= lt!233859 (select (arr!15799 a!3235) j!176))))

(declare-fun lt!233860 () Unit!15790)

(assert (=> b!511153 (= lt!233860 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233859 j!176))))

(assert (=> b!511153 (arrayContainsKey!0 a!3235 lt!233859 #b00000000000000000000000000000000)))

(declare-fun lt!233858 () Unit!15790)

(assert (=> b!511153 (= lt!233858 lt!233860)))

(declare-fun res!311957 () Bool)

(assert (=> b!511153 (= res!311957 (= (seekEntryOrOpen!0 (select (arr!15799 a!3235) j!176) a!3235 mask!3524) (Found!4266 j!176)))))

(assert (=> b!511153 (=> (not res!311957) (not e!298697))))

(declare-fun b!511154 () Bool)

(assert (=> b!511154 (= e!298696 call!31503)))

(declare-fun b!511155 () Bool)

(assert (=> b!511155 (= e!298697 call!31503)))

(declare-fun d!78895 () Bool)

(declare-fun res!311958 () Bool)

(declare-fun e!298698 () Bool)

(assert (=> d!78895 (=> res!311958 e!298698)))

(assert (=> d!78895 (= res!311958 (bvsge j!176 (size!16163 a!3235)))))

(assert (=> d!78895 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!298698)))

(declare-fun b!511152 () Bool)

(assert (=> b!511152 (= e!298698 e!298696)))

(declare-fun c!59877 () Bool)

(assert (=> b!511152 (= c!59877 (validKeyInArray!0 (select (arr!15799 a!3235) j!176)))))

(assert (= (and d!78895 (not res!311958)) b!511152))

(assert (= (and b!511152 c!59877) b!511153))

(assert (= (and b!511152 (not c!59877)) b!511154))

(assert (= (and b!511153 res!311957) b!511155))

(assert (= (or b!511155 b!511154) bm!31500))

(declare-fun m!492699 () Bool)

(assert (=> bm!31500 m!492699))

(assert (=> b!511153 m!492593))

(declare-fun m!492701 () Bool)

(assert (=> b!511153 m!492701))

(declare-fun m!492703 () Bool)

(assert (=> b!511153 m!492703))

(assert (=> b!511153 m!492593))

(assert (=> b!511153 m!492599))

(assert (=> b!511152 m!492593))

(assert (=> b!511152 m!492593))

(assert (=> b!511152 m!492605))

(assert (=> b!511055 d!78895))

(declare-fun b!511240 () Bool)

(declare-fun e!298750 () Bool)

(declare-fun lt!233898 () SeekEntryResult!4266)

(assert (=> b!511240 (= e!298750 (bvsge (x!48203 lt!233898) #b01111111111111111111111111111110))))

(declare-fun b!511241 () Bool)

(declare-fun e!298747 () SeekEntryResult!4266)

(assert (=> b!511241 (= e!298747 (Intermediate!4266 true lt!233795 #b00000000000000000000000000000000))))

(declare-fun d!78897 () Bool)

(assert (=> d!78897 e!298750))

(declare-fun c!59909 () Bool)

(assert (=> d!78897 (= c!59909 (and ((_ is Intermediate!4266) lt!233898) (undefined!5078 lt!233898)))))

(assert (=> d!78897 (= lt!233898 e!298747)))

(declare-fun c!59908 () Bool)

(assert (=> d!78897 (= c!59908 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233897 () (_ BitVec 64))

(assert (=> d!78897 (= lt!233897 (select (arr!15799 a!3235) lt!233795))))

(assert (=> d!78897 (validMask!0 mask!3524)))

(assert (=> d!78897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233795 (select (arr!15799 a!3235) j!176) a!3235 mask!3524) lt!233898)))

(declare-fun b!511242 () Bool)

(declare-fun e!298749 () SeekEntryResult!4266)

(assert (=> b!511242 (= e!298749 (Intermediate!4266 false lt!233795 #b00000000000000000000000000000000))))

(declare-fun b!511243 () Bool)

(assert (=> b!511243 (= e!298747 e!298749)))

(declare-fun c!59910 () Bool)

(assert (=> b!511243 (= c!59910 (or (= lt!233897 (select (arr!15799 a!3235) j!176)) (= (bvadd lt!233897 lt!233897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511244 () Bool)

(declare-fun e!298748 () Bool)

(assert (=> b!511244 (= e!298750 e!298748)))

(declare-fun res!311985 () Bool)

(assert (=> b!511244 (= res!311985 (and ((_ is Intermediate!4266) lt!233898) (not (undefined!5078 lt!233898)) (bvslt (x!48203 lt!233898) #b01111111111111111111111111111110) (bvsge (x!48203 lt!233898) #b00000000000000000000000000000000) (bvsge (x!48203 lt!233898) #b00000000000000000000000000000000)))))

(assert (=> b!511244 (=> (not res!311985) (not e!298748))))

(declare-fun b!511245 () Bool)

(assert (=> b!511245 (and (bvsge (index!19254 lt!233898) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233898) (size!16163 a!3235)))))

(declare-fun e!298751 () Bool)

(assert (=> b!511245 (= e!298751 (= (select (arr!15799 a!3235) (index!19254 lt!233898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511246 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511246 (= e!298749 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233795 #b00000000000000000000000000000000 mask!3524) (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!511247 () Bool)

(assert (=> b!511247 (and (bvsge (index!19254 lt!233898) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233898) (size!16163 a!3235)))))

(declare-fun res!311986 () Bool)

(assert (=> b!511247 (= res!311986 (= (select (arr!15799 a!3235) (index!19254 lt!233898)) (select (arr!15799 a!3235) j!176)))))

(assert (=> b!511247 (=> res!311986 e!298751)))

(assert (=> b!511247 (= e!298748 e!298751)))

(declare-fun b!511248 () Bool)

(assert (=> b!511248 (and (bvsge (index!19254 lt!233898) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233898) (size!16163 a!3235)))))

(declare-fun res!311984 () Bool)

(assert (=> b!511248 (= res!311984 (= (select (arr!15799 a!3235) (index!19254 lt!233898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511248 (=> res!311984 e!298751)))

(assert (= (and d!78897 c!59908) b!511241))

(assert (= (and d!78897 (not c!59908)) b!511243))

(assert (= (and b!511243 c!59910) b!511242))

(assert (= (and b!511243 (not c!59910)) b!511246))

(assert (= (and d!78897 c!59909) b!511240))

(assert (= (and d!78897 (not c!59909)) b!511244))

(assert (= (and b!511244 res!311985) b!511247))

(assert (= (and b!511247 (not res!311986)) b!511248))

(assert (= (and b!511248 (not res!311984)) b!511245))

(declare-fun m!492739 () Bool)

(assert (=> b!511248 m!492739))

(declare-fun m!492741 () Bool)

(assert (=> d!78897 m!492741))

(assert (=> d!78897 m!492573))

(declare-fun m!492743 () Bool)

(assert (=> b!511246 m!492743))

(assert (=> b!511246 m!492743))

(assert (=> b!511246 m!492593))

(declare-fun m!492745 () Bool)

(assert (=> b!511246 m!492745))

(assert (=> b!511245 m!492739))

(assert (=> b!511247 m!492739))

(assert (=> b!511055 d!78897))

(declare-fun d!78909 () Bool)

(assert (=> d!78909 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233901 () Unit!15790)

(declare-fun choose!38 (array!32841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15790)

(assert (=> d!78909 (= lt!233901 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78909 (validMask!0 mask!3524)))

(assert (=> d!78909 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!233901)))

(declare-fun bs!16192 () Bool)

(assert (= bs!16192 d!78909))

(assert (=> bs!16192 m!492597))

(declare-fun m!492747 () Bool)

(assert (=> bs!16192 m!492747))

(assert (=> bs!16192 m!492573))

(assert (=> b!511055 d!78909))

(declare-fun d!78911 () Bool)

(declare-fun lt!233903 () (_ BitVec 32))

(declare-fun lt!233902 () (_ BitVec 32))

(assert (=> d!78911 (= lt!233903 (bvmul (bvxor lt!233902 (bvlshr lt!233902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78911 (= lt!233902 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78911 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311956 (let ((h!10833 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48206 (bvmul (bvxor h!10833 (bvlshr h!10833 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48206 (bvlshr x!48206 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311956 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311956 #b00000000000000000000000000000000))))))

(assert (=> d!78911 (= (toIndex!0 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!233903 (bvlshr lt!233903 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511055 d!78911))

(declare-fun b!511249 () Bool)

(declare-fun e!298755 () Bool)

(declare-fun lt!233905 () SeekEntryResult!4266)

(assert (=> b!511249 (= e!298755 (bvsge (x!48203 lt!233905) #b01111111111111111111111111111110))))

(declare-fun b!511250 () Bool)

(declare-fun e!298752 () SeekEntryResult!4266)

(assert (=> b!511250 (= e!298752 (Intermediate!4266 true lt!233794 #b00000000000000000000000000000000))))

(declare-fun d!78913 () Bool)

(assert (=> d!78913 e!298755))

(declare-fun c!59912 () Bool)

(assert (=> d!78913 (= c!59912 (and ((_ is Intermediate!4266) lt!233905) (undefined!5078 lt!233905)))))

(assert (=> d!78913 (= lt!233905 e!298752)))

(declare-fun c!59911 () Bool)

(assert (=> d!78913 (= c!59911 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233904 () (_ BitVec 64))

(assert (=> d!78913 (= lt!233904 (select (arr!15799 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235))) lt!233794))))

(assert (=> d!78913 (validMask!0 mask!3524)))

(assert (=> d!78913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233794 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)) mask!3524) lt!233905)))

(declare-fun b!511251 () Bool)

(declare-fun e!298754 () SeekEntryResult!4266)

(assert (=> b!511251 (= e!298754 (Intermediate!4266 false lt!233794 #b00000000000000000000000000000000))))

(declare-fun b!511252 () Bool)

(assert (=> b!511252 (= e!298752 e!298754)))

(declare-fun c!59913 () Bool)

(assert (=> b!511252 (= c!59913 (or (= lt!233904 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!233904 lt!233904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511253 () Bool)

(declare-fun e!298753 () Bool)

(assert (=> b!511253 (= e!298755 e!298753)))

(declare-fun res!311988 () Bool)

(assert (=> b!511253 (= res!311988 (and ((_ is Intermediate!4266) lt!233905) (not (undefined!5078 lt!233905)) (bvslt (x!48203 lt!233905) #b01111111111111111111111111111110) (bvsge (x!48203 lt!233905) #b00000000000000000000000000000000) (bvsge (x!48203 lt!233905) #b00000000000000000000000000000000)))))

(assert (=> b!511253 (=> (not res!311988) (not e!298753))))

(declare-fun b!511254 () Bool)

(assert (=> b!511254 (and (bvsge (index!19254 lt!233905) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233905) (size!16163 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)))))))

(declare-fun e!298756 () Bool)

(assert (=> b!511254 (= e!298756 (= (select (arr!15799 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235))) (index!19254 lt!233905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511255 () Bool)

(assert (=> b!511255 (= e!298754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233794 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)) mask!3524))))

(declare-fun b!511256 () Bool)

(assert (=> b!511256 (and (bvsge (index!19254 lt!233905) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233905) (size!16163 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)))))))

(declare-fun res!311989 () Bool)

(assert (=> b!511256 (= res!311989 (= (select (arr!15799 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235))) (index!19254 lt!233905)) (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!511256 (=> res!311989 e!298756)))

(assert (=> b!511256 (= e!298753 e!298756)))

(declare-fun b!511257 () Bool)

(assert (=> b!511257 (and (bvsge (index!19254 lt!233905) #b00000000000000000000000000000000) (bvslt (index!19254 lt!233905) (size!16163 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)))))))

(declare-fun res!311987 () Bool)

(assert (=> b!511257 (= res!311987 (= (select (arr!15799 (array!32842 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235))) (index!19254 lt!233905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511257 (=> res!311987 e!298756)))

(assert (= (and d!78913 c!59911) b!511250))

(assert (= (and d!78913 (not c!59911)) b!511252))

(assert (= (and b!511252 c!59913) b!511251))

(assert (= (and b!511252 (not c!59913)) b!511255))

(assert (= (and d!78913 c!59912) b!511249))

(assert (= (and d!78913 (not c!59912)) b!511253))

(assert (= (and b!511253 res!311988) b!511256))

(assert (= (and b!511256 (not res!311989)) b!511257))

(assert (= (and b!511257 (not res!311987)) b!511254))

(declare-fun m!492749 () Bool)

(assert (=> b!511257 m!492749))

(declare-fun m!492751 () Bool)

(assert (=> d!78913 m!492751))

(assert (=> d!78913 m!492573))

(declare-fun m!492753 () Bool)

(assert (=> b!511255 m!492753))

(assert (=> b!511255 m!492753))

(assert (=> b!511255 m!492589))

(declare-fun m!492755 () Bool)

(assert (=> b!511255 m!492755))

(assert (=> b!511254 m!492749))

(assert (=> b!511256 m!492749))

(assert (=> b!511055 d!78913))

(declare-fun d!78915 () Bool)

(declare-fun res!311994 () Bool)

(declare-fun e!298767 () Bool)

(assert (=> d!78915 (=> res!311994 e!298767)))

(assert (=> d!78915 (= res!311994 (= (select (arr!15799 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78915 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!298767)))

(declare-fun b!511274 () Bool)

(declare-fun e!298768 () Bool)

(assert (=> b!511274 (= e!298767 e!298768)))

(declare-fun res!311995 () Bool)

(assert (=> b!511274 (=> (not res!311995) (not e!298768))))

(assert (=> b!511274 (= res!311995 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16163 a!3235)))))

(declare-fun b!511275 () Bool)

(assert (=> b!511275 (= e!298768 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78915 (not res!311994)) b!511274))

(assert (= (and b!511274 res!311995) b!511275))

(assert (=> d!78915 m!492645))

(declare-fun m!492757 () Bool)

(assert (=> b!511275 m!492757))

(assert (=> b!511057 d!78915))

(declare-fun d!78917 () Bool)

(assert (=> d!78917 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46130 d!78917))

(declare-fun d!78929 () Bool)

(assert (=> d!78929 (= (array_inv!11595 a!3235) (bvsge (size!16163 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46130 d!78929))

(check-sat (not b!511255) (not b!511149) (not b!511142) (not b!511152) (not bm!31500) (not b!511099) (not b!511143) (not d!78913) (not bm!31499) (not b!511127) (not b!511246) (not b!511153) (not d!78871) (not b!511275) (not d!78897) (not b!511102) (not d!78909) (not b!511100) (not d!78893) (not bm!31493))
(check-sat)
