; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27098 () Bool)

(assert start!27098)

(declare-fun b!280025 () Bool)

(declare-fun res!143094 () Bool)

(declare-fun e!178444 () Bool)

(assert (=> b!280025 (=> (not res!143094) (not e!178444))))

(declare-datatypes ((List!4408 0))(
  ( (Nil!4405) (Cons!4404 (h!5074 (_ BitVec 64)) (t!9490 List!4408)) )
))
(declare-fun contains!1980 (List!4408 (_ BitVec 64)) Bool)

(assert (=> b!280025 (= res!143094 (not (contains!1980 Nil!4405 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280026 () Bool)

(declare-fun res!143095 () Bool)

(declare-fun e!178443 () Bool)

(assert (=> b!280026 (=> (not res!143095) (not e!178443))))

(declare-datatypes ((array!13916 0))(
  ( (array!13917 (arr!6600 (Array (_ BitVec 32) (_ BitVec 64))) (size!6952 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13916)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280026 (= res!143095 (and (= (size!6952 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6952 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6952 a!3325))))))

(declare-fun res!143098 () Bool)

(assert (=> start!27098 (=> (not res!143098) (not e!178443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27098 (= res!143098 (validMask!0 mask!3868))))

(assert (=> start!27098 e!178443))

(declare-fun array_inv!4563 (array!13916) Bool)

(assert (=> start!27098 (array_inv!4563 a!3325)))

(assert (=> start!27098 true))

(declare-fun b!280027 () Bool)

(declare-fun res!143096 () Bool)

(assert (=> b!280027 (=> (not res!143096) (not e!178444))))

(assert (=> b!280027 (= res!143096 (not (= startIndex!26 i!1267)))))

(declare-fun b!280028 () Bool)

(declare-fun res!143103 () Bool)

(assert (=> b!280028 (=> (not res!143103) (not e!178444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280028 (= res!143103 (validKeyInArray!0 (select (arr!6600 a!3325) startIndex!26)))))

(declare-fun b!280029 () Bool)

(declare-fun res!143100 () Bool)

(assert (=> b!280029 (=> (not res!143100) (not e!178443))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!280029 (= res!143100 (validKeyInArray!0 k0!2581))))

(declare-fun b!280030 () Bool)

(declare-fun res!143105 () Bool)

(assert (=> b!280030 (=> (not res!143105) (not e!178443))))

(declare-fun arrayNoDuplicates!0 (array!13916 (_ BitVec 32) List!4408) Bool)

(assert (=> b!280030 (= res!143105 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4405))))

(declare-fun b!280031 () Bool)

(declare-fun res!143097 () Bool)

(assert (=> b!280031 (=> (not res!143097) (not e!178443))))

(declare-fun arrayContainsKey!0 (array!13916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280031 (= res!143097 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280032 () Bool)

(assert (=> b!280032 (= e!178443 e!178444)))

(declare-fun res!143099 () Bool)

(assert (=> b!280032 (=> (not res!143099) (not e!178444))))

(declare-datatypes ((SeekEntryResult!1758 0))(
  ( (MissingZero!1758 (index!9202 (_ BitVec 32))) (Found!1758 (index!9203 (_ BitVec 32))) (Intermediate!1758 (undefined!2570 Bool) (index!9204 (_ BitVec 32)) (x!27444 (_ BitVec 32))) (Undefined!1758) (MissingVacant!1758 (index!9205 (_ BitVec 32))) )
))
(declare-fun lt!138762 () SeekEntryResult!1758)

(assert (=> b!280032 (= res!143099 (or (= lt!138762 (MissingZero!1758 i!1267)) (= lt!138762 (MissingVacant!1758 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13916 (_ BitVec 32)) SeekEntryResult!1758)

(assert (=> b!280032 (= lt!138762 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280033 () Bool)

(declare-fun res!143102 () Bool)

(assert (=> b!280033 (=> (not res!143102) (not e!178444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13916 (_ BitVec 32)) Bool)

(assert (=> b!280033 (= res!143102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280034 () Bool)

(declare-fun res!143104 () Bool)

(assert (=> b!280034 (=> (not res!143104) (not e!178444))))

(assert (=> b!280034 (= res!143104 (not (contains!1980 Nil!4405 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280035 () Bool)

(declare-fun res!143101 () Bool)

(assert (=> b!280035 (=> (not res!143101) (not e!178444))))

(assert (=> b!280035 (= res!143101 (and (bvslt (size!6952 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6952 a!3325))))))

(declare-fun b!280036 () Bool)

(declare-fun res!143106 () Bool)

(assert (=> b!280036 (=> (not res!143106) (not e!178444))))

(declare-fun noDuplicate!162 (List!4408) Bool)

(assert (=> b!280036 (= res!143106 (noDuplicate!162 Nil!4405))))

(declare-fun b!280037 () Bool)

(assert (=> b!280037 (= e!178444 false)))

(declare-fun lt!138763 () Bool)

(assert (=> b!280037 (= lt!138763 (contains!1980 Nil!4405 k0!2581))))

(assert (= (and start!27098 res!143098) b!280026))

(assert (= (and b!280026 res!143095) b!280029))

(assert (= (and b!280029 res!143100) b!280030))

(assert (= (and b!280030 res!143105) b!280031))

(assert (= (and b!280031 res!143097) b!280032))

(assert (= (and b!280032 res!143099) b!280033))

(assert (= (and b!280033 res!143102) b!280027))

(assert (= (and b!280027 res!143096) b!280028))

(assert (= (and b!280028 res!143103) b!280035))

(assert (= (and b!280035 res!143101) b!280036))

(assert (= (and b!280036 res!143106) b!280025))

(assert (= (and b!280025 res!143094) b!280034))

(assert (= (and b!280034 res!143104) b!280037))

(declare-fun m!294593 () Bool)

(assert (=> b!280025 m!294593))

(declare-fun m!294595 () Bool)

(assert (=> b!280028 m!294595))

(assert (=> b!280028 m!294595))

(declare-fun m!294597 () Bool)

(assert (=> b!280028 m!294597))

(declare-fun m!294599 () Bool)

(assert (=> b!280034 m!294599))

(declare-fun m!294601 () Bool)

(assert (=> b!280036 m!294601))

(declare-fun m!294603 () Bool)

(assert (=> b!280030 m!294603))

(declare-fun m!294605 () Bool)

(assert (=> b!280032 m!294605))

(declare-fun m!294607 () Bool)

(assert (=> b!280031 m!294607))

(declare-fun m!294609 () Bool)

(assert (=> b!280029 m!294609))

(declare-fun m!294611 () Bool)

(assert (=> b!280033 m!294611))

(declare-fun m!294613 () Bool)

(assert (=> b!280037 m!294613))

(declare-fun m!294615 () Bool)

(assert (=> start!27098 m!294615))

(declare-fun m!294617 () Bool)

(assert (=> start!27098 m!294617))

(check-sat (not start!27098) (not b!280029) (not b!280025) (not b!280036) (not b!280031) (not b!280033) (not b!280034) (not b!280032) (not b!280030) (not b!280028) (not b!280037))
(check-sat)
