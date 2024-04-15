; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119502 () Bool)

(assert start!119502)

(declare-fun b!1392296 () Bool)

(declare-fun res!931923 () Bool)

(declare-fun e!788422 () Bool)

(assert (=> b!1392296 (=> (not res!931923) (not e!788422))))

(declare-datatypes ((array!95188 0))(
  ( (array!95189 (arr!45954 (Array (_ BitVec 32) (_ BitVec 64))) (size!46506 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95188)

(declare-datatypes ((List!32551 0))(
  ( (Nil!32548) (Cons!32547 (h!33777 (_ BitVec 64)) (t!47237 List!32551)) )
))
(declare-fun arrayNoDuplicates!0 (array!95188 (_ BitVec 32) List!32551) Bool)

(assert (=> b!1392296 (= res!931923 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32548))))

(declare-fun b!1392297 () Bool)

(declare-fun res!931925 () Bool)

(assert (=> b!1392297 (=> (not res!931925) (not e!788422))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95188 (_ BitVec 32)) Bool)

(assert (=> b!1392297 (= res!931925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392298 () Bool)

(declare-fun res!931924 () Bool)

(assert (=> b!1392298 (=> (not res!931924) (not e!788422))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392298 (= res!931924 (validKeyInArray!0 (select (arr!45954 a!2901) i!1037)))))

(declare-fun b!1392299 () Bool)

(declare-fun e!788421 () Bool)

(assert (=> b!1392299 (= e!788421 true)))

(declare-fun lt!611408 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392299 (= lt!611408 (toIndex!0 (select (store (arr!45954 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392300 () Bool)

(declare-fun res!931921 () Bool)

(assert (=> b!1392300 (=> (not res!931921) (not e!788422))))

(assert (=> b!1392300 (= res!931921 (and (= (size!46506 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46506 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46506 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392301 () Bool)

(declare-fun res!931926 () Bool)

(assert (=> b!1392301 (=> (not res!931926) (not e!788422))))

(assert (=> b!1392301 (= res!931926 (validKeyInArray!0 (select (arr!45954 a!2901) j!112)))))

(declare-fun e!788423 () Bool)

(declare-fun b!1392302 () Bool)

(declare-datatypes ((SeekEntryResult!10297 0))(
  ( (MissingZero!10297 (index!43559 (_ BitVec 32))) (Found!10297 (index!43560 (_ BitVec 32))) (Intermediate!10297 (undefined!11109 Bool) (index!43561 (_ BitVec 32)) (x!125236 (_ BitVec 32))) (Undefined!10297) (MissingVacant!10297 (index!43562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95188 (_ BitVec 32)) SeekEntryResult!10297)

(assert (=> b!1392302 (= e!788423 (= (seekEntryOrOpen!0 (select (arr!45954 a!2901) j!112) a!2901 mask!2840) (Found!10297 j!112)))))

(declare-fun res!931927 () Bool)

(assert (=> start!119502 (=> (not res!931927) (not e!788422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119502 (= res!931927 (validMask!0 mask!2840))))

(assert (=> start!119502 e!788422))

(assert (=> start!119502 true))

(declare-fun array_inv!35187 (array!95188) Bool)

(assert (=> start!119502 (array_inv!35187 a!2901)))

(declare-fun b!1392303 () Bool)

(assert (=> b!1392303 (= e!788422 (not e!788421))))

(declare-fun res!931922 () Bool)

(assert (=> b!1392303 (=> res!931922 e!788421)))

(declare-fun lt!611406 () SeekEntryResult!10297)

(assert (=> b!1392303 (= res!931922 (or (not (is-Intermediate!10297 lt!611406)) (undefined!11109 lt!611406)))))

(assert (=> b!1392303 e!788423))

(declare-fun res!931920 () Bool)

(assert (=> b!1392303 (=> (not res!931920) (not e!788423))))

(assert (=> b!1392303 (= res!931920 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46441 0))(
  ( (Unit!46442) )
))
(declare-fun lt!611407 () Unit!46441)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46441)

(assert (=> b!1392303 (= lt!611407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95188 (_ BitVec 32)) SeekEntryResult!10297)

(assert (=> b!1392303 (= lt!611406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45954 a!2901) j!112) mask!2840) (select (arr!45954 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119502 res!931927) b!1392300))

(assert (= (and b!1392300 res!931921) b!1392298))

(assert (= (and b!1392298 res!931924) b!1392301))

(assert (= (and b!1392301 res!931926) b!1392297))

(assert (= (and b!1392297 res!931925) b!1392296))

(assert (= (and b!1392296 res!931923) b!1392303))

(assert (= (and b!1392303 res!931920) b!1392302))

(assert (= (and b!1392303 (not res!931922)) b!1392299))

(declare-fun m!1277561 () Bool)

(assert (=> b!1392301 m!1277561))

(assert (=> b!1392301 m!1277561))

(declare-fun m!1277563 () Bool)

(assert (=> b!1392301 m!1277563))

(assert (=> b!1392302 m!1277561))

(assert (=> b!1392302 m!1277561))

(declare-fun m!1277565 () Bool)

(assert (=> b!1392302 m!1277565))

(declare-fun m!1277567 () Bool)

(assert (=> b!1392297 m!1277567))

(declare-fun m!1277569 () Bool)

(assert (=> b!1392299 m!1277569))

(declare-fun m!1277571 () Bool)

(assert (=> b!1392299 m!1277571))

(assert (=> b!1392299 m!1277571))

(declare-fun m!1277573 () Bool)

(assert (=> b!1392299 m!1277573))

(declare-fun m!1277575 () Bool)

(assert (=> b!1392296 m!1277575))

(assert (=> b!1392303 m!1277561))

(declare-fun m!1277577 () Bool)

(assert (=> b!1392303 m!1277577))

(assert (=> b!1392303 m!1277561))

(declare-fun m!1277579 () Bool)

(assert (=> b!1392303 m!1277579))

(assert (=> b!1392303 m!1277577))

(assert (=> b!1392303 m!1277561))

(declare-fun m!1277581 () Bool)

(assert (=> b!1392303 m!1277581))

(declare-fun m!1277583 () Bool)

(assert (=> b!1392303 m!1277583))

(declare-fun m!1277585 () Bool)

(assert (=> start!119502 m!1277585))

(declare-fun m!1277587 () Bool)

(assert (=> start!119502 m!1277587))

(declare-fun m!1277589 () Bool)

(assert (=> b!1392298 m!1277589))

(assert (=> b!1392298 m!1277589))

(declare-fun m!1277591 () Bool)

(assert (=> b!1392298 m!1277591))

(push 1)

(assert (not b!1392298))

(assert (not b!1392296))

(assert (not b!1392302))

(assert (not b!1392303))

(assert (not start!119502))

(assert (not b!1392297))

(assert (not b!1392299))

(assert (not b!1392301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

