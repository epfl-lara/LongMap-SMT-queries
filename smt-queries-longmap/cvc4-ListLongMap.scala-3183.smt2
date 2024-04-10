; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44728 () Bool)

(assert start!44728)

(declare-fun b!490920 () Bool)

(declare-fun res!293863 () Bool)

(declare-fun e!288521 () Bool)

(assert (=> b!490920 (=> (not res!293863) (not e!288521))))

(declare-datatypes ((array!31787 0))(
  ( (array!31788 (arr!15281 (Array (_ BitVec 32) (_ BitVec 64))) (size!15645 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31787)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490920 (= res!293863 (validKeyInArray!0 (select (arr!15281 a!3235) j!176)))))

(declare-fun b!490921 () Bool)

(declare-fun e!288520 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!490921 (= e!288520 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3748 0))(
  ( (MissingZero!3748 (index!17171 (_ BitVec 32))) (Found!3748 (index!17172 (_ BitVec 32))) (Intermediate!3748 (undefined!4560 Bool) (index!17173 (_ BitVec 32)) (x!46262 (_ BitVec 32))) (Undefined!3748) (MissingVacant!3748 (index!17174 (_ BitVec 32))) )
))
(declare-fun lt!221818 () SeekEntryResult!3748)

(declare-fun lt!221813 () array!31787)

(declare-fun lt!221815 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31787 (_ BitVec 32)) SeekEntryResult!3748)

(assert (=> b!490921 (= lt!221818 (seekEntryOrOpen!0 lt!221815 lt!221813 mask!3524))))

(declare-datatypes ((Unit!14442 0))(
  ( (Unit!14443) )
))
(declare-fun lt!221817 () Unit!14442)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14442)

(assert (=> b!490921 (= lt!221817 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490922 () Bool)

(declare-fun res!293864 () Bool)

(declare-fun e!288522 () Bool)

(assert (=> b!490922 (=> (not res!293864) (not e!288522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31787 (_ BitVec 32)) Bool)

(assert (=> b!490922 (= res!293864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490923 () Bool)

(assert (=> b!490923 (= e!288522 (not e!288520))))

(declare-fun res!293857 () Bool)

(assert (=> b!490923 (=> res!293857 e!288520)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31787 (_ BitVec 32)) SeekEntryResult!3748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490923 (= res!293857 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15281 a!3235) j!176) mask!3524) (select (arr!15281 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221815 mask!3524) lt!221815 lt!221813 mask!3524))))))

(assert (=> b!490923 (= lt!221815 (select (store (arr!15281 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490923 (= lt!221813 (array!31788 (store (arr!15281 a!3235) i!1204 k!2280) (size!15645 a!3235)))))

(assert (=> b!490923 (= lt!221818 (Found!3748 j!176))))

(assert (=> b!490923 (= lt!221818 (seekEntryOrOpen!0 (select (arr!15281 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490923 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221816 () Unit!14442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14442)

(assert (=> b!490923 (= lt!221816 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490924 () Bool)

(assert (=> b!490924 (= e!288521 e!288522)))

(declare-fun res!293859 () Bool)

(assert (=> b!490924 (=> (not res!293859) (not e!288522))))

(declare-fun lt!221814 () SeekEntryResult!3748)

(assert (=> b!490924 (= res!293859 (or (= lt!221814 (MissingZero!3748 i!1204)) (= lt!221814 (MissingVacant!3748 i!1204))))))

(assert (=> b!490924 (= lt!221814 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!293861 () Bool)

(assert (=> start!44728 (=> (not res!293861) (not e!288521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44728 (= res!293861 (validMask!0 mask!3524))))

(assert (=> start!44728 e!288521))

(assert (=> start!44728 true))

(declare-fun array_inv!11077 (array!31787) Bool)

(assert (=> start!44728 (array_inv!11077 a!3235)))

(declare-fun b!490925 () Bool)

(declare-fun res!293858 () Bool)

(assert (=> b!490925 (=> (not res!293858) (not e!288521))))

(declare-fun arrayContainsKey!0 (array!31787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490925 (= res!293858 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490926 () Bool)

(declare-fun res!293862 () Bool)

(assert (=> b!490926 (=> (not res!293862) (not e!288521))))

(assert (=> b!490926 (= res!293862 (validKeyInArray!0 k!2280))))

(declare-fun b!490927 () Bool)

(declare-fun res!293860 () Bool)

(assert (=> b!490927 (=> (not res!293860) (not e!288522))))

(declare-datatypes ((List!9439 0))(
  ( (Nil!9436) (Cons!9435 (h!10297 (_ BitVec 64)) (t!15667 List!9439)) )
))
(declare-fun arrayNoDuplicates!0 (array!31787 (_ BitVec 32) List!9439) Bool)

(assert (=> b!490927 (= res!293860 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9436))))

(declare-fun b!490928 () Bool)

(declare-fun res!293856 () Bool)

(assert (=> b!490928 (=> (not res!293856) (not e!288521))))

(assert (=> b!490928 (= res!293856 (and (= (size!15645 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15645 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15645 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44728 res!293861) b!490928))

(assert (= (and b!490928 res!293856) b!490920))

(assert (= (and b!490920 res!293863) b!490926))

(assert (= (and b!490926 res!293862) b!490925))

(assert (= (and b!490925 res!293858) b!490924))

(assert (= (and b!490924 res!293859) b!490922))

(assert (= (and b!490922 res!293864) b!490927))

(assert (= (and b!490927 res!293860) b!490923))

(assert (= (and b!490923 (not res!293857)) b!490921))

(declare-fun m!471257 () Bool)

(assert (=> b!490927 m!471257))

(declare-fun m!471259 () Bool)

(assert (=> b!490923 m!471259))

(declare-fun m!471261 () Bool)

(assert (=> b!490923 m!471261))

(declare-fun m!471263 () Bool)

(assert (=> b!490923 m!471263))

(declare-fun m!471265 () Bool)

(assert (=> b!490923 m!471265))

(declare-fun m!471267 () Bool)

(assert (=> b!490923 m!471267))

(declare-fun m!471269 () Bool)

(assert (=> b!490923 m!471269))

(declare-fun m!471271 () Bool)

(assert (=> b!490923 m!471271))

(assert (=> b!490923 m!471259))

(declare-fun m!471273 () Bool)

(assert (=> b!490923 m!471273))

(assert (=> b!490923 m!471269))

(assert (=> b!490923 m!471267))

(assert (=> b!490923 m!471269))

(declare-fun m!471275 () Bool)

(assert (=> b!490923 m!471275))

(assert (=> b!490923 m!471269))

(declare-fun m!471277 () Bool)

(assert (=> b!490923 m!471277))

(declare-fun m!471279 () Bool)

(assert (=> b!490921 m!471279))

(declare-fun m!471281 () Bool)

(assert (=> b!490921 m!471281))

(declare-fun m!471283 () Bool)

(assert (=> b!490924 m!471283))

(declare-fun m!471285 () Bool)

(assert (=> b!490925 m!471285))

(declare-fun m!471287 () Bool)

(assert (=> start!44728 m!471287))

(declare-fun m!471289 () Bool)

(assert (=> start!44728 m!471289))

(declare-fun m!471291 () Bool)

(assert (=> b!490922 m!471291))

(assert (=> b!490920 m!471269))

(assert (=> b!490920 m!471269))

(declare-fun m!471293 () Bool)

(assert (=> b!490920 m!471293))

(declare-fun m!471295 () Bool)

(assert (=> b!490926 m!471295))

(push 1)

