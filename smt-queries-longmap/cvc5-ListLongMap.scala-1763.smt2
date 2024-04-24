; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32214 () Bool)

(assert start!32214)

(declare-fun b!320894 () Bool)

(declare-fun res!175067 () Bool)

(declare-fun e!198990 () Bool)

(assert (=> b!320894 (=> (not res!175067) (not e!198990))))

(declare-datatypes ((array!16417 0))(
  ( (array!16418 (arr!7767 (Array (_ BitVec 32) (_ BitVec 64))) (size!8119 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16417)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16417 (_ BitVec 32)) Bool)

(assert (=> b!320894 (= res!175067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320895 () Bool)

(declare-fun res!175070 () Bool)

(assert (=> b!320895 (=> (not res!175070) (not e!198990))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2863 0))(
  ( (MissingZero!2863 (index!13628 (_ BitVec 32))) (Found!2863 (index!13629 (_ BitVec 32))) (Intermediate!2863 (undefined!3675 Bool) (index!13630 (_ BitVec 32)) (x!31999 (_ BitVec 32))) (Undefined!2863) (MissingVacant!2863 (index!13631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16417 (_ BitVec 32)) SeekEntryResult!2863)

(assert (=> b!320895 (= res!175070 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2863 i!1250)))))

(declare-fun b!320896 () Bool)

(declare-fun res!175071 () Bool)

(assert (=> b!320896 (=> (not res!175071) (not e!198990))))

(assert (=> b!320896 (= res!175071 (and (= (size!8119 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8119 a!3305))))))

(declare-fun b!320897 () Bool)

(declare-fun res!175065 () Bool)

(assert (=> b!320897 (=> (not res!175065) (not e!198990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320897 (= res!175065 (validKeyInArray!0 k!2497))))

(declare-fun b!320898 () Bool)

(declare-fun res!175064 () Bool)

(assert (=> b!320898 (=> (not res!175064) (not e!198990))))

(declare-fun arrayContainsKey!0 (array!16417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320898 (= res!175064 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320899 () Bool)

(assert (=> b!320899 (= e!198990 false)))

(declare-fun lt!156156 () SeekEntryResult!2863)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16417 (_ BitVec 32)) SeekEntryResult!2863)

(assert (=> b!320899 (= lt!156156 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!320901 () Bool)

(declare-fun res!175068 () Bool)

(assert (=> b!320901 (=> (not res!175068) (not e!198990))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320901 (= res!175068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2863 false resIndex!58 resX!58)))))

(declare-fun b!320900 () Bool)

(declare-fun res!175069 () Bool)

(assert (=> b!320900 (=> (not res!175069) (not e!198990))))

(assert (=> b!320900 (= res!175069 (and (= (select (arr!7767 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8119 a!3305))))))

(declare-fun res!175066 () Bool)

(assert (=> start!32214 (=> (not res!175066) (not e!198990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32214 (= res!175066 (validMask!0 mask!3777))))

(assert (=> start!32214 e!198990))

(declare-fun array_inv!5717 (array!16417) Bool)

(assert (=> start!32214 (array_inv!5717 a!3305)))

(assert (=> start!32214 true))

(assert (= (and start!32214 res!175066) b!320896))

(assert (= (and b!320896 res!175071) b!320897))

(assert (= (and b!320897 res!175065) b!320898))

(assert (= (and b!320898 res!175064) b!320895))

(assert (= (and b!320895 res!175070) b!320894))

(assert (= (and b!320894 res!175067) b!320901))

(assert (= (and b!320901 res!175068) b!320900))

(assert (= (and b!320900 res!175069) b!320899))

(declare-fun m!329357 () Bool)

(assert (=> b!320899 m!329357))

(declare-fun m!329359 () Bool)

(assert (=> start!32214 m!329359))

(declare-fun m!329361 () Bool)

(assert (=> start!32214 m!329361))

(declare-fun m!329363 () Bool)

(assert (=> b!320897 m!329363))

(declare-fun m!329365 () Bool)

(assert (=> b!320894 m!329365))

(declare-fun m!329367 () Bool)

(assert (=> b!320898 m!329367))

(declare-fun m!329369 () Bool)

(assert (=> b!320900 m!329369))

(declare-fun m!329371 () Bool)

(assert (=> b!320901 m!329371))

(assert (=> b!320901 m!329371))

(declare-fun m!329373 () Bool)

(assert (=> b!320901 m!329373))

(declare-fun m!329375 () Bool)

(assert (=> b!320895 m!329375))

(push 1)

(assert (not b!320901))

(assert (not b!320894))

(assert (not b!320899))

(assert (not start!32214))

(assert (not b!320898))

(assert (not b!320895))

(assert (not b!320897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

