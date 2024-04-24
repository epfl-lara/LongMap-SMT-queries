; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129074 () Bool)

(assert start!129074)

(declare-fun b!1510675 () Bool)

(declare-fun res!1029409 () Bool)

(declare-fun e!844036 () Bool)

(assert (=> b!1510675 (=> (not res!1029409) (not e!844036))))

(declare-datatypes ((array!100744 0))(
  ( (array!100745 (arr!48604 (Array (_ BitVec 32) (_ BitVec 64))) (size!49155 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100744)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100744 (_ BitVec 32)) Bool)

(assert (=> b!1510675 (= res!1029409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1029408 () Bool)

(assert (=> start!129074 (=> (not res!1029408) (not e!844036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129074 (= res!1029408 (validMask!0 mask!2512))))

(assert (=> start!129074 e!844036))

(assert (=> start!129074 true))

(declare-fun array_inv!37885 (array!100744) Bool)

(assert (=> start!129074 (array_inv!37885 a!2804)))

(declare-fun b!1510676 () Bool)

(declare-fun res!1029410 () Bool)

(assert (=> b!1510676 (=> (not res!1029410) (not e!844036))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1510676 (= res!1029410 (and (= (size!49155 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49155 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49155 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510677 () Bool)

(declare-fun res!1029401 () Bool)

(assert (=> b!1510677 (=> (not res!1029401) (not e!844036))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510677 (= res!1029401 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49155 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49155 a!2804))))))

(declare-fun b!1510678 () Bool)

(declare-fun e!844035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510678 (= e!844035 (not (validKeyInArray!0 (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun b!1510679 () Bool)

(declare-fun e!844038 () Bool)

(assert (=> b!1510679 (= e!844036 e!844038)))

(declare-fun res!1029405 () Bool)

(assert (=> b!1510679 (=> (not res!1029405) (not e!844038))))

(declare-datatypes ((SeekEntryResult!12668 0))(
  ( (MissingZero!12668 (index!53067 (_ BitVec 32))) (Found!12668 (index!53068 (_ BitVec 32))) (Intermediate!12668 (undefined!13480 Bool) (index!53069 (_ BitVec 32)) (x!135031 (_ BitVec 32))) (Undefined!12668) (MissingVacant!12668 (index!53070 (_ BitVec 32))) )
))
(declare-fun lt!655416 () SeekEntryResult!12668)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100744 (_ BitVec 32)) SeekEntryResult!12668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510679 (= res!1029405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48604 a!2804) j!70) mask!2512) (select (arr!48604 a!2804) j!70) a!2804 mask!2512) lt!655416))))

(assert (=> b!1510679 (= lt!655416 (Intermediate!12668 false resIndex!21 resX!21))))

(declare-fun b!1510680 () Bool)

(declare-fun res!1029402 () Bool)

(assert (=> b!1510680 (=> (not res!1029402) (not e!844036))))

(assert (=> b!1510680 (= res!1029402 (validKeyInArray!0 (select (arr!48604 a!2804) j!70)))))

(declare-fun b!1510681 () Bool)

(declare-fun res!1029407 () Bool)

(assert (=> b!1510681 (=> (not res!1029407) (not e!844036))))

(declare-datatypes ((List!35074 0))(
  ( (Nil!35071) (Cons!35070 (h!36497 (_ BitVec 64)) (t!49760 List!35074)) )
))
(declare-fun arrayNoDuplicates!0 (array!100744 (_ BitVec 32) List!35074) Bool)

(assert (=> b!1510681 (= res!1029407 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35071))))

(declare-fun b!1510682 () Bool)

(declare-fun res!1029404 () Bool)

(assert (=> b!1510682 (=> (not res!1029404) (not e!844038))))

(assert (=> b!1510682 (= res!1029404 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48604 a!2804) j!70) a!2804 mask!2512) lt!655416))))

(declare-fun b!1510683 () Bool)

(assert (=> b!1510683 (= e!844038 e!844035)))

(declare-fun res!1029403 () Bool)

(assert (=> b!1510683 (=> (not res!1029403) (not e!844035))))

(declare-fun lt!655417 () (_ BitVec 32))

(assert (=> b!1510683 (= res!1029403 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge lt!655417 #b00000000000000000000000000000000) (bvslt lt!655417 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(assert (=> b!1510683 (= lt!655417 (toIndex!0 (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1510684 () Bool)

(declare-fun res!1029406 () Bool)

(assert (=> b!1510684 (=> (not res!1029406) (not e!844036))))

(assert (=> b!1510684 (= res!1029406 (validKeyInArray!0 (select (arr!48604 a!2804) i!961)))))

(assert (= (and start!129074 res!1029408) b!1510676))

(assert (= (and b!1510676 res!1029410) b!1510684))

(assert (= (and b!1510684 res!1029406) b!1510680))

(assert (= (and b!1510680 res!1029402) b!1510675))

(assert (= (and b!1510675 res!1029409) b!1510681))

(assert (= (and b!1510681 res!1029407) b!1510677))

(assert (= (and b!1510677 res!1029401) b!1510679))

(assert (= (and b!1510679 res!1029405) b!1510682))

(assert (= (and b!1510682 res!1029404) b!1510683))

(assert (= (and b!1510683 res!1029403) b!1510678))

(declare-fun m!1393059 () Bool)

(assert (=> b!1510684 m!1393059))

(assert (=> b!1510684 m!1393059))

(declare-fun m!1393061 () Bool)

(assert (=> b!1510684 m!1393061))

(declare-fun m!1393063 () Bool)

(assert (=> b!1510675 m!1393063))

(declare-fun m!1393065 () Bool)

(assert (=> b!1510683 m!1393065))

(declare-fun m!1393067 () Bool)

(assert (=> b!1510683 m!1393067))

(assert (=> b!1510683 m!1393067))

(declare-fun m!1393069 () Bool)

(assert (=> b!1510683 m!1393069))

(assert (=> b!1510678 m!1393065))

(assert (=> b!1510678 m!1393067))

(assert (=> b!1510678 m!1393067))

(declare-fun m!1393071 () Bool)

(assert (=> b!1510678 m!1393071))

(declare-fun m!1393073 () Bool)

(assert (=> b!1510681 m!1393073))

(declare-fun m!1393075 () Bool)

(assert (=> start!129074 m!1393075))

(declare-fun m!1393077 () Bool)

(assert (=> start!129074 m!1393077))

(declare-fun m!1393079 () Bool)

(assert (=> b!1510679 m!1393079))

(assert (=> b!1510679 m!1393079))

(declare-fun m!1393081 () Bool)

(assert (=> b!1510679 m!1393081))

(assert (=> b!1510679 m!1393081))

(assert (=> b!1510679 m!1393079))

(declare-fun m!1393083 () Bool)

(assert (=> b!1510679 m!1393083))

(assert (=> b!1510680 m!1393079))

(assert (=> b!1510680 m!1393079))

(declare-fun m!1393085 () Bool)

(assert (=> b!1510680 m!1393085))

(assert (=> b!1510682 m!1393079))

(assert (=> b!1510682 m!1393079))

(declare-fun m!1393087 () Bool)

(assert (=> b!1510682 m!1393087))

(check-sat (not b!1510684) (not b!1510678) (not b!1510682) (not start!129074) (not b!1510679) (not b!1510683) (not b!1510681) (not b!1510675) (not b!1510680))
(check-sat)
