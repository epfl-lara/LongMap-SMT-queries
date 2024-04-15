; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48828 () Bool)

(assert start!48828)

(declare-fun b!537589 () Bool)

(declare-fun res!332942 () Bool)

(declare-fun e!311786 () Bool)

(assert (=> b!537589 (=> (not res!332942) (not e!311786))))

(declare-datatypes ((array!34050 0))(
  ( (array!34051 (arr!16364 (Array (_ BitVec 32) (_ BitVec 64))) (size!16729 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34050)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537589 (= res!332942 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537590 () Bool)

(declare-fun res!332947 () Bool)

(declare-fun e!311789 () Bool)

(assert (=> b!537590 (=> (not res!332947) (not e!311789))))

(declare-datatypes ((SeekEntryResult!4819 0))(
  ( (MissingZero!4819 (index!21500 (_ BitVec 32))) (Found!4819 (index!21501 (_ BitVec 32))) (Intermediate!4819 (undefined!5631 Bool) (index!21502 (_ BitVec 32)) (x!50437 (_ BitVec 32))) (Undefined!4819) (MissingVacant!4819 (index!21503 (_ BitVec 32))) )
))
(declare-fun lt!246301 () SeekEntryResult!4819)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34050 (_ BitVec 32)) SeekEntryResult!4819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537590 (= res!332947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16364 a!3154) j!147) mask!3216) (select (arr!16364 a!3154) j!147) a!3154 mask!3216) lt!246301))))

(declare-fun res!332940 () Bool)

