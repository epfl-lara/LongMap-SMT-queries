; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32702 () Bool)

(assert start!32702)

(declare-fun b!326831 () Bool)

(declare-fun res!179863 () Bool)

(declare-fun e!201143 () Bool)

(assert (=> b!326831 (=> (not res!179863) (not e!201143))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326831 (= res!179863 (validKeyInArray!0 k!2497))))

(declare-fun b!326832 () Bool)

(declare-fun res!179862 () Bool)

(assert (=> b!326832 (=> (not res!179862) (not e!201143))))

(declare-datatypes ((array!16739 0))(
  ( (array!16740 (arr!7924 (Array (_ BitVec 32) (_ BitVec 64))) (size!8276 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16739)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16739 (_ BitVec 32)) Bool)

(assert (=> b!326832 (= res!179862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326833 () Bool)

(declare-fun e!201145 () Bool)

(assert (=> b!326833 (= e!201145 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((Unit!10144 0))(
  ( (Unit!10145) )
))
(declare-fun lt!157404 () Unit!10144)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10144)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326833 (= lt!157404 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!179866 () Bool)

(assert (=> start!32702 (=> (not res!179866) (not e!201143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32702 (= res!179866 (validMask!0 mask!3777))))

(assert (=> start!32702 e!201143))

(declare-fun array_inv!5887 (array!16739) Bool)

(assert (=> start!32702 (array_inv!5887 a!3305)))

(assert (=> start!32702 true))

(declare-fun b!326834 () Bool)

(declare-fun res!179868 () Bool)

(assert (=> b!326834 (=> (not res!179868) (not e!201145))))

(assert (=> b!326834 (= res!179868 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7924 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326835 () Bool)

(declare-fun res!179869 () Bool)

(assert (=> b!326835 (=> (not res!179869) (not e!201143))))

(declare-datatypes ((SeekEntryResult!3055 0))(
  ( (MissingZero!3055 (index!14396 (_ BitVec 32))) (Found!3055 (index!14397 (_ BitVec 32))) (Intermediate!3055 (undefined!3867 Bool) (index!14398 (_ BitVec 32)) (x!32637 (_ BitVec 32))) (Undefined!3055) (MissingVacant!3055 (index!14399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16739 (_ BitVec 32)) SeekEntryResult!3055)

(assert (=> b!326835 (= res!179869 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3055 i!1250)))))

(declare-fun b!326836 () Bool)

(declare-fun res!179864 () Bool)

(assert (=> b!326836 (=> (not res!179864) (not e!201145))))

(assert (=> b!326836 (= res!179864 (and (= (select (arr!7924 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8276 a!3305))))))

(declare-fun b!326837 () Bool)

(declare-fun res!179871 () Bool)

(assert (=> b!326837 (=> (not res!179871) (not e!201143))))

(assert (=> b!326837 (= res!179871 (and (= (size!8276 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8276 a!3305))))))

(declare-fun b!326838 () Bool)

(declare-fun res!179870 () Bool)

(assert (=> b!326838 (=> (not res!179870) (not e!201145))))

(declare-fun lt!157403 () SeekEntryResult!3055)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16739 (_ BitVec 32)) SeekEntryResult!3055)

(assert (=> b!326838 (= res!179870 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157403))))

(declare-fun b!326839 () Bool)

(assert (=> b!326839 (= e!201143 e!201145)))

(declare-fun res!179865 () Bool)

(assert (=> b!326839 (=> (not res!179865) (not e!201145))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326839 (= res!179865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157403))))

(assert (=> b!326839 (= lt!157403 (Intermediate!3055 false resIndex!58 resX!58))))

(declare-fun b!326840 () Bool)

(declare-fun res!179867 () Bool)

(assert (=> b!326840 (=> (not res!179867) (not e!201143))))

(declare-fun arrayContainsKey!0 (array!16739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326840 (= res!179867 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32702 res!179866) b!326837))

(assert (= (and b!326837 res!179871) b!326831))

(assert (= (and b!326831 res!179863) b!326840))

(assert (= (and b!326840 res!179867) b!326835))

(assert (= (and b!326835 res!179869) b!326832))

(assert (= (and b!326832 res!179862) b!326839))

(assert (= (and b!326839 res!179865) b!326836))

(assert (= (and b!326836 res!179864) b!326838))

(assert (= (and b!326838 res!179870) b!326834))

(assert (= (and b!326834 res!179868) b!326833))

(declare-fun m!333327 () Bool)

(assert (=> b!326836 m!333327))

(declare-fun m!333329 () Bool)

(assert (=> b!326838 m!333329))

(declare-fun m!333331 () Bool)

(assert (=> start!32702 m!333331))

(declare-fun m!333333 () Bool)

(assert (=> start!32702 m!333333))

(declare-fun m!333335 () Bool)

(assert (=> b!326835 m!333335))

(declare-fun m!333337 () Bool)

(assert (=> b!326840 m!333337))

(declare-fun m!333339 () Bool)

(assert (=> b!326831 m!333339))

(declare-fun m!333341 () Bool)

(assert (=> b!326839 m!333341))

(assert (=> b!326839 m!333341))

(declare-fun m!333343 () Bool)

(assert (=> b!326839 m!333343))

(declare-fun m!333345 () Bool)

(assert (=> b!326832 m!333345))

(declare-fun m!333347 () Bool)

(assert (=> b!326834 m!333347))

(declare-fun m!333349 () Bool)

(assert (=> b!326833 m!333349))

(assert (=> b!326833 m!333349))

(declare-fun m!333351 () Bool)

(assert (=> b!326833 m!333351))

(push 1)

(assert (not b!326832))

(assert (not start!32702))

(assert (not b!326839))

(assert (not b!326833))

(assert (not b!326840))

(assert (not b!326835))

(assert (not b!326831))

(assert (not b!326838))

(check-sat)

