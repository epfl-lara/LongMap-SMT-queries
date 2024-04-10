; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45494 () Bool)

(assert start!45494)

(declare-fun b!501073 () Bool)

(declare-fun e!293541 () Bool)

(assert (=> b!501073 (= e!293541 false)))

(declare-fun b!501074 () Bool)

(declare-datatypes ((Unit!15108 0))(
  ( (Unit!15109) )
))
(declare-fun e!293543 () Unit!15108)

(declare-fun Unit!15110 () Unit!15108)

(assert (=> b!501074 (= e!293543 Unit!15110)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32319 0))(
  ( (array!32320 (arr!15541 (Array (_ BitVec 32) (_ BitVec 64))) (size!15905 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32319)

(declare-fun lt!227544 () (_ BitVec 32))

(declare-fun lt!227541 () Unit!15108)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4008 0))(
  ( (MissingZero!4008 (index!18214 (_ BitVec 32))) (Found!4008 (index!18215 (_ BitVec 32))) (Intermediate!4008 (undefined!4820 Bool) (index!18216 (_ BitVec 32)) (x!47245 (_ BitVec 32))) (Undefined!4008) (MissingVacant!4008 (index!18217 (_ BitVec 32))) )
))
(declare-fun lt!227548 () SeekEntryResult!4008)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15108)

(assert (=> b!501074 (= lt!227541 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227544 #b00000000000000000000000000000000 (index!18216 lt!227548) (x!47245 lt!227548) mask!3524))))

(declare-fun res!302820 () Bool)

(declare-fun lt!227547 () (_ BitVec 64))

(declare-fun lt!227545 () array!32319)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32319 (_ BitVec 32)) SeekEntryResult!4008)

(assert (=> b!501074 (= res!302820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227544 lt!227547 lt!227545 mask!3524) (Intermediate!4008 false (index!18216 lt!227548) (x!47245 lt!227548))))))

(assert (=> b!501074 (=> (not res!302820) (not e!293541))))

(assert (=> b!501074 e!293541))

(declare-fun b!501075 () Bool)

(declare-fun e!293542 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32319 (_ BitVec 32)) SeekEntryResult!4008)

(assert (=> b!501075 (= e!293542 (= (seekEntryOrOpen!0 (select (arr!15541 a!3235) j!176) a!3235 mask!3524) (Found!4008 j!176)))))

(declare-fun b!501076 () Bool)

(declare-fun res!302826 () Bool)

(declare-fun e!293540 () Bool)

(assert (=> b!501076 (=> res!302826 e!293540)))

(get-info :version)

(assert (=> b!501076 (= res!302826 (or (undefined!4820 lt!227548) (not ((_ is Intermediate!4008) lt!227548))))))

(declare-fun b!501077 () Bool)

(declare-fun e!293539 () Bool)

(assert (=> b!501077 (= e!293539 (not e!293540))))

(declare-fun res!302822 () Bool)

(assert (=> b!501077 (=> res!302822 e!293540)))

(declare-fun lt!227543 () (_ BitVec 32))

(assert (=> b!501077 (= res!302822 (= lt!227548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227543 lt!227547 lt!227545 mask!3524)))))

