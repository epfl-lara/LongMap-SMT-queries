; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32224 () Bool)

(assert start!32224)

(declare-fun b!320899 () Bool)

(declare-fun res!175020 () Bool)

(declare-fun e!199011 () Bool)

(assert (=> b!320899 (=> (not res!175020) (not e!199011))))

(declare-datatypes ((array!16414 0))(
  ( (array!16415 (arr!7766 (Array (_ BitVec 32) (_ BitVec 64))) (size!8118 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16414)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16414 (_ BitVec 32)) Bool)

(assert (=> b!320899 (= res!175020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320900 () Bool)

(assert (=> b!320900 (= e!199011 false)))

(declare-datatypes ((SeekEntryResult!2897 0))(
  ( (MissingZero!2897 (index!13764 (_ BitVec 32))) (Found!2897 (index!13765 (_ BitVec 32))) (Intermediate!2897 (undefined!3709 Bool) (index!13766 (_ BitVec 32)) (x!32036 (_ BitVec 32))) (Undefined!2897) (MissingVacant!2897 (index!13767 (_ BitVec 32))) )
))
(declare-fun lt!156132 () SeekEntryResult!2897)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16414 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!320900 (= lt!156132 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320901 () Bool)

(declare-fun res!175023 () Bool)

(assert (=> b!320901 (=> (not res!175023) (not e!199011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320901 (= res!175023 (validKeyInArray!0 k!2497))))

(declare-fun res!175026 () Bool)

(assert (=> start!32224 (=> (not res!175026) (not e!199011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32224 (= res!175026 (validMask!0 mask!3777))))

(assert (=> start!32224 e!199011))

(declare-fun array_inv!5729 (array!16414) Bool)

(assert (=> start!32224 (array_inv!5729 a!3305)))

(assert (=> start!32224 true))

(declare-fun b!320902 () Bool)

(declare-fun res!175021 () Bool)

(assert (=> b!320902 (=> (not res!175021) (not e!199011))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320902 (= res!175021 (and (= (size!8118 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8118 a!3305))))))

(declare-fun b!320903 () Bool)

(declare-fun res!175024 () Bool)

(assert (=> b!320903 (=> (not res!175024) (not e!199011))))

(declare-fun arrayContainsKey!0 (array!16414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320903 (= res!175024 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320904 () Bool)

(declare-fun res!175019 () Bool)

(assert (=> b!320904 (=> (not res!175019) (not e!199011))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!320904 (= res!175019 (and (= (select (arr!7766 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8118 a!3305))))))

(declare-fun b!320905 () Bool)

(declare-fun res!175025 () Bool)

(assert (=> b!320905 (=> (not res!175025) (not e!199011))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320905 (= res!175025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2897 false resIndex!58 resX!58)))))

(declare-fun b!320906 () Bool)

(declare-fun res!175022 () Bool)

(assert (=> b!320906 (=> (not res!175022) (not e!199011))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16414 (_ BitVec 32)) SeekEntryResult!2897)

(assert (=> b!320906 (= res!175022 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2897 i!1250)))))

(assert (= (and start!32224 res!175026) b!320902))

(assert (= (and b!320902 res!175021) b!320901))

(assert (= (and b!320901 res!175023) b!320903))

(assert (= (and b!320903 res!175024) b!320906))

(assert (= (and b!320906 res!175022) b!320899))

(assert (= (and b!320899 res!175020) b!320905))

(assert (= (and b!320905 res!175025) b!320904))

(assert (= (and b!320904 res!175019) b!320900))

(declare-fun m!329141 () Bool)

(assert (=> b!320903 m!329141))

(declare-fun m!329143 () Bool)

(assert (=> b!320906 m!329143))

(declare-fun m!329145 () Bool)

(assert (=> b!320905 m!329145))

(assert (=> b!320905 m!329145))

(declare-fun m!329147 () Bool)

(assert (=> b!320905 m!329147))

(declare-fun m!329149 () Bool)

(assert (=> b!320899 m!329149))

(declare-fun m!329151 () Bool)

(assert (=> b!320904 m!329151))

(declare-fun m!329153 () Bool)

(assert (=> start!32224 m!329153))

(declare-fun m!329155 () Bool)

(assert (=> start!32224 m!329155))

(declare-fun m!329157 () Bool)

(assert (=> b!320900 m!329157))

(declare-fun m!329159 () Bool)

(assert (=> b!320901 m!329159))

(push 1)

(assert (not b!320900))

(assert (not b!320901))

(assert (not b!320906))

(assert (not b!320903))

(assert (not b!320905))

(assert (not start!32224))

(assert (not b!320899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

