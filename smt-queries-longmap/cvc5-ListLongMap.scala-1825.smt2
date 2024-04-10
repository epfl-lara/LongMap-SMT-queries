; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33004 () Bool)

(assert start!33004)

(declare-fun b!328693 () Bool)

(declare-fun res!181024 () Bool)

(declare-fun e!202045 () Bool)

(assert (=> b!328693 (=> (not res!181024) (not e!202045))))

(declare-datatypes ((array!16810 0))(
  ( (array!16811 (arr!7952 (Array (_ BitVec 32) (_ BitVec 64))) (size!8304 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16810)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328693 (= res!181024 (and (= (select (arr!7952 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8304 a!3305))))))

(declare-fun b!328694 () Bool)

(declare-fun res!181019 () Bool)

(assert (=> b!328694 (=> (not res!181019) (not e!202045))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3083 0))(
  ( (MissingZero!3083 (index!14508 (_ BitVec 32))) (Found!3083 (index!14509 (_ BitVec 32))) (Intermediate!3083 (undefined!3895 Bool) (index!14510 (_ BitVec 32)) (x!32778 (_ BitVec 32))) (Undefined!3083) (MissingVacant!3083 (index!14511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16810 (_ BitVec 32)) SeekEntryResult!3083)

(assert (=> b!328694 (= res!181019 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3083 i!1250)))))

(declare-fun b!328695 () Bool)

(declare-fun res!181021 () Bool)

(assert (=> b!328695 (=> (not res!181021) (not e!202045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328695 (= res!181021 (validKeyInArray!0 k!2497))))

(declare-fun b!328696 () Bool)

(declare-fun res!181026 () Bool)

(assert (=> b!328696 (=> (not res!181026) (not e!202045))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16810 (_ BitVec 32)) SeekEntryResult!3083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328696 (= res!181026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3083 false resIndex!58 resX!58)))))

(declare-fun b!328697 () Bool)

(declare-fun res!181020 () Bool)

(assert (=> b!328697 (=> (not res!181020) (not e!202045))))

(assert (=> b!328697 (= res!181020 (and (= (size!8304 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8304 a!3305))))))

(declare-fun b!328698 () Bool)

(assert (=> b!328698 (= e!202045 false)))

(declare-fun lt!158013 () SeekEntryResult!3083)

(assert (=> b!328698 (= lt!158013 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328699 () Bool)

(declare-fun res!181022 () Bool)

(assert (=> b!328699 (=> (not res!181022) (not e!202045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16810 (_ BitVec 32)) Bool)

(assert (=> b!328699 (= res!181022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!181023 () Bool)

(assert (=> start!33004 (=> (not res!181023) (not e!202045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33004 (= res!181023 (validMask!0 mask!3777))))

(assert (=> start!33004 e!202045))

(declare-fun array_inv!5915 (array!16810) Bool)

(assert (=> start!33004 (array_inv!5915 a!3305)))

(assert (=> start!33004 true))

(declare-fun b!328700 () Bool)

(declare-fun res!181025 () Bool)

(assert (=> b!328700 (=> (not res!181025) (not e!202045))))

(declare-fun arrayContainsKey!0 (array!16810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328700 (= res!181025 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33004 res!181023) b!328697))

(assert (= (and b!328697 res!181020) b!328695))

(assert (= (and b!328695 res!181021) b!328700))

(assert (= (and b!328700 res!181025) b!328694))

(assert (= (and b!328694 res!181019) b!328699))

(assert (= (and b!328699 res!181022) b!328696))

(assert (= (and b!328696 res!181026) b!328693))

(assert (= (and b!328693 res!181024) b!328698))

(declare-fun m!334565 () Bool)

(assert (=> b!328698 m!334565))

(declare-fun m!334567 () Bool)

(assert (=> b!328696 m!334567))

(assert (=> b!328696 m!334567))

(declare-fun m!334569 () Bool)

(assert (=> b!328696 m!334569))

(declare-fun m!334571 () Bool)

(assert (=> b!328695 m!334571))

(declare-fun m!334573 () Bool)

(assert (=> b!328694 m!334573))

(declare-fun m!334575 () Bool)

(assert (=> start!33004 m!334575))

(declare-fun m!334577 () Bool)

(assert (=> start!33004 m!334577))

(declare-fun m!334579 () Bool)

(assert (=> b!328700 m!334579))

(declare-fun m!334581 () Bool)

(assert (=> b!328693 m!334581))

(declare-fun m!334583 () Bool)

(assert (=> b!328699 m!334583))

(push 1)

(assert (not b!328698))

(assert (not b!328696))

(assert (not b!328694))

(assert (not start!33004))

(assert (not b!328700))

(assert (not b!328695))

(assert (not b!328699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

