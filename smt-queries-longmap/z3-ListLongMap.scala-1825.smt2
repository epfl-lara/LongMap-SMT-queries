; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33006 () Bool)

(assert start!33006)

(declare-fun b!328717 () Bool)

(declare-fun res!181044 () Bool)

(declare-fun e!202051 () Bool)

(assert (=> b!328717 (=> (not res!181044) (not e!202051))))

(declare-datatypes ((array!16812 0))(
  ( (array!16813 (arr!7953 (Array (_ BitVec 32) (_ BitVec 64))) (size!8305 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16812)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328717 (= res!181044 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328718 () Bool)

(declare-fun res!181048 () Bool)

(assert (=> b!328718 (=> (not res!181048) (not e!202051))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328718 (= res!181048 (and (= (select (arr!7953 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8305 a!3305))))))

(declare-fun res!181043 () Bool)

(assert (=> start!33006 (=> (not res!181043) (not e!202051))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33006 (= res!181043 (validMask!0 mask!3777))))

(assert (=> start!33006 e!202051))

(declare-fun array_inv!5916 (array!16812) Bool)

(assert (=> start!33006 (array_inv!5916 a!3305)))

(assert (=> start!33006 true))

(declare-fun b!328719 () Bool)

(declare-fun res!181049 () Bool)

(assert (=> b!328719 (=> (not res!181049) (not e!202051))))

(assert (=> b!328719 (= res!181049 (and (= (size!8305 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8305 a!3305))))))

(declare-fun b!328720 () Bool)

(declare-fun res!181045 () Bool)

(assert (=> b!328720 (=> (not res!181045) (not e!202051))))

(declare-datatypes ((SeekEntryResult!3084 0))(
  ( (MissingZero!3084 (index!14512 (_ BitVec 32))) (Found!3084 (index!14513 (_ BitVec 32))) (Intermediate!3084 (undefined!3896 Bool) (index!14514 (_ BitVec 32)) (x!32779 (_ BitVec 32))) (Undefined!3084) (MissingVacant!3084 (index!14515 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16812 (_ BitVec 32)) SeekEntryResult!3084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328720 (= res!181045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!3084 false resIndex!58 resX!58)))))

(declare-fun b!328721 () Bool)

(assert (=> b!328721 (= e!202051 false)))

(declare-fun lt!158016 () SeekEntryResult!3084)

(assert (=> b!328721 (= lt!158016 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!328722 () Bool)

(declare-fun res!181046 () Bool)

(assert (=> b!328722 (=> (not res!181046) (not e!202051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16812 (_ BitVec 32)) Bool)

(assert (=> b!328722 (= res!181046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328723 () Bool)

(declare-fun res!181047 () Bool)

(assert (=> b!328723 (=> (not res!181047) (not e!202051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328723 (= res!181047 (validKeyInArray!0 k0!2497))))

(declare-fun b!328724 () Bool)

(declare-fun res!181050 () Bool)

(assert (=> b!328724 (=> (not res!181050) (not e!202051))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16812 (_ BitVec 32)) SeekEntryResult!3084)

(assert (=> b!328724 (= res!181050 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3084 i!1250)))))

(assert (= (and start!33006 res!181043) b!328719))

(assert (= (and b!328719 res!181049) b!328723))

(assert (= (and b!328723 res!181047) b!328717))

(assert (= (and b!328717 res!181044) b!328724))

(assert (= (and b!328724 res!181050) b!328722))

(assert (= (and b!328722 res!181046) b!328720))

(assert (= (and b!328720 res!181045) b!328718))

(assert (= (and b!328718 res!181048) b!328721))

(declare-fun m!334585 () Bool)

(assert (=> b!328722 m!334585))

(declare-fun m!334587 () Bool)

(assert (=> b!328724 m!334587))

(declare-fun m!334589 () Bool)

(assert (=> b!328720 m!334589))

(assert (=> b!328720 m!334589))

(declare-fun m!334591 () Bool)

(assert (=> b!328720 m!334591))

(declare-fun m!334593 () Bool)

(assert (=> b!328723 m!334593))

(declare-fun m!334595 () Bool)

(assert (=> b!328717 m!334595))

(declare-fun m!334597 () Bool)

(assert (=> b!328718 m!334597))

(declare-fun m!334599 () Bool)

(assert (=> start!33006 m!334599))

(declare-fun m!334601 () Bool)

(assert (=> start!33006 m!334601))

(declare-fun m!334603 () Bool)

(assert (=> b!328721 m!334603))

(check-sat (not start!33006) (not b!328723) (not b!328722) (not b!328720) (not b!328717) (not b!328724) (not b!328721))
