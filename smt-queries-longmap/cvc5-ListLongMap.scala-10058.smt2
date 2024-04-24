; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118698 () Bool)

(assert start!118698)

(declare-fun res!927275 () Bool)

(declare-fun e!785872 () Bool)

(assert (=> start!118698 (=> (not res!927275) (not e!785872))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118698 (= res!927275 (validMask!0 mask!2987))))

(assert (=> start!118698 e!785872))

(assert (=> start!118698 true))

(declare-datatypes ((array!94872 0))(
  ( (array!94873 (arr!45810 (Array (_ BitVec 32) (_ BitVec 64))) (size!46361 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94872)

(declare-fun array_inv!35091 (array!94872) Bool)

(assert (=> start!118698 (array_inv!35091 a!2938)))

(declare-fun b!1386814 () Bool)

(declare-fun res!927274 () Bool)

(assert (=> b!1386814 (=> (not res!927274) (not e!785872))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386814 (= res!927274 (validKeyInArray!0 (select (arr!45810 a!2938) i!1065)))))

(declare-fun b!1386816 () Bool)

(assert (=> b!1386816 (= e!785872 false)))

(declare-fun lt!609741 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94872 (_ BitVec 32)) Bool)

(assert (=> b!1386816 (= lt!609741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386813 () Bool)

(declare-fun res!927276 () Bool)

(assert (=> b!1386813 (=> (not res!927276) (not e!785872))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386813 (= res!927276 (and (= (size!46361 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46361 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46361 a!2938))))))

(declare-fun b!1386815 () Bool)

(declare-fun res!927277 () Bool)

(assert (=> b!1386815 (=> (not res!927277) (not e!785872))))

(declare-datatypes ((List!32325 0))(
  ( (Nil!32322) (Cons!32321 (h!33539 (_ BitVec 64)) (t!47011 List!32325)) )
))
(declare-fun arrayNoDuplicates!0 (array!94872 (_ BitVec 32) List!32325) Bool)

(assert (=> b!1386815 (= res!927277 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32322))))

(assert (= (and start!118698 res!927275) b!1386813))

(assert (= (and b!1386813 res!927276) b!1386814))

(assert (= (and b!1386814 res!927274) b!1386815))

(assert (= (and b!1386815 res!927277) b!1386816))

(declare-fun m!1272429 () Bool)

(assert (=> start!118698 m!1272429))

(declare-fun m!1272431 () Bool)

(assert (=> start!118698 m!1272431))

(declare-fun m!1272433 () Bool)

(assert (=> b!1386814 m!1272433))

(assert (=> b!1386814 m!1272433))

(declare-fun m!1272435 () Bool)

(assert (=> b!1386814 m!1272435))

(declare-fun m!1272437 () Bool)

(assert (=> b!1386816 m!1272437))

(declare-fun m!1272439 () Bool)

(assert (=> b!1386815 m!1272439))

(push 1)

(assert (not b!1386815))

(assert (not start!118698))

(assert (not b!1386816))

(assert (not b!1386814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

