; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48746 () Bool)

(assert start!48746)

(declare-fun b!536027 () Bool)

(declare-fun res!331239 () Bool)

(declare-fun e!311256 () Bool)

(assert (=> b!536027 (=> (not res!331239) (not e!311256))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33958 0))(
  ( (array!33959 (arr!16318 (Array (_ BitVec 32) (_ BitVec 64))) (size!16682 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33958)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536027 (= res!331239 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16682 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16682 a!3154)) (= (select (arr!16318 a!3154) resIndex!32) (select (arr!16318 a!3154) j!147))))))

(declare-fun b!536028 () Bool)

(declare-fun e!311257 () Bool)

(declare-fun e!311258 () Bool)

(assert (=> b!536028 (= e!311257 e!311258)))

(declare-fun res!331243 () Bool)

(assert (=> b!536028 (=> (not res!331243) (not e!311258))))

(declare-fun lt!245968 () (_ BitVec 32))

(assert (=> b!536028 (= res!331243 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245968 #b00000000000000000000000000000000) (bvslt lt!245968 (size!16682 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536028 (= lt!245968 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536029 () Bool)

(assert (=> b!536029 (= e!311256 e!311257)))

(declare-fun res!331240 () Bool)

(assert (=> b!536029 (=> (not res!331240) (not e!311257))))

(declare-datatypes ((SeekEntryResult!4776 0))(
  ( (MissingZero!4776 (index!21328 (_ BitVec 32))) (Found!4776 (index!21329 (_ BitVec 32))) (Intermediate!4776 (undefined!5588 Bool) (index!21330 (_ BitVec 32)) (x!50271 (_ BitVec 32))) (Undefined!4776) (MissingVacant!4776 (index!21331 (_ BitVec 32))) )
))
(declare-fun lt!245970 () SeekEntryResult!4776)

(assert (=> b!536029 (= res!331240 (= lt!245970 (Intermediate!4776 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33958 (_ BitVec 32)) SeekEntryResult!4776)

(assert (=> b!536029 (= lt!245970 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16318 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536030 () Bool)

(declare-fun e!311259 () Bool)

(assert (=> b!536030 (= e!311259 e!311256)))

(declare-fun res!331234 () Bool)

(assert (=> b!536030 (=> (not res!331234) (not e!311256))))

(declare-fun lt!245969 () SeekEntryResult!4776)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536030 (= res!331234 (or (= lt!245969 (MissingZero!4776 i!1153)) (= lt!245969 (MissingVacant!4776 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33958 (_ BitVec 32)) SeekEntryResult!4776)

(assert (=> b!536030 (= lt!245969 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536031 () Bool)

(assert (=> b!536031 (= e!311258 false)))

(declare-fun lt!245971 () SeekEntryResult!4776)

(assert (=> b!536031 (= lt!245971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245968 (select (arr!16318 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331233 () Bool)

(assert (=> start!48746 (=> (not res!331233) (not e!311259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48746 (= res!331233 (validMask!0 mask!3216))))

(assert (=> start!48746 e!311259))

(assert (=> start!48746 true))

(declare-fun array_inv!12114 (array!33958) Bool)

(assert (=> start!48746 (array_inv!12114 a!3154)))

(declare-fun b!536032 () Bool)

(declare-fun res!331242 () Bool)

(assert (=> b!536032 (=> (not res!331242) (not e!311257))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536032 (= res!331242 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16318 a!3154) j!147) mask!3216) (select (arr!16318 a!3154) j!147) a!3154 mask!3216) lt!245970))))

(declare-fun b!536033 () Bool)

(declare-fun res!331235 () Bool)

(assert (=> b!536033 (=> (not res!331235) (not e!311259))))

(declare-fun arrayContainsKey!0 (array!33958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536033 (= res!331235 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536034 () Bool)

(declare-fun res!331244 () Bool)

(assert (=> b!536034 (=> (not res!331244) (not e!311259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536034 (= res!331244 (validKeyInArray!0 (select (arr!16318 a!3154) j!147)))))

(declare-fun b!536035 () Bool)

(declare-fun res!331241 () Bool)

(assert (=> b!536035 (=> (not res!331241) (not e!311256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33958 (_ BitVec 32)) Bool)

(assert (=> b!536035 (= res!331241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536036 () Bool)

(declare-fun res!331238 () Bool)

(assert (=> b!536036 (=> (not res!331238) (not e!311257))))

(assert (=> b!536036 (= res!331238 (and (not (= (select (arr!16318 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16318 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16318 a!3154) index!1177) (select (arr!16318 a!3154) j!147)))))))

(declare-fun b!536037 () Bool)

(declare-fun res!331236 () Bool)

(assert (=> b!536037 (=> (not res!331236) (not e!311259))))

(assert (=> b!536037 (= res!331236 (and (= (size!16682 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16682 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16682 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536038 () Bool)

(declare-fun res!331237 () Bool)

(assert (=> b!536038 (=> (not res!331237) (not e!311259))))

(assert (=> b!536038 (= res!331237 (validKeyInArray!0 k0!1998))))

(declare-fun b!536039 () Bool)

(declare-fun res!331232 () Bool)

(assert (=> b!536039 (=> (not res!331232) (not e!311256))))

(declare-datatypes ((List!10437 0))(
  ( (Nil!10434) (Cons!10433 (h!11376 (_ BitVec 64)) (t!16665 List!10437)) )
))
(declare-fun arrayNoDuplicates!0 (array!33958 (_ BitVec 32) List!10437) Bool)

(assert (=> b!536039 (= res!331232 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10434))))

(assert (= (and start!48746 res!331233) b!536037))

(assert (= (and b!536037 res!331236) b!536034))

(assert (= (and b!536034 res!331244) b!536038))

(assert (= (and b!536038 res!331237) b!536033))

(assert (= (and b!536033 res!331235) b!536030))

(assert (= (and b!536030 res!331234) b!536035))

(assert (= (and b!536035 res!331241) b!536039))

(assert (= (and b!536039 res!331232) b!536027))

(assert (= (and b!536027 res!331239) b!536029))

(assert (= (and b!536029 res!331240) b!536032))

(assert (= (and b!536032 res!331242) b!536036))

(assert (= (and b!536036 res!331238) b!536028))

(assert (= (and b!536028 res!331243) b!536031))

(declare-fun m!515513 () Bool)

(assert (=> b!536027 m!515513))

(declare-fun m!515515 () Bool)

(assert (=> b!536027 m!515515))

(declare-fun m!515517 () Bool)

(assert (=> b!536038 m!515517))

(assert (=> b!536031 m!515515))

(assert (=> b!536031 m!515515))

(declare-fun m!515519 () Bool)

(assert (=> b!536031 m!515519))

(assert (=> b!536032 m!515515))

(assert (=> b!536032 m!515515))

(declare-fun m!515521 () Bool)

(assert (=> b!536032 m!515521))

(assert (=> b!536032 m!515521))

(assert (=> b!536032 m!515515))

(declare-fun m!515523 () Bool)

(assert (=> b!536032 m!515523))

(declare-fun m!515525 () Bool)

(assert (=> b!536039 m!515525))

(declare-fun m!515527 () Bool)

(assert (=> start!48746 m!515527))

(declare-fun m!515529 () Bool)

(assert (=> start!48746 m!515529))

(declare-fun m!515531 () Bool)

(assert (=> b!536030 m!515531))

(declare-fun m!515533 () Bool)

(assert (=> b!536036 m!515533))

(assert (=> b!536036 m!515515))

(declare-fun m!515535 () Bool)

(assert (=> b!536035 m!515535))

(declare-fun m!515537 () Bool)

(assert (=> b!536028 m!515537))

(declare-fun m!515539 () Bool)

(assert (=> b!536033 m!515539))

(assert (=> b!536034 m!515515))

(assert (=> b!536034 m!515515))

(declare-fun m!515541 () Bool)

(assert (=> b!536034 m!515541))

(assert (=> b!536029 m!515515))

(assert (=> b!536029 m!515515))

(declare-fun m!515543 () Bool)

(assert (=> b!536029 m!515543))

(check-sat (not b!536031) (not b!536028) (not b!536039) (not b!536035) (not b!536030) (not b!536034) (not b!536038) (not start!48746) (not b!536033) (not b!536032) (not b!536029))
(check-sat)
