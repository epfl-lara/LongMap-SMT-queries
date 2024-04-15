; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69228 () Bool)

(assert start!69228)

(declare-fun b!807682 () Bool)

(declare-fun e!447121 () Bool)

(declare-fun e!447123 () Bool)

(assert (=> b!807682 (= e!447121 e!447123)))

(declare-fun res!551945 () Bool)

(assert (=> b!807682 (=> (not res!551945) (not e!447123))))

(declare-datatypes ((SeekEntryResult!8638 0))(
  ( (MissingZero!8638 (index!36920 (_ BitVec 32))) (Found!8638 (index!36921 (_ BitVec 32))) (Intermediate!8638 (undefined!9450 Bool) (index!36922 (_ BitVec 32)) (x!67733 (_ BitVec 32))) (Undefined!8638) (MissingVacant!8638 (index!36923 (_ BitVec 32))) )
))
(declare-fun lt!361760 () SeekEntryResult!8638)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43945 0))(
  ( (array!43946 (arr!21050 (Array (_ BitVec 32) (_ BitVec 64))) (size!21471 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43945)

(declare-fun lt!361761 () SeekEntryResult!8638)

(assert (=> b!807682 (= res!551945 (and (= lt!361760 lt!361761) (= lt!361761 (Found!8638 j!153)) (not (= (select (arr!21050 a!3170) index!1236) (select (arr!21050 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43945 (_ BitVec 32)) SeekEntryResult!8638)

(assert (=> b!807682 (= lt!361761 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21050 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43945 (_ BitVec 32)) SeekEntryResult!8638)

(assert (=> b!807682 (= lt!361760 (seekEntryOrOpen!0 (select (arr!21050 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807683 () Bool)

(declare-fun res!551952 () Bool)

(declare-fun e!447124 () Bool)

(assert (=> b!807683 (=> (not res!551952) (not e!447124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43945 (_ BitVec 32)) Bool)

(assert (=> b!807683 (= res!551952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807684 () Bool)

(declare-fun res!551948 () Bool)

(declare-fun e!447122 () Bool)

(assert (=> b!807684 (=> (not res!551948) (not e!447122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807684 (= res!551948 (validKeyInArray!0 (select (arr!21050 a!3170) j!153)))))

(declare-fun b!807685 () Bool)

(declare-fun res!551954 () Bool)

(assert (=> b!807685 (=> (not res!551954) (not e!447124))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807685 (= res!551954 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21471 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21050 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21471 a!3170)) (= (select (arr!21050 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807686 () Bool)

(declare-fun res!551953 () Bool)

(assert (=> b!807686 (=> (not res!551953) (not e!447124))))

(declare-datatypes ((List!15052 0))(
  ( (Nil!15049) (Cons!15048 (h!16177 (_ BitVec 64)) (t!21358 List!15052)) )
))
(declare-fun arrayNoDuplicates!0 (array!43945 (_ BitVec 32) List!15052) Bool)

(assert (=> b!807686 (= res!551953 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15049))))

(declare-fun res!551950 () Bool)

(assert (=> start!69228 (=> (not res!551950) (not e!447122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69228 (= res!551950 (validMask!0 mask!3266))))

(assert (=> start!69228 e!447122))

(assert (=> start!69228 true))

(declare-fun array_inv!16933 (array!43945) Bool)

(assert (=> start!69228 (array_inv!16933 a!3170)))

(declare-fun b!807687 () Bool)

(declare-fun res!551946 () Bool)

(assert (=> b!807687 (=> (not res!551946) (not e!447122))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807687 (= res!551946 (validKeyInArray!0 k0!2044))))

(declare-fun b!807688 () Bool)

(declare-fun res!551949 () Bool)

(assert (=> b!807688 (=> (not res!551949) (not e!447122))))

(assert (=> b!807688 (= res!551949 (and (= (size!21471 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21471 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21471 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807689 () Bool)

(declare-fun res!551947 () Bool)

(assert (=> b!807689 (=> (not res!551947) (not e!447122))))

(declare-fun arrayContainsKey!0 (array!43945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807689 (= res!551947 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807690 () Bool)

(assert (=> b!807690 (= e!447122 e!447124)))

(declare-fun res!551955 () Bool)

(assert (=> b!807690 (=> (not res!551955) (not e!447124))))

(declare-fun lt!361758 () SeekEntryResult!8638)

(assert (=> b!807690 (= res!551955 (or (= lt!361758 (MissingZero!8638 i!1163)) (= lt!361758 (MissingVacant!8638 i!1163))))))

(assert (=> b!807690 (= lt!361758 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807691 () Bool)

(assert (=> b!807691 (= e!447123 false)))

(declare-fun lt!361759 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807691 (= lt!361759 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807692 () Bool)

(assert (=> b!807692 (= e!447124 e!447121)))

(declare-fun res!551951 () Bool)

(assert (=> b!807692 (=> (not res!551951) (not e!447121))))

(declare-fun lt!361762 () array!43945)

(declare-fun lt!361763 () (_ BitVec 64))

(assert (=> b!807692 (= res!551951 (= (seekEntryOrOpen!0 lt!361763 lt!361762 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361763 lt!361762 mask!3266)))))

(assert (=> b!807692 (= lt!361763 (select (store (arr!21050 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807692 (= lt!361762 (array!43946 (store (arr!21050 a!3170) i!1163 k0!2044) (size!21471 a!3170)))))

(assert (= (and start!69228 res!551950) b!807688))

(assert (= (and b!807688 res!551949) b!807684))

(assert (= (and b!807684 res!551948) b!807687))

(assert (= (and b!807687 res!551946) b!807689))

(assert (= (and b!807689 res!551947) b!807690))

(assert (= (and b!807690 res!551955) b!807683))

(assert (= (and b!807683 res!551952) b!807686))

(assert (= (and b!807686 res!551953) b!807685))

(assert (= (and b!807685 res!551954) b!807692))

(assert (= (and b!807692 res!551951) b!807682))

(assert (= (and b!807682 res!551945) b!807691))

(declare-fun m!749299 () Bool)

(assert (=> b!807682 m!749299))

(declare-fun m!749301 () Bool)

(assert (=> b!807682 m!749301))

(assert (=> b!807682 m!749301))

(declare-fun m!749303 () Bool)

(assert (=> b!807682 m!749303))

(assert (=> b!807682 m!749301))

(declare-fun m!749305 () Bool)

(assert (=> b!807682 m!749305))

(declare-fun m!749307 () Bool)

(assert (=> b!807686 m!749307))

(declare-fun m!749309 () Bool)

(assert (=> b!807687 m!749309))

(declare-fun m!749311 () Bool)

(assert (=> b!807691 m!749311))

(declare-fun m!749313 () Bool)

(assert (=> start!69228 m!749313))

(declare-fun m!749315 () Bool)

(assert (=> start!69228 m!749315))

(assert (=> b!807684 m!749301))

(assert (=> b!807684 m!749301))

(declare-fun m!749317 () Bool)

(assert (=> b!807684 m!749317))

(declare-fun m!749319 () Bool)

(assert (=> b!807683 m!749319))

(declare-fun m!749321 () Bool)

(assert (=> b!807692 m!749321))

(declare-fun m!749323 () Bool)

(assert (=> b!807692 m!749323))

(declare-fun m!749325 () Bool)

(assert (=> b!807692 m!749325))

(declare-fun m!749327 () Bool)

(assert (=> b!807692 m!749327))

(declare-fun m!749329 () Bool)

(assert (=> b!807690 m!749329))

(declare-fun m!749331 () Bool)

(assert (=> b!807689 m!749331))

(declare-fun m!749333 () Bool)

(assert (=> b!807685 m!749333))

(declare-fun m!749335 () Bool)

(assert (=> b!807685 m!749335))

(check-sat (not b!807690) (not b!807687) (not b!807689) (not start!69228) (not b!807691) (not b!807686) (not b!807683) (not b!807692) (not b!807684) (not b!807682))
(check-sat)
