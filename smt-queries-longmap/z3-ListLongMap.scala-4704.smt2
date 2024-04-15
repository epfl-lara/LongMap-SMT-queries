; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65264 () Bool)

(assert start!65264)

(declare-fun b!740785 () Bool)

(declare-fun e!414106 () Bool)

(declare-fun e!414107 () Bool)

(assert (=> b!740785 (= e!414106 e!414107)))

(declare-fun res!498282 () Bool)

(assert (=> b!740785 (=> (not res!498282) (not e!414107))))

(declare-datatypes ((array!41454 0))(
  ( (array!41455 (arr!19841 (Array (_ BitVec 32) (_ BitVec 64))) (size!20262 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41454)

(declare-datatypes ((SeekEntryResult!7438 0))(
  ( (MissingZero!7438 (index!32120 (_ BitVec 32))) (Found!7438 (index!32121 (_ BitVec 32))) (Intermediate!7438 (undefined!8250 Bool) (index!32122 (_ BitVec 32)) (x!63111 (_ BitVec 32))) (Undefined!7438) (MissingVacant!7438 (index!32123 (_ BitVec 32))) )
))
(declare-fun lt!329009 () SeekEntryResult!7438)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41454 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!740785 (= res!498282 (= (seekEntryOrOpen!0 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329009))))

(assert (=> b!740785 (= lt!329009 (Found!7438 j!159))))

(declare-fun b!740786 () Bool)

(declare-fun res!498293 () Bool)

(declare-fun e!414103 () Bool)

(assert (=> b!740786 (=> (not res!498293) (not e!414103))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740786 (= res!498293 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!414104 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!740787 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41454 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!740787 (= e!414104 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) (Found!7438 j!159)))))

(declare-fun b!740788 () Bool)

(declare-fun res!498292 () Bool)

(declare-fun e!414108 () Bool)

(assert (=> b!740788 (=> (not res!498292) (not e!414108))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740788 (= res!498292 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19841 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740789 () Bool)

(declare-fun e!414102 () Bool)

(assert (=> b!740789 (= e!414102 e!414108)))

(declare-fun res!498294 () Bool)

(assert (=> b!740789 (=> (not res!498294) (not e!414108))))

(declare-fun lt!329007 () SeekEntryResult!7438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41454 (_ BitVec 32)) SeekEntryResult!7438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740789 (= res!498294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19841 a!3186) j!159) mask!3328) (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329007))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740789 (= lt!329007 (Intermediate!7438 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740790 () Bool)

(assert (=> b!740790 (= e!414104 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329007))))

(declare-fun b!740791 () Bool)

(declare-fun res!498290 () Bool)

(assert (=> b!740791 (=> (not res!498290) (not e!414103))))

(assert (=> b!740791 (= res!498290 (validKeyInArray!0 (select (arr!19841 a!3186) j!159)))))

(declare-fun b!740792 () Bool)

(declare-fun e!414105 () Bool)

(assert (=> b!740792 (= e!414108 e!414105)))

(declare-fun res!498285 () Bool)

(assert (=> b!740792 (=> (not res!498285) (not e!414105))))

(declare-fun lt!329005 () array!41454)

(declare-fun lt!329008 () (_ BitVec 64))

(assert (=> b!740792 (= res!498285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329008 mask!3328) lt!329008 lt!329005 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329008 lt!329005 mask!3328)))))

