; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131590 () Bool)

(assert start!131590)

(declare-fun b!1541256 () Bool)

(declare-fun res!1056660 () Bool)

(declare-fun e!857590 () Bool)

(assert (=> b!1541256 (=> (not res!1056660) (not e!857590))))

(declare-datatypes ((array!102359 0))(
  ( (array!102360 (arr!49386 (Array (_ BitVec 32) (_ BitVec 64))) (size!49937 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102359)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102359 (_ BitVec 32)) Bool)

(assert (=> b!1541256 (= res!1056660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541257 () Bool)

(assert (=> b!1541257 (= e!857590 false)))

(declare-fun lt!665853 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541257 (= lt!665853 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541258 () Bool)

(declare-fun res!1056662 () Bool)

(assert (=> b!1541258 (=> (not res!1056662) (not e!857590))))

(declare-datatypes ((List!35847 0))(
  ( (Nil!35844) (Cons!35843 (h!37306 (_ BitVec 64)) (t!50533 List!35847)) )
))
(declare-fun arrayNoDuplicates!0 (array!102359 (_ BitVec 32) List!35847) Bool)

(assert (=> b!1541258 (= res!1056662 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35844))))

(declare-fun b!1541259 () Bool)

(declare-fun res!1056665 () Bool)

(assert (=> b!1541259 (=> (not res!1056665) (not e!857590))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13407 0))(
  ( (MissingZero!13407 (index!56023 (_ BitVec 32))) (Found!13407 (index!56024 (_ BitVec 32))) (Intermediate!13407 (undefined!14219 Bool) (index!56025 (_ BitVec 32)) (x!137958 (_ BitVec 32))) (Undefined!13407) (MissingVacant!13407 (index!56026 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102359 (_ BitVec 32)) SeekEntryResult!13407)

(assert (=> b!1541259 (= res!1056665 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49386 a!2792) j!64) a!2792 mask!2480) (Found!13407 j!64)))))

(declare-fun b!1541260 () Bool)

(declare-fun res!1056664 () Bool)

(assert (=> b!1541260 (=> (not res!1056664) (not e!857590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541260 (= res!1056664 (validKeyInArray!0 (select (arr!49386 a!2792) j!64)))))

(declare-fun b!1541261 () Bool)

(declare-fun res!1056659 () Bool)

(assert (=> b!1541261 (=> (not res!1056659) (not e!857590))))

(assert (=> b!1541261 (= res!1056659 (not (= (select (arr!49386 a!2792) index!463) (select (arr!49386 a!2792) j!64))))))

(declare-fun b!1541262 () Bool)

(declare-fun res!1056666 () Bool)

(assert (=> b!1541262 (=> (not res!1056666) (not e!857590))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541262 (= res!1056666 (validKeyInArray!0 (select (arr!49386 a!2792) i!951)))))

(declare-fun res!1056661 () Bool)

(assert (=> start!131590 (=> (not res!1056661) (not e!857590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131590 (= res!1056661 (validMask!0 mask!2480))))

(assert (=> start!131590 e!857590))

(assert (=> start!131590 true))

(declare-fun array_inv!38667 (array!102359) Bool)

(assert (=> start!131590 (array_inv!38667 a!2792)))

(declare-fun b!1541263 () Bool)

(declare-fun res!1056663 () Bool)

(assert (=> b!1541263 (=> (not res!1056663) (not e!857590))))

(assert (=> b!1541263 (= res!1056663 (and (= (size!49937 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49937 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49937 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541264 () Bool)

(declare-fun res!1056658 () Bool)

(assert (=> b!1541264 (=> (not res!1056658) (not e!857590))))

(assert (=> b!1541264 (= res!1056658 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49937 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49937 a!2792)) (= (select (arr!49386 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131590 res!1056661) b!1541263))

(assert (= (and b!1541263 res!1056663) b!1541262))

(assert (= (and b!1541262 res!1056666) b!1541260))

(assert (= (and b!1541260 res!1056664) b!1541256))

(assert (= (and b!1541256 res!1056660) b!1541258))

(assert (= (and b!1541258 res!1056662) b!1541264))

(assert (= (and b!1541264 res!1056658) b!1541259))

(assert (= (and b!1541259 res!1056665) b!1541261))

(assert (= (and b!1541261 res!1056659) b!1541257))

(declare-fun m!1423447 () Bool)

(assert (=> b!1541261 m!1423447))

(declare-fun m!1423449 () Bool)

(assert (=> b!1541261 m!1423449))

(declare-fun m!1423451 () Bool)

(assert (=> b!1541257 m!1423451))

(declare-fun m!1423453 () Bool)

(assert (=> start!131590 m!1423453))

(declare-fun m!1423455 () Bool)

(assert (=> start!131590 m!1423455))

(declare-fun m!1423457 () Bool)

(assert (=> b!1541258 m!1423457))

(declare-fun m!1423459 () Bool)

(assert (=> b!1541264 m!1423459))

(declare-fun m!1423461 () Bool)

(assert (=> b!1541256 m!1423461))

(declare-fun m!1423463 () Bool)

(assert (=> b!1541262 m!1423463))

(assert (=> b!1541262 m!1423463))

(declare-fun m!1423465 () Bool)

(assert (=> b!1541262 m!1423465))

(assert (=> b!1541259 m!1423449))

(assert (=> b!1541259 m!1423449))

(declare-fun m!1423467 () Bool)

(assert (=> b!1541259 m!1423467))

(assert (=> b!1541260 m!1423449))

(assert (=> b!1541260 m!1423449))

(declare-fun m!1423469 () Bool)

(assert (=> b!1541260 m!1423469))

(push 1)

(assert (not b!1541259))

(assert (not b!1541257))

(assert (not b!1541256))

(assert (not b!1541258))

(assert (not b!1541262))

(assert (not start!131590))

(assert (not b!1541260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

