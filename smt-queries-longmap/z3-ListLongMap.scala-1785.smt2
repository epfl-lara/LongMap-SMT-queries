; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32412 () Bool)

(assert start!32412)

(declare-fun b!323492 () Bool)

(declare-fun res!177018 () Bool)

(declare-fun e!199953 () Bool)

(assert (=> b!323492 (=> (not res!177018) (not e!199953))))

(declare-datatypes ((array!16551 0))(
  ( (array!16552 (arr!7833 (Array (_ BitVec 32) (_ BitVec 64))) (size!8185 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16551)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323492 (= res!177018 (and (= (size!8185 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8185 a!3305))))))

(declare-fun b!323493 () Bool)

(assert (=> b!323493 false))

(declare-datatypes ((Unit!10011 0))(
  ( (Unit!10012) )
))
(declare-fun e!199954 () Unit!10011)

(declare-fun Unit!10013 () Unit!10011)

(assert (=> b!323493 (= e!199954 Unit!10013)))

(declare-fun b!323494 () Bool)

(declare-fun e!199952 () Unit!10011)

(declare-fun Unit!10014 () Unit!10011)

(assert (=> b!323494 (= e!199952 Unit!10014)))

(assert (=> b!323494 false))

(declare-fun b!323495 () Bool)

(declare-fun e!199957 () Bool)

(assert (=> b!323495 (= e!199953 e!199957)))

(declare-fun res!177017 () Bool)

(assert (=> b!323495 (=> (not res!177017) (not e!199957))))

(declare-datatypes ((SeekEntryResult!2964 0))(
  ( (MissingZero!2964 (index!14032 (_ BitVec 32))) (Found!2964 (index!14033 (_ BitVec 32))) (Intermediate!2964 (undefined!3776 Bool) (index!14034 (_ BitVec 32)) (x!32288 (_ BitVec 32))) (Undefined!2964) (MissingVacant!2964 (index!14035 (_ BitVec 32))) )
))
(declare-fun lt!156648 () SeekEntryResult!2964)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16551 (_ BitVec 32)) SeekEntryResult!2964)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323495 (= res!177017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156648))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323495 (= lt!156648 (Intermediate!2964 false resIndex!58 resX!58))))

(declare-fun b!323496 () Bool)

(declare-fun e!199956 () Unit!10011)

(assert (=> b!323496 (= e!199956 e!199954)))

