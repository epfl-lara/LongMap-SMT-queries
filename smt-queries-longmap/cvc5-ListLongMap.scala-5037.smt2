; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68732 () Bool)

(assert start!68732)

(declare-fun b!800601 () Bool)

(declare-fun res!545126 () Bool)

(declare-fun e!443868 () Bool)

(assert (=> b!800601 (=> (not res!545126) (not e!443868))))

(declare-datatypes ((array!43522 0))(
  ( (array!43523 (arr!20841 (Array (_ BitVec 32) (_ BitVec 64))) (size!21262 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43522)

(declare-datatypes ((List!14804 0))(
  ( (Nil!14801) (Cons!14800 (h!15929 (_ BitVec 64)) (t!21119 List!14804)) )
))
(declare-fun arrayNoDuplicates!0 (array!43522 (_ BitVec 32) List!14804) Bool)

(assert (=> b!800601 (= res!545126 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14801))))

(declare-fun b!800602 () Bool)

(declare-fun res!545130 () Bool)

(assert (=> b!800602 (=> (not res!545130) (not e!443868))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43522 (_ BitVec 32)) Bool)

(assert (=> b!800602 (= res!545130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!545128 () Bool)

(declare-fun e!443869 () Bool)

(assert (=> start!68732 (=> (not res!545128) (not e!443869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68732 (= res!545128 (validMask!0 mask!3266))))

(assert (=> start!68732 e!443869))

(assert (=> start!68732 true))

(declare-fun array_inv!16637 (array!43522) Bool)

(assert (=> start!68732 (array_inv!16637 a!3170)))

(declare-fun b!800603 () Bool)

(assert (=> b!800603 (= e!443869 e!443868)))

(declare-fun res!545132 () Bool)

(assert (=> b!800603 (=> (not res!545132) (not e!443868))))

(declare-datatypes ((SeekEntryResult!8432 0))(
  ( (MissingZero!8432 (index!36096 (_ BitVec 32))) (Found!8432 (index!36097 (_ BitVec 32))) (Intermediate!8432 (undefined!9244 Bool) (index!36098 (_ BitVec 32)) (x!66966 (_ BitVec 32))) (Undefined!8432) (MissingVacant!8432 (index!36099 (_ BitVec 32))) )
))
(declare-fun lt!357710 () SeekEntryResult!8432)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800603 (= res!545132 (or (= lt!357710 (MissingZero!8432 i!1163)) (= lt!357710 (MissingVacant!8432 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43522 (_ BitVec 32)) SeekEntryResult!8432)

(assert (=> b!800603 (= lt!357710 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800604 () Bool)

(declare-fun e!443870 () Bool)

(declare-fun e!443866 () Bool)

(assert (=> b!800604 (= e!443870 e!443866)))

(declare-fun res!545123 () Bool)

(assert (=> b!800604 (=> (not res!545123) (not e!443866))))

(declare-fun lt!357706 () SeekEntryResult!8432)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357713 () SeekEntryResult!8432)

(assert (=> b!800604 (= res!545123 (and (= lt!357713 lt!357706) (= lt!357706 (Found!8432 j!153)) (not (= (select (arr!20841 a!3170) index!1236) (select (arr!20841 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43522 (_ BitVec 32)) SeekEntryResult!8432)

(assert (=> b!800604 (= lt!357706 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20841 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800604 (= lt!357713 (seekEntryOrOpen!0 (select (arr!20841 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800605 () Bool)

(declare-fun e!443865 () Bool)

(assert (=> b!800605 (= e!443865 false)))

(declare-fun lt!357708 () (_ BitVec 32))

(declare-fun lt!357709 () SeekEntryResult!8432)

(assert (=> b!800605 (= lt!357709 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357708 vacantBefore!23 (select (arr!20841 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800606 () Bool)

(declare-fun res!545127 () Bool)

(assert (=> b!800606 (=> (not res!545127) (not e!443868))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!800606 (= res!545127 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21262 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20841 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21262 a!3170)) (= (select (arr!20841 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800607 () Bool)

(declare-fun res!545124 () Bool)

(assert (=> b!800607 (=> (not res!545124) (not e!443869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800607 (= res!545124 (validKeyInArray!0 k!2044))))

(declare-fun b!800608 () Bool)

(declare-fun res!545129 () Bool)

(assert (=> b!800608 (=> (not res!545129) (not e!443869))))

(assert (=> b!800608 (= res!545129 (validKeyInArray!0 (select (arr!20841 a!3170) j!153)))))

(declare-fun b!800609 () Bool)

(declare-fun res!545122 () Bool)

(assert (=> b!800609 (=> (not res!545122) (not e!443869))))

(assert (=> b!800609 (= res!545122 (and (= (size!21262 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21262 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21262 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800610 () Bool)

(declare-fun res!545120 () Bool)

(assert (=> b!800610 (=> (not res!545120) (not e!443869))))

(declare-fun arrayContainsKey!0 (array!43522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800610 (= res!545120 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800611 () Bool)

(assert (=> b!800611 (= e!443866 e!443865)))

(declare-fun res!545131 () Bool)

(assert (=> b!800611 (=> (not res!545131) (not e!443865))))

(assert (=> b!800611 (= res!545131 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357708 #b00000000000000000000000000000000) (bvslt lt!357708 (size!21262 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800611 (= lt!357708 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800612 () Bool)

(declare-fun res!545121 () Bool)

(assert (=> b!800612 (=> (not res!545121) (not e!443865))))

(declare-fun lt!357711 () (_ BitVec 64))

(declare-fun lt!357712 () array!43522)

(declare-fun lt!357707 () SeekEntryResult!8432)

(assert (=> b!800612 (= res!545121 (= lt!357707 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357708 vacantAfter!23 lt!357711 lt!357712 mask!3266)))))

(declare-fun b!800613 () Bool)

(assert (=> b!800613 (= e!443868 e!443870)))

(declare-fun res!545125 () Bool)

(assert (=> b!800613 (=> (not res!545125) (not e!443870))))

(assert (=> b!800613 (= res!545125 (= lt!357707 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357711 lt!357712 mask!3266)))))

(assert (=> b!800613 (= lt!357707 (seekEntryOrOpen!0 lt!357711 lt!357712 mask!3266))))

(assert (=> b!800613 (= lt!357711 (select (store (arr!20841 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800613 (= lt!357712 (array!43523 (store (arr!20841 a!3170) i!1163 k!2044) (size!21262 a!3170)))))

(assert (= (and start!68732 res!545128) b!800609))

(assert (= (and b!800609 res!545122) b!800608))

(assert (= (and b!800608 res!545129) b!800607))

(assert (= (and b!800607 res!545124) b!800610))

(assert (= (and b!800610 res!545120) b!800603))

(assert (= (and b!800603 res!545132) b!800602))

(assert (= (and b!800602 res!545130) b!800601))

(assert (= (and b!800601 res!545126) b!800606))

(assert (= (and b!800606 res!545127) b!800613))

(assert (= (and b!800613 res!545125) b!800604))

(assert (= (and b!800604 res!545123) b!800611))

(assert (= (and b!800611 res!545131) b!800612))

(assert (= (and b!800612 res!545121) b!800605))

(declare-fun m!741701 () Bool)

(assert (=> b!800605 m!741701))

(assert (=> b!800605 m!741701))

(declare-fun m!741703 () Bool)

(assert (=> b!800605 m!741703))

(declare-fun m!741705 () Bool)

(assert (=> b!800610 m!741705))

(declare-fun m!741707 () Bool)

(assert (=> b!800613 m!741707))

(declare-fun m!741709 () Bool)

(assert (=> b!800613 m!741709))

(declare-fun m!741711 () Bool)

(assert (=> b!800613 m!741711))

(declare-fun m!741713 () Bool)

(assert (=> b!800613 m!741713))

(declare-fun m!741715 () Bool)

(assert (=> start!68732 m!741715))

(declare-fun m!741717 () Bool)

(assert (=> start!68732 m!741717))

(declare-fun m!741719 () Bool)

(assert (=> b!800604 m!741719))

(assert (=> b!800604 m!741701))

(assert (=> b!800604 m!741701))

(declare-fun m!741721 () Bool)

(assert (=> b!800604 m!741721))

(assert (=> b!800604 m!741701))

(declare-fun m!741723 () Bool)

(assert (=> b!800604 m!741723))

(declare-fun m!741725 () Bool)

(assert (=> b!800601 m!741725))

(declare-fun m!741727 () Bool)

(assert (=> b!800611 m!741727))

(declare-fun m!741729 () Bool)

(assert (=> b!800612 m!741729))

(assert (=> b!800608 m!741701))

(assert (=> b!800608 m!741701))

(declare-fun m!741731 () Bool)

(assert (=> b!800608 m!741731))

(declare-fun m!741733 () Bool)

(assert (=> b!800603 m!741733))

(declare-fun m!741735 () Bool)

(assert (=> b!800607 m!741735))

(declare-fun m!741737 () Bool)

(assert (=> b!800606 m!741737))

(declare-fun m!741739 () Bool)

(assert (=> b!800606 m!741739))

(declare-fun m!741741 () Bool)

(assert (=> b!800602 m!741741))

(push 1)

