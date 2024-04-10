; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49114 () Bool)

(assert start!49114)

(declare-fun b!541046 () Bool)

(declare-fun res!335935 () Bool)

(declare-fun e!313345 () Bool)

(assert (=> b!541046 (=> (not res!335935) (not e!313345))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34224 0))(
  ( (array!34225 (arr!16448 (Array (_ BitVec 32) (_ BitVec 64))) (size!16812 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34224)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4906 0))(
  ( (MissingZero!4906 (index!21848 (_ BitVec 32))) (Found!4906 (index!21849 (_ BitVec 32))) (Intermediate!4906 (undefined!5718 Bool) (index!21850 (_ BitVec 32)) (x!50757 (_ BitVec 32))) (Undefined!4906) (MissingVacant!4906 (index!21851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34224 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!541046 (= res!335935 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16448 a!3154) j!147) a!3154 mask!3216) (Intermediate!4906 false resIndex!32 resX!32)))))

(declare-fun b!541047 () Bool)

(declare-fun res!335937 () Bool)

(declare-fun e!313347 () Bool)

(assert (=> b!541047 (=> (not res!335937) (not e!313347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541047 (= res!335937 (validKeyInArray!0 (select (arr!16448 a!3154) j!147)))))

(declare-fun b!541048 () Bool)

(declare-fun res!335942 () Bool)

(assert (=> b!541048 (=> (not res!335942) (not e!313347))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541048 (= res!335942 (and (= (size!16812 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16812 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16812 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541050 () Bool)

(declare-fun res!335934 () Bool)

(assert (=> b!541050 (=> (not res!335934) (not e!313345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34224 (_ BitVec 32)) Bool)

(assert (=> b!541050 (= res!335934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541051 () Bool)

(assert (=> b!541051 (= e!313345 false)))

(declare-fun lt!247543 () SeekEntryResult!4906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541051 (= lt!247543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16448 a!3154) j!147) mask!3216) (select (arr!16448 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541052 () Bool)

(declare-fun res!335938 () Bool)

(assert (=> b!541052 (=> (not res!335938) (not e!313345))))

(declare-datatypes ((List!10567 0))(
  ( (Nil!10564) (Cons!10563 (h!11512 (_ BitVec 64)) (t!16795 List!10567)) )
))
(declare-fun arrayNoDuplicates!0 (array!34224 (_ BitVec 32) List!10567) Bool)

(assert (=> b!541052 (= res!335938 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10564))))

(declare-fun b!541053 () Bool)

(declare-fun res!335933 () Bool)

(assert (=> b!541053 (=> (not res!335933) (not e!313347))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!541053 (= res!335933 (validKeyInArray!0 k!1998))))

(declare-fun b!541054 () Bool)

(declare-fun res!335941 () Bool)

(assert (=> b!541054 (=> (not res!335941) (not e!313347))))

(declare-fun arrayContainsKey!0 (array!34224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541054 (= res!335941 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541055 () Bool)

(declare-fun res!335936 () Bool)

(assert (=> b!541055 (=> (not res!335936) (not e!313345))))

(assert (=> b!541055 (= res!335936 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16812 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16812 a!3154)) (= (select (arr!16448 a!3154) resIndex!32) (select (arr!16448 a!3154) j!147))))))

(declare-fun b!541049 () Bool)

(assert (=> b!541049 (= e!313347 e!313345)))

(declare-fun res!335940 () Bool)

(assert (=> b!541049 (=> (not res!335940) (not e!313345))))

(declare-fun lt!247542 () SeekEntryResult!4906)

(assert (=> b!541049 (= res!335940 (or (= lt!247542 (MissingZero!4906 i!1153)) (= lt!247542 (MissingVacant!4906 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34224 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!541049 (= lt!247542 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!335939 () Bool)

(assert (=> start!49114 (=> (not res!335939) (not e!313347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49114 (= res!335939 (validMask!0 mask!3216))))

(assert (=> start!49114 e!313347))

(assert (=> start!49114 true))

(declare-fun array_inv!12244 (array!34224) Bool)

(assert (=> start!49114 (array_inv!12244 a!3154)))

(assert (= (and start!49114 res!335939) b!541048))

(assert (= (and b!541048 res!335942) b!541047))

(assert (= (and b!541047 res!335937) b!541053))

(assert (= (and b!541053 res!335933) b!541054))

(assert (= (and b!541054 res!335941) b!541049))

(assert (= (and b!541049 res!335940) b!541050))

(assert (= (and b!541050 res!335934) b!541052))

(assert (= (and b!541052 res!335938) b!541055))

(assert (= (and b!541055 res!335936) b!541046))

(assert (= (and b!541046 res!335935) b!541051))

(declare-fun m!519673 () Bool)

(assert (=> b!541054 m!519673))

(declare-fun m!519675 () Bool)

(assert (=> b!541053 m!519675))

(declare-fun m!519677 () Bool)

(assert (=> b!541051 m!519677))

(assert (=> b!541051 m!519677))

(declare-fun m!519679 () Bool)

(assert (=> b!541051 m!519679))

(assert (=> b!541051 m!519679))

(assert (=> b!541051 m!519677))

(declare-fun m!519681 () Bool)

(assert (=> b!541051 m!519681))

(declare-fun m!519683 () Bool)

(assert (=> b!541049 m!519683))

(declare-fun m!519685 () Bool)

(assert (=> b!541055 m!519685))

(assert (=> b!541055 m!519677))

(declare-fun m!519687 () Bool)

(assert (=> b!541052 m!519687))

(assert (=> b!541047 m!519677))

(assert (=> b!541047 m!519677))

(declare-fun m!519689 () Bool)

(assert (=> b!541047 m!519689))

(declare-fun m!519691 () Bool)

(assert (=> start!49114 m!519691))

(declare-fun m!519693 () Bool)

(assert (=> start!49114 m!519693))

(declare-fun m!519695 () Bool)

(assert (=> b!541050 m!519695))

(assert (=> b!541046 m!519677))

(assert (=> b!541046 m!519677))

(declare-fun m!519697 () Bool)

(assert (=> b!541046 m!519697))

(push 1)

