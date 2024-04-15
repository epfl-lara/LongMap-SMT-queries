; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134596 () Bool)

(assert start!134596)

(declare-fun b!1571036 () Bool)

(declare-fun e!875947 () Bool)

(assert (=> b!1571036 (= e!875947 false)))

(declare-fun k!2731 () (_ BitVec 64))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13538 0))(
  ( (MissingZero!13538 (index!56550 (_ BitVec 32))) (Found!13538 (index!56551 (_ BitVec 32))) (Intermediate!13538 (undefined!14350 Bool) (index!56552 (_ BitVec 32)) (x!141243 (_ BitVec 32))) (Undefined!13538) (MissingVacant!13538 (index!56553 (_ BitVec 32))) )
))
(declare-fun lt!673266 () SeekEntryResult!13538)

(declare-datatypes ((array!104776 0))(
  ( (array!104777 (arr!50566 (Array (_ BitVec 32) (_ BitVec 64))) (size!51118 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104776)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104776 (_ BitVec 32)) SeekEntryResult!13538)

(assert (=> b!1571036 (= lt!673266 (seekEntryOrOpen!0 k!2731 a!3462 mask!4043))))

(declare-fun b!1571035 () Bool)

(declare-fun res!1073456 () Bool)

(assert (=> b!1571035 (=> (not res!1073456) (not e!875947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571035 (= res!1073456 (validKeyInArray!0 k!2731))))

(declare-fun b!1571034 () Bool)

(declare-fun res!1073454 () Bool)

(assert (=> b!1571034 (=> (not res!1073454) (not e!875947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104776 (_ BitVec 32)) Bool)

(assert (=> b!1571034 (= res!1073454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun res!1073455 () Bool)

(assert (=> start!134596 (=> (not res!1073455) (not e!875947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134596 (= res!1073455 (validMask!0 mask!4043))))

(assert (=> start!134596 e!875947))

(assert (=> start!134596 true))

(declare-fun array_inv!39502 (array!104776) Bool)

(assert (=> start!134596 (array_inv!39502 a!3462)))

(declare-fun b!1571033 () Bool)

(declare-fun res!1073457 () Bool)

(assert (=> b!1571033 (=> (not res!1073457) (not e!875947))))

(assert (=> b!1571033 (= res!1073457 (= (size!51118 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!134596 res!1073455) b!1571033))

(assert (= (and b!1571033 res!1073457) b!1571034))

(assert (= (and b!1571034 res!1073454) b!1571035))

(assert (= (and b!1571035 res!1073456) b!1571036))

(declare-fun m!1444427 () Bool)

(assert (=> b!1571036 m!1444427))

(declare-fun m!1444429 () Bool)

(assert (=> b!1571035 m!1444429))

(declare-fun m!1444431 () Bool)

(assert (=> b!1571034 m!1444431))

(declare-fun m!1444433 () Bool)

(assert (=> start!134596 m!1444433))

(declare-fun m!1444435 () Bool)

(assert (=> start!134596 m!1444435))

(push 1)

(assert (not b!1571034))

(assert (not start!134596))

(assert (not b!1571035))

(assert (not b!1571036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

