; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64734 () Bool)

(assert start!64734)

(declare-fun b!730576 () Bool)

(declare-fun e!408834 () Bool)

(declare-fun e!408831 () Bool)

(assert (=> b!730576 (= e!408834 e!408831)))

(declare-fun res!490861 () Bool)

(assert (=> b!730576 (=> (not res!490861) (not e!408831))))

(declare-datatypes ((SeekEntryResult!7311 0))(
  ( (MissingZero!7311 (index!31612 (_ BitVec 32))) (Found!7311 (index!31613 (_ BitVec 32))) (Intermediate!7311 (undefined!8123 Bool) (index!31614 (_ BitVec 32)) (x!62589 (_ BitVec 32))) (Undefined!7311) (MissingVacant!7311 (index!31615 (_ BitVec 32))) )
))
(declare-fun lt!323730 () SeekEntryResult!7311)

(declare-fun lt!323732 () SeekEntryResult!7311)

(assert (=> b!730576 (= res!490861 (= lt!323730 lt!323732))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!323734 () (_ BitVec 64))

(declare-datatypes ((array!41183 0))(
  ( (array!41184 (arr!19711 (Array (_ BitVec 32) (_ BitVec 64))) (size!20132 (_ BitVec 32))) )
))
(declare-fun lt!323736 () array!41183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41183 (_ BitVec 32)) SeekEntryResult!7311)

(assert (=> b!730576 (= lt!323732 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323734 lt!323736 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730576 (= lt!323730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323734 mask!3328) lt!323734 lt!323736 mask!3328))))

(declare-fun a!3186 () array!41183)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730576 (= lt!323734 (select (store (arr!19711 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730576 (= lt!323736 (array!41184 (store (arr!19711 a!3186) i!1173 k0!2102) (size!20132 a!3186)))))

(declare-fun b!730577 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408836 () Bool)

(declare-fun lt!323737 () SeekEntryResult!7311)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41183 (_ BitVec 32)) SeekEntryResult!7311)

(assert (=> b!730577 (= e!408836 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!323737))))

(declare-fun b!730578 () Bool)

(declare-fun res!490856 () Bool)

(declare-fun e!408833 () Bool)

