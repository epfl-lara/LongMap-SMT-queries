; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51412 () Bool)

(assert start!51412)

(declare-fun b!561725 () Bool)

(declare-fun res!352885 () Bool)

(declare-fun e!323701 () Bool)

(assert (=> b!561725 (=> (not res!352885) (not e!323701))))

(declare-datatypes ((array!35277 0))(
  ( (array!35278 (arr!16939 (Array (_ BitVec 32) (_ BitVec 64))) (size!17303 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35277)

(declare-datatypes ((List!11019 0))(
  ( (Nil!11016) (Cons!11015 (h!12018 (_ BitVec 64)) (t!17247 List!11019)) )
))
(declare-fun arrayNoDuplicates!0 (array!35277 (_ BitVec 32) List!11019) Bool)

(assert (=> b!561725 (= res!352885 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11016))))

(declare-fun b!561726 () Bool)

(declare-fun e!323697 () Bool)

(assert (=> b!561726 (= e!323701 e!323697)))

(declare-fun res!352884 () Bool)

(assert (=> b!561726 (=> (not res!352884) (not e!323697))))

(declare-fun lt!255707 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255709 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5388 0))(
  ( (MissingZero!5388 (index!23779 (_ BitVec 32))) (Found!5388 (index!23780 (_ BitVec 32))) (Intermediate!5388 (undefined!6200 Bool) (index!23781 (_ BitVec 32)) (x!52683 (_ BitVec 32))) (Undefined!5388) (MissingVacant!5388 (index!23782 (_ BitVec 32))) )
))
(declare-fun lt!255712 () SeekEntryResult!5388)

(declare-fun lt!255713 () array!35277)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35277 (_ BitVec 32)) SeekEntryResult!5388)

