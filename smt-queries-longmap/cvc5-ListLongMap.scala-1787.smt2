; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32422 () Bool)

(assert start!32422)

(declare-fun b!323732 () Bool)

(declare-fun res!177159 () Bool)

(declare-fun e!200042 () Bool)

(assert (=> b!323732 (=> (not res!177159) (not e!200042))))

(declare-datatypes ((array!16561 0))(
  ( (array!16562 (arr!7838 (Array (_ BitVec 32) (_ BitVec 64))) (size!8190 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16561)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323732 (= res!177159 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7838 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323733 () Bool)

(assert (=> b!323733 false))

(declare-datatypes ((Unit!10046 0))(
  ( (Unit!10047) )
))
(declare-fun e!200045 () Unit!10046)

(declare-fun Unit!10048 () Unit!10046)

(assert (=> b!323733 (= e!200045 Unit!10048)))

(declare-fun b!323734 () Bool)

(declare-fun res!177162 () Bool)

(declare-fun e!200046 () Bool)

(assert (=> b!323734 (=> (not res!177162) (not e!200046))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323734 (= res!177162 (and (= (size!8190 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8190 a!3305))))))

(declare-fun b!323735 () Bool)

(declare-fun res!177168 () Bool)

(assert (=> b!323735 (=> (not res!177168) (not e!200046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323735 (= res!177168 (validKeyInArray!0 k!2497))))

(declare-fun b!323736 () Bool)

(declare-fun res!177166 () Bool)

(assert (=> b!323736 (=> (not res!177166) (not e!200046))))

(declare-fun arrayContainsKey!0 (array!16561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323736 (= res!177166 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323737 () Bool)

(declare-fun res!177163 () Bool)

(assert (=> b!323737 (=> (not res!177163) (not e!200042))))

(declare-datatypes ((SeekEntryResult!2969 0))(
  ( (MissingZero!2969 (index!14052 (_ BitVec 32))) (Found!2969 (index!14053 (_ BitVec 32))) (Intermediate!2969 (undefined!3781 Bool) (index!14054 (_ BitVec 32)) (x!32309 (_ BitVec 32))) (Undefined!2969) (MissingVacant!2969 (index!14055 (_ BitVec 32))) )
))
(declare-fun lt!156692 () SeekEntryResult!2969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16561 (_ BitVec 32)) SeekEntryResult!2969)

(assert (=> b!323737 (= res!177163 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156692))))

(declare-fun b!323738 () Bool)

(declare-fun e!200043 () Unit!10046)

(declare-fun Unit!10049 () Unit!10046)

(assert (=> b!323738 (= e!200043 Unit!10049)))

(declare-fun b!323739 () Bool)

(assert (=> b!323739 (= e!200043 e!200045)))

(declare-fun c!50916 () Bool)

(assert (=> b!323739 (= c!50916 (or (= (select (arr!7838 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7838 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323740 () Bool)

(declare-fun res!177167 () Bool)

(assert (=> b!323740 (=> (not res!177167) (not e!200046))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16561 (_ BitVec 32)) SeekEntryResult!2969)

(assert (=> b!323740 (= res!177167 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2969 i!1250)))))

(declare-fun b!323741 () Bool)

(declare-fun e!200047 () Unit!10046)

(declare-fun Unit!10050 () Unit!10046)

(assert (=> b!323741 (= e!200047 Unit!10050)))

(declare-fun b!323742 () Bool)

(declare-fun res!177161 () Bool)

(assert (=> b!323742 (=> (not res!177161) (not e!200042))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323742 (= res!177161 (and (= (select (arr!7838 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8190 a!3305))))))

(declare-fun b!323743 () Bool)

(assert (=> b!323743 (= e!200046 e!200042)))

(declare-fun res!177165 () Bool)

(assert (=> b!323743 (=> (not res!177165) (not e!200042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323743 (= res!177165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156692))))

(assert (=> b!323743 (= lt!156692 (Intermediate!2969 false resIndex!58 resX!58))))

(declare-fun b!323744 () Bool)

(declare-fun Unit!10051 () Unit!10046)

(assert (=> b!323744 (= e!200047 Unit!10051)))

(assert (=> b!323744 false))

(declare-fun b!323746 () Bool)

(assert (=> b!323746 (= e!200042 (not (or (not (= (select (arr!7838 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!323746 (= index!1840 resIndex!58)))

(declare-fun lt!156691 () Unit!10046)

(assert (=> b!323746 (= lt!156691 e!200043)))

(declare-fun c!50915 () Bool)

(assert (=> b!323746 (= c!50915 (not (= resIndex!58 index!1840)))))

(declare-fun b!323747 () Bool)

(assert (=> b!323747 false))

(declare-fun lt!156693 () Unit!10046)

(assert (=> b!323747 (= lt!156693 e!200047)))

(declare-fun c!50914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323747 (= c!50914 (is-Intermediate!2969 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10052 () Unit!10046)

(assert (=> b!323747 (= e!200045 Unit!10052)))

(declare-fun res!177160 () Bool)

(assert (=> start!32422 (=> (not res!177160) (not e!200046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32422 (= res!177160 (validMask!0 mask!3777))))

(assert (=> start!32422 e!200046))

(declare-fun array_inv!5801 (array!16561) Bool)

(assert (=> start!32422 (array_inv!5801 a!3305)))

(assert (=> start!32422 true))

(declare-fun b!323745 () Bool)

(declare-fun res!177164 () Bool)

(assert (=> b!323745 (=> (not res!177164) (not e!200046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16561 (_ BitVec 32)) Bool)

(assert (=> b!323745 (= res!177164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32422 res!177160) b!323734))

(assert (= (and b!323734 res!177162) b!323735))

(assert (= (and b!323735 res!177168) b!323736))

(assert (= (and b!323736 res!177166) b!323740))

(assert (= (and b!323740 res!177167) b!323745))

(assert (= (and b!323745 res!177164) b!323743))

(assert (= (and b!323743 res!177165) b!323742))

(assert (= (and b!323742 res!177161) b!323737))

(assert (= (and b!323737 res!177163) b!323732))

(assert (= (and b!323732 res!177159) b!323746))

(assert (= (and b!323746 c!50915) b!323739))

(assert (= (and b!323746 (not c!50915)) b!323738))

(assert (= (and b!323739 c!50916) b!323733))

(assert (= (and b!323739 (not c!50916)) b!323747))

(assert (= (and b!323747 c!50914) b!323741))

(assert (= (and b!323747 (not c!50914)) b!323744))

(declare-fun m!330977 () Bool)

(assert (=> b!323745 m!330977))

(declare-fun m!330979 () Bool)

(assert (=> b!323743 m!330979))

(assert (=> b!323743 m!330979))

(declare-fun m!330981 () Bool)

(assert (=> b!323743 m!330981))

(declare-fun m!330983 () Bool)

(assert (=> b!323735 m!330983))

(declare-fun m!330985 () Bool)

(assert (=> b!323737 m!330985))

(declare-fun m!330987 () Bool)

(assert (=> b!323742 m!330987))

(declare-fun m!330989 () Bool)

(assert (=> b!323732 m!330989))

(declare-fun m!330991 () Bool)

(assert (=> start!32422 m!330991))

(declare-fun m!330993 () Bool)

(assert (=> start!32422 m!330993))

(declare-fun m!330995 () Bool)

(assert (=> b!323736 m!330995))

(assert (=> b!323739 m!330989))

(declare-fun m!330997 () Bool)

(assert (=> b!323747 m!330997))

(assert (=> b!323747 m!330997))

(declare-fun m!330999 () Bool)

(assert (=> b!323747 m!330999))

(assert (=> b!323746 m!330989))

(declare-fun m!331001 () Bool)

(assert (=> b!323740 m!331001))

(push 1)

