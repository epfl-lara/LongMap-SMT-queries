; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68716 () Bool)

(assert start!68716)

(declare-fun b!798694 () Bool)

(declare-fun res!542842 () Bool)

(declare-fun e!443127 () Bool)

(assert (=> b!798694 (=> (not res!542842) (not e!443127))))

(declare-datatypes ((array!43380 0))(
  ( (array!43381 (arr!20766 (Array (_ BitVec 32) (_ BitVec 64))) (size!21186 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43380)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798694 (= res!542842 (validKeyInArray!0 (select (arr!20766 a!3170) j!153)))))

(declare-fun res!542841 () Bool)

(assert (=> start!68716 (=> (not res!542841) (not e!443127))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68716 (= res!542841 (validMask!0 mask!3266))))

(assert (=> start!68716 e!443127))

(assert (=> start!68716 true))

(declare-fun array_inv!16625 (array!43380) Bool)

(assert (=> start!68716 (array_inv!16625 a!3170)))

(declare-datatypes ((SeekEntryResult!8313 0))(
  ( (MissingZero!8313 (index!35620 (_ BitVec 32))) (Found!8313 (index!35621 (_ BitVec 32))) (Intermediate!8313 (undefined!9125 Bool) (index!35622 (_ BitVec 32)) (x!66666 (_ BitVec 32))) (Undefined!8313) (MissingVacant!8313 (index!35623 (_ BitVec 32))) )
))
(declare-fun lt!356435 () SeekEntryResult!8313)

(declare-fun b!798695 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356436 () SeekEntryResult!8313)

(declare-fun e!443126 () Bool)

(assert (=> b!798695 (= e!443126 (not (or (not (= lt!356436 lt!356435)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!798695 (= lt!356436 (Found!8313 index!1236))))

(declare-fun b!798696 () Bool)

(declare-fun e!443130 () Bool)

(declare-fun e!443129 () Bool)

(assert (=> b!798696 (= e!443130 e!443129)))

(declare-fun res!542847 () Bool)

(assert (=> b!798696 (=> (not res!542847) (not e!443129))))

(declare-fun lt!356434 () SeekEntryResult!8313)

(assert (=> b!798696 (= res!542847 (= lt!356434 lt!356436))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356438 () array!43380)

(declare-fun lt!356439 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43380 (_ BitVec 32)) SeekEntryResult!8313)

(assert (=> b!798696 (= lt!356436 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356439 lt!356438 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43380 (_ BitVec 32)) SeekEntryResult!8313)

(assert (=> b!798696 (= lt!356434 (seekEntryOrOpen!0 lt!356439 lt!356438 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798696 (= lt!356439 (select (store (arr!20766 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798696 (= lt!356438 (array!43381 (store (arr!20766 a!3170) i!1163 k!2044) (size!21186 a!3170)))))

(declare-fun b!798697 () Bool)

(declare-fun res!542849 () Bool)

(assert (=> b!798697 (=> (not res!542849) (not e!443127))))

(assert (=> b!798697 (= res!542849 (and (= (size!21186 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21186 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21186 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798698 () Bool)

(declare-fun res!542848 () Bool)

(assert (=> b!798698 (=> (not res!542848) (not e!443130))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798698 (= res!542848 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21186 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20766 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21186 a!3170)) (= (select (arr!20766 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798699 () Bool)

(declare-fun e!443128 () Bool)

(assert (=> b!798699 (= e!443129 e!443128)))

(declare-fun res!542840 () Bool)

(assert (=> b!798699 (=> (not res!542840) (not e!443128))))

(declare-fun lt!356433 () SeekEntryResult!8313)

(declare-fun lt!356437 () SeekEntryResult!8313)

(assert (=> b!798699 (= res!542840 (= lt!356433 lt!356437))))

(assert (=> b!798699 (= lt!356437 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20766 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798699 (= lt!356433 (seekEntryOrOpen!0 (select (arr!20766 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798700 () Bool)

(declare-fun res!542850 () Bool)

(assert (=> b!798700 (=> (not res!542850) (not e!443127))))

(declare-fun arrayContainsKey!0 (array!43380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798700 (= res!542850 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798701 () Bool)

(assert (=> b!798701 (= e!443128 e!443126)))

(declare-fun res!542845 () Bool)

(assert (=> b!798701 (=> (not res!542845) (not e!443126))))

(assert (=> b!798701 (= res!542845 (and (= lt!356437 lt!356435) (= (select (arr!20766 a!3170) index!1236) (select (arr!20766 a!3170) j!153))))))

(assert (=> b!798701 (= lt!356435 (Found!8313 j!153))))

(declare-fun b!798702 () Bool)

(assert (=> b!798702 (= e!443127 e!443130)))

(declare-fun res!542846 () Bool)

(assert (=> b!798702 (=> (not res!542846) (not e!443130))))

(declare-fun lt!356440 () SeekEntryResult!8313)

(assert (=> b!798702 (= res!542846 (or (= lt!356440 (MissingZero!8313 i!1163)) (= lt!356440 (MissingVacant!8313 i!1163))))))

(assert (=> b!798702 (= lt!356440 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798703 () Bool)

(declare-fun res!542839 () Bool)

(assert (=> b!798703 (=> (not res!542839) (not e!443130))))

(declare-datatypes ((List!14636 0))(
  ( (Nil!14633) (Cons!14632 (h!15767 (_ BitVec 64)) (t!20943 List!14636)) )
))
(declare-fun arrayNoDuplicates!0 (array!43380 (_ BitVec 32) List!14636) Bool)

(assert (=> b!798703 (= res!542839 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14633))))

(declare-fun b!798704 () Bool)

(declare-fun res!542844 () Bool)

(assert (=> b!798704 (=> (not res!542844) (not e!443127))))

(assert (=> b!798704 (= res!542844 (validKeyInArray!0 k!2044))))

(declare-fun b!798705 () Bool)

(declare-fun res!542843 () Bool)

(assert (=> b!798705 (=> (not res!542843) (not e!443130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43380 (_ BitVec 32)) Bool)

(assert (=> b!798705 (= res!542843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68716 res!542841) b!798697))

(assert (= (and b!798697 res!542849) b!798694))

(assert (= (and b!798694 res!542842) b!798704))

(assert (= (and b!798704 res!542844) b!798700))

(assert (= (and b!798700 res!542850) b!798702))

(assert (= (and b!798702 res!542846) b!798705))

(assert (= (and b!798705 res!542843) b!798703))

(assert (= (and b!798703 res!542839) b!798698))

(assert (= (and b!798698 res!542848) b!798696))

(assert (= (and b!798696 res!542847) b!798699))

(assert (= (and b!798699 res!542840) b!798701))

(assert (= (and b!798701 res!542845) b!798695))

(declare-fun m!740003 () Bool)

(assert (=> b!798703 m!740003))

(declare-fun m!740005 () Bool)

(assert (=> b!798698 m!740005))

(declare-fun m!740007 () Bool)

(assert (=> b!798698 m!740007))

(declare-fun m!740009 () Bool)

(assert (=> b!798700 m!740009))

(declare-fun m!740011 () Bool)

(assert (=> b!798702 m!740011))

(declare-fun m!740013 () Bool)

(assert (=> b!798694 m!740013))

(assert (=> b!798694 m!740013))

(declare-fun m!740015 () Bool)

(assert (=> b!798694 m!740015))

(declare-fun m!740017 () Bool)

(assert (=> b!798701 m!740017))

(assert (=> b!798701 m!740013))

(declare-fun m!740019 () Bool)

(assert (=> b!798704 m!740019))

(assert (=> b!798699 m!740013))

(assert (=> b!798699 m!740013))

(declare-fun m!740021 () Bool)

(assert (=> b!798699 m!740021))

(assert (=> b!798699 m!740013))

(declare-fun m!740023 () Bool)

(assert (=> b!798699 m!740023))

(declare-fun m!740025 () Bool)

(assert (=> b!798705 m!740025))

(declare-fun m!740027 () Bool)

(assert (=> b!798696 m!740027))

(declare-fun m!740029 () Bool)

(assert (=> b!798696 m!740029))

(declare-fun m!740031 () Bool)

(assert (=> b!798696 m!740031))

(declare-fun m!740033 () Bool)

(assert (=> b!798696 m!740033))

(declare-fun m!740035 () Bool)

(assert (=> start!68716 m!740035))

(declare-fun m!740037 () Bool)

(assert (=> start!68716 m!740037))

(push 1)

(assert (not b!798704))

(assert (not b!798699))

(assert (not start!68716))

(assert (not b!798694))

(assert (not b!798700))

(assert (not b!798696))

(assert (not b!798702))

(assert (not b!798703))

(assert (not b!798705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

