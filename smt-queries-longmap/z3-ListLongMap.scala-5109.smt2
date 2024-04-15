; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69240 () Bool)

(assert start!69240)

(declare-fun b!807880 () Bool)

(declare-fun res!552145 () Bool)

(declare-fun e!447213 () Bool)

(assert (=> b!807880 (=> (not res!552145) (not e!447213))))

(declare-datatypes ((array!43957 0))(
  ( (array!43958 (arr!21056 (Array (_ BitVec 32) (_ BitVec 64))) (size!21477 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43957)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807880 (= res!552145 (validKeyInArray!0 (select (arr!21056 a!3170) j!153)))))

(declare-fun b!807881 () Bool)

(declare-fun res!552153 () Bool)

(declare-fun e!447211 () Bool)

(assert (=> b!807881 (=> (not res!552153) (not e!447211))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807881 (= res!552153 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21477 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21056 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21477 a!3170)) (= (select (arr!21056 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807882 () Bool)

(declare-fun res!552144 () Bool)

(assert (=> b!807882 (=> (not res!552144) (not e!447213))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!807882 (= res!552144 (and (= (size!21477 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21477 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21477 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807883 () Bool)

(declare-fun e!447210 () Bool)

(assert (=> b!807883 (= e!447211 e!447210)))

(declare-fun res!552143 () Bool)

(assert (=> b!807883 (=> (not res!552143) (not e!447210))))

(declare-fun lt!361867 () array!43957)

(declare-fun lt!361869 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8644 0))(
  ( (MissingZero!8644 (index!36944 (_ BitVec 32))) (Found!8644 (index!36945 (_ BitVec 32))) (Intermediate!8644 (undefined!9456 Bool) (index!36946 (_ BitVec 32)) (x!67755 (_ BitVec 32))) (Undefined!8644) (MissingVacant!8644 (index!36947 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43957 (_ BitVec 32)) SeekEntryResult!8644)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43957 (_ BitVec 32)) SeekEntryResult!8644)

(assert (=> b!807883 (= res!552143 (= (seekEntryOrOpen!0 lt!361869 lt!361867 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361869 lt!361867 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!807883 (= lt!361869 (select (store (arr!21056 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807883 (= lt!361867 (array!43958 (store (arr!21056 a!3170) i!1163 k0!2044) (size!21477 a!3170)))))

(declare-fun b!807884 () Bool)

(declare-fun res!552146 () Bool)

(assert (=> b!807884 (=> (not res!552146) (not e!447213))))

(declare-fun arrayContainsKey!0 (array!43957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807884 (= res!552146 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807885 () Bool)

(declare-fun e!447214 () Bool)

(assert (=> b!807885 (= e!447210 e!447214)))

(declare-fun res!552147 () Bool)

(assert (=> b!807885 (=> (not res!552147) (not e!447214))))

(declare-fun lt!361870 () SeekEntryResult!8644)

(declare-fun lt!361871 () SeekEntryResult!8644)

(assert (=> b!807885 (= res!552147 (and (= lt!361870 lt!361871) (= lt!361871 (Found!8644 j!153)) (not (= (select (arr!21056 a!3170) index!1236) (select (arr!21056 a!3170) j!153)))))))

(assert (=> b!807885 (= lt!361871 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21056 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807885 (= lt!361870 (seekEntryOrOpen!0 (select (arr!21056 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807886 () Bool)

(declare-fun res!552151 () Bool)

(assert (=> b!807886 (=> (not res!552151) (not e!447213))))

(assert (=> b!807886 (= res!552151 (validKeyInArray!0 k0!2044))))

(declare-fun b!807887 () Bool)

(declare-fun res!552152 () Bool)

(assert (=> b!807887 (=> (not res!552152) (not e!447211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43957 (_ BitVec 32)) Bool)

(assert (=> b!807887 (= res!552152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!552149 () Bool)

(assert (=> start!69240 (=> (not res!552149) (not e!447213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69240 (= res!552149 (validMask!0 mask!3266))))

(assert (=> start!69240 e!447213))

(assert (=> start!69240 true))

(declare-fun array_inv!16939 (array!43957) Bool)

(assert (=> start!69240 (array_inv!16939 a!3170)))

(declare-fun b!807888 () Bool)

(assert (=> b!807888 (= e!447214 false)))

(declare-fun lt!361866 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807888 (= lt!361866 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807889 () Bool)

(declare-fun res!552150 () Bool)

(assert (=> b!807889 (=> (not res!552150) (not e!447211))))

(declare-datatypes ((List!15058 0))(
  ( (Nil!15055) (Cons!15054 (h!16183 (_ BitVec 64)) (t!21364 List!15058)) )
))
(declare-fun arrayNoDuplicates!0 (array!43957 (_ BitVec 32) List!15058) Bool)

(assert (=> b!807889 (= res!552150 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15055))))

(declare-fun b!807890 () Bool)

(assert (=> b!807890 (= e!447213 e!447211)))

(declare-fun res!552148 () Bool)

(assert (=> b!807890 (=> (not res!552148) (not e!447211))))

(declare-fun lt!361868 () SeekEntryResult!8644)

(assert (=> b!807890 (= res!552148 (or (= lt!361868 (MissingZero!8644 i!1163)) (= lt!361868 (MissingVacant!8644 i!1163))))))

(assert (=> b!807890 (= lt!361868 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69240 res!552149) b!807882))

(assert (= (and b!807882 res!552144) b!807880))

(assert (= (and b!807880 res!552145) b!807886))

(assert (= (and b!807886 res!552151) b!807884))

(assert (= (and b!807884 res!552146) b!807890))

(assert (= (and b!807890 res!552148) b!807887))

(assert (= (and b!807887 res!552152) b!807889))

(assert (= (and b!807889 res!552150) b!807881))

(assert (= (and b!807881 res!552153) b!807883))

(assert (= (and b!807883 res!552143) b!807885))

(assert (= (and b!807885 res!552147) b!807888))

(declare-fun m!749527 () Bool)

(assert (=> b!807881 m!749527))

(declare-fun m!749529 () Bool)

(assert (=> b!807881 m!749529))

(declare-fun m!749531 () Bool)

(assert (=> b!807887 m!749531))

(declare-fun m!749533 () Bool)

(assert (=> b!807884 m!749533))

(declare-fun m!749535 () Bool)

(assert (=> b!807880 m!749535))

(assert (=> b!807880 m!749535))

(declare-fun m!749537 () Bool)

(assert (=> b!807880 m!749537))

(declare-fun m!749539 () Bool)

(assert (=> b!807885 m!749539))

(assert (=> b!807885 m!749535))

(assert (=> b!807885 m!749535))

(declare-fun m!749541 () Bool)

(assert (=> b!807885 m!749541))

(assert (=> b!807885 m!749535))

(declare-fun m!749543 () Bool)

(assert (=> b!807885 m!749543))

(declare-fun m!749545 () Bool)

(assert (=> b!807889 m!749545))

(declare-fun m!749547 () Bool)

(assert (=> start!69240 m!749547))

(declare-fun m!749549 () Bool)

(assert (=> start!69240 m!749549))

(declare-fun m!749551 () Bool)

(assert (=> b!807890 m!749551))

(declare-fun m!749553 () Bool)

(assert (=> b!807888 m!749553))

(declare-fun m!749555 () Bool)

(assert (=> b!807883 m!749555))

(declare-fun m!749557 () Bool)

(assert (=> b!807883 m!749557))

(declare-fun m!749559 () Bool)

(assert (=> b!807883 m!749559))

(declare-fun m!749561 () Bool)

(assert (=> b!807883 m!749561))

(declare-fun m!749563 () Bool)

(assert (=> b!807886 m!749563))

(check-sat (not b!807880) (not b!807886) (not b!807888) (not b!807890) (not b!807883) (not b!807885) (not b!807884) (not b!807889) (not b!807887) (not start!69240))
(check-sat)
