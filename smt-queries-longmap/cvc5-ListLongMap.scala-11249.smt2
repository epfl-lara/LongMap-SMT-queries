; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131584 () Bool)

(assert start!131584)

(declare-fun b!1541175 () Bool)

(declare-fun res!1056584 () Bool)

(declare-fun e!857572 () Bool)

(assert (=> b!1541175 (=> (not res!1056584) (not e!857572))))

(declare-datatypes ((array!102353 0))(
  ( (array!102354 (arr!49383 (Array (_ BitVec 32) (_ BitVec 64))) (size!49934 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102353)

(declare-datatypes ((List!35844 0))(
  ( (Nil!35841) (Cons!35840 (h!37303 (_ BitVec 64)) (t!50530 List!35844)) )
))
(declare-fun arrayNoDuplicates!0 (array!102353 (_ BitVec 32) List!35844) Bool)

(assert (=> b!1541175 (= res!1056584 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35841))))

(declare-fun b!1541176 () Bool)

(declare-fun res!1056581 () Bool)

(assert (=> b!1541176 (=> (not res!1056581) (not e!857572))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13404 0))(
  ( (MissingZero!13404 (index!56011 (_ BitVec 32))) (Found!13404 (index!56012 (_ BitVec 32))) (Intermediate!13404 (undefined!14216 Bool) (index!56013 (_ BitVec 32)) (x!137947 (_ BitVec 32))) (Undefined!13404) (MissingVacant!13404 (index!56014 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102353 (_ BitVec 32)) SeekEntryResult!13404)

(assert (=> b!1541176 (= res!1056581 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49383 a!2792) j!64) a!2792 mask!2480) (Found!13404 j!64)))))

(declare-fun b!1541177 () Bool)

(declare-fun res!1056580 () Bool)

(assert (=> b!1541177 (=> (not res!1056580) (not e!857572))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541177 (= res!1056580 (validKeyInArray!0 (select (arr!49383 a!2792) i!951)))))

(declare-fun b!1541178 () Bool)

(assert (=> b!1541178 (= e!857572 false)))

(declare-fun lt!665844 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541178 (= lt!665844 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541179 () Bool)

(declare-fun res!1056577 () Bool)

(assert (=> b!1541179 (=> (not res!1056577) (not e!857572))))

(assert (=> b!1541179 (= res!1056577 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49934 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49934 a!2792)) (= (select (arr!49383 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541180 () Bool)

(declare-fun res!1056585 () Bool)

(assert (=> b!1541180 (=> (not res!1056585) (not e!857572))))

(assert (=> b!1541180 (= res!1056585 (not (= (select (arr!49383 a!2792) index!463) (select (arr!49383 a!2792) j!64))))))

(declare-fun res!1056583 () Bool)

(assert (=> start!131584 (=> (not res!1056583) (not e!857572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131584 (= res!1056583 (validMask!0 mask!2480))))

(assert (=> start!131584 e!857572))

(assert (=> start!131584 true))

(declare-fun array_inv!38664 (array!102353) Bool)

(assert (=> start!131584 (array_inv!38664 a!2792)))

(declare-fun b!1541181 () Bool)

(declare-fun res!1056578 () Bool)

(assert (=> b!1541181 (=> (not res!1056578) (not e!857572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102353 (_ BitVec 32)) Bool)

(assert (=> b!1541181 (= res!1056578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541182 () Bool)

(declare-fun res!1056579 () Bool)

(assert (=> b!1541182 (=> (not res!1056579) (not e!857572))))

(assert (=> b!1541182 (= res!1056579 (validKeyInArray!0 (select (arr!49383 a!2792) j!64)))))

(declare-fun b!1541183 () Bool)

(declare-fun res!1056582 () Bool)

(assert (=> b!1541183 (=> (not res!1056582) (not e!857572))))

(assert (=> b!1541183 (= res!1056582 (and (= (size!49934 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49934 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49934 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131584 res!1056583) b!1541183))

(assert (= (and b!1541183 res!1056582) b!1541177))

(assert (= (and b!1541177 res!1056580) b!1541182))

(assert (= (and b!1541182 res!1056579) b!1541181))

(assert (= (and b!1541181 res!1056578) b!1541175))

(assert (= (and b!1541175 res!1056584) b!1541179))

(assert (= (and b!1541179 res!1056577) b!1541176))

(assert (= (and b!1541176 res!1056581) b!1541180))

(assert (= (and b!1541180 res!1056585) b!1541178))

(declare-fun m!1423375 () Bool)

(assert (=> b!1541177 m!1423375))

(assert (=> b!1541177 m!1423375))

(declare-fun m!1423377 () Bool)

(assert (=> b!1541177 m!1423377))

(declare-fun m!1423379 () Bool)

(assert (=> start!131584 m!1423379))

(declare-fun m!1423381 () Bool)

(assert (=> start!131584 m!1423381))

(declare-fun m!1423383 () Bool)

(assert (=> b!1541179 m!1423383))

(declare-fun m!1423385 () Bool)

(assert (=> b!1541180 m!1423385))

(declare-fun m!1423387 () Bool)

(assert (=> b!1541180 m!1423387))

(declare-fun m!1423389 () Bool)

(assert (=> b!1541178 m!1423389))

(assert (=> b!1541176 m!1423387))

(assert (=> b!1541176 m!1423387))

(declare-fun m!1423391 () Bool)

(assert (=> b!1541176 m!1423391))

(declare-fun m!1423393 () Bool)

(assert (=> b!1541181 m!1423393))

(assert (=> b!1541182 m!1423387))

(assert (=> b!1541182 m!1423387))

(declare-fun m!1423395 () Bool)

(assert (=> b!1541182 m!1423395))

(declare-fun m!1423397 () Bool)

(assert (=> b!1541175 m!1423397))

(push 1)

(assert (not b!1541181))

(assert (not b!1541175))

(assert (not b!1541182))

(assert (not start!131584))

(assert (not b!1541176))

(assert (not b!1541177))

(assert (not b!1541178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

