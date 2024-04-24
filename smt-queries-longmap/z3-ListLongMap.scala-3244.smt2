; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45260 () Bool)

(assert start!45260)

(declare-fun b!497217 () Bool)

(declare-fun res!299661 () Bool)

(declare-fun e!291467 () Bool)

(assert (=> b!497217 (=> (not res!299661) (not e!291467))))

(declare-datatypes ((array!32149 0))(
  ( (array!32150 (arr!15457 (Array (_ BitVec 32) (_ BitVec 64))) (size!15821 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32149)

(declare-datatypes ((List!9522 0))(
  ( (Nil!9519) (Cons!9518 (h!10389 (_ BitVec 64)) (t!15742 List!9522)) )
))
(declare-fun arrayNoDuplicates!0 (array!32149 (_ BitVec 32) List!9522) Bool)

(assert (=> b!497217 (= res!299661 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9519))))

(declare-fun b!497218 () Bool)

(declare-fun e!291465 () Bool)

(assert (=> b!497218 (= e!291467 (not e!291465))))

(declare-fun res!299659 () Bool)

(assert (=> b!497218 (=> res!299659 e!291465)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225137 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3880 0))(
  ( (MissingZero!3880 (index!17699 (_ BitVec 32))) (Found!3880 (index!17700 (_ BitVec 32))) (Intermediate!3880 (undefined!4692 Bool) (index!17701 (_ BitVec 32)) (x!46897 (_ BitVec 32))) (Undefined!3880) (MissingVacant!3880 (index!17702 (_ BitVec 32))) )
))
(declare-fun lt!225136 () SeekEntryResult!3880)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32149 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!497218 (= res!299659 (= lt!225136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225137 (select (store (arr!15457 a!3235) i!1204 k0!2280) j!176) (array!32150 (store (arr!15457 a!3235) i!1204 k0!2280) (size!15821 a!3235)) mask!3524)))))

(declare-fun lt!225139 () (_ BitVec 32))

