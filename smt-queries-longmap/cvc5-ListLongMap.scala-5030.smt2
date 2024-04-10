; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68690 () Bool)

(assert start!68690)

(declare-fun b!799782 () Bool)

(declare-fun e!443490 () Bool)

(declare-fun e!443487 () Bool)

(assert (=> b!799782 (= e!443490 e!443487)))

(declare-fun res!544310 () Bool)

(assert (=> b!799782 (=> (not res!544310) (not e!443487))))

(declare-datatypes ((SeekEntryResult!8411 0))(
  ( (MissingZero!8411 (index!36012 (_ BitVec 32))) (Found!8411 (index!36013 (_ BitVec 32))) (Intermediate!8411 (undefined!9223 Bool) (index!36014 (_ BitVec 32)) (x!66889 (_ BitVec 32))) (Undefined!8411) (MissingVacant!8411 (index!36015 (_ BitVec 32))) )
))
(declare-fun lt!357204 () SeekEntryResult!8411)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799782 (= res!544310 (or (= lt!357204 (MissingZero!8411 i!1163)) (= lt!357204 (MissingVacant!8411 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43480 0))(
  ( (array!43481 (arr!20820 (Array (_ BitVec 32) (_ BitVec 64))) (size!21241 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43480)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43480 (_ BitVec 32)) SeekEntryResult!8411)

(assert (=> b!799782 (= lt!357204 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!544311 () Bool)

(assert (=> start!68690 (=> (not res!544311) (not e!443490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68690 (= res!544311 (validMask!0 mask!3266))))

(assert (=> start!68690 e!443490))

(assert (=> start!68690 true))

(declare-fun array_inv!16616 (array!43480) Bool)

(assert (=> start!68690 (array_inv!16616 a!3170)))

(declare-fun b!799783 () Bool)

(declare-fun res!544303 () Bool)

(assert (=> b!799783 (=> (not res!544303) (not e!443487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43480 (_ BitVec 32)) Bool)

(assert (=> b!799783 (= res!544303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799784 () Bool)

(declare-fun e!443489 () Bool)

(declare-fun e!443488 () Bool)

(assert (=> b!799784 (= e!443489 e!443488)))

(declare-fun res!544306 () Bool)

(assert (=> b!799784 (=> (not res!544306) (not e!443488))))

(declare-fun lt!357209 () SeekEntryResult!8411)

(declare-fun lt!357206 () SeekEntryResult!8411)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799784 (= res!544306 (and (= lt!357206 lt!357209) (= lt!357209 (Found!8411 j!153)) (not (= (select (arr!20820 a!3170) index!1236) (select (arr!20820 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43480 (_ BitVec 32)) SeekEntryResult!8411)

(assert (=> b!799784 (= lt!357209 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20820 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799784 (= lt!357206 (seekEntryOrOpen!0 (select (arr!20820 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799785 () Bool)

(declare-fun e!443491 () Bool)

(assert (=> b!799785 (= e!443491 false)))

(declare-fun lt!357205 () (_ BitVec 32))

(declare-fun lt!357203 () SeekEntryResult!8411)

(assert (=> b!799785 (= lt!357203 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357205 vacantBefore!23 (select (arr!20820 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799786 () Bool)

(declare-fun res!544313 () Bool)

(assert (=> b!799786 (=> (not res!544313) (not e!443490))))

(declare-fun arrayContainsKey!0 (array!43480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799786 (= res!544313 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799787 () Bool)

(declare-fun res!544304 () Bool)

(assert (=> b!799787 (=> (not res!544304) (not e!443490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799787 (= res!544304 (validKeyInArray!0 (select (arr!20820 a!3170) j!153)))))

(declare-fun b!799788 () Bool)

(assert (=> b!799788 (= e!443487 e!443489)))

(declare-fun res!544309 () Bool)

(assert (=> b!799788 (=> (not res!544309) (not e!443489))))

(declare-fun lt!357207 () array!43480)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357208 () (_ BitVec 64))

(declare-fun lt!357202 () SeekEntryResult!8411)

(assert (=> b!799788 (= res!544309 (= lt!357202 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357208 lt!357207 mask!3266)))))

(assert (=> b!799788 (= lt!357202 (seekEntryOrOpen!0 lt!357208 lt!357207 mask!3266))))

(assert (=> b!799788 (= lt!357208 (select (store (arr!20820 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!799788 (= lt!357207 (array!43481 (store (arr!20820 a!3170) i!1163 k!2044) (size!21241 a!3170)))))

(declare-fun b!799789 () Bool)

(declare-fun res!544301 () Bool)

(assert (=> b!799789 (=> (not res!544301) (not e!443487))))

(declare-datatypes ((List!14783 0))(
  ( (Nil!14780) (Cons!14779 (h!15908 (_ BitVec 64)) (t!21098 List!14783)) )
))
(declare-fun arrayNoDuplicates!0 (array!43480 (_ BitVec 32) List!14783) Bool)

(assert (=> b!799789 (= res!544301 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14780))))

(declare-fun b!799790 () Bool)

(declare-fun res!544308 () Bool)

(assert (=> b!799790 (=> (not res!544308) (not e!443491))))

(assert (=> b!799790 (= res!544308 (= lt!357202 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357205 vacantAfter!23 lt!357208 lt!357207 mask!3266)))))

(declare-fun b!799791 () Bool)

(declare-fun res!544305 () Bool)

(assert (=> b!799791 (=> (not res!544305) (not e!443490))))

(assert (=> b!799791 (= res!544305 (validKeyInArray!0 k!2044))))

(declare-fun b!799792 () Bool)

(assert (=> b!799792 (= e!443488 e!443491)))

(declare-fun res!544307 () Bool)

(assert (=> b!799792 (=> (not res!544307) (not e!443491))))

(assert (=> b!799792 (= res!544307 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357205 #b00000000000000000000000000000000) (bvslt lt!357205 (size!21241 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799792 (= lt!357205 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799793 () Bool)

(declare-fun res!544312 () Bool)

(assert (=> b!799793 (=> (not res!544312) (not e!443490))))

(assert (=> b!799793 (= res!544312 (and (= (size!21241 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21241 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21241 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799794 () Bool)

(declare-fun res!544302 () Bool)

(assert (=> b!799794 (=> (not res!544302) (not e!443487))))

(assert (=> b!799794 (= res!544302 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21241 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20820 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21241 a!3170)) (= (select (arr!20820 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68690 res!544311) b!799793))

(assert (= (and b!799793 res!544312) b!799787))

(assert (= (and b!799787 res!544304) b!799791))

(assert (= (and b!799791 res!544305) b!799786))

(assert (= (and b!799786 res!544313) b!799782))

(assert (= (and b!799782 res!544310) b!799783))

(assert (= (and b!799783 res!544303) b!799789))

(assert (= (and b!799789 res!544301) b!799794))

(assert (= (and b!799794 res!544302) b!799788))

(assert (= (and b!799788 res!544309) b!799784))

(assert (= (and b!799784 res!544306) b!799792))

(assert (= (and b!799792 res!544307) b!799790))

(assert (= (and b!799790 res!544308) b!799785))

(declare-fun m!740819 () Bool)

(assert (=> b!799782 m!740819))

(declare-fun m!740821 () Bool)

(assert (=> b!799789 m!740821))

(declare-fun m!740823 () Bool)

(assert (=> start!68690 m!740823))

(declare-fun m!740825 () Bool)

(assert (=> start!68690 m!740825))

(declare-fun m!740827 () Bool)

(assert (=> b!799794 m!740827))

(declare-fun m!740829 () Bool)

(assert (=> b!799794 m!740829))

(declare-fun m!740831 () Bool)

(assert (=> b!799790 m!740831))

(declare-fun m!740833 () Bool)

(assert (=> b!799786 m!740833))

(declare-fun m!740835 () Bool)

(assert (=> b!799792 m!740835))

(declare-fun m!740837 () Bool)

(assert (=> b!799783 m!740837))

(declare-fun m!740839 () Bool)

(assert (=> b!799787 m!740839))

(assert (=> b!799787 m!740839))

(declare-fun m!740841 () Bool)

(assert (=> b!799787 m!740841))

(declare-fun m!740843 () Bool)

(assert (=> b!799791 m!740843))

(declare-fun m!740845 () Bool)

(assert (=> b!799788 m!740845))

(declare-fun m!740847 () Bool)

(assert (=> b!799788 m!740847))

(declare-fun m!740849 () Bool)

(assert (=> b!799788 m!740849))

(declare-fun m!740851 () Bool)

(assert (=> b!799788 m!740851))

(declare-fun m!740853 () Bool)

(assert (=> b!799784 m!740853))

(assert (=> b!799784 m!740839))

(assert (=> b!799784 m!740839))

(declare-fun m!740855 () Bool)

(assert (=> b!799784 m!740855))

(assert (=> b!799784 m!740839))

(declare-fun m!740857 () Bool)

(assert (=> b!799784 m!740857))

(assert (=> b!799785 m!740839))

(assert (=> b!799785 m!740839))

(declare-fun m!740859 () Bool)

(assert (=> b!799785 m!740859))

(push 1)

