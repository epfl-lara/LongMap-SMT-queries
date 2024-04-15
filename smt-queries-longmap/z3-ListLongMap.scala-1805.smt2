; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32516 () Bool)

(assert start!32516)

(declare-fun b!325128 () Bool)

(declare-fun res!178607 () Bool)

(declare-fun e!200391 () Bool)

(assert (=> b!325128 (=> (not res!178607) (not e!200391))))

(declare-datatypes ((array!16659 0))(
  ( (array!16660 (arr!7887 (Array (_ BitVec 32) (_ BitVec 64))) (size!8240 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16659)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3017 0))(
  ( (MissingZero!3017 (index!14244 (_ BitVec 32))) (Found!3017 (index!14245 (_ BitVec 32))) (Intermediate!3017 (undefined!3829 Bool) (index!14246 (_ BitVec 32)) (x!32496 (_ BitVec 32))) (Undefined!3017) (MissingVacant!3017 (index!14247 (_ BitVec 32))) )
))
(declare-fun lt!156761 () SeekEntryResult!3017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16659 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!325128 (= res!178607 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156761))))

(declare-fun b!325129 () Bool)

(declare-fun res!178609 () Bool)

(declare-fun e!200392 () Bool)

(assert (=> b!325129 (=> (not res!178609) (not e!200392))))

(declare-fun arrayContainsKey!0 (array!16659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325129 (= res!178609 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178608 () Bool)

(assert (=> start!32516 (=> (not res!178608) (not e!200392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32516 (= res!178608 (validMask!0 mask!3777))))

(assert (=> start!32516 e!200392))

(declare-fun array_inv!5859 (array!16659) Bool)

(assert (=> start!32516 (array_inv!5859 a!3305)))

(assert (=> start!32516 true))

(declare-fun b!325130 () Bool)

(declare-fun res!178606 () Bool)

(assert (=> b!325130 (=> (not res!178606) (not e!200392))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16659 (_ BitVec 32)) SeekEntryResult!3017)

(assert (=> b!325130 (= res!178606 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3017 i!1250)))))

(declare-fun b!325131 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325131 (= e!200391 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000)))))

(declare-fun lt!156760 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325131 (= lt!156760 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325132 () Bool)

(declare-fun res!178613 () Bool)

(assert (=> b!325132 (=> (not res!178613) (not e!200392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16659 (_ BitVec 32)) Bool)

(assert (=> b!325132 (= res!178613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325133 () Bool)

(declare-fun res!178614 () Bool)

(assert (=> b!325133 (=> (not res!178614) (not e!200392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325133 (= res!178614 (validKeyInArray!0 k0!2497))))

(declare-fun b!325134 () Bool)

(declare-fun res!178611 () Bool)

(assert (=> b!325134 (=> (not res!178611) (not e!200392))))

(assert (=> b!325134 (= res!178611 (and (= (size!8240 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8240 a!3305))))))

(declare-fun b!325135 () Bool)

(declare-fun res!178610 () Bool)

(assert (=> b!325135 (=> (not res!178610) (not e!200391))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325135 (= res!178610 (and (= (select (arr!7887 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8240 a!3305))))))

(declare-fun b!325136 () Bool)

(declare-fun res!178605 () Bool)

(assert (=> b!325136 (=> (not res!178605) (not e!200391))))

(assert (=> b!325136 (= res!178605 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7887 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325137 () Bool)

(assert (=> b!325137 (= e!200392 e!200391)))

(declare-fun res!178612 () Bool)

(assert (=> b!325137 (=> (not res!178612) (not e!200391))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325137 (= res!178612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156761))))

(assert (=> b!325137 (= lt!156761 (Intermediate!3017 false resIndex!58 resX!58))))

(assert (= (and start!32516 res!178608) b!325134))

(assert (= (and b!325134 res!178611) b!325133))

(assert (= (and b!325133 res!178614) b!325129))

(assert (= (and b!325129 res!178609) b!325130))

(assert (= (and b!325130 res!178606) b!325132))

(assert (= (and b!325132 res!178613) b!325137))

(assert (= (and b!325137 res!178612) b!325135))

(assert (= (and b!325135 res!178610) b!325128))

(assert (= (and b!325128 res!178607) b!325136))

(assert (= (and b!325136 res!178605) b!325131))

(declare-fun m!331525 () Bool)

(assert (=> b!325131 m!331525))

(declare-fun m!331527 () Bool)

(assert (=> b!325130 m!331527))

(declare-fun m!331529 () Bool)

(assert (=> b!325133 m!331529))

(declare-fun m!331531 () Bool)

(assert (=> b!325135 m!331531))

(declare-fun m!331533 () Bool)

(assert (=> b!325128 m!331533))

(declare-fun m!331535 () Bool)

(assert (=> b!325132 m!331535))

(declare-fun m!331537 () Bool)

(assert (=> b!325129 m!331537))

(declare-fun m!331539 () Bool)

(assert (=> b!325137 m!331539))

(assert (=> b!325137 m!331539))

(declare-fun m!331541 () Bool)

(assert (=> b!325137 m!331541))

(declare-fun m!331543 () Bool)

(assert (=> b!325136 m!331543))

(declare-fun m!331545 () Bool)

(assert (=> start!32516 m!331545))

(declare-fun m!331547 () Bool)

(assert (=> start!32516 m!331547))

(check-sat (not b!325133) (not b!325130) (not b!325131) (not b!325137) (not b!325132) (not b!325129) (not b!325128) (not start!32516))
(check-sat)
