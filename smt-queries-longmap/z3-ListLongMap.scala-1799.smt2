; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32496 () Bool)

(assert start!32496)

(declare-fun b!324893 () Bool)

(declare-fun res!178229 () Bool)

(declare-fun e!200415 () Bool)

(assert (=> b!324893 (=> (not res!178229) (not e!200415))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((array!16635 0))(
  ( (array!16636 (arr!7875 (Array (_ BitVec 32) (_ BitVec 64))) (size!8227 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16635)

(declare-datatypes ((SeekEntryResult!3006 0))(
  ( (MissingZero!3006 (index!14200 (_ BitVec 32))) (Found!3006 (index!14201 (_ BitVec 32))) (Intermediate!3006 (undefined!3818 Bool) (index!14202 (_ BitVec 32)) (x!32442 (_ BitVec 32))) (Undefined!3006) (MissingVacant!3006 (index!14203 (_ BitVec 32))) )
))
(declare-fun lt!156893 () SeekEntryResult!3006)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16635 (_ BitVec 32)) SeekEntryResult!3006)

(assert (=> b!324893 (= res!178229 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156893))))

(declare-fun b!324894 () Bool)

(declare-fun res!178228 () Bool)

(assert (=> b!324894 (=> (not res!178228) (not e!200415))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324894 (= res!178228 (and (= (select (arr!7875 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8227 a!3305))))))

(declare-fun b!324895 () Bool)

(assert (=> b!324895 (= e!200415 false)))

(declare-fun lt!156894 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324895 (= lt!156894 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!178230 () Bool)

(declare-fun e!200416 () Bool)

(assert (=> start!32496 (=> (not res!178230) (not e!200416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32496 (= res!178230 (validMask!0 mask!3777))))

(assert (=> start!32496 e!200416))

(declare-fun array_inv!5838 (array!16635) Bool)

(assert (=> start!32496 (array_inv!5838 a!3305)))

(assert (=> start!32496 true))

(declare-fun b!324896 () Bool)

(assert (=> b!324896 (= e!200416 e!200415)))

(declare-fun res!178225 () Bool)

(assert (=> b!324896 (=> (not res!178225) (not e!200415))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324896 (= res!178225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156893))))

(assert (=> b!324896 (= lt!156893 (Intermediate!3006 false resIndex!58 resX!58))))

(declare-fun b!324897 () Bool)

(declare-fun res!178224 () Bool)

(assert (=> b!324897 (=> (not res!178224) (not e!200416))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16635 (_ BitVec 32)) SeekEntryResult!3006)

(assert (=> b!324897 (= res!178224 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3006 i!1250)))))

(declare-fun b!324898 () Bool)

(declare-fun res!178226 () Bool)

(assert (=> b!324898 (=> (not res!178226) (not e!200416))))

(declare-fun arrayContainsKey!0 (array!16635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324898 (= res!178226 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324899 () Bool)

(declare-fun res!178231 () Bool)

(assert (=> b!324899 (=> (not res!178231) (not e!200416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324899 (= res!178231 (validKeyInArray!0 k0!2497))))

(declare-fun b!324900 () Bool)

(declare-fun res!178227 () Bool)

(assert (=> b!324900 (=> (not res!178227) (not e!200416))))

(assert (=> b!324900 (= res!178227 (and (= (size!8227 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8227 a!3305))))))

(declare-fun b!324901 () Bool)

(declare-fun res!178233 () Bool)

(assert (=> b!324901 (=> (not res!178233) (not e!200415))))

(assert (=> b!324901 (= res!178233 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7875 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324902 () Bool)

(declare-fun res!178232 () Bool)

(assert (=> b!324902 (=> (not res!178232) (not e!200416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16635 (_ BitVec 32)) Bool)

(assert (=> b!324902 (= res!178232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32496 res!178230) b!324900))

(assert (= (and b!324900 res!178227) b!324899))

(assert (= (and b!324899 res!178231) b!324898))

(assert (= (and b!324898 res!178226) b!324897))

(assert (= (and b!324897 res!178224) b!324902))

(assert (= (and b!324902 res!178232) b!324896))

(assert (= (and b!324896 res!178225) b!324894))

(assert (= (and b!324894 res!178228) b!324893))

(assert (= (and b!324893 res!178229) b!324901))

(assert (= (and b!324901 res!178233) b!324895))

(declare-fun m!331847 () Bool)

(assert (=> b!324894 m!331847))

(declare-fun m!331849 () Bool)

(assert (=> b!324898 m!331849))

(declare-fun m!331851 () Bool)

(assert (=> b!324902 m!331851))

(declare-fun m!331853 () Bool)

(assert (=> b!324901 m!331853))

(declare-fun m!331855 () Bool)

(assert (=> start!32496 m!331855))

(declare-fun m!331857 () Bool)

(assert (=> start!32496 m!331857))

(declare-fun m!331859 () Bool)

(assert (=> b!324897 m!331859))

(declare-fun m!331861 () Bool)

(assert (=> b!324899 m!331861))

(declare-fun m!331863 () Bool)

(assert (=> b!324896 m!331863))

(assert (=> b!324896 m!331863))

(declare-fun m!331865 () Bool)

(assert (=> b!324896 m!331865))

(declare-fun m!331867 () Bool)

(assert (=> b!324895 m!331867))

(declare-fun m!331869 () Bool)

(assert (=> b!324893 m!331869))

(check-sat (not b!324899) (not b!324895) (not b!324897) (not b!324893) (not b!324896) (not start!32496) (not b!324902) (not b!324898))
(check-sat)
