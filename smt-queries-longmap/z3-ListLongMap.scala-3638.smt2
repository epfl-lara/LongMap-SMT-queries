; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50250 () Bool)

(assert start!50250)

(declare-fun b!549705 () Bool)

(declare-fun e!317495 () Bool)

(declare-fun e!317494 () Bool)

(assert (=> b!549705 (= e!317495 e!317494)))

(declare-fun res!342749 () Bool)

(assert (=> b!549705 (=> (not res!342749) (not e!317494))))

(declare-datatypes ((SeekEntryResult!5044 0))(
  ( (MissingZero!5044 (index!22403 (_ BitVec 32))) (Found!5044 (index!22404 (_ BitVec 32))) (Intermediate!5044 (undefined!5856 Bool) (index!22405 (_ BitVec 32)) (x!51489 (_ BitVec 32))) (Undefined!5044) (MissingVacant!5044 (index!22406 (_ BitVec 32))) )
))
(declare-fun lt!250284 () SeekEntryResult!5044)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549705 (= res!342749 (or (= lt!250284 (MissingZero!5044 i!1132)) (= lt!250284 (MissingVacant!5044 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34650 0))(
  ( (array!34651 (arr!16639 (Array (_ BitVec 32) (_ BitVec 64))) (size!17003 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34650)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34650 (_ BitVec 32)) SeekEntryResult!5044)

(assert (=> b!549705 (= lt!250284 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549706 () Bool)

(declare-fun res!342746 () Bool)

(assert (=> b!549706 (=> (not res!342746) (not e!317495))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549706 (= res!342746 (and (= (size!17003 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17003 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17003 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342747 () Bool)

(assert (=> start!50250 (=> (not res!342747) (not e!317495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50250 (= res!342747 (validMask!0 mask!3119))))

(assert (=> start!50250 e!317495))

(assert (=> start!50250 true))

(declare-fun array_inv!12498 (array!34650) Bool)

(assert (=> start!50250 (array_inv!12498 a!3118)))

(declare-fun b!549707 () Bool)

(declare-fun res!342750 () Bool)

(assert (=> b!549707 (=> (not res!342750) (not e!317494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34650 (_ BitVec 32)) Bool)

(assert (=> b!549707 (= res!342750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549708 () Bool)

(assert (=> b!549708 (= e!317494 false)))

(declare-fun lt!250282 () (_ BitVec 32))

(declare-fun lt!250281 () SeekEntryResult!5044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34650 (_ BitVec 32)) SeekEntryResult!5044)

(assert (=> b!549708 (= lt!250281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250282 (select (store (arr!16639 a!3118) i!1132 k0!1914) j!142) (array!34651 (store (arr!16639 a!3118) i!1132 k0!1914) (size!17003 a!3118)) mask!3119))))

(declare-fun lt!250285 () (_ BitVec 32))

(declare-fun lt!250283 () SeekEntryResult!5044)

(assert (=> b!549708 (= lt!250283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250285 (select (arr!16639 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549708 (= lt!250282 (toIndex!0 (select (store (arr!16639 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549708 (= lt!250285 (toIndex!0 (select (arr!16639 a!3118) j!142) mask!3119))))

(declare-fun b!549709 () Bool)

(declare-fun res!342744 () Bool)

(assert (=> b!549709 (=> (not res!342744) (not e!317495))))

(declare-fun arrayContainsKey!0 (array!34650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549709 (= res!342744 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549710 () Bool)

(declare-fun res!342748 () Bool)

(assert (=> b!549710 (=> (not res!342748) (not e!317495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549710 (= res!342748 (validKeyInArray!0 (select (arr!16639 a!3118) j!142)))))

(declare-fun b!549711 () Bool)

(declare-fun res!342745 () Bool)

(assert (=> b!549711 (=> (not res!342745) (not e!317495))))

(assert (=> b!549711 (= res!342745 (validKeyInArray!0 k0!1914))))

(declare-fun b!549712 () Bool)

(declare-fun res!342751 () Bool)

(assert (=> b!549712 (=> (not res!342751) (not e!317494))))

(declare-datatypes ((List!10626 0))(
  ( (Nil!10623) (Cons!10622 (h!11598 (_ BitVec 64)) (t!16846 List!10626)) )
))
(declare-fun arrayNoDuplicates!0 (array!34650 (_ BitVec 32) List!10626) Bool)

(assert (=> b!549712 (= res!342751 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10623))))

(assert (= (and start!50250 res!342747) b!549706))

(assert (= (and b!549706 res!342746) b!549710))

(assert (= (and b!549710 res!342748) b!549711))

(assert (= (and b!549711 res!342745) b!549709))

(assert (= (and b!549709 res!342744) b!549705))

(assert (= (and b!549705 res!342749) b!549707))

(assert (= (and b!549707 res!342750) b!549712))

(assert (= (and b!549712 res!342751) b!549708))

(declare-fun m!526709 () Bool)

(assert (=> start!50250 m!526709))

(declare-fun m!526711 () Bool)

(assert (=> start!50250 m!526711))

(declare-fun m!526713 () Bool)

(assert (=> b!549705 m!526713))

(declare-fun m!526715 () Bool)

(assert (=> b!549708 m!526715))

(declare-fun m!526717 () Bool)

(assert (=> b!549708 m!526717))

(assert (=> b!549708 m!526715))

(declare-fun m!526719 () Bool)

(assert (=> b!549708 m!526719))

(assert (=> b!549708 m!526715))

(declare-fun m!526721 () Bool)

(assert (=> b!549708 m!526721))

(declare-fun m!526723 () Bool)

(assert (=> b!549708 m!526723))

(assert (=> b!549708 m!526721))

(declare-fun m!526725 () Bool)

(assert (=> b!549708 m!526725))

(assert (=> b!549708 m!526721))

(declare-fun m!526727 () Bool)

(assert (=> b!549708 m!526727))

(declare-fun m!526729 () Bool)

(assert (=> b!549711 m!526729))

(assert (=> b!549710 m!526715))

(assert (=> b!549710 m!526715))

(declare-fun m!526731 () Bool)

(assert (=> b!549710 m!526731))

(declare-fun m!526733 () Bool)

(assert (=> b!549709 m!526733))

(declare-fun m!526735 () Bool)

(assert (=> b!549712 m!526735))

(declare-fun m!526737 () Bool)

(assert (=> b!549707 m!526737))

(check-sat (not b!549712) (not b!549707) (not b!549705) (not b!549710) (not b!549708) (not start!50250) (not b!549711) (not b!549709))
(check-sat)
