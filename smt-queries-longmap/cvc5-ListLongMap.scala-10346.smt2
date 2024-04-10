; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121626 () Bool)

(assert start!121626)

(declare-fun b!1413006 () Bool)

(declare-fun e!799646 () Bool)

(assert (=> b!1413006 (= e!799646 true)))

(declare-fun e!799643 () Bool)

(assert (=> b!1413006 e!799643))

(declare-fun res!950005 () Bool)

(assert (=> b!1413006 (=> (not res!950005) (not e!799643))))

(declare-datatypes ((array!96564 0))(
  ( (array!96565 (arr!46619 (Array (_ BitVec 32) (_ BitVec 64))) (size!47169 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96564)

(declare-datatypes ((SeekEntryResult!10930 0))(
  ( (MissingZero!10930 (index!46100 (_ BitVec 32))) (Found!10930 (index!46101 (_ BitVec 32))) (Intermediate!10930 (undefined!11742 Bool) (index!46102 (_ BitVec 32)) (x!127689 (_ BitVec 32))) (Undefined!10930) (MissingVacant!10930 (index!46103 (_ BitVec 32))) )
))
(declare-fun lt!622733 () SeekEntryResult!10930)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622735 () SeekEntryResult!10930)

(assert (=> b!1413006 (= res!950005 (and (not (undefined!11742 lt!622733)) (= (index!46102 lt!622733) i!1037) (bvslt (x!127689 lt!622733) (x!127689 lt!622735)) (= (select (store (arr!46619 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46102 lt!622733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47834 0))(
  ( (Unit!47835) )
))
(declare-fun lt!622734 () Unit!47834)

(declare-fun lt!622736 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47834)

(assert (=> b!1413006 (= lt!622734 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622736 (x!127689 lt!622735) (index!46102 lt!622735) (x!127689 lt!622733) (index!46102 lt!622733) (undefined!11742 lt!622733) mask!2840))))

(declare-fun b!1413007 () Bool)

(declare-fun res!950002 () Bool)

(declare-fun e!799644 () Bool)

(assert (=> b!1413007 (=> (not res!950002) (not e!799644))))

(assert (=> b!1413007 (= res!950002 (and (= (size!47169 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47169 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47169 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!799645 () Bool)

(declare-fun b!1413008 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96564 (_ BitVec 32)) SeekEntryResult!10930)

(assert (=> b!1413008 (= e!799645 (= (seekEntryOrOpen!0 (select (arr!46619 a!2901) j!112) a!2901 mask!2840) (Found!10930 j!112)))))

(declare-fun b!1413009 () Bool)

(declare-fun e!799642 () Bool)

(assert (=> b!1413009 (= e!799642 e!799646)))

(declare-fun res!949998 () Bool)

(assert (=> b!1413009 (=> res!949998 e!799646)))

(assert (=> b!1413009 (= res!949998 (or (= lt!622735 lt!622733) (not (is-Intermediate!10930 lt!622733))))))

(declare-fun lt!622737 () array!96564)

(declare-fun lt!622732 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96564 (_ BitVec 32)) SeekEntryResult!10930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413009 (= lt!622733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622732 mask!2840) lt!622732 lt!622737 mask!2840))))

(assert (=> b!1413009 (= lt!622732 (select (store (arr!46619 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413009 (= lt!622737 (array!96565 (store (arr!46619 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47169 a!2901)))))

(declare-fun b!1413010 () Bool)

(declare-fun res!949999 () Bool)

(assert (=> b!1413010 (=> (not res!949999) (not e!799644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413010 (= res!949999 (validKeyInArray!0 (select (arr!46619 a!2901) j!112)))))

(declare-fun res!950001 () Bool)

(assert (=> start!121626 (=> (not res!950001) (not e!799644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121626 (= res!950001 (validMask!0 mask!2840))))

(assert (=> start!121626 e!799644))

(assert (=> start!121626 true))

(declare-fun array_inv!35647 (array!96564) Bool)

(assert (=> start!121626 (array_inv!35647 a!2901)))

(declare-fun b!1413011 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96564 (_ BitVec 32)) SeekEntryResult!10930)

(assert (=> b!1413011 (= e!799643 (= (seekEntryOrOpen!0 lt!622732 lt!622737 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127689 lt!622733) (index!46102 lt!622733) (index!46102 lt!622733) (select (arr!46619 a!2901) j!112) lt!622737 mask!2840)))))

(declare-fun b!1413012 () Bool)

(declare-fun res!950000 () Bool)

(assert (=> b!1413012 (=> (not res!950000) (not e!799644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96564 (_ BitVec 32)) Bool)

(assert (=> b!1413012 (= res!950000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413013 () Bool)

(declare-fun res!950004 () Bool)

(assert (=> b!1413013 (=> (not res!950004) (not e!799644))))

(declare-datatypes ((List!33138 0))(
  ( (Nil!33135) (Cons!33134 (h!34409 (_ BitVec 64)) (t!47832 List!33138)) )
))
(declare-fun arrayNoDuplicates!0 (array!96564 (_ BitVec 32) List!33138) Bool)

(assert (=> b!1413013 (= res!950004 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33135))))

(declare-fun b!1413014 () Bool)

(assert (=> b!1413014 (= e!799644 (not e!799642))))

(declare-fun res!950003 () Bool)

(assert (=> b!1413014 (=> res!950003 e!799642)))

(assert (=> b!1413014 (= res!950003 (or (not (is-Intermediate!10930 lt!622735)) (undefined!11742 lt!622735)))))

(assert (=> b!1413014 e!799645))

(declare-fun res!949997 () Bool)

(assert (=> b!1413014 (=> (not res!949997) (not e!799645))))

(assert (=> b!1413014 (= res!949997 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622731 () Unit!47834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47834)

(assert (=> b!1413014 (= lt!622731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413014 (= lt!622735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622736 (select (arr!46619 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413014 (= lt!622736 (toIndex!0 (select (arr!46619 a!2901) j!112) mask!2840))))

(declare-fun b!1413015 () Bool)

(declare-fun res!949996 () Bool)

(assert (=> b!1413015 (=> (not res!949996) (not e!799644))))

(assert (=> b!1413015 (= res!949996 (validKeyInArray!0 (select (arr!46619 a!2901) i!1037)))))

(assert (= (and start!121626 res!950001) b!1413007))

(assert (= (and b!1413007 res!950002) b!1413015))

(assert (= (and b!1413015 res!949996) b!1413010))

(assert (= (and b!1413010 res!949999) b!1413012))

(assert (= (and b!1413012 res!950000) b!1413013))

(assert (= (and b!1413013 res!950004) b!1413014))

(assert (= (and b!1413014 res!949997) b!1413008))

(assert (= (and b!1413014 (not res!950003)) b!1413009))

(assert (= (and b!1413009 (not res!949998)) b!1413006))

(assert (= (and b!1413006 res!950005) b!1413011))

(declare-fun m!1303257 () Bool)

(assert (=> b!1413009 m!1303257))

(assert (=> b!1413009 m!1303257))

(declare-fun m!1303259 () Bool)

(assert (=> b!1413009 m!1303259))

(declare-fun m!1303261 () Bool)

(assert (=> b!1413009 m!1303261))

(declare-fun m!1303263 () Bool)

(assert (=> b!1413009 m!1303263))

(declare-fun m!1303265 () Bool)

(assert (=> start!121626 m!1303265))

(declare-fun m!1303267 () Bool)

(assert (=> start!121626 m!1303267))

(declare-fun m!1303269 () Bool)

(assert (=> b!1413008 m!1303269))

(assert (=> b!1413008 m!1303269))

(declare-fun m!1303271 () Bool)

(assert (=> b!1413008 m!1303271))

(declare-fun m!1303273 () Bool)

(assert (=> b!1413015 m!1303273))

(assert (=> b!1413015 m!1303273))

(declare-fun m!1303275 () Bool)

(assert (=> b!1413015 m!1303275))

(assert (=> b!1413014 m!1303269))

(declare-fun m!1303277 () Bool)

(assert (=> b!1413014 m!1303277))

(assert (=> b!1413014 m!1303269))

(declare-fun m!1303279 () Bool)

(assert (=> b!1413014 m!1303279))

(declare-fun m!1303281 () Bool)

(assert (=> b!1413014 m!1303281))

(assert (=> b!1413014 m!1303269))

(declare-fun m!1303283 () Bool)

(assert (=> b!1413014 m!1303283))

(declare-fun m!1303285 () Bool)

(assert (=> b!1413013 m!1303285))

(declare-fun m!1303287 () Bool)

(assert (=> b!1413011 m!1303287))

(assert (=> b!1413011 m!1303269))

(assert (=> b!1413011 m!1303269))

(declare-fun m!1303289 () Bool)

(assert (=> b!1413011 m!1303289))

(declare-fun m!1303291 () Bool)

(assert (=> b!1413012 m!1303291))

(assert (=> b!1413006 m!1303261))

(declare-fun m!1303293 () Bool)

(assert (=> b!1413006 m!1303293))

(declare-fun m!1303295 () Bool)

(assert (=> b!1413006 m!1303295))

(assert (=> b!1413010 m!1303269))

(assert (=> b!1413010 m!1303269))

(declare-fun m!1303297 () Bool)

(assert (=> b!1413010 m!1303297))

(push 1)

