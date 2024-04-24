; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122386 () Bool)

(assert start!122386)

(declare-fun b!1418733 () Bool)

(declare-fun res!953783 () Bool)

(declare-fun e!803014 () Bool)

(assert (=> b!1418733 (=> (not res!953783) (not e!803014))))

(declare-datatypes ((array!96892 0))(
  ( (array!96893 (arr!46772 (Array (_ BitVec 32) (_ BitVec 64))) (size!47323 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96892)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418733 (= res!953783 (validKeyInArray!0 (select (arr!46772 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!803015 () Bool)

(declare-fun b!1418734 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10986 0))(
  ( (MissingZero!10986 (index!46336 (_ BitVec 32))) (Found!10986 (index!46337 (_ BitVec 32))) (Intermediate!10986 (undefined!11798 Bool) (index!46338 (_ BitVec 32)) (x!128088 (_ BitVec 32))) (Undefined!10986) (MissingVacant!10986 (index!46339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96892 (_ BitVec 32)) SeekEntryResult!10986)

(assert (=> b!1418734 (= e!803015 (= (seekEntryOrOpen!0 (select (arr!46772 a!2901) j!112) a!2901 mask!2840) (Found!10986 j!112)))))

(declare-fun b!1418735 () Bool)

(declare-fun res!953784 () Bool)

(assert (=> b!1418735 (=> (not res!953784) (not e!803014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96892 (_ BitVec 32)) Bool)

(assert (=> b!1418735 (= res!953784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418736 () Bool)

(declare-fun res!953781 () Bool)

(assert (=> b!1418736 (=> (not res!953781) (not e!803014))))

(assert (=> b!1418736 (= res!953781 (and (= (size!47323 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47323 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47323 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418737 () Bool)

(declare-fun res!953780 () Bool)

(assert (=> b!1418737 (=> (not res!953780) (not e!803014))))

(assert (=> b!1418737 (= res!953780 (validKeyInArray!0 (select (arr!46772 a!2901) j!112)))))

(declare-fun b!1418738 () Bool)

(declare-fun res!953785 () Bool)

(assert (=> b!1418738 (=> (not res!953785) (not e!803014))))

(declare-datatypes ((List!33278 0))(
  ( (Nil!33275) (Cons!33274 (h!34575 (_ BitVec 64)) (t!47964 List!33278)) )
))
(declare-fun arrayNoDuplicates!0 (array!96892 (_ BitVec 32) List!33278) Bool)

(assert (=> b!1418738 (= res!953785 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33275))))

(declare-fun res!953779 () Bool)

(assert (=> start!122386 (=> (not res!953779) (not e!803014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122386 (= res!953779 (validMask!0 mask!2840))))

(assert (=> start!122386 e!803014))

(assert (=> start!122386 true))

(declare-fun array_inv!36053 (array!96892) Bool)

(assert (=> start!122386 (array_inv!36053 a!2901)))

(declare-fun b!1418739 () Bool)

(assert (=> b!1418739 (= e!803014 (not true))))

(assert (=> b!1418739 e!803015))

(declare-fun res!953782 () Bool)

(assert (=> b!1418739 (=> (not res!953782) (not e!803015))))

(assert (=> b!1418739 (= res!953782 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47973 0))(
  ( (Unit!47974) )
))
(declare-fun lt!625814 () Unit!47973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47973)

(assert (=> b!1418739 (= lt!625814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625813 () SeekEntryResult!10986)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96892 (_ BitVec 32)) SeekEntryResult!10986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418739 (= lt!625813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46772 a!2901) j!112) mask!2840) (select (arr!46772 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!122386 res!953779) b!1418736))

(assert (= (and b!1418736 res!953781) b!1418733))

(assert (= (and b!1418733 res!953783) b!1418737))

(assert (= (and b!1418737 res!953780) b!1418735))

(assert (= (and b!1418735 res!953784) b!1418738))

(assert (= (and b!1418738 res!953785) b!1418739))

(assert (= (and b!1418739 res!953782) b!1418734))

(declare-fun m!1309719 () Bool)

(assert (=> b!1418738 m!1309719))

(declare-fun m!1309721 () Bool)

(assert (=> b!1418735 m!1309721))

(declare-fun m!1309723 () Bool)

(assert (=> b!1418737 m!1309723))

(assert (=> b!1418737 m!1309723))

(declare-fun m!1309725 () Bool)

(assert (=> b!1418737 m!1309725))

(assert (=> b!1418739 m!1309723))

(declare-fun m!1309727 () Bool)

(assert (=> b!1418739 m!1309727))

(assert (=> b!1418739 m!1309723))

(declare-fun m!1309729 () Bool)

(assert (=> b!1418739 m!1309729))

(assert (=> b!1418739 m!1309727))

(assert (=> b!1418739 m!1309723))

(declare-fun m!1309731 () Bool)

(assert (=> b!1418739 m!1309731))

(declare-fun m!1309733 () Bool)

(assert (=> b!1418739 m!1309733))

(declare-fun m!1309735 () Bool)

(assert (=> start!122386 m!1309735))

(declare-fun m!1309737 () Bool)

(assert (=> start!122386 m!1309737))

(assert (=> b!1418734 m!1309723))

(assert (=> b!1418734 m!1309723))

(declare-fun m!1309739 () Bool)

(assert (=> b!1418734 m!1309739))

(declare-fun m!1309741 () Bool)

(assert (=> b!1418733 m!1309741))

(assert (=> b!1418733 m!1309741))

(declare-fun m!1309743 () Bool)

(assert (=> b!1418733 m!1309743))

(push 1)

(assert (not b!1418734))

(assert (not start!122386))

(assert (not b!1418737))

(assert (not b!1418738))

(assert (not b!1418739))

(assert (not b!1418733))

(assert (not b!1418735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

