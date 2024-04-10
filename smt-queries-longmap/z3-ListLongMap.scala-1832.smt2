; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33204 () Bool)

(assert start!33204)

(declare-fun res!181849 () Bool)

(declare-fun e!202681 () Bool)

(assert (=> start!33204 (=> (not res!181849) (not e!202681))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33204 (= res!181849 (validMask!0 mask!3777))))

(assert (=> start!33204 e!202681))

(declare-datatypes ((array!16863 0))(
  ( (array!16864 (arr!7974 (Array (_ BitVec 32) (_ BitVec 64))) (size!8326 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16863)

(declare-fun array_inv!5937 (array!16863) Bool)

(assert (=> start!33204 (array_inv!5937 a!3305)))

(assert (=> start!33204 true))

(declare-fun b!330026 () Bool)

(declare-fun res!181851 () Bool)

(assert (=> b!330026 (=> (not res!181851) (not e!202681))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330026 (= res!181851 (and (= (size!8326 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8326 a!3305))))))

(declare-fun b!330027 () Bool)

(declare-fun res!181850 () Bool)

(declare-fun e!202679 () Bool)

(assert (=> b!330027 (=> (not res!181850) (not e!202679))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3105 0))(
  ( (MissingZero!3105 (index!14596 (_ BitVec 32))) (Found!3105 (index!14597 (_ BitVec 32))) (Intermediate!3105 (undefined!3917 Bool) (index!14598 (_ BitVec 32)) (x!32880 (_ BitVec 32))) (Undefined!3105) (MissingVacant!3105 (index!14599 (_ BitVec 32))) )
))
(declare-fun lt!158435 () SeekEntryResult!3105)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16863 (_ BitVec 32)) SeekEntryResult!3105)

(assert (=> b!330027 (= res!181850 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158435))))

(declare-fun b!330028 () Bool)

(declare-datatypes ((Unit!10225 0))(
  ( (Unit!10226) )
))
(declare-fun e!202676 () Unit!10225)

(declare-fun Unit!10227 () Unit!10225)

(assert (=> b!330028 (= e!202676 Unit!10227)))

(assert (=> b!330028 false))

(declare-fun b!330029 () Bool)

(declare-fun res!181845 () Bool)

(assert (=> b!330029 (=> (not res!181845) (not e!202681))))

