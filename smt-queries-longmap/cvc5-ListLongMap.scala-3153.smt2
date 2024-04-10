; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44388 () Bool)

(assert start!44388)

(declare-fun b!487878 () Bool)

(declare-fun res!291151 () Bool)

(declare-fun e!287031 () Bool)

(assert (=> b!487878 (=> (not res!291151) (not e!287031))))

(declare-datatypes ((array!31594 0))(
  ( (array!31595 (arr!15189 (Array (_ BitVec 32) (_ BitVec 64))) (size!15553 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31594)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31594 (_ BitVec 32)) Bool)

(assert (=> b!487878 (= res!291151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291158 () Bool)

(declare-fun e!287029 () Bool)

(assert (=> start!44388 (=> (not res!291158) (not e!287029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44388 (= res!291158 (validMask!0 mask!3524))))

(assert (=> start!44388 e!287029))

(assert (=> start!44388 true))

(declare-fun array_inv!10985 (array!31594) Bool)

(assert (=> start!44388 (array_inv!10985 a!3235)))

(declare-fun b!487879 () Bool)

(declare-fun res!291154 () Bool)

(assert (=> b!487879 (=> (not res!291154) (not e!287029))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487879 (= res!291154 (validKeyInArray!0 (select (arr!15189 a!3235) j!176)))))

(declare-fun b!487880 () Bool)

(declare-fun res!291155 () Bool)

(assert (=> b!487880 (=> (not res!291155) (not e!287031))))

(declare-datatypes ((List!9347 0))(
  ( (Nil!9344) (Cons!9343 (h!10199 (_ BitVec 64)) (t!15575 List!9347)) )
))
(declare-fun arrayNoDuplicates!0 (array!31594 (_ BitVec 32) List!9347) Bool)

(assert (=> b!487880 (= res!291155 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9344))))

(declare-fun b!487881 () Bool)

(declare-fun lt!220189 () (_ BitVec 32))

(assert (=> b!487881 (= e!287031 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220189 #b00000000000000000000000000000000) (bvslt lt!220189 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487881 (= lt!220189 (toIndex!0 (select (arr!15189 a!3235) j!176) mask!3524))))

(declare-fun e!287028 () Bool)

(assert (=> b!487881 e!287028))

(declare-fun res!291153 () Bool)

(assert (=> b!487881 (=> (not res!291153) (not e!287028))))

(assert (=> b!487881 (= res!291153 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14258 0))(
  ( (Unit!14259) )
))
(declare-fun lt!220187 () Unit!14258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14258)

(assert (=> b!487881 (= lt!220187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487882 () Bool)

(declare-datatypes ((SeekEntryResult!3656 0))(
  ( (MissingZero!3656 (index!16803 (_ BitVec 32))) (Found!3656 (index!16804 (_ BitVec 32))) (Intermediate!3656 (undefined!4468 Bool) (index!16805 (_ BitVec 32)) (x!45924 (_ BitVec 32))) (Undefined!3656) (MissingVacant!3656 (index!16806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31594 (_ BitVec 32)) SeekEntryResult!3656)

(assert (=> b!487882 (= e!287028 (= (seekEntryOrOpen!0 (select (arr!15189 a!3235) j!176) a!3235 mask!3524) (Found!3656 j!176)))))

(declare-fun b!487883 () Bool)

(assert (=> b!487883 (= e!287029 e!287031)))

(declare-fun res!291150 () Bool)

(assert (=> b!487883 (=> (not res!291150) (not e!287031))))

(declare-fun lt!220188 () SeekEntryResult!3656)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487883 (= res!291150 (or (= lt!220188 (MissingZero!3656 i!1204)) (= lt!220188 (MissingVacant!3656 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487883 (= lt!220188 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487884 () Bool)

(declare-fun res!291152 () Bool)

(assert (=> b!487884 (=> (not res!291152) (not e!287029))))

(assert (=> b!487884 (= res!291152 (validKeyInArray!0 k!2280))))

(declare-fun b!487885 () Bool)

(declare-fun res!291157 () Bool)

(assert (=> b!487885 (=> (not res!291157) (not e!287029))))

(assert (=> b!487885 (= res!291157 (and (= (size!15553 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15553 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15553 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487886 () Bool)

(declare-fun res!291156 () Bool)

(assert (=> b!487886 (=> (not res!291156) (not e!287029))))

(declare-fun arrayContainsKey!0 (array!31594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487886 (= res!291156 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44388 res!291158) b!487885))

(assert (= (and b!487885 res!291157) b!487879))

(assert (= (and b!487879 res!291154) b!487884))

(assert (= (and b!487884 res!291152) b!487886))

(assert (= (and b!487886 res!291156) b!487883))

(assert (= (and b!487883 res!291150) b!487878))

(assert (= (and b!487878 res!291151) b!487880))

(assert (= (and b!487880 res!291155) b!487881))

(assert (= (and b!487881 res!291153) b!487882))

(declare-fun m!467661 () Bool)

(assert (=> b!487881 m!467661))

(assert (=> b!487881 m!467661))

(declare-fun m!467663 () Bool)

(assert (=> b!487881 m!467663))

(declare-fun m!467665 () Bool)

(assert (=> b!487881 m!467665))

(declare-fun m!467667 () Bool)

(assert (=> b!487881 m!467667))

(assert (=> b!487879 m!467661))

(assert (=> b!487879 m!467661))

(declare-fun m!467669 () Bool)

(assert (=> b!487879 m!467669))

(declare-fun m!467671 () Bool)

(assert (=> b!487883 m!467671))

(assert (=> b!487882 m!467661))

(assert (=> b!487882 m!467661))

(declare-fun m!467673 () Bool)

(assert (=> b!487882 m!467673))

(declare-fun m!467675 () Bool)

(assert (=> b!487884 m!467675))

(declare-fun m!467677 () Bool)

(assert (=> start!44388 m!467677))

(declare-fun m!467679 () Bool)

(assert (=> start!44388 m!467679))

(declare-fun m!467681 () Bool)

(assert (=> b!487880 m!467681))

(declare-fun m!467683 () Bool)

(assert (=> b!487878 m!467683))

(declare-fun m!467685 () Bool)

(assert (=> b!487886 m!467685))

(push 1)

(assert (not b!487882))

(assert (not b!487879))

(assert (not b!487881))

(assert (not b!487884))

(assert (not b!487880))

(assert (not b!487883))

(assert (not b!487886))

(assert (not b!487878))

(assert (not start!44388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!487984 () Bool)

(declare-fun e!287086 () SeekEntryResult!3656)

(declare-fun lt!220233 () SeekEntryResult!3656)

(assert (=> b!487984 (= e!287086 (MissingZero!3656 (index!16805 lt!220233)))))

(declare-fun b!487985 () Bool)

(declare-fun e!287088 () SeekEntryResult!3656)

(declare-fun e!287087 () SeekEntryResult!3656)

(assert (=> b!487985 (= e!287088 e!287087)))

(declare-fun lt!220234 () (_ BitVec 64))

(assert (=> b!487985 (= lt!220234 (select (arr!15189 a!3235) (index!16805 lt!220233)))))

(declare-fun c!58645 () Bool)

(assert (=> b!487985 (= c!58645 (= lt!220234 (select (arr!15189 a!3235) j!176)))))

(declare-fun b!487986 () Bool)

(declare-fun c!58647 () Bool)

(assert (=> b!487986 (= c!58647 (= lt!220234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487986 (= e!287087 e!287086)))

(declare-fun b!487987 () Bool)

(assert (=> b!487987 (= e!287087 (Found!3656 (index!16805 lt!220233)))))

(declare-fun d!77707 () Bool)

(declare-fun lt!220232 () SeekEntryResult!3656)

(assert (=> d!77707 (and (or (is-Undefined!3656 lt!220232) (not (is-Found!3656 lt!220232)) (and (bvsge (index!16804 lt!220232) #b00000000000000000000000000000000) (bvslt (index!16804 lt!220232) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220232) (is-Found!3656 lt!220232) (not (is-MissingZero!3656 lt!220232)) (and (bvsge (index!16803 lt!220232) #b00000000000000000000000000000000) (bvslt (index!16803 lt!220232) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220232) (is-Found!3656 lt!220232) (is-MissingZero!3656 lt!220232) (not (is-MissingVacant!3656 lt!220232)) (and (bvsge (index!16806 lt!220232) #b00000000000000000000000000000000) (bvslt (index!16806 lt!220232) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220232) (ite (is-Found!3656 lt!220232) (= (select (arr!15189 a!3235) (index!16804 lt!220232)) (select (arr!15189 a!3235) j!176)) (ite (is-MissingZero!3656 lt!220232) (= (select (arr!15189 a!3235) (index!16803 lt!220232)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3656 lt!220232) (= (select (arr!15189 a!3235) (index!16806 lt!220232)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77707 (= lt!220232 e!287088)))

(declare-fun c!58646 () Bool)

(assert (=> d!77707 (= c!58646 (and (is-Intermediate!3656 lt!220233) (undefined!4468 lt!220233)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31594 (_ BitVec 32)) SeekEntryResult!3656)

(assert (=> d!77707 (= lt!220233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15189 a!3235) j!176) mask!3524) (select (arr!15189 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77707 (validMask!0 mask!3524)))

(assert (=> d!77707 (= (seekEntryOrOpen!0 (select (arr!15189 a!3235) j!176) a!3235 mask!3524) lt!220232)))

(declare-fun b!487988 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31594 (_ BitVec 32)) SeekEntryResult!3656)

(assert (=> b!487988 (= e!287086 (seekKeyOrZeroReturnVacant!0 (x!45924 lt!220233) (index!16805 lt!220233) (index!16805 lt!220233) (select (arr!15189 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487989 () Bool)

(assert (=> b!487989 (= e!287088 Undefined!3656)))

(assert (= (and d!77707 c!58646) b!487989))

(assert (= (and d!77707 (not c!58646)) b!487985))

(assert (= (and b!487985 c!58645) b!487987))

(assert (= (and b!487985 (not c!58645)) b!487986))

(assert (= (and b!487986 c!58647) b!487984))

(assert (= (and b!487986 (not c!58647)) b!487988))

(declare-fun m!467765 () Bool)

(assert (=> b!487985 m!467765))

(assert (=> d!77707 m!467661))

(assert (=> d!77707 m!467663))

(declare-fun m!467767 () Bool)

(assert (=> d!77707 m!467767))

(declare-fun m!467769 () Bool)

(assert (=> d!77707 m!467769))

(assert (=> d!77707 m!467663))

(assert (=> d!77707 m!467661))

(declare-fun m!467771 () Bool)

(assert (=> d!77707 m!467771))

(assert (=> d!77707 m!467677))

(declare-fun m!467773 () Bool)

(assert (=> d!77707 m!467773))

(assert (=> b!487988 m!467661))

(declare-fun m!467775 () Bool)

(assert (=> b!487988 m!467775))

(assert (=> b!487882 d!77707))

(declare-fun b!487990 () Bool)

(declare-fun e!287089 () SeekEntryResult!3656)

(declare-fun lt!220236 () SeekEntryResult!3656)

(assert (=> b!487990 (= e!287089 (MissingZero!3656 (index!16805 lt!220236)))))

(declare-fun b!487991 () Bool)

(declare-fun e!287091 () SeekEntryResult!3656)

(declare-fun e!287090 () SeekEntryResult!3656)

(assert (=> b!487991 (= e!287091 e!287090)))

(declare-fun lt!220237 () (_ BitVec 64))

(assert (=> b!487991 (= lt!220237 (select (arr!15189 a!3235) (index!16805 lt!220236)))))

(declare-fun c!58648 () Bool)

(assert (=> b!487991 (= c!58648 (= lt!220237 k!2280))))

(declare-fun b!487992 () Bool)

(declare-fun c!58650 () Bool)

(assert (=> b!487992 (= c!58650 (= lt!220237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487992 (= e!287090 e!287089)))

(declare-fun b!487993 () Bool)

(assert (=> b!487993 (= e!287090 (Found!3656 (index!16805 lt!220236)))))

(declare-fun d!77721 () Bool)

(declare-fun lt!220235 () SeekEntryResult!3656)

(assert (=> d!77721 (and (or (is-Undefined!3656 lt!220235) (not (is-Found!3656 lt!220235)) (and (bvsge (index!16804 lt!220235) #b00000000000000000000000000000000) (bvslt (index!16804 lt!220235) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220235) (is-Found!3656 lt!220235) (not (is-MissingZero!3656 lt!220235)) (and (bvsge (index!16803 lt!220235) #b00000000000000000000000000000000) (bvslt (index!16803 lt!220235) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220235) (is-Found!3656 lt!220235) (is-MissingZero!3656 lt!220235) (not (is-MissingVacant!3656 lt!220235)) (and (bvsge (index!16806 lt!220235) #b00000000000000000000000000000000) (bvslt (index!16806 lt!220235) (size!15553 a!3235)))) (or (is-Undefined!3656 lt!220235) (ite (is-Found!3656 lt!220235) (= (select (arr!15189 a!3235) (index!16804 lt!220235)) k!2280) (ite (is-MissingZero!3656 lt!220235) (= (select (arr!15189 a!3235) (index!16803 lt!220235)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3656 lt!220235) (= (select (arr!15189 a!3235) (index!16806 lt!220235)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77721 (= lt!220235 e!287091)))

(declare-fun c!58649 () Bool)

(assert (=> d!77721 (= c!58649 (and (is-Intermediate!3656 lt!220236) (undefined!4468 lt!220236)))))

(assert (=> d!77721 (= lt!220236 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77721 (validMask!0 mask!3524)))

(assert (=> d!77721 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220235)))

(declare-fun b!487994 () Bool)

(assert (=> b!487994 (= e!287089 (seekKeyOrZeroReturnVacant!0 (x!45924 lt!220236) (index!16805 lt!220236) (index!16805 lt!220236) k!2280 a!3235 mask!3524))))

(declare-fun b!487995 () Bool)

(assert (=> b!487995 (= e!287091 Undefined!3656)))

(assert (= (and d!77721 c!58649) b!487995))

(assert (= (and d!77721 (not c!58649)) b!487991))

(assert (= (and b!487991 c!58648) b!487993))

(assert (= (and b!487991 (not c!58648)) b!487992))

(assert (= (and b!487992 c!58650) b!487990))

(assert (= (and b!487992 (not c!58650)) b!487994))

(declare-fun m!467777 () Bool)

(assert (=> b!487991 m!467777))

(declare-fun m!467779 () Bool)

(assert (=> d!77721 m!467779))

(declare-fun m!467781 () Bool)

(assert (=> d!77721 m!467781))

(declare-fun m!467783 () Bool)

(assert (=> d!77721 m!467783))

(assert (=> d!77721 m!467779))

(declare-fun m!467785 () Bool)

(assert (=> d!77721 m!467785))

(assert (=> d!77721 m!467677))

(declare-fun m!467787 () Bool)

(assert (=> d!77721 m!467787))

(declare-fun m!467789 () Bool)

(assert (=> b!487994 m!467789))

(assert (=> b!487883 d!77721))

(declare-fun b!488010 () Bool)

(declare-fun e!287105 () Bool)

(declare-fun call!31314 () Bool)

(assert (=> b!488010 (= e!287105 call!31314)))

(declare-fun d!77723 () Bool)

(declare-fun res!291241 () Bool)

(declare-fun e!287104 () Bool)

(assert (=> d!77723 (=> res!291241 e!287104)))

(assert (=> d!77723 (= res!291241 (bvsge #b00000000000000000000000000000000 (size!15553 a!3235)))))

(assert (=> d!77723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287104)))

(declare-fun b!488011 () Bool)

(declare-fun e!287106 () Bool)

(assert (=> b!488011 (= e!287105 e!287106)))

(declare-fun lt!220249 () (_ BitVec 64))

(assert (=> b!488011 (= lt!220249 (select (arr!15189 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220247 () Unit!14258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31594 (_ BitVec 64) (_ BitVec 32)) Unit!14258)

(assert (=> b!488011 (= lt!220247 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220249 #b00000000000000000000000000000000))))

(assert (=> b!488011 (arrayContainsKey!0 a!3235 lt!220249 #b00000000000000000000000000000000)))

(declare-fun lt!220248 () Unit!14258)

(assert (=> b!488011 (= lt!220248 lt!220247)))

(declare-fun res!291242 () Bool)

(assert (=> b!488011 (= res!291242 (= (seekEntryOrOpen!0 (select (arr!15189 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3656 #b00000000000000000000000000000000)))))

(assert (=> b!488011 (=> (not res!291242) (not e!287106))))

(declare-fun b!488012 () Bool)

(assert (=> b!488012 (= e!287106 call!31314)))

(declare-fun b!488013 () Bool)

(assert (=> b!488013 (= e!287104 e!287105)))

(declare-fun c!58653 () Bool)

(assert (=> b!488013 (= c!58653 (validKeyInArray!0 (select (arr!15189 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31311 () Bool)

(assert (=> bm!31311 (= call!31314 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77723 (not res!291241)) b!488013))

(assert (= (and b!488013 c!58653) b!488011))

(assert (= (and b!488013 (not c!58653)) b!488010))

(assert (= (and b!488011 res!291242) b!488012))

(assert (= (or b!488012 b!488010) bm!31311))

(declare-fun m!467795 () Bool)

(assert (=> b!488011 m!467795))

(declare-fun m!467797 () Bool)

(assert (=> b!488011 m!467797))

(declare-fun m!467799 () Bool)

(assert (=> b!488011 m!467799))

(assert (=> b!488011 m!467795))

(declare-fun m!467801 () Bool)

(assert (=> b!488011 m!467801))

(assert (=> b!488013 m!467795))

(assert (=> b!488013 m!467795))

(declare-fun m!467803 () Bool)

(assert (=> b!488013 m!467803))

(declare-fun m!467805 () Bool)

(assert (=> bm!31311 m!467805))

(assert (=> b!487878 d!77723))

(declare-fun d!77731 () Bool)

(assert (=> d!77731 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487884 d!77731))

(declare-fun d!77733 () Bool)

(assert (=> d!77733 (= (validKeyInArray!0 (select (arr!15189 a!3235) j!176)) (and (not (= (select (arr!15189 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15189 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487879 d!77733))

(declare-fun b!488024 () Bool)

(declare-fun e!287115 () Bool)

(declare-fun call!31317 () Bool)

(assert (=> b!488024 (= e!287115 call!31317)))

(declare-fun b!488025 () Bool)

(declare-fun e!287117 () Bool)

(declare-fun contains!2701 (List!9347 (_ BitVec 64)) Bool)

(assert (=> b!488025 (= e!287117 (contains!2701 Nil!9344 (select (arr!15189 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77735 () Bool)

(declare-fun res!291251 () Bool)

(declare-fun e!287116 () Bool)

(assert (=> d!77735 (=> res!291251 e!287116)))

(assert (=> d!77735 (= res!291251 (bvsge #b00000000000000000000000000000000 (size!15553 a!3235)))))

(assert (=> d!77735 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9344) e!287116)))

(declare-fun b!488026 () Bool)

(declare-fun e!287118 () Bool)

(assert (=> b!488026 (= e!287116 e!287118)))

(declare-fun res!291249 () Bool)

(assert (=> b!488026 (=> (not res!291249) (not e!287118))))

(assert (=> b!488026 (= res!291249 (not e!287117))))

(declare-fun res!291250 () Bool)

(assert (=> b!488026 (=> (not res!291250) (not e!287117))))

(assert (=> b!488026 (= res!291250 (validKeyInArray!0 (select (arr!15189 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488027 () Bool)

(assert (=> b!488027 (= e!287118 e!287115)))

(declare-fun c!58656 () Bool)

(assert (=> b!488027 (= c!58656 (validKeyInArray!0 (select (arr!15189 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488028 () Bool)

(assert (=> b!488028 (= e!287115 call!31317)))

(declare-fun bm!31314 () Bool)

(assert (=> bm!31314 (= call!31317 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58656 (Cons!9343 (select (arr!15189 a!3235) #b00000000000000000000000000000000) Nil!9344) Nil!9344)))))

(assert (= (and d!77735 (not res!291251)) b!488026))

(assert (= (and b!488026 res!291250) b!488025))

(assert (= (and b!488026 res!291249) b!488027))

(assert (= (and b!488027 c!58656) b!488024))

(assert (= (and b!488027 (not c!58656)) b!488028))

(assert (= (or b!488024 b!488028) bm!31314))

(assert (=> b!488025 m!467795))

(assert (=> b!488025 m!467795))

(declare-fun m!467807 () Bool)

(assert (=> b!488025 m!467807))

(assert (=> b!488026 m!467795))

(assert (=> b!488026 m!467795))

(assert (=> b!488026 m!467803))

(assert (=> b!488027 m!467795))

(assert (=> b!488027 m!467795))

(assert (=> b!488027 m!467803))

(assert (=> bm!31314 m!467795))

(declare-fun m!467809 () Bool)

(assert (=> bm!31314 m!467809))

(assert (=> b!487880 d!77735))

(declare-fun d!77741 () Bool)

(assert (=> d!77741 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44388 d!77741))

(declare-fun d!77747 () Bool)

(assert (=> d!77747 (= (array_inv!10985 a!3235) (bvsge (size!15553 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44388 d!77747))

(declare-fun d!77749 () Bool)

(declare-fun res!291256 () Bool)

(declare-fun e!287132 () Bool)

(assert (=> d!77749 (=> res!291256 e!287132)))

(assert (=> d!77749 (= res!291256 (= (select (arr!15189 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77749 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!287132)))

(declare-fun b!488051 () Bool)

(declare-fun e!287133 () Bool)

(assert (=> b!488051 (= e!287132 e!287133)))

(declare-fun res!291257 () Bool)

(assert (=> b!488051 (=> (not res!291257) (not e!287133))))

(assert (=> b!488051 (= res!291257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15553 a!3235)))))

(declare-fun b!488052 () Bool)

(assert (=> b!488052 (= e!287133 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77749 (not res!291256)) b!488051))

(assert (= (and b!488051 res!291257) b!488052))

(assert (=> d!77749 m!467795))

(declare-fun m!467823 () Bool)

(assert (=> b!488052 m!467823))

(assert (=> b!487886 d!77749))

(declare-fun d!77751 () Bool)

(declare-fun lt!220276 () (_ BitVec 32))

(declare-fun lt!220275 () (_ BitVec 32))

(assert (=> d!77751 (= lt!220276 (bvmul (bvxor lt!220275 (bvlshr lt!220275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77751 (= lt!220275 ((_ extract 31 0) (bvand (bvxor (select (arr!15189 a!3235) j!176) (bvlshr (select (arr!15189 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77751 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291258 (let ((h!10203 ((_ extract 31 0) (bvand (bvxor (select (arr!15189 a!3235) j!176) (bvlshr (select (arr!15189 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45928 (bvmul (bvxor h!10203 (bvlshr h!10203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45928 (bvlshr x!45928 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291258 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291258 #b00000000000000000000000000000000))))))

(assert (=> d!77751 (= (toIndex!0 (select (arr!15189 a!3235) j!176) mask!3524) (bvand (bvxor lt!220276 (bvlshr lt!220276 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!487881 d!77751))

(declare-fun b!488073 () Bool)

(declare-fun e!287147 () Bool)

(declare-fun call!31320 () Bool)

(assert (=> b!488073 (= e!287147 call!31320)))

(declare-fun d!77753 () Bool)

(declare-fun res!291263 () Bool)

(declare-fun e!287146 () Bool)

(assert (=> d!77753 (=> res!291263 e!287146)))

(assert (=> d!77753 (= res!291263 (bvsge j!176 (size!15553 a!3235)))))

(assert (=> d!77753 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287146)))

(declare-fun b!488074 () Bool)

(declare-fun e!287148 () Bool)

(assert (=> b!488074 (= e!287147 e!287148)))

(declare-fun lt!220279 () (_ BitVec 64))

(assert (=> b!488074 (= lt!220279 (select (arr!15189 a!3235) j!176))))

(declare-fun lt!220277 () Unit!14258)

(assert (=> b!488074 (= lt!220277 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220279 j!176))))

(assert (=> b!488074 (arrayContainsKey!0 a!3235 lt!220279 #b00000000000000000000000000000000)))

(declare-fun lt!220278 () Unit!14258)

(assert (=> b!488074 (= lt!220278 lt!220277)))

(declare-fun res!291264 () Bool)

(assert (=> b!488074 (= res!291264 (= (seekEntryOrOpen!0 (select (arr!15189 a!3235) j!176) a!3235 mask!3524) (Found!3656 j!176)))))

(assert (=> b!488074 (=> (not res!291264) (not e!287148))))

(declare-fun b!488075 () Bool)

(assert (=> b!488075 (= e!287148 call!31320)))

(declare-fun b!488076 () Bool)

(assert (=> b!488076 (= e!287146 e!287147)))

(declare-fun c!58674 () Bool)

(assert (=> b!488076 (= c!58674 (validKeyInArray!0 (select (arr!15189 a!3235) j!176)))))

(declare-fun bm!31317 () Bool)

(assert (=> bm!31317 (= call!31320 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77753 (not res!291263)) b!488076))

(assert (= (and b!488076 c!58674) b!488074))

(assert (= (and b!488076 (not c!58674)) b!488073))

(assert (= (and b!488074 res!291264) b!488075))

(assert (= (or b!488075 b!488073) bm!31317))

(assert (=> b!488074 m!467661))

(declare-fun m!467825 () Bool)

(assert (=> b!488074 m!467825))

(declare-fun m!467827 () Bool)

(assert (=> b!488074 m!467827))

(assert (=> b!488074 m!467661))

(assert (=> b!488074 m!467673))

(assert (=> b!488076 m!467661))

(assert (=> b!488076 m!467661))

(assert (=> b!488076 m!467669))

(declare-fun m!467829 () Bool)

(assert (=> bm!31317 m!467829))

(assert (=> b!487881 d!77753))

(declare-fun d!77755 () Bool)

(assert (=> d!77755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220291 () Unit!14258)

(declare-fun choose!38 (array!31594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14258)

(assert (=> d!77755 (= lt!220291 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77755 (validMask!0 mask!3524)))

(assert (=> d!77755 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220291)))

(declare-fun bs!15554 () Bool)

(assert (= bs!15554 d!77755))

(assert (=> bs!15554 m!467665))

(declare-fun m!467865 () Bool)

(assert (=> bs!15554 m!467865))

(assert (=> bs!15554 m!467677))

(assert (=> b!487881 d!77755))

(push 1)

(assert (not bm!31311))

(assert (not b!488052))

(assert (not b!488026))

(assert (not b!488076))

(assert (not b!488027))

(assert (not d!77721))

(assert (not d!77707))

(assert (not bm!31317))

(assert (not b!488011))

(assert (not b!488074))

(assert (not bm!31314))

(assert (not d!77755))

(assert (not b!487994))

(assert (not b!487988))

(assert (not b!488013))

(assert (not b!488025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

