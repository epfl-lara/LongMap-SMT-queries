; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123150 () Bool)

(assert start!123150)

(declare-fun res!961615 () Bool)

(declare-fun e!806323 () Bool)

(assert (=> start!123150 (=> (not res!961615) (not e!806323))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123150 (= res!961615 (validMask!0 mask!2608))))

(assert (=> start!123150 e!806323))

(assert (=> start!123150 true))

(declare-datatypes ((array!97386 0))(
  ( (array!97387 (arr!47007 (Array (_ BitVec 32) (_ BitVec 64))) (size!47558 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97386)

(declare-fun array_inv!36288 (array!97386) Bool)

(assert (=> start!123150 (array_inv!36288 a!2831)))

(declare-fun b!1427059 () Bool)

(declare-fun res!961613 () Bool)

(assert (=> b!1427059 (=> (not res!961613) (not e!806323))))

(declare-datatypes ((List!33504 0))(
  ( (Nil!33501) (Cons!33500 (h!34813 (_ BitVec 64)) (t!48190 List!33504)) )
))
(declare-fun arrayNoDuplicates!0 (array!97386 (_ BitVec 32) List!33504) Bool)

(assert (=> b!1427059 (= res!961613 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33501))))

(declare-fun b!1427060 () Bool)

(declare-fun res!961612 () Bool)

(assert (=> b!1427060 (=> (not res!961612) (not e!806323))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427060 (= res!961612 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47558 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47558 a!2831))))))

(declare-fun b!1427061 () Bool)

(declare-fun res!961610 () Bool)

(assert (=> b!1427061 (=> (not res!961610) (not e!806323))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11188 0))(
  ( (MissingZero!11188 (index!47144 (_ BitVec 32))) (Found!11188 (index!47145 (_ BitVec 32))) (Intermediate!11188 (undefined!12000 Bool) (index!47146 (_ BitVec 32)) (x!128935 (_ BitVec 32))) (Undefined!11188) (MissingVacant!11188 (index!47147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97386 (_ BitVec 32)) SeekEntryResult!11188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427061 (= res!961610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47007 a!2831) j!81) mask!2608) (select (arr!47007 a!2831) j!81) a!2831 mask!2608) (Intermediate!11188 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1427062 () Bool)

(declare-fun res!961609 () Bool)

(assert (=> b!1427062 (=> (not res!961609) (not e!806323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97386 (_ BitVec 32)) Bool)

(assert (=> b!1427062 (= res!961609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427063 () Bool)

(assert (=> b!1427063 (= e!806323 false)))

(declare-fun lt!628364 () SeekEntryResult!11188)

(assert (=> b!1427063 (= lt!628364 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47007 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427064 () Bool)

(declare-fun res!961614 () Bool)

(assert (=> b!1427064 (=> (not res!961614) (not e!806323))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1427064 (= res!961614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47007 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!47007 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97387 (store (arr!47007 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47558 a!2831)) mask!2608) (Intermediate!11188 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1427065 () Bool)

(declare-fun res!961611 () Bool)

(assert (=> b!1427065 (=> (not res!961611) (not e!806323))))

(assert (=> b!1427065 (= res!961611 (and (= (size!47558 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47558 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47558 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427066 () Bool)

(declare-fun res!961607 () Bool)

(assert (=> b!1427066 (=> (not res!961607) (not e!806323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427066 (= res!961607 (validKeyInArray!0 (select (arr!47007 a!2831) j!81)))))

(declare-fun b!1427067 () Bool)

(declare-fun res!961608 () Bool)

(assert (=> b!1427067 (=> (not res!961608) (not e!806323))))

(assert (=> b!1427067 (= res!961608 (validKeyInArray!0 (select (arr!47007 a!2831) i!982)))))

(assert (= (and start!123150 res!961615) b!1427065))

(assert (= (and b!1427065 res!961611) b!1427067))

(assert (= (and b!1427067 res!961608) b!1427066))

(assert (= (and b!1427066 res!961607) b!1427062))

(assert (= (and b!1427062 res!961609) b!1427059))

(assert (= (and b!1427059 res!961613) b!1427060))

(assert (= (and b!1427060 res!961612) b!1427061))

(assert (= (and b!1427061 res!961610) b!1427064))

(assert (= (and b!1427064 res!961614) b!1427063))

(declare-fun m!1317771 () Bool)

(assert (=> b!1427062 m!1317771))

(declare-fun m!1317773 () Bool)

(assert (=> b!1427064 m!1317773))

(declare-fun m!1317775 () Bool)

(assert (=> b!1427064 m!1317775))

(assert (=> b!1427064 m!1317775))

(declare-fun m!1317777 () Bool)

(assert (=> b!1427064 m!1317777))

(assert (=> b!1427064 m!1317777))

(assert (=> b!1427064 m!1317775))

(declare-fun m!1317779 () Bool)

(assert (=> b!1427064 m!1317779))

(declare-fun m!1317781 () Bool)

(assert (=> start!123150 m!1317781))

(declare-fun m!1317783 () Bool)

(assert (=> start!123150 m!1317783))

(declare-fun m!1317785 () Bool)

(assert (=> b!1427066 m!1317785))

(assert (=> b!1427066 m!1317785))

(declare-fun m!1317787 () Bool)

(assert (=> b!1427066 m!1317787))

(assert (=> b!1427061 m!1317785))

(assert (=> b!1427061 m!1317785))

(declare-fun m!1317789 () Bool)

(assert (=> b!1427061 m!1317789))

(assert (=> b!1427061 m!1317789))

(assert (=> b!1427061 m!1317785))

(declare-fun m!1317791 () Bool)

(assert (=> b!1427061 m!1317791))

(declare-fun m!1317793 () Bool)

(assert (=> b!1427059 m!1317793))

(declare-fun m!1317795 () Bool)

(assert (=> b!1427067 m!1317795))

(assert (=> b!1427067 m!1317795))

(declare-fun m!1317797 () Bool)

(assert (=> b!1427067 m!1317797))

(assert (=> b!1427063 m!1317785))

(assert (=> b!1427063 m!1317785))

(declare-fun m!1317799 () Bool)

(assert (=> b!1427063 m!1317799))

(push 1)

(assert (not start!123150))

(assert (not b!1427064))

(assert (not b!1427059))

(assert (not b!1427066))

(assert (not b!1427067))

(assert (not b!1427062))

(assert (not b!1427061))

(assert (not b!1427063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

