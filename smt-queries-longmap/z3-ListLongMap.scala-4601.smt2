; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64242 () Bool)

(assert start!64242)

(declare-datatypes ((array!40813 0))(
  ( (array!40814 (arr!19528 (Array (_ BitVec 32) (_ BitVec 64))) (size!19948 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40813)

(declare-fun e!404457 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7084 0))(
  ( (MissingZero!7084 (index!30704 (_ BitVec 32))) (Found!7084 (index!30705 (_ BitVec 32))) (Intermediate!7084 (undefined!7896 Bool) (index!30706 (_ BitVec 32)) (x!61863 (_ BitVec 32))) (Undefined!7084) (MissingVacant!7084 (index!30707 (_ BitVec 32))) )
))
(declare-fun lt!320011 () SeekEntryResult!7084)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!721071 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40813 (_ BitVec 32)) SeekEntryResult!7084)

(assert (=> b!721071 (= e!404457 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!320011))))

(declare-fun b!721073 () Bool)

(declare-fun res!483047 () Bool)

(declare-fun e!404455 () Bool)

(assert (=> b!721073 (=> (not res!483047) (not e!404455))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721073 (= res!483047 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19528 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721074 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40813 (_ BitVec 32)) SeekEntryResult!7084)

(assert (=> b!721074 (= e!404457 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) (Found!7084 j!159)))))

(declare-fun b!721075 () Bool)

(declare-fun res!483052 () Bool)

(declare-fun e!404453 () Bool)

