; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68646 () Bool)

(assert start!68646)

(declare-fun b!798924 () Bool)

(declare-fun res!543448 () Bool)

(declare-fun e!443091 () Bool)

(assert (=> b!798924 (=> (not res!543448) (not e!443091))))

(declare-datatypes ((array!43436 0))(
  ( (array!43437 (arr!20798 (Array (_ BitVec 32) (_ BitVec 64))) (size!21219 (_ BitVec 32))) )
))
(declare-fun lt!356681 () array!43436)

(declare-fun lt!356677 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8389 0))(
  ( (MissingZero!8389 (index!35924 (_ BitVec 32))) (Found!8389 (index!35925 (_ BitVec 32))) (Intermediate!8389 (undefined!9201 Bool) (index!35926 (_ BitVec 32)) (x!66803 (_ BitVec 32))) (Undefined!8389) (MissingVacant!8389 (index!35927 (_ BitVec 32))) )
))
(declare-fun lt!356676 () SeekEntryResult!8389)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356675 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43436 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!798924 (= res!543448 (= lt!356676 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356677 vacantAfter!23 lt!356675 lt!356681 mask!3266)))))

(declare-fun b!798926 () Bool)

(declare-fun e!443096 () Bool)

(declare-fun e!443094 () Bool)

(assert (=> b!798926 (= e!443096 e!443094)))

(declare-fun res!543454 () Bool)

(assert (=> b!798926 (=> (not res!543454) (not e!443094))))

