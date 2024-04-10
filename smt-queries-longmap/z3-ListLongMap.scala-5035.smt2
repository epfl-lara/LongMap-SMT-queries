; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68722 () Bool)

(assert start!68722)

(declare-fun b!800406 () Bool)

(declare-fun res!544931 () Bool)

(declare-fun e!443777 () Bool)

(assert (=> b!800406 (=> (not res!544931) (not e!443777))))

(declare-datatypes ((array!43512 0))(
  ( (array!43513 (arr!20836 (Array (_ BitVec 32) (_ BitVec 64))) (size!21257 (_ BitVec 32))) )
))
(declare-fun lt!357591 () array!43512)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357593 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8427 0))(
  ( (MissingZero!8427 (index!36076 (_ BitVec 32))) (Found!8427 (index!36077 (_ BitVec 32))) (Intermediate!8427 (undefined!9239 Bool) (index!36078 (_ BitVec 32)) (x!66945 (_ BitVec 32))) (Undefined!8427) (MissingVacant!8427 (index!36079 (_ BitVec 32))) )
))
(declare-fun lt!357586 () SeekEntryResult!8427)

(declare-fun lt!357589 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43512 (_ BitVec 32)) SeekEntryResult!8427)

(assert (=> b!800406 (= res!544931 (= lt!357586 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357593 vacantAfter!23 lt!357589 lt!357591 mask!3266)))))

(declare-fun b!800407 () Bool)

(declare-fun res!544935 () Bool)

(declare-fun e!443780 () Bool)

(assert (=> b!800407 (=> (not res!544935) (not e!443780))))

(declare-fun a!3170 () array!43512)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43512 (_ BitVec 32)) Bool)

