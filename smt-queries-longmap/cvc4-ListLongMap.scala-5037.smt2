; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68736 () Bool)

(assert start!68736)

(declare-fun b!800679 () Bool)

(declare-fun e!443905 () Bool)

(declare-fun e!443903 () Bool)

(assert (=> b!800679 (= e!443905 e!443903)))

(declare-fun res!545199 () Bool)

(assert (=> b!800679 (=> (not res!545199) (not e!443903))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43526 0))(
  ( (array!43527 (arr!20843 (Array (_ BitVec 32) (_ BitVec 64))) (size!21264 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43526)

(declare-fun lt!357761 () (_ BitVec 32))

(assert (=> b!800679 (= res!545199 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357761 #b00000000000000000000000000000000) (bvslt lt!357761 (size!21264 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800679 (= lt!357761 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800681 () Bool)

(declare-fun e!443901 () Bool)

(declare-fun e!443902 () Bool)

(assert (=> b!800681 (= e!443901 e!443902)))

(declare-fun res!545205 () Bool)

(assert (=> b!800681 (=> (not res!545205) (not e!443902))))

(declare-datatypes ((SeekEntryResult!8434 0))(
  ( (MissingZero!8434 (index!36104 (_ BitVec 32))) (Found!8434 (index!36105 (_ BitVec 32))) (Intermediate!8434 (undefined!9246 Bool) (index!36106 (_ BitVec 32)) (x!66968 (_ BitVec 32))) (Undefined!8434) (MissingVacant!8434 (index!36107 (_ BitVec 32))) )
))
(declare-fun lt!357759 () SeekEntryResult!8434)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800681 (= res!545205 (or (= lt!357759 (MissingZero!8434 i!1163)) (= lt!357759 (MissingVacant!8434 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43526 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!800681 (= lt!357759 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800682 () Bool)

(declare-fun res!545203 () Bool)

(assert (=> b!800682 (=> (not res!545203) (not e!443901))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800682 (= res!545203 (validKeyInArray!0 (select (arr!20843 a!3170) j!153)))))

(declare-fun b!800683 () Bool)

(declare-fun res!545198 () Bool)

(assert (=> b!800683 (=> (not res!545198) (not e!443903))))

(declare-fun lt!357760 () array!43526)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357757 () (_ BitVec 64))

(declare-fun lt!357755 () SeekEntryResult!8434)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43526 (_ BitVec 32)) SeekEntryResult!8434)

(assert (=> b!800683 (= res!545198 (= lt!357755 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357761 vacantAfter!23 lt!357757 lt!357760 mask!3266)))))

(declare-fun b!800684 () Bool)

(declare-fun res!545204 () Bool)

(assert (=> b!800684 (=> (not res!545204) (not e!443902))))

(declare-datatypes ((List!14806 0))(
  ( (Nil!14803) (Cons!14802 (h!15931 (_ BitVec 64)) (t!21121 List!14806)) )
))
(declare-fun arrayNoDuplicates!0 (array!43526 (_ BitVec 32) List!14806) Bool)

(assert (=> b!800684 (= res!545204 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14803))))

(declare-fun b!800685 () Bool)

(declare-fun e!443906 () Bool)

(assert (=> b!800685 (= e!443906 e!443905)))

(declare-fun res!545210 () Bool)

(assert (=> b!800685 (=> (not res!545210) (not e!443905))))

(declare-fun lt!357758 () SeekEntryResult!8434)

(declare-fun lt!357756 () SeekEntryResult!8434)

(assert (=> b!800685 (= res!545210 (and (= lt!357758 lt!357756) (= lt!357756 (Found!8434 j!153)) (not (= (select (arr!20843 a!3170) index!1236) (select (arr!20843 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800685 (= lt!357756 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800685 (= lt!357758 (seekEntryOrOpen!0 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545200 () Bool)

(assert (=> start!68736 (=> (not res!545200) (not e!443901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68736 (= res!545200 (validMask!0 mask!3266))))

(assert (=> start!68736 e!443901))

(assert (=> start!68736 true))

(declare-fun array_inv!16639 (array!43526) Bool)

(assert (=> start!68736 (array_inv!16639 a!3170)))

(declare-fun b!800680 () Bool)

(declare-fun res!545202 () Bool)

(assert (=> b!800680 (=> (not res!545202) (not e!443902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43526 (_ BitVec 32)) Bool)

(assert (=> b!800680 (= res!545202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800686 () Bool)

(declare-fun res!545206 () Bool)

(assert (=> b!800686 (=> (not res!545206) (not e!443902))))

(assert (=> b!800686 (= res!545206 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21264 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20843 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21264 a!3170)) (= (select (arr!20843 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800687 () Bool)

(declare-fun res!545209 () Bool)

(assert (=> b!800687 (=> (not res!545209) (not e!443901))))

(declare-fun arrayContainsKey!0 (array!43526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800687 (= res!545209 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800688 () Bool)

(assert (=> b!800688 (= e!443902 e!443906)))

(declare-fun res!545207 () Bool)

(assert (=> b!800688 (=> (not res!545207) (not e!443906))))

(assert (=> b!800688 (= res!545207 (= lt!357755 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357757 lt!357760 mask!3266)))))

(assert (=> b!800688 (= lt!357755 (seekEntryOrOpen!0 lt!357757 lt!357760 mask!3266))))

(assert (=> b!800688 (= lt!357757 (select (store (arr!20843 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800688 (= lt!357760 (array!43527 (store (arr!20843 a!3170) i!1163 k!2044) (size!21264 a!3170)))))

(declare-fun b!800689 () Bool)

(declare-fun res!545201 () Bool)

(assert (=> b!800689 (=> (not res!545201) (not e!443901))))

(assert (=> b!800689 (= res!545201 (and (= (size!21264 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21264 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21264 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800690 () Bool)

(declare-fun res!545208 () Bool)

(assert (=> b!800690 (=> (not res!545208) (not e!443901))))

(assert (=> b!800690 (= res!545208 (validKeyInArray!0 k!2044))))

(declare-fun b!800691 () Bool)

(assert (=> b!800691 (= e!443903 false)))

(declare-fun lt!357754 () SeekEntryResult!8434)

(assert (=> b!800691 (= lt!357754 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357761 vacantBefore!23 (select (arr!20843 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68736 res!545200) b!800689))

(assert (= (and b!800689 res!545201) b!800682))

(assert (= (and b!800682 res!545203) b!800690))

(assert (= (and b!800690 res!545208) b!800687))

(assert (= (and b!800687 res!545209) b!800681))

(assert (= (and b!800681 res!545205) b!800680))

(assert (= (and b!800680 res!545202) b!800684))

(assert (= (and b!800684 res!545204) b!800686))

(assert (= (and b!800686 res!545206) b!800688))

(assert (= (and b!800688 res!545207) b!800685))

(assert (= (and b!800685 res!545210) b!800679))

(assert (= (and b!800679 res!545199) b!800683))

(assert (= (and b!800683 res!545198) b!800691))

(declare-fun m!741785 () Bool)

(assert (=> b!800687 m!741785))

(declare-fun m!741787 () Bool)

(assert (=> b!800684 m!741787))

(declare-fun m!741789 () Bool)

(assert (=> start!68736 m!741789))

(declare-fun m!741791 () Bool)

(assert (=> start!68736 m!741791))

(declare-fun m!741793 () Bool)

(assert (=> b!800688 m!741793))

(declare-fun m!741795 () Bool)

(assert (=> b!800688 m!741795))

(declare-fun m!741797 () Bool)

(assert (=> b!800688 m!741797))

(declare-fun m!741799 () Bool)

(assert (=> b!800688 m!741799))

(declare-fun m!741801 () Bool)

(assert (=> b!800683 m!741801))

(declare-fun m!741803 () Bool)

(assert (=> b!800685 m!741803))

(declare-fun m!741805 () Bool)

(assert (=> b!800685 m!741805))

(assert (=> b!800685 m!741805))

(declare-fun m!741807 () Bool)

(assert (=> b!800685 m!741807))

(assert (=> b!800685 m!741805))

(declare-fun m!741809 () Bool)

(assert (=> b!800685 m!741809))

(declare-fun m!741811 () Bool)

(assert (=> b!800680 m!741811))

(assert (=> b!800682 m!741805))

(assert (=> b!800682 m!741805))

(declare-fun m!741813 () Bool)

(assert (=> b!800682 m!741813))

(declare-fun m!741815 () Bool)

(assert (=> b!800679 m!741815))

(declare-fun m!741817 () Bool)

(assert (=> b!800686 m!741817))

(declare-fun m!741819 () Bool)

(assert (=> b!800686 m!741819))

(declare-fun m!741821 () Bool)

(assert (=> b!800681 m!741821))

(assert (=> b!800691 m!741805))

(assert (=> b!800691 m!741805))

(declare-fun m!741823 () Bool)

(assert (=> b!800691 m!741823))

(declare-fun m!741825 () Bool)

(assert (=> b!800690 m!741825))

(push 1)

