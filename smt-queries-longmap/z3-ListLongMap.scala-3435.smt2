; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47718 () Bool)

(assert start!47718)

(declare-fun b!524859 () Bool)

(declare-fun res!321818 () Bool)

(declare-fun e!306031 () Bool)

(assert (=> b!524859 (=> res!321818 e!306031)))

(declare-datatypes ((SeekEntryResult!4498 0))(
  ( (MissingZero!4498 (index!20204 (_ BitVec 32))) (Found!4498 (index!20205 (_ BitVec 32))) (Intermediate!4498 (undefined!5310 Bool) (index!20206 (_ BitVec 32)) (x!49194 (_ BitVec 32))) (Undefined!4498) (MissingVacant!4498 (index!20207 (_ BitVec 32))) )
))
(declare-fun lt!240941 () SeekEntryResult!4498)

(get-info :version)

(assert (=> b!524859 (= res!321818 (or (undefined!5310 lt!240941) (not ((_ is Intermediate!4498) lt!240941))))))

(declare-fun b!524860 () Bool)

(declare-fun e!306033 () Bool)

(assert (=> b!524860 (= e!306033 (not e!306031))))

(declare-fun res!321816 () Bool)

(assert (=> b!524860 (=> res!321816 e!306031)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33365 0))(
  ( (array!33366 (arr!16034 (Array (_ BitVec 32) (_ BitVec 64))) (size!16399 (_ BitVec 32))) )
))
(declare-fun lt!240948 () array!33365)

(declare-fun lt!240940 () (_ BitVec 32))

(declare-fun lt!240944 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33365 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!524860 (= res!321816 (= lt!240941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240940 lt!240944 lt!240948 mask!3524)))))

(declare-fun lt!240947 () (_ BitVec 32))

