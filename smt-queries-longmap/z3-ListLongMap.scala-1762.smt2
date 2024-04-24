; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32204 () Bool)

(assert start!32204)

(declare-fun b!320767 () Bool)

(declare-fun res!174940 () Bool)

(declare-fun e!198954 () Bool)

(assert (=> b!320767 (=> (not res!174940) (not e!198954))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320767 (= res!174940 (validKeyInArray!0 k0!2497))))

(declare-fun b!320768 () Bool)

(declare-fun e!198952 () Bool)

(assert (=> b!320768 (= e!198954 e!198952)))

(declare-fun res!174944 () Bool)

(assert (=> b!320768 (=> (not res!174944) (not e!198952))))

(declare-datatypes ((array!16407 0))(
  ( (array!16408 (arr!7762 (Array (_ BitVec 32) (_ BitVec 64))) (size!8114 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16407)

(declare-datatypes ((SeekEntryResult!2858 0))(
  ( (MissingZero!2858 (index!13608 (_ BitVec 32))) (Found!2858 (index!13609 (_ BitVec 32))) (Intermediate!2858 (undefined!3670 Bool) (index!13610 (_ BitVec 32)) (x!31986 (_ BitVec 32))) (Undefined!2858) (MissingVacant!2858 (index!13611 (_ BitVec 32))) )
))
(declare-fun lt!156141 () SeekEntryResult!2858)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16407 (_ BitVec 32)) SeekEntryResult!2858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320768 (= res!174944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156141))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320768 (= lt!156141 (Intermediate!2858 false resIndex!58 resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!320769 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320769 (= e!198952 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7762 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7762 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7762 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320770 () Bool)

(declare-fun res!174937 () Bool)

(assert (=> b!320770 (=> (not res!174937) (not e!198954))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16407 (_ BitVec 32)) SeekEntryResult!2858)

(assert (=> b!320770 (= res!174937 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2858 i!1250)))))

(declare-fun b!320771 () Bool)

(declare-fun res!174938 () Bool)

(assert (=> b!320771 (=> (not res!174938) (not e!198954))))

(declare-fun arrayContainsKey!0 (array!16407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320771 (= res!174938 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320773 () Bool)

(declare-fun res!174939 () Bool)

(assert (=> b!320773 (=> (not res!174939) (not e!198954))))

(assert (=> b!320773 (= res!174939 (and (= (size!8114 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8114 a!3305))))))

(declare-fun b!320774 () Bool)

(declare-fun res!174941 () Bool)

(assert (=> b!320774 (=> (not res!174941) (not e!198952))))

(assert (=> b!320774 (= res!174941 (and (= (select (arr!7762 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8114 a!3305))))))

(declare-fun b!320775 () Bool)

(declare-fun res!174943 () Bool)

(assert (=> b!320775 (=> (not res!174943) (not e!198954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16407 (_ BitVec 32)) Bool)

(assert (=> b!320775 (= res!174943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320772 () Bool)

(declare-fun res!174945 () Bool)

(assert (=> b!320772 (=> (not res!174945) (not e!198952))))

(assert (=> b!320772 (= res!174945 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156141))))

(declare-fun res!174942 () Bool)

(assert (=> start!32204 (=> (not res!174942) (not e!198954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32204 (= res!174942 (validMask!0 mask!3777))))

(assert (=> start!32204 e!198954))

(declare-fun array_inv!5712 (array!16407) Bool)

(assert (=> start!32204 (array_inv!5712 a!3305)))

(assert (=> start!32204 true))

(assert (= (and start!32204 res!174942) b!320773))

(assert (= (and b!320773 res!174939) b!320767))

(assert (= (and b!320767 res!174940) b!320771))

(assert (= (and b!320771 res!174938) b!320770))

(assert (= (and b!320770 res!174937) b!320775))

(assert (= (and b!320775 res!174943) b!320768))

(assert (= (and b!320768 res!174944) b!320774))

(assert (= (and b!320774 res!174941) b!320772))

(assert (= (and b!320772 res!174945) b!320769))

(declare-fun m!329251 () Bool)

(assert (=> b!320775 m!329251))

(declare-fun m!329253 () Bool)

(assert (=> b!320768 m!329253))

(assert (=> b!320768 m!329253))

(declare-fun m!329255 () Bool)

(assert (=> b!320768 m!329255))

(declare-fun m!329257 () Bool)

(assert (=> b!320771 m!329257))

(declare-fun m!329259 () Bool)

(assert (=> b!320767 m!329259))

(declare-fun m!329261 () Bool)

(assert (=> b!320770 m!329261))

(declare-fun m!329263 () Bool)

(assert (=> b!320774 m!329263))

(declare-fun m!329265 () Bool)

(assert (=> start!32204 m!329265))

(declare-fun m!329267 () Bool)

(assert (=> start!32204 m!329267))

(declare-fun m!329269 () Bool)

(assert (=> b!320772 m!329269))

(declare-fun m!329271 () Bool)

(assert (=> b!320769 m!329271))

(check-sat (not b!320770) (not b!320775) (not b!320771) (not b!320772) (not b!320767) (not start!32204) (not b!320768))
(check-sat)
