; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32420 () Bool)

(assert start!32420)

(declare-fun b!323684 () Bool)

(declare-fun res!177134 () Bool)

(declare-fun e!200024 () Bool)

(assert (=> b!323684 (=> (not res!177134) (not e!200024))))

(declare-datatypes ((array!16559 0))(
  ( (array!16560 (arr!7837 (Array (_ BitVec 32) (_ BitVec 64))) (size!8189 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16559)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16559 (_ BitVec 32)) Bool)

(assert (=> b!323684 (= res!177134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323685 () Bool)

(assert (=> b!323685 false))

(declare-datatypes ((Unit!10039 0))(
  ( (Unit!10040) )
))
(declare-fun lt!156682 () Unit!10039)

(declare-fun e!200029 () Unit!10039)

(assert (=> b!323685 (= lt!156682 e!200029)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!50907 () Bool)

(declare-datatypes ((SeekEntryResult!2968 0))(
  ( (MissingZero!2968 (index!14048 (_ BitVec 32))) (Found!2968 (index!14049 (_ BitVec 32))) (Intermediate!2968 (undefined!3780 Bool) (index!14050 (_ BitVec 32)) (x!32300 (_ BitVec 32))) (Undefined!2968) (MissingVacant!2968 (index!14051 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16559 (_ BitVec 32)) SeekEntryResult!2968)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323685 (= c!50907 (is-Intermediate!2968 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!200026 () Unit!10039)

(declare-fun Unit!10041 () Unit!10039)

(assert (=> b!323685 (= e!200026 Unit!10041)))

(declare-fun b!323686 () Bool)

(declare-fun Unit!10042 () Unit!10039)

(assert (=> b!323686 (= e!200029 Unit!10042)))

(declare-fun b!323687 () Bool)

(declare-fun e!200025 () Unit!10039)

(assert (=> b!323687 (= e!200025 e!200026)))

(declare-fun c!50906 () Bool)

(assert (=> b!323687 (= c!50906 (or (= (select (arr!7837 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7837 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323688 () Bool)

(declare-fun res!177136 () Bool)

(declare-fun e!200028 () Bool)

(assert (=> b!323688 (=> (not res!177136) (not e!200028))))

(declare-fun lt!156684 () SeekEntryResult!2968)

(assert (=> b!323688 (= res!177136 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156684))))

(declare-fun b!323689 () Bool)

(declare-fun res!177130 () Bool)

(assert (=> b!323689 (=> (not res!177130) (not e!200024))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323689 (= res!177130 (and (= (size!8189 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8189 a!3305))))))

(declare-fun b!323690 () Bool)

(declare-fun res!177135 () Bool)

(assert (=> b!323690 (=> (not res!177135) (not e!200024))))

(declare-fun arrayContainsKey!0 (array!16559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323690 (= res!177135 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323691 () Bool)

(assert (=> b!323691 (= e!200028 (not (or (not (= (select (arr!7837 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323691 (= index!1840 resIndex!58)))

(declare-fun lt!156683 () Unit!10039)

(assert (=> b!323691 (= lt!156683 e!200025)))

(declare-fun c!50905 () Bool)

(assert (=> b!323691 (= c!50905 (not (= resIndex!58 index!1840)))))

(declare-fun b!323692 () Bool)

(declare-fun res!177138 () Bool)

(assert (=> b!323692 (=> (not res!177138) (not e!200028))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323692 (= res!177138 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7837 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun res!177132 () Bool)

(assert (=> start!32420 (=> (not res!177132) (not e!200024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32420 (= res!177132 (validMask!0 mask!3777))))

(assert (=> start!32420 e!200024))

(declare-fun array_inv!5800 (array!16559) Bool)

(assert (=> start!32420 (array_inv!5800 a!3305)))

(assert (=> start!32420 true))

(declare-fun b!323693 () Bool)

(assert (=> b!323693 (= e!200024 e!200028)))

(declare-fun res!177137 () Bool)

(assert (=> b!323693 (=> (not res!177137) (not e!200028))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323693 (= res!177137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156684))))

(assert (=> b!323693 (= lt!156684 (Intermediate!2968 false resIndex!58 resX!58))))

(declare-fun b!323694 () Bool)

(declare-fun res!177131 () Bool)

(assert (=> b!323694 (=> (not res!177131) (not e!200024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323694 (= res!177131 (validKeyInArray!0 k!2497))))

(declare-fun b!323695 () Bool)

(declare-fun Unit!10043 () Unit!10039)

(assert (=> b!323695 (= e!200025 Unit!10043)))

(declare-fun b!323696 () Bool)

(declare-fun Unit!10044 () Unit!10039)

(assert (=> b!323696 (= e!200029 Unit!10044)))

(assert (=> b!323696 false))

(declare-fun b!323697 () Bool)

(declare-fun res!177129 () Bool)

(assert (=> b!323697 (=> (not res!177129) (not e!200028))))

(assert (=> b!323697 (= res!177129 (and (= (select (arr!7837 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8189 a!3305))))))

(declare-fun b!323698 () Bool)

(assert (=> b!323698 false))

(declare-fun Unit!10045 () Unit!10039)

(assert (=> b!323698 (= e!200026 Unit!10045)))

(declare-fun b!323699 () Bool)

(declare-fun res!177133 () Bool)

(assert (=> b!323699 (=> (not res!177133) (not e!200024))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16559 (_ BitVec 32)) SeekEntryResult!2968)

(assert (=> b!323699 (= res!177133 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2968 i!1250)))))

(assert (= (and start!32420 res!177132) b!323689))

(assert (= (and b!323689 res!177130) b!323694))

(assert (= (and b!323694 res!177131) b!323690))

(assert (= (and b!323690 res!177135) b!323699))

(assert (= (and b!323699 res!177133) b!323684))

(assert (= (and b!323684 res!177134) b!323693))

(assert (= (and b!323693 res!177137) b!323697))

(assert (= (and b!323697 res!177129) b!323688))

(assert (= (and b!323688 res!177136) b!323692))

(assert (= (and b!323692 res!177138) b!323691))

(assert (= (and b!323691 c!50905) b!323687))

(assert (= (and b!323691 (not c!50905)) b!323695))

(assert (= (and b!323687 c!50906) b!323698))

(assert (= (and b!323687 (not c!50906)) b!323685))

(assert (= (and b!323685 c!50907) b!323686))

(assert (= (and b!323685 (not c!50907)) b!323696))

(declare-fun m!330951 () Bool)

(assert (=> b!323690 m!330951))

(declare-fun m!330953 () Bool)

(assert (=> b!323688 m!330953))

(declare-fun m!330955 () Bool)

(assert (=> b!323691 m!330955))

(declare-fun m!330957 () Bool)

(assert (=> b!323697 m!330957))

(declare-fun m!330959 () Bool)

(assert (=> b!323684 m!330959))

(assert (=> b!323687 m!330955))

(declare-fun m!330961 () Bool)

(assert (=> start!32420 m!330961))

(declare-fun m!330963 () Bool)

(assert (=> start!32420 m!330963))

(assert (=> b!323692 m!330955))

(declare-fun m!330965 () Bool)

(assert (=> b!323693 m!330965))

(assert (=> b!323693 m!330965))

(declare-fun m!330967 () Bool)

(assert (=> b!323693 m!330967))

(declare-fun m!330969 () Bool)

(assert (=> b!323685 m!330969))

(assert (=> b!323685 m!330969))

(declare-fun m!330971 () Bool)

(assert (=> b!323685 m!330971))

(declare-fun m!330973 () Bool)

(assert (=> b!323699 m!330973))

(declare-fun m!330975 () Bool)

(assert (=> b!323694 m!330975))

(push 1)

(assert (not b!323690))

(assert (not b!323693))

(assert (not b!323688))

(assert (not b!323684))

(assert (not start!32420))

(assert (not b!323694))

(assert (not b!323699))

(assert (not b!323685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

