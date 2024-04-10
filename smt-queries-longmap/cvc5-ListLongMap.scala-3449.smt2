; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47814 () Bool)

(assert start!47814)

(declare-fun b!526894 () Bool)

(declare-fun res!323461 () Bool)

(declare-fun e!307086 () Bool)

(assert (=> b!526894 (=> (not res!323461) (not e!307086))))

(declare-datatypes ((array!33451 0))(
  ( (array!33452 (arr!16077 (Array (_ BitVec 32) (_ BitVec 64))) (size!16441 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33451)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526894 (= res!323461 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526895 () Bool)

(declare-fun e!307092 () Bool)

(declare-fun e!307089 () Bool)

(assert (=> b!526895 (= e!307092 (not e!307089))))

(declare-fun res!323453 () Bool)

(assert (=> b!526895 (=> res!323453 e!307089)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!242442 () (_ BitVec 32))

(declare-fun lt!242443 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4544 0))(
  ( (MissingZero!4544 (index!20388 (_ BitVec 32))) (Found!4544 (index!20389 (_ BitVec 32))) (Intermediate!4544 (undefined!5356 Bool) (index!20390 (_ BitVec 32)) (x!49357 (_ BitVec 32))) (Undefined!4544) (MissingVacant!4544 (index!20391 (_ BitVec 32))) )
))
(declare-fun lt!242437 () SeekEntryResult!4544)

(declare-fun lt!242434 () array!33451)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33451 (_ BitVec 32)) SeekEntryResult!4544)

(assert (=> b!526895 (= res!323453 (= lt!242437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242442 lt!242443 lt!242434 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242438 () (_ BitVec 32))

(assert (=> b!526895 (= lt!242437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242438 (select (arr!16077 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526895 (= lt!242442 (toIndex!0 lt!242443 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526895 (= lt!242443 (select (store (arr!16077 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526895 (= lt!242438 (toIndex!0 (select (arr!16077 a!3235) j!176) mask!3524))))

(assert (=> b!526895 (= lt!242434 (array!33452 (store (arr!16077 a!3235) i!1204 k!2280) (size!16441 a!3235)))))

(declare-fun e!307088 () Bool)

(assert (=> b!526895 e!307088))

(declare-fun res!323459 () Bool)

(assert (=> b!526895 (=> (not res!323459) (not e!307088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33451 (_ BitVec 32)) Bool)

(assert (=> b!526895 (= res!323459 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16628 0))(
  ( (Unit!16629) )
))
(declare-fun lt!242440 () Unit!16628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> b!526895 (= lt!242440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526896 () Bool)

(declare-fun res!323457 () Bool)

(assert (=> b!526896 (=> (not res!323457) (not e!307092))))

(declare-datatypes ((List!10235 0))(
  ( (Nil!10232) (Cons!10231 (h!11162 (_ BitVec 64)) (t!16463 List!10235)) )
))
(declare-fun arrayNoDuplicates!0 (array!33451 (_ BitVec 32) List!10235) Bool)

(assert (=> b!526896 (= res!323457 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10232))))

(declare-fun b!526897 () Bool)

(declare-fun e!307091 () Bool)

(assert (=> b!526897 (= e!307091 false)))

(declare-fun b!526898 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33451 (_ BitVec 32)) SeekEntryResult!4544)

(assert (=> b!526898 (= e!307088 (= (seekEntryOrOpen!0 (select (arr!16077 a!3235) j!176) a!3235 mask!3524) (Found!4544 j!176)))))

(declare-fun b!526899 () Bool)

(declare-fun res!323462 () Bool)

(assert (=> b!526899 (=> (not res!323462) (not e!307092))))

(assert (=> b!526899 (= res!323462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526900 () Bool)

(declare-fun e!307087 () Unit!16628)

(declare-fun Unit!16630 () Unit!16628)

(assert (=> b!526900 (= e!307087 Unit!16630)))

(declare-fun b!526901 () Bool)

(assert (=> b!526901 (= e!307086 e!307092)))

(declare-fun res!323452 () Bool)

(assert (=> b!526901 (=> (not res!323452) (not e!307092))))

(declare-fun lt!242439 () SeekEntryResult!4544)

(assert (=> b!526901 (= res!323452 (or (= lt!242439 (MissingZero!4544 i!1204)) (= lt!242439 (MissingVacant!4544 i!1204))))))

(assert (=> b!526901 (= lt!242439 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526903 () Bool)

(declare-fun res!323456 () Bool)

(assert (=> b!526903 (=> res!323456 e!307089)))

(assert (=> b!526903 (= res!323456 (or (undefined!5356 lt!242437) (not (is-Intermediate!4544 lt!242437))))))

(declare-fun b!526904 () Bool)

(declare-fun res!323460 () Bool)

(assert (=> b!526904 (=> (not res!323460) (not e!307086))))

(assert (=> b!526904 (= res!323460 (and (= (size!16441 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16441 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526905 () Bool)

(assert (=> b!526905 (= e!307089 (or (bvsgt (x!49357 lt!242437) #b01111111111111111111111111111110) (and (bvsge lt!242438 #b00000000000000000000000000000000) (bvslt lt!242438 (size!16441 a!3235)))))))

(assert (=> b!526905 (= (index!20390 lt!242437) i!1204)))

(declare-fun lt!242441 () Unit!16628)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> b!526905 (= lt!242441 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524))))

(assert (=> b!526905 (and (or (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242435 () Unit!16628)

(assert (=> b!526905 (= lt!242435 e!307087)))

(declare-fun c!62027 () Bool)

(assert (=> b!526905 (= c!62027 (= (select (arr!16077 a!3235) (index!20390 lt!242437)) (select (arr!16077 a!3235) j!176)))))

(assert (=> b!526905 (and (bvslt (x!49357 lt!242437) #b01111111111111111111111111111110) (or (= (select (arr!16077 a!3235) (index!20390 lt!242437)) (select (arr!16077 a!3235) j!176)) (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16077 a!3235) (index!20390 lt!242437)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526906 () Bool)

(declare-fun res!323454 () Bool)

(assert (=> b!526906 (=> (not res!323454) (not e!307086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526906 (= res!323454 (validKeyInArray!0 k!2280))))

(declare-fun b!526907 () Bool)

(declare-fun Unit!16631 () Unit!16628)

(assert (=> b!526907 (= e!307087 Unit!16631)))

(declare-fun lt!242436 () Unit!16628)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> b!526907 (= lt!242436 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524))))

(declare-fun res!323451 () Bool)

(assert (=> b!526907 (= res!323451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242438 lt!242443 lt!242434 mask!3524) (Intermediate!4544 false (index!20390 lt!242437) (x!49357 lt!242437))))))

(assert (=> b!526907 (=> (not res!323451) (not e!307091))))

(assert (=> b!526907 e!307091))

(declare-fun b!526902 () Bool)

(declare-fun res!323458 () Bool)

(assert (=> b!526902 (=> (not res!323458) (not e!307086))))

(assert (=> b!526902 (= res!323458 (validKeyInArray!0 (select (arr!16077 a!3235) j!176)))))

(declare-fun res!323455 () Bool)

(assert (=> start!47814 (=> (not res!323455) (not e!307086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47814 (= res!323455 (validMask!0 mask!3524))))

(assert (=> start!47814 e!307086))

(assert (=> start!47814 true))

(declare-fun array_inv!11873 (array!33451) Bool)

(assert (=> start!47814 (array_inv!11873 a!3235)))

(assert (= (and start!47814 res!323455) b!526904))

(assert (= (and b!526904 res!323460) b!526902))

(assert (= (and b!526902 res!323458) b!526906))

(assert (= (and b!526906 res!323454) b!526894))

(assert (= (and b!526894 res!323461) b!526901))

(assert (= (and b!526901 res!323452) b!526899))

(assert (= (and b!526899 res!323462) b!526896))

(assert (= (and b!526896 res!323457) b!526895))

(assert (= (and b!526895 res!323459) b!526898))

(assert (= (and b!526895 (not res!323453)) b!526903))

(assert (= (and b!526903 (not res!323456)) b!526905))

(assert (= (and b!526905 c!62027) b!526907))

(assert (= (and b!526905 (not c!62027)) b!526900))

(assert (= (and b!526907 res!323451) b!526897))

(declare-fun m!507621 () Bool)

(assert (=> b!526899 m!507621))

(declare-fun m!507623 () Bool)

(assert (=> b!526906 m!507623))

(declare-fun m!507625 () Bool)

(assert (=> b!526902 m!507625))

(assert (=> b!526902 m!507625))

(declare-fun m!507627 () Bool)

(assert (=> b!526902 m!507627))

(declare-fun m!507629 () Bool)

(assert (=> b!526905 m!507629))

(declare-fun m!507631 () Bool)

(assert (=> b!526905 m!507631))

(assert (=> b!526905 m!507625))

(declare-fun m!507633 () Bool)

(assert (=> b!526895 m!507633))

(declare-fun m!507635 () Bool)

(assert (=> b!526895 m!507635))

(declare-fun m!507637 () Bool)

(assert (=> b!526895 m!507637))

(declare-fun m!507639 () Bool)

(assert (=> b!526895 m!507639))

(assert (=> b!526895 m!507625))

(declare-fun m!507641 () Bool)

(assert (=> b!526895 m!507641))

(assert (=> b!526895 m!507625))

(declare-fun m!507643 () Bool)

(assert (=> b!526895 m!507643))

(assert (=> b!526895 m!507625))

(declare-fun m!507645 () Bool)

(assert (=> b!526895 m!507645))

(declare-fun m!507647 () Bool)

(assert (=> b!526895 m!507647))

(assert (=> b!526898 m!507625))

(assert (=> b!526898 m!507625))

(declare-fun m!507649 () Bool)

(assert (=> b!526898 m!507649))

(declare-fun m!507651 () Bool)

(assert (=> start!47814 m!507651))

(declare-fun m!507653 () Bool)

(assert (=> start!47814 m!507653))

(declare-fun m!507655 () Bool)

(assert (=> b!526907 m!507655))

(declare-fun m!507657 () Bool)

(assert (=> b!526907 m!507657))

(declare-fun m!507659 () Bool)

(assert (=> b!526901 m!507659))

(declare-fun m!507661 () Bool)

(assert (=> b!526894 m!507661))

(declare-fun m!507663 () Bool)

(assert (=> b!526896 m!507663))

(push 1)

(assert (not b!526906))

(assert (not b!526894))

(assert (not b!526898))

(assert (not b!526905))

(assert (not b!526896))

(assert (not b!526902))

(assert (not b!526899))

(assert (not b!526901))

(assert (not b!526895))

(assert (not start!47814))

(assert (not b!526907))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!527046 () Bool)

(declare-fun c!62057 () Bool)

(declare-fun lt!242539 () (_ BitVec 64))

(assert (=> b!527046 (= c!62057 (= lt!242539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307169 () SeekEntryResult!4544)

(declare-fun e!307170 () SeekEntryResult!4544)

(assert (=> b!527046 (= e!307169 e!307170)))

(declare-fun d!80773 () Bool)

(declare-fun lt!242538 () SeekEntryResult!4544)

(assert (=> d!80773 (and (or (is-Undefined!4544 lt!242538) (not (is-Found!4544 lt!242538)) (and (bvsge (index!20389 lt!242538) #b00000000000000000000000000000000) (bvslt (index!20389 lt!242538) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242538) (is-Found!4544 lt!242538) (not (is-MissingZero!4544 lt!242538)) (and (bvsge (index!20388 lt!242538) #b00000000000000000000000000000000) (bvslt (index!20388 lt!242538) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242538) (is-Found!4544 lt!242538) (is-MissingZero!4544 lt!242538) (not (is-MissingVacant!4544 lt!242538)) (and (bvsge (index!20391 lt!242538) #b00000000000000000000000000000000) (bvslt (index!20391 lt!242538) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242538) (ite (is-Found!4544 lt!242538) (= (select (arr!16077 a!3235) (index!20389 lt!242538)) (select (arr!16077 a!3235) j!176)) (ite (is-MissingZero!4544 lt!242538) (= (select (arr!16077 a!3235) (index!20388 lt!242538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4544 lt!242538) (= (select (arr!16077 a!3235) (index!20391 lt!242538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307168 () SeekEntryResult!4544)

(assert (=> d!80773 (= lt!242538 e!307168)))

(declare-fun c!62055 () Bool)

(declare-fun lt!242537 () SeekEntryResult!4544)

(assert (=> d!80773 (= c!62055 (and (is-Intermediate!4544 lt!242537) (undefined!5356 lt!242537)))))

(assert (=> d!80773 (= lt!242537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16077 a!3235) j!176) mask!3524) (select (arr!16077 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80773 (validMask!0 mask!3524)))

(assert (=> d!80773 (= (seekEntryOrOpen!0 (select (arr!16077 a!3235) j!176) a!3235 mask!3524) lt!242538)))

(declare-fun b!527047 () Bool)

(assert (=> b!527047 (= e!307168 e!307169)))

(assert (=> b!527047 (= lt!242539 (select (arr!16077 a!3235) (index!20390 lt!242537)))))

(declare-fun c!62056 () Bool)

(assert (=> b!527047 (= c!62056 (= lt!242539 (select (arr!16077 a!3235) j!176)))))

(declare-fun b!527048 () Bool)

(assert (=> b!527048 (= e!307168 Undefined!4544)))

(declare-fun b!527049 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33451 (_ BitVec 32)) SeekEntryResult!4544)

(assert (=> b!527049 (= e!307170 (seekKeyOrZeroReturnVacant!0 (x!49357 lt!242537) (index!20390 lt!242537) (index!20390 lt!242537) (select (arr!16077 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527050 () Bool)

(assert (=> b!527050 (= e!307170 (MissingZero!4544 (index!20390 lt!242537)))))

(declare-fun b!527051 () Bool)

(assert (=> b!527051 (= e!307169 (Found!4544 (index!20390 lt!242537)))))

(assert (= (and d!80773 c!62055) b!527048))

(assert (= (and d!80773 (not c!62055)) b!527047))

(assert (= (and b!527047 c!62056) b!527051))

(assert (= (and b!527047 (not c!62056)) b!527046))

(assert (= (and b!527046 c!62057) b!527050))

(assert (= (and b!527046 (not c!62057)) b!527049))

(assert (=> d!80773 m!507651))

(assert (=> d!80773 m!507625))

(assert (=> d!80773 m!507641))

(declare-fun m!507797 () Bool)

(assert (=> d!80773 m!507797))

(assert (=> d!80773 m!507641))

(assert (=> d!80773 m!507625))

(declare-fun m!507799 () Bool)

(assert (=> d!80773 m!507799))

(declare-fun m!507801 () Bool)

(assert (=> d!80773 m!507801))

(declare-fun m!507803 () Bool)

(assert (=> d!80773 m!507803))

(declare-fun m!507805 () Bool)

(assert (=> b!527047 m!507805))

(assert (=> b!527049 m!507625))

(declare-fun m!507807 () Bool)

(assert (=> b!527049 m!507807))

(assert (=> b!526898 d!80773))

(declare-fun b!527083 () Bool)

(declare-fun e!307197 () Bool)

(declare-fun call!31882 () Bool)

(assert (=> b!527083 (= e!307197 call!31882)))

(declare-fun d!80793 () Bool)

(declare-fun res!323565 () Bool)

(declare-fun e!307196 () Bool)

(assert (=> d!80793 (=> res!323565 e!307196)))

(assert (=> d!80793 (= res!323565 (bvsge #b00000000000000000000000000000000 (size!16441 a!3235)))))

(assert (=> d!80793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307196)))

(declare-fun bm!31879 () Bool)

(assert (=> bm!31879 (= call!31882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!527084 () Bool)

(assert (=> b!527084 (= e!307196 e!307197)))

(declare-fun c!62065 () Bool)

(assert (=> b!527084 (= c!62065 (validKeyInArray!0 (select (arr!16077 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527085 () Bool)

(declare-fun e!307195 () Bool)

(assert (=> b!527085 (= e!307195 call!31882)))

(declare-fun b!527086 () Bool)

(assert (=> b!527086 (= e!307197 e!307195)))

(declare-fun lt!242553 () (_ BitVec 64))

(assert (=> b!527086 (= lt!242553 (select (arr!16077 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!242552 () Unit!16628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33451 (_ BitVec 64) (_ BitVec 32)) Unit!16628)

(assert (=> b!527086 (= lt!242552 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242553 #b00000000000000000000000000000000))))

(assert (=> b!527086 (arrayContainsKey!0 a!3235 lt!242553 #b00000000000000000000000000000000)))

(declare-fun lt!242554 () Unit!16628)

(assert (=> b!527086 (= lt!242554 lt!242552)))

(declare-fun res!323564 () Bool)

(assert (=> b!527086 (= res!323564 (= (seekEntryOrOpen!0 (select (arr!16077 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4544 #b00000000000000000000000000000000)))))

(assert (=> b!527086 (=> (not res!323564) (not e!307195))))

(assert (= (and d!80793 (not res!323565)) b!527084))

(assert (= (and b!527084 c!62065) b!527086))

(assert (= (and b!527084 (not c!62065)) b!527083))

(assert (= (and b!527086 res!323564) b!527085))

(assert (= (or b!527085 b!527083) bm!31879))

(declare-fun m!507813 () Bool)

(assert (=> bm!31879 m!507813))

(declare-fun m!507815 () Bool)

(assert (=> b!527084 m!507815))

(assert (=> b!527084 m!507815))

(declare-fun m!507817 () Bool)

(assert (=> b!527084 m!507817))

(assert (=> b!527086 m!507815))

(declare-fun m!507819 () Bool)

(assert (=> b!527086 m!507819))

(declare-fun m!507821 () Bool)

(assert (=> b!527086 m!507821))

(assert (=> b!527086 m!507815))

(declare-fun m!507823 () Bool)

(assert (=> b!527086 m!507823))

(assert (=> b!526899 d!80793))

(declare-fun d!80799 () Bool)

(declare-fun res!323576 () Bool)

(declare-fun e!307209 () Bool)

(assert (=> d!80799 (=> res!323576 e!307209)))

(assert (=> d!80799 (= res!323576 (= (select (arr!16077 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80799 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!307209)))

(declare-fun b!527099 () Bool)

(declare-fun e!307210 () Bool)

(assert (=> b!527099 (= e!307209 e!307210)))

(declare-fun res!323577 () Bool)

(assert (=> b!527099 (=> (not res!323577) (not e!307210))))

(assert (=> b!527099 (= res!323577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16441 a!3235)))))

(declare-fun b!527100 () Bool)

(assert (=> b!527100 (= e!307210 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80799 (not res!323576)) b!527099))

(assert (= (and b!527099 res!323577) b!527100))

(assert (=> d!80799 m!507815))

(declare-fun m!507837 () Bool)

(assert (=> b!527100 m!507837))

(assert (=> b!526894 d!80799))

(declare-fun d!80803 () Bool)

(assert (=> d!80803 (= (index!20390 lt!242437) i!1204)))

(declare-fun lt!242560 () Unit!16628)

(declare-fun choose!104 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> d!80803 (= lt!242560 (choose!104 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524))))

(assert (=> d!80803 (validMask!0 mask!3524)))

(assert (=> d!80803 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524) lt!242560)))

(declare-fun bs!16527 () Bool)

(assert (= bs!16527 d!80803))

(declare-fun m!507841 () Bool)

(assert (=> bs!16527 m!507841))

(assert (=> bs!16527 m!507651))

(assert (=> b!526905 d!80803))

(declare-fun d!80807 () Bool)

(declare-fun lt!242566 () (_ BitVec 32))

(declare-fun lt!242565 () (_ BitVec 32))

(assert (=> d!80807 (= lt!242566 (bvmul (bvxor lt!242565 (bvlshr lt!242565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80807 (= lt!242565 ((_ extract 31 0) (bvand (bvxor lt!242443 (bvlshr lt!242443 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80807 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323580 (let ((h!11165 ((_ extract 31 0) (bvand (bvxor lt!242443 (bvlshr lt!242443 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49363 (bvmul (bvxor h!11165 (bvlshr h!11165 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49363 (bvlshr x!49363 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323580 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323580 #b00000000000000000000000000000000))))))

(assert (=> d!80807 (= (toIndex!0 lt!242443 mask!3524) (bvand (bvxor lt!242566 (bvlshr lt!242566 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526895 d!80807))

(declare-fun d!80813 () Bool)

(declare-fun lt!242568 () (_ BitVec 32))

(declare-fun lt!242567 () (_ BitVec 32))

(assert (=> d!80813 (= lt!242568 (bvmul (bvxor lt!242567 (bvlshr lt!242567 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80813 (= lt!242567 ((_ extract 31 0) (bvand (bvxor (select (arr!16077 a!3235) j!176) (bvlshr (select (arr!16077 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80813 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323580 (let ((h!11165 ((_ extract 31 0) (bvand (bvxor (select (arr!16077 a!3235) j!176) (bvlshr (select (arr!16077 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49363 (bvmul (bvxor h!11165 (bvlshr h!11165 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49363 (bvlshr x!49363 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323580 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323580 #b00000000000000000000000000000000))))))

(assert (=> d!80813 (= (toIndex!0 (select (arr!16077 a!3235) j!176) mask!3524) (bvand (bvxor lt!242568 (bvlshr lt!242568 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526895 d!80813))

(declare-fun b!527103 () Bool)

(declare-fun e!307215 () Bool)

(declare-fun call!31884 () Bool)

(assert (=> b!527103 (= e!307215 call!31884)))

(declare-fun d!80815 () Bool)

(declare-fun res!323582 () Bool)

(declare-fun e!307214 () Bool)

(assert (=> d!80815 (=> res!323582 e!307214)))

(assert (=> d!80815 (= res!323582 (bvsge j!176 (size!16441 a!3235)))))

(assert (=> d!80815 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307214)))

(declare-fun bm!31881 () Bool)

(assert (=> bm!31881 (= call!31884 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!527104 () Bool)

(assert (=> b!527104 (= e!307214 e!307215)))

(declare-fun c!62067 () Bool)

(assert (=> b!527104 (= c!62067 (validKeyInArray!0 (select (arr!16077 a!3235) j!176)))))

(declare-fun b!527105 () Bool)

(declare-fun e!307213 () Bool)

(assert (=> b!527105 (= e!307213 call!31884)))

(declare-fun b!527106 () Bool)

(assert (=> b!527106 (= e!307215 e!307213)))

(declare-fun lt!242570 () (_ BitVec 64))

(assert (=> b!527106 (= lt!242570 (select (arr!16077 a!3235) j!176))))

(declare-fun lt!242569 () Unit!16628)

(assert (=> b!527106 (= lt!242569 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242570 j!176))))

(assert (=> b!527106 (arrayContainsKey!0 a!3235 lt!242570 #b00000000000000000000000000000000)))

(declare-fun lt!242571 () Unit!16628)

(assert (=> b!527106 (= lt!242571 lt!242569)))

(declare-fun res!323581 () Bool)

(assert (=> b!527106 (= res!323581 (= (seekEntryOrOpen!0 (select (arr!16077 a!3235) j!176) a!3235 mask!3524) (Found!4544 j!176)))))

(assert (=> b!527106 (=> (not res!323581) (not e!307213))))

(assert (= (and d!80815 (not res!323582)) b!527104))

(assert (= (and b!527104 c!62067) b!527106))

(assert (= (and b!527104 (not c!62067)) b!527103))

(assert (= (and b!527106 res!323581) b!527105))

(assert (= (or b!527105 b!527103) bm!31881))

(declare-fun m!507843 () Bool)

(assert (=> bm!31881 m!507843))

(assert (=> b!527104 m!507625))

(assert (=> b!527104 m!507625))

(assert (=> b!527104 m!507627))

(assert (=> b!527106 m!507625))

(declare-fun m!507845 () Bool)

(assert (=> b!527106 m!507845))

(declare-fun m!507847 () Bool)

(assert (=> b!527106 m!507847))

(assert (=> b!527106 m!507625))

(assert (=> b!527106 m!507649))

(assert (=> b!526895 d!80815))

(declare-fun d!80817 () Bool)

(assert (=> d!80817 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242574 () Unit!16628)

(declare-fun choose!38 (array!33451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> d!80817 (= lt!242574 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80817 (validMask!0 mask!3524)))

(assert (=> d!80817 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242574)))

(declare-fun bs!16528 () Bool)

(assert (= bs!16528 d!80817))

(assert (=> bs!16528 m!507643))

(declare-fun m!507849 () Bool)

(assert (=> bs!16528 m!507849))

(assert (=> bs!16528 m!507651))

(assert (=> b!526895 d!80817))

(declare-fun b!527146 () Bool)

(declare-fun lt!242592 () SeekEntryResult!4544)

(assert (=> b!527146 (and (bvsge (index!20390 lt!242592) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242592) (size!16441 a!3235)))))

(declare-fun e!307240 () Bool)

(assert (=> b!527146 (= e!307240 (= (select (arr!16077 a!3235) (index!20390 lt!242592)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80819 () Bool)

(declare-fun e!307238 () Bool)

(assert (=> d!80819 e!307238))

(declare-fun c!62084 () Bool)

(assert (=> d!80819 (= c!62084 (and (is-Intermediate!4544 lt!242592) (undefined!5356 lt!242592)))))

(declare-fun e!307242 () SeekEntryResult!4544)

(assert (=> d!80819 (= lt!242592 e!307242)))

(declare-fun c!62085 () Bool)

(assert (=> d!80819 (= c!62085 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242591 () (_ BitVec 64))

(assert (=> d!80819 (= lt!242591 (select (arr!16077 a!3235) lt!242438))))

(assert (=> d!80819 (validMask!0 mask!3524)))

(assert (=> d!80819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242438 (select (arr!16077 a!3235) j!176) a!3235 mask!3524) lt!242592)))

(declare-fun b!527147 () Bool)

(declare-fun e!307239 () Bool)

(assert (=> b!527147 (= e!307238 e!307239)))

(declare-fun res!323594 () Bool)

(assert (=> b!527147 (= res!323594 (and (is-Intermediate!4544 lt!242592) (not (undefined!5356 lt!242592)) (bvslt (x!49357 lt!242592) #b01111111111111111111111111111110) (bvsge (x!49357 lt!242592) #b00000000000000000000000000000000) (bvsge (x!49357 lt!242592) #b00000000000000000000000000000000)))))

(assert (=> b!527147 (=> (not res!323594) (not e!307239))))

(declare-fun b!527148 () Bool)

(assert (=> b!527148 (and (bvsge (index!20390 lt!242592) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242592) (size!16441 a!3235)))))

(declare-fun res!323593 () Bool)

(assert (=> b!527148 (= res!323593 (= (select (arr!16077 a!3235) (index!20390 lt!242592)) (select (arr!16077 a!3235) j!176)))))

(assert (=> b!527148 (=> res!323593 e!307240)))

(assert (=> b!527148 (= e!307239 e!307240)))

(declare-fun b!527149 () Bool)

(declare-fun e!307241 () SeekEntryResult!4544)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527149 (= e!307241 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242438 #b00000000000000000000000000000000 mask!3524) (select (arr!16077 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527150 () Bool)

(assert (=> b!527150 (= e!307242 e!307241)))

(declare-fun c!62083 () Bool)

(assert (=> b!527150 (= c!62083 (or (= lt!242591 (select (arr!16077 a!3235) j!176)) (= (bvadd lt!242591 lt!242591) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527151 () Bool)

(assert (=> b!527151 (and (bvsge (index!20390 lt!242592) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242592) (size!16441 a!3235)))))

(declare-fun res!323592 () Bool)

(assert (=> b!527151 (= res!323592 (= (select (arr!16077 a!3235) (index!20390 lt!242592)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527151 (=> res!323592 e!307240)))

(declare-fun b!527152 () Bool)

(assert (=> b!527152 (= e!307242 (Intermediate!4544 true lt!242438 #b00000000000000000000000000000000))))

(declare-fun b!527153 () Bool)

(assert (=> b!527153 (= e!307238 (bvsge (x!49357 lt!242592) #b01111111111111111111111111111110))))

(declare-fun b!527154 () Bool)

(assert (=> b!527154 (= e!307241 (Intermediate!4544 false lt!242438 #b00000000000000000000000000000000))))

(assert (= (and d!80819 c!62085) b!527152))

(assert (= (and d!80819 (not c!62085)) b!527150))

(assert (= (and b!527150 c!62083) b!527154))

(assert (= (and b!527150 (not c!62083)) b!527149))

(assert (= (and d!80819 c!62084) b!527153))

(assert (= (and d!80819 (not c!62084)) b!527147))

(assert (= (and b!527147 res!323594) b!527148))

(assert (= (and b!527148 (not res!323593)) b!527151))

(assert (= (and b!527151 (not res!323592)) b!527146))

(declare-fun m!507867 () Bool)

(assert (=> b!527148 m!507867))

(assert (=> b!527146 m!507867))

(declare-fun m!507869 () Bool)

(assert (=> b!527149 m!507869))

(assert (=> b!527149 m!507869))

(assert (=> b!527149 m!507625))

(declare-fun m!507871 () Bool)

(assert (=> b!527149 m!507871))

(assert (=> b!527151 m!507867))

(declare-fun m!507873 () Bool)

(assert (=> d!80819 m!507873))

(assert (=> d!80819 m!507651))

(assert (=> b!526895 d!80819))

(declare-fun b!527155 () Bool)

(declare-fun lt!242594 () SeekEntryResult!4544)

(assert (=> b!527155 (and (bvsge (index!20390 lt!242594) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242594) (size!16441 lt!242434)))))

(declare-fun e!307245 () Bool)

(assert (=> b!527155 (= e!307245 (= (select (arr!16077 lt!242434) (index!20390 lt!242594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80825 () Bool)

(declare-fun e!307243 () Bool)

(assert (=> d!80825 e!307243))

(declare-fun c!62087 () Bool)

(assert (=> d!80825 (= c!62087 (and (is-Intermediate!4544 lt!242594) (undefined!5356 lt!242594)))))

(declare-fun e!307247 () SeekEntryResult!4544)

(assert (=> d!80825 (= lt!242594 e!307247)))

(declare-fun c!62088 () Bool)

(assert (=> d!80825 (= c!62088 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242593 () (_ BitVec 64))

(assert (=> d!80825 (= lt!242593 (select (arr!16077 lt!242434) lt!242442))))

(assert (=> d!80825 (validMask!0 mask!3524)))

(assert (=> d!80825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242442 lt!242443 lt!242434 mask!3524) lt!242594)))

(declare-fun b!527156 () Bool)

(declare-fun e!307244 () Bool)

(assert (=> b!527156 (= e!307243 e!307244)))

(declare-fun res!323597 () Bool)

(assert (=> b!527156 (= res!323597 (and (is-Intermediate!4544 lt!242594) (not (undefined!5356 lt!242594)) (bvslt (x!49357 lt!242594) #b01111111111111111111111111111110) (bvsge (x!49357 lt!242594) #b00000000000000000000000000000000) (bvsge (x!49357 lt!242594) #b00000000000000000000000000000000)))))

(assert (=> b!527156 (=> (not res!323597) (not e!307244))))

(declare-fun b!527157 () Bool)

(assert (=> b!527157 (and (bvsge (index!20390 lt!242594) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242594) (size!16441 lt!242434)))))

(declare-fun res!323596 () Bool)

(assert (=> b!527157 (= res!323596 (= (select (arr!16077 lt!242434) (index!20390 lt!242594)) lt!242443))))

(assert (=> b!527157 (=> res!323596 e!307245)))

(assert (=> b!527157 (= e!307244 e!307245)))

(declare-fun b!527158 () Bool)

(declare-fun e!307246 () SeekEntryResult!4544)

(assert (=> b!527158 (= e!307246 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242442 #b00000000000000000000000000000000 mask!3524) lt!242443 lt!242434 mask!3524))))

(declare-fun b!527159 () Bool)

(assert (=> b!527159 (= e!307247 e!307246)))

(declare-fun c!62086 () Bool)

(assert (=> b!527159 (= c!62086 (or (= lt!242593 lt!242443) (= (bvadd lt!242593 lt!242593) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527160 () Bool)

(assert (=> b!527160 (and (bvsge (index!20390 lt!242594) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242594) (size!16441 lt!242434)))))

(declare-fun res!323595 () Bool)

(assert (=> b!527160 (= res!323595 (= (select (arr!16077 lt!242434) (index!20390 lt!242594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527160 (=> res!323595 e!307245)))

(declare-fun b!527161 () Bool)

(assert (=> b!527161 (= e!307247 (Intermediate!4544 true lt!242442 #b00000000000000000000000000000000))))

(declare-fun b!527162 () Bool)

(assert (=> b!527162 (= e!307243 (bvsge (x!49357 lt!242594) #b01111111111111111111111111111110))))

(declare-fun b!527163 () Bool)

(assert (=> b!527163 (= e!307246 (Intermediate!4544 false lt!242442 #b00000000000000000000000000000000))))

(assert (= (and d!80825 c!62088) b!527161))

(assert (= (and d!80825 (not c!62088)) b!527159))

(assert (= (and b!527159 c!62086) b!527163))

(assert (= (and b!527159 (not c!62086)) b!527158))

(assert (= (and d!80825 c!62087) b!527162))

(assert (= (and d!80825 (not c!62087)) b!527156))

(assert (= (and b!527156 res!323597) b!527157))

(assert (= (and b!527157 (not res!323596)) b!527160))

(assert (= (and b!527160 (not res!323595)) b!527155))

(declare-fun m!507875 () Bool)

(assert (=> b!527157 m!507875))

(assert (=> b!527155 m!507875))

(declare-fun m!507877 () Bool)

(assert (=> b!527158 m!507877))

(assert (=> b!527158 m!507877))

(declare-fun m!507879 () Bool)

(assert (=> b!527158 m!507879))

(assert (=> b!527160 m!507875))

(declare-fun m!507881 () Bool)

(assert (=> d!80825 m!507881))

(assert (=> d!80825 m!507651))

(assert (=> b!526895 d!80825))

(declare-fun d!80827 () Bool)

(assert (=> d!80827 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526906 d!80827))

(declare-fun b!527166 () Bool)

(declare-fun c!62091 () Bool)

(declare-fun lt!242601 () (_ BitVec 64))

(assert (=> b!527166 (= c!62091 (= lt!242601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307249 () SeekEntryResult!4544)

(declare-fun e!307250 () SeekEntryResult!4544)

(assert (=> b!527166 (= e!307249 e!307250)))

(declare-fun d!80829 () Bool)

(declare-fun lt!242600 () SeekEntryResult!4544)

(assert (=> d!80829 (and (or (is-Undefined!4544 lt!242600) (not (is-Found!4544 lt!242600)) (and (bvsge (index!20389 lt!242600) #b00000000000000000000000000000000) (bvslt (index!20389 lt!242600) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242600) (is-Found!4544 lt!242600) (not (is-MissingZero!4544 lt!242600)) (and (bvsge (index!20388 lt!242600) #b00000000000000000000000000000000) (bvslt (index!20388 lt!242600) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242600) (is-Found!4544 lt!242600) (is-MissingZero!4544 lt!242600) (not (is-MissingVacant!4544 lt!242600)) (and (bvsge (index!20391 lt!242600) #b00000000000000000000000000000000) (bvslt (index!20391 lt!242600) (size!16441 a!3235)))) (or (is-Undefined!4544 lt!242600) (ite (is-Found!4544 lt!242600) (= (select (arr!16077 a!3235) (index!20389 lt!242600)) k!2280) (ite (is-MissingZero!4544 lt!242600) (= (select (arr!16077 a!3235) (index!20388 lt!242600)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4544 lt!242600) (= (select (arr!16077 a!3235) (index!20391 lt!242600)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!307248 () SeekEntryResult!4544)

(assert (=> d!80829 (= lt!242600 e!307248)))

(declare-fun c!62089 () Bool)

(declare-fun lt!242599 () SeekEntryResult!4544)

(assert (=> d!80829 (= c!62089 (and (is-Intermediate!4544 lt!242599) (undefined!5356 lt!242599)))))

(assert (=> d!80829 (= lt!242599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80829 (validMask!0 mask!3524)))

(assert (=> d!80829 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!242600)))

(declare-fun b!527167 () Bool)

(assert (=> b!527167 (= e!307248 e!307249)))

(assert (=> b!527167 (= lt!242601 (select (arr!16077 a!3235) (index!20390 lt!242599)))))

(declare-fun c!62090 () Bool)

(assert (=> b!527167 (= c!62090 (= lt!242601 k!2280))))

(declare-fun b!527168 () Bool)

(assert (=> b!527168 (= e!307248 Undefined!4544)))

(declare-fun b!527169 () Bool)

(assert (=> b!527169 (= e!307250 (seekKeyOrZeroReturnVacant!0 (x!49357 lt!242599) (index!20390 lt!242599) (index!20390 lt!242599) k!2280 a!3235 mask!3524))))

(declare-fun b!527170 () Bool)

(assert (=> b!527170 (= e!307250 (MissingZero!4544 (index!20390 lt!242599)))))

(declare-fun b!527171 () Bool)

(assert (=> b!527171 (= e!307249 (Found!4544 (index!20390 lt!242599)))))

(assert (= (and d!80829 c!62089) b!527168))

(assert (= (and d!80829 (not c!62089)) b!527167))

(assert (= (and b!527167 c!62090) b!527171))

(assert (= (and b!527167 (not c!62090)) b!527166))

(assert (= (and b!527166 c!62091) b!527170))

(assert (= (and b!527166 (not c!62091)) b!527169))

(assert (=> d!80829 m!507651))

(declare-fun m!507883 () Bool)

(assert (=> d!80829 m!507883))

(declare-fun m!507885 () Bool)

(assert (=> d!80829 m!507885))

(assert (=> d!80829 m!507883))

(declare-fun m!507887 () Bool)

(assert (=> d!80829 m!507887))

(declare-fun m!507889 () Bool)

(assert (=> d!80829 m!507889))

(declare-fun m!507891 () Bool)

(assert (=> d!80829 m!507891))

(declare-fun m!507893 () Bool)

(assert (=> b!527167 m!507893))

(declare-fun m!507895 () Bool)

(assert (=> b!527169 m!507895))

(assert (=> b!526901 d!80829))

(declare-fun b!527225 () Bool)

(declare-fun e!307285 () Bool)

(declare-fun call!31887 () Bool)

(assert (=> b!527225 (= e!307285 call!31887)))

(declare-fun b!527226 () Bool)

(declare-fun e!307286 () Bool)

(declare-fun e!307284 () Bool)

(assert (=> b!527226 (= e!307286 e!307284)))

(declare-fun res!323620 () Bool)

(assert (=> b!527226 (=> (not res!323620) (not e!307284))))

(declare-fun e!307287 () Bool)

(assert (=> b!527226 (= res!323620 (not e!307287))))

(declare-fun res!323622 () Bool)

(assert (=> b!527226 (=> (not res!323622) (not e!307287))))

(assert (=> b!527226 (= res!323622 (validKeyInArray!0 (select (arr!16077 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80831 () Bool)

(declare-fun res!323621 () Bool)

(assert (=> d!80831 (=> res!323621 e!307286)))

(assert (=> d!80831 (= res!323621 (bvsge #b00000000000000000000000000000000 (size!16441 a!3235)))))

(assert (=> d!80831 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10232) e!307286)))

(declare-fun b!527227 () Bool)

(declare-fun contains!2774 (List!10235 (_ BitVec 64)) Bool)

(assert (=> b!527227 (= e!307287 (contains!2774 Nil!10232 (select (arr!16077 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31884 () Bool)

(declare-fun c!62109 () Bool)

(assert (=> bm!31884 (= call!31887 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62109 (Cons!10231 (select (arr!16077 a!3235) #b00000000000000000000000000000000) Nil!10232) Nil!10232)))))

(declare-fun b!527228 () Bool)

(assert (=> b!527228 (= e!307285 call!31887)))

(declare-fun b!527229 () Bool)

(assert (=> b!527229 (= e!307284 e!307285)))

(assert (=> b!527229 (= c!62109 (validKeyInArray!0 (select (arr!16077 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80831 (not res!323621)) b!527226))

(assert (= (and b!527226 res!323622) b!527227))

(assert (= (and b!527226 res!323620) b!527229))

(assert (= (and b!527229 c!62109) b!527225))

(assert (= (and b!527229 (not c!62109)) b!527228))

(assert (= (or b!527225 b!527228) bm!31884))

(assert (=> b!527226 m!507815))

(assert (=> b!527226 m!507815))

(assert (=> b!527226 m!507817))

(assert (=> b!527227 m!507815))

(assert (=> b!527227 m!507815))

(declare-fun m!507905 () Bool)

(assert (=> b!527227 m!507905))

(assert (=> bm!31884 m!507815))

(declare-fun m!507907 () Bool)

(assert (=> bm!31884 m!507907))

(assert (=> b!527229 m!507815))

(assert (=> b!527229 m!507815))

(assert (=> b!527229 m!507817))

(assert (=> b!526896 d!80831))

(declare-fun d!80835 () Bool)

(declare-fun e!307311 () Bool)

(assert (=> d!80835 e!307311))

(declare-fun res!323637 () Bool)

(assert (=> d!80835 (=> (not res!323637) (not e!307311))))

(assert (=> d!80835 (= res!323637 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16441 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16441 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16441 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16441 a!3235))))))

(declare-fun lt!242639 () Unit!16628)

(declare-fun choose!47 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16628)

(assert (=> d!80835 (= lt!242639 (choose!47 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524))))

(assert (=> d!80835 (validMask!0 mask!3524)))

(assert (=> d!80835 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242438 #b00000000000000000000000000000000 (index!20390 lt!242437) (x!49357 lt!242437) mask!3524) lt!242639)))

(declare-fun b!527269 () Bool)

(assert (=> b!527269 (= e!307311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242438 (select (store (arr!16077 a!3235) i!1204 k!2280) j!176) (array!33452 (store (arr!16077 a!3235) i!1204 k!2280) (size!16441 a!3235)) mask!3524) (Intermediate!4544 false (index!20390 lt!242437) (x!49357 lt!242437))))))

(assert (= (and d!80835 res!323637) b!527269))

(declare-fun m!507955 () Bool)

(assert (=> d!80835 m!507955))

(assert (=> d!80835 m!507651))

(assert (=> b!527269 m!507633))

(assert (=> b!527269 m!507639))

(assert (=> b!527269 m!507639))

(declare-fun m!507959 () Bool)

(assert (=> b!527269 m!507959))

(assert (=> b!526907 d!80835))

(declare-fun b!527274 () Bool)

(declare-fun lt!242644 () SeekEntryResult!4544)

(assert (=> b!527274 (and (bvsge (index!20390 lt!242644) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242644) (size!16441 lt!242434)))))

(declare-fun e!307317 () Bool)

(assert (=> b!527274 (= e!307317 (= (select (arr!16077 lt!242434) (index!20390 lt!242644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80859 () Bool)

(declare-fun e!307315 () Bool)

(assert (=> d!80859 e!307315))

(declare-fun c!62125 () Bool)

(assert (=> d!80859 (= c!62125 (and (is-Intermediate!4544 lt!242644) (undefined!5356 lt!242644)))))

(declare-fun e!307319 () SeekEntryResult!4544)

(assert (=> d!80859 (= lt!242644 e!307319)))

(declare-fun c!62126 () Bool)

(assert (=> d!80859 (= c!62126 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242643 () (_ BitVec 64))

(assert (=> d!80859 (= lt!242643 (select (arr!16077 lt!242434) lt!242438))))

(assert (=> d!80859 (validMask!0 mask!3524)))

(assert (=> d!80859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242438 lt!242443 lt!242434 mask!3524) lt!242644)))

(declare-fun b!527275 () Bool)

(declare-fun e!307316 () Bool)

(assert (=> b!527275 (= e!307315 e!307316)))

(declare-fun res!323642 () Bool)

(assert (=> b!527275 (= res!323642 (and (is-Intermediate!4544 lt!242644) (not (undefined!5356 lt!242644)) (bvslt (x!49357 lt!242644) #b01111111111111111111111111111110) (bvsge (x!49357 lt!242644) #b00000000000000000000000000000000) (bvsge (x!49357 lt!242644) #b00000000000000000000000000000000)))))

(assert (=> b!527275 (=> (not res!323642) (not e!307316))))

(declare-fun b!527276 () Bool)

(assert (=> b!527276 (and (bvsge (index!20390 lt!242644) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242644) (size!16441 lt!242434)))))

(declare-fun res!323641 () Bool)

(assert (=> b!527276 (= res!323641 (= (select (arr!16077 lt!242434) (index!20390 lt!242644)) lt!242443))))

(assert (=> b!527276 (=> res!323641 e!307317)))

(assert (=> b!527276 (= e!307316 e!307317)))

(declare-fun e!307318 () SeekEntryResult!4544)

(declare-fun b!527277 () Bool)

(assert (=> b!527277 (= e!307318 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242438 #b00000000000000000000000000000000 mask!3524) lt!242443 lt!242434 mask!3524))))

(declare-fun b!527278 () Bool)

(assert (=> b!527278 (= e!307319 e!307318)))

(declare-fun c!62124 () Bool)

(assert (=> b!527278 (= c!62124 (or (= lt!242643 lt!242443) (= (bvadd lt!242643 lt!242643) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527279 () Bool)

(assert (=> b!527279 (and (bvsge (index!20390 lt!242644) #b00000000000000000000000000000000) (bvslt (index!20390 lt!242644) (size!16441 lt!242434)))))

(declare-fun res!323640 () Bool)

(assert (=> b!527279 (= res!323640 (= (select (arr!16077 lt!242434) (index!20390 lt!242644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527279 (=> res!323640 e!307317)))

(declare-fun b!527280 () Bool)

(assert (=> b!527280 (= e!307319 (Intermediate!4544 true lt!242438 #b00000000000000000000000000000000))))

(declare-fun b!527281 () Bool)

(assert (=> b!527281 (= e!307315 (bvsge (x!49357 lt!242644) #b01111111111111111111111111111110))))

(declare-fun b!527282 () Bool)

(assert (=> b!527282 (= e!307318 (Intermediate!4544 false lt!242438 #b00000000000000000000000000000000))))

(assert (= (and d!80859 c!62126) b!527280))

(assert (= (and d!80859 (not c!62126)) b!527278))

(assert (= (and b!527278 c!62124) b!527282))

(assert (= (and b!527278 (not c!62124)) b!527277))

(assert (= (and d!80859 c!62125) b!527281))

(assert (= (and d!80859 (not c!62125)) b!527275))

(assert (= (and b!527275 res!323642) b!527276))

(assert (= (and b!527276 (not res!323641)) b!527279))

(assert (= (and b!527279 (not res!323640)) b!527274))

(declare-fun m!507965 () Bool)

(assert (=> b!527276 m!507965))

(assert (=> b!527274 m!507965))

(assert (=> b!527277 m!507869))

(assert (=> b!527277 m!507869))

(declare-fun m!507967 () Bool)

(assert (=> b!527277 m!507967))

(assert (=> b!527279 m!507965))

(declare-fun m!507969 () Bool)

(assert (=> d!80859 m!507969))

(assert (=> d!80859 m!507651))

(assert (=> b!526907 d!80859))

(declare-fun d!80863 () Bool)

(assert (=> d!80863 (= (validKeyInArray!0 (select (arr!16077 a!3235) j!176)) (and (not (= (select (arr!16077 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16077 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526902 d!80863))

(declare-fun d!80865 () Bool)

(assert (=> d!80865 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47814 d!80865))

(declare-fun d!80873 () Bool)

(assert (=> d!80873 (= (array_inv!11873 a!3235) (bvsge (size!16441 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47814 d!80873))

(push 1)

(assert (not bm!31881))

(assert (not b!527226))

(assert (not bm!31884))

(assert (not d!80819))

(assert (not d!80773))

(assert (not b!527229))

(assert (not b!527269))

(assert (not b!527049))

(assert (not b!527086))

(assert (not d!80825))

(assert (not d!80859))

(assert (not d!80817))

(assert (not b!527277))

(assert (not b!527169))

(assert (not b!527106))

(assert (not b!527084))

(assert (not b!527227))

(assert (not d!80835))

(assert (not d!80829))

(assert (not b!527104))

(assert (not b!527100))

(assert (not b!527158))

(assert (not b!527149))

(assert (not bm!31879))

(assert (not d!80803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

