; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69332 () Bool)

(assert start!69332)

(declare-fun lt!362373 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun e!447664 () Bool)

(declare-datatypes ((array!43981 0))(
  ( (array!43982 (arr!21066 (Array (_ BitVec 32) (_ BitVec 64))) (size!21487 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43981)

(declare-fun b!808688 () Bool)

(assert (=> b!808688 (= e!447664 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (or (bvslt lt!362373 #b00000000000000000000000000000000) (bvsge lt!362373 (size!21487 a!3170)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808688 (= lt!362373 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808689 () Bool)

(declare-fun e!447661 () Bool)

(assert (=> b!808689 (= e!447661 e!447664)))

(declare-fun res!552621 () Bool)

(assert (=> b!808689 (=> (not res!552621) (not e!447664))))

(declare-datatypes ((SeekEntryResult!8657 0))(
  ( (MissingZero!8657 (index!36996 (_ BitVec 32))) (Found!8657 (index!36997 (_ BitVec 32))) (Intermediate!8657 (undefined!9469 Bool) (index!36998 (_ BitVec 32)) (x!67803 (_ BitVec 32))) (Undefined!8657) (MissingVacant!8657 (index!36999 (_ BitVec 32))) )
))
(declare-fun lt!362374 () SeekEntryResult!8657)

(declare-fun lt!362377 () SeekEntryResult!8657)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808689 (= res!552621 (and (= lt!362374 lt!362377) (= lt!362377 (Found!8657 j!153)) (not (= (select (arr!21066 a!3170) index!1236) (select (arr!21066 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8657)

(assert (=> b!808689 (= lt!362377 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21066 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8657)

(assert (=> b!808689 (= lt!362374 (seekEntryOrOpen!0 (select (arr!21066 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808690 () Bool)

(declare-fun res!552618 () Bool)

(declare-fun e!447663 () Bool)

(assert (=> b!808690 (=> (not res!552618) (not e!447663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43981 (_ BitVec 32)) Bool)

(assert (=> b!808690 (= res!552618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808691 () Bool)

(declare-fun res!552620 () Bool)

(declare-fun e!447665 () Bool)

(assert (=> b!808691 (=> (not res!552620) (not e!447665))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808691 (= res!552620 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808692 () Bool)

(declare-fun res!552617 () Bool)

(assert (=> b!808692 (=> (not res!552617) (not e!447663))))

(declare-datatypes ((List!15029 0))(
  ( (Nil!15026) (Cons!15025 (h!16154 (_ BitVec 64)) (t!21344 List!15029)) )
))
(declare-fun arrayNoDuplicates!0 (array!43981 (_ BitVec 32) List!15029) Bool)

(assert (=> b!808692 (= res!552617 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15026))))

(declare-fun b!808693 () Bool)

(declare-fun res!552616 () Bool)

(assert (=> b!808693 (=> (not res!552616) (not e!447665))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808693 (= res!552616 (and (= (size!21487 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21487 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21487 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808695 () Bool)

(declare-fun res!552623 () Bool)

(assert (=> b!808695 (=> (not res!552623) (not e!447663))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!808695 (= res!552623 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21487 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21066 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21487 a!3170)) (= (select (arr!21066 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808696 () Bool)

(declare-fun res!552613 () Bool)

(assert (=> b!808696 (=> (not res!552613) (not e!447665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808696 (= res!552613 (validKeyInArray!0 (select (arr!21066 a!3170) j!153)))))

(declare-fun b!808697 () Bool)

(assert (=> b!808697 (= e!447663 e!447661)))

(declare-fun res!552622 () Bool)

(assert (=> b!808697 (=> (not res!552622) (not e!447661))))

(declare-fun lt!362378 () array!43981)

(declare-fun lt!362376 () (_ BitVec 64))

(assert (=> b!808697 (= res!552622 (= (seekEntryOrOpen!0 lt!362376 lt!362378 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362376 lt!362378 mask!3266)))))

(assert (=> b!808697 (= lt!362376 (select (store (arr!21066 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808697 (= lt!362378 (array!43982 (store (arr!21066 a!3170) i!1163 k!2044) (size!21487 a!3170)))))

(declare-fun b!808698 () Bool)

(assert (=> b!808698 (= e!447665 e!447663)))

(declare-fun res!552615 () Bool)

(assert (=> b!808698 (=> (not res!552615) (not e!447663))))

(declare-fun lt!362375 () SeekEntryResult!8657)

(assert (=> b!808698 (= res!552615 (or (= lt!362375 (MissingZero!8657 i!1163)) (= lt!362375 (MissingVacant!8657 i!1163))))))

(assert (=> b!808698 (= lt!362375 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!552614 () Bool)

(assert (=> start!69332 (=> (not res!552614) (not e!447665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69332 (= res!552614 (validMask!0 mask!3266))))

(assert (=> start!69332 e!447665))

(assert (=> start!69332 true))

(declare-fun array_inv!16862 (array!43981) Bool)

(assert (=> start!69332 (array_inv!16862 a!3170)))

(declare-fun b!808694 () Bool)

(declare-fun res!552619 () Bool)

(assert (=> b!808694 (=> (not res!552619) (not e!447665))))

(assert (=> b!808694 (= res!552619 (validKeyInArray!0 k!2044))))

(assert (= (and start!69332 res!552614) b!808693))

(assert (= (and b!808693 res!552616) b!808696))

(assert (= (and b!808696 res!552613) b!808694))

(assert (= (and b!808694 res!552619) b!808691))

(assert (= (and b!808691 res!552620) b!808698))

(assert (= (and b!808698 res!552615) b!808690))

(assert (= (and b!808690 res!552618) b!808692))

(assert (= (and b!808692 res!552617) b!808695))

(assert (= (and b!808695 res!552623) b!808697))

(assert (= (and b!808697 res!552622) b!808689))

(assert (= (and b!808689 res!552621) b!808688))

(declare-fun m!750839 () Bool)

(assert (=> b!808698 m!750839))

(declare-fun m!750841 () Bool)

(assert (=> b!808692 m!750841))

(declare-fun m!750843 () Bool)

(assert (=> start!69332 m!750843))

(declare-fun m!750845 () Bool)

(assert (=> start!69332 m!750845))

(declare-fun m!750847 () Bool)

(assert (=> b!808697 m!750847))

(declare-fun m!750849 () Bool)

(assert (=> b!808697 m!750849))

(declare-fun m!750851 () Bool)

(assert (=> b!808697 m!750851))

(declare-fun m!750853 () Bool)

(assert (=> b!808697 m!750853))

(declare-fun m!750855 () Bool)

(assert (=> b!808691 m!750855))

(declare-fun m!750857 () Bool)

(assert (=> b!808690 m!750857))

(declare-fun m!750859 () Bool)

(assert (=> b!808696 m!750859))

(assert (=> b!808696 m!750859))

(declare-fun m!750861 () Bool)

(assert (=> b!808696 m!750861))

(declare-fun m!750863 () Bool)

(assert (=> b!808695 m!750863))

(declare-fun m!750865 () Bool)

(assert (=> b!808695 m!750865))

(declare-fun m!750867 () Bool)

(assert (=> b!808689 m!750867))

(assert (=> b!808689 m!750859))

(assert (=> b!808689 m!750859))

(declare-fun m!750869 () Bool)

(assert (=> b!808689 m!750869))

(assert (=> b!808689 m!750859))

(declare-fun m!750871 () Bool)

(assert (=> b!808689 m!750871))

(declare-fun m!750873 () Bool)

(assert (=> b!808688 m!750873))

(declare-fun m!750875 () Bool)

(assert (=> b!808694 m!750875))

(push 1)

(assert (not b!808692))

(assert (not b!808697))

(assert (not b!808696))

(assert (not b!808698))

(assert (not b!808690))

(assert (not start!69332))

(assert (not b!808689))

(assert (not b!808691))

(assert (not b!808688))

(assert (not b!808694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103835 () Bool)

(assert (=> d!103835 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!808694 d!103835))

(declare-fun lt!362463 () SeekEntryResult!8657)

(declare-fun d!103839 () Bool)

(assert (=> d!103839 (and (or (is-Undefined!8657 lt!362463) (not (is-Found!8657 lt!362463)) (and (bvsge (index!36997 lt!362463) #b00000000000000000000000000000000) (bvslt (index!36997 lt!362463) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362463) (is-Found!8657 lt!362463) (not (is-MissingVacant!8657 lt!362463)) (not (= (index!36999 lt!362463) vacantBefore!23)) (and (bvsge (index!36999 lt!362463) #b00000000000000000000000000000000) (bvslt (index!36999 lt!362463) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362463) (ite (is-Found!8657 lt!362463) (= (select (arr!21066 a!3170) (index!36997 lt!362463)) (select (arr!21066 a!3170) j!153)) (and (is-MissingVacant!8657 lt!362463) (= (index!36999 lt!362463) vacantBefore!23) (= (select (arr!21066 a!3170) (index!36999 lt!362463)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447777 () SeekEntryResult!8657)

(assert (=> d!103839 (= lt!362463 e!447777)))

(declare-fun c!88495 () Bool)

(assert (=> d!103839 (= c!88495 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!362464 () (_ BitVec 64))

(assert (=> d!103839 (= lt!362464 (select (arr!21066 a!3170) index!1236))))

(assert (=> d!103839 (validMask!0 mask!3266)))

(assert (=> d!103839 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21066 a!3170) j!153) a!3170 mask!3266) lt!362463)))

(declare-fun b!808891 () Bool)

(assert (=> b!808891 (= e!447777 Undefined!8657)))

(declare-fun b!808892 () Bool)

(declare-fun e!447779 () SeekEntryResult!8657)

(assert (=> b!808892 (= e!447779 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21066 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808893 () Bool)

(declare-fun e!447778 () SeekEntryResult!8657)

(assert (=> b!808893 (= e!447778 (Found!8657 index!1236))))

(declare-fun b!808894 () Bool)

(assert (=> b!808894 (= e!447777 e!447778)))

(declare-fun c!88494 () Bool)

(assert (=> b!808894 (= c!88494 (= lt!362464 (select (arr!21066 a!3170) j!153)))))

(declare-fun b!808895 () Bool)

(assert (=> b!808895 (= e!447779 (MissingVacant!8657 vacantBefore!23))))

(declare-fun b!808896 () Bool)

(declare-fun c!88493 () Bool)

(assert (=> b!808896 (= c!88493 (= lt!362464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808896 (= e!447778 e!447779)))

(assert (= (and d!103839 c!88495) b!808891))

(assert (= (and d!103839 (not c!88495)) b!808894))

(assert (= (and b!808894 c!88494) b!808893))

(assert (= (and b!808894 (not c!88494)) b!808896))

(assert (= (and b!808896 c!88493) b!808895))

(assert (= (and b!808896 (not c!88493)) b!808892))

(declare-fun m!751045 () Bool)

(assert (=> d!103839 m!751045))

(declare-fun m!751047 () Bool)

(assert (=> d!103839 m!751047))

(assert (=> d!103839 m!750867))

(assert (=> d!103839 m!750843))

(assert (=> b!808892 m!750873))

(assert (=> b!808892 m!750873))

(assert (=> b!808892 m!750859))

(declare-fun m!751049 () Bool)

(assert (=> b!808892 m!751049))

(assert (=> b!808689 d!103839))

(declare-fun b!808933 () Bool)

(declare-fun e!447798 () SeekEntryResult!8657)

(assert (=> b!808933 (= e!447798 Undefined!8657)))

(declare-fun b!808934 () Bool)

(declare-fun e!447800 () SeekEntryResult!8657)

(assert (=> b!808934 (= e!447798 e!447800)))

(declare-fun lt!362483 () (_ BitVec 64))

(declare-fun lt!362485 () SeekEntryResult!8657)

(assert (=> b!808934 (= lt!362483 (select (arr!21066 a!3170) (index!36998 lt!362485)))))

(declare-fun c!88516 () Bool)

(assert (=> b!808934 (= c!88516 (= lt!362483 (select (arr!21066 a!3170) j!153)))))

(declare-fun b!808935 () Bool)

(declare-fun e!447799 () SeekEntryResult!8657)

(assert (=> b!808935 (= e!447799 (MissingZero!8657 (index!36998 lt!362485)))))

(declare-fun b!808936 () Bool)

(assert (=> b!808936 (= e!447800 (Found!8657 (index!36998 lt!362485)))))

(declare-fun b!808937 () Bool)

(declare-fun c!88515 () Bool)

(assert (=> b!808937 (= c!88515 (= lt!362483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808937 (= e!447800 e!447799)))

(declare-fun d!103859 () Bool)

(declare-fun lt!362484 () SeekEntryResult!8657)

(assert (=> d!103859 (and (or (is-Undefined!8657 lt!362484) (not (is-Found!8657 lt!362484)) (and (bvsge (index!36997 lt!362484) #b00000000000000000000000000000000) (bvslt (index!36997 lt!362484) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362484) (is-Found!8657 lt!362484) (not (is-MissingZero!8657 lt!362484)) (and (bvsge (index!36996 lt!362484) #b00000000000000000000000000000000) (bvslt (index!36996 lt!362484) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362484) (is-Found!8657 lt!362484) (is-MissingZero!8657 lt!362484) (not (is-MissingVacant!8657 lt!362484)) (and (bvsge (index!36999 lt!362484) #b00000000000000000000000000000000) (bvslt (index!36999 lt!362484) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362484) (ite (is-Found!8657 lt!362484) (= (select (arr!21066 a!3170) (index!36997 lt!362484)) (select (arr!21066 a!3170) j!153)) (ite (is-MissingZero!8657 lt!362484) (= (select (arr!21066 a!3170) (index!36996 lt!362484)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8657 lt!362484) (= (select (arr!21066 a!3170) (index!36999 lt!362484)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103859 (= lt!362484 e!447798)))

(declare-fun c!88514 () Bool)

(assert (=> d!103859 (= c!88514 (and (is-Intermediate!8657 lt!362485) (undefined!9469 lt!362485)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43981 (_ BitVec 32)) SeekEntryResult!8657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103859 (= lt!362485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21066 a!3170) j!153) mask!3266) (select (arr!21066 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103859 (validMask!0 mask!3266)))

(assert (=> d!103859 (= (seekEntryOrOpen!0 (select (arr!21066 a!3170) j!153) a!3170 mask!3266) lt!362484)))

(declare-fun b!808938 () Bool)

(assert (=> b!808938 (= e!447799 (seekKeyOrZeroReturnVacant!0 (x!67803 lt!362485) (index!36998 lt!362485) (index!36998 lt!362485) (select (arr!21066 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103859 c!88514) b!808933))

(assert (= (and d!103859 (not c!88514)) b!808934))

(assert (= (and b!808934 c!88516) b!808936))

(assert (= (and b!808934 (not c!88516)) b!808937))

(assert (= (and b!808937 c!88515) b!808935))

(assert (= (and b!808937 (not c!88515)) b!808938))

(declare-fun m!751079 () Bool)

(assert (=> b!808934 m!751079))

(declare-fun m!751081 () Bool)

(assert (=> d!103859 m!751081))

(assert (=> d!103859 m!750843))

(declare-fun m!751083 () Bool)

(assert (=> d!103859 m!751083))

(declare-fun m!751085 () Bool)

(assert (=> d!103859 m!751085))

(declare-fun m!751087 () Bool)

(assert (=> d!103859 m!751087))

(assert (=> d!103859 m!750859))

(declare-fun m!751089 () Bool)

(assert (=> d!103859 m!751089))

(assert (=> d!103859 m!750859))

(assert (=> d!103859 m!751087))

(assert (=> b!808938 m!750859))

(declare-fun m!751091 () Bool)

(assert (=> b!808938 m!751091))

(assert (=> b!808689 d!103859))

(declare-fun b!808939 () Bool)

(declare-fun e!447801 () SeekEntryResult!8657)

(assert (=> b!808939 (= e!447801 Undefined!8657)))

(declare-fun b!808940 () Bool)

(declare-fun e!447803 () SeekEntryResult!8657)

(assert (=> b!808940 (= e!447801 e!447803)))

(declare-fun lt!362486 () (_ BitVec 64))

(declare-fun lt!362488 () SeekEntryResult!8657)

(assert (=> b!808940 (= lt!362486 (select (arr!21066 a!3170) (index!36998 lt!362488)))))

(declare-fun c!88519 () Bool)

(assert (=> b!808940 (= c!88519 (= lt!362486 k!2044))))

(declare-fun b!808941 () Bool)

(declare-fun e!447802 () SeekEntryResult!8657)

(assert (=> b!808941 (= e!447802 (MissingZero!8657 (index!36998 lt!362488)))))

(declare-fun b!808942 () Bool)

(assert (=> b!808942 (= e!447803 (Found!8657 (index!36998 lt!362488)))))

(declare-fun b!808943 () Bool)

(declare-fun c!88518 () Bool)

(assert (=> b!808943 (= c!88518 (= lt!362486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!808943 (= e!447803 e!447802)))

(declare-fun d!103867 () Bool)

(declare-fun lt!362487 () SeekEntryResult!8657)

(assert (=> d!103867 (and (or (is-Undefined!8657 lt!362487) (not (is-Found!8657 lt!362487)) (and (bvsge (index!36997 lt!362487) #b00000000000000000000000000000000) (bvslt (index!36997 lt!362487) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362487) (is-Found!8657 lt!362487) (not (is-MissingZero!8657 lt!362487)) (and (bvsge (index!36996 lt!362487) #b00000000000000000000000000000000) (bvslt (index!36996 lt!362487) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362487) (is-Found!8657 lt!362487) (is-MissingZero!8657 lt!362487) (not (is-MissingVacant!8657 lt!362487)) (and (bvsge (index!36999 lt!362487) #b00000000000000000000000000000000) (bvslt (index!36999 lt!362487) (size!21487 a!3170)))) (or (is-Undefined!8657 lt!362487) (ite (is-Found!8657 lt!362487) (= (select (arr!21066 a!3170) (index!36997 lt!362487)) k!2044) (ite (is-MissingZero!8657 lt!362487) (= (select (arr!21066 a!3170) (index!36996 lt!362487)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8657 lt!362487) (= (select (arr!21066 a!3170) (index!36999 lt!362487)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103867 (= lt!362487 e!447801)))

(declare-fun c!88517 () Bool)

(assert (=> d!103867 (= c!88517 (and (is-Intermediate!8657 lt!362488) (undefined!9469 lt!362488)))))

(assert (=> d!103867 (= lt!362488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103867 (validMask!0 mask!3266)))

(assert (=> d!103867 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!362487)))

(declare-fun b!808944 () Bool)

(assert (=> b!808944 (= e!447802 (seekKeyOrZeroReturnVacant!0 (x!67803 lt!362488) (index!36998 lt!362488) (index!36998 lt!362488) k!2044 a!3170 mask!3266))))

(assert (= (and d!103867 c!88517) b!808939))

(assert (= (and d!103867 (not c!88517)) b!808940))

(assert (= (and b!808940 c!88519) b!808942))

(assert (= (and b!808940 (not c!88519)) b!808943))

(assert (= (and b!808943 c!88518) b!808941))

(assert (= (and b!808943 (not c!88518)) b!808944))

(declare-fun m!751093 () Bool)

(assert (=> b!808940 m!751093))

(declare-fun m!751095 () Bool)

(assert (=> d!103867 m!751095))

(assert (=> d!103867 m!750843))

(declare-fun m!751097 () Bool)

(assert (=> d!103867 m!751097))

(declare-fun m!751099 () Bool)

(assert (=> d!103867 m!751099))

(declare-fun m!751101 () Bool)

(assert (=> d!103867 m!751101))

(declare-fun m!751103 () Bool)

(assert (=> d!103867 m!751103))

(assert (=> d!103867 m!751101))

(declare-fun m!751105 () Bool)

(assert (=> b!808944 m!751105))

(assert (=> b!808698 d!103867))

(declare-fun d!103869 () Bool)

(declare-fun lt!362491 () (_ BitVec 32))

(assert (=> d!103869 (and (bvsge lt!362491 #b00000000000000000000000000000000) (bvslt lt!362491 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103869 (= lt!362491 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103869 (validMask!0 mask!3266)))

(assert (=> d!103869 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362491)))

(declare-fun bs!22403 () Bool)

(assert (= bs!22403 d!103869))

(declare-fun m!751107 () Bool)

(assert (=> bs!22403 m!751107))

(assert (=> bs!22403 m!750843))

(assert (=> b!808688 d!103869))

(declare-fun d!103871 () Bool)

(declare-fun res!552730 () Bool)

(declare-fun e!447808 () Bool)

(assert (=> d!103871 (=> res!552730 e!447808)))

(assert (=> d!103871 (= res!552730 (= (select (arr!21066 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103871 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!447808)))

(declare-fun b!808949 () Bool)

(declare-fun e!447809 () Bool)

(assert (=> b!808949 (= e!447808 e!447809)))

(declare-fun res!552731 () Bool)

(assert (=> b!808949 (=> (not res!552731) (not e!447809))))

(assert (=> b!808949 (= res!552731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21487 a!3170)))))

(declare-fun b!808950 () Bool)

(assert (=> b!808950 (= e!447809 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103871 (not res!552730)) b!808949))

(assert (= (and b!808949 res!552731) b!808950))

(declare-fun m!751109 () Bool)

(assert (=> d!103871 m!751109))

(declare-fun m!751111 () Bool)

(assert (=> b!808950 m!751111))

(assert (=> b!808691 d!103871))

(declare-fun b!808973 () Bool)

(declare-fun e!447825 () Bool)

(declare-fun contains!4130 (List!15029 (_ BitVec 64)) Bool)

(assert (=> b!808973 (= e!447825 (contains!4130 Nil!15026 (select (arr!21066 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35412 () Bool)

(declare-fun call!35415 () Bool)

(declare-fun c!88528 () Bool)

(assert (=> bm!35412 (= call!35415 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88528 (Cons!15025 (select (arr!21066 a!3170) #b00000000000000000000000000000000) Nil!15026) Nil!15026)))))

(declare-fun b!808975 () Bool)

(declare-fun e!447824 () Bool)

(assert (=> b!808975 (= e!447824 call!35415)))

(declare-fun b!808976 () Bool)

(declare-fun e!447827 () Bool)

(declare-fun e!447826 () Bool)

(assert (=> b!808976 (= e!447827 e!447826)))

(declare-fun res!552738 () Bool)

(assert (=> b!808976 (=> (not res!552738) (not e!447826))))

(assert (=> b!808976 (= res!552738 (not e!447825))))

(declare-fun res!552739 () Bool)

(assert (=> b!808976 (=> (not res!552739) (not e!447825))))

(assert (=> b!808976 (= res!552739 (validKeyInArray!0 (select (arr!21066 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!808977 () Bool)

(assert (=> b!808977 (= e!447826 e!447824)))

(assert (=> b!808977 (= c!88528 (validKeyInArray!0 (select (arr!21066 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103873 () Bool)

(declare-fun res!552740 () Bool)

(assert (=> d!103873 (=> res!552740 e!447827)))

(assert (=> d!103873 (= res!552740 (bvsge #b00000000000000000000000000000000 (size!21487 a!3170)))))

(assert (=> d!103873 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15026) e!447827)))

(declare-fun b!808974 () Bool)

(assert (=> b!808974 (= e!447824 call!35415)))

(assert (= (and d!103873 (not res!552740)) b!808976))

(assert (= (and b!808976 res!552739) b!808973))

(assert (= (and b!808976 res!552738) b!808977))

(assert (= (and b!808977 c!88528) b!808974))

(assert (= (and b!808977 (not c!88528)) b!808975))

(assert (= (or b!808974 b!808975) bm!35412))

(assert (=> b!808973 m!751109))

(assert (=> b!808973 m!751109))

(declare-fun m!751113 () Bool)

(assert (=> b!808973 m!751113))

(assert (=> bm!35412 m!751109))

(declare-fun m!751115 () Bool)

(assert (=> bm!35412 m!751115))

(assert (=> b!808976 m!751109))

(assert (=> b!808976 m!751109))

(declare-fun m!751117 () Bool)

(assert (=> b!808976 m!751117))

(assert (=> b!808977 m!751109))

(assert (=> b!808977 m!751109))

(assert (=> b!808977 m!751117))

(assert (=> b!808692 d!103873))

(declare-fun b!808978 () Bool)

(declare-fun e!447828 () SeekEntryResult!8657)

(assert (=> b!808978 (= e!447828 Undefined!8657)))

