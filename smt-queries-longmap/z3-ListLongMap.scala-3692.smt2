; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50770 () Bool)

(assert start!50770)

(declare-fun b!555387 () Bool)

(declare-fun res!347801 () Bool)

(declare-fun e!320112 () Bool)

(assert (=> b!555387 (=> (not res!347801) (not e!320112))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34995 0))(
  ( (array!34996 (arr!16807 (Array (_ BitVec 32) (_ BitVec 64))) (size!17171 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34995)

(assert (=> b!555387 (= res!347801 (and (= (size!17171 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17171 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17171 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555388 () Bool)

(declare-fun e!320114 () Bool)

(assert (=> b!555388 (= e!320112 e!320114)))

(declare-fun res!347799 () Bool)

(assert (=> b!555388 (=> (not res!347799) (not e!320114))))

(declare-datatypes ((SeekEntryResult!5256 0))(
  ( (MissingZero!5256 (index!23251 (_ BitVec 32))) (Found!5256 (index!23252 (_ BitVec 32))) (Intermediate!5256 (undefined!6068 Bool) (index!23253 (_ BitVec 32)) (x!52154 (_ BitVec 32))) (Undefined!5256) (MissingVacant!5256 (index!23254 (_ BitVec 32))) )
))
(declare-fun lt!252385 () SeekEntryResult!5256)

(assert (=> b!555388 (= res!347799 (or (= lt!252385 (MissingZero!5256 i!1132)) (= lt!252385 (MissingVacant!5256 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34995 (_ BitVec 32)) SeekEntryResult!5256)

(assert (=> b!555388 (= lt!252385 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555389 () Bool)

(declare-fun e!320113 () Bool)

(assert (=> b!555389 (= e!320113 (not true))))

(declare-fun lt!252380 () SeekEntryResult!5256)

(declare-fun lt!252384 () SeekEntryResult!5256)

(get-info :version)

(assert (=> b!555389 (and (= lt!252384 (Found!5256 j!142)) (or (undefined!6068 lt!252380) (not ((_ is Intermediate!5256) lt!252380)) (= (select (arr!16807 a!3118) (index!23253 lt!252380)) (select (arr!16807 a!3118) j!142)) (not (= (select (arr!16807 a!3118) (index!23253 lt!252380)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252384 (MissingZero!5256 (index!23253 lt!252380)))))))

(assert (=> b!555389 (= lt!252384 (seekEntryOrOpen!0 (select (arr!16807 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34995 (_ BitVec 32)) Bool)

(assert (=> b!555389 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17286 0))(
  ( (Unit!17287) )
))
(declare-fun lt!252383 () Unit!17286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17286)

(assert (=> b!555389 (= lt!252383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555390 () Bool)

(declare-fun res!347803 () Bool)

(assert (=> b!555390 (=> (not res!347803) (not e!320112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555390 (= res!347803 (validKeyInArray!0 (select (arr!16807 a!3118) j!142)))))

(declare-fun res!347807 () Bool)

(assert (=> start!50770 (=> (not res!347807) (not e!320112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50770 (= res!347807 (validMask!0 mask!3119))))

(assert (=> start!50770 e!320112))

(assert (=> start!50770 true))

(declare-fun array_inv!12603 (array!34995) Bool)

(assert (=> start!50770 (array_inv!12603 a!3118)))

(declare-fun b!555391 () Bool)

(declare-fun res!347804 () Bool)

(assert (=> b!555391 (=> (not res!347804) (not e!320112))))

(assert (=> b!555391 (= res!347804 (validKeyInArray!0 k0!1914))))

(declare-fun b!555392 () Bool)

(declare-fun res!347802 () Bool)

(assert (=> b!555392 (=> (not res!347802) (not e!320112))))

(declare-fun arrayContainsKey!0 (array!34995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555392 (= res!347802 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555393 () Bool)

(declare-fun res!347806 () Bool)

(assert (=> b!555393 (=> (not res!347806) (not e!320114))))

(assert (=> b!555393 (= res!347806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555394 () Bool)

(declare-fun res!347800 () Bool)

(assert (=> b!555394 (=> (not res!347800) (not e!320114))))

(declare-datatypes ((List!10887 0))(
  ( (Nil!10884) (Cons!10883 (h!11868 (_ BitVec 64)) (t!17115 List!10887)) )
))
(declare-fun arrayNoDuplicates!0 (array!34995 (_ BitVec 32) List!10887) Bool)

(assert (=> b!555394 (= res!347800 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10884))))

(declare-fun b!555395 () Bool)

(assert (=> b!555395 (= e!320114 e!320113)))

(declare-fun res!347805 () Bool)

(assert (=> b!555395 (=> (not res!347805) (not e!320113))))

(declare-fun lt!252382 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34995 (_ BitVec 32)) SeekEntryResult!5256)

(assert (=> b!555395 (= res!347805 (= lt!252380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252382 (select (store (arr!16807 a!3118) i!1132 k0!1914) j!142) (array!34996 (store (arr!16807 a!3118) i!1132 k0!1914) (size!17171 a!3118)) mask!3119)))))

(declare-fun lt!252381 () (_ BitVec 32))

(assert (=> b!555395 (= lt!252380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252381 (select (arr!16807 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555395 (= lt!252382 (toIndex!0 (select (store (arr!16807 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555395 (= lt!252381 (toIndex!0 (select (arr!16807 a!3118) j!142) mask!3119))))

(assert (= (and start!50770 res!347807) b!555387))

(assert (= (and b!555387 res!347801) b!555390))

(assert (= (and b!555390 res!347803) b!555391))

(assert (= (and b!555391 res!347804) b!555392))

(assert (= (and b!555392 res!347802) b!555388))

(assert (= (and b!555388 res!347799) b!555393))

(assert (= (and b!555393 res!347806) b!555394))

(assert (= (and b!555394 res!347800) b!555395))

(assert (= (and b!555395 res!347805) b!555389))

(declare-fun m!533051 () Bool)

(assert (=> b!555390 m!533051))

(assert (=> b!555390 m!533051))

(declare-fun m!533053 () Bool)

(assert (=> b!555390 m!533053))

(assert (=> b!555395 m!533051))

(declare-fun m!533055 () Bool)

(assert (=> b!555395 m!533055))

(assert (=> b!555395 m!533051))

(declare-fun m!533057 () Bool)

(assert (=> b!555395 m!533057))

(declare-fun m!533059 () Bool)

(assert (=> b!555395 m!533059))

(assert (=> b!555395 m!533057))

(assert (=> b!555395 m!533051))

(declare-fun m!533061 () Bool)

(assert (=> b!555395 m!533061))

(declare-fun m!533063 () Bool)

(assert (=> b!555395 m!533063))

(assert (=> b!555395 m!533057))

(declare-fun m!533065 () Bool)

(assert (=> b!555395 m!533065))

(declare-fun m!533067 () Bool)

(assert (=> b!555394 m!533067))

(declare-fun m!533069 () Bool)

(assert (=> b!555392 m!533069))

(declare-fun m!533071 () Bool)

(assert (=> b!555393 m!533071))

(declare-fun m!533073 () Bool)

(assert (=> b!555391 m!533073))

(assert (=> b!555389 m!533051))

(declare-fun m!533075 () Bool)

(assert (=> b!555389 m!533075))

(declare-fun m!533077 () Bool)

(assert (=> b!555389 m!533077))

(declare-fun m!533079 () Bool)

(assert (=> b!555389 m!533079))

(assert (=> b!555389 m!533051))

(declare-fun m!533081 () Bool)

(assert (=> b!555389 m!533081))

(declare-fun m!533083 () Bool)

(assert (=> start!50770 m!533083))

(declare-fun m!533085 () Bool)

(assert (=> start!50770 m!533085))

(declare-fun m!533087 () Bool)

(assert (=> b!555388 m!533087))

(check-sat (not start!50770) (not b!555395) (not b!555389) (not b!555388) (not b!555391) (not b!555394) (not b!555390) (not b!555393) (not b!555392))
(check-sat)
