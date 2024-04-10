; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32374 () Bool)

(assert start!32374)

(declare-fun b!322580 () Bool)

(declare-datatypes ((Unit!9878 0))(
  ( (Unit!9879) )
))
(declare-fun e!199610 () Unit!9878)

(declare-fun Unit!9880 () Unit!9878)

(assert (=> b!322580 (= e!199610 Unit!9880)))

(declare-fun b!322581 () Bool)

(declare-fun res!176442 () Bool)

(declare-fun e!199614 () Bool)

(assert (=> b!322581 (=> (not res!176442) (not e!199614))))

(declare-datatypes ((array!16513 0))(
  ( (array!16514 (arr!7814 (Array (_ BitVec 32) (_ BitVec 64))) (size!8166 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16513)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2945 0))(
  ( (MissingZero!2945 (index!13956 (_ BitVec 32))) (Found!2945 (index!13957 (_ BitVec 32))) (Intermediate!2945 (undefined!3757 Bool) (index!13958 (_ BitVec 32)) (x!32221 (_ BitVec 32))) (Undefined!2945) (MissingVacant!2945 (index!13959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16513 (_ BitVec 32)) SeekEntryResult!2945)

(assert (=> b!322581 (= res!176442 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2945 i!1250)))))

(declare-fun b!322582 () Bool)

(assert (=> b!322582 false))

(declare-fun lt!156477 () Unit!9878)

(declare-fun e!199615 () Unit!9878)

(assert (=> b!322582 (= lt!156477 e!199615)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!50700 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16513 (_ BitVec 32)) SeekEntryResult!2945)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322582 (= c!50700 (is-Intermediate!2945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199611 () Unit!9878)

(declare-fun Unit!9881 () Unit!9878)

(assert (=> b!322582 (= e!199611 Unit!9881)))

(declare-fun b!322583 () Bool)

(declare-fun res!176446 () Bool)

(declare-fun e!199612 () Bool)

(assert (=> b!322583 (=> (not res!176446) (not e!199612))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322583 (= res!176446 (and (= (select (arr!7814 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8166 a!3305))))))

(declare-fun b!322584 () Bool)

(declare-fun res!176444 () Bool)

(assert (=> b!322584 (=> (not res!176444) (not e!199614))))

(declare-fun arrayContainsKey!0 (array!16513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322584 (= res!176444 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322585 () Bool)

(assert (=> b!322585 false))

(declare-fun Unit!9882 () Unit!9878)

(assert (=> b!322585 (= e!199611 Unit!9882)))

(declare-fun b!322586 () Bool)

(assert (=> b!322586 (= e!199610 e!199611)))

(declare-fun c!50698 () Bool)

(assert (=> b!322586 (= c!50698 (or (= (select (arr!7814 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7814 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322587 () Bool)

(declare-fun res!176443 () Bool)

(assert (=> b!322587 (=> (not res!176443) (not e!199614))))

(assert (=> b!322587 (= res!176443 (and (= (size!8166 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8166 a!3305))))))

(declare-fun b!322589 () Bool)

(declare-fun res!176447 () Bool)

(assert (=> b!322589 (=> (not res!176447) (not e!199612))))

(declare-fun lt!156475 () SeekEntryResult!2945)

(assert (=> b!322589 (= res!176447 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156475))))

(declare-fun b!322590 () Bool)

(declare-fun res!176439 () Bool)

(assert (=> b!322590 (=> (not res!176439) (not e!199612))))

(assert (=> b!322590 (= res!176439 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7814 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322591 () Bool)

(declare-fun res!176440 () Bool)

(assert (=> b!322591 (=> (not res!176440) (not e!199614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322591 (= res!176440 (validKeyInArray!0 k!2497))))

(declare-fun b!322592 () Bool)

(assert (=> b!322592 (= e!199614 e!199612)))

(declare-fun res!176441 () Bool)

(assert (=> b!322592 (=> (not res!176441) (not e!199612))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322592 (= res!176441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156475))))

(assert (=> b!322592 (= lt!156475 (Intermediate!2945 false resIndex!58 resX!58))))

(declare-fun b!322593 () Bool)

(assert (=> b!322593 (= e!199612 (not true))))

(assert (=> b!322593 (= index!1840 resIndex!58)))

(declare-fun lt!156476 () Unit!9878)

(assert (=> b!322593 (= lt!156476 e!199610)))

(declare-fun c!50699 () Bool)

(assert (=> b!322593 (= c!50699 (not (= resIndex!58 index!1840)))))

(declare-fun b!322594 () Bool)

(declare-fun Unit!9883 () Unit!9878)

(assert (=> b!322594 (= e!199615 Unit!9883)))

(declare-fun b!322595 () Bool)

(declare-fun res!176445 () Bool)

(assert (=> b!322595 (=> (not res!176445) (not e!199614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16513 (_ BitVec 32)) Bool)

(assert (=> b!322595 (= res!176445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322588 () Bool)

(declare-fun Unit!9884 () Unit!9878)

(assert (=> b!322588 (= e!199615 Unit!9884)))

(assert (=> b!322588 false))

(declare-fun res!176448 () Bool)

(assert (=> start!32374 (=> (not res!176448) (not e!199614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32374 (= res!176448 (validMask!0 mask!3777))))

(assert (=> start!32374 e!199614))

(declare-fun array_inv!5777 (array!16513) Bool)

(assert (=> start!32374 (array_inv!5777 a!3305)))

(assert (=> start!32374 true))

(assert (= (and start!32374 res!176448) b!322587))

(assert (= (and b!322587 res!176443) b!322591))

(assert (= (and b!322591 res!176440) b!322584))

(assert (= (and b!322584 res!176444) b!322581))

(assert (= (and b!322581 res!176442) b!322595))

(assert (= (and b!322595 res!176445) b!322592))

(assert (= (and b!322592 res!176441) b!322583))

(assert (= (and b!322583 res!176446) b!322589))

(assert (= (and b!322589 res!176447) b!322590))

(assert (= (and b!322590 res!176439) b!322593))

(assert (= (and b!322593 c!50699) b!322586))

(assert (= (and b!322593 (not c!50699)) b!322580))

(assert (= (and b!322586 c!50698) b!322585))

(assert (= (and b!322586 (not c!50698)) b!322582))

(assert (= (and b!322582 c!50700) b!322594))

(assert (= (and b!322582 (not c!50700)) b!322588))

(declare-fun m!330353 () Bool)

(assert (=> b!322592 m!330353))

(assert (=> b!322592 m!330353))

(declare-fun m!330355 () Bool)

(assert (=> b!322592 m!330355))

(declare-fun m!330357 () Bool)

(assert (=> b!322591 m!330357))

(declare-fun m!330359 () Bool)

(assert (=> start!32374 m!330359))

(declare-fun m!330361 () Bool)

(assert (=> start!32374 m!330361))

(declare-fun m!330363 () Bool)

(assert (=> b!322582 m!330363))

(assert (=> b!322582 m!330363))

(declare-fun m!330365 () Bool)

(assert (=> b!322582 m!330365))

(declare-fun m!330367 () Bool)

(assert (=> b!322584 m!330367))

(declare-fun m!330369 () Bool)

(assert (=> b!322595 m!330369))

(declare-fun m!330371 () Bool)

(assert (=> b!322586 m!330371))

(declare-fun m!330373 () Bool)

(assert (=> b!322589 m!330373))

(assert (=> b!322590 m!330371))

(declare-fun m!330375 () Bool)

(assert (=> b!322583 m!330375))

(declare-fun m!330377 () Bool)

(assert (=> b!322581 m!330377))

(push 1)

