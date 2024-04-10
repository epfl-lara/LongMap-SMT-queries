; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32498 () Bool)

(assert start!32498)

(declare-fun b!324923 () Bool)

(declare-fun res!178263 () Bool)

(declare-fun e!200424 () Bool)

(assert (=> b!324923 (=> (not res!178263) (not e!200424))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3007 0))(
  ( (MissingZero!3007 (index!14204 (_ BitVec 32))) (Found!3007 (index!14205 (_ BitVec 32))) (Intermediate!3007 (undefined!3819 Bool) (index!14206 (_ BitVec 32)) (x!32443 (_ BitVec 32))) (Undefined!3007) (MissingVacant!3007 (index!14207 (_ BitVec 32))) )
))
(declare-fun lt!156900 () SeekEntryResult!3007)

(declare-datatypes ((array!16637 0))(
  ( (array!16638 (arr!7876 (Array (_ BitVec 32) (_ BitVec 64))) (size!8228 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16637)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16637 (_ BitVec 32)) SeekEntryResult!3007)

(assert (=> b!324923 (= res!178263 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156900))))

(declare-fun b!324924 () Bool)

(declare-fun e!200423 () Bool)

(assert (=> b!324924 (= e!200423 e!200424)))

(declare-fun res!178260 () Bool)

(assert (=> b!324924 (=> (not res!178260) (not e!200424))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324924 (= res!178260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156900))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324924 (= lt!156900 (Intermediate!3007 false resIndex!58 resX!58))))

(declare-fun b!324925 () Bool)

(declare-fun res!178255 () Bool)

(assert (=> b!324925 (=> (not res!178255) (not e!200424))))

(assert (=> b!324925 (= res!178255 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7876 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324926 () Bool)

(declare-fun res!178259 () Bool)

(assert (=> b!324926 (=> (not res!178259) (not e!200424))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324926 (= res!178259 (and (= (select (arr!7876 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8228 a!3305))))))

(declare-fun b!324927 () Bool)

(declare-fun res!178254 () Bool)

(assert (=> b!324927 (=> (not res!178254) (not e!200423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16637 (_ BitVec 32)) Bool)

(assert (=> b!324927 (= res!178254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324928 () Bool)

(declare-fun res!178261 () Bool)

(assert (=> b!324928 (=> (not res!178261) (not e!200423))))

(declare-fun arrayContainsKey!0 (array!16637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324928 (= res!178261 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324930 () Bool)

(declare-fun res!178257 () Bool)

(assert (=> b!324930 (=> (not res!178257) (not e!200423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324930 (= res!178257 (validKeyInArray!0 k!2497))))

(declare-fun b!324929 () Bool)

(declare-fun res!178258 () Bool)

(assert (=> b!324929 (=> (not res!178258) (not e!200423))))

(assert (=> b!324929 (= res!178258 (and (= (size!8228 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8228 a!3305))))))

(declare-fun res!178256 () Bool)

(assert (=> start!32498 (=> (not res!178256) (not e!200423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32498 (= res!178256 (validMask!0 mask!3777))))

(assert (=> start!32498 e!200423))

(declare-fun array_inv!5839 (array!16637) Bool)

(assert (=> start!32498 (array_inv!5839 a!3305)))

(assert (=> start!32498 true))

(declare-fun b!324931 () Bool)

(assert (=> b!324931 (= e!200424 false)))

(declare-fun lt!156899 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324931 (= lt!156899 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324932 () Bool)

(declare-fun res!178262 () Bool)

(assert (=> b!324932 (=> (not res!178262) (not e!200423))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16637 (_ BitVec 32)) SeekEntryResult!3007)

(assert (=> b!324932 (= res!178262 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3007 i!1250)))))

(assert (= (and start!32498 res!178256) b!324929))

(assert (= (and b!324929 res!178258) b!324930))

(assert (= (and b!324930 res!178257) b!324928))

(assert (= (and b!324928 res!178261) b!324932))

(assert (= (and b!324932 res!178262) b!324927))

(assert (= (and b!324927 res!178254) b!324924))

(assert (= (and b!324924 res!178260) b!324926))

(assert (= (and b!324926 res!178259) b!324923))

(assert (= (and b!324923 res!178263) b!324925))

(assert (= (and b!324925 res!178255) b!324931))

(declare-fun m!331871 () Bool)

(assert (=> b!324926 m!331871))

(declare-fun m!331873 () Bool)

(assert (=> b!324924 m!331873))

(assert (=> b!324924 m!331873))

(declare-fun m!331875 () Bool)

(assert (=> b!324924 m!331875))

(declare-fun m!331877 () Bool)

(assert (=> b!324931 m!331877))

(declare-fun m!331879 () Bool)

(assert (=> b!324927 m!331879))

(declare-fun m!331881 () Bool)

(assert (=> b!324932 m!331881))

(declare-fun m!331883 () Bool)

(assert (=> b!324930 m!331883))

(declare-fun m!331885 () Bool)

(assert (=> b!324923 m!331885))

(declare-fun m!331887 () Bool)

(assert (=> b!324928 m!331887))

(declare-fun m!331889 () Bool)

(assert (=> start!32498 m!331889))

(declare-fun m!331891 () Bool)

(assert (=> start!32498 m!331891))

(declare-fun m!331893 () Bool)

(assert (=> b!324925 m!331893))

(push 1)

