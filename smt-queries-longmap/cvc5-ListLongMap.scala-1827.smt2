; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33016 () Bool)

(assert start!33016)

(declare-fun b!328837 () Bool)

(declare-fun e!202080 () Bool)

(assert (=> b!328837 (= e!202080 false)))

(declare-datatypes ((array!16822 0))(
  ( (array!16823 (arr!7958 (Array (_ BitVec 32) (_ BitVec 64))) (size!8310 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16822)

(declare-datatypes ((SeekEntryResult!3089 0))(
  ( (MissingZero!3089 (index!14532 (_ BitVec 32))) (Found!3089 (index!14533 (_ BitVec 32))) (Intermediate!3089 (undefined!3901 Bool) (index!14534 (_ BitVec 32)) (x!32800 (_ BitVec 32))) (Undefined!3089) (MissingVacant!3089 (index!14535 (_ BitVec 32))) )
))
(declare-fun lt!158031 () SeekEntryResult!3089)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16822 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!328837 (= lt!158031 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328838 () Bool)

(declare-fun res!181167 () Bool)

(assert (=> b!328838 (=> (not res!181167) (not e!202080))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328838 (= res!181167 (and (= (size!8310 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8310 a!3305))))))

(declare-fun b!328839 () Bool)

(declare-fun res!181169 () Bool)

(assert (=> b!328839 (=> (not res!181169) (not e!202080))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!328839 (= res!181169 (and (= (select (arr!7958 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8310 a!3305))))))

(declare-fun b!328840 () Bool)

(declare-fun res!181166 () Bool)

(assert (=> b!328840 (=> (not res!181166) (not e!202080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328840 (= res!181166 (validKeyInArray!0 k!2497))))

(declare-fun b!328841 () Bool)

(declare-fun res!181164 () Bool)

(assert (=> b!328841 (=> (not res!181164) (not e!202080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16822 (_ BitVec 32)) Bool)

(assert (=> b!328841 (= res!181164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328842 () Bool)

(declare-fun res!181168 () Bool)

(assert (=> b!328842 (=> (not res!181168) (not e!202080))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328842 (= res!181168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3089 false resIndex!58 resX!58)))))

(declare-fun res!181170 () Bool)

(assert (=> start!33016 (=> (not res!181170) (not e!202080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33016 (= res!181170 (validMask!0 mask!3777))))

(assert (=> start!33016 e!202080))

(declare-fun array_inv!5921 (array!16822) Bool)

(assert (=> start!33016 (array_inv!5921 a!3305)))

(assert (=> start!33016 true))

(declare-fun b!328843 () Bool)

(declare-fun res!181165 () Bool)

(assert (=> b!328843 (=> (not res!181165) (not e!202080))))

(declare-fun arrayContainsKey!0 (array!16822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328843 (= res!181165 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328844 () Bool)

(declare-fun res!181163 () Bool)

(assert (=> b!328844 (=> (not res!181163) (not e!202080))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16822 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!328844 (= res!181163 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3089 i!1250)))))

(assert (= (and start!33016 res!181170) b!328838))

(assert (= (and b!328838 res!181167) b!328840))

(assert (= (and b!328840 res!181166) b!328843))

(assert (= (and b!328843 res!181165) b!328844))

(assert (= (and b!328844 res!181163) b!328841))

(assert (= (and b!328841 res!181164) b!328842))

(assert (= (and b!328842 res!181168) b!328839))

(assert (= (and b!328839 res!181169) b!328837))

(declare-fun m!334685 () Bool)

(assert (=> start!33016 m!334685))

(declare-fun m!334687 () Bool)

(assert (=> start!33016 m!334687))

(declare-fun m!334689 () Bool)

(assert (=> b!328841 m!334689))

(declare-fun m!334691 () Bool)

(assert (=> b!328839 m!334691))

(declare-fun m!334693 () Bool)

(assert (=> b!328843 m!334693))

(declare-fun m!334695 () Bool)

(assert (=> b!328837 m!334695))

(declare-fun m!334697 () Bool)

(assert (=> b!328842 m!334697))

(assert (=> b!328842 m!334697))

(declare-fun m!334699 () Bool)

(assert (=> b!328842 m!334699))

(declare-fun m!334701 () Bool)

(assert (=> b!328840 m!334701))

(declare-fun m!334703 () Bool)

(assert (=> b!328844 m!334703))

(push 1)

(assert (not b!328837))

(assert (not b!328842))

(assert (not b!328840))

(assert (not b!328844))

(assert (not b!328841))

(assert (not start!33016))

(assert (not b!328843))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

