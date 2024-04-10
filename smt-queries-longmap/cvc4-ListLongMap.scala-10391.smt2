; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122392 () Bool)

(assert start!122392)

(declare-fun res!954179 () Bool)

(declare-fun e!802723 () Bool)

(assert (=> start!122392 (=> (not res!954179) (not e!802723))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122392 (= res!954179 (validMask!0 mask!2608))))

(assert (=> start!122392 e!802723))

(assert (=> start!122392 true))

(declare-datatypes ((array!96868 0))(
  ( (array!96869 (arr!46756 (Array (_ BitVec 32) (_ BitVec 64))) (size!47306 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96868)

(declare-fun array_inv!35784 (array!96868) Bool)

(assert (=> start!122392 (array_inv!35784 a!2831)))

(declare-fun b!1418538 () Bool)

(declare-fun res!954184 () Bool)

(assert (=> b!1418538 (=> (not res!954184) (not e!802723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96868 (_ BitVec 32)) Bool)

(assert (=> b!1418538 (= res!954184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418539 () Bool)

(declare-fun res!954180 () Bool)

(assert (=> b!1418539 (=> (not res!954180) (not e!802723))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418539 (= res!954180 (validKeyInArray!0 (select (arr!46756 a!2831) i!982)))))

(declare-fun b!1418540 () Bool)

(declare-fun res!954182 () Bool)

(assert (=> b!1418540 (=> (not res!954182) (not e!802723))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418540 (= res!954182 (and (= (size!47306 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47306 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47306 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418541 () Bool)

(declare-fun res!954183 () Bool)

(assert (=> b!1418541 (=> (not res!954183) (not e!802723))))

(declare-datatypes ((List!33266 0))(
  ( (Nil!33263) (Cons!33262 (h!34555 (_ BitVec 64)) (t!47960 List!33266)) )
))
(declare-fun arrayNoDuplicates!0 (array!96868 (_ BitVec 32) List!33266) Bool)

(assert (=> b!1418541 (= res!954183 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33263))))

(declare-fun b!1418542 () Bool)

(declare-fun res!954178 () Bool)

(assert (=> b!1418542 (=> (not res!954178) (not e!802723))))

(assert (=> b!1418542 (= res!954178 (validKeyInArray!0 (select (arr!46756 a!2831) j!81)))))

(declare-fun b!1418543 () Bool)

(declare-fun res!954181 () Bool)

(assert (=> b!1418543 (=> (not res!954181) (not e!802723))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1418543 (= res!954181 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47306 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47306 a!2831))))))

(declare-fun b!1418544 () Bool)

(declare-fun lt!625596 () (_ BitVec 32))

(assert (=> b!1418544 (= e!802723 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625596 #b00000000000000000000000000000000) (bvsge lt!625596 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418544 (= lt!625596 (toIndex!0 (select (arr!46756 a!2831) j!81) mask!2608))))

(assert (= (and start!122392 res!954179) b!1418540))

(assert (= (and b!1418540 res!954182) b!1418539))

(assert (= (and b!1418539 res!954180) b!1418542))

(assert (= (and b!1418542 res!954178) b!1418538))

(assert (= (and b!1418538 res!954184) b!1418541))

(assert (= (and b!1418541 res!954183) b!1418543))

(assert (= (and b!1418543 res!954181) b!1418544))

(declare-fun m!1309209 () Bool)

(assert (=> b!1418541 m!1309209))

(declare-fun m!1309211 () Bool)

(assert (=> b!1418538 m!1309211))

(declare-fun m!1309213 () Bool)

(assert (=> start!122392 m!1309213))

(declare-fun m!1309215 () Bool)

(assert (=> start!122392 m!1309215))

(declare-fun m!1309217 () Bool)

(assert (=> b!1418542 m!1309217))

(assert (=> b!1418542 m!1309217))

(declare-fun m!1309219 () Bool)

(assert (=> b!1418542 m!1309219))

(declare-fun m!1309221 () Bool)

(assert (=> b!1418539 m!1309221))

(assert (=> b!1418539 m!1309221))

(declare-fun m!1309223 () Bool)

(assert (=> b!1418539 m!1309223))

(assert (=> b!1418544 m!1309217))

(assert (=> b!1418544 m!1309217))

(declare-fun m!1309225 () Bool)

(assert (=> b!1418544 m!1309225))

(push 1)

(assert (not b!1418544))

(assert (not start!122392))

(assert (not b!1418541))

(assert (not b!1418538))

(assert (not b!1418542))

(assert (not b!1418539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152887 () Bool)

(assert (=> d!152887 (= (validKeyInArray!0 (select (arr!46756 a!2831) i!982)) (and (not (= (select (arr!46756 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46756 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418539 d!152887))

(declare-fun d!152891 () Bool)

(assert (=> d!152891 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122392 d!152891))

(declare-fun d!152901 () Bool)

(assert (=> d!152901 (= (array_inv!35784 a!2831) (bvsge (size!47306 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122392 d!152901))

(declare-fun b!1418597 () Bool)

(declare-fun e!802769 () Bool)

(declare-fun call!67279 () Bool)

(assert (=> b!1418597 (= e!802769 call!67279)))

(declare-fun b!1418598 () Bool)

(assert (=> b!1418598 (= e!802769 call!67279)))

(declare-fun b!1418599 () Bool)

(declare-fun e!802766 () Bool)

(declare-fun e!802767 () Bool)

(assert (=> b!1418599 (= e!802766 e!802767)))

(declare-fun res!954217 () Bool)

(assert (=> b!1418599 (=> (not res!954217) (not e!802767))))

(declare-fun e!802768 () Bool)

(assert (=> b!1418599 (= res!954217 (not e!802768))))

(declare-fun res!954218 () Bool)

(assert (=> b!1418599 (=> (not res!954218) (not e!802768))))

(assert (=> b!1418599 (= res!954218 (validKeyInArray!0 (select (arr!46756 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418600 () Bool)

(declare-fun contains!9840 (List!33266 (_ BitVec 64)) Bool)

(assert (=> b!1418600 (= e!802768 (contains!9840 Nil!33263 (select (arr!46756 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152903 () Bool)

(declare-fun res!954219 () Bool)

(assert (=> d!152903 (=> res!954219 e!802766)))

(assert (=> d!152903 (= res!954219 (bvsge #b00000000000000000000000000000000 (size!47306 a!2831)))))

(assert (=> d!152903 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33263) e!802766)))

(declare-fun bm!67276 () Bool)

(declare-fun c!131673 () Bool)

(assert (=> bm!67276 (= call!67279 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131673 (Cons!33262 (select (arr!46756 a!2831) #b00000000000000000000000000000000) Nil!33263) Nil!33263)))))

(declare-fun b!1418601 () Bool)

(assert (=> b!1418601 (= e!802767 e!802769)))

(assert (=> b!1418601 (= c!131673 (validKeyInArray!0 (select (arr!46756 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152903 (not res!954219)) b!1418599))

(assert (= (and b!1418599 res!954218) b!1418600))

(assert (= (and b!1418599 res!954217) b!1418601))

(assert (= (and b!1418601 c!131673) b!1418597))

(assert (= (and b!1418601 (not c!131673)) b!1418598))

(assert (= (or b!1418597 b!1418598) bm!67276))

(declare-fun m!1309251 () Bool)

(assert (=> b!1418599 m!1309251))

(assert (=> b!1418599 m!1309251))

(declare-fun m!1309253 () Bool)

(assert (=> b!1418599 m!1309253))

(assert (=> b!1418600 m!1309251))

(assert (=> b!1418600 m!1309251))

(declare-fun m!1309255 () Bool)

(assert (=> b!1418600 m!1309255))

(assert (=> bm!67276 m!1309251))

(declare-fun m!1309257 () Bool)

(assert (=> bm!67276 m!1309257))

(assert (=> b!1418601 m!1309251))

(assert (=> b!1418601 m!1309251))

(assert (=> b!1418601 m!1309253))

(assert (=> b!1418541 d!152903))

(declare-fun d!152911 () Bool)

(assert (=> d!152911 (= (validKeyInArray!0 (select (arr!46756 a!2831) j!81)) (and (not (= (select (arr!46756 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46756 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418542 d!152911))

(declare-fun b!1418618 () Bool)

(declare-fun e!802784 () Bool)

(declare-fun e!802783 () Bool)

(assert (=> b!1418618 (= e!802784 e!802783)))

(declare-fun c!131678 () Bool)

(assert (=> b!1418618 (= c!131678 (validKeyInArray!0 (select (arr!46756 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152913 () Bool)

(declare-fun res!954228 () Bool)

(assert (=> d!152913 (=> res!954228 e!802784)))

(assert (=> d!152913 (= res!954228 (bvsge #b00000000000000000000000000000000 (size!47306 a!2831)))))

(assert (=> d!152913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802784)))

(declare-fun b!1418619 () Bool)

(declare-fun e!802782 () Bool)

(declare-fun call!67284 () Bool)

(assert (=> b!1418619 (= e!802782 call!67284)))

(declare-fun bm!67281 () Bool)

(assert (=> bm!67281 (= call!67284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418620 () Bool)

(assert (=> b!1418620 (= e!802783 call!67284)))

(declare-fun b!1418621 () Bool)

(assert (=> b!1418621 (= e!802783 e!802782)))

(declare-fun lt!625632 () (_ BitVec 64))

(assert (=> b!1418621 (= lt!625632 (select (arr!46756 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48068 0))(
  ( (Unit!48069) )
))
(declare-fun lt!625630 () Unit!48068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96868 (_ BitVec 64) (_ BitVec 32)) Unit!48068)

(assert (=> b!1418621 (= lt!625630 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625632 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418621 (arrayContainsKey!0 a!2831 lt!625632 #b00000000000000000000000000000000)))

(declare-fun lt!625631 () Unit!48068)

(assert (=> b!1418621 (= lt!625631 lt!625630)))

(declare-fun res!954229 () Bool)

(declare-datatypes ((SeekEntryResult!11047 0))(
  ( (MissingZero!11047 (index!46580 (_ BitVec 32))) (Found!11047 (index!46581 (_ BitVec 32))) (Intermediate!11047 (undefined!11859 Bool) (index!46582 (_ BitVec 32)) (x!128229 (_ BitVec 32))) (Undefined!11047) (MissingVacant!11047 (index!46583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96868 (_ BitVec 32)) SeekEntryResult!11047)

(assert (=> b!1418621 (= res!954229 (= (seekEntryOrOpen!0 (select (arr!46756 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11047 #b00000000000000000000000000000000)))))

(assert (=> b!1418621 (=> (not res!954229) (not e!802782))))

(assert (= (and d!152913 (not res!954228)) b!1418618))

(assert (= (and b!1418618 c!131678) b!1418621))

(assert (= (and b!1418618 (not c!131678)) b!1418620))

(assert (= (and b!1418621 res!954229) b!1418619))

(assert (= (or b!1418619 b!1418620) bm!67281))

(assert (=> b!1418618 m!1309251))

(assert (=> b!1418618 m!1309251))

(assert (=> b!1418618 m!1309253))

(declare-fun m!1309259 () Bool)

(assert (=> bm!67281 m!1309259))

(assert (=> b!1418621 m!1309251))

(declare-fun m!1309261 () Bool)

(assert (=> b!1418621 m!1309261))

(declare-fun m!1309263 () Bool)

(assert (=> b!1418621 m!1309263))

(assert (=> b!1418621 m!1309251))

(declare-fun m!1309265 () Bool)

(assert (=> b!1418621 m!1309265))

(assert (=> b!1418538 d!152913))

(declare-fun d!152919 () Bool)

(declare-fun lt!625641 () (_ BitVec 32))

(declare-fun lt!625640 () (_ BitVec 32))

(assert (=> d!152919 (= lt!625641 (bvmul (bvxor lt!625640 (bvlshr lt!625640 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152919 (= lt!625640 ((_ extract 31 0) (bvand (bvxor (select (arr!46756 a!2831) j!81) (bvlshr (select (arr!46756 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152919 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954232 (let ((h!34558 ((_ extract 31 0) (bvand (bvxor (select (arr!46756 a!2831) j!81) (bvlshr (select (arr!46756 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128226 (bvmul (bvxor h!34558 (bvlshr h!34558 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128226 (bvlshr x!128226 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954232 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954232 #b00000000000000000000000000000000))))))

(assert (=> d!152919 (= (toIndex!0 (select (arr!46756 a!2831) j!81) mask!2608) (bvand (bvxor lt!625641 (bvlshr lt!625641 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418544 d!152919))

(push 1)

(assert (not b!1418621))

(assert (not b!1418599))

(assert (not b!1418618))

(assert (not bm!67276))

(assert (not b!1418600))

(assert (not b!1418601))

(assert (not bm!67281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

