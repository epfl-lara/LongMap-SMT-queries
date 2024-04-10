; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32066 () Bool)

(assert start!32066)

(declare-fun b!319914 () Bool)

(declare-fun res!174229 () Bool)

(declare-fun e!198609 () Bool)

(assert (=> b!319914 (=> (not res!174229) (not e!198609))))

(declare-datatypes ((array!16340 0))(
  ( (array!16341 (arr!7732 (Array (_ BitVec 32) (_ BitVec 64))) (size!8084 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16340)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319914 (= res!174229 (and (= (size!8084 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8084 a!3305))))))

(declare-fun b!319915 () Bool)

(declare-fun res!174227 () Bool)

(assert (=> b!319915 (=> (not res!174227) (not e!198609))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319915 (= res!174227 (validKeyInArray!0 k!2497))))

(declare-fun b!319916 () Bool)

(assert (=> b!319916 (= e!198609 false)))

(declare-fun lt!155895 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319916 (= lt!155895 (toIndex!0 k!2497 mask!3777))))

(declare-fun res!174230 () Bool)

(assert (=> start!32066 (=> (not res!174230) (not e!198609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32066 (= res!174230 (validMask!0 mask!3777))))

(assert (=> start!32066 e!198609))

(assert (=> start!32066 true))

(declare-fun array_inv!5695 (array!16340) Bool)

(assert (=> start!32066 (array_inv!5695 a!3305)))

(declare-fun b!319917 () Bool)

(declare-fun res!174231 () Bool)

(assert (=> b!319917 (=> (not res!174231) (not e!198609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16340 (_ BitVec 32)) Bool)

(assert (=> b!319917 (= res!174231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319918 () Bool)

(declare-fun res!174228 () Bool)

(assert (=> b!319918 (=> (not res!174228) (not e!198609))))

(declare-datatypes ((SeekEntryResult!2863 0))(
  ( (MissingZero!2863 (index!13628 (_ BitVec 32))) (Found!2863 (index!13629 (_ BitVec 32))) (Intermediate!2863 (undefined!3675 Bool) (index!13630 (_ BitVec 32)) (x!31897 (_ BitVec 32))) (Undefined!2863) (MissingVacant!2863 (index!13631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16340 (_ BitVec 32)) SeekEntryResult!2863)

(assert (=> b!319918 (= res!174228 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2863 i!1250)))))

(declare-fun b!319919 () Bool)

(declare-fun res!174226 () Bool)

(assert (=> b!319919 (=> (not res!174226) (not e!198609))))

(declare-fun arrayContainsKey!0 (array!16340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319919 (= res!174226 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32066 res!174230) b!319914))

(assert (= (and b!319914 res!174229) b!319915))

(assert (= (and b!319915 res!174227) b!319919))

(assert (= (and b!319919 res!174226) b!319918))

(assert (= (and b!319918 res!174228) b!319917))

(assert (= (and b!319917 res!174231) b!319916))

(declare-fun m!328395 () Bool)

(assert (=> b!319919 m!328395))

(declare-fun m!328397 () Bool)

(assert (=> start!32066 m!328397))

(declare-fun m!328399 () Bool)

(assert (=> start!32066 m!328399))

(declare-fun m!328401 () Bool)

(assert (=> b!319915 m!328401))

(declare-fun m!328403 () Bool)

(assert (=> b!319917 m!328403))

(declare-fun m!328405 () Bool)

(assert (=> b!319916 m!328405))

(declare-fun m!328407 () Bool)

(assert (=> b!319918 m!328407))

(push 1)

(assert (not b!319915))

(assert (not b!319916))

(assert (not b!319917))

(assert (not b!319918))

(assert (not start!32066))

(assert (not b!319919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

