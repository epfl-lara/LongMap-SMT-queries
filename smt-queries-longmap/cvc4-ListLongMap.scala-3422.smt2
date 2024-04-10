; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47458 () Bool)

(assert start!47458)

(declare-fun b!522586 () Bool)

(declare-datatypes ((Unit!16312 0))(
  ( (Unit!16313) )
))
(declare-fun e!304791 () Unit!16312)

(declare-fun Unit!16314 () Unit!16312)

(assert (=> b!522586 (= e!304791 Unit!16314)))

(declare-fun lt!239701 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239696 () Unit!16312)

(declare-datatypes ((array!33284 0))(
  ( (array!33285 (arr!15998 (Array (_ BitVec 32) (_ BitVec 64))) (size!16362 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33284)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4465 0))(
  ( (MissingZero!4465 (index!20063 (_ BitVec 32))) (Found!4465 (index!20064 (_ BitVec 32))) (Intermediate!4465 (undefined!5277 Bool) (index!20065 (_ BitVec 32)) (x!49035 (_ BitVec 32))) (Undefined!4465) (MissingVacant!4465 (index!20066 (_ BitVec 32))) )
))
(declare-fun lt!239704 () SeekEntryResult!4465)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33284 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16312)

(assert (=> b!522586 (= lt!239696 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239701 #b00000000000000000000000000000000 (index!20065 lt!239704) (x!49035 lt!239704) mask!3524))))

(declare-fun lt!239700 () (_ BitVec 64))

(declare-fun res!320223 () Bool)

(declare-fun lt!239699 () array!33284)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33284 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!522586 (= res!320223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239701 lt!239700 lt!239699 mask!3524) (Intermediate!4465 false (index!20065 lt!239704) (x!49035 lt!239704))))))

(declare-fun e!304789 () Bool)

(assert (=> b!522586 (=> (not res!320223) (not e!304789))))

(assert (=> b!522586 e!304789))

(declare-fun b!522587 () Bool)

(declare-fun e!304793 () Bool)

(assert (=> b!522587 (= e!304793 true)))

