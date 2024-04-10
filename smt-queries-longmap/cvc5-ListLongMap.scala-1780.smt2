; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32380 () Bool)

(assert start!32380)

(declare-datatypes ((array!16519 0))(
  ( (array!16520 (arr!7817 (Array (_ BitVec 32) (_ BitVec 64))) (size!8169 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16519)

(declare-fun e!199668 () Bool)

(declare-fun b!322724 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!322724 (= e!199668 (not (or (not (= (select (arr!7817 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322724 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9899 0))(
  ( (Unit!9900) )
))
(declare-fun lt!156504 () Unit!9899)

(declare-fun e!199669 () Unit!9899)

(assert (=> b!322724 (= lt!156504 e!199669)))

(declare-fun c!50727 () Bool)

(assert (=> b!322724 (= c!50727 (not (= resIndex!58 index!1840)))))

(declare-fun b!322725 () Bool)

(assert (=> b!322725 false))

(declare-fun lt!156503 () Unit!9899)

(declare-fun e!199665 () Unit!9899)

(assert (=> b!322725 (= lt!156503 e!199665)))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun c!50725 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2948 0))(
  ( (MissingZero!2948 (index!13968 (_ BitVec 32))) (Found!2948 (index!13969 (_ BitVec 32))) (Intermediate!2948 (undefined!3760 Bool) (index!13970 (_ BitVec 32)) (x!32232 (_ BitVec 32))) (Undefined!2948) (MissingVacant!2948 (index!13971 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16519 (_ BitVec 32)) SeekEntryResult!2948)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322725 (= c!50725 (is-Intermediate!2948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199666 () Unit!9899)

(declare-fun Unit!9901 () Unit!9899)

(assert (=> b!322725 (= e!199666 Unit!9901)))

(declare-fun b!322726 () Bool)

(declare-fun e!199664 () Bool)

(assert (=> b!322726 (= e!199664 e!199668)))

(declare-fun res!176537 () Bool)

(assert (=> b!322726 (=> (not res!176537) (not e!199668))))

(declare-fun lt!156502 () SeekEntryResult!2948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322726 (= res!176537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156502))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322726 (= lt!156502 (Intermediate!2948 false resIndex!58 resX!58))))

(declare-fun res!176538 () Bool)

(assert (=> start!32380 (=> (not res!176538) (not e!199664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32380 (= res!176538 (validMask!0 mask!3777))))

(assert (=> start!32380 e!199664))

(declare-fun array_inv!5780 (array!16519) Bool)

(assert (=> start!32380 (array_inv!5780 a!3305)))

(assert (=> start!32380 true))

(declare-fun b!322727 () Bool)

(declare-fun res!176536 () Bool)

(assert (=> b!322727 (=> (not res!176536) (not e!199664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322727 (= res!176536 (validKeyInArray!0 k!2497))))

(declare-fun b!322728 () Bool)

(declare-fun res!176531 () Bool)

(assert (=> b!322728 (=> (not res!176531) (not e!199668))))

(assert (=> b!322728 (= res!176531 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7817 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322729 () Bool)

(declare-fun res!176529 () Bool)

(assert (=> b!322729 (=> (not res!176529) (not e!199664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16519 (_ BitVec 32)) Bool)

(assert (=> b!322729 (= res!176529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322730 () Bool)

(declare-fun res!176533 () Bool)

(assert (=> b!322730 (=> (not res!176533) (not e!199668))))

(assert (=> b!322730 (= res!176533 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156502))))

(declare-fun b!322731 () Bool)

(declare-fun Unit!9902 () Unit!9899)

(assert (=> b!322731 (= e!199665 Unit!9902)))

(declare-fun b!322732 () Bool)

(assert (=> b!322732 (= e!199669 e!199666)))

(declare-fun c!50726 () Bool)

(assert (=> b!322732 (= c!50726 (or (= (select (arr!7817 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7817 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322733 () Bool)

(declare-fun res!176535 () Bool)

(assert (=> b!322733 (=> (not res!176535) (not e!199664))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322733 (= res!176535 (and (= (size!8169 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8169 a!3305))))))

(declare-fun b!322734 () Bool)

(declare-fun res!176530 () Bool)

(assert (=> b!322734 (=> (not res!176530) (not e!199664))))

(declare-fun arrayContainsKey!0 (array!16519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322734 (= res!176530 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322735 () Bool)

(assert (=> b!322735 false))

(declare-fun Unit!9903 () Unit!9899)

(assert (=> b!322735 (= e!199666 Unit!9903)))

(declare-fun b!322736 () Bool)

(declare-fun Unit!9904 () Unit!9899)

(assert (=> b!322736 (= e!199665 Unit!9904)))

(assert (=> b!322736 false))

(declare-fun b!322737 () Bool)

(declare-fun Unit!9905 () Unit!9899)

(assert (=> b!322737 (= e!199669 Unit!9905)))

(declare-fun b!322738 () Bool)

(declare-fun res!176532 () Bool)

(assert (=> b!322738 (=> (not res!176532) (not e!199668))))

(assert (=> b!322738 (= res!176532 (and (= (select (arr!7817 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8169 a!3305))))))

(declare-fun b!322739 () Bool)

(declare-fun res!176534 () Bool)

(assert (=> b!322739 (=> (not res!176534) (not e!199664))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16519 (_ BitVec 32)) SeekEntryResult!2948)

(assert (=> b!322739 (= res!176534 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2948 i!1250)))))

(assert (= (and start!32380 res!176538) b!322733))

(assert (= (and b!322733 res!176535) b!322727))

(assert (= (and b!322727 res!176536) b!322734))

(assert (= (and b!322734 res!176530) b!322739))

(assert (= (and b!322739 res!176534) b!322729))

(assert (= (and b!322729 res!176529) b!322726))

(assert (= (and b!322726 res!176537) b!322738))

(assert (= (and b!322738 res!176532) b!322730))

(assert (= (and b!322730 res!176533) b!322728))

(assert (= (and b!322728 res!176531) b!322724))

(assert (= (and b!322724 c!50727) b!322732))

(assert (= (and b!322724 (not c!50727)) b!322737))

(assert (= (and b!322732 c!50726) b!322735))

(assert (= (and b!322732 (not c!50726)) b!322725))

(assert (= (and b!322725 c!50725) b!322731))

(assert (= (and b!322725 (not c!50725)) b!322736))

(declare-fun m!330431 () Bool)

(assert (=> b!322724 m!330431))

(declare-fun m!330433 () Bool)

(assert (=> b!322725 m!330433))

(assert (=> b!322725 m!330433))

(declare-fun m!330435 () Bool)

(assert (=> b!322725 m!330435))

(declare-fun m!330437 () Bool)

(assert (=> start!32380 m!330437))

(declare-fun m!330439 () Bool)

(assert (=> start!32380 m!330439))

(declare-fun m!330441 () Bool)

(assert (=> b!322734 m!330441))

(assert (=> b!322728 m!330431))

(declare-fun m!330443 () Bool)

(assert (=> b!322727 m!330443))

(declare-fun m!330445 () Bool)

(assert (=> b!322739 m!330445))

(declare-fun m!330447 () Bool)

(assert (=> b!322730 m!330447))

(declare-fun m!330449 () Bool)

(assert (=> b!322726 m!330449))

(assert (=> b!322726 m!330449))

(declare-fun m!330451 () Bool)

(assert (=> b!322726 m!330451))

(assert (=> b!322732 m!330431))

(declare-fun m!330453 () Bool)

(assert (=> b!322729 m!330453))

(declare-fun m!330455 () Bool)

(assert (=> b!322738 m!330455))

(push 1)

(assert (not b!322730))

(assert (not b!322727))

(assert (not b!322739))

(assert (not b!322734))

(assert (not start!32380))

(assert (not b!322729))

(assert (not b!322726))

(assert (not b!322725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

