; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45792 () Bool)

(assert start!45792)

(declare-fun b!506778 () Bool)

(declare-fun res!307883 () Bool)

(declare-fun e!296577 () Bool)

(assert (=> b!506778 (=> (not res!307883) (not e!296577))))

(declare-datatypes ((array!32558 0))(
  ( (array!32559 (arr!15659 (Array (_ BitVec 32) (_ BitVec 64))) (size!16024 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32558)

(declare-datatypes ((List!9856 0))(
  ( (Nil!9853) (Cons!9852 (h!10729 (_ BitVec 64)) (t!16075 List!9856)) )
))
(declare-fun arrayNoDuplicates!0 (array!32558 (_ BitVec 32) List!9856) Bool)

(assert (=> b!506778 (= res!307883 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9853))))

(declare-fun b!506779 () Bool)

(declare-fun res!307880 () Bool)

(declare-fun e!296579 () Bool)

(assert (=> b!506779 (=> (not res!307880) (not e!296579))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506779 (= res!307880 (validKeyInArray!0 k0!2280))))

(declare-fun b!506780 () Bool)

(declare-fun res!307882 () Bool)

(assert (=> b!506780 (=> (not res!307882) (not e!296579))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506780 (= res!307882 (validKeyInArray!0 (select (arr!15659 a!3235) j!176)))))

(declare-fun b!506781 () Bool)

(declare-fun e!296580 () Bool)

(assert (=> b!506781 (= e!296580 true)))

(assert (=> b!506781 false))

(declare-fun b!506783 () Bool)

(declare-fun res!307886 () Bool)

(assert (=> b!506783 (=> (not res!307886) (not e!296579))))

(declare-fun arrayContainsKey!0 (array!32558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506783 (= res!307886 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506784 () Bool)

(declare-fun e!296575 () Bool)

(assert (=> b!506784 (= e!296577 (not e!296575))))

(declare-fun res!307887 () Bool)

(assert (=> b!506784 (=> res!307887 e!296575)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4123 0))(
  ( (MissingZero!4123 (index!18680 (_ BitVec 32))) (Found!4123 (index!18681 (_ BitVec 32))) (Intermediate!4123 (undefined!4935 Bool) (index!18682 (_ BitVec 32)) (x!47687 (_ BitVec 32))) (Undefined!4123) (MissingVacant!4123 (index!18683 (_ BitVec 32))) )
))
(declare-fun lt!231196 () SeekEntryResult!4123)

(declare-fun lt!231194 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32558 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!506784 (= res!307887 (= lt!231196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231194 (select (store (arr!15659 a!3235) i!1204 k0!2280) j!176) (array!32559 (store (arr!15659 a!3235) i!1204 k0!2280) (size!16024 a!3235)) mask!3524)))))

(declare-fun lt!231191 () (_ BitVec 32))

(assert (=> b!506784 (= lt!231196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231191 (select (arr!15659 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506784 (= lt!231194 (toIndex!0 (select (store (arr!15659 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506784 (= lt!231191 (toIndex!0 (select (arr!15659 a!3235) j!176) mask!3524))))

(declare-fun e!296576 () Bool)

(assert (=> b!506784 e!296576))

(declare-fun res!307881 () Bool)

(assert (=> b!506784 (=> (not res!307881) (not e!296576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32558 (_ BitVec 32)) Bool)

(assert (=> b!506784 (= res!307881 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15520 0))(
  ( (Unit!15521) )
))
(declare-fun lt!231193 () Unit!15520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15520)

(assert (=> b!506784 (= lt!231193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506785 () Bool)

(assert (=> b!506785 (= e!296575 e!296580)))

(declare-fun res!307879 () Bool)

(assert (=> b!506785 (=> res!307879 e!296580)))

(declare-fun lt!231192 () Bool)

(assert (=> b!506785 (= res!307879 (or (and (not lt!231192) (undefined!4935 lt!231196)) (and (not lt!231192) (not (undefined!4935 lt!231196)))))))

(get-info :version)

(assert (=> b!506785 (= lt!231192 (not ((_ is Intermediate!4123) lt!231196)))))

(declare-fun b!506786 () Bool)

(declare-fun res!307888 () Bool)

(assert (=> b!506786 (=> (not res!307888) (not e!296577))))

(assert (=> b!506786 (= res!307888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307884 () Bool)

(assert (=> start!45792 (=> (not res!307884) (not e!296579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45792 (= res!307884 (validMask!0 mask!3524))))

(assert (=> start!45792 e!296579))

(assert (=> start!45792 true))

(declare-fun array_inv!11542 (array!32558) Bool)

(assert (=> start!45792 (array_inv!11542 a!3235)))

(declare-fun b!506782 () Bool)

(assert (=> b!506782 (= e!296579 e!296577)))

(declare-fun res!307889 () Bool)

(assert (=> b!506782 (=> (not res!307889) (not e!296577))))

(declare-fun lt!231195 () SeekEntryResult!4123)

(assert (=> b!506782 (= res!307889 (or (= lt!231195 (MissingZero!4123 i!1204)) (= lt!231195 (MissingVacant!4123 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32558 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!506782 (= lt!231195 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506787 () Bool)

(declare-fun res!307885 () Bool)

(assert (=> b!506787 (=> (not res!307885) (not e!296579))))

(assert (=> b!506787 (= res!307885 (and (= (size!16024 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16024 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16024 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506788 () Bool)

(assert (=> b!506788 (= e!296576 (= (seekEntryOrOpen!0 (select (arr!15659 a!3235) j!176) a!3235 mask!3524) (Found!4123 j!176)))))

(assert (= (and start!45792 res!307884) b!506787))

(assert (= (and b!506787 res!307885) b!506780))

(assert (= (and b!506780 res!307882) b!506779))

(assert (= (and b!506779 res!307880) b!506783))

(assert (= (and b!506783 res!307886) b!506782))

(assert (= (and b!506782 res!307889) b!506786))

(assert (= (and b!506786 res!307888) b!506778))

(assert (= (and b!506778 res!307883) b!506784))

(assert (= (and b!506784 res!307881) b!506788))

(assert (= (and b!506784 (not res!307887)) b!506785))

(assert (= (and b!506785 (not res!307879)) b!506781))

(declare-fun m!487015 () Bool)

(assert (=> b!506778 m!487015))

(declare-fun m!487017 () Bool)

(assert (=> b!506779 m!487017))

(declare-fun m!487019 () Bool)

(assert (=> b!506782 m!487019))

(declare-fun m!487021 () Bool)

(assert (=> b!506786 m!487021))

(declare-fun m!487023 () Bool)

(assert (=> start!45792 m!487023))

(declare-fun m!487025 () Bool)

(assert (=> start!45792 m!487025))

(declare-fun m!487027 () Bool)

(assert (=> b!506780 m!487027))

(assert (=> b!506780 m!487027))

(declare-fun m!487029 () Bool)

(assert (=> b!506780 m!487029))

(assert (=> b!506788 m!487027))

(assert (=> b!506788 m!487027))

(declare-fun m!487031 () Bool)

(assert (=> b!506788 m!487031))

(declare-fun m!487033 () Bool)

(assert (=> b!506783 m!487033))

(assert (=> b!506784 m!487027))

(declare-fun m!487035 () Bool)

(assert (=> b!506784 m!487035))

(declare-fun m!487037 () Bool)

(assert (=> b!506784 m!487037))

(declare-fun m!487039 () Bool)

(assert (=> b!506784 m!487039))

(declare-fun m!487041 () Bool)

(assert (=> b!506784 m!487041))

(declare-fun m!487043 () Bool)

(assert (=> b!506784 m!487043))

(assert (=> b!506784 m!487037))

(assert (=> b!506784 m!487027))

(declare-fun m!487045 () Bool)

(assert (=> b!506784 m!487045))

(assert (=> b!506784 m!487027))

(declare-fun m!487047 () Bool)

(assert (=> b!506784 m!487047))

(assert (=> b!506784 m!487037))

(declare-fun m!487049 () Bool)

(assert (=> b!506784 m!487049))

(check-sat (not b!506780) (not b!506782) (not b!506783) (not b!506784) (not b!506779) (not b!506788) (not b!506778) (not start!45792) (not b!506786))
(check-sat)
