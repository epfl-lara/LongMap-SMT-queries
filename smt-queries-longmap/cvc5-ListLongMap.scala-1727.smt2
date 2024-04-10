; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31814 () Bool)

(assert start!31814)

(declare-fun b!317852 () Bool)

(declare-fun res!172440 () Bool)

(declare-fun e!197575 () Bool)

(assert (=> b!317852 (=> (not res!172440) (not e!197575))))

(declare-datatypes ((array!16185 0))(
  ( (array!16186 (arr!7658 (Array (_ BitVec 32) (_ BitVec 64))) (size!8010 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16185)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317852 (= res!172440 (and (= (select (arr!7658 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8010 a!3293))))))

(declare-fun b!317853 () Bool)

(declare-fun e!197573 () Bool)

(assert (=> b!317853 (= e!197573 (not true))))

(declare-fun e!197572 () Bool)

(assert (=> b!317853 e!197572))

(declare-fun res!172436 () Bool)

(assert (=> b!317853 (=> (not res!172436) (not e!197572))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2798 0))(
  ( (MissingZero!2798 (index!13368 (_ BitVec 32))) (Found!2798 (index!13369 (_ BitVec 32))) (Intermediate!2798 (undefined!3610 Bool) (index!13370 (_ BitVec 32)) (x!31631 (_ BitVec 32))) (Undefined!2798) (MissingVacant!2798 (index!13371 (_ BitVec 32))) )
))
(declare-fun lt!155117 () SeekEntryResult!2798)

(declare-fun lt!155118 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16185 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!317853 (= res!172436 (= lt!155117 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155118 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317853 (= lt!155118 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317854 () Bool)

(declare-fun e!197571 () Bool)

(assert (=> b!317854 (= e!197571 e!197575)))

(declare-fun res!172437 () Bool)

(assert (=> b!317854 (=> (not res!172437) (not e!197575))))

(declare-fun lt!155115 () SeekEntryResult!2798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317854 (= res!172437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155115))))

(assert (=> b!317854 (= lt!155115 (Intermediate!2798 false resIndex!52 resX!52))))

(declare-fun b!317855 () Bool)

(assert (=> b!317855 (= e!197575 e!197573)))

(declare-fun res!172434 () Bool)

(assert (=> b!317855 (=> (not res!172434) (not e!197573))))

(assert (=> b!317855 (= res!172434 (and (= lt!155117 lt!155115) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7658 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317855 (= lt!155117 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317857 () Bool)

(declare-fun res!172431 () Bool)

(assert (=> b!317857 (=> (not res!172431) (not e!197571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16185 (_ BitVec 32)) Bool)

(assert (=> b!317857 (= res!172431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317858 () Bool)

(declare-fun res!172433 () Bool)

(assert (=> b!317858 (=> (not res!172433) (not e!197571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317858 (= res!172433 (validKeyInArray!0 k!2441))))

(declare-fun b!317859 () Bool)

(declare-fun res!172435 () Bool)

(assert (=> b!317859 (=> (not res!172435) (not e!197571))))

(assert (=> b!317859 (= res!172435 (and (= (size!8010 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8010 a!3293))))))

(declare-fun b!317860 () Bool)

(declare-fun res!172438 () Bool)

(assert (=> b!317860 (=> (not res!172438) (not e!197571))))

(declare-fun arrayContainsKey!0 (array!16185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317860 (= res!172438 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317861 () Bool)

(declare-fun lt!155116 () array!16185)

(assert (=> b!317861 (= e!197572 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155116 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155118 k!2441 lt!155116 mask!3709)))))

(assert (=> b!317861 (= lt!155116 (array!16186 (store (arr!7658 a!3293) i!1240 k!2441) (size!8010 a!3293)))))

(declare-fun b!317856 () Bool)

(declare-fun res!172432 () Bool)

(assert (=> b!317856 (=> (not res!172432) (not e!197571))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16185 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!317856 (= res!172432 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2798 i!1240)))))

(declare-fun res!172439 () Bool)

(assert (=> start!31814 (=> (not res!172439) (not e!197571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31814 (= res!172439 (validMask!0 mask!3709))))

(assert (=> start!31814 e!197571))

(declare-fun array_inv!5621 (array!16185) Bool)

(assert (=> start!31814 (array_inv!5621 a!3293)))

(assert (=> start!31814 true))

(assert (= (and start!31814 res!172439) b!317859))

(assert (= (and b!317859 res!172435) b!317858))

(assert (= (and b!317858 res!172433) b!317860))

(assert (= (and b!317860 res!172438) b!317856))

(assert (= (and b!317856 res!172432) b!317857))

(assert (= (and b!317857 res!172431) b!317854))

(assert (= (and b!317854 res!172437) b!317852))

(assert (= (and b!317852 res!172440) b!317855))

(assert (= (and b!317855 res!172434) b!317853))

(assert (= (and b!317853 res!172436) b!317861))

(declare-fun m!326513 () Bool)

(assert (=> b!317861 m!326513))

(declare-fun m!326515 () Bool)

(assert (=> b!317861 m!326515))

(declare-fun m!326517 () Bool)

(assert (=> b!317861 m!326517))

(declare-fun m!326519 () Bool)

(assert (=> b!317853 m!326519))

(declare-fun m!326521 () Bool)

(assert (=> b!317853 m!326521))

(declare-fun m!326523 () Bool)

(assert (=> b!317857 m!326523))

(declare-fun m!326525 () Bool)

(assert (=> b!317855 m!326525))

(declare-fun m!326527 () Bool)

(assert (=> b!317855 m!326527))

(declare-fun m!326529 () Bool)

(assert (=> b!317854 m!326529))

(assert (=> b!317854 m!326529))

(declare-fun m!326531 () Bool)

(assert (=> b!317854 m!326531))

(declare-fun m!326533 () Bool)

(assert (=> b!317860 m!326533))

(declare-fun m!326535 () Bool)

(assert (=> b!317852 m!326535))

(declare-fun m!326537 () Bool)

(assert (=> b!317858 m!326537))

(declare-fun m!326539 () Bool)

(assert (=> b!317856 m!326539))

(declare-fun m!326541 () Bool)

(assert (=> start!31814 m!326541))

(declare-fun m!326543 () Bool)

(assert (=> start!31814 m!326543))

(push 1)