(assert (=> b!740792 (= lt!329008 (select (store (arr!19841 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740792 (= lt!329005 (array!41455 (store (arr!19841 a!3186) i!1173 k0!2102) (size!20262 a!3186)))))

(declare-fun b!740793 () Bool)

(assert (=> b!740793 (= e!414105 (not true))))

(assert (=> b!740793 e!414106))

(declare-fun res!498281 () Bool)

(assert (=> b!740793 (=> (not res!498281) (not e!414106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41454 (_ BitVec 32)) Bool)

(assert (=> b!740793 (= res!498281 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25328 0))(
  ( (Unit!25329) )
))
(declare-fun lt!329006 () Unit!25328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25328)

(assert (=> b!740793 (= lt!329006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740794 () Bool)

(declare-fun res!498288 () Bool)

(assert (=> b!740794 (=> (not res!498288) (not e!414102))))

(declare-datatypes ((List!13882 0))(
  ( (Nil!13879) (Cons!13878 (h!14950 (_ BitVec 64)) (t!20188 List!13882)) )
))
(declare-fun arrayNoDuplicates!0 (array!41454 (_ BitVec 32) List!13882) Bool)

(assert (=> b!740794 (= res!498288 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13879))))

(declare-fun b!740795 () Bool)

(declare-fun res!498287 () Bool)

(assert (=> b!740795 (=> (not res!498287) (not e!414103))))

(declare-fun arrayContainsKey!0 (array!41454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740795 (= res!498287 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!498289 () Bool)

(assert (=> start!65264 (=> (not res!498289) (not e!414103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65264 (= res!498289 (validMask!0 mask!3328))))

(assert (=> start!65264 e!414103))

(assert (=> start!65264 true))

(declare-fun array_inv!15724 (array!41454) Bool)

(assert (=> start!65264 (array_inv!15724 a!3186)))

(declare-fun b!740796 () Bool)

(declare-fun res!498286 () Bool)

(assert (=> b!740796 (=> (not res!498286) (not e!414108))))

(assert (=> b!740796 (= res!498286 e!414104)))

(declare-fun c!81633 () Bool)

(assert (=> b!740796 (= c!81633 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740797 () Bool)

(declare-fun res!498291 () Bool)

(assert (=> b!740797 (=> (not res!498291) (not e!414103))))

(assert (=> b!740797 (= res!498291 (and (= (size!20262 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20262 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20262 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740798 () Bool)

(assert (=> b!740798 (= e!414103 e!414102)))

(declare-fun res!498280 () Bool)

(assert (=> b!740798 (=> (not res!498280) (not e!414102))))

(declare-fun lt!329004 () SeekEntryResult!7438)

(assert (=> b!740798 (= res!498280 (or (= lt!329004 (MissingZero!7438 i!1173)) (= lt!329004 (MissingVacant!7438 i!1173))))))

(assert (=> b!740798 (= lt!329004 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740799 () Bool)

(declare-fun res!498284 () Bool)

(assert (=> b!740799 (=> (not res!498284) (not e!414102))))

(assert (=> b!740799 (= res!498284 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20262 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20262 a!3186))))))

(declare-fun b!740800 () Bool)

(declare-fun res!498283 () Bool)

(assert (=> b!740800 (=> (not res!498283) (not e!414102))))

(assert (=> b!740800 (= res!498283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740801 () Bool)

(assert (=> b!740801 (= e!414107 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19841 a!3186) j!159) a!3186 mask!3328) lt!329009))))

(assert (= (and start!65264 res!498289) b!740797))

(assert (= (and b!740797 res!498291) b!740791))

(assert (= (and b!740791 res!498290) b!740786))

(assert (= (and b!740786 res!498293) b!740795))

(assert (= (and b!740795 res!498287) b!740798))

(assert (= (and b!740798 res!498280) b!740800))

(assert (= (and b!740800 res!498283) b!740794))

(assert (= (and b!740794 res!498288) b!740799))

(assert (= (and b!740799 res!498284) b!740789))

(assert (= (and b!740789 res!498294) b!740788))

(assert (= (and b!740788 res!498292) b!740796))

(assert (= (and b!740796 c!81633) b!740790))

(assert (= (and b!740796 (not c!81633)) b!740787))

(assert (= (and b!740796 res!498286) b!740792))

(assert (= (and b!740792 res!498285) b!740793))

(assert (= (and b!740793 res!498281) b!740785))

(assert (= (and b!740785 res!498282) b!740801))

(declare-fun m!691289 () Bool)

(assert (=> b!740790 m!691289))

(assert (=> b!740790 m!691289))

(declare-fun m!691291 () Bool)

(assert (=> b!740790 m!691291))

(assert (=> b!740787 m!691289))

(assert (=> b!740787 m!691289))

(declare-fun m!691293 () Bool)

(assert (=> b!740787 m!691293))

(declare-fun m!691295 () Bool)

(assert (=> b!740794 m!691295))

(declare-fun m!691297 () Bool)

(assert (=> b!740798 m!691297))

(declare-fun m!691299 () Bool)

(assert (=> b!740795 m!691299))

(declare-fun m!691301 () Bool)

(assert (=> b!740800 m!691301))

(assert (=> b!740785 m!691289))

(assert (=> b!740785 m!691289))

(declare-fun m!691303 () Bool)

(assert (=> b!740785 m!691303))

(declare-fun m!691305 () Bool)

(assert (=> b!740788 m!691305))

(assert (=> b!740801 m!691289))

(assert (=> b!740801 m!691289))

(declare-fun m!691307 () Bool)

(assert (=> b!740801 m!691307))

(declare-fun m!691309 () Bool)

(assert (=> b!740786 m!691309))

(assert (=> b!740789 m!691289))

(assert (=> b!740789 m!691289))

(declare-fun m!691311 () Bool)

(assert (=> b!740789 m!691311))

(assert (=> b!740789 m!691311))

(assert (=> b!740789 m!691289))

(declare-fun m!691313 () Bool)

(assert (=> b!740789 m!691313))

(declare-fun m!691315 () Bool)

(assert (=> b!740792 m!691315))

(declare-fun m!691317 () Bool)

(assert (=> b!740792 m!691317))

(assert (=> b!740792 m!691315))

(declare-fun m!691319 () Bool)

(assert (=> b!740792 m!691319))

(declare-fun m!691321 () Bool)

(assert (=> b!740792 m!691321))

(declare-fun m!691323 () Bool)

(assert (=> b!740792 m!691323))

(assert (=> b!740791 m!691289))

(assert (=> b!740791 m!691289))

(declare-fun m!691325 () Bool)

(assert (=> b!740791 m!691325))

(declare-fun m!691327 () Bool)

(assert (=> b!740793 m!691327))

(declare-fun m!691329 () Bool)

(assert (=> b!740793 m!691329))

(declare-fun m!691331 () Bool)

(assert (=> start!65264 m!691331))

(declare-fun m!691333 () Bool)

(assert (=> start!65264 m!691333))

(check-sat (not start!65264) (not b!740787) (not b!740791) (not b!740800) (not b!740789) (not b!740790) (not b!740785) (not b!740786) (not b!740798) (not b!740801) (not b!740792) (not b!740793) (not b!740795) (not b!740794))
(check-sat)
