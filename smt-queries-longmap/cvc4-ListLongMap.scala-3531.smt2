; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48760 () Bool)

(assert start!48760)

(declare-fun b!536300 () Bool)

(declare-fun e!311363 () Bool)

(declare-fun e!311361 () Bool)

(assert (=> b!536300 (= e!311363 e!311361)))

(declare-fun res!331512 () Bool)

(assert (=> b!536300 (=> (not res!331512) (not e!311361))))

(declare-datatypes ((SeekEntryResult!4783 0))(
  ( (MissingZero!4783 (index!21356 (_ BitVec 32))) (Found!4783 (index!21357 (_ BitVec 32))) (Intermediate!4783 (undefined!5595 Bool) (index!21358 (_ BitVec 32)) (x!50294 (_ BitVec 32))) (Undefined!4783) (MissingVacant!4783 (index!21359 (_ BitVec 32))) )
))
(declare-fun lt!246055 () SeekEntryResult!4783)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536300 (= res!331512 (or (= lt!246055 (MissingZero!4783 i!1153)) (= lt!246055 (MissingVacant!4783 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33972 0))(
  ( (array!33973 (arr!16325 (Array (_ BitVec 32) (_ BitVec 64))) (size!16689 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33972)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4783)

(assert (=> b!536300 (= lt!246055 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536301 () Bool)

(declare-fun res!331506 () Bool)

(assert (=> b!536301 (=> (not res!331506) (not e!311363))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!536301 (= res!331506 (and (= (size!16689 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16689 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16689 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536302 () Bool)

(declare-fun e!311362 () Bool)

(assert (=> b!536302 (= e!311362 false)))

(declare-fun lt!246052 () SeekEntryResult!4783)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4783)

(assert (=> b!536302 (= lt!246052 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246053 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536303 () Bool)

(declare-fun res!331505 () Bool)

(assert (=> b!536303 (=> (not res!331505) (not e!311361))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536303 (= res!331505 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16689 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16689 a!3154)) (= (select (arr!16325 a!3154) resIndex!32) (select (arr!16325 a!3154) j!147))))))

(declare-fun b!536304 () Bool)

(declare-fun e!311364 () Bool)

(assert (=> b!536304 (= e!311364 e!311362)))

(declare-fun res!331511 () Bool)

(assert (=> b!536304 (=> (not res!331511) (not e!311362))))

(assert (=> b!536304 (= res!331511 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246053 #b00000000000000000000000000000000) (bvslt lt!246053 (size!16689 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536304 (= lt!246053 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536305 () Bool)

(declare-fun res!331509 () Bool)

(assert (=> b!536305 (=> (not res!331509) (not e!311361))))

(declare-datatypes ((List!10444 0))(
  ( (Nil!10441) (Cons!10440 (h!11383 (_ BitVec 64)) (t!16672 List!10444)) )
))
(declare-fun arrayNoDuplicates!0 (array!33972 (_ BitVec 32) List!10444) Bool)

(assert (=> b!536305 (= res!331509 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10441))))

(declare-fun b!536306 () Bool)

(declare-fun res!331515 () Bool)

(assert (=> b!536306 (=> (not res!331515) (not e!311364))))

(declare-fun lt!246054 () SeekEntryResult!4783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536306 (= res!331515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16325 a!3154) j!147) mask!3216) (select (arr!16325 a!3154) j!147) a!3154 mask!3216) lt!246054))))

(declare-fun b!536307 () Bool)

(declare-fun res!331507 () Bool)

(assert (=> b!536307 (=> (not res!331507) (not e!311363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536307 (= res!331507 (validKeyInArray!0 k!1998))))

(declare-fun b!536308 () Bool)

(declare-fun res!331514 () Bool)

(assert (=> b!536308 (=> (not res!331514) (not e!311363))))

(declare-fun arrayContainsKey!0 (array!33972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536308 (= res!331514 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!331510 () Bool)

(assert (=> start!48760 (=> (not res!331510) (not e!311363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48760 (= res!331510 (validMask!0 mask!3216))))

(assert (=> start!48760 e!311363))

(assert (=> start!48760 true))

(declare-fun array_inv!12121 (array!33972) Bool)

(assert (=> start!48760 (array_inv!12121 a!3154)))

(declare-fun b!536309 () Bool)

(assert (=> b!536309 (= e!311361 e!311364)))

(declare-fun res!331513 () Bool)

(assert (=> b!536309 (=> (not res!331513) (not e!311364))))

(assert (=> b!536309 (= res!331513 (= lt!246054 (Intermediate!4783 false resIndex!32 resX!32)))))

(assert (=> b!536309 (= lt!246054 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16325 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536310 () Bool)

(declare-fun res!331508 () Bool)

(assert (=> b!536310 (=> (not res!331508) (not e!311364))))

(assert (=> b!536310 (= res!331508 (and (not (= (select (arr!16325 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16325 a!3154) index!1177) (select (arr!16325 a!3154) j!147)))))))

(declare-fun b!536311 () Bool)

(declare-fun res!331516 () Bool)

(assert (=> b!536311 (=> (not res!331516) (not e!311361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33972 (_ BitVec 32)) Bool)

(assert (=> b!536311 (= res!331516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536312 () Bool)

(declare-fun res!331517 () Bool)

(assert (=> b!536312 (=> (not res!331517) (not e!311363))))

(assert (=> b!536312 (= res!331517 (validKeyInArray!0 (select (arr!16325 a!3154) j!147)))))

(assert (= (and start!48760 res!331510) b!536301))

(assert (= (and b!536301 res!331506) b!536312))

(assert (= (and b!536312 res!331517) b!536307))

(assert (= (and b!536307 res!331507) b!536308))

(assert (= (and b!536308 res!331514) b!536300))

(assert (= (and b!536300 res!331512) b!536311))

(assert (= (and b!536311 res!331516) b!536305))

(assert (= (and b!536305 res!331509) b!536303))

(assert (= (and b!536303 res!331505) b!536309))

(assert (= (and b!536309 res!331513) b!536306))

(assert (= (and b!536306 res!331515) b!536310))

(assert (= (and b!536310 res!331508) b!536304))

(assert (= (and b!536304 res!331511) b!536302))

(declare-fun m!515737 () Bool)

(assert (=> start!48760 m!515737))

(declare-fun m!515739 () Bool)

(assert (=> start!48760 m!515739))

(declare-fun m!515741 () Bool)

(assert (=> b!536312 m!515741))

(assert (=> b!536312 m!515741))

(declare-fun m!515743 () Bool)

(assert (=> b!536312 m!515743))

(declare-fun m!515745 () Bool)

(assert (=> b!536300 m!515745))

(assert (=> b!536309 m!515741))

(assert (=> b!536309 m!515741))

(declare-fun m!515747 () Bool)

(assert (=> b!536309 m!515747))

(declare-fun m!515749 () Bool)

(assert (=> b!536310 m!515749))

(assert (=> b!536310 m!515741))

(declare-fun m!515751 () Bool)

(assert (=> b!536308 m!515751))

(declare-fun m!515753 () Bool)

(assert (=> b!536304 m!515753))

(declare-fun m!515755 () Bool)

(assert (=> b!536307 m!515755))

(assert (=> b!536302 m!515741))

(assert (=> b!536302 m!515741))

(declare-fun m!515757 () Bool)

(assert (=> b!536302 m!515757))

(assert (=> b!536306 m!515741))

(assert (=> b!536306 m!515741))

(declare-fun m!515759 () Bool)

(assert (=> b!536306 m!515759))

(assert (=> b!536306 m!515759))

(assert (=> b!536306 m!515741))

(declare-fun m!515761 () Bool)

(assert (=> b!536306 m!515761))

(declare-fun m!515763 () Bool)

(assert (=> b!536311 m!515763))

(declare-fun m!515765 () Bool)

(assert (=> b!536303 m!515765))

(assert (=> b!536303 m!515741))

(declare-fun m!515767 () Bool)

(assert (=> b!536305 m!515767))

(push 1)

(assert (not b!536302))

(assert (not start!48760))

(assert (not b!536307))

(assert (not b!536305))

(assert (not b!536300))

(assert (not b!536308))

(assert (not b!536309))

(assert (not b!536304))