(assert (=> b!561726 (= res!352884 (= lt!255712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255707 lt!255709 lt!255713 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255714 () (_ BitVec 32))

(assert (=> b!561726 (= lt!255712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255714 (select (arr!16939 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561726 (= lt!255707 (toIndex!0 lt!255709 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561726 (= lt!255709 (select (store (arr!16939 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561726 (= lt!255714 (toIndex!0 (select (arr!16939 a!3118) j!142) mask!3119))))

(assert (=> b!561726 (= lt!255713 (array!35278 (store (arr!16939 a!3118) i!1132 k0!1914) (size!17303 a!3118)))))

(declare-fun b!561727 () Bool)

(declare-fun res!352882 () Bool)

(declare-fun e!323702 () Bool)

(assert (=> b!561727 (=> (not res!352882) (not e!323702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561727 (= res!352882 (validKeyInArray!0 (select (arr!16939 a!3118) j!142)))))

(declare-fun b!561728 () Bool)

(declare-fun e!323696 () Bool)

(declare-fun e!323700 () Bool)

(assert (=> b!561728 (= e!323696 e!323700)))

(declare-fun res!352886 () Bool)

(assert (=> b!561728 (=> (not res!352886) (not e!323700))))

(declare-fun lt!255711 () SeekEntryResult!5388)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35277 (_ BitVec 32)) SeekEntryResult!5388)

(assert (=> b!561728 (= res!352886 (= lt!255711 (seekKeyOrZeroReturnVacant!0 (x!52683 lt!255712) (index!23781 lt!255712) (index!23781 lt!255712) (select (arr!16939 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561729 () Bool)

(declare-fun res!352877 () Bool)

(assert (=> b!561729 (=> (not res!352877) (not e!323702))))

(assert (=> b!561729 (= res!352877 (and (= (size!17303 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17303 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17303 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561730 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35277 (_ BitVec 32)) SeekEntryResult!5388)

(assert (=> b!561730 (= e!323700 (= (seekEntryOrOpen!0 lt!255709 lt!255713 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52683 lt!255712) (index!23781 lt!255712) (index!23781 lt!255712) lt!255709 lt!255713 mask!3119)))))

(declare-fun b!561731 () Bool)

(declare-fun e!323698 () Bool)

(declare-fun e!323703 () Bool)

(assert (=> b!561731 (= e!323698 e!323703)))

(declare-fun res!352888 () Bool)

(assert (=> b!561731 (=> res!352888 e!323703)))

(get-info :version)

(assert (=> b!561731 (= res!352888 (or (undefined!6200 lt!255712) (not ((_ is Intermediate!5388) lt!255712))))))

(declare-fun b!561732 () Bool)

(declare-fun res!352880 () Bool)

(assert (=> b!561732 (=> (not res!352880) (not e!323701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35277 (_ BitVec 32)) Bool)

(assert (=> b!561732 (= res!352880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561733 () Bool)

(assert (=> b!561733 (= e!323702 e!323701)))

(declare-fun res!352878 () Bool)

(assert (=> b!561733 (=> (not res!352878) (not e!323701))))

(declare-fun lt!255708 () SeekEntryResult!5388)

(assert (=> b!561733 (= res!352878 (or (= lt!255708 (MissingZero!5388 i!1132)) (= lt!255708 (MissingVacant!5388 i!1132))))))

(assert (=> b!561733 (= lt!255708 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561734 () Bool)

(assert (=> b!561734 (= e!323697 (not true))))

(assert (=> b!561734 e!323698))

(declare-fun res!352879 () Bool)

(assert (=> b!561734 (=> (not res!352879) (not e!323698))))

(assert (=> b!561734 (= res!352879 (= lt!255711 (Found!5388 j!142)))))

(assert (=> b!561734 (= lt!255711 (seekEntryOrOpen!0 (select (arr!16939 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561734 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17550 0))(
  ( (Unit!17551) )
))
(declare-fun lt!255715 () Unit!17550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17550)

(assert (=> b!561734 (= lt!255715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!352881 () Bool)

(assert (=> start!51412 (=> (not res!352881) (not e!323702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51412 (= res!352881 (validMask!0 mask!3119))))

(assert (=> start!51412 e!323702))

(assert (=> start!51412 true))

(declare-fun array_inv!12735 (array!35277) Bool)

(assert (=> start!51412 (array_inv!12735 a!3118)))

(declare-fun b!561735 () Bool)

(declare-fun res!352887 () Bool)

(assert (=> b!561735 (=> (not res!352887) (not e!323702))))

(assert (=> b!561735 (= res!352887 (validKeyInArray!0 k0!1914))))

(declare-fun b!561736 () Bool)

(declare-fun res!352883 () Bool)

(assert (=> b!561736 (=> (not res!352883) (not e!323702))))

(declare-fun arrayContainsKey!0 (array!35277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561736 (= res!352883 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561737 () Bool)

(assert (=> b!561737 (= e!323703 e!323696)))

(declare-fun res!352889 () Bool)

(assert (=> b!561737 (=> res!352889 e!323696)))

(declare-fun lt!255710 () (_ BitVec 64))

(assert (=> b!561737 (= res!352889 (or (= lt!255710 (select (arr!16939 a!3118) j!142)) (= lt!255710 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561737 (= lt!255710 (select (arr!16939 a!3118) (index!23781 lt!255712)))))

(assert (= (and start!51412 res!352881) b!561729))

(assert (= (and b!561729 res!352877) b!561727))

(assert (= (and b!561727 res!352882) b!561735))

(assert (= (and b!561735 res!352887) b!561736))

(assert (= (and b!561736 res!352883) b!561733))

(assert (= (and b!561733 res!352878) b!561732))

(assert (= (and b!561732 res!352880) b!561725))

(assert (= (and b!561725 res!352885) b!561726))

(assert (= (and b!561726 res!352884) b!561734))

(assert (= (and b!561734 res!352879) b!561731))

(assert (= (and b!561731 (not res!352888)) b!561737))

(assert (= (and b!561737 (not res!352889)) b!561728))

(assert (= (and b!561728 res!352886) b!561730))

(declare-fun m!539657 () Bool)

(assert (=> b!561737 m!539657))

(declare-fun m!539659 () Bool)

(assert (=> b!561737 m!539659))

(declare-fun m!539661 () Bool)

(assert (=> b!561725 m!539661))

(assert (=> b!561726 m!539657))

(declare-fun m!539663 () Bool)

(assert (=> b!561726 m!539663))

(declare-fun m!539665 () Bool)

(assert (=> b!561726 m!539665))

(declare-fun m!539667 () Bool)

(assert (=> b!561726 m!539667))

(declare-fun m!539669 () Bool)

(assert (=> b!561726 m!539669))

(assert (=> b!561726 m!539657))

(declare-fun m!539671 () Bool)

(assert (=> b!561726 m!539671))

(assert (=> b!561726 m!539657))

(declare-fun m!539673 () Bool)

(assert (=> b!561726 m!539673))

(declare-fun m!539675 () Bool)

(assert (=> b!561732 m!539675))

(declare-fun m!539677 () Bool)

(assert (=> b!561735 m!539677))

(declare-fun m!539679 () Bool)

(assert (=> start!51412 m!539679))

(declare-fun m!539681 () Bool)

(assert (=> start!51412 m!539681))

(declare-fun m!539683 () Bool)

(assert (=> b!561730 m!539683))

(declare-fun m!539685 () Bool)

(assert (=> b!561730 m!539685))

(assert (=> b!561728 m!539657))

(assert (=> b!561728 m!539657))

(declare-fun m!539687 () Bool)

(assert (=> b!561728 m!539687))

(declare-fun m!539689 () Bool)

(assert (=> b!561733 m!539689))

(assert (=> b!561734 m!539657))

(assert (=> b!561734 m!539657))

(declare-fun m!539691 () Bool)

(assert (=> b!561734 m!539691))

(declare-fun m!539693 () Bool)

(assert (=> b!561734 m!539693))

(declare-fun m!539695 () Bool)

(assert (=> b!561734 m!539695))

(declare-fun m!539697 () Bool)

(assert (=> b!561736 m!539697))

(assert (=> b!561727 m!539657))

(assert (=> b!561727 m!539657))

(declare-fun m!539699 () Bool)

(assert (=> b!561727 m!539699))

(check-sat (not b!561733) (not b!561732) (not b!561725) (not b!561730) (not b!561734) (not b!561735) (not start!51412) (not b!561728) (not b!561726) (not b!561736) (not b!561727))
(check-sat)
