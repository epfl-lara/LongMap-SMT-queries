; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46726 () Bool)

(assert start!46726)

(declare-fun b!515842 () Bool)

(declare-fun res!315412 () Bool)

(declare-fun e!301134 () Bool)

(assert (=> b!515842 (=> (not res!315412) (not e!301134))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33038 0))(
  ( (array!33039 (arr!15887 (Array (_ BitVec 32) (_ BitVec 64))) (size!16251 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33038)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515842 (= res!315412 (and (= (size!16251 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16251 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16251 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515843 () Bool)

(declare-fun res!315406 () Bool)

(assert (=> b!515843 (=> (not res!315406) (not e!301134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515843 (= res!315406 (validKeyInArray!0 (select (arr!15887 a!3235) j!176)))))

(declare-fun b!515845 () Bool)

(declare-fun e!301131 () Bool)

(assert (=> b!515845 (= e!301134 e!301131)))

(declare-fun res!315413 () Bool)

(assert (=> b!515845 (=> (not res!315413) (not e!301131))))

(declare-datatypes ((SeekEntryResult!4354 0))(
  ( (MissingZero!4354 (index!19604 (_ BitVec 32))) (Found!4354 (index!19605 (_ BitVec 32))) (Intermediate!4354 (undefined!5166 Bool) (index!19606 (_ BitVec 32)) (x!48565 (_ BitVec 32))) (Undefined!4354) (MissingVacant!4354 (index!19607 (_ BitVec 32))) )
))
(declare-fun lt!236146 () SeekEntryResult!4354)

(assert (=> b!515845 (= res!315413 (or (= lt!236146 (MissingZero!4354 i!1204)) (= lt!236146 (MissingVacant!4354 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33038 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!515845 (= lt!236146 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515846 () Bool)

(declare-fun res!315416 () Bool)

(assert (=> b!515846 (=> (not res!315416) (not e!301134))))

(declare-fun arrayContainsKey!0 (array!33038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515846 (= res!315416 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515847 () Bool)

(declare-fun e!301130 () Bool)

(assert (=> b!515847 (= e!301131 (not e!301130))))

(declare-fun res!315408 () Bool)

(assert (=> b!515847 (=> res!315408 e!301130)))

(declare-fun lt!236147 () SeekEntryResult!4354)

(declare-fun lt!236148 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33038 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!515847 (= res!315408 (= lt!236147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236148 (select (store (arr!15887 a!3235) i!1204 k!2280) j!176) (array!33039 (store (arr!15887 a!3235) i!1204 k!2280) (size!16251 a!3235)) mask!3524)))))

(declare-fun lt!236149 () (_ BitVec 32))

(assert (=> b!515847 (= lt!236147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236149 (select (arr!15887 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515847 (= lt!236148 (toIndex!0 (select (store (arr!15887 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515847 (= lt!236149 (toIndex!0 (select (arr!15887 a!3235) j!176) mask!3524))))

(declare-fun e!301133 () Bool)

(assert (=> b!515847 e!301133))

(declare-fun res!315407 () Bool)

(assert (=> b!515847 (=> (not res!315407) (not e!301133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33038 (_ BitVec 32)) Bool)

(assert (=> b!515847 (= res!315407 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15966 0))(
  ( (Unit!15967) )
))
(declare-fun lt!236145 () Unit!15966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15966)

(assert (=> b!515847 (= lt!236145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515844 () Bool)

(declare-fun res!315411 () Bool)

(assert (=> b!515844 (=> (not res!315411) (not e!301131))))

(assert (=> b!515844 (= res!315411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315414 () Bool)

(assert (=> start!46726 (=> (not res!315414) (not e!301134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46726 (= res!315414 (validMask!0 mask!3524))))

(assert (=> start!46726 e!301134))

(assert (=> start!46726 true))

(declare-fun array_inv!11683 (array!33038) Bool)

(assert (=> start!46726 (array_inv!11683 a!3235)))

(declare-fun b!515848 () Bool)

(declare-fun res!315415 () Bool)

(assert (=> b!515848 (=> res!315415 e!301130)))

(assert (=> b!515848 (= res!315415 (or (undefined!5166 lt!236147) (not (is-Intermediate!4354 lt!236147))))))

(declare-fun b!515849 () Bool)

(declare-fun res!315410 () Bool)

(assert (=> b!515849 (=> (not res!315410) (not e!301134))))

(assert (=> b!515849 (= res!315410 (validKeyInArray!0 k!2280))))

(declare-fun b!515850 () Bool)

(declare-fun res!315409 () Bool)

(assert (=> b!515850 (=> (not res!315409) (not e!301131))))

(declare-datatypes ((List!10045 0))(
  ( (Nil!10042) (Cons!10041 (h!10939 (_ BitVec 64)) (t!16273 List!10045)) )
))
(declare-fun arrayNoDuplicates!0 (array!33038 (_ BitVec 32) List!10045) Bool)

(assert (=> b!515850 (= res!315409 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10042))))

(declare-fun b!515851 () Bool)

(assert (=> b!515851 (= e!301133 (= (seekEntryOrOpen!0 (select (arr!15887 a!3235) j!176) a!3235 mask!3524) (Found!4354 j!176)))))

(declare-fun b!515852 () Bool)

(assert (=> b!515852 (= e!301130 true)))

(assert (=> b!515852 (and (bvslt (x!48565 lt!236147) #b01111111111111111111111111111110) (or (= (select (arr!15887 a!3235) (index!19606 lt!236147)) (select (arr!15887 a!3235) j!176)) (= (select (arr!15887 a!3235) (index!19606 lt!236147)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15887 a!3235) (index!19606 lt!236147)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46726 res!315414) b!515842))

(assert (= (and b!515842 res!315412) b!515843))

(assert (= (and b!515843 res!315406) b!515849))

(assert (= (and b!515849 res!315410) b!515846))

(assert (= (and b!515846 res!315416) b!515845))

(assert (= (and b!515845 res!315413) b!515844))

(assert (= (and b!515844 res!315411) b!515850))

(assert (= (and b!515850 res!315409) b!515847))

(assert (= (and b!515847 res!315407) b!515851))

(assert (= (and b!515847 (not res!315408)) b!515848))

(assert (= (and b!515848 (not res!315415)) b!515852))

(declare-fun m!497239 () Bool)

(assert (=> b!515846 m!497239))

(declare-fun m!497241 () Bool)

(assert (=> b!515843 m!497241))

(assert (=> b!515843 m!497241))

(declare-fun m!497243 () Bool)

(assert (=> b!515843 m!497243))

(declare-fun m!497245 () Bool)

(assert (=> start!46726 m!497245))

(declare-fun m!497247 () Bool)

(assert (=> start!46726 m!497247))

(declare-fun m!497249 () Bool)

(assert (=> b!515852 m!497249))

(assert (=> b!515852 m!497241))

(declare-fun m!497251 () Bool)

(assert (=> b!515850 m!497251))

(declare-fun m!497253 () Bool)

(assert (=> b!515847 m!497253))

(declare-fun m!497255 () Bool)

(assert (=> b!515847 m!497255))

(assert (=> b!515847 m!497241))

(declare-fun m!497257 () Bool)

(assert (=> b!515847 m!497257))

(assert (=> b!515847 m!497241))

(declare-fun m!497259 () Bool)

(assert (=> b!515847 m!497259))

(assert (=> b!515847 m!497241))

(declare-fun m!497261 () Bool)

(assert (=> b!515847 m!497261))

(assert (=> b!515847 m!497255))

(declare-fun m!497263 () Bool)

(assert (=> b!515847 m!497263))

(declare-fun m!497265 () Bool)

(assert (=> b!515847 m!497265))

(assert (=> b!515847 m!497255))

(declare-fun m!497267 () Bool)

(assert (=> b!515847 m!497267))

(assert (=> b!515851 m!497241))

(assert (=> b!515851 m!497241))

(declare-fun m!497269 () Bool)

(assert (=> b!515851 m!497269))

(declare-fun m!497271 () Bool)

(assert (=> b!515849 m!497271))

(declare-fun m!497273 () Bool)

(assert (=> b!515844 m!497273))

(declare-fun m!497275 () Bool)

(assert (=> b!515845 m!497275))

(push 1)

