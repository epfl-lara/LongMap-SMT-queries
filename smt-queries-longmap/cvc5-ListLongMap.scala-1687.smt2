; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31010 () Bool)

(assert start!31010)

(declare-fun b!311687 () Bool)

(declare-fun res!168142 () Bool)

(declare-fun e!194444 () Bool)

(assert (=> b!311687 (=> (not res!168142) (not e!194444))))

(declare-datatypes ((array!15912 0))(
  ( (array!15913 (arr!7538 (Array (_ BitVec 32) (_ BitVec 64))) (size!7890 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15912)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15912 (_ BitVec 32)) Bool)

(assert (=> b!311687 (= res!168142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311688 () Bool)

(declare-fun lt!152457 () (_ BitVec 32))

(declare-fun lt!152455 () array!15912)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun e!194442 () Bool)

(declare-datatypes ((SeekEntryResult!2678 0))(
  ( (MissingZero!2678 (index!12888 (_ BitVec 32))) (Found!2678 (index!12889 (_ BitVec 32))) (Intermediate!2678 (undefined!3490 Bool) (index!12890 (_ BitVec 32)) (x!31107 (_ BitVec 32))) (Undefined!2678) (MissingVacant!2678 (index!12891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15912 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!311688 (= e!194442 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152455 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152457 k!2441 lt!152455 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311688 (= lt!152455 (array!15913 (store (arr!7538 a!3293) i!1240 k!2441) (size!7890 a!3293)))))

(declare-fun b!311689 () Bool)

(declare-fun res!168147 () Bool)

(assert (=> b!311689 (=> (not res!168147) (not e!194444))))

(declare-fun arrayContainsKey!0 (array!15912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311689 (= res!168147 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311690 () Bool)

(declare-fun e!194446 () Bool)

(declare-fun e!194445 () Bool)

(assert (=> b!311690 (= e!194446 e!194445)))

(declare-fun res!168150 () Bool)

(assert (=> b!311690 (=> (not res!168150) (not e!194445))))

(declare-fun lt!152456 () SeekEntryResult!2678)

(declare-fun lt!152454 () SeekEntryResult!2678)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311690 (= res!168150 (and (= lt!152454 lt!152456) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7538 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311690 (= lt!152454 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311691 () Bool)

(assert (=> b!311691 (= e!194444 e!194446)))

(declare-fun res!168144 () Bool)

(assert (=> b!311691 (=> (not res!168144) (not e!194446))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311691 (= res!168144 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152456))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311691 (= lt!152456 (Intermediate!2678 false resIndex!52 resX!52))))

(declare-fun b!311692 () Bool)

(declare-fun res!168148 () Bool)

(assert (=> b!311692 (=> (not res!168148) (not e!194444))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15912 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!311692 (= res!168148 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2678 i!1240)))))

(declare-fun b!311693 () Bool)

(declare-fun res!168143 () Bool)

(assert (=> b!311693 (=> (not res!168143) (not e!194444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311693 (= res!168143 (validKeyInArray!0 k!2441))))

(declare-fun b!311695 () Bool)

(declare-fun res!168145 () Bool)

(assert (=> b!311695 (=> (not res!168145) (not e!194444))))

(assert (=> b!311695 (= res!168145 (and (= (size!7890 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7890 a!3293))))))

(declare-fun b!311696 () Bool)

(assert (=> b!311696 (= e!194445 (not true))))

(assert (=> b!311696 e!194442))

(declare-fun res!168141 () Bool)

(assert (=> b!311696 (=> (not res!168141) (not e!194442))))

(assert (=> b!311696 (= res!168141 (= lt!152454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152457 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311696 (= lt!152457 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311694 () Bool)

(declare-fun res!168146 () Bool)

(assert (=> b!311694 (=> (not res!168146) (not e!194446))))

(assert (=> b!311694 (= res!168146 (and (= (select (arr!7538 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7890 a!3293))))))

(declare-fun res!168149 () Bool)

(assert (=> start!31010 (=> (not res!168149) (not e!194444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31010 (= res!168149 (validMask!0 mask!3709))))

(assert (=> start!31010 e!194444))

(declare-fun array_inv!5501 (array!15912) Bool)

(assert (=> start!31010 (array_inv!5501 a!3293)))

(assert (=> start!31010 true))

(assert (= (and start!31010 res!168149) b!311695))

(assert (= (and b!311695 res!168145) b!311693))

(assert (= (and b!311693 res!168143) b!311689))

(assert (= (and b!311689 res!168147) b!311692))

(assert (= (and b!311692 res!168148) b!311687))

(assert (= (and b!311687 res!168142) b!311691))

(assert (= (and b!311691 res!168144) b!311694))

(assert (= (and b!311694 res!168146) b!311690))

(assert (= (and b!311690 res!168150) b!311696))

(assert (= (and b!311696 res!168141) b!311688))

(declare-fun m!321677 () Bool)

(assert (=> b!311690 m!321677))

(declare-fun m!321679 () Bool)

(assert (=> b!311690 m!321679))

(declare-fun m!321681 () Bool)

(assert (=> b!311694 m!321681))

(declare-fun m!321683 () Bool)

(assert (=> start!31010 m!321683))

(declare-fun m!321685 () Bool)

(assert (=> start!31010 m!321685))

(declare-fun m!321687 () Bool)

(assert (=> b!311687 m!321687))

(declare-fun m!321689 () Bool)

(assert (=> b!311693 m!321689))

(declare-fun m!321691 () Bool)

(assert (=> b!311692 m!321691))

(declare-fun m!321693 () Bool)

(assert (=> b!311691 m!321693))

(assert (=> b!311691 m!321693))

(declare-fun m!321695 () Bool)

(assert (=> b!311691 m!321695))

(declare-fun m!321697 () Bool)

(assert (=> b!311688 m!321697))

(declare-fun m!321699 () Bool)

(assert (=> b!311688 m!321699))

(declare-fun m!321701 () Bool)

(assert (=> b!311688 m!321701))

(declare-fun m!321703 () Bool)

(assert (=> b!311696 m!321703))

(declare-fun m!321705 () Bool)

(assert (=> b!311696 m!321705))

(declare-fun m!321707 () Bool)

(assert (=> b!311689 m!321707))

(push 1)