(assert (=> b!730578 (=> (not res!490856) (not e!408833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730578 (= res!490856 (validKeyInArray!0 k0!2102))))

(declare-fun b!730579 () Bool)

(declare-fun e!408838 () Bool)

(assert (=> b!730579 (= e!408838 true)))

(declare-fun lt!323731 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730579 (= lt!323731 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!490867 () Bool)

(assert (=> start!64734 (=> (not res!490867) (not e!408833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64734 (= res!490867 (validMask!0 mask!3328))))

(assert (=> start!64734 e!408833))

(assert (=> start!64734 true))

(declare-fun array_inv!15507 (array!41183) Bool)

(assert (=> start!64734 (array_inv!15507 a!3186)))

(declare-fun b!730580 () Bool)

(declare-fun res!490864 () Bool)

(assert (=> b!730580 (=> (not res!490864) (not e!408833))))

(assert (=> b!730580 (= res!490864 (and (= (size!20132 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20132 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20132 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!323735 () SeekEntryResult!7311)

(declare-fun e!408837 () Bool)

(declare-fun b!730581 () Bool)

(assert (=> b!730581 (= e!408837 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!323735))))

(declare-fun b!730582 () Bool)

(declare-fun e!408839 () Bool)

(assert (=> b!730582 (= e!408833 e!408839)))

(declare-fun res!490860 () Bool)

(assert (=> b!730582 (=> (not res!490860) (not e!408839))))

(declare-fun lt!323738 () SeekEntryResult!7311)

(assert (=> b!730582 (= res!490860 (or (= lt!323738 (MissingZero!7311 i!1173)) (= lt!323738 (MissingVacant!7311 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41183 (_ BitVec 32)) SeekEntryResult!7311)

(assert (=> b!730582 (= lt!323738 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730583 () Bool)

(declare-fun e!408832 () Bool)

(assert (=> b!730583 (= e!408832 e!408836)))

(declare-fun res!490862 () Bool)

(assert (=> b!730583 (=> (not res!490862) (not e!408836))))

(assert (=> b!730583 (= res!490862 (= (seekEntryOrOpen!0 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!323737))))

(assert (=> b!730583 (= lt!323737 (Found!7311 j!159))))

(declare-fun b!730584 () Bool)

(declare-fun res!490866 () Bool)

(assert (=> b!730584 (=> (not res!490866) (not e!408834))))

(assert (=> b!730584 (= res!490866 e!408837)))

(declare-fun c!80236 () Bool)

(assert (=> b!730584 (= c!80236 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730585 () Bool)

(declare-fun res!490859 () Bool)

(assert (=> b!730585 (=> (not res!490859) (not e!408833))))

(assert (=> b!730585 (= res!490859 (validKeyInArray!0 (select (arr!19711 a!3186) j!159)))))

(declare-fun b!730586 () Bool)

(assert (=> b!730586 (= e!408831 (not e!408838))))

(declare-fun res!490863 () Bool)

(assert (=> b!730586 (=> res!490863 e!408838)))

(get-info :version)

(assert (=> b!730586 (= res!490863 (or (not ((_ is Intermediate!7311) lt!323732)) (bvsge x!1131 (x!62589 lt!323732))))))

(assert (=> b!730586 e!408832))

(declare-fun res!490858 () Bool)

(assert (=> b!730586 (=> (not res!490858) (not e!408832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41183 (_ BitVec 32)) Bool)

(assert (=> b!730586 (= res!490858 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24940 0))(
  ( (Unit!24941) )
))
(declare-fun lt!323733 () Unit!24940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24940)

(assert (=> b!730586 (= lt!323733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730587 () Bool)

(assert (=> b!730587 (= e!408839 e!408834)))

(declare-fun res!490855 () Bool)

(assert (=> b!730587 (=> (not res!490855) (not e!408834))))

(assert (=> b!730587 (= res!490855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19711 a!3186) j!159) mask!3328) (select (arr!19711 a!3186) j!159) a!3186 mask!3328) lt!323735))))

(assert (=> b!730587 (= lt!323735 (Intermediate!7311 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730588 () Bool)

(declare-fun res!490853 () Bool)

(assert (=> b!730588 (=> (not res!490853) (not e!408839))))

(assert (=> b!730588 (= res!490853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730589 () Bool)

(declare-fun res!490857 () Bool)

(assert (=> b!730589 (=> (not res!490857) (not e!408839))))

(assert (=> b!730589 (= res!490857 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20132 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20132 a!3186))))))

(declare-fun b!730590 () Bool)

(assert (=> b!730590 (= e!408837 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19711 a!3186) j!159) a!3186 mask!3328) (Found!7311 j!159)))))

(declare-fun b!730591 () Bool)

(declare-fun res!490868 () Bool)

(assert (=> b!730591 (=> (not res!490868) (not e!408833))))

(declare-fun arrayContainsKey!0 (array!41183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730591 (= res!490868 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730592 () Bool)

(declare-fun res!490854 () Bool)

(assert (=> b!730592 (=> (not res!490854) (not e!408834))))

(assert (=> b!730592 (= res!490854 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19711 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730593 () Bool)

(declare-fun res!490865 () Bool)

(assert (=> b!730593 (=> (not res!490865) (not e!408839))))

(declare-datatypes ((List!13713 0))(
  ( (Nil!13710) (Cons!13709 (h!14769 (_ BitVec 64)) (t!20028 List!13713)) )
))
(declare-fun arrayNoDuplicates!0 (array!41183 (_ BitVec 32) List!13713) Bool)

(assert (=> b!730593 (= res!490865 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13710))))

(assert (= (and start!64734 res!490867) b!730580))

(assert (= (and b!730580 res!490864) b!730585))

(assert (= (and b!730585 res!490859) b!730578))

(assert (= (and b!730578 res!490856) b!730591))

(assert (= (and b!730591 res!490868) b!730582))

(assert (= (and b!730582 res!490860) b!730588))

(assert (= (and b!730588 res!490853) b!730593))

(assert (= (and b!730593 res!490865) b!730589))

(assert (= (and b!730589 res!490857) b!730587))

(assert (= (and b!730587 res!490855) b!730592))

(assert (= (and b!730592 res!490854) b!730584))

(assert (= (and b!730584 c!80236) b!730581))

(assert (= (and b!730584 (not c!80236)) b!730590))

(assert (= (and b!730584 res!490866) b!730576))

(assert (= (and b!730576 res!490861) b!730586))

(assert (= (and b!730586 res!490858) b!730583))

(assert (= (and b!730583 res!490862) b!730577))

(assert (= (and b!730586 (not res!490863)) b!730579))

(declare-fun m!684091 () Bool)

(assert (=> b!730585 m!684091))

(assert (=> b!730585 m!684091))

(declare-fun m!684093 () Bool)

(assert (=> b!730585 m!684093))

(declare-fun m!684095 () Bool)

(assert (=> b!730591 m!684095))

(declare-fun m!684097 () Bool)

(assert (=> start!64734 m!684097))

(declare-fun m!684099 () Bool)

(assert (=> start!64734 m!684099))

(declare-fun m!684101 () Bool)

(assert (=> b!730582 m!684101))

(declare-fun m!684103 () Bool)

(assert (=> b!730586 m!684103))

(declare-fun m!684105 () Bool)

(assert (=> b!730586 m!684105))

(assert (=> b!730577 m!684091))

(assert (=> b!730577 m!684091))

(declare-fun m!684107 () Bool)

(assert (=> b!730577 m!684107))

(declare-fun m!684109 () Bool)

(assert (=> b!730588 m!684109))

(declare-fun m!684111 () Bool)

(assert (=> b!730593 m!684111))

(declare-fun m!684113 () Bool)

(assert (=> b!730576 m!684113))

(declare-fun m!684115 () Bool)

(assert (=> b!730576 m!684115))

(declare-fun m!684117 () Bool)

(assert (=> b!730576 m!684117))

(declare-fun m!684119 () Bool)

(assert (=> b!730576 m!684119))

(declare-fun m!684121 () Bool)

(assert (=> b!730576 m!684121))

(assert (=> b!730576 m!684115))

(declare-fun m!684123 () Bool)

(assert (=> b!730579 m!684123))

(declare-fun m!684125 () Bool)

(assert (=> b!730592 m!684125))

(declare-fun m!684127 () Bool)

(assert (=> b!730578 m!684127))

(assert (=> b!730590 m!684091))

(assert (=> b!730590 m!684091))

(declare-fun m!684129 () Bool)

(assert (=> b!730590 m!684129))

(assert (=> b!730581 m!684091))

(assert (=> b!730581 m!684091))

(declare-fun m!684131 () Bool)

(assert (=> b!730581 m!684131))

(assert (=> b!730587 m!684091))

(assert (=> b!730587 m!684091))

(declare-fun m!684133 () Bool)

(assert (=> b!730587 m!684133))

(assert (=> b!730587 m!684133))

(assert (=> b!730587 m!684091))

(declare-fun m!684135 () Bool)

(assert (=> b!730587 m!684135))

(assert (=> b!730583 m!684091))

(assert (=> b!730583 m!684091))

(declare-fun m!684137 () Bool)

(assert (=> b!730583 m!684137))

(check-sat (not b!730593) (not b!730578) (not b!730590) (not b!730581) (not b!730579) (not b!730577) (not b!730583) (not b!730587) (not b!730576) (not b!730582) (not b!730585) (not b!730586) (not start!64734) (not b!730591) (not b!730588))
(check-sat)
