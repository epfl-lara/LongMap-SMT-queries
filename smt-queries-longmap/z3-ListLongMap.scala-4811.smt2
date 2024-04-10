; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66208 () Bool)

(assert start!66208)

(declare-fun b!762399 () Bool)

(declare-fun e!424983 () Bool)

(declare-fun e!424981 () Bool)

(assert (=> b!762399 (= e!424983 e!424981)))

(declare-fun res!515518 () Bool)

(assert (=> b!762399 (=> (not res!515518) (not e!424981))))

(declare-datatypes ((SeekEntryResult!7764 0))(
  ( (MissingZero!7764 (index!33424 (_ BitVec 32))) (Found!7764 (index!33425 (_ BitVec 32))) (Intermediate!7764 (undefined!8576 Bool) (index!33426 (_ BitVec 32)) (x!64336 (_ BitVec 32))) (Undefined!7764) (MissingVacant!7764 (index!33427 (_ BitVec 32))) )
))
(declare-fun lt!339563 () SeekEntryResult!7764)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762399 (= res!515518 (or (= lt!339563 (MissingZero!7764 i!1173)) (= lt!339563 (MissingVacant!7764 i!1173))))))

(declare-datatypes ((array!42113 0))(
  ( (array!42114 (arr!20164 (Array (_ BitVec 32) (_ BitVec 64))) (size!20585 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42113)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42113 (_ BitVec 32)) SeekEntryResult!7764)

(assert (=> b!762399 (= lt!339563 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762400 () Bool)

(declare-fun res!515517 () Bool)

(assert (=> b!762400 (=> (not res!515517) (not e!424983))))

(declare-fun arrayContainsKey!0 (array!42113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762400 (= res!515517 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515516 () Bool)

(assert (=> start!66208 (=> (not res!515516) (not e!424983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66208 (= res!515516 (validMask!0 mask!3328))))

(assert (=> start!66208 e!424983))

(assert (=> start!66208 true))

(declare-fun array_inv!15960 (array!42113) Bool)

(assert (=> start!66208 (array_inv!15960 a!3186)))

(declare-fun b!762401 () Bool)

(declare-fun res!515514 () Bool)

(assert (=> b!762401 (=> (not res!515514) (not e!424981))))

(declare-datatypes ((List!14166 0))(
  ( (Nil!14163) (Cons!14162 (h!15246 (_ BitVec 64)) (t!20481 List!14166)) )
))
(declare-fun arrayNoDuplicates!0 (array!42113 (_ BitVec 32) List!14166) Bool)

(assert (=> b!762401 (= res!515514 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14163))))

(declare-fun b!762402 () Bool)

(assert (=> b!762402 (= e!424981 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!339562 () SeekEntryResult!7764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42113 (_ BitVec 32)) SeekEntryResult!7764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762402 (= lt!339562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20164 a!3186) j!159) mask!3328) (select (arr!20164 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762403 () Bool)

(declare-fun res!515511 () Bool)

(assert (=> b!762403 (=> (not res!515511) (not e!424983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762403 (= res!515511 (validKeyInArray!0 (select (arr!20164 a!3186) j!159)))))

(declare-fun b!762404 () Bool)

(declare-fun res!515510 () Bool)

(assert (=> b!762404 (=> (not res!515510) (not e!424981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42113 (_ BitVec 32)) Bool)

(assert (=> b!762404 (= res!515510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762405 () Bool)

(declare-fun res!515515 () Bool)

(assert (=> b!762405 (=> (not res!515515) (not e!424981))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762405 (= res!515515 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20585 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20585 a!3186))))))

(declare-fun b!762406 () Bool)

(declare-fun res!515512 () Bool)

(assert (=> b!762406 (=> (not res!515512) (not e!424983))))

(assert (=> b!762406 (= res!515512 (and (= (size!20585 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20585 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20585 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762407 () Bool)

(declare-fun res!515513 () Bool)

(assert (=> b!762407 (=> (not res!515513) (not e!424983))))

(assert (=> b!762407 (= res!515513 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66208 res!515516) b!762406))

(assert (= (and b!762406 res!515512) b!762403))

(assert (= (and b!762403 res!515511) b!762407))

(assert (= (and b!762407 res!515513) b!762400))

(assert (= (and b!762400 res!515517) b!762399))

(assert (= (and b!762399 res!515518) b!762404))

(assert (= (and b!762404 res!515510) b!762401))

(assert (= (and b!762401 res!515514) b!762405))

(assert (= (and b!762405 res!515515) b!762402))

(declare-fun m!709153 () Bool)

(assert (=> b!762407 m!709153))

(declare-fun m!709155 () Bool)

(assert (=> b!762404 m!709155))

(declare-fun m!709157 () Bool)

(assert (=> b!762401 m!709157))

(declare-fun m!709159 () Bool)

(assert (=> start!66208 m!709159))

(declare-fun m!709161 () Bool)

(assert (=> start!66208 m!709161))

(declare-fun m!709163 () Bool)

(assert (=> b!762402 m!709163))

(assert (=> b!762402 m!709163))

(declare-fun m!709165 () Bool)

(assert (=> b!762402 m!709165))

(assert (=> b!762402 m!709165))

(assert (=> b!762402 m!709163))

(declare-fun m!709167 () Bool)

(assert (=> b!762402 m!709167))

(assert (=> b!762403 m!709163))

(assert (=> b!762403 m!709163))

(declare-fun m!709169 () Bool)

(assert (=> b!762403 m!709169))

(declare-fun m!709171 () Bool)

(assert (=> b!762399 m!709171))

(declare-fun m!709173 () Bool)

(assert (=> b!762400 m!709173))

(check-sat (not b!762403) (not b!762401) (not b!762400) (not b!762399) (not b!762402) (not b!762404) (not start!66208) (not b!762407))
(check-sat)
