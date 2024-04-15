; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44730 () Bool)

(assert start!44730)

(declare-fun b!490847 () Bool)

(declare-fun res!293933 () Bool)

(declare-fun e!288441 () Bool)

(assert (=> b!490847 (=> (not res!293933) (not e!288441))))

(declare-datatypes ((array!31799 0))(
  ( (array!31800 (arr!15287 (Array (_ BitVec 32) (_ BitVec 64))) (size!15652 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31799)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31799 (_ BitVec 32)) Bool)

(assert (=> b!490847 (= res!293933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490848 () Bool)

(declare-fun e!288438 () Bool)

(assert (=> b!490848 (= e!288438 e!288441)))

(declare-fun res!293930 () Bool)

(assert (=> b!490848 (=> (not res!293930) (not e!288441))))

(declare-datatypes ((SeekEntryResult!3751 0))(
  ( (MissingZero!3751 (index!17183 (_ BitVec 32))) (Found!3751 (index!17184 (_ BitVec 32))) (Intermediate!3751 (undefined!4563 Bool) (index!17185 (_ BitVec 32)) (x!46284 (_ BitVec 32))) (Undefined!3751) (MissingVacant!3751 (index!17186 (_ BitVec 32))) )
))
(declare-fun lt!221707 () SeekEntryResult!3751)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490848 (= res!293930 (or (= lt!221707 (MissingZero!3751 i!1204)) (= lt!221707 (MissingVacant!3751 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31799 (_ BitVec 32)) SeekEntryResult!3751)

(assert (=> b!490848 (= lt!221707 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490849 () Bool)

(declare-fun e!288439 () Bool)

(assert (=> b!490849 (= e!288439 true)))

(declare-fun lt!221709 () array!31799)

(declare-fun lt!221705 () SeekEntryResult!3751)

(declare-fun lt!221708 () (_ BitVec 64))

(assert (=> b!490849 (= lt!221705 (seekEntryOrOpen!0 lt!221708 lt!221709 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14434 0))(
  ( (Unit!14435) )
))
(declare-fun lt!221710 () Unit!14434)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31799 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14434)

(assert (=> b!490849 (= lt!221710 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490850 () Bool)

(declare-fun res!293926 () Bool)

(assert (=> b!490850 (=> (not res!293926) (not e!288438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490850 (= res!293926 (validKeyInArray!0 k0!2280))))

(declare-fun b!490851 () Bool)

(declare-fun res!293925 () Bool)

(assert (=> b!490851 (=> (not res!293925) (not e!288438))))

(assert (=> b!490851 (= res!293925 (validKeyInArray!0 (select (arr!15287 a!3235) j!176)))))

(declare-fun b!490852 () Bool)

(declare-fun res!293931 () Bool)

(assert (=> b!490852 (=> (not res!293931) (not e!288441))))

(declare-datatypes ((List!9484 0))(
  ( (Nil!9481) (Cons!9480 (h!10342 (_ BitVec 64)) (t!15703 List!9484)) )
))
(declare-fun arrayNoDuplicates!0 (array!31799 (_ BitVec 32) List!9484) Bool)

(assert (=> b!490852 (= res!293931 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9481))))

(declare-fun b!490853 () Bool)

(assert (=> b!490853 (= e!288441 (not e!288439))))

(declare-fun res!293929 () Bool)

(assert (=> b!490853 (=> res!293929 e!288439)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31799 (_ BitVec 32)) SeekEntryResult!3751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490853 (= res!293929 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15287 a!3235) j!176) mask!3524) (select (arr!15287 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221708 mask!3524) lt!221708 lt!221709 mask!3524))))))

(assert (=> b!490853 (= lt!221708 (select (store (arr!15287 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490853 (= lt!221709 (array!31800 (store (arr!15287 a!3235) i!1204 k0!2280) (size!15652 a!3235)))))

(assert (=> b!490853 (= lt!221705 (Found!3751 j!176))))

(assert (=> b!490853 (= lt!221705 (seekEntryOrOpen!0 (select (arr!15287 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490853 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221706 () Unit!14434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14434)

(assert (=> b!490853 (= lt!221706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293932 () Bool)

(assert (=> start!44730 (=> (not res!293932) (not e!288438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44730 (= res!293932 (validMask!0 mask!3524))))

(assert (=> start!44730 e!288438))

(assert (=> start!44730 true))

(declare-fun array_inv!11170 (array!31799) Bool)

(assert (=> start!44730 (array_inv!11170 a!3235)))

(declare-fun b!490854 () Bool)

(declare-fun res!293928 () Bool)

(assert (=> b!490854 (=> (not res!293928) (not e!288438))))

(declare-fun arrayContainsKey!0 (array!31799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490854 (= res!293928 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490855 () Bool)

(declare-fun res!293927 () Bool)

(assert (=> b!490855 (=> (not res!293927) (not e!288438))))

(assert (=> b!490855 (= res!293927 (and (= (size!15652 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15652 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15652 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44730 res!293932) b!490855))

(assert (= (and b!490855 res!293927) b!490851))

(assert (= (and b!490851 res!293925) b!490850))

(assert (= (and b!490850 res!293926) b!490854))

(assert (= (and b!490854 res!293928) b!490848))

(assert (= (and b!490848 res!293930) b!490847))

(assert (= (and b!490847 res!293933) b!490852))

(assert (= (and b!490852 res!293931) b!490853))

(assert (= (and b!490853 (not res!293929)) b!490849))

(declare-fun m!470791 () Bool)

(assert (=> b!490849 m!470791))

(declare-fun m!470793 () Bool)

(assert (=> b!490849 m!470793))

(declare-fun m!470795 () Bool)

(assert (=> b!490854 m!470795))

(declare-fun m!470797 () Bool)

(assert (=> b!490850 m!470797))

(declare-fun m!470799 () Bool)

(assert (=> start!44730 m!470799))

(declare-fun m!470801 () Bool)

(assert (=> start!44730 m!470801))

(declare-fun m!470803 () Bool)

(assert (=> b!490848 m!470803))

(declare-fun m!470805 () Bool)

(assert (=> b!490852 m!470805))

(declare-fun m!470807 () Bool)

(assert (=> b!490851 m!470807))

(assert (=> b!490851 m!470807))

(declare-fun m!470809 () Bool)

(assert (=> b!490851 m!470809))

(declare-fun m!470811 () Bool)

(assert (=> b!490853 m!470811))

(declare-fun m!470813 () Bool)

(assert (=> b!490853 m!470813))

(declare-fun m!470815 () Bool)

(assert (=> b!490853 m!470815))

(declare-fun m!470817 () Bool)

(assert (=> b!490853 m!470817))

(declare-fun m!470819 () Bool)

(assert (=> b!490853 m!470819))

(declare-fun m!470821 () Bool)

(assert (=> b!490853 m!470821))

(assert (=> b!490853 m!470807))

(declare-fun m!470823 () Bool)

(assert (=> b!490853 m!470823))

(assert (=> b!490853 m!470807))

(assert (=> b!490853 m!470821))

(assert (=> b!490853 m!470807))

(declare-fun m!470825 () Bool)

(assert (=> b!490853 m!470825))

(assert (=> b!490853 m!470807))

(declare-fun m!470827 () Bool)

(assert (=> b!490853 m!470827))

(assert (=> b!490853 m!470811))

(declare-fun m!470829 () Bool)

(assert (=> b!490847 m!470829))

(check-sat (not b!490854) (not b!490850) (not b!490853) (not b!490849) (not b!490847) (not b!490852) (not b!490851) (not b!490848) (not start!44730))
(check-sat)
