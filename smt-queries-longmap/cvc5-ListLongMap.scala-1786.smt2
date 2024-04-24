; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32406 () Bool)

(assert start!32406)

(declare-fun b!323631 () Bool)

(declare-fun res!177135 () Bool)

(declare-fun e!199995 () Bool)

(assert (=> b!323631 (=> (not res!177135) (not e!199995))))

(declare-datatypes ((array!16558 0))(
  ( (array!16559 (arr!7836 (Array (_ BitVec 32) (_ BitVec 64))) (size!8188 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16558)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323631 (= res!177135 (and (= (select (arr!7836 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8188 a!3305))))))

(declare-fun b!323632 () Bool)

(declare-fun res!177126 () Bool)

(declare-fun e!199990 () Bool)

(assert (=> b!323632 (=> (not res!177126) (not e!199990))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2932 0))(
  ( (MissingZero!2932 (index!13904 (_ BitVec 32))) (Found!2932 (index!13905 (_ BitVec 32))) (Intermediate!2932 (undefined!3744 Bool) (index!13906 (_ BitVec 32)) (x!32261 (_ BitVec 32))) (Undefined!2932) (MissingVacant!2932 (index!13907 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16558 (_ BitVec 32)) SeekEntryResult!2932)

(assert (=> b!323632 (= res!177126 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2932 i!1250)))))

(declare-fun b!323634 () Bool)

(declare-datatypes ((Unit!10001 0))(
  ( (Unit!10002) )
))
(declare-fun e!199994 () Unit!10001)

(declare-fun Unit!10003 () Unit!10001)

(assert (=> b!323634 (= e!199994 Unit!10003)))

(declare-fun b!323635 () Bool)

(declare-fun res!177127 () Bool)

(assert (=> b!323635 (=> (not res!177127) (not e!199990))))

(assert (=> b!323635 (= res!177127 (and (= (size!8188 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8188 a!3305))))))

(declare-fun b!323636 () Bool)

(declare-fun e!199992 () Unit!10001)

(declare-fun e!199991 () Unit!10001)

(assert (=> b!323636 (= e!199992 e!199991)))

(declare-fun c!50881 () Bool)

(assert (=> b!323636 (= c!50881 (or (= (select (arr!7836 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7836 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323637 () Bool)

(assert (=> b!323637 false))

(declare-fun Unit!10004 () Unit!10001)

(assert (=> b!323637 (= e!199991 Unit!10004)))

(declare-fun b!323638 () Bool)

(declare-fun res!177133 () Bool)

(assert (=> b!323638 (=> (not res!177133) (not e!199995))))

(assert (=> b!323638 (= res!177133 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7836 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323639 () Bool)

(assert (=> b!323639 (= e!199990 e!199995)))

(declare-fun res!177129 () Bool)

(assert (=> b!323639 (=> (not res!177129) (not e!199995))))

(declare-fun lt!156700 () SeekEntryResult!2932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16558 (_ BitVec 32)) SeekEntryResult!2932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323639 (= res!177129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156700))))

(assert (=> b!323639 (= lt!156700 (Intermediate!2932 false resIndex!58 resX!58))))

(declare-fun b!323640 () Bool)

(declare-fun Unit!10005 () Unit!10001)

(assert (=> b!323640 (= e!199992 Unit!10005)))

(declare-fun b!323641 () Bool)

(declare-fun res!177128 () Bool)

(assert (=> b!323641 (=> (not res!177128) (not e!199990))))

(declare-fun arrayContainsKey!0 (array!16558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323641 (= res!177128 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!177130 () Bool)

(assert (=> start!32406 (=> (not res!177130) (not e!199990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32406 (= res!177130 (validMask!0 mask!3777))))

(assert (=> start!32406 e!199990))

(declare-fun array_inv!5786 (array!16558) Bool)

(assert (=> start!32406 (array_inv!5786 a!3305)))

(assert (=> start!32406 true))

(declare-fun b!323633 () Bool)

(assert (=> b!323633 false))

(declare-fun lt!156702 () Unit!10001)

(assert (=> b!323633 (= lt!156702 e!199994)))

(declare-fun c!50882 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323633 (= c!50882 (is-Intermediate!2932 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10006 () Unit!10001)

(assert (=> b!323633 (= e!199991 Unit!10006)))

(declare-fun b!323642 () Bool)

(assert (=> b!323642 (= e!199995 (not (or (not (= (select (arr!7836 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!323642 (= index!1840 resIndex!58)))

(declare-fun lt!156701 () Unit!10001)

(assert (=> b!323642 (= lt!156701 e!199992)))

(declare-fun c!50880 () Bool)

(assert (=> b!323642 (= c!50880 (not (= resIndex!58 index!1840)))))

(declare-fun b!323643 () Bool)

(declare-fun res!177132 () Bool)

(assert (=> b!323643 (=> (not res!177132) (not e!199995))))

(assert (=> b!323643 (= res!177132 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156700))))

(declare-fun b!323644 () Bool)

(declare-fun res!177131 () Bool)

(assert (=> b!323644 (=> (not res!177131) (not e!199990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16558 (_ BitVec 32)) Bool)

(assert (=> b!323644 (= res!177131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323645 () Bool)

(declare-fun Unit!10007 () Unit!10001)

(assert (=> b!323645 (= e!199994 Unit!10007)))

(assert (=> b!323645 false))

(declare-fun b!323646 () Bool)

(declare-fun res!177134 () Bool)

(assert (=> b!323646 (=> (not res!177134) (not e!199990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323646 (= res!177134 (validKeyInArray!0 k!2497))))

(assert (= (and start!32406 res!177130) b!323635))

(assert (= (and b!323635 res!177127) b!323646))

(assert (= (and b!323646 res!177134) b!323641))

(assert (= (and b!323641 res!177128) b!323632))

(assert (= (and b!323632 res!177126) b!323644))

(assert (= (and b!323644 res!177131) b!323639))

(assert (= (and b!323639 res!177129) b!323631))

(assert (= (and b!323631 res!177135) b!323643))

(assert (= (and b!323643 res!177132) b!323638))

(assert (= (and b!323638 res!177133) b!323642))

(assert (= (and b!323642 c!50880) b!323636))

(assert (= (and b!323642 (not c!50880)) b!323640))

(assert (= (and b!323636 c!50881) b!323637))

(assert (= (and b!323636 (not c!50881)) b!323633))

(assert (= (and b!323633 c!50882) b!323634))

(assert (= (and b!323633 (not c!50882)) b!323645))

(declare-fun m!331133 () Bool)

(assert (=> b!323631 m!331133))

(declare-fun m!331135 () Bool)

(assert (=> b!323638 m!331135))

(declare-fun m!331137 () Bool)

(assert (=> b!323643 m!331137))

(declare-fun m!331139 () Bool)

(assert (=> b!323639 m!331139))

(assert (=> b!323639 m!331139))

(declare-fun m!331141 () Bool)

(assert (=> b!323639 m!331141))

(declare-fun m!331143 () Bool)

(assert (=> b!323644 m!331143))

(declare-fun m!331145 () Bool)

(assert (=> b!323646 m!331145))

(assert (=> b!323642 m!331135))

(declare-fun m!331147 () Bool)

(assert (=> b!323641 m!331147))

(declare-fun m!331149 () Bool)

(assert (=> start!32406 m!331149))

(declare-fun m!331151 () Bool)

(assert (=> start!32406 m!331151))

(declare-fun m!331153 () Bool)

(assert (=> b!323633 m!331153))

(assert (=> b!323633 m!331153))

(declare-fun m!331155 () Bool)

(assert (=> b!323633 m!331155))

(declare-fun m!331157 () Bool)

(assert (=> b!323632 m!331157))

(assert (=> b!323636 m!331135))

(push 1)

(assert (not b!323646))

(assert (not b!323641))

(assert (not b!323632))

(assert (not b!323643))

(assert (not b!323633))

(assert (not b!323644))

(assert (not start!32406))

(assert (not b!323639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

