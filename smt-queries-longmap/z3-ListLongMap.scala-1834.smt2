; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33200 () Bool)

(assert start!33200)

(declare-fun b!329991 () Bool)

(declare-datatypes ((Unit!10230 0))(
  ( (Unit!10231) )
))
(declare-fun e!202590 () Unit!10230)

(declare-fun e!202593 () Unit!10230)

(assert (=> b!329991 (= e!202590 e!202593)))

(declare-fun c!51706 () Bool)

(declare-datatypes ((array!16863 0))(
  ( (array!16864 (arr!7974 (Array (_ BitVec 32) (_ BitVec 64))) (size!8327 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16863)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!329991 (= c!51706 (or (= (select (arr!7974 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7974 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329992 () Bool)

(declare-fun res!181872 () Bool)

(declare-fun e!202591 () Bool)

(assert (=> b!329992 (=> (not res!181872) (not e!202591))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329992 (= res!181872 (and (= (select (arr!7974 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8327 a!3305))))))

(declare-fun b!329993 () Bool)

(assert (=> b!329993 (= e!202591 (not (= (select (arr!7974 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!329993 (= index!1840 resIndex!58)))

(declare-fun lt!158245 () Unit!10230)

(assert (=> b!329993 (= lt!158245 e!202590)))

(declare-fun c!51705 () Bool)

(assert (=> b!329993 (= c!51705 (not (= resIndex!58 index!1840)))))

(declare-fun b!329994 () Bool)

(declare-fun e!202592 () Unit!10230)

(declare-fun Unit!10232 () Unit!10230)

(assert (=> b!329994 (= e!202592 Unit!10232)))

(declare-fun b!329995 () Bool)

(declare-fun Unit!10233 () Unit!10230)

(assert (=> b!329995 (= e!202590 Unit!10233)))

(declare-fun b!329996 () Bool)

(declare-fun Unit!10234 () Unit!10230)

(assert (=> b!329996 (= e!202592 Unit!10234)))

(assert (=> b!329996 false))

(declare-fun b!329998 () Bool)

(assert (=> b!329998 false))

(declare-fun lt!158244 () Unit!10230)

(assert (=> b!329998 (= lt!158244 e!202592)))

(declare-fun c!51707 () Bool)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((SeekEntryResult!3104 0))(
  ( (MissingZero!3104 (index!14592 (_ BitVec 32))) (Found!3104 (index!14593 (_ BitVec 32))) (Intermediate!3104 (undefined!3916 Bool) (index!14594 (_ BitVec 32)) (x!32890 (_ BitVec 32))) (Undefined!3104) (MissingVacant!3104 (index!14595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16863 (_ BitVec 32)) SeekEntryResult!3104)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329998 (= c!51707 ((_ is Intermediate!3104) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10235 () Unit!10230)

(assert (=> b!329998 (= e!202593 Unit!10235)))

(declare-fun b!329999 () Bool)

(declare-fun res!181874 () Bool)

(assert (=> b!329999 (=> (not res!181874) (not e!202591))))

(assert (=> b!329999 (= res!181874 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7974 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330000 () Bool)

(declare-fun res!181870 () Bool)

(declare-fun e!202595 () Bool)

(assert (=> b!330000 (=> (not res!181870) (not e!202595))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16863 (_ BitVec 32)) SeekEntryResult!3104)

(assert (=> b!330000 (= res!181870 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3104 i!1250)))))

(declare-fun b!330001 () Bool)

(declare-fun res!181866 () Bool)

(assert (=> b!330001 (=> (not res!181866) (not e!202595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330001 (= res!181866 (validKeyInArray!0 k0!2497))))

(declare-fun b!330002 () Bool)

(declare-fun res!181875 () Bool)

(assert (=> b!330002 (=> (not res!181875) (not e!202591))))

(declare-fun lt!158246 () SeekEntryResult!3104)

(assert (=> b!330002 (= res!181875 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158246))))

(declare-fun b!330003 () Bool)

(declare-fun res!181868 () Bool)

(assert (=> b!330003 (=> (not res!181868) (not e!202595))))

(assert (=> b!330003 (= res!181868 (and (= (size!8327 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8327 a!3305))))))

(declare-fun b!330004 () Bool)

(declare-fun res!181869 () Bool)

(assert (=> b!330004 (=> (not res!181869) (not e!202595))))

(declare-fun arrayContainsKey!0 (array!16863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330004 (= res!181869 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330005 () Bool)

(assert (=> b!330005 (= e!202595 e!202591)))

(declare-fun res!181871 () Bool)

(assert (=> b!330005 (=> (not res!181871) (not e!202591))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330005 (= res!181871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158246))))

(assert (=> b!330005 (= lt!158246 (Intermediate!3104 false resIndex!58 resX!58))))

(declare-fun b!330006 () Bool)

(assert (=> b!330006 false))

(declare-fun Unit!10236 () Unit!10230)

(assert (=> b!330006 (= e!202593 Unit!10236)))

(declare-fun res!181873 () Bool)

(assert (=> start!33200 (=> (not res!181873) (not e!202595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33200 (= res!181873 (validMask!0 mask!3777))))

(assert (=> start!33200 e!202595))

(declare-fun array_inv!5946 (array!16863) Bool)

(assert (=> start!33200 (array_inv!5946 a!3305)))

(assert (=> start!33200 true))

(declare-fun b!329997 () Bool)

(declare-fun res!181867 () Bool)

(assert (=> b!329997 (=> (not res!181867) (not e!202595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16863 (_ BitVec 32)) Bool)

(assert (=> b!329997 (= res!181867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!33200 res!181873) b!330003))

(assert (= (and b!330003 res!181868) b!330001))

(assert (= (and b!330001 res!181866) b!330004))

(assert (= (and b!330004 res!181869) b!330000))

(assert (= (and b!330000 res!181870) b!329997))

(assert (= (and b!329997 res!181867) b!330005))

(assert (= (and b!330005 res!181871) b!329992))

(assert (= (and b!329992 res!181872) b!330002))

(assert (= (and b!330002 res!181875) b!329999))

(assert (= (and b!329999 res!181874) b!329993))

(assert (= (and b!329993 c!51705) b!329991))

(assert (= (and b!329993 (not c!51705)) b!329995))

(assert (= (and b!329991 c!51706) b!330006))

(assert (= (and b!329991 (not c!51706)) b!329998))

(assert (= (and b!329998 c!51707) b!329994))

(assert (= (and b!329998 (not c!51707)) b!329996))

(declare-fun m!334849 () Bool)

(assert (=> b!329998 m!334849))

(assert (=> b!329998 m!334849))

(declare-fun m!334851 () Bool)

(assert (=> b!329998 m!334851))

(declare-fun m!334853 () Bool)

(assert (=> b!329993 m!334853))

(declare-fun m!334855 () Bool)

(assert (=> b!330001 m!334855))

(declare-fun m!334857 () Bool)

(assert (=> b!329992 m!334857))

(declare-fun m!334859 () Bool)

(assert (=> b!330000 m!334859))

(declare-fun m!334861 () Bool)

(assert (=> b!330002 m!334861))

(declare-fun m!334863 () Bool)

(assert (=> b!329997 m!334863))

(assert (=> b!329999 m!334853))

(declare-fun m!334865 () Bool)

(assert (=> start!33200 m!334865))

(declare-fun m!334867 () Bool)

(assert (=> start!33200 m!334867))

(declare-fun m!334869 () Bool)

(assert (=> b!330004 m!334869))

(assert (=> b!329991 m!334853))

(declare-fun m!334871 () Bool)

(assert (=> b!330005 m!334871))

(assert (=> b!330005 m!334871))

(declare-fun m!334873 () Bool)

(assert (=> b!330005 m!334873))

(check-sat (not start!33200) (not b!330001) (not b!329997) (not b!330000) (not b!330002) (not b!329998) (not b!330005) (not b!330004))
(check-sat)
