; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33020 () Bool)

(assert start!33020)

(declare-fun b!328885 () Bool)

(declare-fun res!181218 () Bool)

(declare-fun e!202093 () Bool)

(assert (=> b!328885 (=> (not res!181218) (not e!202093))))

(declare-datatypes ((array!16826 0))(
  ( (array!16827 (arr!7960 (Array (_ BitVec 32) (_ BitVec 64))) (size!8312 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16826)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328885 (= res!181218 (and (= (size!8312 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8312 a!3305))))))

(declare-fun b!328886 () Bool)

(declare-fun res!181215 () Bool)

(assert (=> b!328886 (=> (not res!181215) (not e!202093))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3091 0))(
  ( (MissingZero!3091 (index!14540 (_ BitVec 32))) (Found!3091 (index!14541 (_ BitVec 32))) (Intermediate!3091 (undefined!3903 Bool) (index!14542 (_ BitVec 32)) (x!32802 (_ BitVec 32))) (Undefined!3091) (MissingVacant!3091 (index!14543 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16826 (_ BitVec 32)) SeekEntryResult!3091)

(assert (=> b!328886 (= res!181215 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3091 i!1250)))))

(declare-fun res!181213 () Bool)

(assert (=> start!33020 (=> (not res!181213) (not e!202093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33020 (= res!181213 (validMask!0 mask!3777))))

(assert (=> start!33020 e!202093))

(declare-fun array_inv!5923 (array!16826) Bool)

(assert (=> start!33020 (array_inv!5923 a!3305)))

(assert (=> start!33020 true))

(declare-fun b!328887 () Bool)

(declare-fun res!181212 () Bool)

(assert (=> b!328887 (=> (not res!181212) (not e!202093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16826 (_ BitVec 32)) Bool)

(assert (=> b!328887 (= res!181212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328888 () Bool)

(declare-fun res!181211 () Bool)

(assert (=> b!328888 (=> (not res!181211) (not e!202093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328888 (= res!181211 (validKeyInArray!0 k!2497))))

(declare-fun b!328889 () Bool)

(declare-fun res!181217 () Bool)

(assert (=> b!328889 (=> (not res!181217) (not e!202093))))

(declare-fun arrayContainsKey!0 (array!16826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328889 (= res!181217 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328890 () Bool)

(assert (=> b!328890 (= e!202093 false)))

(declare-fun lt!158037 () SeekEntryResult!3091)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16826 (_ BitVec 32)) SeekEntryResult!3091)

(assert (=> b!328890 (= lt!158037 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328891 () Bool)

(declare-fun res!181216 () Bool)

(assert (=> b!328891 (=> (not res!181216) (not e!202093))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328891 (= res!181216 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3091 false resIndex!58 resX!58)))))

(declare-fun b!328892 () Bool)

(declare-fun res!181214 () Bool)

(assert (=> b!328892 (=> (not res!181214) (not e!202093))))

(assert (=> b!328892 (= res!181214 (and (= (select (arr!7960 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8312 a!3305))))))

(assert (= (and start!33020 res!181213) b!328885))

(assert (= (and b!328885 res!181218) b!328888))

(assert (= (and b!328888 res!181211) b!328889))

(assert (= (and b!328889 res!181217) b!328886))

(assert (= (and b!328886 res!181215) b!328887))

(assert (= (and b!328887 res!181212) b!328891))

(assert (= (and b!328891 res!181216) b!328892))

(assert (= (and b!328892 res!181214) b!328890))

(declare-fun m!334725 () Bool)

(assert (=> b!328890 m!334725))

(declare-fun m!334727 () Bool)

(assert (=> b!328886 m!334727))

(declare-fun m!334729 () Bool)

(assert (=> b!328887 m!334729))

(declare-fun m!334731 () Bool)

(assert (=> start!33020 m!334731))

(declare-fun m!334733 () Bool)

(assert (=> start!33020 m!334733))

(declare-fun m!334735 () Bool)

(assert (=> b!328888 m!334735))

(declare-fun m!334737 () Bool)

(assert (=> b!328889 m!334737))

(declare-fun m!334739 () Bool)

(assert (=> b!328891 m!334739))

(assert (=> b!328891 m!334739))

(declare-fun m!334741 () Bool)

(assert (=> b!328891 m!334741))

(declare-fun m!334743 () Bool)

(assert (=> b!328892 m!334743))

(push 1)

(assert (not b!328888))

(assert (not start!33020))

(assert (not b!328889))

(assert (not b!328890))

(assert (not b!328886))

(assert (not b!328887))

(assert (not b!328891))

(check-sat)

(pop 1)

