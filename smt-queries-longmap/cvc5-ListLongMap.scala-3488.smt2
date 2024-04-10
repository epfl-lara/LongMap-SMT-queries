; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48396 () Bool)

(assert start!48396)

(declare-fun b!531784 () Bool)

(declare-fun e!309725 () Bool)

(declare-fun e!309726 () Bool)

(assert (=> b!531784 (= e!309725 e!309726)))

(declare-fun res!327276 () Bool)

(assert (=> b!531784 (=> (not res!327276) (not e!309726))))

(declare-datatypes ((SeekEntryResult!4652 0))(
  ( (MissingZero!4652 (index!20832 (_ BitVec 32))) (Found!4652 (index!20833 (_ BitVec 32))) (Intermediate!4652 (undefined!5464 Bool) (index!20834 (_ BitVec 32)) (x!49810 (_ BitVec 32))) (Undefined!4652) (MissingVacant!4652 (index!20835 (_ BitVec 32))) )
))
(declare-fun lt!245077 () SeekEntryResult!4652)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531784 (= res!327276 (or (= lt!245077 (MissingZero!4652 i!1153)) (= lt!245077 (MissingVacant!4652 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33704 0))(
  ( (array!33705 (arr!16194 (Array (_ BitVec 32) (_ BitVec 64))) (size!16558 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33704)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33704 (_ BitVec 32)) SeekEntryResult!4652)

(assert (=> b!531784 (= lt!245077 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531785 () Bool)

(declare-fun res!327275 () Bool)

(assert (=> b!531785 (=> (not res!327275) (not e!309726))))

(declare-datatypes ((List!10313 0))(
  ( (Nil!10310) (Cons!10309 (h!11249 (_ BitVec 64)) (t!16541 List!10313)) )
))
(declare-fun arrayNoDuplicates!0 (array!33704 (_ BitVec 32) List!10313) Bool)

(assert (=> b!531785 (= res!327275 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10310))))

(declare-fun b!531786 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531786 (= e!309726 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16558 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16558 a!3154)) (= (select (arr!16194 a!3154) resIndex!32) (select (arr!16194 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!531787 () Bool)

(declare-fun res!327281 () Bool)

(assert (=> b!531787 (=> (not res!327281) (not e!309725))))

(declare-fun arrayContainsKey!0 (array!33704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531787 (= res!327281 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531788 () Bool)

(declare-fun res!327277 () Bool)

(assert (=> b!531788 (=> (not res!327277) (not e!309725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531788 (= res!327277 (validKeyInArray!0 k!1998))))

(declare-fun res!327279 () Bool)

(assert (=> start!48396 (=> (not res!327279) (not e!309725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48396 (= res!327279 (validMask!0 mask!3216))))

(assert (=> start!48396 e!309725))

(assert (=> start!48396 true))

(declare-fun array_inv!11990 (array!33704) Bool)

(assert (=> start!48396 (array_inv!11990 a!3154)))

(declare-fun b!531789 () Bool)

(declare-fun res!327278 () Bool)

(assert (=> b!531789 (=> (not res!327278) (not e!309726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33704 (_ BitVec 32)) Bool)

(assert (=> b!531789 (= res!327278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531790 () Bool)

(declare-fun res!327274 () Bool)

(assert (=> b!531790 (=> (not res!327274) (not e!309725))))

(assert (=> b!531790 (= res!327274 (and (= (size!16558 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16558 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16558 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531791 () Bool)

(declare-fun res!327280 () Bool)

(assert (=> b!531791 (=> (not res!327280) (not e!309725))))

(assert (=> b!531791 (= res!327280 (validKeyInArray!0 (select (arr!16194 a!3154) j!147)))))

(assert (= (and start!48396 res!327279) b!531790))

(assert (= (and b!531790 res!327274) b!531791))

(assert (= (and b!531791 res!327280) b!531788))

(assert (= (and b!531788 res!327277) b!531787))

(assert (= (and b!531787 res!327281) b!531784))

(assert (= (and b!531784 res!327276) b!531789))

(assert (= (and b!531789 res!327278) b!531785))

(assert (= (and b!531785 res!327275) b!531786))

(declare-fun m!512139 () Bool)

(assert (=> b!531789 m!512139))

(declare-fun m!512141 () Bool)

(assert (=> b!531784 m!512141))

(declare-fun m!512143 () Bool)

(assert (=> start!48396 m!512143))

(declare-fun m!512145 () Bool)

(assert (=> start!48396 m!512145))

(declare-fun m!512147 () Bool)

(assert (=> b!531785 m!512147))

(declare-fun m!512149 () Bool)

(assert (=> b!531788 m!512149))

(declare-fun m!512151 () Bool)

(assert (=> b!531787 m!512151))

(declare-fun m!512153 () Bool)

(assert (=> b!531786 m!512153))

(declare-fun m!512155 () Bool)

(assert (=> b!531786 m!512155))

(assert (=> b!531791 m!512155))

(assert (=> b!531791 m!512155))

(declare-fun m!512157 () Bool)

(assert (=> b!531791 m!512157))

(push 1)

(assert (not start!48396))

(assert (not b!531788))

(assert (not b!531784))

(assert (not b!531785))

(assert (not b!531791))

(assert (not b!531787))

(assert (not b!531789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

