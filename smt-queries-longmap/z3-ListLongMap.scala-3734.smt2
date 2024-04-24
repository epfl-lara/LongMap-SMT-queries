; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51444 () Bool)

(assert start!51444)

(declare-fun b!561652 () Bool)

(declare-fun e!323664 () Bool)

(assert (=> b!561652 (= e!323664 (not true))))

(declare-fun e!323660 () Bool)

(assert (=> b!561652 e!323660))

(declare-fun res!352701 () Bool)

(assert (=> b!561652 (=> (not res!352701) (not e!323660))))

(declare-datatypes ((SeekEntryResult!5332 0))(
  ( (MissingZero!5332 (index!23555 (_ BitVec 32))) (Found!5332 (index!23556 (_ BitVec 32))) (Intermediate!5332 (undefined!6144 Bool) (index!23557 (_ BitVec 32)) (x!52614 (_ BitVec 32))) (Undefined!5332) (MissingVacant!5332 (index!23558 (_ BitVec 32))) )
))
(declare-fun lt!255631 () SeekEntryResult!5332)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561652 (= res!352701 (= lt!255631 (Found!5332 j!142)))))

(declare-datatypes ((array!35256 0))(
  ( (array!35257 (arr!16927 (Array (_ BitVec 32) (_ BitVec 64))) (size!17291 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35256)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35256 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!561652 (= lt!255631 (seekEntryOrOpen!0 (select (arr!16927 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35256 (_ BitVec 32)) Bool)

(assert (=> b!561652 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17509 0))(
  ( (Unit!17510) )
))
(declare-fun lt!255635 () Unit!17509)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17509)

(assert (=> b!561652 (= lt!255635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561653 () Bool)

(declare-fun res!352704 () Bool)

(declare-fun e!323658 () Bool)

(assert (=> b!561653 (=> (not res!352704) (not e!323658))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561653 (= res!352704 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!323659 () Bool)

(declare-fun lt!255630 () (_ BitVec 64))

(declare-fun b!561654 () Bool)

(declare-fun lt!255633 () array!35256)

(declare-fun lt!255629 () SeekEntryResult!5332)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35256 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!561654 (= e!323659 (= (seekEntryOrOpen!0 lt!255630 lt!255633 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52614 lt!255629) (index!23557 lt!255629) (index!23557 lt!255629) lt!255630 lt!255633 mask!3119)))))

(declare-fun b!561655 () Bool)

(declare-fun res!352705 () Bool)

(assert (=> b!561655 (=> (not res!352705) (not e!323658))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561655 (= res!352705 (and (= (size!17291 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17291 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17291 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561657 () Bool)

(declare-fun res!352706 () Bool)

(declare-fun e!323662 () Bool)

(assert (=> b!561657 (=> (not res!352706) (not e!323662))))

(assert (=> b!561657 (= res!352706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561658 () Bool)

(declare-fun res!352708 () Bool)

(assert (=> b!561658 (=> (not res!352708) (not e!323662))))

(declare-datatypes ((List!10914 0))(
  ( (Nil!10911) (Cons!10910 (h!11916 (_ BitVec 64)) (t!17134 List!10914)) )
))
(declare-fun arrayNoDuplicates!0 (array!35256 (_ BitVec 32) List!10914) Bool)

(assert (=> b!561658 (= res!352708 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10911))))

(declare-fun b!561659 () Bool)

(declare-fun res!352709 () Bool)

(assert (=> b!561659 (=> (not res!352709) (not e!323658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561659 (= res!352709 (validKeyInArray!0 (select (arr!16927 a!3118) j!142)))))

(declare-fun b!561660 () Bool)

(assert (=> b!561660 (= e!323662 e!323664)))

(declare-fun res!352699 () Bool)

(assert (=> b!561660 (=> (not res!352699) (not e!323664))))

(declare-fun lt!255637 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35256 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!561660 (= res!352699 (= lt!255629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255637 lt!255630 lt!255633 mask!3119)))))

(declare-fun lt!255632 () (_ BitVec 32))

(assert (=> b!561660 (= lt!255629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255632 (select (arr!16927 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561660 (= lt!255637 (toIndex!0 lt!255630 mask!3119))))

(assert (=> b!561660 (= lt!255630 (select (store (arr!16927 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561660 (= lt!255632 (toIndex!0 (select (arr!16927 a!3118) j!142) mask!3119))))

(assert (=> b!561660 (= lt!255633 (array!35257 (store (arr!16927 a!3118) i!1132 k0!1914) (size!17291 a!3118)))))

(declare-fun b!561661 () Bool)

(declare-fun e!323661 () Bool)

(declare-fun e!323657 () Bool)

(assert (=> b!561661 (= e!323661 e!323657)))

(declare-fun res!352700 () Bool)

(assert (=> b!561661 (=> res!352700 e!323657)))

(declare-fun lt!255634 () (_ BitVec 64))

(assert (=> b!561661 (= res!352700 (or (= lt!255634 (select (arr!16927 a!3118) j!142)) (= lt!255634 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561661 (= lt!255634 (select (arr!16927 a!3118) (index!23557 lt!255629)))))

(declare-fun b!561662 () Bool)

(assert (=> b!561662 (= e!323658 e!323662)))

(declare-fun res!352710 () Bool)

(assert (=> b!561662 (=> (not res!352710) (not e!323662))))

(declare-fun lt!255636 () SeekEntryResult!5332)

(assert (=> b!561662 (= res!352710 (or (= lt!255636 (MissingZero!5332 i!1132)) (= lt!255636 (MissingVacant!5332 i!1132))))))

(assert (=> b!561662 (= lt!255636 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561656 () Bool)

(assert (=> b!561656 (= e!323660 e!323661)))

(declare-fun res!352711 () Bool)

(assert (=> b!561656 (=> res!352711 e!323661)))

(get-info :version)

(assert (=> b!561656 (= res!352711 (or (undefined!6144 lt!255629) (not ((_ is Intermediate!5332) lt!255629))))))

(declare-fun res!352707 () Bool)

(assert (=> start!51444 (=> (not res!352707) (not e!323658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51444 (= res!352707 (validMask!0 mask!3119))))

(assert (=> start!51444 e!323658))

(assert (=> start!51444 true))

(declare-fun array_inv!12786 (array!35256) Bool)

(assert (=> start!51444 (array_inv!12786 a!3118)))

(declare-fun b!561663 () Bool)

(assert (=> b!561663 (= e!323657 e!323659)))

(declare-fun res!352703 () Bool)

(assert (=> b!561663 (=> (not res!352703) (not e!323659))))

(assert (=> b!561663 (= res!352703 (= lt!255631 (seekKeyOrZeroReturnVacant!0 (x!52614 lt!255629) (index!23557 lt!255629) (index!23557 lt!255629) (select (arr!16927 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561664 () Bool)

(declare-fun res!352702 () Bool)

(assert (=> b!561664 (=> (not res!352702) (not e!323658))))

(assert (=> b!561664 (= res!352702 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51444 res!352707) b!561655))

(assert (= (and b!561655 res!352705) b!561659))

(assert (= (and b!561659 res!352709) b!561664))

(assert (= (and b!561664 res!352702) b!561653))

(assert (= (and b!561653 res!352704) b!561662))

(assert (= (and b!561662 res!352710) b!561657))

(assert (= (and b!561657 res!352706) b!561658))

(assert (= (and b!561658 res!352708) b!561660))

(assert (= (and b!561660 res!352699) b!561652))

(assert (= (and b!561652 res!352701) b!561656))

(assert (= (and b!561656 (not res!352711)) b!561661))

(assert (= (and b!561661 (not res!352700)) b!561663))

(assert (= (and b!561663 res!352703) b!561654))

(declare-fun m!539687 () Bool)

(assert (=> b!561653 m!539687))

(declare-fun m!539689 () Bool)

(assert (=> start!51444 m!539689))

(declare-fun m!539691 () Bool)

(assert (=> start!51444 m!539691))

(declare-fun m!539693 () Bool)

(assert (=> b!561660 m!539693))

(declare-fun m!539695 () Bool)

(assert (=> b!561660 m!539695))

(declare-fun m!539697 () Bool)

(assert (=> b!561660 m!539697))

(assert (=> b!561660 m!539695))

(declare-fun m!539699 () Bool)

(assert (=> b!561660 m!539699))

(declare-fun m!539701 () Bool)

(assert (=> b!561660 m!539701))

(assert (=> b!561660 m!539695))

(declare-fun m!539703 () Bool)

(assert (=> b!561660 m!539703))

(declare-fun m!539705 () Bool)

(assert (=> b!561660 m!539705))

(assert (=> b!561661 m!539695))

(declare-fun m!539707 () Bool)

(assert (=> b!561661 m!539707))

(declare-fun m!539709 () Bool)

(assert (=> b!561657 m!539709))

(declare-fun m!539711 () Bool)

(assert (=> b!561662 m!539711))

(declare-fun m!539713 () Bool)

(assert (=> b!561664 m!539713))

(declare-fun m!539715 () Bool)

(assert (=> b!561654 m!539715))

(declare-fun m!539717 () Bool)

(assert (=> b!561654 m!539717))

(declare-fun m!539719 () Bool)

(assert (=> b!561658 m!539719))

(assert (=> b!561652 m!539695))

(assert (=> b!561652 m!539695))

(declare-fun m!539721 () Bool)

(assert (=> b!561652 m!539721))

(declare-fun m!539723 () Bool)

(assert (=> b!561652 m!539723))

(declare-fun m!539725 () Bool)

(assert (=> b!561652 m!539725))

(assert (=> b!561663 m!539695))

(assert (=> b!561663 m!539695))

(declare-fun m!539727 () Bool)

(assert (=> b!561663 m!539727))

(assert (=> b!561659 m!539695))

(assert (=> b!561659 m!539695))

(declare-fun m!539729 () Bool)

(assert (=> b!561659 m!539729))

(check-sat (not b!561662) (not b!561654) (not b!561659) (not b!561657) (not b!561658) (not b!561660) (not b!561653) (not start!51444) (not b!561663) (not b!561664) (not b!561652))
(check-sat)
