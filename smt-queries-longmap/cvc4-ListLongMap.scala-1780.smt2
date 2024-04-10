; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32384 () Bool)

(assert start!32384)

(declare-datatypes ((array!16523 0))(
  ( (array!16524 (arr!7819 (Array (_ BitVec 32) (_ BitVec 64))) (size!8171 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16523)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun e!199701 () Bool)

(declare-fun b!322820 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!322820 (= e!199701 (not (or (not (= (select (arr!7819 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322820 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9913 0))(
  ( (Unit!9914) )
))
(declare-fun lt!156522 () Unit!9913)

(declare-fun e!199702 () Unit!9913)

(assert (=> b!322820 (= lt!156522 e!199702)))

(declare-fun c!50745 () Bool)

(assert (=> b!322820 (= c!50745 (not (= resIndex!58 index!1840)))))

(declare-fun b!322821 () Bool)

(assert (=> b!322821 false))

(declare-fun e!199705 () Unit!9913)

(declare-fun Unit!9915 () Unit!9913)

(assert (=> b!322821 (= e!199705 Unit!9915)))

(declare-fun b!322822 () Bool)

(declare-fun res!176595 () Bool)

(declare-fun e!199704 () Bool)

(assert (=> b!322822 (=> (not res!176595) (not e!199704))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2950 0))(
  ( (MissingZero!2950 (index!13976 (_ BitVec 32))) (Found!2950 (index!13977 (_ BitVec 32))) (Intermediate!2950 (undefined!3762 Bool) (index!13978 (_ BitVec 32)) (x!32234 (_ BitVec 32))) (Undefined!2950) (MissingVacant!2950 (index!13979 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16523 (_ BitVec 32)) SeekEntryResult!2950)

(assert (=> b!322822 (= res!176595 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2950 i!1250)))))

(declare-fun res!176594 () Bool)

(assert (=> start!32384 (=> (not res!176594) (not e!199704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32384 (= res!176594 (validMask!0 mask!3777))))

(assert (=> start!32384 e!199704))

(declare-fun array_inv!5782 (array!16523) Bool)

(assert (=> start!32384 (array_inv!5782 a!3305)))

(assert (=> start!32384 true))

(declare-fun b!322823 () Bool)

(declare-fun res!176589 () Bool)

(assert (=> b!322823 (=> (not res!176589) (not e!199704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322823 (= res!176589 (validKeyInArray!0 k!2497))))

(declare-fun b!322824 () Bool)

(declare-fun res!176592 () Bool)

(assert (=> b!322824 (=> (not res!176592) (not e!199701))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322824 (= res!176592 (and (= (select (arr!7819 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8171 a!3305))))))

(declare-fun b!322825 () Bool)

(declare-fun Unit!9916 () Unit!9913)

(assert (=> b!322825 (= e!199702 Unit!9916)))

(declare-fun b!322826 () Bool)

(assert (=> b!322826 (= e!199702 e!199705)))

(declare-fun c!50743 () Bool)

(assert (=> b!322826 (= c!50743 (or (= (select (arr!7819 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7819 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322827 () Bool)

(declare-fun res!176597 () Bool)

(assert (=> b!322827 (=> (not res!176597) (not e!199704))))

(declare-fun arrayContainsKey!0 (array!16523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322827 (= res!176597 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322828 () Bool)

(declare-fun res!176596 () Bool)

(assert (=> b!322828 (=> (not res!176596) (not e!199704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16523 (_ BitVec 32)) Bool)

(assert (=> b!322828 (= res!176596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322829 () Bool)

(declare-fun e!199703 () Unit!9913)

(declare-fun Unit!9917 () Unit!9913)

(assert (=> b!322829 (= e!199703 Unit!9917)))

(assert (=> b!322829 false))

(declare-fun b!322830 () Bool)

(declare-fun Unit!9918 () Unit!9913)

(assert (=> b!322830 (= e!199703 Unit!9918)))

(declare-fun b!322831 () Bool)

(assert (=> b!322831 (= e!199704 e!199701)))

(declare-fun res!176598 () Bool)

(assert (=> b!322831 (=> (not res!176598) (not e!199701))))

(declare-fun lt!156520 () SeekEntryResult!2950)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16523 (_ BitVec 32)) SeekEntryResult!2950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322831 (= res!176598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156520))))

(assert (=> b!322831 (= lt!156520 (Intermediate!2950 false resIndex!58 resX!58))))

(declare-fun b!322832 () Bool)

(declare-fun res!176593 () Bool)

(assert (=> b!322832 (=> (not res!176593) (not e!199701))))

(assert (=> b!322832 (= res!176593 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156520))))

(declare-fun b!322833 () Bool)

(declare-fun res!176590 () Bool)

(assert (=> b!322833 (=> (not res!176590) (not e!199704))))

(assert (=> b!322833 (= res!176590 (and (= (size!8171 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8171 a!3305))))))

(declare-fun b!322834 () Bool)

(assert (=> b!322834 false))

(declare-fun lt!156521 () Unit!9913)

(assert (=> b!322834 (= lt!156521 e!199703)))

(declare-fun c!50744 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322834 (= c!50744 (is-Intermediate!2950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9919 () Unit!9913)

(assert (=> b!322834 (= e!199705 Unit!9919)))

(declare-fun b!322835 () Bool)

(declare-fun res!176591 () Bool)

(assert (=> b!322835 (=> (not res!176591) (not e!199701))))

(assert (=> b!322835 (= res!176591 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7819 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(assert (= (and start!32384 res!176594) b!322833))

(assert (= (and b!322833 res!176590) b!322823))

(assert (= (and b!322823 res!176589) b!322827))

(assert (= (and b!322827 res!176597) b!322822))

(assert (= (and b!322822 res!176595) b!322828))

(assert (= (and b!322828 res!176596) b!322831))

(assert (= (and b!322831 res!176598) b!322824))

(assert (= (and b!322824 res!176592) b!322832))

(assert (= (and b!322832 res!176593) b!322835))

(assert (= (and b!322835 res!176591) b!322820))

(assert (= (and b!322820 c!50745) b!322826))

(assert (= (and b!322820 (not c!50745)) b!322825))

(assert (= (and b!322826 c!50743) b!322821))

(assert (= (and b!322826 (not c!50743)) b!322834))

(assert (= (and b!322834 c!50744) b!322830))

(assert (= (and b!322834 (not c!50744)) b!322829))

(declare-fun m!330483 () Bool)

(assert (=> b!322832 m!330483))

(declare-fun m!330485 () Bool)

(assert (=> b!322828 m!330485))

(declare-fun m!330487 () Bool)

(assert (=> b!322820 m!330487))

(declare-fun m!330489 () Bool)

(assert (=> b!322824 m!330489))

(declare-fun m!330491 () Bool)

(assert (=> b!322823 m!330491))

(declare-fun m!330493 () Bool)

(assert (=> b!322822 m!330493))

(declare-fun m!330495 () Bool)

(assert (=> start!32384 m!330495))

(declare-fun m!330497 () Bool)

(assert (=> start!32384 m!330497))

(declare-fun m!330499 () Bool)

(assert (=> b!322831 m!330499))

(assert (=> b!322831 m!330499))

(declare-fun m!330501 () Bool)

(assert (=> b!322831 m!330501))

(assert (=> b!322826 m!330487))

(assert (=> b!322835 m!330487))

(declare-fun m!330503 () Bool)

(assert (=> b!322834 m!330503))

(assert (=> b!322834 m!330503))

(declare-fun m!330505 () Bool)

(assert (=> b!322834 m!330505))

(declare-fun m!330507 () Bool)

(assert (=> b!322827 m!330507))

(push 1)

(assert (not b!322832))

(assert (not b!322831))

(assert (not b!322827))

(assert (not start!32384))

(assert (not b!322828))

(assert (not b!322822))

(assert (not b!322823))

(assert (not b!322834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