(assert (=> b!501077 (= lt!227548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227544 (select (arr!15541 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501077 (= lt!227543 (toIndex!0 lt!227547 mask!3524))))

(assert (=> b!501077 (= lt!227547 (select (store (arr!15541 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501077 (= lt!227544 (toIndex!0 (select (arr!15541 a!3235) j!176) mask!3524))))

(assert (=> b!501077 (= lt!227545 (array!32320 (store (arr!15541 a!3235) i!1204 k0!2280) (size!15905 a!3235)))))

(assert (=> b!501077 e!293542))

(declare-fun res!302819 () Bool)

(assert (=> b!501077 (=> (not res!302819) (not e!293542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32319 (_ BitVec 32)) Bool)

(assert (=> b!501077 (= res!302819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227546 () Unit!15108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15108)

(assert (=> b!501077 (= lt!227546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!302828 () Bool)

(declare-fun e!293544 () Bool)

(assert (=> start!45494 (=> (not res!302828) (not e!293544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45494 (= res!302828 (validMask!0 mask!3524))))

(assert (=> start!45494 e!293544))

(assert (=> start!45494 true))

(declare-fun array_inv!11337 (array!32319) Bool)

(assert (=> start!45494 (array_inv!11337 a!3235)))

(declare-fun b!501078 () Bool)

(declare-fun res!302821 () Bool)

(assert (=> b!501078 (=> (not res!302821) (not e!293544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501078 (= res!302821 (validKeyInArray!0 (select (arr!15541 a!3235) j!176)))))

(declare-fun b!501079 () Bool)

(declare-fun res!302818 () Bool)

(assert (=> b!501079 (=> (not res!302818) (not e!293544))))

(assert (=> b!501079 (= res!302818 (validKeyInArray!0 k0!2280))))

(declare-fun b!501080 () Bool)

(assert (=> b!501080 (= e!293544 e!293539)))

(declare-fun res!302823 () Bool)

(assert (=> b!501080 (=> (not res!302823) (not e!293539))))

(declare-fun lt!227539 () SeekEntryResult!4008)

(assert (=> b!501080 (= res!302823 (or (= lt!227539 (MissingZero!4008 i!1204)) (= lt!227539 (MissingVacant!4008 i!1204))))))

(assert (=> b!501080 (= lt!227539 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501081 () Bool)

(declare-fun res!302825 () Bool)

(assert (=> b!501081 (=> (not res!302825) (not e!293539))))

(assert (=> b!501081 (= res!302825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501082 () Bool)

(declare-fun res!302827 () Bool)

(assert (=> b!501082 (=> (not res!302827) (not e!293539))))

(declare-datatypes ((List!9699 0))(
  ( (Nil!9696) (Cons!9695 (h!10569 (_ BitVec 64)) (t!15927 List!9699)) )
))
(declare-fun arrayNoDuplicates!0 (array!32319 (_ BitVec 32) List!9699) Bool)

(assert (=> b!501082 (= res!302827 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9696))))

(declare-fun b!501083 () Bool)

(declare-fun Unit!15111 () Unit!15108)

(assert (=> b!501083 (= e!293543 Unit!15111)))

(declare-fun b!501084 () Bool)

(assert (=> b!501084 (= e!293540 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!501084 (= (index!18216 lt!227548) i!1204)))

(declare-fun lt!227542 () Unit!15108)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15108)

(assert (=> b!501084 (= lt!227542 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227544 #b00000000000000000000000000000000 (index!18216 lt!227548) (x!47245 lt!227548) mask!3524))))

(assert (=> b!501084 (and (or (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227540 () Unit!15108)

(assert (=> b!501084 (= lt!227540 e!293543)))

(declare-fun c!59405 () Bool)

(assert (=> b!501084 (= c!59405 (= (select (arr!15541 a!3235) (index!18216 lt!227548)) (select (arr!15541 a!3235) j!176)))))

(assert (=> b!501084 (and (bvslt (x!47245 lt!227548) #b01111111111111111111111111111110) (or (= (select (arr!15541 a!3235) (index!18216 lt!227548)) (select (arr!15541 a!3235) j!176)) (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15541 a!3235) (index!18216 lt!227548)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501085 () Bool)

(declare-fun res!302817 () Bool)

(assert (=> b!501085 (=> (not res!302817) (not e!293544))))

(assert (=> b!501085 (= res!302817 (and (= (size!15905 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15905 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15905 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501086 () Bool)

(declare-fun res!302824 () Bool)

(assert (=> b!501086 (=> (not res!302824) (not e!293544))))

(declare-fun arrayContainsKey!0 (array!32319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501086 (= res!302824 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45494 res!302828) b!501085))

(assert (= (and b!501085 res!302817) b!501078))

(assert (= (and b!501078 res!302821) b!501079))

(assert (= (and b!501079 res!302818) b!501086))

(assert (= (and b!501086 res!302824) b!501080))

(assert (= (and b!501080 res!302823) b!501081))

(assert (= (and b!501081 res!302825) b!501082))

(assert (= (and b!501082 res!302827) b!501077))

(assert (= (and b!501077 res!302819) b!501075))

(assert (= (and b!501077 (not res!302822)) b!501076))

(assert (= (and b!501076 (not res!302826)) b!501084))

(assert (= (and b!501084 c!59405) b!501074))

(assert (= (and b!501084 (not c!59405)) b!501083))

(assert (= (and b!501074 res!302820) b!501073))

(declare-fun m!482171 () Bool)

(assert (=> b!501080 m!482171))

(declare-fun m!482173 () Bool)

(assert (=> b!501084 m!482173))

(declare-fun m!482175 () Bool)

(assert (=> b!501084 m!482175))

(declare-fun m!482177 () Bool)

(assert (=> b!501084 m!482177))

(declare-fun m!482179 () Bool)

(assert (=> b!501077 m!482179))

(declare-fun m!482181 () Bool)

(assert (=> b!501077 m!482181))

(declare-fun m!482183 () Bool)

(assert (=> b!501077 m!482183))

(assert (=> b!501077 m!482177))

(declare-fun m!482185 () Bool)

(assert (=> b!501077 m!482185))

(declare-fun m!482187 () Bool)

(assert (=> b!501077 m!482187))

(assert (=> b!501077 m!482177))

(declare-fun m!482189 () Bool)

(assert (=> b!501077 m!482189))

(assert (=> b!501077 m!482177))

(declare-fun m!482191 () Bool)

(assert (=> b!501077 m!482191))

(declare-fun m!482193 () Bool)

(assert (=> b!501077 m!482193))

(declare-fun m!482195 () Bool)

(assert (=> b!501081 m!482195))

(declare-fun m!482197 () Bool)

(assert (=> start!45494 m!482197))

(declare-fun m!482199 () Bool)

(assert (=> start!45494 m!482199))

(declare-fun m!482201 () Bool)

(assert (=> b!501082 m!482201))

(declare-fun m!482203 () Bool)

(assert (=> b!501079 m!482203))

(assert (=> b!501078 m!482177))

(assert (=> b!501078 m!482177))

(declare-fun m!482205 () Bool)

(assert (=> b!501078 m!482205))

(assert (=> b!501075 m!482177))

(assert (=> b!501075 m!482177))

(declare-fun m!482207 () Bool)

(assert (=> b!501075 m!482207))

(declare-fun m!482209 () Bool)

(assert (=> b!501086 m!482209))

(declare-fun m!482211 () Bool)

(assert (=> b!501074 m!482211))

(declare-fun m!482213 () Bool)

(assert (=> b!501074 m!482213))

(check-sat (not b!501074) (not start!45494) (not b!501080) (not b!501081) (not b!501075) (not b!501077) (not b!501082) (not b!501079) (not b!501078) (not b!501084) (not b!501086))
(check-sat)
