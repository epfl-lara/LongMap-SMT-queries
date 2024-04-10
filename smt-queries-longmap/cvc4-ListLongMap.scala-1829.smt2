; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33080 () Bool)

(assert start!33080)

(declare-fun b!329253 () Bool)

(declare-fun res!181446 () Bool)

(declare-fun e!202288 () Bool)

(assert (=> b!329253 (=> (not res!181446) (not e!202288))))

(declare-datatypes ((array!16841 0))(
  ( (array!16842 (arr!7966 (Array (_ BitVec 32) (_ BitVec 64))) (size!8318 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16841)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329253 (= res!181446 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329255 () Bool)

(declare-fun res!181439 () Bool)

(declare-fun e!202287 () Bool)

(assert (=> b!329255 (=> (not res!181439) (not e!202287))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329255 (= res!181439 (and (= (select (arr!7966 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8318 a!3305))))))

(declare-fun b!329256 () Bool)

(declare-fun res!181440 () Bool)

(assert (=> b!329256 (=> (not res!181440) (not e!202288))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16841 (_ BitVec 32)) Bool)

(assert (=> b!329256 (= res!181440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329257 () Bool)

(declare-fun res!181438 () Bool)

(assert (=> b!329257 (=> (not res!181438) (not e!202288))))

(assert (=> b!329257 (= res!181438 (and (= (size!8318 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8318 a!3305))))))

(declare-fun b!329258 () Bool)

(declare-fun e!202285 () Bool)

(assert (=> b!329258 (= e!202285 (not false))))

(declare-datatypes ((SeekEntryResult!3097 0))(
  ( (MissingZero!3097 (index!14564 (_ BitVec 32))) (Found!3097 (index!14565 (_ BitVec 32))) (Intermediate!3097 (undefined!3909 Bool) (index!14566 (_ BitVec 32)) (x!32830 (_ BitVec 32))) (Undefined!3097) (MissingVacant!3097 (index!14567 (_ BitVec 32))) )
))
(declare-fun lt!158168 () SeekEntryResult!3097)

(assert (=> b!329258 (= lt!158168 (Intermediate!3097 false index!1840 resX!58))))

(declare-fun b!329259 () Bool)

(declare-fun res!181441 () Bool)

(assert (=> b!329259 (=> (not res!181441) (not e!202288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329259 (= res!181441 (validKeyInArray!0 k!2497))))

(declare-fun b!329260 () Bool)

(assert (=> b!329260 (= e!202287 e!202285)))

(declare-fun res!181443 () Bool)

(assert (=> b!329260 (=> (not res!181443) (not e!202285))))

(declare-fun lt!158169 () SeekEntryResult!3097)

(assert (=> b!329260 (= res!181443 (and (= lt!158168 lt!158169) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7966 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7966 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7966 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16841 (_ BitVec 32)) SeekEntryResult!3097)

(assert (=> b!329260 (= lt!158168 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!329261 () Bool)

(declare-fun res!181442 () Bool)

(assert (=> b!329261 (=> (not res!181442) (not e!202288))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16841 (_ BitVec 32)) SeekEntryResult!3097)

(assert (=> b!329261 (= res!181442 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3097 i!1250)))))

(declare-fun b!329254 () Bool)

(assert (=> b!329254 (= e!202288 e!202287)))

(declare-fun res!181445 () Bool)

(assert (=> b!329254 (=> (not res!181445) (not e!202287))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329254 (= res!181445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158169))))

(assert (=> b!329254 (= lt!158169 (Intermediate!3097 false resIndex!58 resX!58))))

(declare-fun res!181444 () Bool)

(assert (=> start!33080 (=> (not res!181444) (not e!202288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33080 (= res!181444 (validMask!0 mask!3777))))

(assert (=> start!33080 e!202288))

(declare-fun array_inv!5929 (array!16841) Bool)

(assert (=> start!33080 (array_inv!5929 a!3305)))

(assert (=> start!33080 true))

(assert (= (and start!33080 res!181444) b!329257))

(assert (= (and b!329257 res!181438) b!329259))

(assert (= (and b!329259 res!181441) b!329253))

(assert (= (and b!329253 res!181446) b!329261))

(assert (= (and b!329261 res!181442) b!329256))

(assert (= (and b!329256 res!181440) b!329254))

(assert (= (and b!329254 res!181445) b!329255))

(assert (= (and b!329255 res!181439) b!329260))

(assert (= (and b!329260 res!181443) b!329258))

(declare-fun m!334969 () Bool)

(assert (=> b!329261 m!334969))

(declare-fun m!334971 () Bool)

(assert (=> b!329259 m!334971))

(declare-fun m!334973 () Bool)

(assert (=> b!329255 m!334973))

(declare-fun m!334975 () Bool)

(assert (=> b!329260 m!334975))

(declare-fun m!334977 () Bool)

(assert (=> b!329260 m!334977))

(declare-fun m!334979 () Bool)

(assert (=> b!329253 m!334979))

(declare-fun m!334981 () Bool)

(assert (=> b!329256 m!334981))

(declare-fun m!334983 () Bool)

(assert (=> b!329254 m!334983))

(assert (=> b!329254 m!334983))

(declare-fun m!334985 () Bool)

(assert (=> b!329254 m!334985))

(declare-fun m!334987 () Bool)

(assert (=> start!33080 m!334987))

(declare-fun m!334989 () Bool)

(assert (=> start!33080 m!334989))

(push 1)

(assert (not b!329256))

(assert (not b!329261))