(assert (=> b!721075 (=> (not res!483052) (not e!404453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40813 (_ BitVec 32)) Bool)

(assert (=> b!721075 (= res!483052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721076 () Bool)

(declare-fun res!483050 () Bool)

(declare-fun e!404454 () Bool)

(assert (=> b!721076 (=> (not res!483050) (not e!404454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721076 (= res!483050 (validKeyInArray!0 (select (arr!19528 a!3186) j!159)))))

(declare-fun b!721077 () Bool)

(declare-fun res!483051 () Bool)

(assert (=> b!721077 (=> (not res!483051) (not e!404453))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721077 (= res!483051 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19948 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19948 a!3186))))))

(declare-fun b!721078 () Bool)

(declare-fun res!483046 () Bool)

(assert (=> b!721078 (=> (not res!483046) (not e!404453))))

(declare-datatypes ((List!13437 0))(
  ( (Nil!13434) (Cons!13433 (h!14487 (_ BitVec 64)) (t!19744 List!13437)) )
))
(declare-fun arrayNoDuplicates!0 (array!40813 (_ BitVec 32) List!13437) Bool)

(assert (=> b!721078 (= res!483046 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13434))))

(declare-fun b!721079 () Bool)

(declare-fun res!483055 () Bool)

(assert (=> b!721079 (=> (not res!483055) (not e!404454))))

(assert (=> b!721079 (= res!483055 (and (= (size!19948 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19948 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19948 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721080 () Bool)

(declare-fun res!483053 () Bool)

(assert (=> b!721080 (=> (not res!483053) (not e!404454))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721080 (= res!483053 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721072 () Bool)

(declare-fun res!483044 () Bool)

(assert (=> b!721072 (=> (not res!483044) (not e!404454))))

(assert (=> b!721072 (= res!483044 (validKeyInArray!0 k0!2102))))

(declare-fun res!483045 () Bool)

(assert (=> start!64242 (=> (not res!483045) (not e!404454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64242 (= res!483045 (validMask!0 mask!3328))))

(assert (=> start!64242 e!404454))

(assert (=> start!64242 true))

(declare-fun array_inv!15387 (array!40813) Bool)

(assert (=> start!64242 (array_inv!15387 a!3186)))

(declare-fun b!721081 () Bool)

(assert (=> b!721081 (= e!404453 e!404455)))

(declare-fun res!483049 () Bool)

(assert (=> b!721081 (=> (not res!483049) (not e!404455))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721081 (= res!483049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!320011))))

(assert (=> b!721081 (= lt!320011 (Intermediate!7084 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721082 () Bool)

(assert (=> b!721082 (= e!404454 e!404453)))

(declare-fun res!483054 () Bool)

(assert (=> b!721082 (=> (not res!483054) (not e!404453))))

(declare-fun lt!320012 () SeekEntryResult!7084)

(assert (=> b!721082 (= res!483054 (or (= lt!320012 (MissingZero!7084 i!1173)) (= lt!320012 (MissingVacant!7084 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40813 (_ BitVec 32)) SeekEntryResult!7084)

(assert (=> b!721082 (= lt!320012 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721083 () Bool)

(assert (=> b!721083 (= e!404455 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!320013 () (_ BitVec 32))

(assert (=> b!721083 (= lt!320013 (toIndex!0 (select (store (arr!19528 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721084 () Bool)

(declare-fun res!483048 () Bool)

(assert (=> b!721084 (=> (not res!483048) (not e!404455))))

(assert (=> b!721084 (= res!483048 e!404457)))

(declare-fun c!79385 () Bool)

(assert (=> b!721084 (= c!79385 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64242 res!483045) b!721079))

(assert (= (and b!721079 res!483055) b!721076))

(assert (= (and b!721076 res!483050) b!721072))

(assert (= (and b!721072 res!483044) b!721080))

(assert (= (and b!721080 res!483053) b!721082))

(assert (= (and b!721082 res!483054) b!721075))

(assert (= (and b!721075 res!483052) b!721078))

(assert (= (and b!721078 res!483046) b!721077))

(assert (= (and b!721077 res!483051) b!721081))

(assert (= (and b!721081 res!483049) b!721073))

(assert (= (and b!721073 res!483047) b!721084))

(assert (= (and b!721084 c!79385) b!721071))

(assert (= (and b!721084 (not c!79385)) b!721074))

(assert (= (and b!721084 res!483048) b!721083))

(declare-fun m!676611 () Bool)

(assert (=> b!721076 m!676611))

(assert (=> b!721076 m!676611))

(declare-fun m!676613 () Bool)

(assert (=> b!721076 m!676613))

(declare-fun m!676615 () Bool)

(assert (=> b!721078 m!676615))

(declare-fun m!676617 () Bool)

(assert (=> b!721080 m!676617))

(declare-fun m!676619 () Bool)

(assert (=> start!64242 m!676619))

(declare-fun m!676621 () Bool)

(assert (=> start!64242 m!676621))

(declare-fun m!676623 () Bool)

(assert (=> b!721083 m!676623))

(declare-fun m!676625 () Bool)

(assert (=> b!721083 m!676625))

(assert (=> b!721083 m!676625))

(declare-fun m!676627 () Bool)

(assert (=> b!721083 m!676627))

(declare-fun m!676629 () Bool)

(assert (=> b!721073 m!676629))

(assert (=> b!721081 m!676611))

(assert (=> b!721081 m!676611))

(declare-fun m!676631 () Bool)

(assert (=> b!721081 m!676631))

(assert (=> b!721081 m!676631))

(assert (=> b!721081 m!676611))

(declare-fun m!676633 () Bool)

(assert (=> b!721081 m!676633))

(declare-fun m!676635 () Bool)

(assert (=> b!721075 m!676635))

(declare-fun m!676637 () Bool)

(assert (=> b!721082 m!676637))

(assert (=> b!721071 m!676611))

(assert (=> b!721071 m!676611))

(declare-fun m!676639 () Bool)

(assert (=> b!721071 m!676639))

(declare-fun m!676641 () Bool)

(assert (=> b!721072 m!676641))

(assert (=> b!721074 m!676611))

(assert (=> b!721074 m!676611))

(declare-fun m!676643 () Bool)

(assert (=> b!721074 m!676643))

(check-sat (not b!721082) (not b!721074) (not b!721075) (not b!721076) (not start!64242) (not b!721081) (not b!721078) (not b!721080) (not b!721072) (not b!721071) (not b!721083))
(check-sat)
