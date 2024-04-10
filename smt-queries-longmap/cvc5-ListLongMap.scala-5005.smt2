; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68540 () Bool)

(assert start!68540)

(declare-fun b!797125 () Bool)

(declare-fun res!541648 () Bool)

(declare-fun e!442259 () Bool)

(assert (=> b!797125 (=> (not res!541648) (not e!442259))))

(declare-datatypes ((array!43330 0))(
  ( (array!43331 (arr!20745 (Array (_ BitVec 32) (_ BitVec 64))) (size!21166 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43330)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797125 (= res!541648 (validKeyInArray!0 (select (arr!20745 a!3170) j!153)))))

(declare-fun b!797126 () Bool)

(declare-fun e!442258 () Bool)

(declare-fun e!442256 () Bool)

(assert (=> b!797126 (= e!442258 e!442256)))

(declare-fun res!541654 () Bool)

(assert (=> b!797126 (=> (not res!541654) (not e!442256))))

(declare-datatypes ((SeekEntryResult!8336 0))(
  ( (MissingZero!8336 (index!35712 (_ BitVec 32))) (Found!8336 (index!35713 (_ BitVec 32))) (Intermediate!8336 (undefined!9148 Bool) (index!35714 (_ BitVec 32)) (x!66614 (_ BitVec 32))) (Undefined!8336) (MissingVacant!8336 (index!35715 (_ BitVec 32))) )
))
(declare-fun lt!355568 () SeekEntryResult!8336)

(declare-fun lt!355571 () SeekEntryResult!8336)

(assert (=> b!797126 (= res!541654 (= lt!355568 lt!355571))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43330 (_ BitVec 32)) SeekEntryResult!8336)

(assert (=> b!797126 (= lt!355571 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20745 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43330 (_ BitVec 32)) SeekEntryResult!8336)

(assert (=> b!797126 (= lt!355568 (seekEntryOrOpen!0 (select (arr!20745 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797127 () Bool)

(declare-fun res!541651 () Bool)

(assert (=> b!797127 (=> (not res!541651) (not e!442259))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797127 (= res!541651 (and (= (size!21166 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21166 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21166 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797128 () Bool)

(declare-fun res!541645 () Bool)

(declare-fun e!442254 () Bool)

(assert (=> b!797128 (=> (not res!541645) (not e!442254))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797128 (= res!541645 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21166 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20745 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21166 a!3170)) (= (select (arr!20745 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797129 () Bool)

(assert (=> b!797129 (= e!442254 e!442258)))

(declare-fun res!541653 () Bool)

(assert (=> b!797129 (=> (not res!541653) (not e!442258))))

(declare-fun lt!355567 () SeekEntryResult!8336)

(declare-fun lt!355569 () SeekEntryResult!8336)

(assert (=> b!797129 (= res!541653 (= lt!355567 lt!355569))))

(declare-fun lt!355565 () (_ BitVec 64))

(declare-fun lt!355564 () array!43330)

(assert (=> b!797129 (= lt!355569 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355565 lt!355564 mask!3266))))

(assert (=> b!797129 (= lt!355567 (seekEntryOrOpen!0 lt!355565 lt!355564 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797129 (= lt!355565 (select (store (arr!20745 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797129 (= lt!355564 (array!43331 (store (arr!20745 a!3170) i!1163 k!2044) (size!21166 a!3170)))))

(declare-fun b!797131 () Bool)

(declare-fun res!541644 () Bool)

(assert (=> b!797131 (=> (not res!541644) (not e!442259))))

(assert (=> b!797131 (= res!541644 (validKeyInArray!0 k!2044))))

(declare-fun b!797132 () Bool)

(declare-fun res!541655 () Bool)

(assert (=> b!797132 (=> (not res!541655) (not e!442259))))

(declare-fun arrayContainsKey!0 (array!43330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797132 (= res!541655 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797133 () Bool)

(assert (=> b!797133 (= e!442259 e!442254)))

(declare-fun res!541649 () Bool)

(assert (=> b!797133 (=> (not res!541649) (not e!442254))))

(declare-fun lt!355566 () SeekEntryResult!8336)

(assert (=> b!797133 (= res!541649 (or (= lt!355566 (MissingZero!8336 i!1163)) (= lt!355566 (MissingVacant!8336 i!1163))))))

(assert (=> b!797133 (= lt!355566 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797134 () Bool)

(declare-fun res!541650 () Bool)

(assert (=> b!797134 (=> (not res!541650) (not e!442254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43330 (_ BitVec 32)) Bool)

(assert (=> b!797134 (= res!541650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797135 () Bool)

(declare-fun e!442255 () Bool)

(assert (=> b!797135 (= e!442256 e!442255)))

(declare-fun res!541647 () Bool)

(assert (=> b!797135 (=> (not res!541647) (not e!442255))))

(declare-fun lt!355570 () SeekEntryResult!8336)

(assert (=> b!797135 (= res!541647 (and (= lt!355571 lt!355570) (= (select (arr!20745 a!3170) index!1236) (select (arr!20745 a!3170) j!153))))))

(assert (=> b!797135 (= lt!355570 (Found!8336 j!153))))

(declare-fun b!797136 () Bool)

(declare-fun res!541652 () Bool)

(assert (=> b!797136 (=> (not res!541652) (not e!442254))))

(declare-datatypes ((List!14708 0))(
  ( (Nil!14705) (Cons!14704 (h!15833 (_ BitVec 64)) (t!21023 List!14708)) )
))
(declare-fun arrayNoDuplicates!0 (array!43330 (_ BitVec 32) List!14708) Bool)

(assert (=> b!797136 (= res!541652 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14705))))

(declare-fun b!797130 () Bool)

(assert (=> b!797130 (= e!442255 (not (or (not (= lt!355569 lt!355570)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797130 (= lt!355569 (Found!8336 index!1236))))

(declare-fun res!541646 () Bool)

(assert (=> start!68540 (=> (not res!541646) (not e!442259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68540 (= res!541646 (validMask!0 mask!3266))))

(assert (=> start!68540 e!442259))

(assert (=> start!68540 true))

(declare-fun array_inv!16541 (array!43330) Bool)

(assert (=> start!68540 (array_inv!16541 a!3170)))

(assert (= (and start!68540 res!541646) b!797127))

(assert (= (and b!797127 res!541651) b!797125))

(assert (= (and b!797125 res!541648) b!797131))

(assert (= (and b!797131 res!541644) b!797132))

(assert (= (and b!797132 res!541655) b!797133))

(assert (= (and b!797133 res!541649) b!797134))

(assert (= (and b!797134 res!541650) b!797136))

(assert (= (and b!797136 res!541652) b!797128))

(assert (= (and b!797128 res!541645) b!797129))

(assert (= (and b!797129 res!541653) b!797126))

(assert (= (and b!797126 res!541654) b!797135))

(assert (= (and b!797135 res!541647) b!797130))

(declare-fun m!737969 () Bool)

(assert (=> b!797133 m!737969))

(declare-fun m!737971 () Bool)

(assert (=> b!797135 m!737971))

(declare-fun m!737973 () Bool)

(assert (=> b!797135 m!737973))

(declare-fun m!737975 () Bool)

(assert (=> b!797129 m!737975))

(declare-fun m!737977 () Bool)

(assert (=> b!797129 m!737977))

(declare-fun m!737979 () Bool)

(assert (=> b!797129 m!737979))

(declare-fun m!737981 () Bool)

(assert (=> b!797129 m!737981))

(declare-fun m!737983 () Bool)

(assert (=> start!68540 m!737983))

(declare-fun m!737985 () Bool)

(assert (=> start!68540 m!737985))

(declare-fun m!737987 () Bool)

(assert (=> b!797134 m!737987))

(declare-fun m!737989 () Bool)

(assert (=> b!797136 m!737989))

(assert (=> b!797126 m!737973))

(assert (=> b!797126 m!737973))

(declare-fun m!737991 () Bool)

(assert (=> b!797126 m!737991))

(assert (=> b!797126 m!737973))

(declare-fun m!737993 () Bool)

(assert (=> b!797126 m!737993))

(declare-fun m!737995 () Bool)

(assert (=> b!797132 m!737995))

(declare-fun m!737997 () Bool)

(assert (=> b!797131 m!737997))

(declare-fun m!737999 () Bool)

(assert (=> b!797128 m!737999))

(declare-fun m!738001 () Bool)

(assert (=> b!797128 m!738001))

(assert (=> b!797125 m!737973))

(assert (=> b!797125 m!737973))

(declare-fun m!738003 () Bool)

(assert (=> b!797125 m!738003))

(push 1)

(assert (not start!68540))

(assert (not b!797134))

(assert (not b!797129))

(assert (not b!797125))

(assert (not b!797131))

(assert (not b!797126))

(assert (not b!797136))

(assert (not b!797132))

(assert (not b!797133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

