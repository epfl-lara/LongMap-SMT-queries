; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29140 () Bool)

(assert start!29140)

(declare-fun b!295630 () Bool)

(declare-fun res!155445 () Bool)

(declare-fun e!186854 () Bool)

(assert (=> b!295630 (=> (not res!155445) (not e!186854))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295630 (= res!155445 (validKeyInArray!0 k!2524))))

(declare-fun b!295631 () Bool)

(declare-fun res!155440 () Bool)

(assert (=> b!295631 (=> (not res!155440) (not e!186854))))

(declare-datatypes ((array!14943 0))(
  ( (array!14944 (arr!7082 (Array (_ BitVec 32) (_ BitVec 64))) (size!7434 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14943)

(declare-fun arrayContainsKey!0 (array!14943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295631 (= res!155440 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295632 () Bool)

(declare-fun e!186856 () Bool)

(declare-fun e!186853 () Bool)

(assert (=> b!295632 (= e!186856 e!186853)))

(declare-fun res!155444 () Bool)

(assert (=> b!295632 (=> (not res!155444) (not e!186853))))

(declare-fun lt!146613 () Bool)

(declare-datatypes ((SeekEntryResult!2231 0))(
  ( (MissingZero!2231 (index!11094 (_ BitVec 32))) (Found!2231 (index!11095 (_ BitVec 32))) (Intermediate!2231 (undefined!3043 Bool) (index!11096 (_ BitVec 32)) (x!29315 (_ BitVec 32))) (Undefined!2231) (MissingVacant!2231 (index!11097 (_ BitVec 32))) )
))
(declare-fun lt!146612 () SeekEntryResult!2231)

(assert (=> b!295632 (= res!155444 (and (or lt!146613 (not (undefined!3043 lt!146612))) (or lt!146613 (not (= (select (arr!7082 a!3312) (index!11096 lt!146612)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146613 (not (= (select (arr!7082 a!3312) (index!11096 lt!146612)) k!2524))) (not lt!146613)))))

(assert (=> b!295632 (= lt!146613 (not (is-Intermediate!2231 lt!146612)))))

(declare-fun res!155442 () Bool)

(assert (=> start!29140 (=> (not res!155442) (not e!186854))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29140 (= res!155442 (validMask!0 mask!3809))))

(assert (=> start!29140 e!186854))

(assert (=> start!29140 true))

(declare-fun array_inv!5045 (array!14943) Bool)

(assert (=> start!29140 (array_inv!5045 a!3312)))

(declare-fun b!295633 () Bool)

(declare-fun res!155441 () Bool)

(declare-fun e!186855 () Bool)

(assert (=> b!295633 (=> (not res!155441) (not e!186855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14943 (_ BitVec 32)) Bool)

(assert (=> b!295633 (= res!155441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295634 () Bool)

(assert (=> b!295634 (= e!186854 e!186855)))

(declare-fun res!155439 () Bool)

(assert (=> b!295634 (=> (not res!155439) (not e!186855))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146609 () SeekEntryResult!2231)

(declare-fun lt!146610 () Bool)

(assert (=> b!295634 (= res!155439 (or lt!146610 (= lt!146609 (MissingVacant!2231 i!1256))))))

(assert (=> b!295634 (= lt!146610 (= lt!146609 (MissingZero!2231 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14943 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!295634 (= lt!146609 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295635 () Bool)

(assert (=> b!295635 (= e!186855 e!186856)))

(declare-fun res!155443 () Bool)

(assert (=> b!295635 (=> (not res!155443) (not e!186856))))

(assert (=> b!295635 (= res!155443 lt!146610)))

(declare-fun lt!146608 () (_ BitVec 32))

(declare-fun lt!146611 () SeekEntryResult!2231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14943 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!295635 (= lt!146611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146608 k!2524 (array!14944 (store (arr!7082 a!3312) i!1256 k!2524) (size!7434 a!3312)) mask!3809))))

(assert (=> b!295635 (= lt!146612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146608 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295635 (= lt!146608 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295636 () Bool)

(declare-fun res!155438 () Bool)

(assert (=> b!295636 (=> (not res!155438) (not e!186854))))

(assert (=> b!295636 (= res!155438 (and (= (size!7434 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7434 a!3312))))))

(declare-fun b!295637 () Bool)

(assert (=> b!295637 (= e!186853 (not true))))

(assert (=> b!295637 (and (= (select (arr!7082 a!3312) (index!11096 lt!146612)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11096 lt!146612) i!1256))))

(assert (= (and start!29140 res!155442) b!295636))

(assert (= (and b!295636 res!155438) b!295630))

(assert (= (and b!295630 res!155445) b!295631))

(assert (= (and b!295631 res!155440) b!295634))

(assert (= (and b!295634 res!155439) b!295633))

(assert (= (and b!295633 res!155441) b!295635))

(assert (= (and b!295635 res!155443) b!295632))

(assert (= (and b!295632 res!155444) b!295637))

(declare-fun m!308721 () Bool)

(assert (=> b!295631 m!308721))

(declare-fun m!308723 () Bool)

(assert (=> b!295630 m!308723))

(declare-fun m!308725 () Bool)

(assert (=> start!29140 m!308725))

(declare-fun m!308727 () Bool)

(assert (=> start!29140 m!308727))

(declare-fun m!308729 () Bool)

(assert (=> b!295637 m!308729))

(declare-fun m!308731 () Bool)

(assert (=> b!295634 m!308731))

(declare-fun m!308733 () Bool)

(assert (=> b!295635 m!308733))

(declare-fun m!308735 () Bool)

(assert (=> b!295635 m!308735))

(declare-fun m!308737 () Bool)

(assert (=> b!295635 m!308737))

(declare-fun m!308739 () Bool)

(assert (=> b!295635 m!308739))

(declare-fun m!308741 () Bool)

(assert (=> b!295633 m!308741))

(assert (=> b!295632 m!308729))

(push 1)

