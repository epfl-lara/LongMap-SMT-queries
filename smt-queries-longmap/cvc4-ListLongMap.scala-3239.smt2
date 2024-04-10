; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45244 () Bool)

(assert start!45244)

(declare-fun res!299237 () Bool)

(declare-fun e!291309 () Bool)

(assert (=> start!45244 (=> (not res!299237) (not e!291309))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45244 (= res!299237 (validMask!0 mask!3524))))

(assert (=> start!45244 e!291309))

(assert (=> start!45244 true))

(declare-datatypes ((array!32132 0))(
  ( (array!32133 (arr!15449 (Array (_ BitVec 32) (_ BitVec 64))) (size!15813 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32132)

(declare-fun array_inv!11245 (array!32132) Bool)

(assert (=> start!45244 (array_inv!11245 a!3235)))

(declare-fun b!496849 () Bool)

(declare-fun e!291312 () Bool)

(assert (=> b!496849 (= e!291312 true)))

(declare-datatypes ((SeekEntryResult!3916 0))(
  ( (MissingZero!3916 (index!17843 (_ BitVec 32))) (Found!3916 (index!17844 (_ BitVec 32))) (Intermediate!3916 (undefined!4728 Bool) (index!17845 (_ BitVec 32)) (x!46896 (_ BitVec 32))) (Undefined!3916) (MissingVacant!3916 (index!17846 (_ BitVec 32))) )
))
(declare-fun lt!224930 () SeekEntryResult!3916)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496849 (and (bvslt (x!46896 lt!224930) #b01111111111111111111111111111110) (or (= (select (arr!15449 a!3235) (index!17845 lt!224930)) (select (arr!15449 a!3235) j!176)) (= (select (arr!15449 a!3235) (index!17845 lt!224930)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15449 a!3235) (index!17845 lt!224930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496850 () Bool)

(declare-fun e!291311 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32132 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!496850 (= e!291311 (= (seekEntryOrOpen!0 (select (arr!15449 a!3235) j!176) a!3235 mask!3524) (Found!3916 j!176)))))

(declare-fun b!496851 () Bool)

(declare-fun e!291310 () Bool)

(assert (=> b!496851 (= e!291309 e!291310)))

(declare-fun res!299244 () Bool)

(assert (=> b!496851 (=> (not res!299244) (not e!291310))))

(declare-fun lt!224931 () SeekEntryResult!3916)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496851 (= res!299244 (or (= lt!224931 (MissingZero!3916 i!1204)) (= lt!224931 (MissingVacant!3916 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!496851 (= lt!224931 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496852 () Bool)

(declare-fun res!299240 () Bool)

(assert (=> b!496852 (=> (not res!299240) (not e!291309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496852 (= res!299240 (validKeyInArray!0 k!2280))))

(declare-fun b!496853 () Bool)

(declare-fun res!299238 () Bool)

(assert (=> b!496853 (=> (not res!299238) (not e!291309))))

(assert (=> b!496853 (= res!299238 (and (= (size!15813 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15813 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15813 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496854 () Bool)

(declare-fun res!299245 () Bool)

(assert (=> b!496854 (=> (not res!299245) (not e!291309))))

(assert (=> b!496854 (= res!299245 (validKeyInArray!0 (select (arr!15449 a!3235) j!176)))))

(declare-fun b!496855 () Bool)

(declare-fun res!299243 () Bool)

(assert (=> b!496855 (=> (not res!299243) (not e!291309))))

(declare-fun arrayContainsKey!0 (array!32132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496855 (= res!299243 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496856 () Bool)

(assert (=> b!496856 (= e!291310 (not e!291312))))

(declare-fun res!299246 () Bool)

(assert (=> b!496856 (=> res!299246 e!291312)))

(declare-fun lt!224929 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32132 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!496856 (= res!299246 (= lt!224930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224929 (select (store (arr!15449 a!3235) i!1204 k!2280) j!176) (array!32133 (store (arr!15449 a!3235) i!1204 k!2280) (size!15813 a!3235)) mask!3524)))))

(declare-fun lt!224928 () (_ BitVec 32))

(assert (=> b!496856 (= lt!224930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224928 (select (arr!15449 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496856 (= lt!224929 (toIndex!0 (select (store (arr!15449 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496856 (= lt!224928 (toIndex!0 (select (arr!15449 a!3235) j!176) mask!3524))))

(assert (=> b!496856 e!291311))

(declare-fun res!299239 () Bool)

(assert (=> b!496856 (=> (not res!299239) (not e!291311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32132 (_ BitVec 32)) Bool)

(assert (=> b!496856 (= res!299239 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14778 0))(
  ( (Unit!14779) )
))
(declare-fun lt!224932 () Unit!14778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14778)

(assert (=> b!496856 (= lt!224932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496857 () Bool)

(declare-fun res!299241 () Bool)

(assert (=> b!496857 (=> (not res!299241) (not e!291310))))

(declare-datatypes ((List!9607 0))(
  ( (Nil!9604) (Cons!9603 (h!10474 (_ BitVec 64)) (t!15835 List!9607)) )
))
(declare-fun arrayNoDuplicates!0 (array!32132 (_ BitVec 32) List!9607) Bool)

(assert (=> b!496857 (= res!299241 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9604))))

(declare-fun b!496858 () Bool)

(declare-fun res!299242 () Bool)

(assert (=> b!496858 (=> (not res!299242) (not e!291310))))

(assert (=> b!496858 (= res!299242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496859 () Bool)

(declare-fun res!299236 () Bool)

(assert (=> b!496859 (=> res!299236 e!291312)))

(assert (=> b!496859 (= res!299236 (or (undefined!4728 lt!224930) (not (is-Intermediate!3916 lt!224930))))))

(assert (= (and start!45244 res!299237) b!496853))

(assert (= (and b!496853 res!299238) b!496854))

(assert (= (and b!496854 res!299245) b!496852))

(assert (= (and b!496852 res!299240) b!496855))

(assert (= (and b!496855 res!299243) b!496851))

(assert (= (and b!496851 res!299244) b!496858))

(assert (= (and b!496858 res!299242) b!496857))

(assert (= (and b!496857 res!299241) b!496856))

(assert (= (and b!496856 res!299239) b!496850))

(assert (= (and b!496856 (not res!299246)) b!496859))

(assert (= (and b!496859 (not res!299236)) b!496849))

(declare-fun m!478147 () Bool)

(assert (=> b!496858 m!478147))

(declare-fun m!478149 () Bool)

(assert (=> b!496852 m!478149))

(declare-fun m!478151 () Bool)

(assert (=> b!496851 m!478151))

(declare-fun m!478153 () Bool)

(assert (=> start!45244 m!478153))

(declare-fun m!478155 () Bool)

(assert (=> start!45244 m!478155))

(declare-fun m!478157 () Bool)

(assert (=> b!496850 m!478157))

(assert (=> b!496850 m!478157))

(declare-fun m!478159 () Bool)

(assert (=> b!496850 m!478159))

(declare-fun m!478161 () Bool)

(assert (=> b!496855 m!478161))

(declare-fun m!478163 () Bool)

(assert (=> b!496856 m!478163))

(declare-fun m!478165 () Bool)

(assert (=> b!496856 m!478165))

(declare-fun m!478167 () Bool)

(assert (=> b!496856 m!478167))

(assert (=> b!496856 m!478157))

(declare-fun m!478169 () Bool)

(assert (=> b!496856 m!478169))

(assert (=> b!496856 m!478157))

(declare-fun m!478171 () Bool)

(assert (=> b!496856 m!478171))

(assert (=> b!496856 m!478167))

(declare-fun m!478173 () Bool)

(assert (=> b!496856 m!478173))

(assert (=> b!496856 m!478167))

(declare-fun m!478175 () Bool)

(assert (=> b!496856 m!478175))

(assert (=> b!496856 m!478157))

(declare-fun m!478177 () Bool)

(assert (=> b!496856 m!478177))

(declare-fun m!478179 () Bool)

(assert (=> b!496849 m!478179))

(assert (=> b!496849 m!478157))

(assert (=> b!496854 m!478157))

(assert (=> b!496854 m!478157))

(declare-fun m!478181 () Bool)

(assert (=> b!496854 m!478181))

(declare-fun m!478183 () Bool)

(assert (=> b!496857 m!478183))

(push 1)

(assert (not b!496854))

(assert (not b!496856))

(assert (not b!496857))

(assert (not start!45244))

(assert (not b!496851))

(assert (not b!496850))

(assert (not b!496852))

(assert (not b!496858))

(assert (not b!496855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

