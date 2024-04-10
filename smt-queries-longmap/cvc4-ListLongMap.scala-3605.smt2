; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49624 () Bool)

(assert start!49624)

(declare-fun b!546122 () Bool)

(declare-fun res!340050 () Bool)

(declare-fun e!315645 () Bool)

(assert (=> b!546122 (=> (not res!340050) (not e!315645))))

(declare-datatypes ((array!34437 0))(
  ( (array!34438 (arr!16547 (Array (_ BitVec 32) (_ BitVec 64))) (size!16911 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34437)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546122 (= res!340050 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546123 () Bool)

(declare-fun res!340056 () Bool)

(assert (=> b!546123 (=> (not res!340056) (not e!315645))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546123 (= res!340056 (validKeyInArray!0 (select (arr!16547 a!3154) j!147)))))

(declare-fun b!546124 () Bool)

(declare-fun res!340057 () Bool)

(assert (=> b!546124 (=> (not res!340057) (not e!315645))))

(assert (=> b!546124 (= res!340057 (validKeyInArray!0 k!1998))))

(declare-fun b!546125 () Bool)

(declare-fun e!315644 () Bool)

(declare-fun e!315640 () Bool)

(assert (=> b!546125 (= e!315644 e!315640)))

(declare-fun res!340055 () Bool)

(assert (=> b!546125 (=> (not res!340055) (not e!315640))))

(declare-fun lt!249197 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!546125 (= res!340055 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249197 #b00000000000000000000000000000000) (bvslt lt!249197 (size!16911 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546125 (= lt!249197 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!546127 () Bool)

(declare-fun e!315639 () Bool)

(assert (=> b!546127 (= e!315645 e!315639)))

(declare-fun res!340059 () Bool)

(assert (=> b!546127 (=> (not res!340059) (not e!315639))))

(declare-datatypes ((SeekEntryResult!5005 0))(
  ( (MissingZero!5005 (index!22244 (_ BitVec 32))) (Found!5005 (index!22245 (_ BitVec 32))) (Intermediate!5005 (undefined!5817 Bool) (index!22246 (_ BitVec 32)) (x!51165 (_ BitVec 32))) (Undefined!5005) (MissingVacant!5005 (index!22247 (_ BitVec 32))) )
))
(declare-fun lt!249202 () SeekEntryResult!5005)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546127 (= res!340059 (or (= lt!249202 (MissingZero!5005 i!1153)) (= lt!249202 (MissingVacant!5005 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34437 (_ BitVec 32)) SeekEntryResult!5005)

(assert (=> b!546127 (= lt!249202 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!546128 () Bool)

(declare-fun e!315641 () Bool)

(assert (=> b!546128 (= e!315640 e!315641)))

(declare-fun res!340054 () Bool)

(assert (=> b!546128 (=> (not res!340054) (not e!315641))))

(declare-fun lt!249199 () SeekEntryResult!5005)

(declare-fun lt!249205 () SeekEntryResult!5005)

(declare-fun lt!249203 () SeekEntryResult!5005)

(assert (=> b!546128 (= res!340054 (and (= lt!249203 lt!249205) (= lt!249199 lt!249203)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34437 (_ BitVec 32)) SeekEntryResult!5005)

(assert (=> b!546128 (= lt!249203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249197 (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546129 () Bool)

(declare-fun lt!249201 () (_ BitVec 64))

(declare-fun lt!249204 () array!34437)

(assert (=> b!546129 (= e!315641 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249201 lt!249204 mask!3216) lt!249205)))))

(assert (=> b!546129 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249197 lt!249201 lt!249204 mask!3216) lt!249205)))

(assert (=> b!546129 (= lt!249201 (select (store (arr!16547 a!3154) i!1153 k!1998) j!147))))

(assert (=> b!546129 (= lt!249204 (array!34438 (store (arr!16547 a!3154) i!1153 k!1998) (size!16911 a!3154)))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16944 0))(
  ( (Unit!16945) )
))
(declare-fun lt!249198 () Unit!16944)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16944)

(assert (=> b!546129 (= lt!249198 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249197 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!546130 () Bool)

(declare-fun res!340060 () Bool)

(assert (=> b!546130 (=> (not res!340060) (not e!315639))))

(declare-datatypes ((List!10666 0))(
  ( (Nil!10663) (Cons!10662 (h!11626 (_ BitVec 64)) (t!16894 List!10666)) )
))
(declare-fun arrayNoDuplicates!0 (array!34437 (_ BitVec 32) List!10666) Bool)

(assert (=> b!546130 (= res!340060 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10663))))

(declare-fun b!546131 () Bool)

(declare-fun e!315642 () Bool)

(assert (=> b!546131 (= e!315642 e!315644)))

(declare-fun res!340049 () Bool)

(assert (=> b!546131 (=> (not res!340049) (not e!315644))))

(declare-fun lt!249200 () SeekEntryResult!5005)

(assert (=> b!546131 (= res!340049 (and (= lt!249199 lt!249200) (not (= (select (arr!16547 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16547 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16547 a!3154) index!1177) (select (arr!16547 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546131 (= lt!249199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546132 () Bool)

(declare-fun res!340061 () Bool)

(assert (=> b!546132 (=> (not res!340061) (not e!315639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34437 (_ BitVec 32)) Bool)

(assert (=> b!546132 (= res!340061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!546126 () Bool)

(assert (=> b!546126 (= e!315639 e!315642)))

(declare-fun res!340058 () Bool)

(assert (=> b!546126 (=> (not res!340058) (not e!315642))))

(assert (=> b!546126 (= res!340058 (= lt!249200 lt!249205))))

(assert (=> b!546126 (= lt!249205 (Intermediate!5005 false resIndex!32 resX!32))))

(assert (=> b!546126 (= lt!249200 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!340051 () Bool)

(assert (=> start!49624 (=> (not res!340051) (not e!315645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49624 (= res!340051 (validMask!0 mask!3216))))

(assert (=> start!49624 e!315645))

(assert (=> start!49624 true))

(declare-fun array_inv!12343 (array!34437) Bool)

(assert (=> start!49624 (array_inv!12343 a!3154)))

(declare-fun b!546133 () Bool)

(declare-fun res!340053 () Bool)

(assert (=> b!546133 (=> (not res!340053) (not e!315645))))

(assert (=> b!546133 (= res!340053 (and (= (size!16911 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16911 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16911 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546134 () Bool)

(declare-fun res!340052 () Bool)

(assert (=> b!546134 (=> (not res!340052) (not e!315639))))

(assert (=> b!546134 (= res!340052 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16911 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16911 a!3154)) (= (select (arr!16547 a!3154) resIndex!32) (select (arr!16547 a!3154) j!147))))))

(assert (= (and start!49624 res!340051) b!546133))

(assert (= (and b!546133 res!340053) b!546123))

(assert (= (and b!546123 res!340056) b!546124))

(assert (= (and b!546124 res!340057) b!546122))

(assert (= (and b!546122 res!340050) b!546127))

(assert (= (and b!546127 res!340059) b!546132))

(assert (= (and b!546132 res!340061) b!546130))

(assert (= (and b!546130 res!340060) b!546134))

(assert (= (and b!546134 res!340052) b!546126))

(assert (= (and b!546126 res!340058) b!546131))

(assert (= (and b!546131 res!340049) b!546125))

(assert (= (and b!546125 res!340055) b!546128))

(assert (= (and b!546128 res!340054) b!546129))

(declare-fun m!523677 () Bool)

(assert (=> b!546124 m!523677))

(declare-fun m!523679 () Bool)

(assert (=> b!546132 m!523679))

(declare-fun m!523681 () Bool)

(assert (=> b!546129 m!523681))

(declare-fun m!523683 () Bool)

(assert (=> b!546129 m!523683))

(declare-fun m!523685 () Bool)

(assert (=> b!546129 m!523685))

(declare-fun m!523687 () Bool)

(assert (=> b!546129 m!523687))

(declare-fun m!523689 () Bool)

(assert (=> b!546129 m!523689))

(declare-fun m!523691 () Bool)

(assert (=> b!546128 m!523691))

(assert (=> b!546128 m!523691))

(declare-fun m!523693 () Bool)

(assert (=> b!546128 m!523693))

(declare-fun m!523695 () Bool)

(assert (=> b!546122 m!523695))

(declare-fun m!523697 () Bool)

(assert (=> start!49624 m!523697))

(declare-fun m!523699 () Bool)

(assert (=> start!49624 m!523699))

(declare-fun m!523701 () Bool)

(assert (=> b!546131 m!523701))

(assert (=> b!546131 m!523691))

(assert (=> b!546131 m!523691))

(declare-fun m!523703 () Bool)

(assert (=> b!546131 m!523703))

(assert (=> b!546131 m!523703))

(assert (=> b!546131 m!523691))

(declare-fun m!523705 () Bool)

(assert (=> b!546131 m!523705))

(assert (=> b!546123 m!523691))

(assert (=> b!546123 m!523691))

(declare-fun m!523707 () Bool)

(assert (=> b!546123 m!523707))

(assert (=> b!546126 m!523691))

(assert (=> b!546126 m!523691))

(declare-fun m!523709 () Bool)

(assert (=> b!546126 m!523709))

(declare-fun m!523711 () Bool)

(assert (=> b!546125 m!523711))

(declare-fun m!523713 () Bool)

(assert (=> b!546134 m!523713))

(assert (=> b!546134 m!523691))

(declare-fun m!523715 () Bool)

(assert (=> b!546130 m!523715))

(declare-fun m!523717 () Bool)

(assert (=> b!546127 m!523717))

(push 1)

(assert (not b!546126))

(assert (not b!546124))

(assert (not b!546128))

(assert (not b!546131))

(assert (not b!546127))

(assert (not b!546122))

(assert (not b!546123))

(assert (not start!49624))

(assert (not b!546132))

(assert (not b!546125))

(assert (not b!546129))

(assert (not b!546130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!546239 () Bool)

(declare-fun e!315708 () SeekEntryResult!5005)

(assert (=> b!546239 (= e!315708 (Intermediate!5005 true lt!249197 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546240 () Bool)

(declare-fun e!315709 () SeekEntryResult!5005)

(assert (=> b!546240 (= e!315709 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249197 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546241 () Bool)

(declare-fun lt!249246 () SeekEntryResult!5005)

(assert (=> b!546241 (and (bvsge (index!22246 lt!249246) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249246) (size!16911 a!3154)))))

(declare-fun e!315711 () Bool)

(assert (=> b!546241 (= e!315711 (= (select (arr!16547 a!3154) (index!22246 lt!249246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546242 () Bool)

(assert (=> b!546242 (and (bvsge (index!22246 lt!249246) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249246) (size!16911 a!3154)))))

(declare-fun res!340101 () Bool)

(assert (=> b!546242 (= res!340101 (= (select (arr!16547 a!3154) (index!22246 lt!249246)) (select (arr!16547 a!3154) j!147)))))

(assert (=> b!546242 (=> res!340101 e!315711)))

(declare-fun e!315710 () Bool)

(assert (=> b!546242 (= e!315710 e!315711)))

(declare-fun b!546243 () Bool)

(assert (=> b!546243 (= e!315709 (Intermediate!5005 false lt!249197 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546244 () Bool)

(assert (=> b!546244 (and (bvsge (index!22246 lt!249246) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249246) (size!16911 a!3154)))))

(declare-fun res!340103 () Bool)

(assert (=> b!546244 (= res!340103 (= (select (arr!16547 a!3154) (index!22246 lt!249246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546244 (=> res!340103 e!315711)))

(declare-fun b!546245 () Bool)

(declare-fun e!315707 () Bool)

(assert (=> b!546245 (= e!315707 (bvsge (x!51165 lt!249246) #b01111111111111111111111111111110))))

(declare-fun d!82271 () Bool)

(assert (=> d!82271 e!315707))

(declare-fun c!63397 () Bool)

(assert (=> d!82271 (= c!63397 (and (is-Intermediate!5005 lt!249246) (undefined!5817 lt!249246)))))

(assert (=> d!82271 (= lt!249246 e!315708)))

(declare-fun c!63396 () Bool)

(assert (=> d!82271 (= c!63396 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249247 () (_ BitVec 64))

(assert (=> d!82271 (= lt!249247 (select (arr!16547 a!3154) lt!249197))))

(assert (=> d!82271 (validMask!0 mask!3216)))

(assert (=> d!82271 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249197 (select (arr!16547 a!3154) j!147) a!3154 mask!3216) lt!249246)))

(declare-fun b!546246 () Bool)

(assert (=> b!546246 (= e!315708 e!315709)))

(declare-fun c!63398 () Bool)

(assert (=> b!546246 (= c!63398 (or (= lt!249247 (select (arr!16547 a!3154) j!147)) (= (bvadd lt!249247 lt!249247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546247 () Bool)

(assert (=> b!546247 (= e!315707 e!315710)))

(declare-fun res!340102 () Bool)

(assert (=> b!546247 (= res!340102 (and (is-Intermediate!5005 lt!249246) (not (undefined!5817 lt!249246)) (bvslt (x!51165 lt!249246) #b01111111111111111111111111111110) (bvsge (x!51165 lt!249246) #b00000000000000000000000000000000) (bvsge (x!51165 lt!249246) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546247 (=> (not res!340102) (not e!315710))))

(assert (= (and d!82271 c!63396) b!546239))

(assert (= (and d!82271 (not c!63396)) b!546246))

(assert (= (and b!546246 c!63398) b!546243))

(assert (= (and b!546246 (not c!63398)) b!546240))

(assert (= (and d!82271 c!63397) b!546245))

(assert (= (and d!82271 (not c!63397)) b!546247))

(assert (= (and b!546247 res!340102) b!546242))

(assert (= (and b!546242 (not res!340101)) b!546244))

(assert (= (and b!546244 (not res!340103)) b!546241))

(declare-fun m!523761 () Bool)

(assert (=> b!546244 m!523761))

(assert (=> b!546242 m!523761))

(declare-fun m!523763 () Bool)

(assert (=> d!82271 m!523763))

(assert (=> d!82271 m!523697))

(assert (=> b!546241 m!523761))

(declare-fun m!523765 () Bool)

(assert (=> b!546240 m!523765))

(assert (=> b!546240 m!523765))

(assert (=> b!546240 m!523691))

(declare-fun m!523767 () Bool)

(assert (=> b!546240 m!523767))

(assert (=> b!546128 d!82271))

(declare-fun b!546291 () Bool)

(declare-fun e!315736 () SeekEntryResult!5005)

(declare-fun e!315735 () SeekEntryResult!5005)

(assert (=> b!546291 (= e!315736 e!315735)))

(declare-fun lt!249273 () (_ BitVec 64))

(declare-fun lt!249272 () SeekEntryResult!5005)

(assert (=> b!546291 (= lt!249273 (select (arr!16547 a!3154) (index!22246 lt!249272)))))

(declare-fun c!63417 () Bool)

(assert (=> b!546291 (= c!63417 (= lt!249273 k!1998))))

(declare-fun b!546292 () Bool)

(assert (=> b!546292 (= e!315736 Undefined!5005)))

(declare-fun d!82287 () Bool)

(declare-fun lt!249271 () SeekEntryResult!5005)

(assert (=> d!82287 (and (or (is-Undefined!5005 lt!249271) (not (is-Found!5005 lt!249271)) (and (bvsge (index!22245 lt!249271) #b00000000000000000000000000000000) (bvslt (index!22245 lt!249271) (size!16911 a!3154)))) (or (is-Undefined!5005 lt!249271) (is-Found!5005 lt!249271) (not (is-MissingZero!5005 lt!249271)) (and (bvsge (index!22244 lt!249271) #b00000000000000000000000000000000) (bvslt (index!22244 lt!249271) (size!16911 a!3154)))) (or (is-Undefined!5005 lt!249271) (is-Found!5005 lt!249271) (is-MissingZero!5005 lt!249271) (not (is-MissingVacant!5005 lt!249271)) (and (bvsge (index!22247 lt!249271) #b00000000000000000000000000000000) (bvslt (index!22247 lt!249271) (size!16911 a!3154)))) (or (is-Undefined!5005 lt!249271) (ite (is-Found!5005 lt!249271) (= (select (arr!16547 a!3154) (index!22245 lt!249271)) k!1998) (ite (is-MissingZero!5005 lt!249271) (= (select (arr!16547 a!3154) (index!22244 lt!249271)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5005 lt!249271) (= (select (arr!16547 a!3154) (index!22247 lt!249271)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82287 (= lt!249271 e!315736)))

(declare-fun c!63418 () Bool)

(assert (=> d!82287 (= c!63418 (and (is-Intermediate!5005 lt!249272) (undefined!5817 lt!249272)))))

(assert (=> d!82287 (= lt!249272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82287 (validMask!0 mask!3216)))

(assert (=> d!82287 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!249271)))

(declare-fun b!546293 () Bool)

(assert (=> b!546293 (= e!315735 (Found!5005 (index!22246 lt!249272)))))

(declare-fun b!546294 () Bool)

(declare-fun c!63419 () Bool)

(assert (=> b!546294 (= c!63419 (= lt!249273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315737 () SeekEntryResult!5005)

(assert (=> b!546294 (= e!315735 e!315737)))

(declare-fun b!546295 () Bool)

(assert (=> b!546295 (= e!315737 (MissingZero!5005 (index!22246 lt!249272)))))

(declare-fun b!546296 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34437 (_ BitVec 32)) SeekEntryResult!5005)

(assert (=> b!546296 (= e!315737 (seekKeyOrZeroReturnVacant!0 (x!51165 lt!249272) (index!22246 lt!249272) (index!22246 lt!249272) k!1998 a!3154 mask!3216))))

(assert (= (and d!82287 c!63418) b!546292))

(assert (= (and d!82287 (not c!63418)) b!546291))

(assert (= (and b!546291 c!63417) b!546293))

(assert (= (and b!546291 (not c!63417)) b!546294))

(assert (= (and b!546294 c!63419) b!546295))

(assert (= (and b!546294 (not c!63419)) b!546296))

(declare-fun m!523789 () Bool)

(assert (=> b!546291 m!523789))

(assert (=> d!82287 m!523697))

(declare-fun m!523791 () Bool)

(assert (=> d!82287 m!523791))

(declare-fun m!523793 () Bool)

(assert (=> d!82287 m!523793))

(declare-fun m!523795 () Bool)

(assert (=> d!82287 m!523795))

(declare-fun m!523797 () Bool)

(assert (=> d!82287 m!523797))

(declare-fun m!523799 () Bool)

(assert (=> d!82287 m!523799))

(assert (=> d!82287 m!523793))

(declare-fun m!523801 () Bool)

(assert (=> b!546296 m!523801))

(assert (=> b!546127 d!82287))

(declare-fun b!546303 () Bool)

(declare-fun e!315742 () SeekEntryResult!5005)

(assert (=> b!546303 (= e!315742 (Intermediate!5005 true (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun e!315743 () SeekEntryResult!5005)

(declare-fun b!546304 () Bool)

(assert (=> b!546304 (= e!315743 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546305 () Bool)

(declare-fun lt!249277 () SeekEntryResult!5005)

(assert (=> b!546305 (and (bvsge (index!22246 lt!249277) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249277) (size!16911 a!3154)))))

(declare-fun e!315745 () Bool)

(assert (=> b!546305 (= e!315745 (= (select (arr!16547 a!3154) (index!22246 lt!249277)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546306 () Bool)

(assert (=> b!546306 (and (bvsge (index!22246 lt!249277) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249277) (size!16911 a!3154)))))

(declare-fun res!340112 () Bool)

(assert (=> b!546306 (= res!340112 (= (select (arr!16547 a!3154) (index!22246 lt!249277)) (select (arr!16547 a!3154) j!147)))))

(assert (=> b!546306 (=> res!340112 e!315745)))

(declare-fun e!315744 () Bool)

(assert (=> b!546306 (= e!315744 e!315745)))

(declare-fun b!546307 () Bool)

(assert (=> b!546307 (= e!315743 (Intermediate!5005 false (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546308 () Bool)

(assert (=> b!546308 (and (bvsge (index!22246 lt!249277) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249277) (size!16911 a!3154)))))

(declare-fun res!340114 () Bool)

(assert (=> b!546308 (= res!340114 (= (select (arr!16547 a!3154) (index!22246 lt!249277)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546308 (=> res!340114 e!315745)))

(declare-fun b!546309 () Bool)

(declare-fun e!315741 () Bool)

(assert (=> b!546309 (= e!315741 (bvsge (x!51165 lt!249277) #b01111111111111111111111111111110))))

(declare-fun d!82299 () Bool)

(assert (=> d!82299 e!315741))

(declare-fun c!63424 () Bool)

(assert (=> d!82299 (= c!63424 (and (is-Intermediate!5005 lt!249277) (undefined!5817 lt!249277)))))

(assert (=> d!82299 (= lt!249277 e!315742)))

(declare-fun c!63423 () Bool)

(assert (=> d!82299 (= c!63423 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!249278 () (_ BitVec 64))

(assert (=> d!82299 (= lt!249278 (select (arr!16547 a!3154) (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216)))))

(assert (=> d!82299 (validMask!0 mask!3216)))

(assert (=> d!82299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) (select (arr!16547 a!3154) j!147) a!3154 mask!3216) lt!249277)))

(declare-fun b!546310 () Bool)

(assert (=> b!546310 (= e!315742 e!315743)))

(declare-fun c!63425 () Bool)

(assert (=> b!546310 (= c!63425 (or (= lt!249278 (select (arr!16547 a!3154) j!147)) (= (bvadd lt!249278 lt!249278) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546311 () Bool)

(assert (=> b!546311 (= e!315741 e!315744)))

(declare-fun res!340113 () Bool)

(assert (=> b!546311 (= res!340113 (and (is-Intermediate!5005 lt!249277) (not (undefined!5817 lt!249277)) (bvslt (x!51165 lt!249277) #b01111111111111111111111111111110) (bvsge (x!51165 lt!249277) #b00000000000000000000000000000000) (bvsge (x!51165 lt!249277) #b00000000000000000000000000000000)))))

(assert (=> b!546311 (=> (not res!340113) (not e!315744))))

(assert (= (and d!82299 c!63423) b!546303))

(assert (= (and d!82299 (not c!63423)) b!546310))

(assert (= (and b!546310 c!63425) b!546307))

(assert (= (and b!546310 (not c!63425)) b!546304))

(assert (= (and d!82299 c!63424) b!546309))

(assert (= (and d!82299 (not c!63424)) b!546311))

(assert (= (and b!546311 res!340113) b!546306))

(assert (= (and b!546306 (not res!340112)) b!546308))

(assert (= (and b!546308 (not res!340114)) b!546305))

(declare-fun m!523817 () Bool)

(assert (=> b!546308 m!523817))

(assert (=> b!546306 m!523817))

(assert (=> d!82299 m!523703))

(declare-fun m!523819 () Bool)

(assert (=> d!82299 m!523819))

(assert (=> d!82299 m!523697))

(assert (=> b!546305 m!523817))

(assert (=> b!546304 m!523703))

(declare-fun m!523821 () Bool)

(assert (=> b!546304 m!523821))

(assert (=> b!546304 m!523821))

(assert (=> b!546304 m!523691))

(declare-fun m!523823 () Bool)

(assert (=> b!546304 m!523823))

(assert (=> b!546131 d!82299))

(declare-fun d!82303 () Bool)

(declare-fun lt!249290 () (_ BitVec 32))

(declare-fun lt!249289 () (_ BitVec 32))

(assert (=> d!82303 (= lt!249290 (bvmul (bvxor lt!249289 (bvlshr lt!249289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82303 (= lt!249289 ((_ extract 31 0) (bvand (bvxor (select (arr!16547 a!3154) j!147) (bvlshr (select (arr!16547 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82303 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!340115 (let ((h!11629 ((_ extract 31 0) (bvand (bvxor (select (arr!16547 a!3154) j!147) (bvlshr (select (arr!16547 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51173 (bvmul (bvxor h!11629 (bvlshr h!11629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51173 (bvlshr x!51173 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!340115 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!340115 #b00000000000000000000000000000000))))))

(assert (=> d!82303 (= (toIndex!0 (select (arr!16547 a!3154) j!147) mask!3216) (bvand (bvxor lt!249290 (bvlshr lt!249290 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!546131 d!82303))

(declare-fun b!546334 () Bool)

(declare-fun e!315761 () SeekEntryResult!5005)

(assert (=> b!546334 (= e!315761 (Intermediate!5005 true index!1177 x!1030))))

(declare-fun e!315762 () SeekEntryResult!5005)

(declare-fun b!546335 () Bool)

(assert (=> b!546335 (= e!315762 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) lt!249201 lt!249204 mask!3216))))

(declare-fun b!546336 () Bool)

(declare-fun lt!249291 () SeekEntryResult!5005)

(assert (=> b!546336 (and (bvsge (index!22246 lt!249291) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249291) (size!16911 lt!249204)))))

(declare-fun e!315764 () Bool)

(assert (=> b!546336 (= e!315764 (= (select (arr!16547 lt!249204) (index!22246 lt!249291)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546337 () Bool)

(assert (=> b!546337 (and (bvsge (index!22246 lt!249291) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249291) (size!16911 lt!249204)))))

(declare-fun res!340122 () Bool)

(assert (=> b!546337 (= res!340122 (= (select (arr!16547 lt!249204) (index!22246 lt!249291)) lt!249201))))

(assert (=> b!546337 (=> res!340122 e!315764)))

(declare-fun e!315763 () Bool)

(assert (=> b!546337 (= e!315763 e!315764)))

(declare-fun b!546338 () Bool)

(assert (=> b!546338 (= e!315762 (Intermediate!5005 false index!1177 x!1030))))

(declare-fun b!546339 () Bool)

(assert (=> b!546339 (and (bvsge (index!22246 lt!249291) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249291) (size!16911 lt!249204)))))

(declare-fun res!340124 () Bool)

(assert (=> b!546339 (= res!340124 (= (select (arr!16547 lt!249204) (index!22246 lt!249291)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546339 (=> res!340124 e!315764)))

(declare-fun b!546340 () Bool)

(declare-fun e!315760 () Bool)

(assert (=> b!546340 (= e!315760 (bvsge (x!51165 lt!249291) #b01111111111111111111111111111110))))

(declare-fun d!82305 () Bool)

(assert (=> d!82305 e!315760))

(declare-fun c!63435 () Bool)

(assert (=> d!82305 (= c!63435 (and (is-Intermediate!5005 lt!249291) (undefined!5817 lt!249291)))))

(assert (=> d!82305 (= lt!249291 e!315761)))

(declare-fun c!63434 () Bool)

(assert (=> d!82305 (= c!63434 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249292 () (_ BitVec 64))

(assert (=> d!82305 (= lt!249292 (select (arr!16547 lt!249204) index!1177))))

(assert (=> d!82305 (validMask!0 mask!3216)))

(assert (=> d!82305 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249201 lt!249204 mask!3216) lt!249291)))

(declare-fun b!546341 () Bool)

(assert (=> b!546341 (= e!315761 e!315762)))

(declare-fun c!63436 () Bool)

(assert (=> b!546341 (= c!63436 (or (= lt!249292 lt!249201) (= (bvadd lt!249292 lt!249292) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546342 () Bool)

(assert (=> b!546342 (= e!315760 e!315763)))

(declare-fun res!340123 () Bool)

(assert (=> b!546342 (= res!340123 (and (is-Intermediate!5005 lt!249291) (not (undefined!5817 lt!249291)) (bvslt (x!51165 lt!249291) #b01111111111111111111111111111110) (bvsge (x!51165 lt!249291) #b00000000000000000000000000000000) (bvsge (x!51165 lt!249291) x!1030)))))

(assert (=> b!546342 (=> (not res!340123) (not e!315763))))

(assert (= (and d!82305 c!63434) b!546334))

(assert (= (and d!82305 (not c!63434)) b!546341))

(assert (= (and b!546341 c!63436) b!546338))

(assert (= (and b!546341 (not c!63436)) b!546335))

(assert (= (and d!82305 c!63435) b!546340))

(assert (= (and d!82305 (not c!63435)) b!546342))

(assert (= (and b!546342 res!340123) b!546337))

(assert (= (and b!546337 (not res!340122)) b!546339))

(assert (= (and b!546339 (not res!340124)) b!546336))

(declare-fun m!523825 () Bool)

(assert (=> b!546339 m!523825))

(assert (=> b!546337 m!523825))

(declare-fun m!523827 () Bool)

(assert (=> d!82305 m!523827))

(assert (=> d!82305 m!523697))

(assert (=> b!546336 m!523825))

(assert (=> b!546335 m!523711))

(assert (=> b!546335 m!523711))

(declare-fun m!523829 () Bool)

(assert (=> b!546335 m!523829))

(assert (=> b!546129 d!82305))

(declare-fun b!546348 () Bool)

(declare-fun e!315770 () SeekEntryResult!5005)

(assert (=> b!546348 (= e!315770 (Intermediate!5005 true lt!249197 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546349 () Bool)

(declare-fun e!315771 () SeekEntryResult!5005)

(assert (=> b!546349 (= e!315771 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249197 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!249201 lt!249204 mask!3216))))

(declare-fun b!546350 () Bool)

(declare-fun lt!249293 () SeekEntryResult!5005)

(assert (=> b!546350 (and (bvsge (index!22246 lt!249293) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249293) (size!16911 lt!249204)))))

(declare-fun e!315773 () Bool)

(assert (=> b!546350 (= e!315773 (= (select (arr!16547 lt!249204) (index!22246 lt!249293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546351 () Bool)

(assert (=> b!546351 (and (bvsge (index!22246 lt!249293) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249293) (size!16911 lt!249204)))))

(declare-fun res!340128 () Bool)

(assert (=> b!546351 (= res!340128 (= (select (arr!16547 lt!249204) (index!22246 lt!249293)) lt!249201))))

(assert (=> b!546351 (=> res!340128 e!315773)))

(declare-fun e!315772 () Bool)

(assert (=> b!546351 (= e!315772 e!315773)))

(declare-fun b!546352 () Bool)

(assert (=> b!546352 (= e!315771 (Intermediate!5005 false lt!249197 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546353 () Bool)

(assert (=> b!546353 (and (bvsge (index!22246 lt!249293) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249293) (size!16911 lt!249204)))))

(declare-fun res!340130 () Bool)

(assert (=> b!546353 (= res!340130 (= (select (arr!16547 lt!249204) (index!22246 lt!249293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546353 (=> res!340130 e!315773)))

(declare-fun b!546354 () Bool)

(declare-fun e!315769 () Bool)

(assert (=> b!546354 (= e!315769 (bvsge (x!51165 lt!249293) #b01111111111111111111111111111110))))

(declare-fun d!82307 () Bool)

(assert (=> d!82307 e!315769))

(declare-fun c!63439 () Bool)

(assert (=> d!82307 (= c!63439 (and (is-Intermediate!5005 lt!249293) (undefined!5817 lt!249293)))))

(assert (=> d!82307 (= lt!249293 e!315770)))

(declare-fun c!63438 () Bool)

(assert (=> d!82307 (= c!63438 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249294 () (_ BitVec 64))

(assert (=> d!82307 (= lt!249294 (select (arr!16547 lt!249204) lt!249197))))

(assert (=> d!82307 (validMask!0 mask!3216)))

(assert (=> d!82307 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249197 lt!249201 lt!249204 mask!3216) lt!249293)))

(declare-fun b!546355 () Bool)

(assert (=> b!546355 (= e!315770 e!315771)))

(declare-fun c!63440 () Bool)

(assert (=> b!546355 (= c!63440 (or (= lt!249294 lt!249201) (= (bvadd lt!249294 lt!249294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546356 () Bool)

(assert (=> b!546356 (= e!315769 e!315772)))

(declare-fun res!340129 () Bool)

(assert (=> b!546356 (= res!340129 (and (is-Intermediate!5005 lt!249293) (not (undefined!5817 lt!249293)) (bvslt (x!51165 lt!249293) #b01111111111111111111111111111110) (bvsge (x!51165 lt!249293) #b00000000000000000000000000000000) (bvsge (x!51165 lt!249293) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546356 (=> (not res!340129) (not e!315772))))

(assert (= (and d!82307 c!63438) b!546348))

(assert (= (and d!82307 (not c!63438)) b!546355))

(assert (= (and b!546355 c!63440) b!546352))

(assert (= (and b!546355 (not c!63440)) b!546349))

(assert (= (and d!82307 c!63439) b!546354))

(assert (= (and d!82307 (not c!63439)) b!546356))

(assert (= (and b!546356 res!340129) b!546351))

(assert (= (and b!546351 (not res!340128)) b!546353))

(assert (= (and b!546353 (not res!340130)) b!546350))

(declare-fun m!523835 () Bool)

(assert (=> b!546353 m!523835))

(assert (=> b!546351 m!523835))

(declare-fun m!523837 () Bool)

(assert (=> d!82307 m!523837))

(assert (=> d!82307 m!523697))

(assert (=> b!546350 m!523835))

(assert (=> b!546349 m!523765))

(assert (=> b!546349 m!523765))

(declare-fun m!523845 () Bool)

(assert (=> b!546349 m!523845))

(assert (=> b!546129 d!82307))

(declare-fun d!82311 () Bool)

(declare-fun e!315806 () Bool)

(assert (=> d!82311 e!315806))

(declare-fun res!340154 () Bool)

(assert (=> d!82311 (=> (not res!340154) (not e!315806))))

(assert (=> d!82311 (= res!340154 (and (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16911 a!3154)) (and (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16911 a!3154)))) (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16911 a!3154)) (and (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16911 a!3154)))) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16911 a!3154))))))

(declare-fun lt!249309 () Unit!16944)

(declare-fun choose!47 (array!34437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16944)

(assert (=> d!82311 (= lt!249309 (choose!47 a!3154 i!1153 k!1998 j!147 lt!249197 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (=> d!82311 (validMask!0 mask!3216)))

(assert (=> d!82311 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249197 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216) lt!249309)))

(declare-fun b!546404 () Bool)

(assert (=> b!546404 (= e!315806 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249197 (select (store (arr!16547 a!3154) i!1153 k!1998) j!147) (array!34438 (store (arr!16547 a!3154) i!1153 k!1998) (size!16911 a!3154)) mask!3216) (Intermediate!5005 false resIndex!32 resX!32)))))

(assert (= (and d!82311 res!340154) b!546404))

(declare-fun m!523879 () Bool)

(assert (=> d!82311 m!523879))

(assert (=> d!82311 m!523697))

(assert (=> b!546404 m!523687))

(assert (=> b!546404 m!523681))

(assert (=> b!546404 m!523681))

(declare-fun m!523881 () Bool)

(assert (=> b!546404 m!523881))

(assert (=> b!546129 d!82311))

(declare-fun b!546415 () Bool)

(declare-fun e!315815 () Bool)

(declare-fun e!315818 () Bool)

(assert (=> b!546415 (= e!315815 e!315818)))

(declare-fun c!63455 () Bool)

(assert (=> b!546415 (= c!63455 (validKeyInArray!0 (select (arr!16547 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546416 () Bool)

(declare-fun call!32138 () Bool)

(assert (=> b!546416 (= e!315818 call!32138)))

(declare-fun d!82325 () Bool)

(declare-fun res!340163 () Bool)

(declare-fun e!315817 () Bool)

(assert (=> d!82325 (=> res!340163 e!315817)))

(assert (=> d!82325 (= res!340163 (bvsge #b00000000000000000000000000000000 (size!16911 a!3154)))))

(assert (=> d!82325 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10663) e!315817)))

(declare-fun b!546417 () Bool)

(declare-fun e!315816 () Bool)

(declare-fun contains!2814 (List!10666 (_ BitVec 64)) Bool)

(assert (=> b!546417 (= e!315816 (contains!2814 Nil!10663 (select (arr!16547 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32135 () Bool)

(assert (=> bm!32135 (= call!32138 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63455 (Cons!10662 (select (arr!16547 a!3154) #b00000000000000000000000000000000) Nil!10663) Nil!10663)))))

(declare-fun b!546418 () Bool)

(assert (=> b!546418 (= e!315818 call!32138)))

(declare-fun b!546419 () Bool)

(assert (=> b!546419 (= e!315817 e!315815)))

(declare-fun res!340162 () Bool)

(assert (=> b!546419 (=> (not res!340162) (not e!315815))))

(assert (=> b!546419 (= res!340162 (not e!315816))))

(declare-fun res!340161 () Bool)

(assert (=> b!546419 (=> (not res!340161) (not e!315816))))

(assert (=> b!546419 (= res!340161 (validKeyInArray!0 (select (arr!16547 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82325 (not res!340163)) b!546419))

(assert (= (and b!546419 res!340161) b!546417))

(assert (= (and b!546419 res!340162) b!546415))

(assert (= (and b!546415 c!63455) b!546416))

(assert (= (and b!546415 (not c!63455)) b!546418))

(assert (= (or b!546416 b!546418) bm!32135))

(declare-fun m!523883 () Bool)

(assert (=> b!546415 m!523883))

(assert (=> b!546415 m!523883))

(declare-fun m!523885 () Bool)

(assert (=> b!546415 m!523885))

(assert (=> b!546417 m!523883))

(assert (=> b!546417 m!523883))

(declare-fun m!523887 () Bool)

(assert (=> b!546417 m!523887))

(assert (=> bm!32135 m!523883))

(declare-fun m!523889 () Bool)

(assert (=> bm!32135 m!523889))

(assert (=> b!546419 m!523883))

(assert (=> b!546419 m!523883))

(assert (=> b!546419 m!523885))

(assert (=> b!546130 d!82325))

(declare-fun d!82327 () Bool)

(assert (=> d!82327 (= (validKeyInArray!0 (select (arr!16547 a!3154) j!147)) (and (not (= (select (arr!16547 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16547 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546123 d!82327))

(declare-fun b!546431 () Bool)

(declare-fun e!315830 () Bool)

(declare-fun call!32141 () Bool)

(assert (=> b!546431 (= e!315830 call!32141)))

(declare-fun d!82329 () Bool)

(declare-fun res!340171 () Bool)

(declare-fun e!315828 () Bool)

(assert (=> d!82329 (=> res!340171 e!315828)))

(assert (=> d!82329 (= res!340171 (bvsge #b00000000000000000000000000000000 (size!16911 a!3154)))))

(assert (=> d!82329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315828)))

(declare-fun b!546432 () Bool)

(declare-fun e!315829 () Bool)

(assert (=> b!546432 (= e!315828 e!315829)))

(declare-fun c!63458 () Bool)

(assert (=> b!546432 (= c!63458 (validKeyInArray!0 (select (arr!16547 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546433 () Bool)

(assert (=> b!546433 (= e!315829 e!315830)))

(declare-fun lt!249320 () (_ BitVec 64))

(assert (=> b!546433 (= lt!249320 (select (arr!16547 a!3154) #b00000000000000000000000000000000))))

(declare-fun lt!249321 () Unit!16944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34437 (_ BitVec 64) (_ BitVec 32)) Unit!16944)

(assert (=> b!546433 (= lt!249321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!249320 #b00000000000000000000000000000000))))

(assert (=> b!546433 (arrayContainsKey!0 a!3154 lt!249320 #b00000000000000000000000000000000)))

(declare-fun lt!249319 () Unit!16944)

(assert (=> b!546433 (= lt!249319 lt!249321)))

(declare-fun res!340172 () Bool)

(assert (=> b!546433 (= res!340172 (= (seekEntryOrOpen!0 (select (arr!16547 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!5005 #b00000000000000000000000000000000)))))

(assert (=> b!546433 (=> (not res!340172) (not e!315830))))

(declare-fun b!546434 () Bool)

(assert (=> b!546434 (= e!315829 call!32141)))

(declare-fun bm!32138 () Bool)

(assert (=> bm!32138 (= call!32141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!82329 (not res!340171)) b!546432))

(assert (= (and b!546432 c!63458) b!546433))

(assert (= (and b!546432 (not c!63458)) b!546434))

(assert (= (and b!546433 res!340172) b!546431))

(assert (= (or b!546431 b!546434) bm!32138))

(assert (=> b!546432 m!523883))

(assert (=> b!546432 m!523883))

(assert (=> b!546432 m!523885))

(assert (=> b!546433 m!523883))

(declare-fun m!523895 () Bool)

(assert (=> b!546433 m!523895))

(declare-fun m!523897 () Bool)

(assert (=> b!546433 m!523897))

(assert (=> b!546433 m!523883))

(declare-fun m!523899 () Bool)

(assert (=> b!546433 m!523899))

(declare-fun m!523901 () Bool)

(assert (=> bm!32138 m!523901))

(assert (=> b!546132 d!82329))

(declare-fun d!82333 () Bool)

(declare-fun res!340177 () Bool)

(declare-fun e!315835 () Bool)

(assert (=> d!82333 (=> res!340177 e!315835)))

(assert (=> d!82333 (= res!340177 (= (select (arr!16547 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!82333 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!315835)))

(declare-fun b!546439 () Bool)

(declare-fun e!315836 () Bool)

(assert (=> b!546439 (= e!315835 e!315836)))

(declare-fun res!340178 () Bool)

(assert (=> b!546439 (=> (not res!340178) (not e!315836))))

(assert (=> b!546439 (= res!340178 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16911 a!3154)))))

(declare-fun b!546440 () Bool)

(assert (=> b!546440 (= e!315836 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82333 (not res!340177)) b!546439))

(assert (= (and b!546439 res!340178) b!546440))

(assert (=> d!82333 m!523883))

(declare-fun m!523903 () Bool)

(assert (=> b!546440 m!523903))

(assert (=> b!546122 d!82333))

(declare-fun d!82335 () Bool)

(assert (=> d!82335 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49624 d!82335))

(declare-fun d!82343 () Bool)

(assert (=> d!82343 (= (array_inv!12343 a!3154) (bvsge (size!16911 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49624 d!82343))

(declare-fun d!82345 () Bool)

(declare-fun lt!249326 () (_ BitVec 32))

(assert (=> d!82345 (and (bvsge lt!249326 #b00000000000000000000000000000000) (bvslt lt!249326 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82345 (= lt!249326 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82345 (validMask!0 mask!3216)))

(assert (=> d!82345 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!249326)))

(declare-fun bs!17025 () Bool)

(assert (= bs!17025 d!82345))

(declare-fun m!523909 () Bool)

(assert (=> bs!17025 m!523909))

(assert (=> bs!17025 m!523697))

(assert (=> b!546125 d!82345))

(declare-fun b!546450 () Bool)

(declare-fun e!315843 () SeekEntryResult!5005)

(assert (=> b!546450 (= e!315843 (Intermediate!5005 true index!1177 x!1030))))

(declare-fun b!546451 () Bool)

(declare-fun e!315844 () SeekEntryResult!5005)

(assert (=> b!546451 (= e!315844 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16547 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546452 () Bool)

(declare-fun lt!249327 () SeekEntryResult!5005)

(assert (=> b!546452 (and (bvsge (index!22246 lt!249327) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249327) (size!16911 a!3154)))))

(declare-fun e!315846 () Bool)

(assert (=> b!546452 (= e!315846 (= (select (arr!16547 a!3154) (index!22246 lt!249327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546453 () Bool)

(assert (=> b!546453 (and (bvsge (index!22246 lt!249327) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249327) (size!16911 a!3154)))))

(declare-fun res!340182 () Bool)

(assert (=> b!546453 (= res!340182 (= (select (arr!16547 a!3154) (index!22246 lt!249327)) (select (arr!16547 a!3154) j!147)))))

(assert (=> b!546453 (=> res!340182 e!315846)))

(declare-fun e!315845 () Bool)

(assert (=> b!546453 (= e!315845 e!315846)))

(declare-fun b!546454 () Bool)

(assert (=> b!546454 (= e!315844 (Intermediate!5005 false index!1177 x!1030))))

(declare-fun b!546455 () Bool)

(assert (=> b!546455 (and (bvsge (index!22246 lt!249327) #b00000000000000000000000000000000) (bvslt (index!22246 lt!249327) (size!16911 a!3154)))))

(declare-fun res!340184 () Bool)

(assert (=> b!546455 (= res!340184 (= (select (arr!16547 a!3154) (index!22246 lt!249327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546455 (=> res!340184 e!315846)))

(declare-fun b!546456 () Bool)

(declare-fun e!315842 () Bool)

(assert (=> b!546456 (= e!315842 (bvsge (x!51165 lt!249327) #b01111111111111111111111111111110))))

(declare-fun d!82347 () Bool)

(assert (=> d!82347 e!315842))

(declare-fun c!63463 () Bool)

(assert (=> d!82347 (= c!63463 (and (is-Intermediate!5005 lt!249327) (undefined!5817 lt!249327)))))

(assert (=> d!82347 (= lt!249327 e!315843)))

(declare-fun c!63462 () Bool)

(assert (=> d!82347 (= c!63462 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249328 () (_ BitVec 64))

(assert (=> d!82347 (= lt!249328 (select (arr!16547 a!3154) index!1177))))

(assert (=> d!82347 (validMask!0 mask!3216)))

(assert (=> d!82347 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16547 a!3154) j!147) a!3154 mask!3216) lt!249327)))

(declare-fun b!546457 () Bool)

(assert (=> b!546457 (= e!315843 e!315844)))

(declare-fun c!63464 () Bool)

(assert (=> b!546457 (= c!63464 (or (= lt!249328 (select (arr!16547 a!3154) j!147)) (= (bvadd lt!249328 lt!249328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546458 () Bool)

(assert (=> b!546458 (= e!315842 e!315845)))

(declare-fun res!340183 () Bool)

(assert (=> b!546458 (= res!340183 (and (is-Intermediate!5005 lt!249327) (not (undefined!5817 lt!249327)) (bvslt (x!51165 lt!249327) #b01111111111111111111111111111110) (bvsge (x!51165 lt!249327) #b00000000000000000000000000000000) (bvsge (x!51165 lt!249327) x!1030)))))

(assert (=> b!546458 (=> (not res!340183) (not e!315845))))

(assert (= (and d!82347 c!63462) b!546450))

(assert (= (and d!82347 (not c!63462)) b!546457))

(assert (= (and b!546457 c!63464) b!546454))

(assert (= (and b!546457 (not c!63464)) b!546451))

(assert (= (and d!82347 c!63463) b!546456))

(assert (= (and d!82347 (not c!63463)) b!546458))

(assert (= (and b!546458 res!340183) b!546453))

(assert (= (and b!546453 (not res!340182)) b!546455))

(assert (= (and b!546455 (not res!340184)) b!546452))

(declare-fun m!523911 () Bool)

(assert (=> b!546455 m!523911))

(assert (=> b!546453 m!523911))

(assert (=> d!82347 m!523701))

(assert (=> d!82347 m!523697))

(assert (=> b!546452 m!523911))

(assert (=> b!546451 m!523711))

(assert (=> b!546451 m!523711))

(assert (=> b!546451 m!523691))

(declare-fun m!523913 () Bool)

(assert (=> b!546451 m!523913))

(assert (=> b!546126 d!82347))

(declare-fun d!82349 () Bool)

(assert (=> d!82349 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546124 d!82349))

(push 1)

(assert (not b!546349))

(assert (not b!546417))

(assert (not bm!32138))

(assert (not d!82311))

(assert (not d!82271))

(assert (not b!546335))

(assert (not b!546433))

(assert (not bm!32135))

(assert (not b!546415))

(assert (not d!82307))

(assert (not d!82305))

(assert (not b!546304))

(assert (not b!546432))

(assert (not b!546296))

(assert (not d!82287))

(assert (not d!82299))

(assert (not d!82347))

(assert (not b!546451))

(assert (not d!82345))

(assert (not b!546440))

(assert (not b!546240))

(assert (not b!546404))

(assert (not b!546419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

