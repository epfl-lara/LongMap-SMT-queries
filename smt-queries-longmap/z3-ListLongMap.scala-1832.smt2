; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33188 () Bool)

(assert start!33188)

(declare-fun b!329925 () Bool)

(declare-datatypes ((Unit!10186 0))(
  ( (Unit!10187) )
))
(declare-fun e!202625 () Unit!10186)

(declare-fun e!202626 () Unit!10186)

(assert (=> b!329925 (= e!202625 e!202626)))

(declare-fun c!51699 () Bool)

(declare-datatypes ((array!16860 0))(
  ( (array!16861 (arr!7972 (Array (_ BitVec 32) (_ BitVec 64))) (size!8324 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16860)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!329925 (= c!51699 (or (= (select (arr!7972 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7972 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329926 () Bool)

(declare-fun res!181819 () Bool)

(declare-fun e!202627 () Bool)

(assert (=> b!329926 (=> (not res!181819) (not e!202627))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329926 (= res!181819 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329927 () Bool)

(declare-fun e!202628 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!329927 (= e!202628 (not (= index!1840 resIndex!58)))))

(declare-fun lt!158443 () Unit!10186)

(assert (=> b!329927 (= lt!158443 e!202625)))

(declare-fun c!51701 () Bool)

(assert (=> b!329927 (= c!51701 (not (= resIndex!58 index!1840)))))

(declare-fun b!329928 () Bool)

(assert (=> b!329928 false))

(declare-fun Unit!10188 () Unit!10186)

(assert (=> b!329928 (= e!202626 Unit!10188)))

(declare-fun res!181818 () Bool)

(assert (=> start!33188 (=> (not res!181818) (not e!202627))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33188 (= res!181818 (validMask!0 mask!3777))))

(assert (=> start!33188 e!202627))

(declare-fun array_inv!5922 (array!16860) Bool)

(assert (=> start!33188 (array_inv!5922 a!3305)))

(assert (=> start!33188 true))

(declare-fun b!329929 () Bool)

(declare-fun res!181821 () Bool)

(assert (=> b!329929 (=> (not res!181821) (not e!202627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16860 (_ BitVec 32)) Bool)

(assert (=> b!329929 (= res!181821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329930 () Bool)

(declare-fun e!202624 () Unit!10186)

(declare-fun Unit!10189 () Unit!10186)

(assert (=> b!329930 (= e!202624 Unit!10189)))

(assert (=> b!329930 false))

(declare-fun b!329931 () Bool)

(declare-fun res!181817 () Bool)

(assert (=> b!329931 (=> (not res!181817) (not e!202627))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329931 (= res!181817 (and (= (size!8324 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8324 a!3305))))))

(declare-fun b!329932 () Bool)

(declare-fun res!181815 () Bool)

(assert (=> b!329932 (=> (not res!181815) (not e!202628))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329932 (= res!181815 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7972 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!329933 () Bool)

(declare-fun Unit!10190 () Unit!10186)

(assert (=> b!329933 (= e!202625 Unit!10190)))

(declare-fun b!329934 () Bool)

(declare-fun res!181816 () Bool)

(assert (=> b!329934 (=> (not res!181816) (not e!202627))))

(declare-datatypes ((SeekEntryResult!3068 0))(
  ( (MissingZero!3068 (index!14448 (_ BitVec 32))) (Found!3068 (index!14449 (_ BitVec 32))) (Intermediate!3068 (undefined!3880 Bool) (index!14450 (_ BitVec 32)) (x!32840 (_ BitVec 32))) (Undefined!3068) (MissingVacant!3068 (index!14451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16860 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!329934 (= res!181816 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3068 i!1250)))))

(declare-fun b!329935 () Bool)

(declare-fun res!181814 () Bool)

(assert (=> b!329935 (=> (not res!181814) (not e!202628))))

(declare-fun lt!158445 () SeekEntryResult!3068)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16860 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!329935 (= res!181814 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158445))))

(declare-fun b!329936 () Bool)

(declare-fun Unit!10191 () Unit!10186)

(assert (=> b!329936 (= e!202624 Unit!10191)))

(declare-fun b!329937 () Bool)

(declare-fun res!181813 () Bool)

(assert (=> b!329937 (=> (not res!181813) (not e!202627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329937 (= res!181813 (validKeyInArray!0 k0!2497))))

(declare-fun b!329938 () Bool)

(assert (=> b!329938 (= e!202627 e!202628)))

(declare-fun res!181812 () Bool)

(assert (=> b!329938 (=> (not res!181812) (not e!202628))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329938 (= res!181812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158445))))

(assert (=> b!329938 (= lt!158445 (Intermediate!3068 false resIndex!58 resX!58))))

(declare-fun b!329939 () Bool)

(assert (=> b!329939 false))

(declare-fun lt!158444 () Unit!10186)

(assert (=> b!329939 (= lt!158444 e!202624)))

(declare-fun c!51700 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329939 (= c!51700 ((_ is Intermediate!3068) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10192 () Unit!10186)

(assert (=> b!329939 (= e!202626 Unit!10192)))

(declare-fun b!329940 () Bool)

(declare-fun res!181820 () Bool)

(assert (=> b!329940 (=> (not res!181820) (not e!202628))))

(assert (=> b!329940 (= res!181820 (and (= (select (arr!7972 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8324 a!3305))))))

(assert (= (and start!33188 res!181818) b!329931))

(assert (= (and b!329931 res!181817) b!329937))

(assert (= (and b!329937 res!181813) b!329926))

(assert (= (and b!329926 res!181819) b!329934))

(assert (= (and b!329934 res!181816) b!329929))

(assert (= (and b!329929 res!181821) b!329938))

(assert (= (and b!329938 res!181812) b!329940))

(assert (= (and b!329940 res!181820) b!329935))

(assert (= (and b!329935 res!181814) b!329932))

(assert (= (and b!329932 res!181815) b!329927))

(assert (= (and b!329927 c!51701) b!329925))

(assert (= (and b!329927 (not c!51701)) b!329933))

(assert (= (and b!329925 c!51699) b!329928))

(assert (= (and b!329925 (not c!51699)) b!329939))

(assert (= (and b!329939 c!51700) b!329936))

(assert (= (and b!329939 (not c!51700)) b!329930))

(declare-fun m!335635 () Bool)

(assert (=> b!329925 m!335635))

(declare-fun m!335637 () Bool)

(assert (=> b!329935 m!335637))

(declare-fun m!335639 () Bool)

(assert (=> b!329940 m!335639))

(declare-fun m!335641 () Bool)

(assert (=> b!329934 m!335641))

(assert (=> b!329932 m!335635))

(declare-fun m!335643 () Bool)

(assert (=> b!329929 m!335643))

(declare-fun m!335645 () Bool)

(assert (=> b!329926 m!335645))

(declare-fun m!335647 () Bool)

(assert (=> b!329938 m!335647))

(assert (=> b!329938 m!335647))

(declare-fun m!335649 () Bool)

(assert (=> b!329938 m!335649))

(declare-fun m!335651 () Bool)

(assert (=> b!329937 m!335651))

(declare-fun m!335653 () Bool)

(assert (=> start!33188 m!335653))

(declare-fun m!335655 () Bool)

(assert (=> start!33188 m!335655))

(declare-fun m!335657 () Bool)

(assert (=> b!329939 m!335657))

(assert (=> b!329939 m!335657))

(declare-fun m!335659 () Bool)

(assert (=> b!329939 m!335659))

(check-sat (not start!33188) (not b!329935) (not b!329937) (not b!329939) (not b!329926) (not b!329929) (not b!329934) (not b!329938))
(check-sat)