(declare-fun a!3235 () array!33365)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524860 (= lt!240941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240947 (select (arr!16034 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524860 (= lt!240940 (toIndex!0 lt!240944 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524860 (= lt!240944 (select (store (arr!16034 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524860 (= lt!240947 (toIndex!0 (select (arr!16034 a!3235) j!176) mask!3524))))

(assert (=> b!524860 (= lt!240948 (array!33366 (store (arr!16034 a!3235) i!1204 k0!2280) (size!16399 a!3235)))))

(declare-fun e!306035 () Bool)

(assert (=> b!524860 e!306035))

(declare-fun res!321815 () Bool)

(assert (=> b!524860 (=> (not res!321815) (not e!306035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33365 (_ BitVec 32)) Bool)

(assert (=> b!524860 (= res!321815 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16438 0))(
  ( (Unit!16439) )
))
(declare-fun lt!240946 () Unit!16438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!524860 (= lt!240946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524861 () Bool)

(declare-fun e!306034 () Bool)

(assert (=> b!524861 (= e!306034 e!306033)))

(declare-fun res!321814 () Bool)

(assert (=> b!524861 (=> (not res!321814) (not e!306033))))

(declare-fun lt!240943 () SeekEntryResult!4498)

(assert (=> b!524861 (= res!321814 (or (= lt!240943 (MissingZero!4498 i!1204)) (= lt!240943 (MissingVacant!4498 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33365 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!524861 (= lt!240943 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524862 () Bool)

(declare-fun res!321811 () Bool)

(assert (=> b!524862 (=> (not res!321811) (not e!306034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524862 (= res!321811 (validKeyInArray!0 (select (arr!16034 a!3235) j!176)))))

(declare-fun b!524863 () Bool)

(declare-fun e!306030 () Unit!16438)

(declare-fun Unit!16440 () Unit!16438)

(assert (=> b!524863 (= e!306030 Unit!16440)))

(declare-fun b!524864 () Bool)

(declare-fun res!321817 () Bool)

(assert (=> b!524864 (=> (not res!321817) (not e!306034))))

(assert (=> b!524864 (= res!321817 (and (= (size!16399 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16399 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16399 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524865 () Bool)

(declare-fun Unit!16441 () Unit!16438)

(assert (=> b!524865 (= e!306030 Unit!16441)))

(declare-fun lt!240942 () Unit!16438)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!524865 (= lt!240942 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240947 #b00000000000000000000000000000000 (index!20206 lt!240941) (x!49194 lt!240941) mask!3524))))

(declare-fun res!321812 () Bool)

(assert (=> b!524865 (= res!321812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240947 lt!240944 lt!240948 mask!3524) (Intermediate!4498 false (index!20206 lt!240941) (x!49194 lt!240941))))))

(declare-fun e!306036 () Bool)

(assert (=> b!524865 (=> (not res!321812) (not e!306036))))

(assert (=> b!524865 e!306036))

(declare-fun b!524866 () Bool)

(declare-fun res!321820 () Bool)

(assert (=> b!524866 (=> (not res!321820) (not e!306033))))

(declare-datatypes ((List!10231 0))(
  ( (Nil!10228) (Cons!10227 (h!11158 (_ BitVec 64)) (t!16450 List!10231)) )
))
(declare-fun arrayNoDuplicates!0 (array!33365 (_ BitVec 32) List!10231) Bool)

(assert (=> b!524866 (= res!321820 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10228))))

(declare-fun b!524867 () Bool)

(assert (=> b!524867 (= e!306036 false)))

(declare-fun b!524868 () Bool)

(declare-fun res!321821 () Bool)

(assert (=> b!524868 (=> (not res!321821) (not e!306034))))

(assert (=> b!524868 (= res!321821 (validKeyInArray!0 k0!2280))))

(declare-fun res!321813 () Bool)

(assert (=> start!47718 (=> (not res!321813) (not e!306034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47718 (= res!321813 (validMask!0 mask!3524))))

(assert (=> start!47718 e!306034))

(assert (=> start!47718 true))

(declare-fun array_inv!11917 (array!33365) Bool)

(assert (=> start!47718 (array_inv!11917 a!3235)))

(declare-fun b!524869 () Bool)

(assert (=> b!524869 (= e!306031 true)))

(assert (=> b!524869 (= (index!20206 lt!240941) i!1204)))

(declare-fun lt!240945 () Unit!16438)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!524869 (= lt!240945 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240947 #b00000000000000000000000000000000 (index!20206 lt!240941) (x!49194 lt!240941) mask!3524))))

(assert (=> b!524869 (and (or (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240949 () Unit!16438)

(assert (=> b!524869 (= lt!240949 e!306030)))

(declare-fun c!61830 () Bool)

(assert (=> b!524869 (= c!61830 (= (select (arr!16034 a!3235) (index!20206 lt!240941)) (select (arr!16034 a!3235) j!176)))))

(assert (=> b!524869 (and (bvslt (x!49194 lt!240941) #b01111111111111111111111111111110) (or (= (select (arr!16034 a!3235) (index!20206 lt!240941)) (select (arr!16034 a!3235) j!176)) (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16034 a!3235) (index!20206 lt!240941)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524870 () Bool)

(declare-fun res!321819 () Bool)

(assert (=> b!524870 (=> (not res!321819) (not e!306034))))

(declare-fun arrayContainsKey!0 (array!33365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524870 (= res!321819 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524871 () Bool)

(assert (=> b!524871 (= e!306035 (= (seekEntryOrOpen!0 (select (arr!16034 a!3235) j!176) a!3235 mask!3524) (Found!4498 j!176)))))

(declare-fun b!524872 () Bool)

(declare-fun res!321810 () Bool)

(assert (=> b!524872 (=> (not res!321810) (not e!306033))))

(assert (=> b!524872 (= res!321810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47718 res!321813) b!524864))

(assert (= (and b!524864 res!321817) b!524862))

(assert (= (and b!524862 res!321811) b!524868))

(assert (= (and b!524868 res!321821) b!524870))

(assert (= (and b!524870 res!321819) b!524861))

(assert (= (and b!524861 res!321814) b!524872))

(assert (= (and b!524872 res!321810) b!524866))

(assert (= (and b!524866 res!321820) b!524860))

(assert (= (and b!524860 res!321815) b!524871))

(assert (= (and b!524860 (not res!321816)) b!524859))

(assert (= (and b!524859 (not res!321818)) b!524869))

(assert (= (and b!524869 c!61830) b!524865))

(assert (= (and b!524869 (not c!61830)) b!524863))

(assert (= (and b!524865 res!321812) b!524867))

(declare-fun m!505021 () Bool)

(assert (=> b!524868 m!505021))

(declare-fun m!505023 () Bool)

(assert (=> b!524860 m!505023))

(declare-fun m!505025 () Bool)

(assert (=> b!524860 m!505025))

(declare-fun m!505027 () Bool)

(assert (=> b!524860 m!505027))

(declare-fun m!505029 () Bool)

(assert (=> b!524860 m!505029))

(declare-fun m!505031 () Bool)

(assert (=> b!524860 m!505031))

(assert (=> b!524860 m!505029))

(declare-fun m!505033 () Bool)

(assert (=> b!524860 m!505033))

(assert (=> b!524860 m!505029))

(declare-fun m!505035 () Bool)

(assert (=> b!524860 m!505035))

(declare-fun m!505037 () Bool)

(assert (=> b!524860 m!505037))

(declare-fun m!505039 () Bool)

(assert (=> b!524860 m!505039))

(declare-fun m!505041 () Bool)

(assert (=> b!524861 m!505041))

(declare-fun m!505043 () Bool)

(assert (=> b!524866 m!505043))

(declare-fun m!505045 () Bool)

(assert (=> b!524870 m!505045))

(declare-fun m!505047 () Bool)

(assert (=> b!524865 m!505047))

(declare-fun m!505049 () Bool)

(assert (=> b!524865 m!505049))

(assert (=> b!524862 m!505029))

(assert (=> b!524862 m!505029))

(declare-fun m!505051 () Bool)

(assert (=> b!524862 m!505051))

(declare-fun m!505053 () Bool)

(assert (=> start!47718 m!505053))

(declare-fun m!505055 () Bool)

(assert (=> start!47718 m!505055))

(assert (=> b!524871 m!505029))

(assert (=> b!524871 m!505029))

(declare-fun m!505057 () Bool)

(assert (=> b!524871 m!505057))

(declare-fun m!505059 () Bool)

(assert (=> b!524872 m!505059))

(declare-fun m!505061 () Bool)

(assert (=> b!524869 m!505061))

(declare-fun m!505063 () Bool)

(assert (=> b!524869 m!505063))

(assert (=> b!524869 m!505029))

(check-sat (not b!524862) (not b!524866) (not start!47718) (not b!524871) (not b!524870) (not b!524865) (not b!524872) (not b!524860) (not b!524868) (not b!524869) (not b!524861))
(check-sat)
