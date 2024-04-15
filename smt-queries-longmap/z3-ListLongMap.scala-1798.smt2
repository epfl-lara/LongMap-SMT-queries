; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32474 () Bool)

(assert start!32474)

(declare-fun res!177976 () Bool)

(declare-fun e!200204 () Bool)

(assert (=> start!32474 (=> (not res!177976) (not e!200204))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32474 (= res!177976 (validMask!0 mask!3777))))

(assert (=> start!32474 e!200204))

(declare-datatypes ((array!16617 0))(
  ( (array!16618 (arr!7866 (Array (_ BitVec 32) (_ BitVec 64))) (size!8219 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16617)

(declare-fun array_inv!5838 (array!16617) Bool)

(assert (=> start!32474 (array_inv!5838 a!3305)))

(assert (=> start!32474 true))

(declare-fun b!324498 () Bool)

(declare-fun res!177979 () Bool)

(assert (=> b!324498 (=> (not res!177979) (not e!200204))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324498 (= res!177979 (and (= (size!8219 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8219 a!3305))))))

(declare-fun b!324499 () Bool)

(declare-fun res!177980 () Bool)

(assert (=> b!324499 (=> (not res!177980) (not e!200204))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2996 0))(
  ( (MissingZero!2996 (index!14160 (_ BitVec 32))) (Found!2996 (index!14161 (_ BitVec 32))) (Intermediate!2996 (undefined!3808 Bool) (index!14162 (_ BitVec 32)) (x!32419 (_ BitVec 32))) (Undefined!2996) (MissingVacant!2996 (index!14163 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16617 (_ BitVec 32)) SeekEntryResult!2996)

(assert (=> b!324499 (= res!177980 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2996 i!1250)))))

(declare-fun b!324500 () Bool)

(declare-fun res!177977 () Bool)

(assert (=> b!324500 (=> (not res!177977) (not e!200204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16617 (_ BitVec 32)) Bool)

(assert (=> b!324500 (= res!177977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324501 () Bool)

(declare-fun res!177984 () Bool)

(assert (=> b!324501 (=> (not res!177984) (not e!200204))))

(declare-fun arrayContainsKey!0 (array!16617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324501 (= res!177984 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324502 () Bool)

(declare-fun res!177982 () Bool)

(declare-fun e!200202 () Bool)

(assert (=> b!324502 (=> (not res!177982) (not e!200202))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324502 (= res!177982 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7866 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324503 () Bool)

(assert (=> b!324503 (= e!200202 false)))

(declare-fun lt!156635 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324503 (= lt!156635 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324504 () Bool)

(declare-fun res!177978 () Bool)

(assert (=> b!324504 (=> (not res!177978) (not e!200204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324504 (= res!177978 (validKeyInArray!0 k0!2497))))

(declare-fun b!324505 () Bool)

(assert (=> b!324505 (= e!200204 e!200202)))

(declare-fun res!177975 () Bool)

(assert (=> b!324505 (=> (not res!177975) (not e!200202))))

(declare-fun lt!156634 () SeekEntryResult!2996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16617 (_ BitVec 32)) SeekEntryResult!2996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324505 (= res!177975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156634))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324505 (= lt!156634 (Intermediate!2996 false resIndex!58 resX!58))))

(declare-fun b!324506 () Bool)

(declare-fun res!177981 () Bool)

(assert (=> b!324506 (=> (not res!177981) (not e!200202))))

(assert (=> b!324506 (= res!177981 (and (= (select (arr!7866 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8219 a!3305))))))

(declare-fun b!324507 () Bool)

(declare-fun res!177983 () Bool)

(assert (=> b!324507 (=> (not res!177983) (not e!200202))))

(assert (=> b!324507 (= res!177983 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156634))))

(assert (= (and start!32474 res!177976) b!324498))

(assert (= (and b!324498 res!177979) b!324504))

(assert (= (and b!324504 res!177978) b!324501))

(assert (= (and b!324501 res!177984) b!324499))

(assert (= (and b!324499 res!177980) b!324500))

(assert (= (and b!324500 res!177977) b!324505))

(assert (= (and b!324505 res!177975) b!324506))

(assert (= (and b!324506 res!177981) b!324507))

(assert (= (and b!324507 res!177983) b!324502))

(assert (= (and b!324502 res!177982) b!324503))

(declare-fun m!331021 () Bool)

(assert (=> b!324501 m!331021))

(declare-fun m!331023 () Bool)

(assert (=> b!324504 m!331023))

(declare-fun m!331025 () Bool)

(assert (=> b!324507 m!331025))

(declare-fun m!331027 () Bool)

(assert (=> b!324499 m!331027))

(declare-fun m!331029 () Bool)

(assert (=> b!324506 m!331029))

(declare-fun m!331031 () Bool)

(assert (=> start!32474 m!331031))

(declare-fun m!331033 () Bool)

(assert (=> start!32474 m!331033))

(declare-fun m!331035 () Bool)

(assert (=> b!324500 m!331035))

(declare-fun m!331037 () Bool)

(assert (=> b!324502 m!331037))

(declare-fun m!331039 () Bool)

(assert (=> b!324503 m!331039))

(declare-fun m!331041 () Bool)

(assert (=> b!324505 m!331041))

(assert (=> b!324505 m!331041))

(declare-fun m!331043 () Bool)

(assert (=> b!324505 m!331043))

(check-sat (not b!324505) (not b!324504) (not b!324500) (not start!32474) (not b!324501) (not b!324503) (not b!324507) (not b!324499))
(check-sat)
