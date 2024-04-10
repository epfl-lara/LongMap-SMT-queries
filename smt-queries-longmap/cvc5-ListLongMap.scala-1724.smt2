; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31796 () Bool)

(assert start!31796)

(declare-fun b!317582 () Bool)

(declare-fun res!172165 () Bool)

(declare-fun e!197437 () Bool)

(assert (=> b!317582 (=> (not res!172165) (not e!197437))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317582 (= res!172165 (validKeyInArray!0 k!2441))))

(declare-fun res!172164 () Bool)

(assert (=> start!31796 (=> (not res!172164) (not e!197437))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31796 (= res!172164 (validMask!0 mask!3709))))

(assert (=> start!31796 e!197437))

(declare-datatypes ((array!16167 0))(
  ( (array!16168 (arr!7649 (Array (_ BitVec 32) (_ BitVec 64))) (size!8001 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16167)

(declare-fun array_inv!5612 (array!16167) Bool)

(assert (=> start!31796 (array_inv!5612 a!3293)))

(assert (=> start!31796 true))

(declare-fun b!317583 () Bool)

(declare-fun e!197438 () Bool)

(assert (=> b!317583 (= e!197437 e!197438)))

(declare-fun res!172163 () Bool)

(assert (=> b!317583 (=> (not res!172163) (not e!197438))))

(declare-datatypes ((SeekEntryResult!2789 0))(
  ( (MissingZero!2789 (index!13332 (_ BitVec 32))) (Found!2789 (index!13333 (_ BitVec 32))) (Intermediate!2789 (undefined!3601 Bool) (index!13334 (_ BitVec 32)) (x!31598 (_ BitVec 32))) (Undefined!2789) (MissingVacant!2789 (index!13335 (_ BitVec 32))) )
))
(declare-fun lt!155010 () SeekEntryResult!2789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16167 (_ BitVec 32)) SeekEntryResult!2789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317583 (= res!172163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155010))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317583 (= lt!155010 (Intermediate!2789 false resIndex!52 resX!52))))

(declare-fun b!317584 () Bool)

(declare-fun res!172161 () Bool)

(assert (=> b!317584 (=> (not res!172161) (not e!197437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16167 (_ BitVec 32)) Bool)

(assert (=> b!317584 (= res!172161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155009 () (_ BitVec 32))

(declare-fun e!197439 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!317585 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155007 () array!16167)

(assert (=> b!317585 (= e!197439 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155007 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155009 k!2441 lt!155007 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317585 (= lt!155007 (array!16168 (store (arr!7649 a!3293) i!1240 k!2441) (size!8001 a!3293)))))

(declare-fun b!317586 () Bool)

(declare-fun res!172162 () Bool)

(assert (=> b!317586 (=> (not res!172162) (not e!197437))))

(declare-fun arrayContainsKey!0 (array!16167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317586 (= res!172162 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317587 () Bool)

(declare-fun e!197436 () Bool)

(assert (=> b!317587 (= e!197436 (not true))))

(assert (=> b!317587 e!197439))

(declare-fun res!172167 () Bool)

(assert (=> b!317587 (=> (not res!172167) (not e!197439))))

(declare-fun lt!155008 () SeekEntryResult!2789)

(assert (=> b!317587 (= res!172167 (= lt!155008 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155009 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317587 (= lt!155009 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317588 () Bool)

(declare-fun res!172169 () Bool)

(assert (=> b!317588 (=> (not res!172169) (not e!197437))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16167 (_ BitVec 32)) SeekEntryResult!2789)

(assert (=> b!317588 (= res!172169 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2789 i!1240)))))

(declare-fun b!317589 () Bool)

(assert (=> b!317589 (= e!197438 e!197436)))

(declare-fun res!172168 () Bool)

(assert (=> b!317589 (=> (not res!172168) (not e!197436))))

(assert (=> b!317589 (= res!172168 (and (= lt!155008 lt!155010) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7649 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317589 (= lt!155008 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317590 () Bool)

(declare-fun res!172170 () Bool)

(assert (=> b!317590 (=> (not res!172170) (not e!197437))))

(assert (=> b!317590 (= res!172170 (and (= (size!8001 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8001 a!3293))))))

(declare-fun b!317591 () Bool)

(declare-fun res!172166 () Bool)

(assert (=> b!317591 (=> (not res!172166) (not e!197438))))

(assert (=> b!317591 (= res!172166 (and (= (select (arr!7649 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8001 a!3293))))))

(assert (= (and start!31796 res!172164) b!317590))

(assert (= (and b!317590 res!172170) b!317582))

(assert (= (and b!317582 res!172165) b!317586))

(assert (= (and b!317586 res!172162) b!317588))

(assert (= (and b!317588 res!172169) b!317584))

(assert (= (and b!317584 res!172161) b!317583))

(assert (= (and b!317583 res!172163) b!317591))

(assert (= (and b!317591 res!172166) b!317589))

(assert (= (and b!317589 res!172168) b!317587))

(assert (= (and b!317587 res!172167) b!317585))

(declare-fun m!326225 () Bool)

(assert (=> start!31796 m!326225))

(declare-fun m!326227 () Bool)

(assert (=> start!31796 m!326227))

(declare-fun m!326229 () Bool)

(assert (=> b!317588 m!326229))

(declare-fun m!326231 () Bool)

(assert (=> b!317582 m!326231))

(declare-fun m!326233 () Bool)

(assert (=> b!317585 m!326233))

(declare-fun m!326235 () Bool)

(assert (=> b!317585 m!326235))

(declare-fun m!326237 () Bool)

(assert (=> b!317585 m!326237))

(declare-fun m!326239 () Bool)

(assert (=> b!317583 m!326239))

(assert (=> b!317583 m!326239))

(declare-fun m!326241 () Bool)

(assert (=> b!317583 m!326241))

(declare-fun m!326243 () Bool)

(assert (=> b!317591 m!326243))

(declare-fun m!326245 () Bool)

(assert (=> b!317584 m!326245))

(declare-fun m!326247 () Bool)

(assert (=> b!317587 m!326247))

(declare-fun m!326249 () Bool)

(assert (=> b!317587 m!326249))

(declare-fun m!326251 () Bool)

(assert (=> b!317586 m!326251))

(declare-fun m!326253 () Bool)

(assert (=> b!317589 m!326253))

(declare-fun m!326255 () Bool)

(assert (=> b!317589 m!326255))

(push 1)

