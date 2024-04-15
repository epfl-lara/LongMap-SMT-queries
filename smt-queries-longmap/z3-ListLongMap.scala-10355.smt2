; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121940 () Bool)

(assert start!121940)

(declare-fun b!1415043 () Bool)

(declare-fun res!951145 () Bool)

(declare-fun e!800871 () Bool)

(assert (=> b!1415043 (=> (not res!951145) (not e!800871))))

(declare-datatypes ((array!96579 0))(
  ( (array!96580 (arr!46621 (Array (_ BitVec 32) (_ BitVec 64))) (size!47173 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96579)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415043 (= res!951145 (validKeyInArray!0 (select (arr!46621 a!2901) i!1037)))))

(declare-fun b!1415044 () Bool)

(declare-fun res!951139 () Bool)

(assert (=> b!1415044 (=> (not res!951139) (not e!800871))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415044 (= res!951139 (and (= (size!47173 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47173 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47173 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!800868 () Bool)

(declare-fun b!1415045 () Bool)

(declare-datatypes ((SeekEntryResult!10958 0))(
  ( (MissingZero!10958 (index!46224 (_ BitVec 32))) (Found!10958 (index!46225 (_ BitVec 32))) (Intermediate!10958 (undefined!11770 Bool) (index!46226 (_ BitVec 32)) (x!127834 (_ BitVec 32))) (Undefined!10958) (MissingVacant!10958 (index!46227 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96579 (_ BitVec 32)) SeekEntryResult!10958)

(assert (=> b!1415045 (= e!800868 (= (seekEntryOrOpen!0 (select (arr!46621 a!2901) j!112) a!2901 mask!2840) (Found!10958 j!112)))))

(declare-fun b!1415046 () Bool)

(declare-fun res!951141 () Bool)

(assert (=> b!1415046 (=> (not res!951141) (not e!800871))))

(assert (=> b!1415046 (= res!951141 (validKeyInArray!0 (select (arr!46621 a!2901) j!112)))))

(declare-fun lt!623736 () (_ BitVec 64))

(declare-fun lt!623737 () SeekEntryResult!10958)

(declare-fun b!1415047 () Bool)

(declare-fun lt!623735 () array!96579)

(declare-fun e!800873 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96579 (_ BitVec 32)) SeekEntryResult!10958)

(assert (=> b!1415047 (= e!800873 (= (seekEntryOrOpen!0 lt!623736 lt!623735 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127834 lt!623737) (index!46226 lt!623737) (index!46226 lt!623737) (select (arr!46621 a!2901) j!112) lt!623735 mask!2840)))))

(declare-fun lt!623734 () SeekEntryResult!10958)

(declare-fun lt!623733 () (_ BitVec 32))

(declare-fun e!800870 () Bool)

(declare-fun b!1415048 () Bool)

(assert (=> b!1415048 (= e!800870 (or (bvslt (x!127834 lt!623734) #b00000000000000000000000000000000) (bvsgt (x!127834 lt!623734) #b01111111111111111111111111111110) (bvslt (x!127834 lt!623737) #b00000000000000000000000000000000) (bvsgt (x!127834 lt!623737) #b01111111111111111111111111111110) (bvslt lt!623733 #b00000000000000000000000000000000) (bvsge lt!623733 (size!47173 a!2901)) (bvslt (index!46226 lt!623734) #b00000000000000000000000000000000) (bvsge (index!46226 lt!623734) (size!47173 a!2901)) (and (bvsge (index!46226 lt!623737) #b00000000000000000000000000000000) (bvslt (index!46226 lt!623737) (size!47173 a!2901)))))))

(assert (=> b!1415048 e!800873))

(declare-fun res!951137 () Bool)

(assert (=> b!1415048 (=> (not res!951137) (not e!800873))))

(assert (=> b!1415048 (= res!951137 (and (not (undefined!11770 lt!623737)) (= (index!46226 lt!623737) i!1037) (bvslt (x!127834 lt!623737) (x!127834 lt!623734)) (= (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46226 lt!623737)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47733 0))(
  ( (Unit!47734) )
))
(declare-fun lt!623738 () Unit!47733)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47733)

(assert (=> b!1415048 (= lt!623738 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623733 (x!127834 lt!623734) (index!46226 lt!623734) (x!127834 lt!623737) (index!46226 lt!623737) (undefined!11770 lt!623737) mask!2840))))

(declare-fun b!1415049 () Bool)

(declare-fun res!951138 () Bool)

(assert (=> b!1415049 (=> (not res!951138) (not e!800871))))

(declare-datatypes ((List!33218 0))(
  ( (Nil!33215) (Cons!33214 (h!34501 (_ BitVec 64)) (t!47904 List!33218)) )
))
(declare-fun arrayNoDuplicates!0 (array!96579 (_ BitVec 32) List!33218) Bool)

(assert (=> b!1415049 (= res!951138 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33215))))

(declare-fun b!1415050 () Bool)

(declare-fun e!800869 () Bool)

(assert (=> b!1415050 (= e!800871 (not e!800869))))

(declare-fun res!951142 () Bool)

(assert (=> b!1415050 (=> res!951142 e!800869)))

(get-info :version)

(assert (=> b!1415050 (= res!951142 (or (not ((_ is Intermediate!10958) lt!623734)) (undefined!11770 lt!623734)))))

(assert (=> b!1415050 e!800868))

(declare-fun res!951140 () Bool)

(assert (=> b!1415050 (=> (not res!951140) (not e!800868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96579 (_ BitVec 32)) Bool)

(assert (=> b!1415050 (= res!951140 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623732 () Unit!47733)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47733)

(assert (=> b!1415050 (= lt!623732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96579 (_ BitVec 32)) SeekEntryResult!10958)

(assert (=> b!1415050 (= lt!623734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623733 (select (arr!46621 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415050 (= lt!623733 (toIndex!0 (select (arr!46621 a!2901) j!112) mask!2840))))

(declare-fun b!1415051 () Bool)

(assert (=> b!1415051 (= e!800869 e!800870)))

(declare-fun res!951136 () Bool)

(assert (=> b!1415051 (=> res!951136 e!800870)))

(assert (=> b!1415051 (= res!951136 (or (= lt!623734 lt!623737) (not ((_ is Intermediate!10958) lt!623737))))))

(assert (=> b!1415051 (= lt!623737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623736 mask!2840) lt!623736 lt!623735 mask!2840))))

(assert (=> b!1415051 (= lt!623736 (select (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415051 (= lt!623735 (array!96580 (store (arr!46621 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47173 a!2901)))))

(declare-fun b!1415052 () Bool)

(declare-fun res!951144 () Bool)

(assert (=> b!1415052 (=> (not res!951144) (not e!800871))))

(assert (=> b!1415052 (= res!951144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!951143 () Bool)

(assert (=> start!121940 (=> (not res!951143) (not e!800871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121940 (= res!951143 (validMask!0 mask!2840))))

(assert (=> start!121940 e!800871))

(assert (=> start!121940 true))

(declare-fun array_inv!35854 (array!96579) Bool)

(assert (=> start!121940 (array_inv!35854 a!2901)))

(assert (= (and start!121940 res!951143) b!1415044))

(assert (= (and b!1415044 res!951139) b!1415043))

(assert (= (and b!1415043 res!951145) b!1415046))

(assert (= (and b!1415046 res!951141) b!1415052))

(assert (= (and b!1415052 res!951144) b!1415049))

(assert (= (and b!1415049 res!951138) b!1415050))

(assert (= (and b!1415050 res!951140) b!1415045))

(assert (= (and b!1415050 (not res!951142)) b!1415051))

(assert (= (and b!1415051 (not res!951136)) b!1415048))

(assert (= (and b!1415048 res!951137) b!1415047))

(declare-fun m!1304743 () Bool)

(assert (=> b!1415046 m!1304743))

(assert (=> b!1415046 m!1304743))

(declare-fun m!1304745 () Bool)

(assert (=> b!1415046 m!1304745))

(declare-fun m!1304747 () Bool)

(assert (=> b!1415051 m!1304747))

(assert (=> b!1415051 m!1304747))

(declare-fun m!1304749 () Bool)

(assert (=> b!1415051 m!1304749))

(declare-fun m!1304751 () Bool)

(assert (=> b!1415051 m!1304751))

(declare-fun m!1304753 () Bool)

(assert (=> b!1415051 m!1304753))

(assert (=> b!1415045 m!1304743))

(assert (=> b!1415045 m!1304743))

(declare-fun m!1304755 () Bool)

(assert (=> b!1415045 m!1304755))

(assert (=> b!1415050 m!1304743))

(declare-fun m!1304757 () Bool)

(assert (=> b!1415050 m!1304757))

(assert (=> b!1415050 m!1304743))

(assert (=> b!1415050 m!1304743))

(declare-fun m!1304759 () Bool)

(assert (=> b!1415050 m!1304759))

(declare-fun m!1304761 () Bool)

(assert (=> b!1415050 m!1304761))

(declare-fun m!1304763 () Bool)

(assert (=> b!1415050 m!1304763))

(declare-fun m!1304765 () Bool)

(assert (=> start!121940 m!1304765))

(declare-fun m!1304767 () Bool)

(assert (=> start!121940 m!1304767))

(assert (=> b!1415048 m!1304751))

(declare-fun m!1304769 () Bool)

(assert (=> b!1415048 m!1304769))

(declare-fun m!1304771 () Bool)

(assert (=> b!1415048 m!1304771))

(declare-fun m!1304773 () Bool)

(assert (=> b!1415052 m!1304773))

(declare-fun m!1304775 () Bool)

(assert (=> b!1415047 m!1304775))

(assert (=> b!1415047 m!1304743))

(assert (=> b!1415047 m!1304743))

(declare-fun m!1304777 () Bool)

(assert (=> b!1415047 m!1304777))

(declare-fun m!1304779 () Bool)

(assert (=> b!1415043 m!1304779))

(assert (=> b!1415043 m!1304779))

(declare-fun m!1304781 () Bool)

(assert (=> b!1415043 m!1304781))

(declare-fun m!1304783 () Bool)

(assert (=> b!1415049 m!1304783))

(check-sat (not b!1415043) (not b!1415051) (not start!121940) (not b!1415048) (not b!1415046) (not b!1415045) (not b!1415047) (not b!1415050) (not b!1415052) (not b!1415049))
(check-sat)
