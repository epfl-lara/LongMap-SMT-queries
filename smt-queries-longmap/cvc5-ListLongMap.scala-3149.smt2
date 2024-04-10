; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44316 () Bool)

(assert start!44316)

(declare-fun b!487371 () Bool)

(declare-fun res!290758 () Bool)

(declare-fun e!286761 () Bool)

(assert (=> b!487371 (=> (not res!290758) (not e!286761))))

(declare-datatypes ((array!31567 0))(
  ( (array!31568 (arr!15177 (Array (_ BitVec 32) (_ BitVec 64))) (size!15541 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31567)

(declare-datatypes ((List!9335 0))(
  ( (Nil!9332) (Cons!9331 (h!10187 (_ BitVec 64)) (t!15563 List!9335)) )
))
(declare-fun arrayNoDuplicates!0 (array!31567 (_ BitVec 32) List!9335) Bool)

(assert (=> b!487371 (= res!290758 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9332))))

(declare-fun b!487372 () Bool)

(declare-fun res!290761 () Bool)

(declare-fun e!286759 () Bool)

(assert (=> b!487372 (=> (not res!290761) (not e!286759))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487372 (= res!290761 (validKeyInArray!0 k!2280))))

(declare-fun b!487373 () Bool)

(assert (=> b!487373 (= e!286759 e!286761)))

(declare-fun res!290757 () Bool)

(assert (=> b!487373 (=> (not res!290757) (not e!286761))))

(declare-datatypes ((SeekEntryResult!3644 0))(
  ( (MissingZero!3644 (index!16755 (_ BitVec 32))) (Found!3644 (index!16756 (_ BitVec 32))) (Intermediate!3644 (undefined!4456 Bool) (index!16757 (_ BitVec 32)) (x!45880 (_ BitVec 32))) (Undefined!3644) (MissingVacant!3644 (index!16758 (_ BitVec 32))) )
))
(declare-fun lt!220005 () SeekEntryResult!3644)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487373 (= res!290757 (or (= lt!220005 (MissingZero!3644 i!1204)) (= lt!220005 (MissingVacant!3644 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31567 (_ BitVec 32)) SeekEntryResult!3644)

(assert (=> b!487373 (= lt!220005 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487374 () Bool)

(declare-fun res!290760 () Bool)

(assert (=> b!487374 (=> (not res!290760) (not e!286759))))

(declare-fun arrayContainsKey!0 (array!31567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487374 (= res!290760 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487375 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!286758 () Bool)

(assert (=> b!487375 (= e!286758 (= (seekEntryOrOpen!0 (select (arr!15177 a!3235) j!176) a!3235 mask!3524) (Found!3644 j!176)))))

(declare-fun res!290764 () Bool)

(assert (=> start!44316 (=> (not res!290764) (not e!286759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44316 (= res!290764 (validMask!0 mask!3524))))

(assert (=> start!44316 e!286759))

(assert (=> start!44316 true))

(declare-fun array_inv!10973 (array!31567) Bool)

(assert (=> start!44316 (array_inv!10973 a!3235)))

(declare-fun b!487376 () Bool)

(declare-fun res!290765 () Bool)

(assert (=> b!487376 (=> (not res!290765) (not e!286759))))

(assert (=> b!487376 (= res!290765 (validKeyInArray!0 (select (arr!15177 a!3235) j!176)))))

(declare-fun b!487377 () Bool)

(assert (=> b!487377 (= e!286761 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!487377 e!286758))

(declare-fun res!290759 () Bool)

(assert (=> b!487377 (=> (not res!290759) (not e!286758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31567 (_ BitVec 32)) Bool)

(assert (=> b!487377 (= res!290759 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14234 0))(
  ( (Unit!14235) )
))
(declare-fun lt!220006 () Unit!14234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14234)

(assert (=> b!487377 (= lt!220006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487378 () Bool)

(declare-fun res!290763 () Bool)

(assert (=> b!487378 (=> (not res!290763) (not e!286761))))

(assert (=> b!487378 (= res!290763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487379 () Bool)

(declare-fun res!290762 () Bool)

(assert (=> b!487379 (=> (not res!290762) (not e!286759))))

(assert (=> b!487379 (= res!290762 (and (= (size!15541 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15541 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15541 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44316 res!290764) b!487379))

(assert (= (and b!487379 res!290762) b!487376))

(assert (= (and b!487376 res!290765) b!487372))

(assert (= (and b!487372 res!290761) b!487374))

(assert (= (and b!487374 res!290760) b!487373))

(assert (= (and b!487373 res!290757) b!487378))

(assert (= (and b!487378 res!290763) b!487371))

(assert (= (and b!487371 res!290758) b!487377))

(assert (= (and b!487377 res!290759) b!487375))

(declare-fun m!467193 () Bool)

(assert (=> b!487373 m!467193))

(declare-fun m!467195 () Bool)

(assert (=> b!487378 m!467195))

(declare-fun m!467197 () Bool)

(assert (=> start!44316 m!467197))

(declare-fun m!467199 () Bool)

(assert (=> start!44316 m!467199))

(declare-fun m!467201 () Bool)

(assert (=> b!487377 m!467201))

(declare-fun m!467203 () Bool)

(assert (=> b!487377 m!467203))

(declare-fun m!467205 () Bool)

(assert (=> b!487374 m!467205))

(declare-fun m!467207 () Bool)

(assert (=> b!487372 m!467207))

(declare-fun m!467209 () Bool)

(assert (=> b!487376 m!467209))

(assert (=> b!487376 m!467209))

(declare-fun m!467211 () Bool)

(assert (=> b!487376 m!467211))

(declare-fun m!467213 () Bool)

(assert (=> b!487371 m!467213))

(assert (=> b!487375 m!467209))

(assert (=> b!487375 m!467209))

(declare-fun m!467215 () Bool)

(assert (=> b!487375 m!467215))

(push 1)

(assert (not b!487373))

(assert (not start!44316))

(assert (not b!487372))

(assert (not b!487376))

(assert (not b!487378))

(assert (not b!487377))

(assert (not b!487375))

(assert (not b!487374))

(assert (not b!487371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!487515 () Bool)

(declare-fun e!286838 () SeekEntryResult!3644)

(declare-fun e!286837 () SeekEntryResult!3644)

(assert (=> b!487515 (= e!286838 e!286837)))

(declare-fun lt!220054 () (_ BitVec 64))

(declare-fun lt!220053 () SeekEntryResult!3644)

(assert (=> b!487515 (= lt!220054 (select (arr!15177 a!3235) (index!16757 lt!220053)))))

(declare-fun c!58606 () Bool)

(assert (=> b!487515 (= c!58606 (= lt!220054 (select (arr!15177 a!3235) j!176)))))

(declare-fun b!487516 () Bool)

(assert (=> b!487516 (= e!286838 Undefined!3644)))

(declare-fun b!487518 () Bool)

(assert (=> b!487518 (= e!286837 (Found!3644 (index!16757 lt!220053)))))

(declare-fun b!487519 () Bool)

(declare-fun e!286839 () SeekEntryResult!3644)

(assert (=> b!487519 (= e!286839 (MissingZero!3644 (index!16757 lt!220053)))))

(declare-fun b!487520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31567 (_ BitVec 32)) SeekEntryResult!3644)

(assert (=> b!487520 (= e!286839 (seekKeyOrZeroReturnVacant!0 (x!45880 lt!220053) (index!16757 lt!220053) (index!16757 lt!220053) (select (arr!15177 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487517 () Bool)

(declare-fun c!58607 () Bool)

(assert (=> b!487517 (= c!58607 (= lt!220054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487517 (= e!286837 e!286839)))

(declare-fun d!77645 () Bool)

(declare-fun lt!220052 () SeekEntryResult!3644)

(assert (=> d!77645 (and (or (is-Undefined!3644 lt!220052) (not (is-Found!3644 lt!220052)) (and (bvsge (index!16756 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16756 lt!220052) (size!15541 a!3235)))) (or (is-Undefined!3644 lt!220052) (is-Found!3644 lt!220052) (not (is-MissingZero!3644 lt!220052)) (and (bvsge (index!16755 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16755 lt!220052) (size!15541 a!3235)))) (or (is-Undefined!3644 lt!220052) (is-Found!3644 lt!220052) (is-MissingZero!3644 lt!220052) (not (is-MissingVacant!3644 lt!220052)) (and (bvsge (index!16758 lt!220052) #b00000000000000000000000000000000) (bvslt (index!16758 lt!220052) (size!15541 a!3235)))) (or (is-Undefined!3644 lt!220052) (ite (is-Found!3644 lt!220052) (= (select (arr!15177 a!3235) (index!16756 lt!220052)) (select (arr!15177 a!3235) j!176)) (ite (is-MissingZero!3644 lt!220052) (= (select (arr!15177 a!3235) (index!16755 lt!220052)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3644 lt!220052) (= (select (arr!15177 a!3235) (index!16758 lt!220052)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77645 (= lt!220052 e!286838)))

(declare-fun c!58605 () Bool)

(assert (=> d!77645 (= c!58605 (and (is-Intermediate!3644 lt!220053) (undefined!4456 lt!220053)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31567 (_ BitVec 32)) SeekEntryResult!3644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77645 (= lt!220053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15177 a!3235) j!176) mask!3524) (select (arr!15177 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77645 (validMask!0 mask!3524)))

(assert (=> d!77645 (= (seekEntryOrOpen!0 (select (arr!15177 a!3235) j!176) a!3235 mask!3524) lt!220052)))

(assert (= (and d!77645 c!58605) b!487516))

(assert (= (and d!77645 (not c!58605)) b!487515))

(assert (= (and b!487515 c!58606) b!487518))

(assert (= (and b!487515 (not c!58606)) b!487517))

(assert (= (and b!487517 c!58607) b!487519))

(assert (= (and b!487517 (not c!58607)) b!487520))

(declare-fun m!467315 () Bool)

(assert (=> b!487515 m!467315))

(assert (=> b!487520 m!467209))

(declare-fun m!467317 () Bool)

(assert (=> b!487520 m!467317))

(declare-fun m!467319 () Bool)

(assert (=> d!77645 m!467319))

(assert (=> d!77645 m!467197))

(assert (=> d!77645 m!467209))

(declare-fun m!467321 () Bool)

(assert (=> d!77645 m!467321))

(declare-fun m!467323 () Bool)

(assert (=> d!77645 m!467323))

(declare-fun m!467325 () Bool)

(assert (=> d!77645 m!467325))

(assert (=> d!77645 m!467321))

(assert (=> d!77645 m!467209))

(declare-fun m!467327 () Bool)

(assert (=> d!77645 m!467327))

(assert (=> b!487375 d!77645))

(declare-fun b!487568 () Bool)

(declare-fun e!286877 () Bool)

(declare-fun call!31298 () Bool)

(assert (=> b!487568 (= e!286877 call!31298)))

(declare-fun b!487569 () Bool)

(declare-fun e!286878 () Bool)

(assert (=> b!487569 (= e!286878 call!31298)))

(declare-fun b!487570 () Bool)

(assert (=> b!487570 (= e!286877 e!286878)))

(declare-fun lt!220078 () (_ BitVec 64))

(assert (=> b!487570 (= lt!220078 (select (arr!15177 a!3235) j!176))))

(declare-fun lt!220076 () Unit!14234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31567 (_ BitVec 64) (_ BitVec 32)) Unit!14234)

(assert (=> b!487570 (= lt!220076 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220078 j!176))))

(assert (=> b!487570 (arrayContainsKey!0 a!3235 lt!220078 #b00000000000000000000000000000000)))

(declare-fun lt!220077 () Unit!14234)

(assert (=> b!487570 (= lt!220077 lt!220076)))

(declare-fun res!290867 () Bool)

(assert (=> b!487570 (= res!290867 (= (seekEntryOrOpen!0 (select (arr!15177 a!3235) j!176) a!3235 mask!3524) (Found!3644 j!176)))))

(assert (=> b!487570 (=> (not res!290867) (not e!286878))))

(declare-fun bm!31295 () Bool)

(assert (=> bm!31295 (= call!31298 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77661 () Bool)

(declare-fun res!290866 () Bool)

(declare-fun e!286876 () Bool)

(assert (=> d!77661 (=> res!290866 e!286876)))

(assert (=> d!77661 (= res!290866 (bvsge j!176 (size!15541 a!3235)))))

(assert (=> d!77661 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286876)))

(declare-fun b!487571 () Bool)

(assert (=> b!487571 (= e!286876 e!286877)))

(declare-fun c!58619 () Bool)

(assert (=> b!487571 (= c!58619 (validKeyInArray!0 (select (arr!15177 a!3235) j!176)))))

(assert (= (and d!77661 (not res!290866)) b!487571))

(assert (= (and b!487571 c!58619) b!487570))

(assert (= (and b!487571 (not c!58619)) b!487568))

(assert (= (and b!487570 res!290867) b!487569))

(assert (= (or b!487569 b!487568) bm!31295))

(assert (=> b!487570 m!467209))

(declare-fun m!467357 () Bool)

(assert (=> b!487570 m!467357))

(declare-fun m!467359 () Bool)

(assert (=> b!487570 m!467359))