(declare-fun arrayContainsKey!0 (array!16863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330029 (= res!181845 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330030 () Bool)

(assert (=> b!330030 (= e!202681 e!202679)))

(declare-fun res!181852 () Bool)

(assert (=> b!330030 (=> (not res!181852) (not e!202679))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330030 (= res!181852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158435))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330030 (= lt!158435 (Intermediate!3105 false resIndex!58 resX!58))))

(declare-fun b!330031 () Bool)

(declare-fun res!181848 () Bool)

(assert (=> b!330031 (=> (not res!181848) (not e!202681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330031 (= res!181848 (validKeyInArray!0 k0!2497))))

(declare-fun b!330032 () Bool)

(declare-fun res!181853 () Bool)

(assert (=> b!330032 (=> (not res!181853) (not e!202681))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16863 (_ BitVec 32)) SeekEntryResult!3105)

(assert (=> b!330032 (= res!181853 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3105 i!1250)))))

(declare-fun b!330033 () Bool)

(declare-fun res!181846 () Bool)

(assert (=> b!330033 (=> (not res!181846) (not e!202679))))

(assert (=> b!330033 (= res!181846 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7974 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330034 () Bool)

(declare-fun res!181854 () Bool)

(assert (=> b!330034 (=> (not res!181854) (not e!202681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16863 (_ BitVec 32)) Bool)

(assert (=> b!330034 (= res!181854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330035 () Bool)

(assert (=> b!330035 false))

(declare-fun e!202677 () Unit!10225)

(declare-fun Unit!10228 () Unit!10225)

(assert (=> b!330035 (= e!202677 Unit!10228)))

(declare-fun b!330036 () Bool)

(declare-fun e!202678 () Unit!10225)

(assert (=> b!330036 (= e!202678 e!202677)))

(declare-fun c!51734 () Bool)

(assert (=> b!330036 (= c!51734 (or (= (select (arr!7974 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7974 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330037 () Bool)

(declare-fun Unit!10229 () Unit!10225)

(assert (=> b!330037 (= e!202678 Unit!10229)))

(declare-fun b!330038 () Bool)

(assert (=> b!330038 (= e!202679 (not (= index!1840 resIndex!58)))))

(declare-fun lt!158436 () Unit!10225)

(assert (=> b!330038 (= lt!158436 e!202678)))

(declare-fun c!51733 () Bool)

(assert (=> b!330038 (= c!51733 (not (= resIndex!58 index!1840)))))

(declare-fun b!330039 () Bool)

(declare-fun res!181847 () Bool)

(assert (=> b!330039 (=> (not res!181847) (not e!202679))))

(assert (=> b!330039 (= res!181847 (and (= (select (arr!7974 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8326 a!3305))))))

(declare-fun b!330040 () Bool)

(assert (=> b!330040 false))

(declare-fun lt!158434 () Unit!10225)

(assert (=> b!330040 (= lt!158434 e!202676)))

(declare-fun c!51735 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330040 (= c!51735 ((_ is Intermediate!3105) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10230 () Unit!10225)

(assert (=> b!330040 (= e!202677 Unit!10230)))

(declare-fun b!330041 () Bool)

(declare-fun Unit!10231 () Unit!10225)

(assert (=> b!330041 (= e!202676 Unit!10231)))

(assert (= (and start!33204 res!181849) b!330026))

(assert (= (and b!330026 res!181851) b!330031))

(assert (= (and b!330031 res!181848) b!330029))

(assert (= (and b!330029 res!181845) b!330032))

(assert (= (and b!330032 res!181853) b!330034))

(assert (= (and b!330034 res!181854) b!330030))

(assert (= (and b!330030 res!181852) b!330039))

(assert (= (and b!330039 res!181847) b!330027))

(assert (= (and b!330027 res!181850) b!330033))

(assert (= (and b!330033 res!181846) b!330038))

(assert (= (and b!330038 c!51733) b!330036))

(assert (= (and b!330038 (not c!51733)) b!330037))

(assert (= (and b!330036 c!51734) b!330035))

(assert (= (and b!330036 (not c!51734)) b!330040))

(assert (= (and b!330040 c!51735) b!330041))

(assert (= (and b!330040 (not c!51735)) b!330028))

(declare-fun m!335449 () Bool)

(assert (=> b!330040 m!335449))

(assert (=> b!330040 m!335449))

(declare-fun m!335451 () Bool)

(assert (=> b!330040 m!335451))

(declare-fun m!335453 () Bool)

(assert (=> b!330031 m!335453))

(declare-fun m!335455 () Bool)

(assert (=> b!330027 m!335455))

(declare-fun m!335457 () Bool)

(assert (=> b!330032 m!335457))

(declare-fun m!335459 () Bool)

(assert (=> b!330034 m!335459))

(declare-fun m!335461 () Bool)

(assert (=> b!330030 m!335461))

(assert (=> b!330030 m!335461))

(declare-fun m!335463 () Bool)

(assert (=> b!330030 m!335463))

(declare-fun m!335465 () Bool)

(assert (=> b!330039 m!335465))

(declare-fun m!335467 () Bool)

(assert (=> b!330033 m!335467))

(declare-fun m!335469 () Bool)

(assert (=> start!33204 m!335469))

(declare-fun m!335471 () Bool)

(assert (=> start!33204 m!335471))

(declare-fun m!335473 () Bool)

(assert (=> b!330029 m!335473))

(assert (=> b!330036 m!335467))

(check-sat (not b!330040) (not start!33204) (not b!330031) (not b!330032) (not b!330027) (not b!330030) (not b!330029) (not b!330034))
(check-sat)
