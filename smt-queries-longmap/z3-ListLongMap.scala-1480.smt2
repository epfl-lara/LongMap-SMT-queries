; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28268 () Bool)

(assert start!28268)

(declare-fun res!151176 () Bool)

(declare-fun e!183357 () Bool)

(assert (=> start!28268 (=> (not res!151176) (not e!183357))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28268 (= res!151176 (validMask!0 mask!3809))))

(assert (=> start!28268 e!183357))

(assert (=> start!28268 true))

(declare-datatypes ((array!14582 0))(
  ( (array!14583 (arr!6918 (Array (_ BitVec 32) (_ BitVec 64))) (size!7270 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14582)

(declare-fun array_inv!4881 (array!14582) Bool)

(assert (=> start!28268 (array_inv!4881 a!3312)))

(declare-fun b!289642 () Bool)

(declare-fun res!151173 () Bool)

(assert (=> b!289642 (=> (not res!151173) (not e!183357))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289642 (= res!151173 (validKeyInArray!0 k0!2524))))

(declare-datatypes ((SeekEntryResult!2067 0))(
  ( (MissingZero!2067 (index!10438 (_ BitVec 32))) (Found!2067 (index!10439 (_ BitVec 32))) (Intermediate!2067 (undefined!2879 Bool) (index!10440 (_ BitVec 32)) (x!28640 (_ BitVec 32))) (Undefined!2067) (MissingVacant!2067 (index!10441 (_ BitVec 32))) )
))
(declare-fun lt!142955 () SeekEntryResult!2067)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142954 () SeekEntryResult!2067)

(declare-fun b!289643 () Bool)

(assert (=> b!289643 (and (= lt!142955 lt!142954) (= (select (store (arr!6918 a!3312) i!1256 k0!2524) (index!10440 lt!142954)) k0!2524))))

(declare-fun lt!142956 () (_ BitVec 32))

(declare-datatypes ((Unit!9115 0))(
  ( (Unit!9116) )
))
(declare-fun lt!142957 () Unit!9115)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9115)

(assert (=> b!289643 (= lt!142957 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142956 (index!10440 lt!142954) (x!28640 lt!142954) mask!3809))))

(assert (=> b!289643 (and (= (select (arr!6918 a!3312) (index!10440 lt!142954)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10440 lt!142954) i!1256))))

(declare-fun e!183361 () Unit!9115)

(declare-fun Unit!9117 () Unit!9115)

(assert (=> b!289643 (= e!183361 Unit!9117)))

(declare-fun b!289644 () Bool)

(declare-fun res!151177 () Bool)

(assert (=> b!289644 (=> (not res!151177) (not e!183357))))

(declare-fun arrayContainsKey!0 (array!14582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289644 (= res!151177 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289645 () Bool)

(declare-fun res!151174 () Bool)

(declare-fun e!183360 () Bool)

(assert (=> b!289645 (=> (not res!151174) (not e!183360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14582 (_ BitVec 32)) Bool)

(assert (=> b!289645 (= res!151174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289646 () Bool)

(declare-fun e!183362 () Unit!9115)

(declare-fun Unit!9118 () Unit!9115)

(assert (=> b!289646 (= e!183362 Unit!9118)))

(assert (=> b!289646 false))

(declare-fun b!289647 () Bool)

(declare-fun e!183359 () Bool)

(assert (=> b!289647 (= e!183359 false)))

(declare-fun lt!142958 () Unit!9115)

(assert (=> b!289647 (= lt!142958 e!183362)))

(declare-fun c!46797 () Bool)

(get-info :version)

(assert (=> b!289647 (= c!46797 (or (and ((_ is Intermediate!2067) lt!142954) (undefined!2879 lt!142954)) (and ((_ is Intermediate!2067) lt!142954) (= (select (arr!6918 a!3312) (index!10440 lt!142954)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2067) lt!142954) (= (select (arr!6918 a!3312) (index!10440 lt!142954)) k0!2524))))))

(declare-fun b!289648 () Bool)

(assert (=> b!289648 false))

(declare-fun Unit!9119 () Unit!9115)

(assert (=> b!289648 (= e!183361 Unit!9119)))

(declare-fun b!289649 () Bool)

(assert (=> b!289649 (= e!183360 e!183359)))

(declare-fun res!151178 () Bool)

(assert (=> b!289649 (=> (not res!151178) (not e!183359))))

(declare-fun lt!142960 () Bool)

(assert (=> b!289649 (= res!151178 lt!142960)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14582 (_ BitVec 32)) SeekEntryResult!2067)

(assert (=> b!289649 (= lt!142955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142956 k0!2524 (array!14583 (store (arr!6918 a!3312) i!1256 k0!2524) (size!7270 a!3312)) mask!3809))))

(assert (=> b!289649 (= lt!142954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142956 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289649 (= lt!142956 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289650 () Bool)

(declare-fun res!151175 () Bool)

(assert (=> b!289650 (=> (not res!151175) (not e!183357))))

(assert (=> b!289650 (= res!151175 (and (= (size!7270 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7270 a!3312))))))

(declare-fun b!289651 () Bool)

(assert (=> b!289651 (= e!183362 e!183361)))

(declare-fun c!46796 () Bool)

(assert (=> b!289651 (= c!46796 ((_ is Intermediate!2067) lt!142954))))

(declare-fun b!289652 () Bool)

(assert (=> b!289652 (= e!183357 e!183360)))

(declare-fun res!151179 () Bool)

(assert (=> b!289652 (=> (not res!151179) (not e!183360))))

(declare-fun lt!142959 () SeekEntryResult!2067)

(assert (=> b!289652 (= res!151179 (or lt!142960 (= lt!142959 (MissingVacant!2067 i!1256))))))

(assert (=> b!289652 (= lt!142960 (= lt!142959 (MissingZero!2067 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14582 (_ BitVec 32)) SeekEntryResult!2067)

(assert (=> b!289652 (= lt!142959 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28268 res!151176) b!289650))

(assert (= (and b!289650 res!151175) b!289642))

(assert (= (and b!289642 res!151173) b!289644))

(assert (= (and b!289644 res!151177) b!289652))

(assert (= (and b!289652 res!151179) b!289645))

(assert (= (and b!289645 res!151174) b!289649))

(assert (= (and b!289649 res!151178) b!289647))

(assert (= (and b!289647 c!46797) b!289646))

(assert (= (and b!289647 (not c!46797)) b!289651))

(assert (= (and b!289651 c!46796) b!289643))

(assert (= (and b!289651 (not c!46796)) b!289648))

(declare-fun m!303737 () Bool)

(assert (=> b!289647 m!303737))

(declare-fun m!303739 () Bool)

(assert (=> b!289642 m!303739))

(declare-fun m!303741 () Bool)

(assert (=> b!289645 m!303741))

(declare-fun m!303743 () Bool)

(assert (=> b!289652 m!303743))

(declare-fun m!303745 () Bool)

(assert (=> b!289644 m!303745))

(declare-fun m!303747 () Bool)

(assert (=> start!28268 m!303747))

(declare-fun m!303749 () Bool)

(assert (=> start!28268 m!303749))

(declare-fun m!303751 () Bool)

(assert (=> b!289649 m!303751))

(declare-fun m!303753 () Bool)

(assert (=> b!289649 m!303753))

(declare-fun m!303755 () Bool)

(assert (=> b!289649 m!303755))

(declare-fun m!303757 () Bool)

(assert (=> b!289649 m!303757))

(assert (=> b!289643 m!303751))

(declare-fun m!303759 () Bool)

(assert (=> b!289643 m!303759))

(declare-fun m!303761 () Bool)

(assert (=> b!289643 m!303761))

(assert (=> b!289643 m!303737))

(check-sat (not b!289643) (not b!289644) (not b!289645) (not b!289649) (not b!289642) (not b!289652) (not start!28268))
(check-sat)
