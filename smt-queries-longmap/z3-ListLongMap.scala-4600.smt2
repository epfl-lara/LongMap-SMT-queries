; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64176 () Bool)

(assert start!64176)

(declare-fun b!720659 () Bool)

(declare-fun e!404198 () Bool)

(declare-fun e!404200 () Bool)

(assert (=> b!720659 (= e!404198 e!404200)))

(declare-fun res!482795 () Bool)

(assert (=> b!720659 (=> (not res!482795) (not e!404200))))

(declare-datatypes ((SeekEntryResult!7131 0))(
  ( (MissingZero!7131 (index!30892 (_ BitVec 32))) (Found!7131 (index!30893 (_ BitVec 32))) (Intermediate!7131 (undefined!7943 Bool) (index!30894 (_ BitVec 32)) (x!61899 (_ BitVec 32))) (Undefined!7131) (MissingVacant!7131 (index!30895 (_ BitVec 32))) )
))
(declare-fun lt!319865 () SeekEntryResult!7131)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720659 (= res!482795 (or (= lt!319865 (MissingZero!7131 i!1173)) (= lt!319865 (MissingVacant!7131 i!1173))))))

(declare-datatypes ((array!40814 0))(
  ( (array!40815 (arr!19531 (Array (_ BitVec 32) (_ BitVec 64))) (size!19952 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40814)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40814 (_ BitVec 32)) SeekEntryResult!7131)

(assert (=> b!720659 (= lt!319865 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720661 () Bool)

(declare-fun res!482800 () Bool)

(assert (=> b!720661 (=> (not res!482800) (not e!404198))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!720661 (= res!482800 (and (= (size!19952 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19952 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19952 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720662 () Bool)

(declare-fun e!404199 () Bool)

(assert (=> b!720662 (= e!404199 false)))

(declare-fun lt!319864 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720662 (= lt!319864 (toIndex!0 (select (store (arr!19531 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!720663 () Bool)

(assert (=> b!720663 (= e!404200 e!404199)))

(declare-fun res!482802 () Bool)

(assert (=> b!720663 (=> (not res!482802) (not e!404199))))

(declare-fun lt!319863 () SeekEntryResult!7131)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40814 (_ BitVec 32)) SeekEntryResult!7131)

(assert (=> b!720663 (= res!482802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19531 a!3186) j!159) mask!3328) (select (arr!19531 a!3186) j!159) a!3186 mask!3328) lt!319863))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720663 (= lt!319863 (Intermediate!7131 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720664 () Bool)

(declare-fun res!482803 () Bool)

(assert (=> b!720664 (=> (not res!482803) (not e!404198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720664 (= res!482803 (validKeyInArray!0 (select (arr!19531 a!3186) j!159)))))

(declare-fun b!720665 () Bool)

(declare-fun res!482799 () Bool)

(assert (=> b!720665 (=> (not res!482799) (not e!404198))))

(assert (=> b!720665 (= res!482799 (validKeyInArray!0 k0!2102))))

(declare-fun b!720666 () Bool)

(declare-fun res!482798 () Bool)

(assert (=> b!720666 (=> (not res!482798) (not e!404198))))

(declare-fun arrayContainsKey!0 (array!40814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720666 (= res!482798 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720667 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404201 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!720667 (= e!404201 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19531 a!3186) j!159) a!3186 mask!3328) lt!319863))))

(declare-fun b!720668 () Bool)

(declare-fun res!482796 () Bool)

(assert (=> b!720668 (=> (not res!482796) (not e!404199))))

(assert (=> b!720668 (= res!482796 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19531 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720669 () Bool)

(declare-fun res!482797 () Bool)

(assert (=> b!720669 (=> (not res!482797) (not e!404200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40814 (_ BitVec 32)) Bool)

(assert (=> b!720669 (= res!482797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720670 () Bool)

(declare-fun res!482804 () Bool)

(assert (=> b!720670 (=> (not res!482804) (not e!404200))))

(assert (=> b!720670 (= res!482804 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19952 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19952 a!3186))))))

(declare-fun res!482801 () Bool)

(assert (=> start!64176 (=> (not res!482801) (not e!404198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64176 (= res!482801 (validMask!0 mask!3328))))

(assert (=> start!64176 e!404198))

(assert (=> start!64176 true))

(declare-fun array_inv!15327 (array!40814) Bool)

(assert (=> start!64176 (array_inv!15327 a!3186)))

(declare-fun b!720660 () Bool)

(declare-fun res!482794 () Bool)

(assert (=> b!720660 (=> (not res!482794) (not e!404200))))

(declare-datatypes ((List!13533 0))(
  ( (Nil!13530) (Cons!13529 (h!14580 (_ BitVec 64)) (t!19848 List!13533)) )
))
(declare-fun arrayNoDuplicates!0 (array!40814 (_ BitVec 32) List!13533) Bool)

(assert (=> b!720660 (= res!482794 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13530))))

(declare-fun b!720671 () Bool)

(declare-fun res!482793 () Bool)

(assert (=> b!720671 (=> (not res!482793) (not e!404199))))

(assert (=> b!720671 (= res!482793 e!404201)))

(declare-fun c!79303 () Bool)

(assert (=> b!720671 (= c!79303 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720672 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40814 (_ BitVec 32)) SeekEntryResult!7131)

(assert (=> b!720672 (= e!404201 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19531 a!3186) j!159) a!3186 mask!3328) (Found!7131 j!159)))))

(assert (= (and start!64176 res!482801) b!720661))

(assert (= (and b!720661 res!482800) b!720664))

(assert (= (and b!720664 res!482803) b!720665))

(assert (= (and b!720665 res!482799) b!720666))

(assert (= (and b!720666 res!482798) b!720659))

(assert (= (and b!720659 res!482795) b!720669))

(assert (= (and b!720669 res!482797) b!720660))

(assert (= (and b!720660 res!482794) b!720670))

(assert (= (and b!720670 res!482804) b!720663))

(assert (= (and b!720663 res!482802) b!720668))

(assert (= (and b!720668 res!482796) b!720671))

(assert (= (and b!720671 c!79303) b!720667))

(assert (= (and b!720671 (not c!79303)) b!720672))

(assert (= (and b!720671 res!482793) b!720662))

(declare-fun m!675695 () Bool)

(assert (=> b!720668 m!675695))

(declare-fun m!675697 () Bool)

(assert (=> b!720672 m!675697))

(assert (=> b!720672 m!675697))

(declare-fun m!675699 () Bool)

(assert (=> b!720672 m!675699))

(declare-fun m!675701 () Bool)

(assert (=> b!720665 m!675701))

(declare-fun m!675703 () Bool)

(assert (=> start!64176 m!675703))

(declare-fun m!675705 () Bool)

(assert (=> start!64176 m!675705))

(declare-fun m!675707 () Bool)

(assert (=> b!720666 m!675707))

(assert (=> b!720664 m!675697))

(assert (=> b!720664 m!675697))

(declare-fun m!675709 () Bool)

(assert (=> b!720664 m!675709))

(declare-fun m!675711 () Bool)

(assert (=> b!720659 m!675711))

(declare-fun m!675713 () Bool)

(assert (=> b!720669 m!675713))

(declare-fun m!675715 () Bool)

(assert (=> b!720660 m!675715))

(assert (=> b!720663 m!675697))

(assert (=> b!720663 m!675697))

(declare-fun m!675717 () Bool)

(assert (=> b!720663 m!675717))

(assert (=> b!720663 m!675717))

(assert (=> b!720663 m!675697))

(declare-fun m!675719 () Bool)

(assert (=> b!720663 m!675719))

(declare-fun m!675721 () Bool)

(assert (=> b!720662 m!675721))

(declare-fun m!675723 () Bool)

(assert (=> b!720662 m!675723))

(assert (=> b!720662 m!675723))

(declare-fun m!675725 () Bool)

(assert (=> b!720662 m!675725))

(assert (=> b!720667 m!675697))

(assert (=> b!720667 m!675697))

(declare-fun m!675727 () Bool)

(assert (=> b!720667 m!675727))

(check-sat (not b!720669) (not b!720672) (not b!720664) (not b!720659) (not b!720663) (not b!720662) (not b!720665) (not b!720666) (not b!720667) (not start!64176) (not b!720660))
(check-sat)
