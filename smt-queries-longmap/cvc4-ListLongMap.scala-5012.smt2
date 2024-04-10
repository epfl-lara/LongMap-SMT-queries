; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68586 () Bool)

(assert start!68586)

(declare-fun b!797936 () Bool)

(declare-fun res!542459 () Bool)

(declare-fun e!442651 () Bool)

(assert (=> b!797936 (=> (not res!542459) (not e!442651))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43376 0))(
  ( (array!43377 (arr!20768 (Array (_ BitVec 32) (_ BitVec 64))) (size!21189 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43376)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797936 (= res!542459 (and (= (size!21189 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21189 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21189 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797937 () Bool)

(declare-fun e!442653 () Bool)

(declare-fun e!442655 () Bool)

(assert (=> b!797937 (= e!442653 e!442655)))

(declare-fun res!542461 () Bool)

(assert (=> b!797937 (=> (not res!542461) (not e!442655))))

(declare-datatypes ((SeekEntryResult!8359 0))(
  ( (MissingZero!8359 (index!35804 (_ BitVec 32))) (Found!8359 (index!35805 (_ BitVec 32))) (Intermediate!8359 (undefined!9171 Bool) (index!35806 (_ BitVec 32)) (x!66693 (_ BitVec 32))) (Undefined!8359) (MissingVacant!8359 (index!35807 (_ BitVec 32))) )
))
(declare-fun lt!356093 () SeekEntryResult!8359)

(declare-fun lt!356091 () SeekEntryResult!8359)

(assert (=> b!797937 (= res!542461 (= lt!356093 lt!356091))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356092 () (_ BitVec 64))

(declare-fun lt!356094 () array!43376)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43376 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!797937 (= lt!356091 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356092 lt!356094 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43376 (_ BitVec 32)) SeekEntryResult!8359)

(assert (=> b!797937 (= lt!356093 (seekEntryOrOpen!0 lt!356092 lt!356094 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797937 (= lt!356092 (select (store (arr!20768 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797937 (= lt!356094 (array!43377 (store (arr!20768 a!3170) i!1163 k!2044) (size!21189 a!3170)))))

(declare-fun b!797938 () Bool)

(declare-fun res!542462 () Bool)

(assert (=> b!797938 (=> (not res!542462) (not e!442653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43376 (_ BitVec 32)) Bool)

(assert (=> b!797938 (= res!542462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797940 () Bool)

(declare-fun res!542458 () Bool)

(assert (=> b!797940 (=> (not res!542458) (not e!442653))))

(declare-datatypes ((List!14731 0))(
  ( (Nil!14728) (Cons!14727 (h!15856 (_ BitVec 64)) (t!21046 List!14731)) )
))
(declare-fun arrayNoDuplicates!0 (array!43376 (_ BitVec 32) List!14731) Bool)

(assert (=> b!797940 (= res!542458 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14728))))

(declare-fun b!797941 () Bool)

(declare-fun res!542457 () Bool)

(assert (=> b!797941 (=> (not res!542457) (not e!442651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797941 (= res!542457 (validKeyInArray!0 (select (arr!20768 a!3170) j!153)))))

(declare-fun b!797942 () Bool)

(declare-fun e!442654 () Bool)

(assert (=> b!797942 (= e!442655 e!442654)))

(declare-fun res!542455 () Bool)

(assert (=> b!797942 (=> (not res!542455) (not e!442654))))

(declare-fun lt!356096 () SeekEntryResult!8359)

(declare-fun lt!356095 () SeekEntryResult!8359)

(assert (=> b!797942 (= res!542455 (and (= lt!356096 lt!356095) (= lt!356095 (Found!8359 j!153)) (= (select (arr!20768 a!3170) index!1236) (select (arr!20768 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797942 (= lt!356095 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20768 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797942 (= lt!356096 (seekEntryOrOpen!0 (select (arr!20768 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797939 () Bool)

(assert (=> b!797939 (= e!442651 e!442653)))

(declare-fun res!542460 () Bool)

(assert (=> b!797939 (=> (not res!542460) (not e!442653))))

(declare-fun lt!356090 () SeekEntryResult!8359)

(assert (=> b!797939 (= res!542460 (or (= lt!356090 (MissingZero!8359 i!1163)) (= lt!356090 (MissingVacant!8359 i!1163))))))

(assert (=> b!797939 (= lt!356090 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!542464 () Bool)

(assert (=> start!68586 (=> (not res!542464) (not e!442651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68586 (= res!542464 (validMask!0 mask!3266))))

(assert (=> start!68586 e!442651))

(assert (=> start!68586 true))

(declare-fun array_inv!16564 (array!43376) Bool)

(assert (=> start!68586 (array_inv!16564 a!3170)))

(declare-fun b!797943 () Bool)

(assert (=> b!797943 (= e!442654 (not true))))

(assert (=> b!797943 (= lt!356091 (Found!8359 index!1236))))

(declare-fun b!797944 () Bool)

(declare-fun res!542463 () Bool)

(assert (=> b!797944 (=> (not res!542463) (not e!442651))))

(declare-fun arrayContainsKey!0 (array!43376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797944 (= res!542463 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797945 () Bool)

(declare-fun res!542456 () Bool)

(assert (=> b!797945 (=> (not res!542456) (not e!442653))))

(assert (=> b!797945 (= res!542456 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21189 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20768 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21189 a!3170)) (= (select (arr!20768 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797946 () Bool)

(declare-fun res!542465 () Bool)

(assert (=> b!797946 (=> (not res!542465) (not e!442651))))

(assert (=> b!797946 (= res!542465 (validKeyInArray!0 k!2044))))

(assert (= (and start!68586 res!542464) b!797936))

(assert (= (and b!797936 res!542459) b!797941))

(assert (= (and b!797941 res!542457) b!797946))

(assert (= (and b!797946 res!542465) b!797944))

(assert (= (and b!797944 res!542463) b!797939))

(assert (= (and b!797939 res!542460) b!797938))

(assert (= (and b!797938 res!542462) b!797940))

(assert (= (and b!797940 res!542458) b!797945))

(assert (= (and b!797945 res!542456) b!797937))

(assert (= (and b!797937 res!542461) b!797942))

(assert (= (and b!797942 res!542455) b!797943))

(declare-fun m!738815 () Bool)

(assert (=> b!797937 m!738815))

(declare-fun m!738817 () Bool)

(assert (=> b!797937 m!738817))

(declare-fun m!738819 () Bool)

(assert (=> b!797937 m!738819))

(declare-fun m!738821 () Bool)

(assert (=> b!797937 m!738821))

(declare-fun m!738823 () Bool)

(assert (=> start!68586 m!738823))

(declare-fun m!738825 () Bool)

(assert (=> start!68586 m!738825))

(declare-fun m!738827 () Bool)

(assert (=> b!797945 m!738827))

(declare-fun m!738829 () Bool)

(assert (=> b!797945 m!738829))

(declare-fun m!738831 () Bool)

(assert (=> b!797938 m!738831))

(declare-fun m!738833 () Bool)

(assert (=> b!797939 m!738833))

(declare-fun m!738835 () Bool)

(assert (=> b!797944 m!738835))

(declare-fun m!738837 () Bool)

(assert (=> b!797946 m!738837))

(declare-fun m!738839 () Bool)

(assert (=> b!797940 m!738839))

(declare-fun m!738841 () Bool)

(assert (=> b!797941 m!738841))

(assert (=> b!797941 m!738841))

(declare-fun m!738843 () Bool)

(assert (=> b!797941 m!738843))

(declare-fun m!738845 () Bool)

(assert (=> b!797942 m!738845))

(assert (=> b!797942 m!738841))

(assert (=> b!797942 m!738841))

(declare-fun m!738847 () Bool)

(assert (=> b!797942 m!738847))

(assert (=> b!797942 m!738841))

(declare-fun m!738849 () Bool)

(assert (=> b!797942 m!738849))

(push 1)

(assert (not b!797941))

(assert (not b!797938))

(assert (not start!68586))

