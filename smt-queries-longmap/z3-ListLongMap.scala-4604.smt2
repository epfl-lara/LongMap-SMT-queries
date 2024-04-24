; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64320 () Bool)

(assert start!64320)

(declare-fun b!721764 () Bool)

(declare-fun res!483470 () Bool)

(declare-fun e!404784 () Bool)

(assert (=> b!721764 (=> (not res!483470) (not e!404784))))

(declare-datatypes ((array!40834 0))(
  ( (array!40835 (arr!19537 (Array (_ BitVec 32) (_ BitVec 64))) (size!19957 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40834)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721764 (= res!483470 (and (= (size!19957 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19957 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19957 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721765 () Bool)

(declare-fun res!483479 () Bool)

(assert (=> b!721765 (=> (not res!483479) (not e!404784))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721765 (= res!483479 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721766 () Bool)

(declare-fun e!404785 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7093 0))(
  ( (MissingZero!7093 (index!30740 (_ BitVec 32))) (Found!7093 (index!30741 (_ BitVec 32))) (Intermediate!7093 (undefined!7905 Bool) (index!30742 (_ BitVec 32)) (x!61905 (_ BitVec 32))) (Undefined!7093) (MissingVacant!7093 (index!30743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7093)

(assert (=> b!721766 (= e!404785 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19537 a!3186) j!159) a!3186 mask!3328) (Found!7093 j!159)))))

(declare-fun b!721767 () Bool)

(declare-fun res!483471 () Bool)

(declare-fun e!404783 () Bool)

(assert (=> b!721767 (=> (not res!483471) (not e!404783))))

(declare-datatypes ((List!13446 0))(
  ( (Nil!13443) (Cons!13442 (h!14499 (_ BitVec 64)) (t!19753 List!13446)) )
))
(declare-fun arrayNoDuplicates!0 (array!40834 (_ BitVec 32) List!13446) Bool)

(assert (=> b!721767 (= res!483471 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13443))))

(declare-fun res!483475 () Bool)

(assert (=> start!64320 (=> (not res!483475) (not e!404784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64320 (= res!483475 (validMask!0 mask!3328))))

(assert (=> start!64320 e!404784))

(assert (=> start!64320 true))

(declare-fun array_inv!15396 (array!40834) Bool)

(assert (=> start!64320 (array_inv!15396 a!3186)))

(declare-fun lt!320213 () SeekEntryResult!7093)

(declare-fun b!721768 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7093)

(assert (=> b!721768 (= e!404785 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19537 a!3186) j!159) a!3186 mask!3328) lt!320213))))

(declare-fun b!721769 () Bool)

(assert (=> b!721769 (= e!404784 e!404783)))

(declare-fun res!483472 () Bool)

(assert (=> b!721769 (=> (not res!483472) (not e!404783))))

(declare-fun lt!320214 () SeekEntryResult!7093)

(assert (=> b!721769 (= res!483472 (or (= lt!320214 (MissingZero!7093 i!1173)) (= lt!320214 (MissingVacant!7093 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7093)

(assert (=> b!721769 (= lt!320214 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721770 () Bool)

(declare-fun e!404786 () Bool)

(assert (=> b!721770 (= e!404786 false)))

(declare-fun lt!320212 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721770 (= lt!320212 (toIndex!0 (select (store (arr!19537 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721771 () Bool)

(assert (=> b!721771 (= e!404783 e!404786)))

(declare-fun res!483478 () Bool)

(assert (=> b!721771 (=> (not res!483478) (not e!404786))))

(assert (=> b!721771 (= res!483478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19537 a!3186) j!159) mask!3328) (select (arr!19537 a!3186) j!159) a!3186 mask!3328) lt!320213))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721771 (= lt!320213 (Intermediate!7093 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721772 () Bool)

(declare-fun res!483481 () Bool)

(assert (=> b!721772 (=> (not res!483481) (not e!404783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40834 (_ BitVec 32)) Bool)

(assert (=> b!721772 (= res!483481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721773 () Bool)

(declare-fun res!483480 () Bool)

(assert (=> b!721773 (=> (not res!483480) (not e!404784))))

(assert (=> b!721773 (= res!483480 (validKeyInArray!0 (select (arr!19537 a!3186) j!159)))))

(declare-fun b!721774 () Bool)

(declare-fun res!483474 () Bool)

(assert (=> b!721774 (=> (not res!483474) (not e!404786))))

(assert (=> b!721774 (= res!483474 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19537 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721775 () Bool)

(declare-fun res!483473 () Bool)

(assert (=> b!721775 (=> (not res!483473) (not e!404784))))

(declare-fun arrayContainsKey!0 (array!40834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721775 (= res!483473 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721776 () Bool)

(declare-fun res!483476 () Bool)

(assert (=> b!721776 (=> (not res!483476) (not e!404783))))

(assert (=> b!721776 (= res!483476 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19957 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19957 a!3186))))))

(declare-fun b!721777 () Bool)

(declare-fun res!483477 () Bool)

(assert (=> b!721777 (=> (not res!483477) (not e!404786))))

(assert (=> b!721777 (= res!483477 e!404785)))

(declare-fun c!79520 () Bool)

(assert (=> b!721777 (= c!79520 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64320 res!483475) b!721764))

(assert (= (and b!721764 res!483470) b!721773))

(assert (= (and b!721773 res!483480) b!721765))

(assert (= (and b!721765 res!483479) b!721775))

(assert (= (and b!721775 res!483473) b!721769))

(assert (= (and b!721769 res!483472) b!721772))

(assert (= (and b!721772 res!483481) b!721767))

(assert (= (and b!721767 res!483471) b!721776))

(assert (= (and b!721776 res!483476) b!721771))

(assert (= (and b!721771 res!483478) b!721774))

(assert (= (and b!721774 res!483474) b!721777))

(assert (= (and b!721777 c!79520) b!721768))

(assert (= (and b!721777 (not c!79520)) b!721766))

(assert (= (and b!721777 res!483477) b!721770))

(declare-fun m!677079 () Bool)

(assert (=> b!721774 m!677079))

(declare-fun m!677081 () Bool)

(assert (=> b!721775 m!677081))

(declare-fun m!677083 () Bool)

(assert (=> b!721768 m!677083))

(assert (=> b!721768 m!677083))

(declare-fun m!677085 () Bool)

(assert (=> b!721768 m!677085))

(declare-fun m!677087 () Bool)

(assert (=> b!721767 m!677087))

(assert (=> b!721773 m!677083))

(assert (=> b!721773 m!677083))

(declare-fun m!677089 () Bool)

(assert (=> b!721773 m!677089))

(declare-fun m!677091 () Bool)

(assert (=> start!64320 m!677091))

(declare-fun m!677093 () Bool)

(assert (=> start!64320 m!677093))

(declare-fun m!677095 () Bool)

(assert (=> b!721770 m!677095))

(declare-fun m!677097 () Bool)

(assert (=> b!721770 m!677097))

(assert (=> b!721770 m!677097))

(declare-fun m!677099 () Bool)

(assert (=> b!721770 m!677099))

(assert (=> b!721771 m!677083))

(assert (=> b!721771 m!677083))

(declare-fun m!677101 () Bool)

(assert (=> b!721771 m!677101))

(assert (=> b!721771 m!677101))

(assert (=> b!721771 m!677083))

(declare-fun m!677103 () Bool)

(assert (=> b!721771 m!677103))

(declare-fun m!677105 () Bool)

(assert (=> b!721765 m!677105))

(assert (=> b!721766 m!677083))

(assert (=> b!721766 m!677083))

(declare-fun m!677107 () Bool)

(assert (=> b!721766 m!677107))

(declare-fun m!677109 () Bool)

(assert (=> b!721769 m!677109))

(declare-fun m!677111 () Bool)

(assert (=> b!721772 m!677111))

(check-sat (not b!721775) (not b!721768) (not b!721765) (not b!721771) (not b!721767) (not b!721773) (not start!64320) (not b!721769) (not b!721772) (not b!721766) (not b!721770))
(check-sat)
