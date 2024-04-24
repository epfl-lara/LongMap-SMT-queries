; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28162 () Bool)

(assert start!28162)

(declare-fun b!288444 () Bool)

(declare-fun res!150047 () Bool)

(declare-fun e!182626 () Bool)

(assert (=> b!288444 (=> (not res!150047) (not e!182626))))

(declare-datatypes ((array!14481 0))(
  ( (array!14482 (arr!6868 (Array (_ BitVec 32) (_ BitVec 64))) (size!7220 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14481)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14481 (_ BitVec 32)) Bool)

(assert (=> b!288444 (= res!150047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288445 () Bool)

(declare-fun res!150046 () Bool)

(declare-fun e!182623 () Bool)

(assert (=> b!288445 (=> (not res!150046) (not e!182623))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288445 (= res!150046 (validKeyInArray!0 k0!2524))))

(declare-fun b!288446 () Bool)

(declare-fun res!150044 () Bool)

(assert (=> b!288446 (=> (not res!150044) (not e!182623))))

(declare-fun arrayContainsKey!0 (array!14481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288446 (= res!150044 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288447 () Bool)

(declare-fun e!182627 () Bool)

(assert (=> b!288447 (= e!182627 (not true))))

(declare-datatypes ((SeekEntryResult!1982 0))(
  ( (MissingZero!1982 (index!10098 (_ BitVec 32))) (Found!1982 (index!10099 (_ BitVec 32))) (Intermediate!1982 (undefined!2794 Bool) (index!10100 (_ BitVec 32)) (x!28427 (_ BitVec 32))) (Undefined!1982) (MissingVacant!1982 (index!10101 (_ BitVec 32))) )
))
(declare-fun lt!142111 () SeekEntryResult!1982)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288447 (and (= (select (arr!6868 a!3312) (index!10100 lt!142111)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10100 lt!142111) i!1256))))

(declare-fun res!150048 () Bool)

(assert (=> start!28162 (=> (not res!150048) (not e!182623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28162 (= res!150048 (validMask!0 mask!3809))))

(assert (=> start!28162 e!182623))

(assert (=> start!28162 true))

(declare-fun array_inv!4818 (array!14481) Bool)

(assert (=> start!28162 (array_inv!4818 a!3312)))

(declare-fun b!288448 () Bool)

(declare-fun e!182624 () Bool)

(assert (=> b!288448 (= e!182626 e!182624)))

(declare-fun res!150043 () Bool)

(assert (=> b!288448 (=> (not res!150043) (not e!182624))))

(declare-fun lt!142108 () Bool)

(assert (=> b!288448 (= res!150043 lt!142108)))

(declare-fun lt!142113 () (_ BitVec 32))

(declare-fun lt!142109 () SeekEntryResult!1982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14481 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!288448 (= lt!142109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142113 k0!2524 (array!14482 (store (arr!6868 a!3312) i!1256 k0!2524) (size!7220 a!3312)) mask!3809))))

(assert (=> b!288448 (= lt!142111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142113 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288448 (= lt!142113 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288449 () Bool)

(declare-fun res!150042 () Bool)

(assert (=> b!288449 (=> (not res!150042) (not e!182623))))

(assert (=> b!288449 (= res!150042 (and (= (size!7220 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7220 a!3312))))))

(declare-fun b!288450 () Bool)

(assert (=> b!288450 (= e!182623 e!182626)))

(declare-fun res!150041 () Bool)

(assert (=> b!288450 (=> (not res!150041) (not e!182626))))

(declare-fun lt!142112 () SeekEntryResult!1982)

(assert (=> b!288450 (= res!150041 (or lt!142108 (= lt!142112 (MissingVacant!1982 i!1256))))))

(assert (=> b!288450 (= lt!142108 (= lt!142112 (MissingZero!1982 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14481 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!288450 (= lt!142112 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288451 () Bool)

(assert (=> b!288451 (= e!182624 e!182627)))

(declare-fun res!150045 () Bool)

(assert (=> b!288451 (=> (not res!150045) (not e!182627))))

(declare-fun lt!142110 () Bool)

(assert (=> b!288451 (= res!150045 (and (or lt!142110 (not (undefined!2794 lt!142111))) (or lt!142110 (not (= (select (arr!6868 a!3312) (index!10100 lt!142111)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142110 (not (= (select (arr!6868 a!3312) (index!10100 lt!142111)) k0!2524))) (not lt!142110)))))

(get-info :version)

(assert (=> b!288451 (= lt!142110 (not ((_ is Intermediate!1982) lt!142111)))))

(assert (= (and start!28162 res!150048) b!288449))

(assert (= (and b!288449 res!150042) b!288445))

(assert (= (and b!288445 res!150046) b!288446))

(assert (= (and b!288446 res!150044) b!288450))

(assert (= (and b!288450 res!150041) b!288444))

(assert (= (and b!288444 res!150047) b!288448))

(assert (= (and b!288448 res!150043) b!288451))

(assert (= (and b!288451 res!150045) b!288447))

(declare-fun m!302837 () Bool)

(assert (=> b!288448 m!302837))

(declare-fun m!302839 () Bool)

(assert (=> b!288448 m!302839))

(declare-fun m!302841 () Bool)

(assert (=> b!288448 m!302841))

(declare-fun m!302843 () Bool)

(assert (=> b!288448 m!302843))

(declare-fun m!302845 () Bool)

(assert (=> b!288445 m!302845))

(declare-fun m!302847 () Bool)

(assert (=> b!288451 m!302847))

(assert (=> b!288447 m!302847))

(declare-fun m!302849 () Bool)

(assert (=> start!28162 m!302849))

(declare-fun m!302851 () Bool)

(assert (=> start!28162 m!302851))

(declare-fun m!302853 () Bool)

(assert (=> b!288444 m!302853))

(declare-fun m!302855 () Bool)

(assert (=> b!288450 m!302855))

(declare-fun m!302857 () Bool)

(assert (=> b!288446 m!302857))

(check-sat (not b!288446) (not b!288445) (not start!28162) (not b!288448) (not b!288444) (not b!288450))
(check-sat)