(declare-fun lt!356674 () SeekEntryResult!8389)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798926 (= res!543454 (or (= lt!356674 (MissingZero!8389 i!1163)) (= lt!356674 (MissingVacant!8389 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun a!3170 () array!43436)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43436 (_ BitVec 32)) SeekEntryResult!8389)

(assert (=> b!798926 (= lt!356674 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798927 () Bool)

(declare-fun e!443093 () Bool)

(declare-fun e!443092 () Bool)

(assert (=> b!798927 (= e!443093 e!443092)))

(declare-fun res!543450 () Bool)

(assert (=> b!798927 (=> (not res!543450) (not e!443092))))

(declare-fun lt!356680 () SeekEntryResult!8389)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356678 () SeekEntryResult!8389)

(assert (=> b!798927 (= res!543450 (and (= lt!356680 lt!356678) (= lt!356678 (Found!8389 j!153)) (not (= (select (arr!20798 a!3170) index!1236) (select (arr!20798 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798927 (= lt!356678 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798927 (= lt!356680 (seekEntryOrOpen!0 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798928 () Bool)

(declare-fun res!543455 () Bool)

(assert (=> b!798928 (=> (not res!543455) (not e!443096))))

(declare-fun arrayContainsKey!0 (array!43436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798928 (= res!543455 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798929 () Bool)

(declare-fun res!543453 () Bool)

(assert (=> b!798929 (=> (not res!543453) (not e!443096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798929 (= res!543453 (validKeyInArray!0 k!2044))))

(declare-fun b!798930 () Bool)

(declare-fun res!543446 () Bool)

(assert (=> b!798930 (=> (not res!543446) (not e!443094))))

(declare-datatypes ((List!14761 0))(
  ( (Nil!14758) (Cons!14757 (h!15886 (_ BitVec 64)) (t!21076 List!14761)) )
))
(declare-fun arrayNoDuplicates!0 (array!43436 (_ BitVec 32) List!14761) Bool)

(assert (=> b!798930 (= res!543446 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14758))))

(declare-fun b!798931 () Bool)

(declare-fun res!543447 () Bool)

(assert (=> b!798931 (=> (not res!543447) (not e!443096))))

(assert (=> b!798931 (= res!543447 (validKeyInArray!0 (select (arr!20798 a!3170) j!153)))))

(declare-fun b!798932 () Bool)

(declare-fun res!543451 () Bool)

(assert (=> b!798932 (=> (not res!543451) (not e!443094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43436 (_ BitVec 32)) Bool)

(assert (=> b!798932 (= res!543451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798933 () Bool)

(assert (=> b!798933 (= e!443094 e!443093)))

(declare-fun res!543452 () Bool)

(assert (=> b!798933 (=> (not res!543452) (not e!443093))))

(assert (=> b!798933 (= res!543452 (= lt!356676 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356675 lt!356681 mask!3266)))))

(assert (=> b!798933 (= lt!356676 (seekEntryOrOpen!0 lt!356675 lt!356681 mask!3266))))

(assert (=> b!798933 (= lt!356675 (select (store (arr!20798 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798933 (= lt!356681 (array!43437 (store (arr!20798 a!3170) i!1163 k!2044) (size!21219 a!3170)))))

(declare-fun b!798934 () Bool)

(assert (=> b!798934 (= e!443092 e!443091)))

(declare-fun res!543445 () Bool)

(assert (=> b!798934 (=> (not res!543445) (not e!443091))))

(assert (=> b!798934 (= res!543445 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356677 #b00000000000000000000000000000000) (bvslt lt!356677 (size!21219 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798934 (= lt!356677 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798935 () Bool)

(declare-fun res!543444 () Bool)

(assert (=> b!798935 (=> (not res!543444) (not e!443096))))

(assert (=> b!798935 (= res!543444 (and (= (size!21219 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21219 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21219 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798936 () Bool)

(assert (=> b!798936 (= e!443091 false)))

(declare-fun lt!356679 () SeekEntryResult!8389)

(assert (=> b!798936 (= lt!356679 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356677 vacantBefore!23 (select (arr!20798 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543443 () Bool)

(assert (=> start!68646 (=> (not res!543443) (not e!443096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68646 (= res!543443 (validMask!0 mask!3266))))

(assert (=> start!68646 e!443096))

(assert (=> start!68646 true))

(declare-fun array_inv!16594 (array!43436) Bool)

(assert (=> start!68646 (array_inv!16594 a!3170)))

(declare-fun b!798925 () Bool)

(declare-fun res!543449 () Bool)

(assert (=> b!798925 (=> (not res!543449) (not e!443094))))

(assert (=> b!798925 (= res!543449 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21219 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20798 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21219 a!3170)) (= (select (arr!20798 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68646 res!543443) b!798935))

(assert (= (and b!798935 res!543444) b!798931))

(assert (= (and b!798931 res!543447) b!798929))

(assert (= (and b!798929 res!543453) b!798928))

(assert (= (and b!798928 res!543455) b!798926))

(assert (= (and b!798926 res!543454) b!798932))

(assert (= (and b!798932 res!543451) b!798930))

(assert (= (and b!798930 res!543446) b!798925))

(assert (= (and b!798925 res!543449) b!798933))

(assert (= (and b!798933 res!543452) b!798927))

(assert (= (and b!798927 res!543450) b!798934))

(assert (= (and b!798934 res!543445) b!798924))

(assert (= (and b!798924 res!543448) b!798936))

(declare-fun m!739895 () Bool)

(assert (=> b!798932 m!739895))

(declare-fun m!739897 () Bool)

(assert (=> b!798924 m!739897))

(declare-fun m!739899 () Bool)

(assert (=> start!68646 m!739899))

(declare-fun m!739901 () Bool)

(assert (=> start!68646 m!739901))

(declare-fun m!739903 () Bool)

(assert (=> b!798927 m!739903))

(declare-fun m!739905 () Bool)

(assert (=> b!798927 m!739905))

(assert (=> b!798927 m!739905))

(declare-fun m!739907 () Bool)

(assert (=> b!798927 m!739907))

(assert (=> b!798927 m!739905))

(declare-fun m!739909 () Bool)

(assert (=> b!798927 m!739909))

(declare-fun m!739911 () Bool)

(assert (=> b!798934 m!739911))

(declare-fun m!739913 () Bool)

(assert (=> b!798925 m!739913))

(declare-fun m!739915 () Bool)

(assert (=> b!798925 m!739915))

(assert (=> b!798931 m!739905))

(assert (=> b!798931 m!739905))

(declare-fun m!739917 () Bool)

(assert (=> b!798931 m!739917))

(declare-fun m!739919 () Bool)

(assert (=> b!798930 m!739919))

(declare-fun m!739921 () Bool)

(assert (=> b!798926 m!739921))

(assert (=> b!798936 m!739905))

(assert (=> b!798936 m!739905))

(declare-fun m!739923 () Bool)

(assert (=> b!798936 m!739923))

(declare-fun m!739925 () Bool)

(assert (=> b!798933 m!739925))

(declare-fun m!739927 () Bool)

(assert (=> b!798933 m!739927))

(declare-fun m!739929 () Bool)

(assert (=> b!798933 m!739929))

(declare-fun m!739931 () Bool)

(assert (=> b!798933 m!739931))

(declare-fun m!739933 () Bool)

(assert (=> b!798929 m!739933))

(declare-fun m!739935 () Bool)

(assert (=> b!798928 m!739935))

(push 1)

