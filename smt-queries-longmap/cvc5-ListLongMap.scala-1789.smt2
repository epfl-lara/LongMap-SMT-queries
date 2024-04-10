; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32434 () Bool)

(assert start!32434)

(declare-fun b!324004 () Bool)

(declare-fun res!177338 () Bool)

(declare-fun e!200142 () Bool)

(assert (=> b!324004 (=> (not res!177338) (not e!200142))))

(declare-datatypes ((array!16573 0))(
  ( (array!16574 (arr!7844 (Array (_ BitVec 32) (_ BitVec 64))) (size!8196 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16573)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324004 (= res!177338 (and (= (select (arr!7844 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8196 a!3305))))))

(declare-fun b!324005 () Bool)

(declare-fun res!177337 () Bool)

(assert (=> b!324005 (=> (not res!177337) (not e!200142))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2975 0))(
  ( (MissingZero!2975 (index!14076 (_ BitVec 32))) (Found!2975 (index!14077 (_ BitVec 32))) (Intermediate!2975 (undefined!3787 Bool) (index!14078 (_ BitVec 32)) (x!32331 (_ BitVec 32))) (Undefined!2975) (MissingVacant!2975 (index!14079 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16573 (_ BitVec 32)) SeekEntryResult!2975)

(assert (=> b!324005 (= res!177337 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2975 i!1250)))))

(declare-fun b!324006 () Bool)

(declare-fun res!177339 () Bool)

(assert (=> b!324006 (=> (not res!177339) (not e!200142))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16573 (_ BitVec 32)) SeekEntryResult!2975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324006 (= res!177339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2975 false resIndex!58 resX!58)))))

(declare-fun res!177336 () Bool)

(assert (=> start!32434 (=> (not res!177336) (not e!200142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32434 (= res!177336 (validMask!0 mask!3777))))

(assert (=> start!32434 e!200142))

(declare-fun array_inv!5807 (array!16573) Bool)

(assert (=> start!32434 (array_inv!5807 a!3305)))

(assert (=> start!32434 true))

(declare-fun b!324007 () Bool)

(declare-fun res!177340 () Bool)

(assert (=> b!324007 (=> (not res!177340) (not e!200142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324007 (= res!177340 (validKeyInArray!0 k!2497))))

(declare-fun b!324008 () Bool)

(declare-fun res!177342 () Bool)

(assert (=> b!324008 (=> (not res!177342) (not e!200142))))

(assert (=> b!324008 (= res!177342 (and (= (size!8196 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8196 a!3305))))))

(declare-fun b!324009 () Bool)

(declare-fun res!177341 () Bool)

(assert (=> b!324009 (=> (not res!177341) (not e!200142))))

(declare-fun arrayContainsKey!0 (array!16573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324009 (= res!177341 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324010 () Bool)

(declare-fun res!177335 () Bool)

(assert (=> b!324010 (=> (not res!177335) (not e!200142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16573 (_ BitVec 32)) Bool)

(assert (=> b!324010 (= res!177335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324011 () Bool)

(assert (=> b!324011 (= e!200142 false)))

(declare-fun lt!156741 () SeekEntryResult!2975)

(assert (=> b!324011 (= lt!156741 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32434 res!177336) b!324008))

(assert (= (and b!324008 res!177342) b!324007))

(assert (= (and b!324007 res!177340) b!324009))

(assert (= (and b!324009 res!177341) b!324005))

(assert (= (and b!324005 res!177337) b!324010))

(assert (= (and b!324010 res!177335) b!324006))

(assert (= (and b!324006 res!177339) b!324004))

(assert (= (and b!324004 res!177338) b!324011))

(declare-fun m!331133 () Bool)

(assert (=> b!324009 m!331133))

(declare-fun m!331135 () Bool)

(assert (=> start!32434 m!331135))

(declare-fun m!331137 () Bool)

(assert (=> start!32434 m!331137))

(declare-fun m!331139 () Bool)

(assert (=> b!324007 m!331139))

(declare-fun m!331141 () Bool)

(assert (=> b!324004 m!331141))

(declare-fun m!331143 () Bool)

(assert (=> b!324010 m!331143))

(declare-fun m!331145 () Bool)

(assert (=> b!324005 m!331145))

(declare-fun m!331147 () Bool)

(assert (=> b!324006 m!331147))

(assert (=> b!324006 m!331147))

(declare-fun m!331149 () Bool)

(assert (=> b!324006 m!331149))

(declare-fun m!331151 () Bool)

(assert (=> b!324011 m!331151))

(push 1)

(assert (not b!324009))

(assert (not b!324005))

(assert (not b!324011))

(assert (not b!324010))

(assert (not start!32434))

(assert (not b!324006))

(assert (not b!324007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

