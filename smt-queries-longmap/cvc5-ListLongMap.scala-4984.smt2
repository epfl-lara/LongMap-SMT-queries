; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68414 () Bool)

(assert start!68414)

(declare-fun b!795105 () Bool)

(declare-fun res!539627 () Bool)

(declare-fun e!441369 () Bool)

(assert (=> b!795105 (=> (not res!539627) (not e!441369))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43204 0))(
  ( (array!43205 (arr!20682 (Array (_ BitVec 32) (_ BitVec 64))) (size!21103 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43204)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795105 (= res!539627 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21103 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20682 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21103 a!3170)) (= (select (arr!20682 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795106 () Bool)

(declare-fun res!539625 () Bool)

(assert (=> b!795106 (=> (not res!539625) (not e!441369))))

(declare-datatypes ((List!14645 0))(
  ( (Nil!14642) (Cons!14641 (h!15770 (_ BitVec 64)) (t!20960 List!14645)) )
))
(declare-fun arrayNoDuplicates!0 (array!43204 (_ BitVec 32) List!14645) Bool)

(assert (=> b!795106 (= res!539625 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14642))))

(declare-fun b!795107 () Bool)

(declare-fun res!539628 () Bool)

(declare-fun e!441370 () Bool)

(assert (=> b!795107 (=> (not res!539628) (not e!441370))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795107 (= res!539628 (and (= (size!21103 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21103 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21103 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795108 () Bool)

(declare-fun e!441371 () Bool)

(assert (=> b!795108 (= e!441369 e!441371)))

(declare-fun res!539633 () Bool)

(assert (=> b!795108 (=> (not res!539633) (not e!441371))))

(declare-fun lt!354409 () array!43204)

(declare-fun lt!354408 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8273 0))(
  ( (MissingZero!8273 (index!35460 (_ BitVec 32))) (Found!8273 (index!35461 (_ BitVec 32))) (Intermediate!8273 (undefined!9085 Bool) (index!35462 (_ BitVec 32)) (x!66383 (_ BitVec 32))) (Undefined!8273) (MissingVacant!8273 (index!35463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43204 (_ BitVec 32)) SeekEntryResult!8273)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43204 (_ BitVec 32)) SeekEntryResult!8273)

(assert (=> b!795108 (= res!539633 (= (seekEntryOrOpen!0 lt!354408 lt!354409 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354408 lt!354409 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!795108 (= lt!354408 (select (store (arr!20682 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795108 (= lt!354409 (array!43205 (store (arr!20682 a!3170) i!1163 k!2044) (size!21103 a!3170)))))

(declare-fun b!795109 () Bool)

(declare-fun res!539624 () Bool)

(assert (=> b!795109 (=> (not res!539624) (not e!441370))))

(declare-fun arrayContainsKey!0 (array!43204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795109 (= res!539624 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795110 () Bool)

(declare-fun res!539630 () Bool)

(assert (=> b!795110 (=> (not res!539630) (not e!441370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795110 (= res!539630 (validKeyInArray!0 (select (arr!20682 a!3170) j!153)))))

(declare-fun b!795111 () Bool)

(declare-fun res!539632 () Bool)

(assert (=> b!795111 (=> (not res!539632) (not e!441370))))

(assert (=> b!795111 (= res!539632 (validKeyInArray!0 k!2044))))

(declare-fun res!539629 () Bool)

(assert (=> start!68414 (=> (not res!539629) (not e!441370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68414 (= res!539629 (validMask!0 mask!3266))))

(assert (=> start!68414 e!441370))

(assert (=> start!68414 true))

(declare-fun array_inv!16478 (array!43204) Bool)

(assert (=> start!68414 (array_inv!16478 a!3170)))

(declare-fun b!795112 () Bool)

(declare-fun res!539631 () Bool)

(assert (=> b!795112 (=> (not res!539631) (not e!441369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43204 (_ BitVec 32)) Bool)

(assert (=> b!795112 (= res!539631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795113 () Bool)

(assert (=> b!795113 (= e!441370 e!441369)))

(declare-fun res!539626 () Bool)

(assert (=> b!795113 (=> (not res!539626) (not e!441369))))

(declare-fun lt!354406 () SeekEntryResult!8273)

(assert (=> b!795113 (= res!539626 (or (= lt!354406 (MissingZero!8273 i!1163)) (= lt!354406 (MissingVacant!8273 i!1163))))))

(assert (=> b!795113 (= lt!354406 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795114 () Bool)

(assert (=> b!795114 (= e!441371 false)))

(declare-fun lt!354407 () SeekEntryResult!8273)

(assert (=> b!795114 (= lt!354407 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20682 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354410 () SeekEntryResult!8273)

(assert (=> b!795114 (= lt!354410 (seekEntryOrOpen!0 (select (arr!20682 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68414 res!539629) b!795107))

(assert (= (and b!795107 res!539628) b!795110))

(assert (= (and b!795110 res!539630) b!795111))

(assert (= (and b!795111 res!539632) b!795109))

(assert (= (and b!795109 res!539624) b!795113))

(assert (= (and b!795113 res!539626) b!795112))

(assert (= (and b!795112 res!539631) b!795106))

(assert (= (and b!795106 res!539625) b!795105))

(assert (= (and b!795105 res!539627) b!795108))

(assert (= (and b!795108 res!539633) b!795114))

(declare-fun m!735695 () Bool)

(assert (=> b!795110 m!735695))

(assert (=> b!795110 m!735695))

(declare-fun m!735697 () Bool)

(assert (=> b!795110 m!735697))

(declare-fun m!735699 () Bool)

(assert (=> b!795112 m!735699))

(declare-fun m!735701 () Bool)

(assert (=> b!795105 m!735701))

(declare-fun m!735703 () Bool)

(assert (=> b!795105 m!735703))

(declare-fun m!735705 () Bool)

(assert (=> b!795113 m!735705))

(declare-fun m!735707 () Bool)

(assert (=> b!795111 m!735707))

(declare-fun m!735709 () Bool)

(assert (=> b!795108 m!735709))

(declare-fun m!735711 () Bool)

(assert (=> b!795108 m!735711))

(declare-fun m!735713 () Bool)

(assert (=> b!795108 m!735713))

(declare-fun m!735715 () Bool)

(assert (=> b!795108 m!735715))

(declare-fun m!735717 () Bool)

(assert (=> b!795106 m!735717))

(declare-fun m!735719 () Bool)

(assert (=> b!795109 m!735719))

(declare-fun m!735721 () Bool)

(assert (=> start!68414 m!735721))

(declare-fun m!735723 () Bool)

(assert (=> start!68414 m!735723))

(assert (=> b!795114 m!735695))

(assert (=> b!795114 m!735695))

(declare-fun m!735725 () Bool)

(assert (=> b!795114 m!735725))

(assert (=> b!795114 m!735695))

(declare-fun m!735727 () Bool)

(assert (=> b!795114 m!735727))

(push 1)

