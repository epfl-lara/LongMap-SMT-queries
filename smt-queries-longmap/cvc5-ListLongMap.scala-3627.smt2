; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50048 () Bool)

(assert start!50048)

(declare-fun res!341723 () Bool)

(declare-fun e!316844 () Bool)

(assert (=> start!50048 (=> (not res!341723) (not e!316844))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50048 (= res!341723 (validMask!0 mask!3119))))

(assert (=> start!50048 e!316844))

(assert (=> start!50048 true))

(declare-datatypes ((array!34585 0))(
  ( (array!34586 (arr!16611 (Array (_ BitVec 32) (_ BitVec 64))) (size!16975 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34585)

(declare-fun array_inv!12407 (array!34585) Bool)

(assert (=> start!50048 (array_inv!12407 a!3118)))

(declare-fun b!548398 () Bool)

(declare-fun res!341719 () Bool)

(assert (=> b!548398 (=> (not res!341719) (not e!316844))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548398 (= res!341719 (validKeyInArray!0 (select (arr!16611 a!3118) j!142)))))

(declare-fun b!548399 () Bool)

(declare-fun res!341726 () Bool)

(assert (=> b!548399 (=> (not res!341726) (not e!316844))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!548399 (= res!341726 (validKeyInArray!0 k!1914))))

(declare-fun b!548400 () Bool)

(declare-fun e!316843 () Bool)

(assert (=> b!548400 (= e!316843 false)))

(declare-fun lt!249831 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548400 (= lt!249831 (toIndex!0 (select (arr!16611 a!3118) j!142) mask!3119))))

(declare-fun b!548401 () Bool)

(declare-fun res!341724 () Bool)

(assert (=> b!548401 (=> (not res!341724) (not e!316844))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548401 (= res!341724 (and (= (size!16975 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16975 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16975 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548402 () Bool)

(declare-fun res!341722 () Bool)

(assert (=> b!548402 (=> (not res!341722) (not e!316844))))

(declare-fun arrayContainsKey!0 (array!34585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548402 (= res!341722 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548403 () Bool)

(assert (=> b!548403 (= e!316844 e!316843)))

(declare-fun res!341725 () Bool)

(assert (=> b!548403 (=> (not res!341725) (not e!316843))))

(declare-datatypes ((SeekEntryResult!5060 0))(
  ( (MissingZero!5060 (index!22467 (_ BitVec 32))) (Found!5060 (index!22468 (_ BitVec 32))) (Intermediate!5060 (undefined!5872 Bool) (index!22469 (_ BitVec 32)) (x!51411 (_ BitVec 32))) (Undefined!5060) (MissingVacant!5060 (index!22470 (_ BitVec 32))) )
))
(declare-fun lt!249832 () SeekEntryResult!5060)

(assert (=> b!548403 (= res!341725 (or (= lt!249832 (MissingZero!5060 i!1132)) (= lt!249832 (MissingVacant!5060 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34585 (_ BitVec 32)) SeekEntryResult!5060)

(assert (=> b!548403 (= lt!249832 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548404 () Bool)

(declare-fun res!341720 () Bool)

(assert (=> b!548404 (=> (not res!341720) (not e!316843))))

(declare-datatypes ((List!10691 0))(
  ( (Nil!10688) (Cons!10687 (h!11657 (_ BitVec 64)) (t!16919 List!10691)) )
))
(declare-fun arrayNoDuplicates!0 (array!34585 (_ BitVec 32) List!10691) Bool)

(assert (=> b!548404 (= res!341720 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10688))))

(declare-fun b!548405 () Bool)

(declare-fun res!341721 () Bool)

(assert (=> b!548405 (=> (not res!341721) (not e!316843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34585 (_ BitVec 32)) Bool)

(assert (=> b!548405 (= res!341721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50048 res!341723) b!548401))

(assert (= (and b!548401 res!341724) b!548398))

(assert (= (and b!548398 res!341719) b!548399))

(assert (= (and b!548399 res!341726) b!548402))

(assert (= (and b!548402 res!341722) b!548403))

(assert (= (and b!548403 res!341725) b!548405))

(assert (= (and b!548405 res!341721) b!548404))

(assert (= (and b!548404 res!341720) b!548400))

(declare-fun m!525423 () Bool)

(assert (=> b!548400 m!525423))

(assert (=> b!548400 m!525423))

(declare-fun m!525425 () Bool)

(assert (=> b!548400 m!525425))

(declare-fun m!525427 () Bool)

(assert (=> start!50048 m!525427))

(declare-fun m!525429 () Bool)

(assert (=> start!50048 m!525429))

(declare-fun m!525431 () Bool)

(assert (=> b!548405 m!525431))

(declare-fun m!525433 () Bool)

(assert (=> b!548399 m!525433))

(assert (=> b!548398 m!525423))

(assert (=> b!548398 m!525423))

(declare-fun m!525435 () Bool)

(assert (=> b!548398 m!525435))

(declare-fun m!525437 () Bool)

(assert (=> b!548404 m!525437))

(declare-fun m!525439 () Bool)

(assert (=> b!548403 m!525439))

(declare-fun m!525441 () Bool)

(assert (=> b!548402 m!525441))

(push 1)