(assert (=> b!800407 (= res!544935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800408 () Bool)

(declare-fun res!544934 () Bool)

(assert (=> b!800408 (=> (not res!544934) (not e!443780))))

(declare-datatypes ((List!14799 0))(
  ( (Nil!14796) (Cons!14795 (h!15924 (_ BitVec 64)) (t!21114 List!14799)) )
))
(declare-fun arrayNoDuplicates!0 (array!43512 (_ BitVec 32) List!14799) Bool)

(assert (=> b!800408 (= res!544934 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14796))))

(declare-fun b!800409 () Bool)

(declare-fun e!443779 () Bool)

(assert (=> b!800409 (= e!443780 e!443779)))

(declare-fun res!544933 () Bool)

(assert (=> b!800409 (=> (not res!544933) (not e!443779))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800409 (= res!544933 (= lt!357586 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357589 lt!357591 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43512 (_ BitVec 32)) SeekEntryResult!8427)

(assert (=> b!800409 (= lt!357586 (seekEntryOrOpen!0 lt!357589 lt!357591 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800409 (= lt!357589 (select (store (arr!20836 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800409 (= lt!357591 (array!43513 (store (arr!20836 a!3170) i!1163 k0!2044) (size!21257 a!3170)))))

(declare-fun b!800410 () Bool)

(declare-fun res!544937 () Bool)

(declare-fun e!443778 () Bool)

(assert (=> b!800410 (=> (not res!544937) (not e!443778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800410 (= res!544937 (validKeyInArray!0 (select (arr!20836 a!3170) j!153)))))

(declare-fun res!544926 () Bool)

(assert (=> start!68722 (=> (not res!544926) (not e!443778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68722 (= res!544926 (validMask!0 mask!3266))))

(assert (=> start!68722 e!443778))

(assert (=> start!68722 true))

(declare-fun array_inv!16632 (array!43512) Bool)

(assert (=> start!68722 (array_inv!16632 a!3170)))

(declare-fun b!800411 () Bool)

(declare-fun e!443775 () Bool)

(assert (=> b!800411 (= e!443779 e!443775)))

(declare-fun res!544936 () Bool)

(assert (=> b!800411 (=> (not res!544936) (not e!443775))))

(declare-fun lt!357588 () SeekEntryResult!8427)

(declare-fun lt!357592 () SeekEntryResult!8427)

(assert (=> b!800411 (= res!544936 (and (= lt!357592 lt!357588) (= lt!357588 (Found!8427 j!153)) (not (= (select (arr!20836 a!3170) index!1236) (select (arr!20836 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800411 (= lt!357588 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800411 (= lt!357592 (seekEntryOrOpen!0 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800412 () Bool)

(declare-fun res!544927 () Bool)

(assert (=> b!800412 (=> (not res!544927) (not e!443780))))

(assert (=> b!800412 (= res!544927 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21257 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20836 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21257 a!3170)) (= (select (arr!20836 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800413 () Bool)

(assert (=> b!800413 (= e!443777 false)))

(declare-fun lt!357590 () SeekEntryResult!8427)

(assert (=> b!800413 (= lt!357590 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357593 vacantBefore!23 (select (arr!20836 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800414 () Bool)

(declare-fun res!544932 () Bool)

(assert (=> b!800414 (=> (not res!544932) (not e!443778))))

(declare-fun arrayContainsKey!0 (array!43512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800414 (= res!544932 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800415 () Bool)

(declare-fun res!544930 () Bool)

(assert (=> b!800415 (=> (not res!544930) (not e!443778))))

(assert (=> b!800415 (= res!544930 (validKeyInArray!0 k0!2044))))

(declare-fun b!800416 () Bool)

(assert (=> b!800416 (= e!443775 e!443777)))

(declare-fun res!544925 () Bool)

(assert (=> b!800416 (=> (not res!544925) (not e!443777))))

(assert (=> b!800416 (= res!544925 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357593 #b00000000000000000000000000000000) (bvslt lt!357593 (size!21257 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800416 (= lt!357593 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800417 () Bool)

(assert (=> b!800417 (= e!443778 e!443780)))

(declare-fun res!544929 () Bool)

(assert (=> b!800417 (=> (not res!544929) (not e!443780))))

(declare-fun lt!357587 () SeekEntryResult!8427)

(assert (=> b!800417 (= res!544929 (or (= lt!357587 (MissingZero!8427 i!1163)) (= lt!357587 (MissingVacant!8427 i!1163))))))

(assert (=> b!800417 (= lt!357587 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800418 () Bool)

(declare-fun res!544928 () Bool)

(assert (=> b!800418 (=> (not res!544928) (not e!443778))))

(assert (=> b!800418 (= res!544928 (and (= (size!21257 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21257 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21257 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68722 res!544926) b!800418))

(assert (= (and b!800418 res!544928) b!800410))

(assert (= (and b!800410 res!544937) b!800415))

(assert (= (and b!800415 res!544930) b!800414))

(assert (= (and b!800414 res!544932) b!800417))

(assert (= (and b!800417 res!544929) b!800407))

(assert (= (and b!800407 res!544935) b!800408))

(assert (= (and b!800408 res!544934) b!800412))

(assert (= (and b!800412 res!544927) b!800409))

(assert (= (and b!800409 res!544933) b!800411))

(assert (= (and b!800411 res!544936) b!800416))

(assert (= (and b!800416 res!544925) b!800406))

(assert (= (and b!800406 res!544931) b!800413))

(declare-fun m!741491 () Bool)

(assert (=> b!800406 m!741491))

(declare-fun m!741493 () Bool)

(assert (=> b!800413 m!741493))

(assert (=> b!800413 m!741493))

(declare-fun m!741495 () Bool)

(assert (=> b!800413 m!741495))

(assert (=> b!800410 m!741493))

(assert (=> b!800410 m!741493))

(declare-fun m!741497 () Bool)

(assert (=> b!800410 m!741497))

(declare-fun m!741499 () Bool)

(assert (=> b!800415 m!741499))

(declare-fun m!741501 () Bool)

(assert (=> b!800409 m!741501))

(declare-fun m!741503 () Bool)

(assert (=> b!800409 m!741503))

(declare-fun m!741505 () Bool)

(assert (=> b!800409 m!741505))

(declare-fun m!741507 () Bool)

(assert (=> b!800409 m!741507))

(declare-fun m!741509 () Bool)

(assert (=> b!800417 m!741509))

(declare-fun m!741511 () Bool)

(assert (=> b!800416 m!741511))

(declare-fun m!741513 () Bool)

(assert (=> b!800414 m!741513))

(declare-fun m!741515 () Bool)

(assert (=> b!800407 m!741515))

(declare-fun m!741517 () Bool)

(assert (=> b!800408 m!741517))

(declare-fun m!741519 () Bool)

(assert (=> b!800411 m!741519))

(assert (=> b!800411 m!741493))

(assert (=> b!800411 m!741493))

(declare-fun m!741521 () Bool)

(assert (=> b!800411 m!741521))

(assert (=> b!800411 m!741493))

(declare-fun m!741523 () Bool)

(assert (=> b!800411 m!741523))

(declare-fun m!741525 () Bool)

(assert (=> b!800412 m!741525))

(declare-fun m!741527 () Bool)

(assert (=> b!800412 m!741527))

(declare-fun m!741529 () Bool)

(assert (=> start!68722 m!741529))

(declare-fun m!741531 () Bool)

(assert (=> start!68722 m!741531))

(check-sat (not b!800407) (not b!800410) (not b!800406) (not b!800417) (not start!68722) (not b!800411) (not b!800408) (not b!800415) (not b!800416) (not b!800409) (not b!800413) (not b!800414))
(check-sat)
