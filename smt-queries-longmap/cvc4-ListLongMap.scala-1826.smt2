; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33014 () Bool)

(assert start!33014)

(declare-fun res!181142 () Bool)

(declare-fun e!202074 () Bool)

(assert (=> start!33014 (=> (not res!181142) (not e!202074))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33014 (= res!181142 (validMask!0 mask!3777))))

(assert (=> start!33014 e!202074))

(declare-datatypes ((array!16820 0))(
  ( (array!16821 (arr!7957 (Array (_ BitVec 32) (_ BitVec 64))) (size!8309 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16820)

(declare-fun array_inv!5920 (array!16820) Bool)

(assert (=> start!33014 (array_inv!5920 a!3305)))

(assert (=> start!33014 true))

(declare-fun b!328813 () Bool)

(declare-fun res!181146 () Bool)

(assert (=> b!328813 (=> (not res!181146) (not e!202074))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328813 (= res!181146 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328814 () Bool)

(declare-fun res!181139 () Bool)

(assert (=> b!328814 (=> (not res!181139) (not e!202074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328814 (= res!181139 (validKeyInArray!0 k!2497))))

(declare-fun b!328815 () Bool)

(declare-fun res!181141 () Bool)

(assert (=> b!328815 (=> (not res!181141) (not e!202074))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3088 0))(
  ( (MissingZero!3088 (index!14528 (_ BitVec 32))) (Found!3088 (index!14529 (_ BitVec 32))) (Intermediate!3088 (undefined!3900 Bool) (index!14530 (_ BitVec 32)) (x!32791 (_ BitVec 32))) (Undefined!3088) (MissingVacant!3088 (index!14531 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16820 (_ BitVec 32)) SeekEntryResult!3088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328815 (= res!181141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3088 false resIndex!58 resX!58)))))

(declare-fun b!328816 () Bool)

(declare-fun res!181143 () Bool)

(assert (=> b!328816 (=> (not res!181143) (not e!202074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16820 (_ BitVec 32)) Bool)

(assert (=> b!328816 (= res!181143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328817 () Bool)

(declare-fun res!181140 () Bool)

(assert (=> b!328817 (=> (not res!181140) (not e!202074))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16820 (_ BitVec 32)) SeekEntryResult!3088)

(assert (=> b!328817 (= res!181140 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3088 i!1250)))))

(declare-fun b!328818 () Bool)

(assert (=> b!328818 (= e!202074 false)))

(declare-fun lt!158028 () SeekEntryResult!3088)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328818 (= lt!158028 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328819 () Bool)

(declare-fun res!181144 () Bool)

(assert (=> b!328819 (=> (not res!181144) (not e!202074))))

(assert (=> b!328819 (= res!181144 (and (= (select (arr!7957 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8309 a!3305))))))

(declare-fun b!328820 () Bool)

(declare-fun res!181145 () Bool)

(assert (=> b!328820 (=> (not res!181145) (not e!202074))))

(assert (=> b!328820 (= res!181145 (and (= (size!8309 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8309 a!3305))))))

(assert (= (and start!33014 res!181142) b!328820))

(assert (= (and b!328820 res!181145) b!328814))

(assert (= (and b!328814 res!181139) b!328813))

(assert (= (and b!328813 res!181146) b!328817))

(assert (= (and b!328817 res!181140) b!328816))

(assert (= (and b!328816 res!181143) b!328815))

(assert (= (and b!328815 res!181141) b!328819))

(assert (= (and b!328819 res!181144) b!328818))

(declare-fun m!334665 () Bool)

(assert (=> b!328815 m!334665))

(assert (=> b!328815 m!334665))

(declare-fun m!334667 () Bool)

(assert (=> b!328815 m!334667))

(declare-fun m!334669 () Bool)

(assert (=> b!328818 m!334669))

(declare-fun m!334671 () Bool)

(assert (=> b!328819 m!334671))

(declare-fun m!334673 () Bool)

(assert (=> b!328816 m!334673))

(declare-fun m!334675 () Bool)

(assert (=> b!328817 m!334675))

(declare-fun m!334677 () Bool)

(assert (=> b!328813 m!334677))

(declare-fun m!334679 () Bool)

(assert (=> b!328814 m!334679))

(declare-fun m!334681 () Bool)

(assert (=> start!33014 m!334681))

(declare-fun m!334683 () Bool)

(assert (=> start!33014 m!334683))

(push 1)

(assert (not b!328814))

(assert (not b!328815))

(assert (not start!33014))

(assert (not b!328813))

(assert (not b!328817))

(assert (not b!328818))

(assert (not b!328816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

