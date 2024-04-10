; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49744 () Bool)

(assert start!49744)

(declare-fun b!546772 () Bool)

(declare-fun res!340486 () Bool)

(declare-fun e!315986 () Bool)

(assert (=> b!546772 (=> (not res!340486) (not e!315986))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34482 0))(
  ( (array!34483 (arr!16567 (Array (_ BitVec 32) (_ BitVec 64))) (size!16931 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34482)

(assert (=> b!546772 (= res!340486 (and (= (size!16931 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16931 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16931 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546773 () Bool)

(declare-fun res!340490 () Bool)

(assert (=> b!546773 (=> (not res!340490) (not e!315986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546773 (= res!340490 (validKeyInArray!0 (select (arr!16567 a!3118) j!142)))))

(declare-fun b!546774 () Bool)

(declare-fun res!340489 () Bool)

(assert (=> b!546774 (=> (not res!340489) (not e!315986))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546774 (= res!340489 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546775 () Bool)

(declare-fun res!340488 () Bool)

(assert (=> b!546775 (=> (not res!340488) (not e!315986))))

(assert (=> b!546775 (= res!340488 (validKeyInArray!0 k0!1914))))

(declare-fun res!340487 () Bool)

(assert (=> start!49744 (=> (not res!340487) (not e!315986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49744 (= res!340487 (validMask!0 mask!3119))))

(assert (=> start!49744 e!315986))

(assert (=> start!49744 true))

(declare-fun array_inv!12363 (array!34482) Bool)

(assert (=> start!49744 (array_inv!12363 a!3118)))

(declare-fun b!546776 () Bool)

(assert (=> b!546776 (= e!315986 false)))

(declare-datatypes ((SeekEntryResult!5016 0))(
  ( (MissingZero!5016 (index!22291 (_ BitVec 32))) (Found!5016 (index!22292 (_ BitVec 32))) (Intermediate!5016 (undefined!5828 Bool) (index!22293 (_ BitVec 32)) (x!51244 (_ BitVec 32))) (Undefined!5016) (MissingVacant!5016 (index!22294 (_ BitVec 32))) )
))
(declare-fun lt!249361 () SeekEntryResult!5016)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34482 (_ BitVec 32)) SeekEntryResult!5016)

(assert (=> b!546776 (= lt!249361 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!49744 res!340487) b!546772))

(assert (= (and b!546772 res!340486) b!546773))

(assert (= (and b!546773 res!340490) b!546775))

(assert (= (and b!546775 res!340488) b!546774))

(assert (= (and b!546774 res!340489) b!546776))

(declare-fun m!524165 () Bool)

(assert (=> b!546774 m!524165))

(declare-fun m!524167 () Bool)

(assert (=> b!546773 m!524167))

(assert (=> b!546773 m!524167))

(declare-fun m!524169 () Bool)

(assert (=> b!546773 m!524169))

(declare-fun m!524171 () Bool)

(assert (=> b!546775 m!524171))

(declare-fun m!524173 () Bool)

(assert (=> b!546776 m!524173))

(declare-fun m!524175 () Bool)

(assert (=> start!49744 m!524175))

(declare-fun m!524177 () Bool)

(assert (=> start!49744 m!524177))

(check-sat (not b!546773) (not start!49744) (not b!546776) (not b!546775) (not b!546774))
