; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122388 () Bool)

(assert start!122388)

(declare-fun b!1418496 () Bool)

(declare-fun res!954136 () Bool)

(declare-fun e!802712 () Bool)

(assert (=> b!1418496 (=> (not res!954136) (not e!802712))))

(declare-datatypes ((array!96864 0))(
  ( (array!96865 (arr!46754 (Array (_ BitVec 32) (_ BitVec 64))) (size!47304 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96864)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418496 (= res!954136 (validKeyInArray!0 (select (arr!46754 a!2831) i!982)))))

(declare-fun b!1418497 () Bool)

(declare-fun res!954138 () Bool)

(assert (=> b!1418497 (=> (not res!954138) (not e!802712))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418497 (= res!954138 (validKeyInArray!0 (select (arr!46754 a!2831) j!81)))))

(declare-fun b!1418499 () Bool)

(declare-fun res!954140 () Bool)

(assert (=> b!1418499 (=> (not res!954140) (not e!802712))))

(declare-datatypes ((List!33264 0))(
  ( (Nil!33261) (Cons!33260 (h!34553 (_ BitVec 64)) (t!47958 List!33264)) )
))
(declare-fun arrayNoDuplicates!0 (array!96864 (_ BitVec 32) List!33264) Bool)

(assert (=> b!1418499 (= res!954140 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33261))))

(declare-fun b!1418500 () Bool)

(declare-fun res!954141 () Bool)

(assert (=> b!1418500 (=> (not res!954141) (not e!802712))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418500 (= res!954141 (and (= (size!47304 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47304 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47304 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418501 () Bool)

(declare-fun lt!625590 () (_ BitVec 32))

(assert (=> b!1418501 (= e!802712 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625590 #b00000000000000000000000000000000) (bvsge lt!625590 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418501 (= lt!625590 (toIndex!0 (select (arr!46754 a!2831) j!81) mask!2608))))

(declare-fun b!1418502 () Bool)

(declare-fun res!954142 () Bool)

(assert (=> b!1418502 (=> (not res!954142) (not e!802712))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418502 (= res!954142 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47304 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47304 a!2831))))))

(declare-fun res!954137 () Bool)

(assert (=> start!122388 (=> (not res!954137) (not e!802712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122388 (= res!954137 (validMask!0 mask!2608))))

(assert (=> start!122388 e!802712))

(assert (=> start!122388 true))

(declare-fun array_inv!35782 (array!96864) Bool)

(assert (=> start!122388 (array_inv!35782 a!2831)))

(declare-fun b!1418498 () Bool)

(declare-fun res!954139 () Bool)

(assert (=> b!1418498 (=> (not res!954139) (not e!802712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96864 (_ BitVec 32)) Bool)

(assert (=> b!1418498 (= res!954139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122388 res!954137) b!1418500))

(assert (= (and b!1418500 res!954141) b!1418496))

(assert (= (and b!1418496 res!954136) b!1418497))

(assert (= (and b!1418497 res!954138) b!1418498))

(assert (= (and b!1418498 res!954139) b!1418499))

(assert (= (and b!1418499 res!954140) b!1418502))

(assert (= (and b!1418502 res!954142) b!1418501))

(declare-fun m!1309173 () Bool)

(assert (=> b!1418499 m!1309173))

(declare-fun m!1309175 () Bool)

(assert (=> b!1418498 m!1309175))

(declare-fun m!1309177 () Bool)

(assert (=> b!1418496 m!1309177))

(assert (=> b!1418496 m!1309177))

(declare-fun m!1309179 () Bool)

(assert (=> b!1418496 m!1309179))

(declare-fun m!1309181 () Bool)

(assert (=> b!1418501 m!1309181))

(assert (=> b!1418501 m!1309181))

(declare-fun m!1309183 () Bool)

(assert (=> b!1418501 m!1309183))

(assert (=> b!1418497 m!1309181))

(assert (=> b!1418497 m!1309181))

(declare-fun m!1309185 () Bool)

(assert (=> b!1418497 m!1309185))

(declare-fun m!1309187 () Bool)

(assert (=> start!122388 m!1309187))

(declare-fun m!1309189 () Bool)

(assert (=> start!122388 m!1309189))

(push 1)

(assert (not start!122388))

(assert (not b!1418498))

(assert (not b!1418497))

(assert (not b!1418501))

(assert (not b!1418496))

(assert (not b!1418499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152885 () Bool)

(declare-fun res!954201 () Bool)

(declare-fun e!802745 () Bool)

(assert (=> d!152885 (=> res!954201 e!802745)))

(assert (=> d!152885 (= res!954201 (bvsge #b00000000000000000000000000000000 (size!47304 a!2831)))))

(assert (=> d!152885 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33261) e!802745)))

(declare-fun bm!67270 () Bool)

(declare-fun call!67273 () Bool)

(declare-fun c!131667 () Bool)

(assert (=> bm!67270 (= call!67273 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131667 (Cons!33260 (select (arr!46754 a!2831) #b00000000000000000000000000000000) Nil!33261) Nil!33261)))))

(declare-fun b!1418570 () Bool)

(declare-fun e!802748 () Bool)

(declare-fun contains!9839 (List!33264 (_ BitVec 64)) Bool)

(assert (=> b!1418570 (= e!802748 (contains!9839 Nil!33261 (select (arr!46754 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418571 () Bool)

(declare-fun e!802746 () Bool)

(assert (=> b!1418571 (= e!802745 e!802746)))

(declare-fun res!954202 () Bool)

(assert (=> b!1418571 (=> (not res!954202) (not e!802746))))

(assert (=> b!1418571 (= res!954202 (not e!802748))))

(declare-fun res!954200 () Bool)

(assert (=> b!1418571 (=> (not res!954200) (not e!802748))))

(assert (=> b!1418571 (= res!954200 (validKeyInArray!0 (select (arr!46754 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418572 () Bool)

(declare-fun e!802747 () Bool)

(assert (=> b!1418572 (= e!802746 e!802747)))

(assert (=> b!1418572 (= c!131667 (validKeyInArray!0 (select (arr!46754 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418573 () Bool)

(assert (=> b!1418573 (= e!802747 call!67273)))

(declare-fun b!1418574 () Bool)

(assert (=> b!1418574 (= e!802747 call!67273)))

(assert (= (and d!152885 (not res!954201)) b!1418571))

(assert (= (and b!1418571 res!954200) b!1418570))

(assert (= (and b!1418571 res!954202) b!1418572))

(assert (= (and b!1418572 c!131667) b!1418573))

(assert (= (and b!1418572 (not c!131667)) b!1418574))

(assert (= (or b!1418573 b!1418574) bm!67270))

(declare-fun m!1309235 () Bool)

(assert (=> bm!67270 m!1309235))

(declare-fun m!1309237 () Bool)

(assert (=> bm!67270 m!1309237))

(assert (=> b!1418570 m!1309235))

(assert (=> b!1418570 m!1309235))

(declare-fun m!1309239 () Bool)

(assert (=> b!1418570 m!1309239))

(assert (=> b!1418571 m!1309235))

(assert (=> b!1418571 m!1309235))

(declare-fun m!1309241 () Bool)

(assert (=> b!1418571 m!1309241))

(assert (=> b!1418572 m!1309235))

(assert (=> b!1418572 m!1309235))

(assert (=> b!1418572 m!1309241))

(assert (=> b!1418499 d!152885))

(declare-fun d!152897 () Bool)

(assert (=> d!152897 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122388 d!152897))

(declare-fun d!152905 () Bool)

(assert (=> d!152905 (= (array_inv!35782 a!2831) (bvsge (size!47304 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122388 d!152905))

(declare-fun d!152907 () Bool)

(declare-fun lt!625617 () (_ BitVec 32))

(declare-fun lt!625616 () (_ BitVec 32))

(assert (=> d!152907 (= lt!625617 (bvmul (bvxor lt!625616 (bvlshr lt!625616 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152907 (= lt!625616 ((_ extract 31 0) (bvand (bvxor (select (arr!46754 a!2831) j!81) (bvlshr (select (arr!46754 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152907 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954210 (let ((h!34557 ((_ extract 31 0) (bvand (bvxor (select (arr!46754 a!2831) j!81) (bvlshr (select (arr!46754 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128225 (bvmul (bvxor h!34557 (bvlshr h!34557 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128225 (bvlshr x!128225 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954210 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954210 #b00000000000000000000000000000000))))))

(assert (=> d!152907 (= (toIndex!0 (select (arr!46754 a!2831) j!81) mask!2608) (bvand (bvxor lt!625617 (bvlshr lt!625617 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418501 d!152907))

(declare-fun d!152909 () Bool)

(assert (=> d!152909 (= (validKeyInArray!0 (select (arr!46754 a!2831) i!982)) (and (not (= (select (arr!46754 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46754 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418496 d!152909))

(declare-fun d!152915 () Bool)

(assert (=> d!152915 (= (validKeyInArray!0 (select (arr!46754 a!2831) j!81)) (and (not (= (select (arr!46754 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46754 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418497 d!152915))

(declare-fun d!152917 () Bool)

(declare-fun res!954230 () Bool)

(declare-fun e!802786 () Bool)

(assert (=> d!152917 (=> res!954230 e!802786)))

(assert (=> d!152917 (= res!954230 (bvsge #b00000000000000000000000000000000 (size!47304 a!2831)))))

(assert (=> d!152917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802786)))

(declare-fun b!1418622 () Bool)

(declare-fun e!802785 () Bool)

(declare-fun call!67285 () Bool)

(assert (=> b!1418622 (= e!802785 call!67285)))

(declare-fun bm!67282 () Bool)

(assert (=> bm!67282 (= call!67285 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418623 () Bool)

(declare-fun e!802787 () Bool)

(assert (=> b!1418623 (= e!802786 e!802787)))

(declare-fun c!131679 () Bool)

(assert (=> b!1418623 (= c!131679 (validKeyInArray!0 (select (arr!46754 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418624 () Bool)

(assert (=> b!1418624 (= e!802787 e!802785)))

(declare-fun lt!625634 () (_ BitVec 64))

(assert (=> b!1418624 (= lt!625634 (select (arr!46754 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48066 0))(
  ( (Unit!48067) )
))
(declare-fun lt!625633 () Unit!48066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96864 (_ BitVec 64) (_ BitVec 32)) Unit!48066)

(assert (=> b!1418624 (= lt!625633 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625634 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418624 (arrayContainsKey!0 a!2831 lt!625634 #b00000000000000000000000000000000)))

(declare-fun lt!625635 () Unit!48066)

(assert (=> b!1418624 (= lt!625635 lt!625633)))

(declare-fun res!954231 () Bool)

(declare-datatypes ((SeekEntryResult!11046 0))(
  ( (MissingZero!11046 (index!46576 (_ BitVec 32))) (Found!11046 (index!46577 (_ BitVec 32))) (Intermediate!11046 (undefined!11858 Bool) (index!46578 (_ BitVec 32)) (x!128228 (_ BitVec 32))) (Undefined!11046) (MissingVacant!11046 (index!46579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96864 (_ BitVec 32)) SeekEntryResult!11046)

(assert (=> b!1418624 (= res!954231 (= (seekEntryOrOpen!0 (select (arr!46754 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11046 #b00000000000000000000000000000000)))))

(assert (=> b!1418624 (=> (not res!954231) (not e!802785))))

(declare-fun b!1418625 () Bool)

(assert (=> b!1418625 (= e!802787 call!67285)))

(assert (= (and d!152917 (not res!954230)) b!1418623))

(assert (= (and b!1418623 c!131679) b!1418624))

(assert (= (and b!1418623 (not c!131679)) b!1418625))

(assert (= (and b!1418624 res!954231) b!1418622))

(assert (= (or b!1418622 b!1418625) bm!67282))

(declare-fun m!1309267 () Bool)

(assert (=> bm!67282 m!1309267))

(assert (=> b!1418623 m!1309235))

(assert (=> b!1418623 m!1309235))

(assert (=> b!1418623 m!1309241))

(assert (=> b!1418624 m!1309235))

(declare-fun m!1309269 () Bool)

(assert (=> b!1418624 m!1309269))

(declare-fun m!1309271 () Bool)

(assert (=> b!1418624 m!1309271))

(assert (=> b!1418624 m!1309235))

(declare-fun m!1309273 () Bool)

(assert (=> b!1418624 m!1309273))

(assert (=> b!1418498 d!152917))

(push 1)

(assert (not b!1418572))

(assert (not b!1418571))

(assert (not b!1418624))

(assert (not bm!67270))

(assert (not b!1418570))

(assert (not bm!67282))

(assert (not b!1418623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

