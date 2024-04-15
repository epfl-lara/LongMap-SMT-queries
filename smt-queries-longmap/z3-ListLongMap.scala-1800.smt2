; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32486 () Bool)

(assert start!32486)

(declare-fun b!324678 () Bool)

(declare-fun res!178163 () Bool)

(declare-fun e!200256 () Bool)

(assert (=> b!324678 (=> (not res!178163) (not e!200256))))

(declare-datatypes ((array!16629 0))(
  ( (array!16630 (arr!7872 (Array (_ BitVec 32) (_ BitVec 64))) (size!8225 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16629)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324678 (= res!178163 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324679 () Bool)

(declare-fun e!200258 () Bool)

(assert (=> b!324679 (= e!200258 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lt!156670 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324679 (= lt!156670 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324680 () Bool)

(declare-fun res!178156 () Bool)

(assert (=> b!324680 (=> (not res!178156) (not e!200256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324680 (= res!178156 (validKeyInArray!0 k0!2497))))

(declare-fun res!178164 () Bool)

(assert (=> start!32486 (=> (not res!178164) (not e!200256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32486 (= res!178164 (validMask!0 mask!3777))))

(assert (=> start!32486 e!200256))

(declare-fun array_inv!5844 (array!16629) Bool)

(assert (=> start!32486 (array_inv!5844 a!3305)))

(assert (=> start!32486 true))

(declare-fun b!324681 () Bool)

(assert (=> b!324681 (= e!200256 e!200258)))

(declare-fun res!178157 () Bool)

(assert (=> b!324681 (=> (not res!178157) (not e!200258))))

(declare-datatypes ((SeekEntryResult!3002 0))(
  ( (MissingZero!3002 (index!14184 (_ BitVec 32))) (Found!3002 (index!14185 (_ BitVec 32))) (Intermediate!3002 (undefined!3814 Bool) (index!14186 (_ BitVec 32)) (x!32441 (_ BitVec 32))) (Undefined!3002) (MissingVacant!3002 (index!14187 (_ BitVec 32))) )
))
(declare-fun lt!156671 () SeekEntryResult!3002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16629 (_ BitVec 32)) SeekEntryResult!3002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324681 (= res!178157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156671))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324681 (= lt!156671 (Intermediate!3002 false resIndex!58 resX!58))))

(declare-fun b!324682 () Bool)

(declare-fun res!178161 () Bool)

(assert (=> b!324682 (=> (not res!178161) (not e!200258))))

(assert (=> b!324682 (= res!178161 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156671))))

(declare-fun b!324683 () Bool)

(declare-fun res!178160 () Bool)

(assert (=> b!324683 (=> (not res!178160) (not e!200258))))

(assert (=> b!324683 (= res!178160 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7872 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324684 () Bool)

(declare-fun res!178159 () Bool)

(assert (=> b!324684 (=> (not res!178159) (not e!200256))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324684 (= res!178159 (and (= (size!8225 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8225 a!3305))))))

(declare-fun b!324685 () Bool)

(declare-fun res!178155 () Bool)

(assert (=> b!324685 (=> (not res!178155) (not e!200258))))

(assert (=> b!324685 (= res!178155 (and (= (select (arr!7872 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8225 a!3305))))))

(declare-fun b!324686 () Bool)

(declare-fun res!178158 () Bool)

(assert (=> b!324686 (=> (not res!178158) (not e!200256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16629 (_ BitVec 32)) Bool)

(assert (=> b!324686 (= res!178158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324687 () Bool)

(declare-fun res!178162 () Bool)

(assert (=> b!324687 (=> (not res!178162) (not e!200256))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16629 (_ BitVec 32)) SeekEntryResult!3002)

(assert (=> b!324687 (= res!178162 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3002 i!1250)))))

(assert (= (and start!32486 res!178164) b!324684))

(assert (= (and b!324684 res!178159) b!324680))

(assert (= (and b!324680 res!178156) b!324678))

(assert (= (and b!324678 res!178163) b!324687))

(assert (= (and b!324687 res!178162) b!324686))

(assert (= (and b!324686 res!178158) b!324681))

(assert (= (and b!324681 res!178157) b!324685))

(assert (= (and b!324685 res!178155) b!324682))

(assert (= (and b!324682 res!178161) b!324683))

(assert (= (and b!324683 res!178160) b!324679))

(declare-fun m!331165 () Bool)

(assert (=> b!324683 m!331165))

(declare-fun m!331167 () Bool)

(assert (=> b!324687 m!331167))

(declare-fun m!331169 () Bool)

(assert (=> b!324678 m!331169))

(declare-fun m!331171 () Bool)

(assert (=> b!324679 m!331171))

(declare-fun m!331173 () Bool)

(assert (=> b!324681 m!331173))

(assert (=> b!324681 m!331173))

(declare-fun m!331175 () Bool)

(assert (=> b!324681 m!331175))

(declare-fun m!331177 () Bool)

(assert (=> b!324680 m!331177))

(declare-fun m!331179 () Bool)

(assert (=> start!32486 m!331179))

(declare-fun m!331181 () Bool)

(assert (=> start!32486 m!331181))

(declare-fun m!331183 () Bool)

(assert (=> b!324685 m!331183))

(declare-fun m!331185 () Bool)

(assert (=> b!324686 m!331185))

(declare-fun m!331187 () Bool)

(assert (=> b!324682 m!331187))

(check-sat (not b!324687) (not b!324681) (not b!324679) (not start!32486) (not b!324680) (not b!324686) (not b!324682) (not b!324678))
(check-sat)
