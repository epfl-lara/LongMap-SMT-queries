; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49718 () Bool)

(assert start!49718)

(declare-fun res!340246 () Bool)

(declare-fun e!315771 () Bool)

(assert (=> start!49718 (=> (not res!340246) (not e!315771))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49718 (= res!340246 (validMask!0 mask!3119))))

(assert (=> start!49718 e!315771))

(assert (=> start!49718 true))

(declare-datatypes ((array!34465 0))(
  ( (array!34466 (arr!16559 (Array (_ BitVec 32) (_ BitVec 64))) (size!16924 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34465)

(declare-fun array_inv!12442 (array!34465) Bool)

(assert (=> start!49718 (array_inv!12442 a!3118)))

(declare-fun b!546389 () Bool)

(assert (=> b!546389 (= e!315771 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546390 () Bool)

(declare-fun res!340248 () Bool)

(assert (=> b!546390 (=> (not res!340248) (not e!315771))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5005 0))(
  ( (MissingZero!5005 (index!22247 (_ BitVec 32))) (Found!5005 (index!22248 (_ BitVec 32))) (Intermediate!5005 (undefined!5817 Bool) (index!22249 (_ BitVec 32)) (x!51212 (_ BitVec 32))) (Undefined!5005) (MissingVacant!5005 (index!22250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34465 (_ BitVec 32)) SeekEntryResult!5005)

(assert (=> b!546390 (= res!340248 (not (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) (MissingZero!5005 i!1132))))))

(declare-fun b!546391 () Bool)

(declare-fun res!340250 () Bool)

(assert (=> b!546391 (=> (not res!340250) (not e!315771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546391 (= res!340250 (validKeyInArray!0 k0!1914))))

(declare-fun b!546392 () Bool)

(declare-fun res!340245 () Bool)

(assert (=> b!546392 (=> (not res!340245) (not e!315771))))

(declare-fun arrayContainsKey!0 (array!34465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546392 (= res!340245 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546393 () Bool)

(declare-fun res!340249 () Bool)

(assert (=> b!546393 (=> (not res!340249) (not e!315771))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546393 (= res!340249 (and (= (size!16924 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16924 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16924 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546394 () Bool)

(declare-fun res!340247 () Bool)

(assert (=> b!546394 (=> (not res!340247) (not e!315771))))

(assert (=> b!546394 (= res!340247 (validKeyInArray!0 (select (arr!16559 a!3118) j!142)))))

(assert (= (and start!49718 res!340246) b!546393))

(assert (= (and b!546393 res!340249) b!546394))

(assert (= (and b!546394 res!340247) b!546391))

(assert (= (and b!546391 res!340250) b!546392))

(assert (= (and b!546392 res!340245) b!546390))

(assert (= (and b!546390 res!340248) b!546389))

(declare-fun m!523315 () Bool)

(assert (=> b!546390 m!523315))

(declare-fun m!523317 () Bool)

(assert (=> b!546394 m!523317))

(assert (=> b!546394 m!523317))

(declare-fun m!523319 () Bool)

(assert (=> b!546394 m!523319))

(declare-fun m!523321 () Bool)

(assert (=> b!546392 m!523321))

(declare-fun m!523323 () Bool)

(assert (=> start!49718 m!523323))

(declare-fun m!523325 () Bool)

(assert (=> start!49718 m!523325))

(declare-fun m!523327 () Bool)

(assert (=> b!546391 m!523327))

(check-sat (not start!49718) (not b!546391) (not b!546390) (not b!546392) (not b!546394))
(check-sat)
