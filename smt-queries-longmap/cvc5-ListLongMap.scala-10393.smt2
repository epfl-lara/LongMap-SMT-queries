; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122628 () Bool)

(assert start!122628)

(declare-fun b!1419885 () Bool)

(declare-fun res!954808 () Bool)

(declare-fun e!803560 () Bool)

(assert (=> b!1419885 (=> (not res!954808) (not e!803560))))

(declare-datatypes ((array!96993 0))(
  ( (array!96994 (arr!46815 (Array (_ BitVec 32) (_ BitVec 64))) (size!47366 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96993)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419885 (= res!954808 (validKeyInArray!0 (select (arr!46815 a!2831) j!81)))))

(declare-fun b!1419886 () Bool)

(assert (=> b!1419886 (= e!803560 false)))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626057 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419886 (= lt!626057 (toIndex!0 (select (arr!46815 a!2831) j!81) mask!2608))))

(declare-fun b!1419887 () Bool)

(declare-fun res!954813 () Bool)

(assert (=> b!1419887 (=> (not res!954813) (not e!803560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96993 (_ BitVec 32)) Bool)

(assert (=> b!1419887 (= res!954813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419888 () Bool)

(declare-fun res!954811 () Bool)

(assert (=> b!1419888 (=> (not res!954811) (not e!803560))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419888 (= res!954811 (and (= (size!47366 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47366 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47366 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419889 () Bool)

(declare-fun res!954814 () Bool)

(assert (=> b!1419889 (=> (not res!954814) (not e!803560))))

(assert (=> b!1419889 (= res!954814 (validKeyInArray!0 (select (arr!46815 a!2831) i!982)))))

(declare-fun res!954810 () Bool)

(assert (=> start!122628 (=> (not res!954810) (not e!803560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122628 (= res!954810 (validMask!0 mask!2608))))

(assert (=> start!122628 e!803560))

(assert (=> start!122628 true))

(declare-fun array_inv!36096 (array!96993) Bool)

(assert (=> start!122628 (array_inv!36096 a!2831)))

(declare-fun b!1419890 () Bool)

(declare-fun res!954809 () Bool)

(assert (=> b!1419890 (=> (not res!954809) (not e!803560))))

(declare-datatypes ((List!33312 0))(
  ( (Nil!33309) (Cons!33308 (h!34612 (_ BitVec 64)) (t!47998 List!33312)) )
))
(declare-fun arrayNoDuplicates!0 (array!96993 (_ BitVec 32) List!33312) Bool)

(assert (=> b!1419890 (= res!954809 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33309))))

(declare-fun b!1419891 () Bool)

(declare-fun res!954812 () Bool)

(assert (=> b!1419891 (=> (not res!954812) (not e!803560))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419891 (= res!954812 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47366 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47366 a!2831))))))

(assert (= (and start!122628 res!954810) b!1419888))

(assert (= (and b!1419888 res!954811) b!1419889))

(assert (= (and b!1419889 res!954814) b!1419885))

(assert (= (and b!1419885 res!954808) b!1419887))

(assert (= (and b!1419887 res!954813) b!1419890))

(assert (= (and b!1419890 res!954809) b!1419891))

(assert (= (and b!1419891 res!954812) b!1419886))

(declare-fun m!1310733 () Bool)

(assert (=> start!122628 m!1310733))

(declare-fun m!1310735 () Bool)

(assert (=> start!122628 m!1310735))

(declare-fun m!1310737 () Bool)

(assert (=> b!1419885 m!1310737))

(assert (=> b!1419885 m!1310737))

(declare-fun m!1310739 () Bool)

(assert (=> b!1419885 m!1310739))

(declare-fun m!1310741 () Bool)

(assert (=> b!1419890 m!1310741))

(declare-fun m!1310743 () Bool)

(assert (=> b!1419887 m!1310743))

(declare-fun m!1310745 () Bool)

(assert (=> b!1419889 m!1310745))

(assert (=> b!1419889 m!1310745))

(declare-fun m!1310747 () Bool)

(assert (=> b!1419889 m!1310747))

(assert (=> b!1419886 m!1310737))

(assert (=> b!1419886 m!1310737))

(declare-fun m!1310749 () Bool)

(assert (=> b!1419886 m!1310749))

(push 1)

(assert (not b!1419890))

(assert (not b!1419886))

(assert (not start!122628))

(assert (not b!1419885))

(assert (not b!1419887))

(assert (not b!1419889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

