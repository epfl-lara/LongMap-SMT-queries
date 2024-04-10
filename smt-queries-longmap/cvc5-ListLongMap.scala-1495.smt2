; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28404 () Bool)

(assert start!28404)

(declare-fun b!290809 () Bool)

(declare-fun e!184018 () Bool)

(declare-fun e!184019 () Bool)

(assert (=> b!290809 (= e!184018 e!184019)))

(declare-fun res!152152 () Bool)

(assert (=> b!290809 (=> (not res!152152) (not e!184019))))

(declare-fun lt!143725 () Bool)

(declare-datatypes ((array!14673 0))(
  ( (array!14674 (arr!6962 (Array (_ BitVec 32) (_ BitVec 64))) (size!7314 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14673)

(declare-datatypes ((SeekEntryResult!2111 0))(
  ( (MissingZero!2111 (index!10614 (_ BitVec 32))) (Found!2111 (index!10615 (_ BitVec 32))) (Intermediate!2111 (undefined!2923 Bool) (index!10616 (_ BitVec 32)) (x!28810 (_ BitVec 32))) (Undefined!2111) (MissingVacant!2111 (index!10617 (_ BitVec 32))) )
))
(declare-fun lt!143723 () SeekEntryResult!2111)

(assert (=> b!290809 (= res!152152 (and (or lt!143725 (not (undefined!2923 lt!143723))) (not lt!143725) (= (select (arr!6962 a!3312) (index!10616 lt!143723)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290809 (= lt!143725 (not (is-Intermediate!2111 lt!143723)))))

(declare-fun b!290810 () Bool)

(declare-fun res!152150 () Bool)

(declare-fun e!184022 () Bool)

(assert (=> b!290810 (=> (not res!152150) (not e!184022))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290810 (= res!152150 (validKeyInArray!0 k!2524))))

(declare-fun b!290811 () Bool)

(declare-fun res!152148 () Bool)

(assert (=> b!290811 (=> (not res!152148) (not e!184022))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290811 (= res!152148 (and (= (size!7314 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7314 a!3312))))))

(declare-fun b!290812 () Bool)

(declare-fun res!152149 () Bool)

(assert (=> b!290812 (=> (not res!152149) (not e!184022))))

(declare-fun arrayContainsKey!0 (array!14673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290812 (= res!152149 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290813 () Bool)

(declare-fun e!184021 () Bool)

(assert (=> b!290813 (= e!184022 e!184021)))

(declare-fun res!152154 () Bool)

(assert (=> b!290813 (=> (not res!152154) (not e!184021))))

(declare-fun lt!143722 () Bool)

(declare-fun lt!143721 () SeekEntryResult!2111)

(assert (=> b!290813 (= res!152154 (or lt!143722 (= lt!143721 (MissingVacant!2111 i!1256))))))

(assert (=> b!290813 (= lt!143722 (= lt!143721 (MissingZero!2111 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14673 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!290813 (= lt!143721 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!152147 () Bool)

(assert (=> start!28404 (=> (not res!152147) (not e!184022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28404 (= res!152147 (validMask!0 mask!3809))))

(assert (=> start!28404 e!184022))

(assert (=> start!28404 true))

(declare-fun array_inv!4925 (array!14673) Bool)

(assert (=> start!28404 (array_inv!4925 a!3312)))

(declare-fun b!290814 () Bool)

(assert (=> b!290814 (= e!184021 e!184018)))

(declare-fun res!152153 () Bool)

(assert (=> b!290814 (=> (not res!152153) (not e!184018))))

(assert (=> b!290814 (= res!152153 (and (not lt!143722) (= lt!143721 (MissingVacant!2111 i!1256))))))

(declare-fun lt!143720 () SeekEntryResult!2111)

(declare-fun lt!143724 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14673 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!290814 (= lt!143720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143724 k!2524 (array!14674 (store (arr!6962 a!3312) i!1256 k!2524) (size!7314 a!3312)) mask!3809))))

(assert (=> b!290814 (= lt!143723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143724 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290814 (= lt!143724 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290815 () Bool)

(declare-fun res!152151 () Bool)

(assert (=> b!290815 (=> (not res!152151) (not e!184021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14673 (_ BitVec 32)) Bool)

(assert (=> b!290815 (= res!152151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290816 () Bool)

(assert (=> b!290816 (= e!184019 (not true))))

(assert (=> b!290816 (= (index!10616 lt!143723) i!1256)))

(assert (= (and start!28404 res!152147) b!290811))

(assert (= (and b!290811 res!152148) b!290810))

(assert (= (and b!290810 res!152150) b!290812))

(assert (= (and b!290812 res!152149) b!290813))

(assert (= (and b!290813 res!152154) b!290815))

(assert (= (and b!290815 res!152151) b!290814))

(assert (= (and b!290814 res!152153) b!290809))

(assert (= (and b!290809 res!152152) b!290816))

(declare-fun m!304797 () Bool)

(assert (=> b!290815 m!304797))

(declare-fun m!304799 () Bool)

(assert (=> b!290810 m!304799))

(declare-fun m!304801 () Bool)

(assert (=> b!290814 m!304801))

(declare-fun m!304803 () Bool)

(assert (=> b!290814 m!304803))

(declare-fun m!304805 () Bool)

(assert (=> b!290814 m!304805))

(declare-fun m!304807 () Bool)

(assert (=> b!290814 m!304807))

(declare-fun m!304809 () Bool)

(assert (=> start!28404 m!304809))

(declare-fun m!304811 () Bool)

(assert (=> start!28404 m!304811))

(declare-fun m!304813 () Bool)

(assert (=> b!290813 m!304813))

(declare-fun m!304815 () Bool)

(assert (=> b!290812 m!304815))

(declare-fun m!304817 () Bool)

(assert (=> b!290809 m!304817))

(push 1)

