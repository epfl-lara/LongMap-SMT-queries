; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47424 () Bool)

(assert start!47424)

(declare-fun b!521853 () Bool)

(declare-fun e!304389 () Bool)

(declare-fun e!304383 () Bool)

(assert (=> b!521853 (= e!304389 e!304383)))

(declare-fun res!319696 () Bool)

(assert (=> b!521853 (=> (not res!319696) (not e!304383))))

(declare-datatypes ((SeekEntryResult!4450 0))(
  ( (MissingZero!4450 (index!20003 (_ BitVec 32))) (Found!4450 (index!20004 (_ BitVec 32))) (Intermediate!4450 (undefined!5262 Bool) (index!20005 (_ BitVec 32)) (x!48991 (_ BitVec 32))) (Undefined!4450) (MissingVacant!4450 (index!20006 (_ BitVec 32))) )
))
(declare-fun lt!239172 () SeekEntryResult!4450)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521853 (= res!319696 (or (= lt!239172 (MissingZero!4450 i!1204)) (= lt!239172 (MissingVacant!4450 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33260 0))(
  ( (array!33261 (arr!15986 (Array (_ BitVec 32) (_ BitVec 64))) (size!16351 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33260)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33260 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!521853 (= lt!239172 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521854 () Bool)

(declare-fun res!319698 () Bool)

(assert (=> b!521854 (=> (not res!319698) (not e!304383))))

(declare-datatypes ((List!10183 0))(
  ( (Nil!10180) (Cons!10179 (h!11101 (_ BitVec 64)) (t!16402 List!10183)) )
))
(declare-fun arrayNoDuplicates!0 (array!33260 (_ BitVec 32) List!10183) Bool)

(assert (=> b!521854 (= res!319698 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10180))))

(declare-fun b!521855 () Bool)

(declare-fun res!319697 () Bool)

(assert (=> b!521855 (=> (not res!319697) (not e!304389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521855 (= res!319697 (validKeyInArray!0 k0!2280))))

(declare-fun b!521856 () Bool)

(declare-datatypes ((Unit!16246 0))(
  ( (Unit!16247) )
))
(declare-fun e!304387 () Unit!16246)

(declare-fun Unit!16248 () Unit!16246)

(assert (=> b!521856 (= e!304387 Unit!16248)))

(declare-fun b!521857 () Bool)

(declare-fun res!319704 () Bool)

(declare-fun e!304384 () Bool)

(assert (=> b!521857 (=> res!319704 e!304384)))

(declare-fun lt!239171 () SeekEntryResult!4450)

(get-info :version)

(assert (=> b!521857 (= res!319704 (or (undefined!5262 lt!239171) (not ((_ is Intermediate!4450) lt!239171))))))

(declare-fun b!521859 () Bool)

(declare-fun res!319701 () Bool)

(assert (=> b!521859 (=> (not res!319701) (not e!304389))))

(declare-fun arrayContainsKey!0 (array!33260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521859 (= res!319701 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521860 () Bool)

(assert (=> b!521860 (= e!304383 (not e!304384))))

(declare-fun res!319702 () Bool)

(assert (=> b!521860 (=> res!319702 e!304384)))

(declare-fun lt!239169 () array!33260)

(declare-fun lt!239168 () (_ BitVec 64))

(declare-fun lt!239166 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33260 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!521860 (= res!319702 (= lt!239171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239166 lt!239168 lt!239169 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239170 () (_ BitVec 32))

(assert (=> b!521860 (= lt!239171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239170 (select (arr!15986 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521860 (= lt!239166 (toIndex!0 lt!239168 mask!3524))))

(assert (=> b!521860 (= lt!239168 (select (store (arr!15986 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521860 (= lt!239170 (toIndex!0 (select (arr!15986 a!3235) j!176) mask!3524))))

(assert (=> b!521860 (= lt!239169 (array!33261 (store (arr!15986 a!3235) i!1204 k0!2280) (size!16351 a!3235)))))

(declare-fun e!304385 () Bool)

(assert (=> b!521860 e!304385))

(declare-fun res!319695 () Bool)

(assert (=> b!521860 (=> (not res!319695) (not e!304385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33260 (_ BitVec 32)) Bool)

(assert (=> b!521860 (= res!319695 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239167 () Unit!16246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16246)

(assert (=> b!521860 (= lt!239167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521861 () Bool)

(assert (=> b!521861 (= e!304385 (= (seekEntryOrOpen!0 (select (arr!15986 a!3235) j!176) a!3235 mask!3524) (Found!4450 j!176)))))

(declare-fun b!521862 () Bool)

(assert (=> b!521862 (= e!304384 true)))

(assert (=> b!521862 (and (or (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239165 () Unit!16246)

(assert (=> b!521862 (= lt!239165 e!304387)))

(declare-fun c!61380 () Bool)

(assert (=> b!521862 (= c!61380 (= (select (arr!15986 a!3235) (index!20005 lt!239171)) (select (arr!15986 a!3235) j!176)))))

(assert (=> b!521862 (and (bvslt (x!48991 lt!239171) #b01111111111111111111111111111110) (or (= (select (arr!15986 a!3235) (index!20005 lt!239171)) (select (arr!15986 a!3235) j!176)) (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15986 a!3235) (index!20005 lt!239171)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521863 () Bool)

(declare-fun e!304386 () Bool)

(assert (=> b!521863 (= e!304386 false)))

(declare-fun b!521864 () Bool)

(declare-fun res!319700 () Bool)

(assert (=> b!521864 (=> (not res!319700) (not e!304389))))

(assert (=> b!521864 (= res!319700 (validKeyInArray!0 (select (arr!15986 a!3235) j!176)))))

(declare-fun b!521865 () Bool)

(declare-fun Unit!16249 () Unit!16246)

(assert (=> b!521865 (= e!304387 Unit!16249)))

(declare-fun lt!239173 () Unit!16246)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16246)

(assert (=> b!521865 (= lt!239173 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239170 #b00000000000000000000000000000000 (index!20005 lt!239171) (x!48991 lt!239171) mask!3524))))

(declare-fun res!319705 () Bool)

(assert (=> b!521865 (= res!319705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239170 lt!239168 lt!239169 mask!3524) (Intermediate!4450 false (index!20005 lt!239171) (x!48991 lt!239171))))))

(assert (=> b!521865 (=> (not res!319705) (not e!304386))))

(assert (=> b!521865 e!304386))

(declare-fun b!521866 () Bool)

(declare-fun res!319699 () Bool)

(assert (=> b!521866 (=> (not res!319699) (not e!304389))))

(assert (=> b!521866 (= res!319699 (and (= (size!16351 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16351 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16351 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521858 () Bool)

(declare-fun res!319703 () Bool)

(assert (=> b!521858 (=> (not res!319703) (not e!304383))))

(assert (=> b!521858 (= res!319703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!319706 () Bool)

(assert (=> start!47424 (=> (not res!319706) (not e!304389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47424 (= res!319706 (validMask!0 mask!3524))))

(assert (=> start!47424 e!304389))

(assert (=> start!47424 true))

(declare-fun array_inv!11869 (array!33260) Bool)

(assert (=> start!47424 (array_inv!11869 a!3235)))

(assert (= (and start!47424 res!319706) b!521866))

(assert (= (and b!521866 res!319699) b!521864))

(assert (= (and b!521864 res!319700) b!521855))

(assert (= (and b!521855 res!319697) b!521859))

(assert (= (and b!521859 res!319701) b!521853))

(assert (= (and b!521853 res!319696) b!521858))

(assert (= (and b!521858 res!319703) b!521854))

(assert (= (and b!521854 res!319698) b!521860))

(assert (= (and b!521860 res!319695) b!521861))

(assert (= (and b!521860 (not res!319702)) b!521857))

(assert (= (and b!521857 (not res!319704)) b!521862))

(assert (= (and b!521862 c!61380) b!521865))

(assert (= (and b!521862 (not c!61380)) b!521856))

(assert (= (and b!521865 res!319705) b!521863))

(declare-fun m!502285 () Bool)

(assert (=> b!521860 m!502285))

(declare-fun m!502287 () Bool)

(assert (=> b!521860 m!502287))

(declare-fun m!502289 () Bool)

(assert (=> b!521860 m!502289))

(declare-fun m!502291 () Bool)

(assert (=> b!521860 m!502291))

(declare-fun m!502293 () Bool)

(assert (=> b!521860 m!502293))

(declare-fun m!502295 () Bool)

(assert (=> b!521860 m!502295))

(assert (=> b!521860 m!502293))

(declare-fun m!502297 () Bool)

(assert (=> b!521860 m!502297))

(assert (=> b!521860 m!502293))

(declare-fun m!502299 () Bool)

(assert (=> b!521860 m!502299))

(declare-fun m!502301 () Bool)

(assert (=> b!521860 m!502301))

(declare-fun m!502303 () Bool)

(assert (=> start!47424 m!502303))

(declare-fun m!502305 () Bool)

(assert (=> start!47424 m!502305))

(declare-fun m!502307 () Bool)

(assert (=> b!521855 m!502307))

(declare-fun m!502309 () Bool)

(assert (=> b!521862 m!502309))

(assert (=> b!521862 m!502293))

(declare-fun m!502311 () Bool)

(assert (=> b!521858 m!502311))

(assert (=> b!521864 m!502293))

(assert (=> b!521864 m!502293))

(declare-fun m!502313 () Bool)

(assert (=> b!521864 m!502313))

(declare-fun m!502315 () Bool)

(assert (=> b!521859 m!502315))

(assert (=> b!521861 m!502293))

(assert (=> b!521861 m!502293))

(declare-fun m!502317 () Bool)

(assert (=> b!521861 m!502317))

(declare-fun m!502319 () Bool)

(assert (=> b!521853 m!502319))

(declare-fun m!502321 () Bool)

(assert (=> b!521854 m!502321))

(declare-fun m!502323 () Bool)

(assert (=> b!521865 m!502323))

(declare-fun m!502325 () Bool)

(assert (=> b!521865 m!502325))

(check-sat (not b!521854) (not b!521861) (not b!521865) (not start!47424) (not b!521853) (not b!521859) (not b!521864) (not b!521860) (not b!521858) (not b!521855))
(check-sat)
