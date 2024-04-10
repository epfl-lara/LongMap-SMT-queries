; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49274 () Bool)

(assert start!49274)

(declare-fun b!542430 () Bool)

(declare-fun res!336988 () Bool)

(declare-fun e!313964 () Bool)

(assert (=> b!542430 (=> (not res!336988) (not e!313964))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34282 0))(
  ( (array!34283 (arr!16474 (Array (_ BitVec 32) (_ BitVec 64))) (size!16838 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34282)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542430 (= res!336988 (and (= (size!16838 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16838 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16838 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542432 () Bool)

(declare-fun res!336992 () Bool)

(declare-fun e!313962 () Bool)

(assert (=> b!542432 (=> (not res!336992) (not e!313962))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!542432 (= res!336992 (and (not (= (select (arr!16474 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16474 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16474 a!3154) index!1177) (select (arr!16474 a!3154) j!147)))))))

(declare-fun b!542433 () Bool)

(declare-fun res!336991 () Bool)

(assert (=> b!542433 (=> (not res!336991) (not e!313964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542433 (= res!336991 (validKeyInArray!0 (select (arr!16474 a!3154) j!147)))))

(declare-fun b!542434 () Bool)

(declare-fun e!313965 () Bool)

(assert (=> b!542434 (= e!313964 e!313965)))

(declare-fun res!336985 () Bool)

(assert (=> b!542434 (=> (not res!336985) (not e!313965))))

(declare-datatypes ((SeekEntryResult!4932 0))(
  ( (MissingZero!4932 (index!21952 (_ BitVec 32))) (Found!4932 (index!21953 (_ BitVec 32))) (Intermediate!4932 (undefined!5744 Bool) (index!21954 (_ BitVec 32)) (x!50867 (_ BitVec 32))) (Undefined!4932) (MissingVacant!4932 (index!21955 (_ BitVec 32))) )
))
(declare-fun lt!247919 () SeekEntryResult!4932)

(assert (=> b!542434 (= res!336985 (or (= lt!247919 (MissingZero!4932 i!1153)) (= lt!247919 (MissingVacant!4932 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34282 (_ BitVec 32)) SeekEntryResult!4932)

(assert (=> b!542434 (= lt!247919 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542435 () Bool)

(declare-fun res!336990 () Bool)

(assert (=> b!542435 (=> (not res!336990) (not e!313964))))

(declare-fun arrayContainsKey!0 (array!34282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542435 (= res!336990 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542436 () Bool)

(declare-fun res!336989 () Bool)

(assert (=> b!542436 (=> (not res!336989) (not e!313965))))

(declare-datatypes ((List!10593 0))(
  ( (Nil!10590) (Cons!10589 (h!11544 (_ BitVec 64)) (t!16821 List!10593)) )
))
(declare-fun arrayNoDuplicates!0 (array!34282 (_ BitVec 32) List!10593) Bool)

(assert (=> b!542436 (= res!336989 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10590))))

(declare-fun b!542431 () Bool)

(assert (=> b!542431 (= e!313962 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!247921 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542431 (= lt!247921 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!336981 () Bool)

(assert (=> start!49274 (=> (not res!336981) (not e!313964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49274 (= res!336981 (validMask!0 mask!3216))))

(assert (=> start!49274 e!313964))

(assert (=> start!49274 true))

(declare-fun array_inv!12270 (array!34282) Bool)

(assert (=> start!49274 (array_inv!12270 a!3154)))

(declare-fun b!542437 () Bool)

(declare-fun res!336982 () Bool)

(assert (=> b!542437 (=> (not res!336982) (not e!313964))))

(assert (=> b!542437 (= res!336982 (validKeyInArray!0 k0!1998))))

(declare-fun b!542438 () Bool)

(declare-fun res!336984 () Bool)

(assert (=> b!542438 (=> (not res!336984) (not e!313962))))

(declare-fun lt!247920 () SeekEntryResult!4932)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34282 (_ BitVec 32)) SeekEntryResult!4932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542438 (= res!336984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16474 a!3154) j!147) mask!3216) (select (arr!16474 a!3154) j!147) a!3154 mask!3216) lt!247920))))

(declare-fun b!542439 () Bool)

(assert (=> b!542439 (= e!313965 e!313962)))

(declare-fun res!336987 () Bool)

(assert (=> b!542439 (=> (not res!336987) (not e!313962))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542439 (= res!336987 (= lt!247920 (Intermediate!4932 false resIndex!32 resX!32)))))

(assert (=> b!542439 (= lt!247920 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16474 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542440 () Bool)

(declare-fun res!336986 () Bool)

(assert (=> b!542440 (=> (not res!336986) (not e!313965))))

(assert (=> b!542440 (= res!336986 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16838 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16838 a!3154)) (= (select (arr!16474 a!3154) resIndex!32) (select (arr!16474 a!3154) j!147))))))

(declare-fun b!542441 () Bool)

(declare-fun res!336983 () Bool)

(assert (=> b!542441 (=> (not res!336983) (not e!313965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34282 (_ BitVec 32)) Bool)

(assert (=> b!542441 (= res!336983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49274 res!336981) b!542430))

(assert (= (and b!542430 res!336988) b!542433))

(assert (= (and b!542433 res!336991) b!542437))

(assert (= (and b!542437 res!336982) b!542435))

(assert (= (and b!542435 res!336990) b!542434))

(assert (= (and b!542434 res!336985) b!542441))

(assert (= (and b!542441 res!336983) b!542436))

(assert (= (and b!542436 res!336989) b!542440))

(assert (= (and b!542440 res!336986) b!542439))

(assert (= (and b!542439 res!336987) b!542438))

(assert (= (and b!542438 res!336984) b!542432))

(assert (= (and b!542432 res!336992) b!542431))

(declare-fun m!520689 () Bool)

(assert (=> b!542433 m!520689))

(assert (=> b!542433 m!520689))

(declare-fun m!520691 () Bool)

(assert (=> b!542433 m!520691))

(declare-fun m!520693 () Bool)

(assert (=> b!542431 m!520693))

(declare-fun m!520695 () Bool)

(assert (=> b!542435 m!520695))

(declare-fun m!520697 () Bool)

(assert (=> b!542432 m!520697))

(assert (=> b!542432 m!520689))

(assert (=> b!542438 m!520689))

(assert (=> b!542438 m!520689))

(declare-fun m!520699 () Bool)

(assert (=> b!542438 m!520699))

(assert (=> b!542438 m!520699))

(assert (=> b!542438 m!520689))

(declare-fun m!520701 () Bool)

(assert (=> b!542438 m!520701))

(declare-fun m!520703 () Bool)

(assert (=> b!542437 m!520703))

(declare-fun m!520705 () Bool)

(assert (=> b!542441 m!520705))

(declare-fun m!520707 () Bool)

(assert (=> b!542436 m!520707))

(declare-fun m!520709 () Bool)

(assert (=> b!542440 m!520709))

(assert (=> b!542440 m!520689))

(declare-fun m!520711 () Bool)

(assert (=> start!49274 m!520711))

(declare-fun m!520713 () Bool)

(assert (=> start!49274 m!520713))

(assert (=> b!542439 m!520689))

(assert (=> b!542439 m!520689))

(declare-fun m!520715 () Bool)

(assert (=> b!542439 m!520715))

(declare-fun m!520717 () Bool)

(assert (=> b!542434 m!520717))

(check-sat (not b!542436) (not b!542437) (not b!542441) (not b!542434) (not b!542431) (not b!542433) (not b!542438) (not start!49274) (not b!542435) (not b!542439))
(check-sat)
