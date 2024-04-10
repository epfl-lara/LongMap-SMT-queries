; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47442 () Bool)

(assert start!47442)

(declare-fun b!522250 () Bool)

(declare-fun e!304625 () Bool)

(declare-fun e!304624 () Bool)

(assert (=> b!522250 (= e!304625 e!304624)))

(declare-fun res!319934 () Bool)

(assert (=> b!522250 (=> (not res!319934) (not e!304624))))

(declare-datatypes ((SeekEntryResult!4457 0))(
  ( (MissingZero!4457 (index!20031 (_ BitVec 32))) (Found!4457 (index!20032 (_ BitVec 32))) (Intermediate!4457 (undefined!5269 Bool) (index!20033 (_ BitVec 32)) (x!49011 (_ BitVec 32))) (Undefined!4457) (MissingVacant!4457 (index!20034 (_ BitVec 32))) )
))
(declare-fun lt!239482 () SeekEntryResult!4457)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522250 (= res!319934 (or (= lt!239482 (MissingZero!4457 i!1204)) (= lt!239482 (MissingVacant!4457 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33268 0))(
  ( (array!33269 (arr!15990 (Array (_ BitVec 32) (_ BitVec 64))) (size!16354 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33268 (_ BitVec 32)) SeekEntryResult!4457)

(assert (=> b!522250 (= lt!239482 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522251 () Bool)

(declare-fun e!304623 () Bool)

(assert (=> b!522251 (= e!304624 (not e!304623))))

(declare-fun res!319938 () Bool)

(assert (=> b!522251 (=> res!319938 e!304623)))

(declare-fun lt!239480 () SeekEntryResult!4457)

(declare-fun lt!239481 () array!33268)

(declare-fun lt!239486 () (_ BitVec 64))

(declare-fun lt!239484 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33268 (_ BitVec 32)) SeekEntryResult!4457)

(assert (=> b!522251 (= res!319938 (= lt!239480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239484 lt!239486 lt!239481 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239487 () (_ BitVec 32))

(assert (=> b!522251 (= lt!239480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239487 (select (arr!15990 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522251 (= lt!239484 (toIndex!0 lt!239486 mask!3524))))

(assert (=> b!522251 (= lt!239486 (select (store (arr!15990 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522251 (= lt!239487 (toIndex!0 (select (arr!15990 a!3235) j!176) mask!3524))))

(assert (=> b!522251 (= lt!239481 (array!33269 (store (arr!15990 a!3235) i!1204 k!2280) (size!16354 a!3235)))))

(declare-fun e!304621 () Bool)

(assert (=> b!522251 e!304621))

(declare-fun res!319943 () Bool)

(assert (=> b!522251 (=> (not res!319943) (not e!304621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33268 (_ BitVec 32)) Bool)

(assert (=> b!522251 (= res!319943 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16280 0))(
  ( (Unit!16281) )
))
(declare-fun lt!239488 () Unit!16280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16280)

(assert (=> b!522251 (= lt!239488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522252 () Bool)

(declare-fun res!319940 () Bool)

(assert (=> b!522252 (=> (not res!319940) (not e!304624))))

(assert (=> b!522252 (= res!319940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522253 () Bool)

(declare-fun res!319941 () Bool)

(assert (=> b!522253 (=> (not res!319941) (not e!304624))))

(declare-datatypes ((List!10148 0))(
  ( (Nil!10145) (Cons!10144 (h!11066 (_ BitVec 64)) (t!16376 List!10148)) )
))
(declare-fun arrayNoDuplicates!0 (array!33268 (_ BitVec 32) List!10148) Bool)

(assert (=> b!522253 (= res!319941 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10145))))

(declare-fun b!522254 () Bool)

(assert (=> b!522254 (= e!304623 true)))

(assert (=> b!522254 (and (or (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239483 () Unit!16280)

(declare-fun e!304620 () Unit!16280)

(assert (=> b!522254 (= lt!239483 e!304620)))

(declare-fun c!61460 () Bool)

(assert (=> b!522254 (= c!61460 (= (select (arr!15990 a!3235) (index!20033 lt!239480)) (select (arr!15990 a!3235) j!176)))))

(assert (=> b!522254 (and (bvslt (x!49011 lt!239480) #b01111111111111111111111111111110) (or (= (select (arr!15990 a!3235) (index!20033 lt!239480)) (select (arr!15990 a!3235) j!176)) (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15990 a!3235) (index!20033 lt!239480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522255 () Bool)

(declare-fun e!304626 () Bool)

(assert (=> b!522255 (= e!304626 false)))

(declare-fun res!319932 () Bool)

(assert (=> start!47442 (=> (not res!319932) (not e!304625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47442 (= res!319932 (validMask!0 mask!3524))))

(assert (=> start!47442 e!304625))

(assert (=> start!47442 true))

(declare-fun array_inv!11786 (array!33268) Bool)

(assert (=> start!47442 (array_inv!11786 a!3235)))

(declare-fun b!522256 () Bool)

(declare-fun Unit!16282 () Unit!16280)

(assert (=> b!522256 (= e!304620 Unit!16282)))

(declare-fun b!522257 () Bool)

(declare-fun res!319936 () Bool)

(assert (=> b!522257 (=> (not res!319936) (not e!304625))))

(declare-fun arrayContainsKey!0 (array!33268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522257 (= res!319936 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522258 () Bool)

(assert (=> b!522258 (= e!304621 (= (seekEntryOrOpen!0 (select (arr!15990 a!3235) j!176) a!3235 mask!3524) (Found!4457 j!176)))))

(declare-fun b!522259 () Bool)

(declare-fun res!319935 () Bool)

(assert (=> b!522259 (=> (not res!319935) (not e!304625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522259 (= res!319935 (validKeyInArray!0 k!2280))))

(declare-fun b!522260 () Bool)

(declare-fun Unit!16283 () Unit!16280)

(assert (=> b!522260 (= e!304620 Unit!16283)))

(declare-fun lt!239485 () Unit!16280)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33268 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16280)

(assert (=> b!522260 (= lt!239485 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239487 #b00000000000000000000000000000000 (index!20033 lt!239480) (x!49011 lt!239480) mask!3524))))

(declare-fun res!319939 () Bool)

(assert (=> b!522260 (= res!319939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239487 lt!239486 lt!239481 mask!3524) (Intermediate!4457 false (index!20033 lt!239480) (x!49011 lt!239480))))))

(assert (=> b!522260 (=> (not res!319939) (not e!304626))))

(assert (=> b!522260 e!304626))

(declare-fun b!522261 () Bool)

(declare-fun res!319937 () Bool)

(assert (=> b!522261 (=> (not res!319937) (not e!304625))))

(assert (=> b!522261 (= res!319937 (and (= (size!16354 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16354 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16354 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522262 () Bool)

(declare-fun res!319933 () Bool)

(assert (=> b!522262 (=> res!319933 e!304623)))

(assert (=> b!522262 (= res!319933 (or (undefined!5269 lt!239480) (not (is-Intermediate!4457 lt!239480))))))

(declare-fun b!522263 () Bool)

(declare-fun res!319942 () Bool)

(assert (=> b!522263 (=> (not res!319942) (not e!304625))))

(assert (=> b!522263 (= res!319942 (validKeyInArray!0 (select (arr!15990 a!3235) j!176)))))

(assert (= (and start!47442 res!319932) b!522261))

(assert (= (and b!522261 res!319937) b!522263))

(assert (= (and b!522263 res!319942) b!522259))

(assert (= (and b!522259 res!319935) b!522257))

(assert (= (and b!522257 res!319936) b!522250))

(assert (= (and b!522250 res!319934) b!522252))

(assert (= (and b!522252 res!319940) b!522253))

(assert (= (and b!522253 res!319941) b!522251))

(assert (= (and b!522251 res!319943) b!522258))

(assert (= (and b!522251 (not res!319938)) b!522262))

(assert (= (and b!522262 (not res!319933)) b!522254))

(assert (= (and b!522254 c!61460) b!522260))

(assert (= (and b!522254 (not c!61460)) b!522256))

(assert (= (and b!522260 res!319939) b!522255))

(declare-fun m!503163 () Bool)

(assert (=> b!522251 m!503163))

(declare-fun m!503165 () Bool)

(assert (=> b!522251 m!503165))

(declare-fun m!503167 () Bool)

(assert (=> b!522251 m!503167))

(declare-fun m!503169 () Bool)

(assert (=> b!522251 m!503169))

(declare-fun m!503171 () Bool)

(assert (=> b!522251 m!503171))

(declare-fun m!503173 () Bool)

(assert (=> b!522251 m!503173))

(declare-fun m!503175 () Bool)

(assert (=> b!522251 m!503175))

(assert (=> b!522251 m!503171))

(declare-fun m!503177 () Bool)

(assert (=> b!522251 m!503177))

(assert (=> b!522251 m!503171))

(declare-fun m!503179 () Bool)

(assert (=> b!522251 m!503179))

(declare-fun m!503181 () Bool)

(assert (=> b!522260 m!503181))

(declare-fun m!503183 () Bool)

(assert (=> b!522260 m!503183))

(declare-fun m!503185 () Bool)

(assert (=> start!47442 m!503185))

(declare-fun m!503187 () Bool)

(assert (=> start!47442 m!503187))

(declare-fun m!503189 () Bool)

(assert (=> b!522250 m!503189))

(declare-fun m!503191 () Bool)

(assert (=> b!522254 m!503191))

(assert (=> b!522254 m!503171))

(declare-fun m!503193 () Bool)

(assert (=> b!522257 m!503193))

(assert (=> b!522258 m!503171))

(assert (=> b!522258 m!503171))

(declare-fun m!503195 () Bool)

(assert (=> b!522258 m!503195))

(assert (=> b!522263 m!503171))

(assert (=> b!522263 m!503171))

(declare-fun m!503197 () Bool)

(assert (=> b!522263 m!503197))

(declare-fun m!503199 () Bool)

(assert (=> b!522253 m!503199))

(declare-fun m!503201 () Bool)

(assert (=> b!522252 m!503201))

(declare-fun m!503203 () Bool)

(assert (=> b!522259 m!503203))

(push 1)