(assert (=> b!497218 (= lt!225136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225139 (select (arr!15457 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497218 (= lt!225137 (toIndex!0 (select (store (arr!15457 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497218 (= lt!225139 (toIndex!0 (select (arr!15457 a!3235) j!176) mask!3524))))

(declare-fun e!291464 () Bool)

(assert (=> b!497218 e!291464))

(declare-fun res!299667 () Bool)

(assert (=> b!497218 (=> (not res!299667) (not e!291464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32149 (_ BitVec 32)) Bool)

(assert (=> b!497218 (= res!299667 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14767 0))(
  ( (Unit!14768) )
))
(declare-fun lt!225138 () Unit!14767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14767)

(assert (=> b!497218 (= lt!225138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497219 () Bool)

(declare-fun res!299668 () Bool)

(declare-fun e!291466 () Bool)

(assert (=> b!497219 (=> (not res!299668) (not e!291466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497219 (= res!299668 (validKeyInArray!0 (select (arr!15457 a!3235) j!176)))))

(declare-fun b!497220 () Bool)

(declare-fun res!299660 () Bool)

(assert (=> b!497220 (=> (not res!299660) (not e!291466))))

(declare-fun arrayContainsKey!0 (array!32149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497220 (= res!299660 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497221 () Bool)

(assert (=> b!497221 (= e!291465 true)))

(assert (=> b!497221 (and (bvslt (x!46897 lt!225136) #b01111111111111111111111111111110) (or (= (select (arr!15457 a!3235) (index!17701 lt!225136)) (select (arr!15457 a!3235) j!176)) (= (select (arr!15457 a!3235) (index!17701 lt!225136)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15457 a!3235) (index!17701 lt!225136)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497222 () Bool)

(declare-fun res!299665 () Bool)

(assert (=> b!497222 (=> (not res!299665) (not e!291466))))

(assert (=> b!497222 (= res!299665 (and (= (size!15821 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15821 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15821 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497223 () Bool)

(declare-fun res!299658 () Bool)

(assert (=> b!497223 (=> res!299658 e!291465)))

(get-info :version)

(assert (=> b!497223 (= res!299658 (or (undefined!4692 lt!225136) (not ((_ is Intermediate!3880) lt!225136))))))

(declare-fun res!299664 () Bool)

(assert (=> start!45260 (=> (not res!299664) (not e!291466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45260 (= res!299664 (validMask!0 mask!3524))))

(assert (=> start!45260 e!291466))

(assert (=> start!45260 true))

(declare-fun array_inv!11316 (array!32149) Bool)

(assert (=> start!45260 (array_inv!11316 a!3235)))

(declare-fun b!497224 () Bool)

(declare-fun res!299662 () Bool)

(assert (=> b!497224 (=> (not res!299662) (not e!291467))))

(assert (=> b!497224 (= res!299662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497225 () Bool)

(assert (=> b!497225 (= e!291466 e!291467)))

(declare-fun res!299663 () Bool)

(assert (=> b!497225 (=> (not res!299663) (not e!291467))))

(declare-fun lt!225135 () SeekEntryResult!3880)

(assert (=> b!497225 (= res!299663 (or (= lt!225135 (MissingZero!3880 i!1204)) (= lt!225135 (MissingVacant!3880 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32149 (_ BitVec 32)) SeekEntryResult!3880)

(assert (=> b!497225 (= lt!225135 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497226 () Bool)

(assert (=> b!497226 (= e!291464 (= (seekEntryOrOpen!0 (select (arr!15457 a!3235) j!176) a!3235 mask!3524) (Found!3880 j!176)))))

(declare-fun b!497227 () Bool)

(declare-fun res!299666 () Bool)

(assert (=> b!497227 (=> (not res!299666) (not e!291466))))

(assert (=> b!497227 (= res!299666 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45260 res!299664) b!497222))

(assert (= (and b!497222 res!299665) b!497219))

(assert (= (and b!497219 res!299668) b!497227))

(assert (= (and b!497227 res!299666) b!497220))

(assert (= (and b!497220 res!299660) b!497225))

(assert (= (and b!497225 res!299663) b!497224))

(assert (= (and b!497224 res!299662) b!497217))

(assert (= (and b!497217 res!299661) b!497218))

(assert (= (and b!497218 res!299667) b!497226))

(assert (= (and b!497218 (not res!299659)) b!497223))

(assert (= (and b!497223 (not res!299658)) b!497221))

(declare-fun m!478825 () Bool)

(assert (=> b!497225 m!478825))

(declare-fun m!478827 () Bool)

(assert (=> b!497226 m!478827))

(assert (=> b!497226 m!478827))

(declare-fun m!478829 () Bool)

(assert (=> b!497226 m!478829))

(declare-fun m!478831 () Bool)

(assert (=> b!497218 m!478831))

(assert (=> b!497218 m!478827))

(declare-fun m!478833 () Bool)

(assert (=> b!497218 m!478833))

(assert (=> b!497218 m!478827))

(declare-fun m!478835 () Bool)

(assert (=> b!497218 m!478835))

(declare-fun m!478837 () Bool)

(assert (=> b!497218 m!478837))

(declare-fun m!478839 () Bool)

(assert (=> b!497218 m!478839))

(assert (=> b!497218 m!478837))

(declare-fun m!478841 () Bool)

(assert (=> b!497218 m!478841))

(declare-fun m!478843 () Bool)

(assert (=> b!497218 m!478843))

(assert (=> b!497218 m!478827))

(declare-fun m!478845 () Bool)

(assert (=> b!497218 m!478845))

(assert (=> b!497218 m!478837))

(declare-fun m!478847 () Bool)

(assert (=> b!497220 m!478847))

(declare-fun m!478849 () Bool)

(assert (=> start!45260 m!478849))

(declare-fun m!478851 () Bool)

(assert (=> start!45260 m!478851))

(declare-fun m!478853 () Bool)

(assert (=> b!497227 m!478853))

(declare-fun m!478855 () Bool)

(assert (=> b!497224 m!478855))

(assert (=> b!497219 m!478827))

(assert (=> b!497219 m!478827))

(declare-fun m!478857 () Bool)

(assert (=> b!497219 m!478857))

(declare-fun m!478859 () Bool)

(assert (=> b!497221 m!478859))

(assert (=> b!497221 m!478827))

(declare-fun m!478861 () Bool)

(assert (=> b!497217 m!478861))

(check-sat (not b!497219) (not start!45260) (not b!497224) (not b!497225) (not b!497227) (not b!497217) (not b!497226) (not b!497220) (not b!497218))
(check-sat)
