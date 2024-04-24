; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121368 () Bool)

(assert start!121368)

(declare-fun res!947190 () Bool)

(declare-fun e!798117 () Bool)

(assert (=> start!121368 (=> (not res!947190) (not e!798117))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121368 (= res!947190 (validMask!0 mask!2840))))

(assert (=> start!121368 e!798117))

(assert (=> start!121368 true))

(declare-datatypes ((array!96444 0))(
  ( (array!96445 (arr!46563 (Array (_ BitVec 32) (_ BitVec 64))) (size!47114 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96444)

(declare-fun array_inv!35844 (array!96444) Bool)

(assert (=> start!121368 (array_inv!35844 a!2901)))

(declare-fun b!1410146 () Bool)

(declare-fun res!947185 () Bool)

(assert (=> b!1410146 (=> (not res!947185) (not e!798117))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410146 (= res!947185 (validKeyInArray!0 (select (arr!46563 a!2901) i!1037)))))

(declare-fun b!1410147 () Bool)

(declare-fun e!798119 () Bool)

(assert (=> b!1410147 (= e!798119 true)))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10777 0))(
  ( (MissingZero!10777 (index!45485 (_ BitVec 32))) (Found!10777 (index!45486 (_ BitVec 32))) (Intermediate!10777 (undefined!11589 Bool) (index!45487 (_ BitVec 32)) (x!127229 (_ BitVec 32))) (Undefined!10777) (MissingVacant!10777 (index!45488 (_ BitVec 32))) )
))
(declare-fun lt!620958 () SeekEntryResult!10777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96444 (_ BitVec 32)) SeekEntryResult!10777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410147 (= lt!620958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96445 (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47114 a!2901)) mask!2840))))

(declare-fun b!1410148 () Bool)

(declare-fun e!798116 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96444 (_ BitVec 32)) SeekEntryResult!10777)

(assert (=> b!1410148 (= e!798116 (= (seekEntryOrOpen!0 (select (arr!46563 a!2901) j!112) a!2901 mask!2840) (Found!10777 j!112)))))

(declare-fun b!1410149 () Bool)

(declare-fun res!947188 () Bool)

(assert (=> b!1410149 (=> (not res!947188) (not e!798117))))

(assert (=> b!1410149 (= res!947188 (validKeyInArray!0 (select (arr!46563 a!2901) j!112)))))

(declare-fun b!1410150 () Bool)

(declare-fun res!947187 () Bool)

(assert (=> b!1410150 (=> (not res!947187) (not e!798117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96444 (_ BitVec 32)) Bool)

(assert (=> b!1410150 (= res!947187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410151 () Bool)

(assert (=> b!1410151 (= e!798117 (not e!798119))))

(declare-fun res!947189 () Bool)

(assert (=> b!1410151 (=> res!947189 e!798119)))

(declare-fun lt!620960 () SeekEntryResult!10777)

(assert (=> b!1410151 (= res!947189 (or (not (is-Intermediate!10777 lt!620960)) (undefined!11589 lt!620960)))))

(assert (=> b!1410151 e!798116))

(declare-fun res!947191 () Bool)

(assert (=> b!1410151 (=> (not res!947191) (not e!798116))))

(assert (=> b!1410151 (= res!947191 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47555 0))(
  ( (Unit!47556) )
))
(declare-fun lt!620959 () Unit!47555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47555)

(assert (=> b!1410151 (= lt!620959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410151 (= lt!620960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46563 a!2901) j!112) mask!2840) (select (arr!46563 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410152 () Bool)

(declare-fun res!947184 () Bool)

(assert (=> b!1410152 (=> (not res!947184) (not e!798117))))

(assert (=> b!1410152 (= res!947184 (and (= (size!47114 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47114 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47114 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410153 () Bool)

(declare-fun res!947186 () Bool)

(assert (=> b!1410153 (=> (not res!947186) (not e!798117))))

(declare-datatypes ((List!33069 0))(
  ( (Nil!33066) (Cons!33065 (h!34336 (_ BitVec 64)) (t!47755 List!33069)) )
))
(declare-fun arrayNoDuplicates!0 (array!96444 (_ BitVec 32) List!33069) Bool)

(assert (=> b!1410153 (= res!947186 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33066))))

(assert (= (and start!121368 res!947190) b!1410152))

(assert (= (and b!1410152 res!947184) b!1410146))

(assert (= (and b!1410146 res!947185) b!1410149))

(assert (= (and b!1410149 res!947188) b!1410150))

(assert (= (and b!1410150 res!947187) b!1410153))

(assert (= (and b!1410153 res!947186) b!1410151))

(assert (= (and b!1410151 res!947191) b!1410148))

(assert (= (and b!1410151 (not res!947189)) b!1410147))

(declare-fun m!1299915 () Bool)

(assert (=> b!1410151 m!1299915))

(declare-fun m!1299917 () Bool)

(assert (=> b!1410151 m!1299917))

(assert (=> b!1410151 m!1299915))

(declare-fun m!1299919 () Bool)

(assert (=> b!1410151 m!1299919))

(assert (=> b!1410151 m!1299917))

(assert (=> b!1410151 m!1299915))

(declare-fun m!1299921 () Bool)

(assert (=> b!1410151 m!1299921))

(declare-fun m!1299923 () Bool)

(assert (=> b!1410151 m!1299923))

(declare-fun m!1299925 () Bool)

(assert (=> start!121368 m!1299925))

(declare-fun m!1299927 () Bool)

(assert (=> start!121368 m!1299927))

(declare-fun m!1299929 () Bool)

(assert (=> b!1410147 m!1299929))

(declare-fun m!1299931 () Bool)

(assert (=> b!1410147 m!1299931))

(assert (=> b!1410147 m!1299931))

(declare-fun m!1299933 () Bool)

(assert (=> b!1410147 m!1299933))

(assert (=> b!1410147 m!1299933))

(assert (=> b!1410147 m!1299931))

(declare-fun m!1299935 () Bool)

(assert (=> b!1410147 m!1299935))

(declare-fun m!1299937 () Bool)

(assert (=> b!1410153 m!1299937))

(declare-fun m!1299939 () Bool)

(assert (=> b!1410146 m!1299939))

(assert (=> b!1410146 m!1299939))

(declare-fun m!1299941 () Bool)

(assert (=> b!1410146 m!1299941))

(declare-fun m!1299943 () Bool)

(assert (=> b!1410150 m!1299943))

(assert (=> b!1410148 m!1299915))

(assert (=> b!1410148 m!1299915))

(declare-fun m!1299945 () Bool)

(assert (=> b!1410148 m!1299945))

(assert (=> b!1410149 m!1299915))

(assert (=> b!1410149 m!1299915))

(declare-fun m!1299947 () Bool)

(assert (=> b!1410149 m!1299947))

(push 1)

(assert (not b!1410147))

(assert (not b!1410149))

(assert (not b!1410150))

(assert (not b!1410146))

(assert (not b!1410148))

(assert (not b!1410151))

(assert (not start!121368))

(assert (not b!1410153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