(assert (=> b!522587 (and (or (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239703 () Unit!16312)

(assert (=> b!522587 (= lt!239703 e!304791)))

(declare-fun c!61484 () Bool)

(assert (=> b!522587 (= c!61484 (= (select (arr!15998 a!3235) (index!20065 lt!239704)) (select (arr!15998 a!3235) j!176)))))

(assert (=> b!522587 (and (bvslt (x!49035 lt!239704) #b01111111111111111111111111111110) (or (= (select (arr!15998 a!3235) (index!20065 lt!239704)) (select (arr!15998 a!3235) j!176)) (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15998 a!3235) (index!20065 lt!239704)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522588 () Bool)

(declare-fun res!320227 () Bool)

(declare-fun e!304790 () Bool)

(assert (=> b!522588 (=> (not res!320227) (not e!304790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33284 (_ BitVec 32)) Bool)

(assert (=> b!522588 (= res!320227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!304792 () Bool)

(declare-fun b!522589 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33284 (_ BitVec 32)) SeekEntryResult!4465)

(assert (=> b!522589 (= e!304792 (= (seekEntryOrOpen!0 (select (arr!15998 a!3235) j!176) a!3235 mask!3524) (Found!4465 j!176)))))

(declare-fun b!522590 () Bool)

(declare-fun res!320228 () Bool)

(declare-fun e!304788 () Bool)

(assert (=> b!522590 (=> (not res!320228) (not e!304788))))

(assert (=> b!522590 (= res!320228 (and (= (size!16362 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16362 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16362 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522591 () Bool)

(declare-fun res!320221 () Bool)

(assert (=> b!522591 (=> res!320221 e!304793)))

(assert (=> b!522591 (= res!320221 (or (undefined!5277 lt!239704) (not (is-Intermediate!4465 lt!239704))))))

(declare-fun res!320225 () Bool)

(assert (=> start!47458 (=> (not res!320225) (not e!304788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47458 (= res!320225 (validMask!0 mask!3524))))

(assert (=> start!47458 e!304788))

(assert (=> start!47458 true))

(declare-fun array_inv!11794 (array!33284) Bool)

(assert (=> start!47458 (array_inv!11794 a!3235)))

(declare-fun b!522592 () Bool)

(assert (=> b!522592 (= e!304789 false)))

(declare-fun b!522593 () Bool)

(assert (=> b!522593 (= e!304790 (not e!304793))))

(declare-fun res!320231 () Bool)

(assert (=> b!522593 (=> res!320231 e!304793)))

(declare-fun lt!239698 () (_ BitVec 32))

(assert (=> b!522593 (= res!320231 (= lt!239704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239698 lt!239700 lt!239699 mask!3524)))))

(assert (=> b!522593 (= lt!239704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239701 (select (arr!15998 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522593 (= lt!239698 (toIndex!0 lt!239700 mask!3524))))

(assert (=> b!522593 (= lt!239700 (select (store (arr!15998 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522593 (= lt!239701 (toIndex!0 (select (arr!15998 a!3235) j!176) mask!3524))))

(assert (=> b!522593 (= lt!239699 (array!33285 (store (arr!15998 a!3235) i!1204 k!2280) (size!16362 a!3235)))))

(assert (=> b!522593 e!304792))

(declare-fun res!320226 () Bool)

(assert (=> b!522593 (=> (not res!320226) (not e!304792))))

(assert (=> b!522593 (= res!320226 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239702 () Unit!16312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16312)

(assert (=> b!522593 (= lt!239702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522594 () Bool)

(assert (=> b!522594 (= e!304788 e!304790)))

(declare-fun res!320230 () Bool)

(assert (=> b!522594 (=> (not res!320230) (not e!304790))))

(declare-fun lt!239697 () SeekEntryResult!4465)

(assert (=> b!522594 (= res!320230 (or (= lt!239697 (MissingZero!4465 i!1204)) (= lt!239697 (MissingVacant!4465 i!1204))))))

(assert (=> b!522594 (= lt!239697 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522595 () Bool)

(declare-fun Unit!16315 () Unit!16312)

(assert (=> b!522595 (= e!304791 Unit!16315)))

(declare-fun b!522596 () Bool)

(declare-fun res!320224 () Bool)

(assert (=> b!522596 (=> (not res!320224) (not e!304788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522596 (= res!320224 (validKeyInArray!0 k!2280))))

(declare-fun b!522597 () Bool)

(declare-fun res!320222 () Bool)

(assert (=> b!522597 (=> (not res!320222) (not e!304788))))

(declare-fun arrayContainsKey!0 (array!33284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522597 (= res!320222 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522598 () Bool)

(declare-fun res!320229 () Bool)

(assert (=> b!522598 (=> (not res!320229) (not e!304788))))

(assert (=> b!522598 (= res!320229 (validKeyInArray!0 (select (arr!15998 a!3235) j!176)))))

(declare-fun b!522599 () Bool)

(declare-fun res!320220 () Bool)

(assert (=> b!522599 (=> (not res!320220) (not e!304790))))

(declare-datatypes ((List!10156 0))(
  ( (Nil!10153) (Cons!10152 (h!11074 (_ BitVec 64)) (t!16384 List!10156)) )
))
(declare-fun arrayNoDuplicates!0 (array!33284 (_ BitVec 32) List!10156) Bool)

(assert (=> b!522599 (= res!320220 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10153))))

(assert (= (and start!47458 res!320225) b!522590))

(assert (= (and b!522590 res!320228) b!522598))

(assert (= (and b!522598 res!320229) b!522596))

(assert (= (and b!522596 res!320224) b!522597))

(assert (= (and b!522597 res!320222) b!522594))

(assert (= (and b!522594 res!320230) b!522588))

(assert (= (and b!522588 res!320227) b!522599))

(assert (= (and b!522599 res!320220) b!522593))

(assert (= (and b!522593 res!320226) b!522589))

(assert (= (and b!522593 (not res!320231)) b!522591))

(assert (= (and b!522591 (not res!320221)) b!522587))

(assert (= (and b!522587 c!61484) b!522586))

(assert (= (and b!522587 (not c!61484)) b!522595))

(assert (= (and b!522586 res!320223) b!522592))

(declare-fun m!503499 () Bool)

(assert (=> b!522586 m!503499))

(declare-fun m!503501 () Bool)

(assert (=> b!522586 m!503501))

(declare-fun m!503503 () Bool)

(assert (=> b!522596 m!503503))

(declare-fun m!503505 () Bool)

(assert (=> b!522599 m!503505))

(declare-fun m!503507 () Bool)

(assert (=> b!522593 m!503507))

(declare-fun m!503509 () Bool)

(assert (=> b!522593 m!503509))

(declare-fun m!503511 () Bool)

(assert (=> b!522593 m!503511))

(declare-fun m!503513 () Bool)

(assert (=> b!522593 m!503513))

(declare-fun m!503515 () Bool)

(assert (=> b!522593 m!503515))

(declare-fun m!503517 () Bool)

(assert (=> b!522593 m!503517))

(assert (=> b!522593 m!503515))

(declare-fun m!503519 () Bool)

(assert (=> b!522593 m!503519))

(assert (=> b!522593 m!503515))

(declare-fun m!503521 () Bool)

(assert (=> b!522593 m!503521))

(declare-fun m!503523 () Bool)

(assert (=> b!522593 m!503523))

(declare-fun m!503525 () Bool)

(assert (=> b!522594 m!503525))

(assert (=> b!522598 m!503515))

(assert (=> b!522598 m!503515))

(declare-fun m!503527 () Bool)

(assert (=> b!522598 m!503527))

(assert (=> b!522589 m!503515))

(assert (=> b!522589 m!503515))

(declare-fun m!503529 () Bool)

(assert (=> b!522589 m!503529))

(declare-fun m!503531 () Bool)

(assert (=> b!522588 m!503531))

(declare-fun m!503533 () Bool)

(assert (=> b!522597 m!503533))

(declare-fun m!503535 () Bool)

(assert (=> b!522587 m!503535))

(assert (=> b!522587 m!503515))

(declare-fun m!503537 () Bool)

(assert (=> start!47458 m!503537))

(declare-fun m!503539 () Bool)

(assert (=> start!47458 m!503539))

(push 1)

