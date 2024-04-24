; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48220 () Bool)

(assert start!48220)

(declare-fun b!530851 () Bool)

(declare-fun e!309211 () Bool)

(declare-fun e!309212 () Bool)

(assert (=> b!530851 (= e!309211 e!309212)))

(declare-fun res!326617 () Bool)

(assert (=> b!530851 (=> (not res!326617) (not e!309212))))

(declare-datatypes ((SeekEntryResult!4582 0))(
  ( (MissingZero!4582 (index!20552 (_ BitVec 32))) (Found!4582 (index!20553 (_ BitVec 32))) (Intermediate!4582 (undefined!5394 Bool) (index!20554 (_ BitVec 32)) (x!49681 (_ BitVec 32))) (Undefined!4582) (MissingVacant!4582 (index!20555 (_ BitVec 32))) )
))
(declare-fun lt!244834 () SeekEntryResult!4582)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530851 (= res!326617 (or (= lt!244834 (MissingZero!4582 i!1153)) (= lt!244834 (MissingVacant!4582 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33644 0))(
  ( (array!33645 (arr!16168 (Array (_ BitVec 32) (_ BitVec 64))) (size!16532 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33644)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33644 (_ BitVec 32)) SeekEntryResult!4582)

(assert (=> b!530851 (= lt!244834 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!326613 () Bool)

(assert (=> start!48220 (=> (not res!326613) (not e!309211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48220 (= res!326613 (validMask!0 mask!3216))))

(assert (=> start!48220 e!309211))

(assert (=> start!48220 true))

(declare-fun array_inv!12027 (array!33644) Bool)

(assert (=> start!48220 (array_inv!12027 a!3154)))

(declare-fun b!530852 () Bool)

(declare-fun res!326612 () Bool)

(assert (=> b!530852 (=> (not res!326612) (not e!309212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33644 (_ BitVec 32)) Bool)

(assert (=> b!530852 (= res!326612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530853 () Bool)

(declare-fun res!326611 () Bool)

(assert (=> b!530853 (=> (not res!326611) (not e!309211))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530853 (= res!326611 (validKeyInArray!0 (select (arr!16168 a!3154) j!147)))))

(declare-fun b!530854 () Bool)

(declare-fun res!326615 () Bool)

(assert (=> b!530854 (=> (not res!326615) (not e!309211))))

(assert (=> b!530854 (= res!326615 (and (= (size!16532 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16532 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16532 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530855 () Bool)

(declare-fun res!326614 () Bool)

(assert (=> b!530855 (=> (not res!326614) (not e!309211))))

(assert (=> b!530855 (= res!326614 (validKeyInArray!0 k0!1998))))

(declare-fun b!530856 () Bool)

(assert (=> b!530856 (= e!309212 (bvsgt #b00000000000000000000000000000000 (size!16532 a!3154)))))

(declare-fun b!530857 () Bool)

(declare-fun res!326616 () Bool)

(assert (=> b!530857 (=> (not res!326616) (not e!309211))))

(declare-fun arrayContainsKey!0 (array!33644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530857 (= res!326616 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48220 res!326613) b!530854))

(assert (= (and b!530854 res!326615) b!530853))

(assert (= (and b!530853 res!326611) b!530855))

(assert (= (and b!530855 res!326614) b!530857))

(assert (= (and b!530857 res!326616) b!530851))

(assert (= (and b!530851 res!326617) b!530852))

(assert (= (and b!530852 res!326612) b!530856))

(declare-fun m!511633 () Bool)

(assert (=> b!530852 m!511633))

(declare-fun m!511635 () Bool)

(assert (=> b!530851 m!511635))

(declare-fun m!511637 () Bool)

(assert (=> b!530855 m!511637))

(declare-fun m!511639 () Bool)

(assert (=> b!530857 m!511639))

(declare-fun m!511641 () Bool)

(assert (=> b!530853 m!511641))

(assert (=> b!530853 m!511641))

(declare-fun m!511643 () Bool)

(assert (=> b!530853 m!511643))

(declare-fun m!511645 () Bool)

(assert (=> start!48220 m!511645))

(declare-fun m!511647 () Bool)

(assert (=> start!48220 m!511647))

(check-sat (not b!530853) (not b!530855) (not b!530852) (not start!48220) (not b!530851) (not b!530857))
(check-sat)
