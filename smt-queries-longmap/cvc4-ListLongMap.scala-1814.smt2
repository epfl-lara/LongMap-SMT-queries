; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32696 () Bool)

(assert start!32696)

(declare-fun b!326741 () Bool)

(declare-fun res!179775 () Bool)

(declare-fun e!201116 () Bool)

(assert (=> b!326741 (=> (not res!179775) (not e!201116))))

(declare-datatypes ((array!16733 0))(
  ( (array!16734 (arr!7921 (Array (_ BitVec 32) (_ BitVec 64))) (size!8273 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16733)

(declare-datatypes ((SeekEntryResult!3052 0))(
  ( (MissingZero!3052 (index!14384 (_ BitVec 32))) (Found!3052 (index!14385 (_ BitVec 32))) (Intermediate!3052 (undefined!3864 Bool) (index!14386 (_ BitVec 32)) (x!32626 (_ BitVec 32))) (Undefined!3052) (MissingVacant!3052 (index!14387 (_ BitVec 32))) )
))
(declare-fun lt!157386 () SeekEntryResult!3052)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16733 (_ BitVec 32)) SeekEntryResult!3052)

(assert (=> b!326741 (= res!179775 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157386))))

(declare-fun b!326742 () Bool)

(declare-fun res!179777 () Bool)

(declare-fun e!201117 () Bool)

(assert (=> b!326742 (=> (not res!179777) (not e!201117))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326742 (= res!179777 (and (= (size!8273 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8273 a!3305))))))

(declare-fun b!326744 () Bool)

(declare-fun res!179773 () Bool)

(assert (=> b!326744 (=> (not res!179773) (not e!201117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326744 (= res!179773 (validKeyInArray!0 k!2497))))

(declare-fun b!326745 () Bool)

(declare-fun res!179780 () Bool)

(assert (=> b!326745 (=> (not res!179780) (not e!201116))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326745 (= res!179780 (and (= (select (arr!7921 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8273 a!3305))))))

(declare-fun b!326746 () Bool)

(declare-fun res!179781 () Bool)

(assert (=> b!326746 (=> (not res!179781) (not e!201117))))

(declare-fun arrayContainsKey!0 (array!16733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326746 (= res!179781 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326747 () Bool)

(declare-fun res!179779 () Bool)

(assert (=> b!326747 (=> (not res!179779) (not e!201117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16733 (_ BitVec 32)) Bool)

(assert (=> b!326747 (= res!179779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326748 () Bool)

(assert (=> b!326748 (= e!201117 e!201116)))

(declare-fun res!179774 () Bool)

(assert (=> b!326748 (=> (not res!179774) (not e!201116))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326748 (= res!179774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157386))))

(assert (=> b!326748 (= lt!157386 (Intermediate!3052 false resIndex!58 resX!58))))

(declare-fun b!326743 () Bool)

(declare-fun res!179772 () Bool)

(assert (=> b!326743 (=> (not res!179772) (not e!201116))))

(assert (=> b!326743 (= res!179772 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7921 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179776 () Bool)

(assert (=> start!32696 (=> (not res!179776) (not e!201117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32696 (= res!179776 (validMask!0 mask!3777))))

(assert (=> start!32696 e!201117))

(declare-fun array_inv!5884 (array!16733) Bool)

(assert (=> start!32696 (array_inv!5884 a!3305)))

(assert (=> start!32696 true))

(declare-fun b!326749 () Bool)

(declare-fun res!179778 () Bool)

(assert (=> b!326749 (=> (not res!179778) (not e!201117))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16733 (_ BitVec 32)) SeekEntryResult!3052)

(assert (=> b!326749 (= res!179778 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3052 i!1250)))))

(declare-fun b!326750 () Bool)

(assert (=> b!326750 (= e!201116 false)))

(declare-datatypes ((Unit!10138 0))(
  ( (Unit!10139) )
))
(declare-fun lt!157385 () Unit!10138)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16733 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10138)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326750 (= lt!157385 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32696 res!179776) b!326742))

(assert (= (and b!326742 res!179777) b!326744))

(assert (= (and b!326744 res!179773) b!326746))

(assert (= (and b!326746 res!179781) b!326749))

(assert (= (and b!326749 res!179778) b!326747))

(assert (= (and b!326747 res!179779) b!326748))

(assert (= (and b!326748 res!179774) b!326745))

(assert (= (and b!326745 res!179780) b!326741))

(assert (= (and b!326741 res!179775) b!326743))

(assert (= (and b!326743 res!179772) b!326750))

(declare-fun m!333249 () Bool)

(assert (=> b!326741 m!333249))

(declare-fun m!333251 () Bool)

(assert (=> b!326745 m!333251))

(declare-fun m!333253 () Bool)

(assert (=> b!326743 m!333253))

(declare-fun m!333255 () Bool)

(assert (=> b!326746 m!333255))

(declare-fun m!333257 () Bool)

(assert (=> b!326748 m!333257))

(assert (=> b!326748 m!333257))

(declare-fun m!333259 () Bool)

(assert (=> b!326748 m!333259))

(declare-fun m!333261 () Bool)

(assert (=> b!326747 m!333261))

(declare-fun m!333263 () Bool)

(assert (=> b!326744 m!333263))

(declare-fun m!333265 () Bool)

(assert (=> b!326749 m!333265))

(declare-fun m!333267 () Bool)

(assert (=> b!326750 m!333267))

(assert (=> b!326750 m!333267))

(declare-fun m!333269 () Bool)

(assert (=> b!326750 m!333269))

(declare-fun m!333271 () Bool)

(assert (=> start!32696 m!333271))

(declare-fun m!333273 () Bool)

(assert (=> start!32696 m!333273))

(push 1)

(assert (not b!326741))

(assert (not b!326747))

(assert (not b!326746))

(assert (not b!326750))

(assert (not b!326744))

(assert (not b!326748))

(assert (not start!32696))

(assert (not b!326749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

