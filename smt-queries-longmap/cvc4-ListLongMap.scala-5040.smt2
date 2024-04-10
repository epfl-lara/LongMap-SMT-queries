; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68754 () Bool)

(assert start!68754)

(declare-fun b!801030 () Bool)

(declare-fun res!545561 () Bool)

(declare-fun e!444068 () Bool)

(assert (=> b!801030 (=> (not res!545561) (not e!444068))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801030 (= res!545561 (validKeyInArray!0 k!2044))))

(declare-fun b!801031 () Bool)

(declare-fun res!545549 () Bool)

(declare-fun e!444063 () Bool)

(assert (=> b!801031 (=> (not res!545549) (not e!444063))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43544 0))(
  ( (array!43545 (arr!20852 (Array (_ BitVec 32) (_ BitVec 64))) (size!21273 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43544)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801031 (= res!545549 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21273 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20852 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21273 a!3170)) (= (select (arr!20852 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801032 () Bool)

(declare-fun e!444066 () Bool)

(declare-fun e!444067 () Bool)

(assert (=> b!801032 (= e!444066 e!444067)))

(declare-fun res!545557 () Bool)

(assert (=> b!801032 (=> (not res!545557) (not e!444067))))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8443 0))(
  ( (MissingZero!8443 (index!36140 (_ BitVec 32))) (Found!8443 (index!36141 (_ BitVec 32))) (Intermediate!8443 (undefined!9255 Bool) (index!36142 (_ BitVec 32)) (x!67001 (_ BitVec 32))) (Undefined!8443) (MissingVacant!8443 (index!36143 (_ BitVec 32))) )
))
(declare-fun lt!357971 () SeekEntryResult!8443)

(declare-fun lt!357973 () SeekEntryResult!8443)

(assert (=> b!801032 (= res!545557 (and (= lt!357971 lt!357973) (= lt!357973 (Found!8443 j!153)) (not (= (select (arr!20852 a!3170) index!1236) (select (arr!20852 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43544 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!801032 (= lt!357973 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43544 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!801032 (= lt!357971 (seekEntryOrOpen!0 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801033 () Bool)

(assert (=> b!801033 (= e!444068 e!444063)))

(declare-fun res!545556 () Bool)

(assert (=> b!801033 (=> (not res!545556) (not e!444063))))

(declare-fun lt!357976 () SeekEntryResult!8443)

(assert (=> b!801033 (= res!545556 (or (= lt!357976 (MissingZero!8443 i!1163)) (= lt!357976 (MissingVacant!8443 i!1163))))))

(assert (=> b!801033 (= lt!357976 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801034 () Bool)

(declare-fun res!545552 () Bool)

(assert (=> b!801034 (=> (not res!545552) (not e!444068))))

(assert (=> b!801034 (= res!545552 (validKeyInArray!0 (select (arr!20852 a!3170) j!153)))))

(declare-fun b!801035 () Bool)

(declare-fun res!545559 () Bool)

(assert (=> b!801035 (=> (not res!545559) (not e!444068))))

(assert (=> b!801035 (= res!545559 (and (= (size!21273 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21273 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21273 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801036 () Bool)

(declare-fun res!545551 () Bool)

(assert (=> b!801036 (=> (not res!545551) (not e!444063))))

(declare-datatypes ((List!14815 0))(
  ( (Nil!14812) (Cons!14811 (h!15940 (_ BitVec 64)) (t!21130 List!14815)) )
))
(declare-fun arrayNoDuplicates!0 (array!43544 (_ BitVec 32) List!14815) Bool)

(assert (=> b!801036 (= res!545551 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14812))))

(declare-fun b!801037 () Bool)

(declare-fun res!545554 () Bool)

(declare-fun e!444065 () Bool)

(assert (=> b!801037 (=> (not res!545554) (not e!444065))))

(declare-fun lt!357972 () (_ BitVec 64))

(declare-fun lt!357974 () array!43544)

(declare-fun lt!357977 () SeekEntryResult!8443)

(declare-fun lt!357970 () (_ BitVec 32))

(assert (=> b!801037 (= res!545554 (= lt!357977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357970 vacantAfter!23 lt!357972 lt!357974 mask!3266)))))

(declare-fun res!545558 () Bool)

(assert (=> start!68754 (=> (not res!545558) (not e!444068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68754 (= res!545558 (validMask!0 mask!3266))))

(assert (=> start!68754 e!444068))

(assert (=> start!68754 true))

(declare-fun array_inv!16648 (array!43544) Bool)

(assert (=> start!68754 (array_inv!16648 a!3170)))

(declare-fun b!801038 () Bool)

(assert (=> b!801038 (= e!444067 e!444065)))

(declare-fun res!545550 () Bool)

(assert (=> b!801038 (=> (not res!545550) (not e!444065))))

(assert (=> b!801038 (= res!545550 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357970 #b00000000000000000000000000000000) (bvslt lt!357970 (size!21273 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801038 (= lt!357970 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801039 () Bool)

(declare-fun res!545555 () Bool)

(assert (=> b!801039 (=> (not res!545555) (not e!444068))))

(declare-fun arrayContainsKey!0 (array!43544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801039 (= res!545555 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801040 () Bool)

(assert (=> b!801040 (= e!444063 e!444066)))

(declare-fun res!545553 () Bool)

(assert (=> b!801040 (=> (not res!545553) (not e!444066))))

(assert (=> b!801040 (= res!545553 (= lt!357977 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357972 lt!357974 mask!3266)))))

(assert (=> b!801040 (= lt!357977 (seekEntryOrOpen!0 lt!357972 lt!357974 mask!3266))))

(assert (=> b!801040 (= lt!357972 (select (store (arr!20852 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801040 (= lt!357974 (array!43545 (store (arr!20852 a!3170) i!1163 k!2044) (size!21273 a!3170)))))

(declare-fun b!801041 () Bool)

(assert (=> b!801041 (= e!444065 false)))

(declare-fun lt!357975 () SeekEntryResult!8443)

(assert (=> b!801041 (= lt!357975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357970 vacantBefore!23 (select (arr!20852 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801042 () Bool)

(declare-fun res!545560 () Bool)

(assert (=> b!801042 (=> (not res!545560) (not e!444063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43544 (_ BitVec 32)) Bool)

(assert (=> b!801042 (= res!545560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68754 res!545558) b!801035))

(assert (= (and b!801035 res!545559) b!801034))

(assert (= (and b!801034 res!545552) b!801030))

(assert (= (and b!801030 res!545561) b!801039))

(assert (= (and b!801039 res!545555) b!801033))

(assert (= (and b!801033 res!545556) b!801042))

(assert (= (and b!801042 res!545560) b!801036))

(assert (= (and b!801036 res!545551) b!801031))

(assert (= (and b!801031 res!545549) b!801040))

(assert (= (and b!801040 res!545553) b!801032))

(assert (= (and b!801032 res!545557) b!801038))

(assert (= (and b!801038 res!545550) b!801037))

(assert (= (and b!801037 res!545554) b!801041))

(declare-fun m!742163 () Bool)

(assert (=> b!801038 m!742163))

(declare-fun m!742165 () Bool)

(assert (=> start!68754 m!742165))

(declare-fun m!742167 () Bool)

(assert (=> start!68754 m!742167))

(declare-fun m!742169 () Bool)

(assert (=> b!801042 m!742169))

(declare-fun m!742171 () Bool)

(assert (=> b!801041 m!742171))

(assert (=> b!801041 m!742171))

(declare-fun m!742173 () Bool)

(assert (=> b!801041 m!742173))

(declare-fun m!742175 () Bool)

(assert (=> b!801033 m!742175))

(declare-fun m!742177 () Bool)

(assert (=> b!801032 m!742177))

(assert (=> b!801032 m!742171))

(assert (=> b!801032 m!742171))

(declare-fun m!742179 () Bool)

(assert (=> b!801032 m!742179))

(assert (=> b!801032 m!742171))

(declare-fun m!742181 () Bool)

(assert (=> b!801032 m!742181))

(declare-fun m!742183 () Bool)

(assert (=> b!801040 m!742183))

(declare-fun m!742185 () Bool)

(assert (=> b!801040 m!742185))

(declare-fun m!742187 () Bool)

(assert (=> b!801040 m!742187))

(declare-fun m!742189 () Bool)

(assert (=> b!801040 m!742189))

(declare-fun m!742191 () Bool)

(assert (=> b!801039 m!742191))

(assert (=> b!801034 m!742171))

(assert (=> b!801034 m!742171))

(declare-fun m!742193 () Bool)

(assert (=> b!801034 m!742193))

(declare-fun m!742195 () Bool)

(assert (=> b!801030 m!742195))

(declare-fun m!742197 () Bool)

(assert (=> b!801036 m!742197))

(declare-fun m!742199 () Bool)

(assert (=> b!801037 m!742199))

(declare-fun m!742201 () Bool)

(assert (=> b!801031 m!742201))

(declare-fun m!742203 () Bool)

(assert (=> b!801031 m!742203))

(push 1)

