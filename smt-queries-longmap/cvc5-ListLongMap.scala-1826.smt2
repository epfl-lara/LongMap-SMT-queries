; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33010 () Bool)

(assert start!33010)

(declare-fun b!328765 () Bool)

(declare-fun res!181097 () Bool)

(declare-fun e!202063 () Bool)

(assert (=> b!328765 (=> (not res!181097) (not e!202063))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16816 0))(
  ( (array!16817 (arr!7955 (Array (_ BitVec 32) (_ BitVec 64))) (size!8307 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16816)

(assert (=> b!328765 (= res!181097 (and (= (select (arr!7955 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8307 a!3305))))))

(declare-fun b!328766 () Bool)

(declare-fun res!181092 () Bool)

(assert (=> b!328766 (=> (not res!181092) (not e!202063))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!328766 (= res!181092 (and (= (size!8307 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8307 a!3305))))))

(declare-fun b!328768 () Bool)

(declare-fun res!181096 () Bool)

(assert (=> b!328768 (=> (not res!181096) (not e!202063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16816 (_ BitVec 32)) Bool)

(assert (=> b!328768 (= res!181096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328769 () Bool)

(declare-fun res!181098 () Bool)

(assert (=> b!328769 (=> (not res!181098) (not e!202063))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328769 (= res!181098 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328770 () Bool)

(assert (=> b!328770 (= e!202063 false)))

(declare-datatypes ((SeekEntryResult!3086 0))(
  ( (MissingZero!3086 (index!14520 (_ BitVec 32))) (Found!3086 (index!14521 (_ BitVec 32))) (Intermediate!3086 (undefined!3898 Bool) (index!14522 (_ BitVec 32)) (x!32789 (_ BitVec 32))) (Undefined!3086) (MissingVacant!3086 (index!14523 (_ BitVec 32))) )
))
(declare-fun lt!158022 () SeekEntryResult!3086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16816 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!328770 (= lt!158022 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328771 () Bool)

(declare-fun res!181094 () Bool)

(assert (=> b!328771 (=> (not res!181094) (not e!202063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328771 (= res!181094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3086 false resIndex!58 resX!58)))))

(declare-fun b!328772 () Bool)

(declare-fun res!181093 () Bool)

(assert (=> b!328772 (=> (not res!181093) (not e!202063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328772 (= res!181093 (validKeyInArray!0 k!2497))))

(declare-fun b!328767 () Bool)

(declare-fun res!181091 () Bool)

(assert (=> b!328767 (=> (not res!181091) (not e!202063))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16816 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!328767 (= res!181091 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3086 i!1250)))))

(declare-fun res!181095 () Bool)

(assert (=> start!33010 (=> (not res!181095) (not e!202063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33010 (= res!181095 (validMask!0 mask!3777))))

(assert (=> start!33010 e!202063))

(declare-fun array_inv!5918 (array!16816) Bool)

(assert (=> start!33010 (array_inv!5918 a!3305)))

(assert (=> start!33010 true))

(assert (= (and start!33010 res!181095) b!328766))

(assert (= (and b!328766 res!181092) b!328772))

(assert (= (and b!328772 res!181093) b!328769))

(assert (= (and b!328769 res!181098) b!328767))

(assert (= (and b!328767 res!181091) b!328768))

(assert (= (and b!328768 res!181096) b!328771))

(assert (= (and b!328771 res!181094) b!328765))

(assert (= (and b!328765 res!181097) b!328770))

(declare-fun m!334625 () Bool)

(assert (=> b!328769 m!334625))

(declare-fun m!334627 () Bool)

(assert (=> b!328765 m!334627))

(declare-fun m!334629 () Bool)

(assert (=> b!328772 m!334629))

(declare-fun m!334631 () Bool)

(assert (=> b!328767 m!334631))

(declare-fun m!334633 () Bool)

(assert (=> b!328768 m!334633))

(declare-fun m!334635 () Bool)

(assert (=> start!33010 m!334635))

(declare-fun m!334637 () Bool)

(assert (=> start!33010 m!334637))

(declare-fun m!334639 () Bool)

(assert (=> b!328770 m!334639))

(declare-fun m!334641 () Bool)

(assert (=> b!328771 m!334641))

(assert (=> b!328771 m!334641))

(declare-fun m!334643 () Bool)

(assert (=> b!328771 m!334643))

(push 1)

(assert (not b!328768))

(assert (not start!33010))

(assert (not b!328770))

(assert (not b!328767))

(assert (not b!328772))

(assert (not b!328769))

(assert (not b!328771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