(assert (=> start!48828 (=> (not res!332940) (not e!311786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48828 (= res!332940 (validMask!0 mask!3216))))

(assert (=> start!48828 e!311786))

(assert (=> start!48828 true))

(declare-fun array_inv!12247 (array!34050) Bool)

(assert (=> start!48828 (array_inv!12247 a!3154)))

(declare-fun b!537591 () Bool)

(declare-fun e!311790 () Bool)

(assert (=> b!537591 (= e!311786 e!311790)))

(declare-fun res!332948 () Bool)

(assert (=> b!537591 (=> (not res!332948) (not e!311790))))

(declare-fun lt!246299 () SeekEntryResult!4819)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537591 (= res!332948 (or (= lt!246299 (MissingZero!4819 i!1153)) (= lt!246299 (MissingVacant!4819 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34050 (_ BitVec 32)) SeekEntryResult!4819)

(assert (=> b!537591 (= lt!246299 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537592 () Bool)

(declare-fun res!332941 () Bool)

(assert (=> b!537592 (=> (not res!332941) (not e!311786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537592 (= res!332941 (validKeyInArray!0 k0!1998))))

(declare-fun b!537593 () Bool)

(declare-fun res!332943 () Bool)

(assert (=> b!537593 (=> (not res!332943) (not e!311790))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537593 (= res!332943 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16729 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16729 a!3154)) (= (select (arr!16364 a!3154) resIndex!32) (select (arr!16364 a!3154) j!147))))))

(declare-fun b!537594 () Bool)

(assert (=> b!537594 (= e!311790 e!311789)))

(declare-fun res!332938 () Bool)

(assert (=> b!537594 (=> (not res!332938) (not e!311789))))

(assert (=> b!537594 (= res!332938 (= lt!246301 (Intermediate!4819 false resIndex!32 resX!32)))))

(assert (=> b!537594 (= lt!246301 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16364 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537595 () Bool)

(declare-fun res!332939 () Bool)

(assert (=> b!537595 (=> (not res!332939) (not e!311789))))

(assert (=> b!537595 (= res!332939 (and (not (= (select (arr!16364 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16364 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16364 a!3154) index!1177) (select (arr!16364 a!3154) j!147)))))))

(declare-fun b!537596 () Bool)

(declare-fun e!311788 () Bool)

(assert (=> b!537596 (= e!311788 false)))

(declare-fun lt!246298 () SeekEntryResult!4819)

(declare-fun lt!246300 () (_ BitVec 32))

(assert (=> b!537596 (= lt!246298 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246300 (select (arr!16364 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537597 () Bool)

(declare-fun res!332937 () Bool)

(assert (=> b!537597 (=> (not res!332937) (not e!311790))))

(declare-datatypes ((List!10522 0))(
  ( (Nil!10519) (Cons!10518 (h!11461 (_ BitVec 64)) (t!16741 List!10522)) )
))
(declare-fun arrayNoDuplicates!0 (array!34050 (_ BitVec 32) List!10522) Bool)

(assert (=> b!537597 (= res!332937 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10519))))

(declare-fun b!537598 () Bool)

(declare-fun res!332936 () Bool)

(assert (=> b!537598 (=> (not res!332936) (not e!311790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34050 (_ BitVec 32)) Bool)

(assert (=> b!537598 (= res!332936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537599 () Bool)

(declare-fun res!332945 () Bool)

(assert (=> b!537599 (=> (not res!332945) (not e!311786))))

(assert (=> b!537599 (= res!332945 (validKeyInArray!0 (select (arr!16364 a!3154) j!147)))))

(declare-fun b!537600 () Bool)

(assert (=> b!537600 (= e!311789 e!311788)))

(declare-fun res!332944 () Bool)

(assert (=> b!537600 (=> (not res!332944) (not e!311788))))

(assert (=> b!537600 (= res!332944 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246300 #b00000000000000000000000000000000) (bvslt lt!246300 (size!16729 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537600 (= lt!246300 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537601 () Bool)

(declare-fun res!332946 () Bool)

(assert (=> b!537601 (=> (not res!332946) (not e!311786))))

(assert (=> b!537601 (= res!332946 (and (= (size!16729 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16729 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16729 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48828 res!332940) b!537601))

(assert (= (and b!537601 res!332946) b!537599))

(assert (= (and b!537599 res!332945) b!537592))

(assert (= (and b!537592 res!332941) b!537589))

(assert (= (and b!537589 res!332942) b!537591))

(assert (= (and b!537591 res!332948) b!537598))

(assert (= (and b!537598 res!332936) b!537597))

(assert (= (and b!537597 res!332937) b!537593))

(assert (= (and b!537593 res!332943) b!537594))

(assert (= (and b!537594 res!332938) b!537590))

(assert (= (and b!537590 res!332947) b!537595))

(assert (= (and b!537595 res!332939) b!537600))

(assert (= (and b!537600 res!332944) b!537596))

(declare-fun m!516265 () Bool)

(assert (=> b!537596 m!516265))

(assert (=> b!537596 m!516265))

(declare-fun m!516267 () Bool)

(assert (=> b!537596 m!516267))

(declare-fun m!516269 () Bool)

(assert (=> b!537589 m!516269))

(assert (=> b!537594 m!516265))

(assert (=> b!537594 m!516265))

(declare-fun m!516271 () Bool)

(assert (=> b!537594 m!516271))

(declare-fun m!516273 () Bool)

(assert (=> b!537595 m!516273))

(assert (=> b!537595 m!516265))

(declare-fun m!516275 () Bool)

(assert (=> b!537591 m!516275))

(declare-fun m!516277 () Bool)

(assert (=> b!537600 m!516277))

(declare-fun m!516279 () Bool)

(assert (=> b!537598 m!516279))

(assert (=> b!537599 m!516265))

(assert (=> b!537599 m!516265))

(declare-fun m!516281 () Bool)

(assert (=> b!537599 m!516281))

(assert (=> b!537590 m!516265))

(assert (=> b!537590 m!516265))

(declare-fun m!516283 () Bool)

(assert (=> b!537590 m!516283))

(assert (=> b!537590 m!516283))

(assert (=> b!537590 m!516265))

(declare-fun m!516285 () Bool)

(assert (=> b!537590 m!516285))

(declare-fun m!516287 () Bool)

(assert (=> b!537592 m!516287))

(declare-fun m!516289 () Bool)

(assert (=> b!537593 m!516289))

(assert (=> b!537593 m!516265))

(declare-fun m!516291 () Bool)

(assert (=> start!48828 m!516291))

(declare-fun m!516293 () Bool)

(assert (=> start!48828 m!516293))

(declare-fun m!516295 () Bool)

(assert (=> b!537597 m!516295))

(check-sat (not b!537599) (not b!537592) (not start!48828) (not b!537600) (not b!537594) (not b!537596) (not b!537598) (not b!537597) (not b!537591) (not b!537589) (not b!537590))
(check-sat)
