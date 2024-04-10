; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31074 () Bool)

(assert start!31074)

(declare-fun b!312647 () Bool)

(declare-fun res!169108 () Bool)

(declare-fun e!194923 () Bool)

(assert (=> b!312647 (=> (not res!169108) (not e!194923))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312647 (= res!169108 (validKeyInArray!0 k!2441))))

(declare-fun b!312648 () Bool)

(declare-fun e!194924 () Bool)

(declare-fun e!194925 () Bool)

(assert (=> b!312648 (= e!194924 e!194925)))

(declare-fun res!169103 () Bool)

(assert (=> b!312648 (=> (not res!169103) (not e!194925))))

(declare-datatypes ((array!15976 0))(
  ( (array!15977 (arr!7570 (Array (_ BitVec 32) (_ BitVec 64))) (size!7922 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15976)

(declare-datatypes ((SeekEntryResult!2710 0))(
  ( (MissingZero!2710 (index!13016 (_ BitVec 32))) (Found!2710 (index!13017 (_ BitVec 32))) (Intermediate!2710 (undefined!3522 Bool) (index!13018 (_ BitVec 32)) (x!31219 (_ BitVec 32))) (Undefined!2710) (MissingVacant!2710 (index!13019 (_ BitVec 32))) )
))
(declare-fun lt!153198 () SeekEntryResult!2710)

(declare-fun lt!153199 () SeekEntryResult!2710)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312648 (= res!169103 (and (= lt!153198 lt!153199) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7570 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15976 (_ BitVec 32)) SeekEntryResult!2710)

(assert (=> b!312648 (= lt!153198 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!169109 () Bool)

(assert (=> start!31074 (=> (not res!169109) (not e!194923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31074 (= res!169109 (validMask!0 mask!3709))))

(assert (=> start!31074 e!194923))

(declare-fun array_inv!5533 (array!15976) Bool)

(assert (=> start!31074 (array_inv!5533 a!3293)))

(assert (=> start!31074 true))

(declare-fun b!312649 () Bool)

(declare-fun res!169110 () Bool)

(assert (=> b!312649 (=> (not res!169110) (not e!194923))))

(declare-fun arrayContainsKey!0 (array!15976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312649 (= res!169110 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312650 () Bool)

(declare-fun e!194926 () Bool)

(assert (=> b!312650 (= e!194925 (not e!194926))))

(declare-fun res!169101 () Bool)

(assert (=> b!312650 (=> res!169101 e!194926)))

(declare-fun lt!153200 () SeekEntryResult!2710)

(declare-fun lt!153195 () (_ BitVec 32))

(assert (=> b!312650 (= res!169101 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153195 #b00000000000000000000000000000000) (bvsge lt!153195 (size!7922 a!3293)) (not (= lt!153200 lt!153199))))))

(declare-fun lt!153194 () SeekEntryResult!2710)

(declare-fun lt!153196 () SeekEntryResult!2710)

(assert (=> b!312650 (= lt!153194 lt!153196)))

(declare-fun lt!153201 () array!15976)

(assert (=> b!312650 (= lt!153196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153195 k!2441 lt!153201 mask!3709))))

(assert (=> b!312650 (= lt!153194 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153201 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312650 (= lt!153201 (array!15977 (store (arr!7570 a!3293) i!1240 k!2441) (size!7922 a!3293)))))

(assert (=> b!312650 (= lt!153198 lt!153200)))

(assert (=> b!312650 (= lt!153200 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153195 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312650 (= lt!153195 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312651 () Bool)

(declare-fun res!169102 () Bool)

(assert (=> b!312651 (=> (not res!169102) (not e!194923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15976 (_ BitVec 32)) Bool)

(assert (=> b!312651 (= res!169102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312652 () Bool)

(assert (=> b!312652 (= e!194926 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (=> b!312652 (= lt!153196 lt!153200)))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-datatypes ((Unit!9651 0))(
  ( (Unit!9652) )
))
(declare-fun lt!153197 () Unit!9651)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15976 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9651)

(assert (=> b!312652 (= lt!153197 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153195 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312653 () Bool)

(declare-fun res!169104 () Bool)

(assert (=> b!312653 (=> (not res!169104) (not e!194923))))

(assert (=> b!312653 (= res!169104 (and (= (size!7922 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7922 a!3293))))))

(declare-fun b!312654 () Bool)

(declare-fun res!169107 () Bool)

(assert (=> b!312654 (=> (not res!169107) (not e!194924))))

(assert (=> b!312654 (= res!169107 (and (= (select (arr!7570 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7922 a!3293))))))

(declare-fun b!312655 () Bool)

(assert (=> b!312655 (= e!194923 e!194924)))

(declare-fun res!169106 () Bool)

(assert (=> b!312655 (=> (not res!169106) (not e!194924))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312655 (= res!169106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153199))))

(assert (=> b!312655 (= lt!153199 (Intermediate!2710 false resIndex!52 resX!52))))

(declare-fun b!312656 () Bool)

(declare-fun res!169105 () Bool)

(assert (=> b!312656 (=> (not res!169105) (not e!194923))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15976 (_ BitVec 32)) SeekEntryResult!2710)

(assert (=> b!312656 (= res!169105 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2710 i!1240)))))

(assert (= (and start!31074 res!169109) b!312653))

(assert (= (and b!312653 res!169104) b!312647))

(assert (= (and b!312647 res!169108) b!312649))

(assert (= (and b!312649 res!169110) b!312656))

(assert (= (and b!312656 res!169105) b!312651))

(assert (= (and b!312651 res!169102) b!312655))

(assert (= (and b!312655 res!169106) b!312654))

(assert (= (and b!312654 res!169107) b!312648))

(assert (= (and b!312648 res!169103) b!312650))

(assert (= (and b!312650 (not res!169101)) b!312652))

(declare-fun m!322759 () Bool)

(assert (=> b!312652 m!322759))

(declare-fun m!322761 () Bool)

(assert (=> b!312650 m!322761))

(declare-fun m!322763 () Bool)

(assert (=> b!312650 m!322763))

(declare-fun m!322765 () Bool)

(assert (=> b!312650 m!322765))

(declare-fun m!322767 () Bool)

(assert (=> b!312650 m!322767))

(declare-fun m!322769 () Bool)

(assert (=> b!312650 m!322769))

(declare-fun m!322771 () Bool)

(assert (=> b!312654 m!322771))

(declare-fun m!322773 () Bool)

(assert (=> b!312648 m!322773))

(declare-fun m!322775 () Bool)

(assert (=> b!312648 m!322775))

(declare-fun m!322777 () Bool)

(assert (=> b!312651 m!322777))

(declare-fun m!322779 () Bool)

(assert (=> b!312649 m!322779))

(declare-fun m!322781 () Bool)

(assert (=> start!31074 m!322781))

(declare-fun m!322783 () Bool)

(assert (=> start!31074 m!322783))

(declare-fun m!322785 () Bool)

(assert (=> b!312655 m!322785))

(assert (=> b!312655 m!322785))

(declare-fun m!322787 () Bool)

(assert (=> b!312655 m!322787))

(declare-fun m!322789 () Bool)

(assert (=> b!312647 m!322789))

(declare-fun m!322791 () Bool)

(assert (=> b!312656 m!322791))

(push 1)

(assert (not start!31074))

(assert (not b!312652))

(assert (not b!312655))

(assert (not b!312647))

(assert (not b!312656))

(assert (not b!312651))

(assert (not b!312650))

(assert (not b!312649))

(assert (not b!312648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

