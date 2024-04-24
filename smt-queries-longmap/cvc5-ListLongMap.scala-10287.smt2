; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121074 () Bool)

(assert start!121074)

(declare-fun b!1407716 () Bool)

(declare-fun res!945252 () Bool)

(declare-fun e!796850 () Bool)

(assert (=> b!1407716 (=> (not res!945252) (not e!796850))))

(declare-datatypes ((array!96303 0))(
  ( (array!96304 (arr!46497 (Array (_ BitVec 32) (_ BitVec 64))) (size!47048 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96303)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407716 (= res!945252 (validKeyInArray!0 (select (arr!46497 a!2901) j!112)))))

(declare-fun b!1407717 () Bool)

(declare-fun res!945249 () Bool)

(assert (=> b!1407717 (=> (not res!945249) (not e!796850))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407717 (= res!945249 (validKeyInArray!0 (select (arr!46497 a!2901) i!1037)))))

(declare-fun b!1407718 () Bool)

(declare-fun e!796848 () Bool)

(assert (=> b!1407718 (= e!796848 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10711 0))(
  ( (MissingZero!10711 (index!45221 (_ BitVec 32))) (Found!10711 (index!45222 (_ BitVec 32))) (Intermediate!10711 (undefined!11523 Bool) (index!45223 (_ BitVec 32)) (x!126969 (_ BitVec 32))) (Undefined!10711) (MissingVacant!10711 (index!45224 (_ BitVec 32))) )
))
(declare-fun lt!619833 () SeekEntryResult!10711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96303 (_ BitVec 32)) SeekEntryResult!10711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407718 (= lt!619833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96304 (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47048 a!2901)) mask!2840))))

(declare-fun b!1407719 () Bool)

(declare-fun res!945250 () Bool)

(assert (=> b!1407719 (=> (not res!945250) (not e!796850))))

(assert (=> b!1407719 (= res!945250 (and (= (size!47048 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47048 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47048 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407720 () Bool)

(declare-fun res!945256 () Bool)

(assert (=> b!1407720 (=> (not res!945256) (not e!796850))))

(declare-datatypes ((List!33003 0))(
  ( (Nil!33000) (Cons!32999 (h!34261 (_ BitVec 64)) (t!47689 List!33003)) )
))
(declare-fun arrayNoDuplicates!0 (array!96303 (_ BitVec 32) List!33003) Bool)

(assert (=> b!1407720 (= res!945256 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33000))))

(declare-fun b!1407722 () Bool)

(assert (=> b!1407722 (= e!796850 (not e!796848))))

(declare-fun res!945254 () Bool)

(assert (=> b!1407722 (=> res!945254 e!796848)))

(declare-fun lt!619834 () SeekEntryResult!10711)

(assert (=> b!1407722 (= res!945254 (or (not (is-Intermediate!10711 lt!619834)) (undefined!11523 lt!619834)))))

(declare-fun e!796847 () Bool)

(assert (=> b!1407722 e!796847))

(declare-fun res!945253 () Bool)

(assert (=> b!1407722 (=> (not res!945253) (not e!796847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96303 (_ BitVec 32)) Bool)

(assert (=> b!1407722 (= res!945253 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47423 0))(
  ( (Unit!47424) )
))
(declare-fun lt!619835 () Unit!47423)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47423)

(assert (=> b!1407722 (= lt!619835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407722 (= lt!619834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46497 a!2901) j!112) mask!2840) (select (arr!46497 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407723 () Bool)

(declare-fun res!945255 () Bool)

(assert (=> b!1407723 (=> (not res!945255) (not e!796850))))

(assert (=> b!1407723 (= res!945255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96303 (_ BitVec 32)) SeekEntryResult!10711)

(assert (=> b!1407721 (= e!796847 (= (seekEntryOrOpen!0 (select (arr!46497 a!2901) j!112) a!2901 mask!2840) (Found!10711 j!112)))))

(declare-fun res!945251 () Bool)

(assert (=> start!121074 (=> (not res!945251) (not e!796850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121074 (= res!945251 (validMask!0 mask!2840))))

(assert (=> start!121074 e!796850))

(assert (=> start!121074 true))

(declare-fun array_inv!35778 (array!96303) Bool)

(assert (=> start!121074 (array_inv!35778 a!2901)))

(assert (= (and start!121074 res!945251) b!1407719))

(assert (= (and b!1407719 res!945250) b!1407717))

(assert (= (and b!1407717 res!945249) b!1407716))

(assert (= (and b!1407716 res!945252) b!1407723))

(assert (= (and b!1407723 res!945255) b!1407720))

(assert (= (and b!1407720 res!945256) b!1407722))

(assert (= (and b!1407722 res!945253) b!1407721))

(assert (= (and b!1407722 (not res!945254)) b!1407718))

(declare-fun m!1297149 () Bool)

(assert (=> b!1407720 m!1297149))

(declare-fun m!1297151 () Bool)

(assert (=> b!1407717 m!1297151))

(assert (=> b!1407717 m!1297151))

(declare-fun m!1297153 () Bool)

(assert (=> b!1407717 m!1297153))

(declare-fun m!1297155 () Bool)

(assert (=> b!1407721 m!1297155))

(assert (=> b!1407721 m!1297155))

(declare-fun m!1297157 () Bool)

(assert (=> b!1407721 m!1297157))

(assert (=> b!1407716 m!1297155))

(assert (=> b!1407716 m!1297155))

(declare-fun m!1297159 () Bool)

(assert (=> b!1407716 m!1297159))

(declare-fun m!1297161 () Bool)

(assert (=> b!1407718 m!1297161))

(declare-fun m!1297163 () Bool)

(assert (=> b!1407718 m!1297163))

(assert (=> b!1407718 m!1297163))

(declare-fun m!1297165 () Bool)

(assert (=> b!1407718 m!1297165))

(assert (=> b!1407718 m!1297165))

(assert (=> b!1407718 m!1297163))

(declare-fun m!1297167 () Bool)

(assert (=> b!1407718 m!1297167))

(declare-fun m!1297169 () Bool)

(assert (=> b!1407723 m!1297169))

(declare-fun m!1297171 () Bool)

(assert (=> start!121074 m!1297171))

(declare-fun m!1297173 () Bool)

(assert (=> start!121074 m!1297173))

(assert (=> b!1407722 m!1297155))

(declare-fun m!1297175 () Bool)

(assert (=> b!1407722 m!1297175))

(assert (=> b!1407722 m!1297155))

(declare-fun m!1297177 () Bool)

(assert (=> b!1407722 m!1297177))

(assert (=> b!1407722 m!1297175))

(assert (=> b!1407722 m!1297155))

(declare-fun m!1297179 () Bool)

(assert (=> b!1407722 m!1297179))

(declare-fun m!1297181 () Bool)

(assert (=> b!1407722 m!1297181))

(push 1)

(assert (not b!1407720))

(assert (not b!1407718))

(assert (not b!1407716))

(assert (not start!121074))

(assert (not b!1407722))

(assert (not b!1407721))

(assert (not b!1407717))

(assert (not b!1407723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

