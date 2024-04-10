; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86908 () Bool)

(assert start!86908)

(declare-fun b!1007843 () Bool)

(declare-fun res!676747 () Bool)

(declare-fun e!567163 () Bool)

(assert (=> b!1007843 (=> (not res!676747) (not e!567163))))

(declare-datatypes ((array!63556 0))(
  ( (array!63557 (arr!30599 (Array (_ BitVec 32) (_ BitVec 64))) (size!31101 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63556)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007843 (= res!676747 (and (= (size!31101 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31101 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31101 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007844 () Bool)

(declare-fun res!676748 () Bool)

(declare-fun e!567161 () Bool)

(assert (=> b!1007844 (=> (not res!676748) (not e!567161))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007844 (= res!676748 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31101 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31101 a!3219))))))

(declare-fun b!1007845 () Bool)

(declare-fun res!676743 () Bool)

(declare-fun e!567159 () Bool)

(assert (=> b!1007845 (=> (not res!676743) (not e!567159))))

(declare-datatypes ((SeekEntryResult!9531 0))(
  ( (MissingZero!9531 (index!40495 (_ BitVec 32))) (Found!9531 (index!40496 (_ BitVec 32))) (Intermediate!9531 (undefined!10343 Bool) (index!40497 (_ BitVec 32)) (x!87889 (_ BitVec 32))) (Undefined!9531) (MissingVacant!9531 (index!40498 (_ BitVec 32))) )
))
(declare-fun lt!445403 () SeekEntryResult!9531)

(declare-fun lt!445402 () array!63556)

(declare-fun lt!445405 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63556 (_ BitVec 32)) SeekEntryResult!9531)

(assert (=> b!1007845 (= res!676743 (not (= lt!445403 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445405 lt!445402 mask!3464))))))

(declare-fun b!1007846 () Bool)

(declare-fun res!676738 () Bool)

(assert (=> b!1007846 (=> (not res!676738) (not e!567163))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007846 (= res!676738 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007847 () Bool)

(declare-fun res!676744 () Bool)

(assert (=> b!1007847 (=> (not res!676744) (not e!567163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007847 (= res!676744 (validKeyInArray!0 (select (arr!30599 a!3219) j!170)))))

(declare-fun b!1007848 () Bool)

(assert (=> b!1007848 (= e!567163 e!567161)))

(declare-fun res!676741 () Bool)

(assert (=> b!1007848 (=> (not res!676741) (not e!567161))))

(declare-fun lt!445406 () SeekEntryResult!9531)

(assert (=> b!1007848 (= res!676741 (or (= lt!445406 (MissingVacant!9531 i!1194)) (= lt!445406 (MissingZero!9531 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63556 (_ BitVec 32)) SeekEntryResult!9531)

(assert (=> b!1007848 (= lt!445406 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007849 () Bool)

(declare-fun res!676742 () Bool)

(assert (=> b!1007849 (=> (not res!676742) (not e!567159))))

(assert (=> b!1007849 (= res!676742 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007850 () Bool)

(declare-fun e!567158 () Bool)

(assert (=> b!1007850 (= e!567161 e!567158)))

(declare-fun res!676746 () Bool)

(assert (=> b!1007850 (=> (not res!676746) (not e!567158))))

(declare-fun lt!445404 () SeekEntryResult!9531)

(declare-fun lt!445401 () SeekEntryResult!9531)

(assert (=> b!1007850 (= res!676746 (= lt!445404 lt!445401))))

(assert (=> b!1007850 (= lt!445401 (Intermediate!9531 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007850 (= lt!445404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30599 a!3219) j!170) mask!3464) (select (arr!30599 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007851 () Bool)

(assert (=> b!1007851 (= e!567159 false)))

(declare-fun lt!445400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007851 (= lt!445400 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007852 () Bool)

(declare-fun e!567160 () Bool)

(assert (=> b!1007852 (= e!567158 e!567160)))

(declare-fun res!676749 () Bool)

(assert (=> b!1007852 (=> (not res!676749) (not e!567160))))

(assert (=> b!1007852 (= res!676749 (= lt!445403 lt!445401))))

(assert (=> b!1007852 (= lt!445403 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30599 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007853 () Bool)

(declare-fun res!676740 () Bool)

(assert (=> b!1007853 (=> (not res!676740) (not e!567161))))

(declare-datatypes ((List!21275 0))(
  ( (Nil!21272) (Cons!21271 (h!22457 (_ BitVec 64)) (t!30276 List!21275)) )
))
(declare-fun arrayNoDuplicates!0 (array!63556 (_ BitVec 32) List!21275) Bool)

(assert (=> b!1007853 (= res!676740 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21272))))

(declare-fun b!1007854 () Bool)

(assert (=> b!1007854 (= e!567160 e!567159)))

(declare-fun res!676736 () Bool)

(assert (=> b!1007854 (=> (not res!676736) (not e!567159))))

(assert (=> b!1007854 (= res!676736 (not (= lt!445404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445405 mask!3464) lt!445405 lt!445402 mask!3464))))))

(assert (=> b!1007854 (= lt!445405 (select (store (arr!30599 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007854 (= lt!445402 (array!63557 (store (arr!30599 a!3219) i!1194 k0!2224) (size!31101 a!3219)))))

(declare-fun res!676745 () Bool)

(assert (=> start!86908 (=> (not res!676745) (not e!567163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86908 (= res!676745 (validMask!0 mask!3464))))

(assert (=> start!86908 e!567163))

(declare-fun array_inv!23723 (array!63556) Bool)

(assert (=> start!86908 (array_inv!23723 a!3219)))

(assert (=> start!86908 true))

(declare-fun b!1007855 () Bool)

(declare-fun res!676739 () Bool)

(assert (=> b!1007855 (=> (not res!676739) (not e!567161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63556 (_ BitVec 32)) Bool)

(assert (=> b!1007855 (= res!676739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007856 () Bool)

(declare-fun res!676737 () Bool)

(assert (=> b!1007856 (=> (not res!676737) (not e!567163))))

(assert (=> b!1007856 (= res!676737 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86908 res!676745) b!1007843))

(assert (= (and b!1007843 res!676747) b!1007847))

(assert (= (and b!1007847 res!676744) b!1007856))

(assert (= (and b!1007856 res!676737) b!1007846))

(assert (= (and b!1007846 res!676738) b!1007848))

(assert (= (and b!1007848 res!676741) b!1007855))

(assert (= (and b!1007855 res!676739) b!1007853))

(assert (= (and b!1007853 res!676740) b!1007844))

(assert (= (and b!1007844 res!676748) b!1007850))

(assert (= (and b!1007850 res!676746) b!1007852))

(assert (= (and b!1007852 res!676749) b!1007854))

(assert (= (and b!1007854 res!676736) b!1007845))

(assert (= (and b!1007845 res!676743) b!1007849))

(assert (= (and b!1007849 res!676742) b!1007851))

(declare-fun m!932675 () Bool)

(assert (=> b!1007846 m!932675))

(declare-fun m!932677 () Bool)

(assert (=> b!1007850 m!932677))

(assert (=> b!1007850 m!932677))

(declare-fun m!932679 () Bool)

(assert (=> b!1007850 m!932679))

(assert (=> b!1007850 m!932679))

(assert (=> b!1007850 m!932677))

(declare-fun m!932681 () Bool)

(assert (=> b!1007850 m!932681))

(declare-fun m!932683 () Bool)

(assert (=> b!1007848 m!932683))

(declare-fun m!932685 () Bool)

(assert (=> b!1007845 m!932685))

(declare-fun m!932687 () Bool)

(assert (=> b!1007855 m!932687))

(declare-fun m!932689 () Bool)

(assert (=> b!1007856 m!932689))

(assert (=> b!1007852 m!932677))

(assert (=> b!1007852 m!932677))

(declare-fun m!932691 () Bool)

(assert (=> b!1007852 m!932691))

(declare-fun m!932693 () Bool)

(assert (=> start!86908 m!932693))

(declare-fun m!932695 () Bool)

(assert (=> start!86908 m!932695))

(declare-fun m!932697 () Bool)

(assert (=> b!1007853 m!932697))

(assert (=> b!1007847 m!932677))

(assert (=> b!1007847 m!932677))

(declare-fun m!932699 () Bool)

(assert (=> b!1007847 m!932699))

(declare-fun m!932701 () Bool)

(assert (=> b!1007851 m!932701))

(declare-fun m!932703 () Bool)

(assert (=> b!1007854 m!932703))

(assert (=> b!1007854 m!932703))

(declare-fun m!932705 () Bool)

(assert (=> b!1007854 m!932705))

(declare-fun m!932707 () Bool)

(assert (=> b!1007854 m!932707))

(declare-fun m!932709 () Bool)

(assert (=> b!1007854 m!932709))

(check-sat (not b!1007845) (not b!1007855) (not b!1007846) (not b!1007856) (not start!86908) (not b!1007853) (not b!1007854) (not b!1007851) (not b!1007847) (not b!1007850) (not b!1007852) (not b!1007848))
(check-sat)
