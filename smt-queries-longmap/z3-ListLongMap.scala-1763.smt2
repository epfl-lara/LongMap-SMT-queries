; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32226 () Bool)

(assert start!32226)

(declare-fun res!175046 () Bool)

(declare-fun e!199017 () Bool)

(assert (=> start!32226 (=> (not res!175046) (not e!199017))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32226 (= res!175046 (validMask!0 mask!3777))))

(assert (=> start!32226 e!199017))

(declare-datatypes ((array!16416 0))(
  ( (array!16417 (arr!7767 (Array (_ BitVec 32) (_ BitVec 64))) (size!8119 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16416)

(declare-fun array_inv!5730 (array!16416) Bool)

(assert (=> start!32226 (array_inv!5730 a!3305)))

(assert (=> start!32226 true))

(declare-fun b!320923 () Bool)

(declare-fun res!175049 () Bool)

(assert (=> b!320923 (=> (not res!175049) (not e!199017))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2898 0))(
  ( (MissingZero!2898 (index!13768 (_ BitVec 32))) (Found!2898 (index!13769 (_ BitVec 32))) (Intermediate!2898 (undefined!3710 Bool) (index!13770 (_ BitVec 32)) (x!32037 (_ BitVec 32))) (Undefined!2898) (MissingVacant!2898 (index!13771 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16416 (_ BitVec 32)) SeekEntryResult!2898)

(assert (=> b!320923 (= res!175049 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2898 i!1250)))))

(declare-fun b!320924 () Bool)

(declare-fun res!175044 () Bool)

(assert (=> b!320924 (=> (not res!175044) (not e!199017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320924 (= res!175044 (validKeyInArray!0 k0!2497))))

(declare-fun b!320925 () Bool)

(declare-fun res!175048 () Bool)

(assert (=> b!320925 (=> (not res!175048) (not e!199017))))

(declare-fun arrayContainsKey!0 (array!16416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320925 (= res!175048 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320926 () Bool)

(declare-fun res!175043 () Bool)

(assert (=> b!320926 (=> (not res!175043) (not e!199017))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16416 (_ BitVec 32)) SeekEntryResult!2898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320926 (= res!175043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2898 false resIndex!58 resX!58)))))

(declare-fun b!320927 () Bool)

(assert (=> b!320927 (= e!199017 false)))

(declare-fun lt!156135 () SeekEntryResult!2898)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!320927 (= lt!156135 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!320928 () Bool)

(declare-fun res!175047 () Bool)

(assert (=> b!320928 (=> (not res!175047) (not e!199017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16416 (_ BitVec 32)) Bool)

(assert (=> b!320928 (= res!175047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320929 () Bool)

(declare-fun res!175050 () Bool)

(assert (=> b!320929 (=> (not res!175050) (not e!199017))))

(assert (=> b!320929 (= res!175050 (and (= (size!8119 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8119 a!3305))))))

(declare-fun b!320930 () Bool)

(declare-fun res!175045 () Bool)

(assert (=> b!320930 (=> (not res!175045) (not e!199017))))

(assert (=> b!320930 (= res!175045 (and (= (select (arr!7767 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8119 a!3305))))))

(assert (= (and start!32226 res!175046) b!320929))

(assert (= (and b!320929 res!175050) b!320924))

(assert (= (and b!320924 res!175044) b!320925))

(assert (= (and b!320925 res!175048) b!320923))

(assert (= (and b!320923 res!175049) b!320928))

(assert (= (and b!320928 res!175047) b!320926))

(assert (= (and b!320926 res!175043) b!320930))

(assert (= (and b!320930 res!175045) b!320927))

(declare-fun m!329161 () Bool)

(assert (=> b!320927 m!329161))

(declare-fun m!329163 () Bool)

(assert (=> b!320930 m!329163))

(declare-fun m!329165 () Bool)

(assert (=> b!320925 m!329165))

(declare-fun m!329167 () Bool)

(assert (=> start!32226 m!329167))

(declare-fun m!329169 () Bool)

(assert (=> start!32226 m!329169))

(declare-fun m!329171 () Bool)

(assert (=> b!320926 m!329171))

(assert (=> b!320926 m!329171))

(declare-fun m!329173 () Bool)

(assert (=> b!320926 m!329173))

(declare-fun m!329175 () Bool)

(assert (=> b!320924 m!329175))

(declare-fun m!329177 () Bool)

(assert (=> b!320928 m!329177))

(declare-fun m!329179 () Bool)

(assert (=> b!320923 m!329179))

(check-sat (not b!320924) (not b!320925) (not b!320923) (not b!320928) (not b!320926) (not start!32226) (not b!320927))
