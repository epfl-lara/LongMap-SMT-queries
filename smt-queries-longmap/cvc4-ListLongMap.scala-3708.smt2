; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50988 () Bool)

(assert start!50988)

(declare-fun b!557381 () Bool)

(declare-fun res!349430 () Bool)

(declare-fun e!321111 () Bool)

(assert (=> b!557381 (=> (not res!349430) (not e!321111))))

(declare-datatypes ((array!35099 0))(
  ( (array!35100 (arr!16856 (Array (_ BitVec 32) (_ BitVec 64))) (size!17220 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35099)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557381 (= res!349430 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557382 () Bool)

(declare-fun res!349431 () Bool)

(declare-fun e!321108 () Bool)

(assert (=> b!557382 (=> (not res!349431) (not e!321108))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35099 (_ BitVec 32)) Bool)

(assert (=> b!557382 (= res!349431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557383 () Bool)

(declare-fun res!349436 () Bool)

(assert (=> b!557383 (=> (not res!349436) (not e!321111))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557383 (= res!349436 (validKeyInArray!0 (select (arr!16856 a!3118) j!142)))))

(declare-fun b!557384 () Bool)

(assert (=> b!557384 (= e!321108 (not true))))

(declare-fun e!321109 () Bool)

(assert (=> b!557384 e!321109))

(declare-fun res!349432 () Bool)

(assert (=> b!557384 (=> (not res!349432) (not e!321109))))

(assert (=> b!557384 (= res!349432 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17384 0))(
  ( (Unit!17385) )
))
(declare-fun lt!253272 () Unit!17384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17384)

(assert (=> b!557384 (= lt!253272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557385 () Bool)

(declare-fun res!349428 () Bool)

(assert (=> b!557385 (=> (not res!349428) (not e!321108))))

(declare-datatypes ((List!10936 0))(
  ( (Nil!10933) (Cons!10932 (h!11923 (_ BitVec 64)) (t!17164 List!10936)) )
))
(declare-fun arrayNoDuplicates!0 (array!35099 (_ BitVec 32) List!10936) Bool)

(assert (=> b!557385 (= res!349428 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10933))))

(declare-fun res!349434 () Bool)

(assert (=> start!50988 (=> (not res!349434) (not e!321111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50988 (= res!349434 (validMask!0 mask!3119))))

(assert (=> start!50988 e!321111))

(assert (=> start!50988 true))

(declare-fun array_inv!12652 (array!35099) Bool)

(assert (=> start!50988 (array_inv!12652 a!3118)))

(declare-fun b!557386 () Bool)

(declare-fun res!349433 () Bool)

(assert (=> b!557386 (=> (not res!349433) (not e!321108))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5305 0))(
  ( (MissingZero!5305 (index!23447 (_ BitVec 32))) (Found!5305 (index!23448 (_ BitVec 32))) (Intermediate!5305 (undefined!6117 Bool) (index!23449 (_ BitVec 32)) (x!52343 (_ BitVec 32))) (Undefined!5305) (MissingVacant!5305 (index!23450 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35099 (_ BitVec 32)) SeekEntryResult!5305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557386 (= res!349433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16856 a!3118) j!142) mask!3119) (select (arr!16856 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16856 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16856 a!3118) i!1132 k!1914) j!142) (array!35100 (store (arr!16856 a!3118) i!1132 k!1914) (size!17220 a!3118)) mask!3119)))))

(declare-fun b!557387 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35099 (_ BitVec 32)) SeekEntryResult!5305)

(assert (=> b!557387 (= e!321109 (= (seekEntryOrOpen!0 (select (arr!16856 a!3118) j!142) a!3118 mask!3119) (Found!5305 j!142)))))

(declare-fun b!557388 () Bool)

(assert (=> b!557388 (= e!321111 e!321108)))

(declare-fun res!349429 () Bool)

(assert (=> b!557388 (=> (not res!349429) (not e!321108))))

(declare-fun lt!253273 () SeekEntryResult!5305)

(assert (=> b!557388 (= res!349429 (or (= lt!253273 (MissingZero!5305 i!1132)) (= lt!253273 (MissingVacant!5305 i!1132))))))

(assert (=> b!557388 (= lt!253273 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557389 () Bool)

(declare-fun res!349427 () Bool)

(assert (=> b!557389 (=> (not res!349427) (not e!321111))))

(assert (=> b!557389 (= res!349427 (validKeyInArray!0 k!1914))))

(declare-fun b!557390 () Bool)

(declare-fun res!349435 () Bool)

(assert (=> b!557390 (=> (not res!349435) (not e!321111))))

(assert (=> b!557390 (= res!349435 (and (= (size!17220 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17220 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17220 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50988 res!349434) b!557390))

(assert (= (and b!557390 res!349435) b!557383))

(assert (= (and b!557383 res!349436) b!557389))

(assert (= (and b!557389 res!349427) b!557381))

(assert (= (and b!557381 res!349430) b!557388))

(assert (= (and b!557388 res!349429) b!557382))

(assert (= (and b!557382 res!349431) b!557385))

(assert (= (and b!557385 res!349428) b!557386))

(assert (= (and b!557386 res!349433) b!557384))

(assert (= (and b!557384 res!349432) b!557387))

(declare-fun m!535287 () Bool)

(assert (=> b!557384 m!535287))

(declare-fun m!535289 () Bool)

(assert (=> b!557384 m!535289))

(declare-fun m!535291 () Bool)

(assert (=> b!557381 m!535291))

(declare-fun m!535293 () Bool)

(assert (=> b!557386 m!535293))

(declare-fun m!535295 () Bool)

(assert (=> b!557386 m!535295))

(assert (=> b!557386 m!535293))

(declare-fun m!535297 () Bool)

(assert (=> b!557386 m!535297))

(declare-fun m!535299 () Bool)

(assert (=> b!557386 m!535299))

(assert (=> b!557386 m!535297))

(declare-fun m!535301 () Bool)

(assert (=> b!557386 m!535301))

(assert (=> b!557386 m!535295))

(assert (=> b!557386 m!535293))

(declare-fun m!535303 () Bool)

(assert (=> b!557386 m!535303))

(declare-fun m!535305 () Bool)

(assert (=> b!557386 m!535305))

(assert (=> b!557386 m!535297))

(assert (=> b!557386 m!535299))

(declare-fun m!535307 () Bool)

(assert (=> start!50988 m!535307))

(declare-fun m!535309 () Bool)

(assert (=> start!50988 m!535309))

(declare-fun m!535311 () Bool)

(assert (=> b!557389 m!535311))

(assert (=> b!557383 m!535293))

(assert (=> b!557383 m!535293))

(declare-fun m!535313 () Bool)

(assert (=> b!557383 m!535313))

(declare-fun m!535315 () Bool)

(assert (=> b!557388 m!535315))

(assert (=> b!557387 m!535293))

(assert (=> b!557387 m!535293))

(declare-fun m!535317 () Bool)

(assert (=> b!557387 m!535317))

(declare-fun m!535319 () Bool)

(assert (=> b!557382 m!535319))

(declare-fun m!535321 () Bool)

(assert (=> b!557385 m!535321))

(push 1)