(declare-fun c!50869 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!323496 (= c!50869 (or (= (select (arr!7833 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7833 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323497 () Bool)

(declare-fun res!177013 () Bool)

(assert (=> b!323497 (=> (not res!177013) (not e!199957))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323497 (= res!177013 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156648))))

(declare-fun b!323498 () Bool)

(declare-fun Unit!10015 () Unit!10011)

(assert (=> b!323498 (= e!199956 Unit!10015)))

(declare-fun b!323499 () Bool)

(declare-fun res!177014 () Bool)

(assert (=> b!323499 (=> (not res!177014) (not e!199953))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16551 (_ BitVec 32)) SeekEntryResult!2964)

(assert (=> b!323499 (= res!177014 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2964 i!1250)))))

(declare-fun b!323500 () Bool)

(declare-fun res!177012 () Bool)

(assert (=> b!323500 (=> (not res!177012) (not e!199957))))

(assert (=> b!323500 (= res!177012 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7833 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323501 () Bool)

(assert (=> b!323501 false))

(declare-fun lt!156646 () Unit!10011)

(assert (=> b!323501 (= lt!156646 e!199952)))

(declare-fun c!50870 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323501 (= c!50870 ((_ is Intermediate!2964) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10016 () Unit!10011)

(assert (=> b!323501 (= e!199954 Unit!10016)))

(declare-fun b!323502 () Bool)

(declare-fun Unit!10017 () Unit!10011)

(assert (=> b!323502 (= e!199952 Unit!10017)))

(declare-fun b!323503 () Bool)

(declare-fun res!177009 () Bool)

(assert (=> b!323503 (=> (not res!177009) (not e!199957))))

(assert (=> b!323503 (= res!177009 (and (= (select (arr!7833 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8185 a!3305))))))

(declare-fun res!177016 () Bool)

(assert (=> start!32412 (=> (not res!177016) (not e!199953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32412 (= res!177016 (validMask!0 mask!3777))))

(assert (=> start!32412 e!199953))

(declare-fun array_inv!5796 (array!16551) Bool)

(assert (=> start!32412 (array_inv!5796 a!3305)))

(assert (=> start!32412 true))

(declare-fun b!323504 () Bool)

(declare-fun res!177010 () Bool)

(assert (=> b!323504 (=> (not res!177010) (not e!199953))))

(declare-fun arrayContainsKey!0 (array!16551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323504 (= res!177010 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323505 () Bool)

(assert (=> b!323505 (= e!199957 (not true))))

(assert (=> b!323505 (= index!1840 resIndex!58)))

(declare-fun lt!156647 () Unit!10011)

(assert (=> b!323505 (= lt!156647 e!199956)))

(declare-fun c!50871 () Bool)

(assert (=> b!323505 (= c!50871 (not (= resIndex!58 index!1840)))))

(declare-fun b!323506 () Bool)

(declare-fun res!177011 () Bool)

(assert (=> b!323506 (=> (not res!177011) (not e!199953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16551 (_ BitVec 32)) Bool)

(assert (=> b!323506 (= res!177011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323507 () Bool)

(declare-fun res!177015 () Bool)

(assert (=> b!323507 (=> (not res!177015) (not e!199953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323507 (= res!177015 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32412 res!177016) b!323492))

(assert (= (and b!323492 res!177018) b!323507))

(assert (= (and b!323507 res!177015) b!323504))

(assert (= (and b!323504 res!177010) b!323499))

(assert (= (and b!323499 res!177014) b!323506))

(assert (= (and b!323506 res!177011) b!323495))

(assert (= (and b!323495 res!177017) b!323503))

(assert (= (and b!323503 res!177009) b!323497))

(assert (= (and b!323497 res!177013) b!323500))

(assert (= (and b!323500 res!177012) b!323505))

(assert (= (and b!323505 c!50871) b!323496))

(assert (= (and b!323505 (not c!50871)) b!323498))

(assert (= (and b!323496 c!50869) b!323493))

(assert (= (and b!323496 (not c!50869)) b!323501))

(assert (= (and b!323501 c!50870) b!323502))

(assert (= (and b!323501 (not c!50870)) b!323494))

(declare-fun m!330847 () Bool)

(assert (=> b!323496 m!330847))

(declare-fun m!330849 () Bool)

(assert (=> b!323503 m!330849))

(declare-fun m!330851 () Bool)

(assert (=> b!323497 m!330851))

(declare-fun m!330853 () Bool)

(assert (=> b!323504 m!330853))

(declare-fun m!330855 () Bool)

(assert (=> b!323495 m!330855))

(assert (=> b!323495 m!330855))

(declare-fun m!330857 () Bool)

(assert (=> b!323495 m!330857))

(declare-fun m!330859 () Bool)

(assert (=> start!32412 m!330859))

(declare-fun m!330861 () Bool)

(assert (=> start!32412 m!330861))

(declare-fun m!330863 () Bool)

(assert (=> b!323506 m!330863))

(declare-fun m!330865 () Bool)

(assert (=> b!323501 m!330865))

(assert (=> b!323501 m!330865))

(declare-fun m!330867 () Bool)

(assert (=> b!323501 m!330867))

(declare-fun m!330869 () Bool)

(assert (=> b!323507 m!330869))

(declare-fun m!330871 () Bool)

(assert (=> b!323499 m!330871))

(assert (=> b!323500 m!330847))

(check-sat (not b!323497) (not b!323495) (not b!323506) (not b!323501) (not start!32412) (not b!323507) (not b!323499) (not b!323504))
(check-sat)
