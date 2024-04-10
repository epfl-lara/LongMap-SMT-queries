; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119434 () Bool)

(assert start!119434)

(declare-fun res!931655 () Bool)

(declare-fun e!788210 () Bool)

(assert (=> start!119434 (=> (not res!931655) (not e!788210))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119434 (= res!931655 (validMask!0 mask!2840))))

(assert (=> start!119434 e!788210))

(assert (=> start!119434 true))

(declare-datatypes ((array!95218 0))(
  ( (array!95219 (arr!45970 (Array (_ BitVec 32) (_ BitVec 64))) (size!46520 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95218)

(declare-fun array_inv!34998 (array!95218) Bool)

(assert (=> start!119434 (array_inv!34998 a!2901)))

(declare-fun b!1391933 () Bool)

(declare-fun res!931654 () Bool)

(assert (=> b!1391933 (=> (not res!931654) (not e!788210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95218 (_ BitVec 32)) Bool)

(assert (=> b!1391933 (= res!931654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391934 () Bool)

(declare-fun res!931653 () Bool)

(assert (=> b!1391934 (=> (not res!931653) (not e!788210))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391934 (= res!931653 (validKeyInArray!0 (select (arr!45970 a!2901) i!1037)))))

(declare-fun b!1391935 () Bool)

(declare-fun res!931656 () Bool)

(assert (=> b!1391935 (=> (not res!931656) (not e!788210))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391935 (= res!931656 (and (= (size!46520 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46520 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46520 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391936 () Bool)

(declare-fun res!931657 () Bool)

(assert (=> b!1391936 (=> (not res!931657) (not e!788210))))

(declare-datatypes ((List!32489 0))(
  ( (Nil!32486) (Cons!32485 (h!33712 (_ BitVec 64)) (t!47183 List!32489)) )
))
(declare-fun arrayNoDuplicates!0 (array!95218 (_ BitVec 32) List!32489) Bool)

(assert (=> b!1391936 (= res!931657 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32486))))

(declare-fun b!1391937 () Bool)

(declare-fun res!931659 () Bool)

(assert (=> b!1391937 (=> (not res!931659) (not e!788210))))

(assert (=> b!1391937 (= res!931659 (validKeyInArray!0 (select (arr!45970 a!2901) j!112)))))

(declare-fun b!1391938 () Bool)

(declare-fun e!788207 () Bool)

(assert (=> b!1391938 (= e!788207 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!611403 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391938 (= lt!611403 (toIndex!0 (select (store (arr!45970 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun e!788208 () Bool)

(declare-fun b!1391939 () Bool)

(declare-datatypes ((SeekEntryResult!10287 0))(
  ( (MissingZero!10287 (index!43519 (_ BitVec 32))) (Found!10287 (index!43520 (_ BitVec 32))) (Intermediate!10287 (undefined!11099 Bool) (index!43521 (_ BitVec 32)) (x!125199 (_ BitVec 32))) (Undefined!10287) (MissingVacant!10287 (index!43522 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95218 (_ BitVec 32)) SeekEntryResult!10287)

(assert (=> b!1391939 (= e!788208 (= (seekEntryOrOpen!0 (select (arr!45970 a!2901) j!112) a!2901 mask!2840) (Found!10287 j!112)))))

(declare-fun b!1391940 () Bool)

(assert (=> b!1391940 (= e!788210 (not e!788207))))

(declare-fun res!931658 () Bool)

(assert (=> b!1391940 (=> res!931658 e!788207)))

(declare-fun lt!611402 () SeekEntryResult!10287)

(assert (=> b!1391940 (= res!931658 (or (not (is-Intermediate!10287 lt!611402)) (undefined!11099 lt!611402)))))

(assert (=> b!1391940 e!788208))

(declare-fun res!931660 () Bool)

(assert (=> b!1391940 (=> (not res!931660) (not e!788208))))

(assert (=> b!1391940 (= res!931660 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46578 0))(
  ( (Unit!46579) )
))
(declare-fun lt!611401 () Unit!46578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46578)

(assert (=> b!1391940 (= lt!611401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95218 (_ BitVec 32)) SeekEntryResult!10287)

(assert (=> b!1391940 (= lt!611402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45970 a!2901) j!112) mask!2840) (select (arr!45970 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119434 res!931655) b!1391935))

(assert (= (and b!1391935 res!931656) b!1391934))

(assert (= (and b!1391934 res!931653) b!1391937))

(assert (= (and b!1391937 res!931659) b!1391933))

(assert (= (and b!1391933 res!931654) b!1391936))

(assert (= (and b!1391936 res!931657) b!1391940))

(assert (= (and b!1391940 res!931660) b!1391939))

(assert (= (and b!1391940 (not res!931658)) b!1391938))

(declare-fun m!1277683 () Bool)

(assert (=> b!1391938 m!1277683))

(declare-fun m!1277685 () Bool)

(assert (=> b!1391938 m!1277685))

(assert (=> b!1391938 m!1277685))

(declare-fun m!1277687 () Bool)

(assert (=> b!1391938 m!1277687))

(declare-fun m!1277689 () Bool)

(assert (=> start!119434 m!1277689))

(declare-fun m!1277691 () Bool)

(assert (=> start!119434 m!1277691))

(declare-fun m!1277693 () Bool)

(assert (=> b!1391934 m!1277693))

(assert (=> b!1391934 m!1277693))

(declare-fun m!1277695 () Bool)

(assert (=> b!1391934 m!1277695))

(declare-fun m!1277697 () Bool)

(assert (=> b!1391940 m!1277697))

(declare-fun m!1277699 () Bool)

(assert (=> b!1391940 m!1277699))

(assert (=> b!1391940 m!1277697))

(declare-fun m!1277701 () Bool)

(assert (=> b!1391940 m!1277701))

(assert (=> b!1391940 m!1277699))

(assert (=> b!1391940 m!1277697))

(declare-fun m!1277703 () Bool)

(assert (=> b!1391940 m!1277703))

(declare-fun m!1277705 () Bool)

(assert (=> b!1391940 m!1277705))

(declare-fun m!1277707 () Bool)

(assert (=> b!1391936 m!1277707))

(assert (=> b!1391937 m!1277697))

(assert (=> b!1391937 m!1277697))

(declare-fun m!1277709 () Bool)

(assert (=> b!1391937 m!1277709))

(assert (=> b!1391939 m!1277697))

(assert (=> b!1391939 m!1277697))

(declare-fun m!1277711 () Bool)

(assert (=> b!1391939 m!1277711))

(declare-fun m!1277713 () Bool)

(assert (=> b!1391933 m!1277713))

(push 1)

(assert (not b!1391937))

(assert (not b!1391938))

(assert (not b!1391940))

(assert (not b!1391933))

(assert (not b!1391939))

(assert (not start!119434))

