; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31722 () Bool)

(assert start!31722)

(declare-fun b!316995 () Bool)

(declare-fun e!197121 () Bool)

(declare-fun e!197122 () Bool)

(assert (=> b!316995 (= e!197121 e!197122)))

(declare-fun res!171771 () Bool)

(assert (=> b!316995 (=> (not res!171771) (not e!197122))))

(declare-datatypes ((array!16144 0))(
  ( (array!16145 (arr!7639 (Array (_ BitVec 32) (_ BitVec 64))) (size!7991 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16144)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2779 0))(
  ( (MissingZero!2779 (index!13292 (_ BitVec 32))) (Found!2779 (index!13293 (_ BitVec 32))) (Intermediate!2779 (undefined!3591 Bool) (index!13294 (_ BitVec 32)) (x!31547 (_ BitVec 32))) (Undefined!2779) (MissingVacant!2779 (index!13295 (_ BitVec 32))) )
))
(declare-fun lt!154767 () SeekEntryResult!2779)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16144 (_ BitVec 32)) SeekEntryResult!2779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316995 (= res!171771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154767))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316995 (= lt!154767 (Intermediate!2779 false resIndex!52 resX!52))))

(declare-fun res!171769 () Bool)

(assert (=> start!31722 (=> (not res!171769) (not e!197121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31722 (= res!171769 (validMask!0 mask!3709))))

(assert (=> start!31722 e!197121))

(declare-fun array_inv!5602 (array!16144) Bool)

(assert (=> start!31722 (array_inv!5602 a!3293)))

(assert (=> start!31722 true))

(declare-fun b!316996 () Bool)

(declare-fun res!171777 () Bool)

(assert (=> b!316996 (=> (not res!171777) (not e!197121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316996 (= res!171777 (validKeyInArray!0 k!2441))))

(declare-fun b!316997 () Bool)

(declare-fun res!171775 () Bool)

(assert (=> b!316997 (=> (not res!171775) (not e!197121))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316997 (= res!171775 (and (= (size!7991 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7991 a!3293))))))

(declare-fun b!316998 () Bool)

(declare-fun e!197119 () Bool)

(assert (=> b!316998 (= e!197122 e!197119)))

(declare-fun res!171770 () Bool)

(assert (=> b!316998 (=> (not res!171770) (not e!197119))))

(declare-fun lt!154766 () SeekEntryResult!2779)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316998 (= res!171770 (and (= lt!154766 lt!154767) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7639 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316998 (= lt!154766 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316999 () Bool)

(declare-fun res!171772 () Bool)

(assert (=> b!316999 (=> (not res!171772) (not e!197121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16144 (_ BitVec 32)) Bool)

(assert (=> b!316999 (= res!171772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317000 () Bool)

(declare-fun res!171773 () Bool)

(assert (=> b!317000 (=> (not res!171773) (not e!197122))))

(assert (=> b!317000 (= res!171773 (and (= (select (arr!7639 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7991 a!3293))))))

(declare-fun b!317001 () Bool)

(assert (=> b!317001 (= e!197119 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317001 (= lt!154766 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!317002 () Bool)

(declare-fun res!171776 () Bool)

(assert (=> b!317002 (=> (not res!171776) (not e!197121))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16144 (_ BitVec 32)) SeekEntryResult!2779)

(assert (=> b!317002 (= res!171776 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2779 i!1240)))))

(declare-fun b!317003 () Bool)

(declare-fun res!171774 () Bool)

(assert (=> b!317003 (=> (not res!171774) (not e!197121))))

(declare-fun arrayContainsKey!0 (array!16144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317003 (= res!171774 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31722 res!171769) b!316997))

(assert (= (and b!316997 res!171775) b!316996))

(assert (= (and b!316996 res!171777) b!317003))

(assert (= (and b!317003 res!171774) b!317002))

(assert (= (and b!317002 res!171776) b!316999))

(assert (= (and b!316999 res!171772) b!316995))

(assert (= (and b!316995 res!171771) b!317000))

(assert (= (and b!317000 res!171773) b!316998))

(assert (= (and b!316998 res!171770) b!317001))

(declare-fun m!325737 () Bool)

(assert (=> b!316996 m!325737))

(declare-fun m!325739 () Bool)

(assert (=> b!316995 m!325739))

(assert (=> b!316995 m!325739))

(declare-fun m!325741 () Bool)

(assert (=> b!316995 m!325741))

(declare-fun m!325743 () Bool)

(assert (=> b!316999 m!325743))

(declare-fun m!325745 () Bool)

(assert (=> b!316998 m!325745))

(declare-fun m!325747 () Bool)

(assert (=> b!316998 m!325747))

(declare-fun m!325749 () Bool)

(assert (=> start!31722 m!325749))

(declare-fun m!325751 () Bool)

(assert (=> start!31722 m!325751))

(declare-fun m!325753 () Bool)

(assert (=> b!317001 m!325753))

(assert (=> b!317001 m!325753))

(declare-fun m!325755 () Bool)

(assert (=> b!317001 m!325755))

(declare-fun m!325757 () Bool)

(assert (=> b!317000 m!325757))

(declare-fun m!325759 () Bool)

(assert (=> b!317003 m!325759))

(declare-fun m!325761 () Bool)

(assert (=> b!317002 m!325761))

(push 1)

(assert (not b!316999))

(assert (not b!317002))

(assert (not b!316995))

(assert (not b!316998))

(assert (not b!317001))

(assert (not b!317003))

(assert (not start!31722))

(assert (not b!316996))

(check-sat)

