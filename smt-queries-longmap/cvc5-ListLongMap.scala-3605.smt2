; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49620 () Bool)

(assert start!49620)

(declare-fun b!546044 () Bool)

(declare-fun e!315601 () Bool)

(declare-fun e!315602 () Bool)

(assert (=> b!546044 (= e!315601 e!315602)))

(declare-fun res!339983 () Bool)

(assert (=> b!546044 (=> (not res!339983) (not e!315602))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5003 0))(
  ( (MissingZero!5003 (index!22236 (_ BitVec 32))) (Found!5003 (index!22237 (_ BitVec 32))) (Intermediate!5003 (undefined!5815 Bool) (index!22238 (_ BitVec 32)) (x!51163 (_ BitVec 32))) (Undefined!5003) (MissingVacant!5003 (index!22239 (_ BitVec 32))) )
))
(declare-fun lt!249150 () SeekEntryResult!5003)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34433 0))(
  ( (array!34434 (arr!16545 (Array (_ BitVec 32) (_ BitVec 64))) (size!16909 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34433)

(declare-fun lt!249148 () SeekEntryResult!5003)

(assert (=> b!546044 (= res!339983 (and (= lt!249150 lt!249148) (not (= (select (arr!16545 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16545 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16545 a!3154) index!1177) (select (arr!16545 a!3154) j!147)))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34433 (_ BitVec 32)) SeekEntryResult!5003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546044 (= lt!249150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546045 () Bool)

(declare-fun res!339975 () Bool)

(declare-fun e!315599 () Bool)

(assert (=> b!546045 (=> (not res!339975) (not e!315599))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546045 (= res!339975 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546047 () Bool)

(declare-fun res!339978 () Bool)

(assert (=> b!546047 (=> (not res!339978) (not e!315599))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546047 (= res!339978 (and (= (size!16909 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16909 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546048 () Bool)

(declare-fun e!315597 () Bool)

(assert (=> b!546048 (= e!315597 e!315601)))

(declare-fun res!339981 () Bool)

(assert (=> b!546048 (=> (not res!339981) (not e!315601))))

(declare-fun lt!249149 () SeekEntryResult!5003)

(assert (=> b!546048 (= res!339981 (= lt!249148 lt!249149))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!546048 (= lt!249149 (Intermediate!5003 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!546048 (= lt!249148 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun e!315600 () Bool)

(declare-fun lt!249151 () array!34433)

(declare-fun lt!249147 () (_ BitVec 64))

(declare-fun b!546049 () Bool)

(assert (=> b!546049 (= e!315600 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249147 lt!249151 mask!3216) lt!249149)))))

(declare-fun lt!249145 () (_ BitVec 32))

(assert (=> b!546049 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249145 lt!249147 lt!249151 mask!3216) lt!249149)))

(assert (=> b!546049 (= lt!249147 (select (store (arr!16545 a!3154) i!1153 k!1998) j!147))))

(assert (=> b!546049 (= lt!249151 (array!34434 (store (arr!16545 a!3154) i!1153 k!1998) (size!16909 a!3154)))))

(declare-datatypes ((Unit!16940 0))(
  ( (Unit!16941) )
))
(declare-fun lt!249143 () Unit!16940)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16940)

(assert (=> b!546049 (= lt!249143 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249145 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!546050 () Bool)

(declare-fun res!339972 () Bool)

(assert (=> b!546050 (=> (not res!339972) (not e!315597))))

(assert (=> b!546050 (= res!339972 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16909 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16909 a!3154)) (= (select (arr!16545 a!3154) resIndex!32) (select (arr!16545 a!3154) j!147))))))

(declare-fun b!546051 () Bool)

(declare-fun res!339982 () Bool)

(assert (=> b!546051 (=> (not res!339982) (not e!315597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34433 (_ BitVec 32)) Bool)

(assert (=> b!546051 (= res!339982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!546052 () Bool)

(declare-fun res!339977 () Bool)

(assert (=> b!546052 (=> (not res!339977) (not e!315597))))

(declare-datatypes ((List!10664 0))(
  ( (Nil!10661) (Cons!10660 (h!11624 (_ BitVec 64)) (t!16892 List!10664)) )
))
(declare-fun arrayNoDuplicates!0 (array!34433 (_ BitVec 32) List!10664) Bool)

(assert (=> b!546052 (= res!339977 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10661))))

(declare-fun b!546053 () Bool)

(declare-fun res!339980 () Bool)

(assert (=> b!546053 (=> (not res!339980) (not e!315599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546053 (= res!339980 (validKeyInArray!0 (select (arr!16545 a!3154) j!147)))))

(declare-fun res!339976 () Bool)

(assert (=> start!49620 (=> (not res!339976) (not e!315599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49620 (= res!339976 (validMask!0 mask!3216))))

(assert (=> start!49620 e!315599))

(assert (=> start!49620 true))

(declare-fun array_inv!12341 (array!34433) Bool)

(assert (=> start!49620 (array_inv!12341 a!3154)))

(declare-fun b!546046 () Bool)

(declare-fun e!315598 () Bool)

(assert (=> b!546046 (= e!315598 e!315600)))

(declare-fun res!339979 () Bool)

(assert (=> b!546046 (=> (not res!339979) (not e!315600))))

(declare-fun lt!249146 () SeekEntryResult!5003)

(assert (=> b!546046 (= res!339979 (and (= lt!249146 lt!249149) (= lt!249150 lt!249146)))))

(assert (=> b!546046 (= lt!249146 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249145 (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546054 () Bool)

(declare-fun res!339974 () Bool)

(assert (=> b!546054 (=> (not res!339974) (not e!315599))))

(assert (=> b!546054 (= res!339974 (validKeyInArray!0 k!1998))))

(declare-fun b!546055 () Bool)

(assert (=> b!546055 (= e!315599 e!315597)))

(declare-fun res!339973 () Bool)

(assert (=> b!546055 (=> (not res!339973) (not e!315597))))

(declare-fun lt!249144 () SeekEntryResult!5003)

(assert (=> b!546055 (= res!339973 (or (= lt!249144 (MissingZero!5003 i!1153)) (= lt!249144 (MissingVacant!5003 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34433 (_ BitVec 32)) SeekEntryResult!5003)

(assert (=> b!546055 (= lt!249144 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!546056 () Bool)

(assert (=> b!546056 (= e!315602 e!315598)))

(declare-fun res!339971 () Bool)

(assert (=> b!546056 (=> (not res!339971) (not e!315598))))

(assert (=> b!546056 (= res!339971 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249145 #b00000000000000000000000000000000) (bvslt lt!249145 (size!16909 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546056 (= lt!249145 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!49620 res!339976) b!546047))

(assert (= (and b!546047 res!339978) b!546053))

(assert (= (and b!546053 res!339980) b!546054))

(assert (= (and b!546054 res!339974) b!546045))

(assert (= (and b!546045 res!339975) b!546055))

(assert (= (and b!546055 res!339973) b!546051))

(assert (= (and b!546051 res!339982) b!546052))

(assert (= (and b!546052 res!339977) b!546050))

(assert (= (and b!546050 res!339972) b!546048))

(assert (= (and b!546048 res!339981) b!546044))

(assert (= (and b!546044 res!339983) b!546056))

(assert (= (and b!546056 res!339971) b!546046))

(assert (= (and b!546046 res!339979) b!546049))

(declare-fun m!523593 () Bool)

(assert (=> b!546053 m!523593))

(assert (=> b!546053 m!523593))

(declare-fun m!523595 () Bool)

(assert (=> b!546053 m!523595))

(declare-fun m!523597 () Bool)

(assert (=> b!546051 m!523597))

(assert (=> b!546048 m!523593))

(assert (=> b!546048 m!523593))

(declare-fun m!523599 () Bool)

(assert (=> b!546048 m!523599))

(declare-fun m!523601 () Bool)

(assert (=> b!546056 m!523601))

(declare-fun m!523603 () Bool)

(assert (=> start!49620 m!523603))

(declare-fun m!523605 () Bool)

(assert (=> start!49620 m!523605))

(declare-fun m!523607 () Bool)

(assert (=> b!546049 m!523607))

(declare-fun m!523609 () Bool)

(assert (=> b!546049 m!523609))

(declare-fun m!523611 () Bool)

(assert (=> b!546049 m!523611))

(declare-fun m!523613 () Bool)

(assert (=> b!546049 m!523613))

(declare-fun m!523615 () Bool)

(assert (=> b!546049 m!523615))

(declare-fun m!523617 () Bool)

(assert (=> b!546050 m!523617))

(assert (=> b!546050 m!523593))

(declare-fun m!523619 () Bool)

(assert (=> b!546052 m!523619))

(declare-fun m!523621 () Bool)

(assert (=> b!546055 m!523621))

(declare-fun m!523623 () Bool)

(assert (=> b!546054 m!523623))

(declare-fun m!523625 () Bool)

(assert (=> b!546045 m!523625))

(assert (=> b!546046 m!523593))

(assert (=> b!546046 m!523593))

(declare-fun m!523627 () Bool)

(assert (=> b!546046 m!523627))

(declare-fun m!523629 () Bool)

(assert (=> b!546044 m!523629))

(assert (=> b!546044 m!523593))

(assert (=> b!546044 m!523593))

(declare-fun m!523631 () Bool)

(assert (=> b!546044 m!523631))

(assert (=> b!546044 m!523631))

(assert (=> b!546044 m!523593))

(declare-fun m!523633 () Bool)

(assert (=> b!546044 m!523633))

(push 1)

(assert (not b!546051))

(assert (not start!49620))

(assert (not b!546045))

(assert (not b!546056))

(assert (not b!546054))

(assert (not b!546053))

(assert (not b!546052))

(assert (not b!546046))

(assert (not b!546055))

(assert (not b!546049))

(assert (not b!546048))

(assert (not b!546044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82273 () Bool)

(assert (=> d!82273 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546054 d!82273))

(declare-fun b!546249 () Bool)

(declare-fun e!315714 () SeekEntryResult!5003)

(assert (=> b!546249 (= e!315714 (Intermediate!5003 true (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546250 () Bool)

(declare-fun lt!249250 () SeekEntryResult!5003)

(assert (=> b!546250 (and (bvsge (index!22238 lt!249250) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249250) (size!16909 a!3154)))))

(declare-fun e!315713 () Bool)

(assert (=> b!546250 (= e!315713 (= (select (arr!16545 a!3154) (index!22238 lt!249250)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315717 () SeekEntryResult!5003)

(declare-fun b!546251 () Bool)

(assert (=> b!546251 (= e!315717 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546252 () Bool)

(assert (=> b!546252 (= e!315717 (Intermediate!5003 false (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546253 () Bool)

(declare-fun e!315716 () Bool)

(declare-fun e!315715 () Bool)

(assert (=> b!546253 (= e!315716 e!315715)))

(declare-fun res!340107 () Bool)

(assert (=> b!546253 (= res!340107 (and (is-Intermediate!5003 lt!249250) (not (undefined!5815 lt!249250)) (bvslt (x!51163 lt!249250) #b01111111111111111111111111111110) (bvsge (x!51163 lt!249250) #b00000000000000000000000000000000) (bvsge (x!51163 lt!249250) #b00000000000000000000000000000000)))))

(assert (=> b!546253 (=> (not res!340107) (not e!315715))))

(declare-fun d!82275 () Bool)

(assert (=> d!82275 e!315716))

(declare-fun c!63400 () Bool)

(assert (=> d!82275 (= c!63400 (and (is-Intermediate!5003 lt!249250) (undefined!5815 lt!249250)))))

(assert (=> d!82275 (= lt!249250 e!315714)))

(declare-fun c!63399 () Bool)

(assert (=> d!82275 (= c!63399 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!249249 () (_ BitVec 64))

(assert (=> d!82275 (= lt!249249 (select (arr!16545 a!3154) (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216)))))

(assert (=> d!82275 (validMask!0 mask!3216)))

(assert (=> d!82275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) (select (arr!16545 a!3154) j!147) a!3154 mask!3216) lt!249250)))

(declare-fun b!546254 () Bool)

(assert (=> b!546254 (= e!315714 e!315717)))

(declare-fun c!63401 () Bool)

(assert (=> b!546254 (= c!63401 (or (= lt!249249 (select (arr!16545 a!3154) j!147)) (= (bvadd lt!249249 lt!249249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546255 () Bool)

(assert (=> b!546255 (and (bvsge (index!22238 lt!249250) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249250) (size!16909 a!3154)))))

(declare-fun res!340106 () Bool)

(assert (=> b!546255 (= res!340106 (= (select (arr!16545 a!3154) (index!22238 lt!249250)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546255 (=> res!340106 e!315713)))

(declare-fun b!546256 () Bool)

(assert (=> b!546256 (= e!315716 (bvsge (x!51163 lt!249250) #b01111111111111111111111111111110))))

(declare-fun b!546257 () Bool)

(assert (=> b!546257 (and (bvsge (index!22238 lt!249250) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249250) (size!16909 a!3154)))))

(declare-fun res!340105 () Bool)

(assert (=> b!546257 (= res!340105 (= (select (arr!16545 a!3154) (index!22238 lt!249250)) (select (arr!16545 a!3154) j!147)))))

(assert (=> b!546257 (=> res!340105 e!315713)))

(assert (=> b!546257 (= e!315715 e!315713)))

(assert (= (and d!82275 c!63399) b!546249))

(assert (= (and d!82275 (not c!63399)) b!546254))

(assert (= (and b!546254 c!63401) b!546252))

(assert (= (and b!546254 (not c!63401)) b!546251))

(assert (= (and d!82275 c!63400) b!546256))

(assert (= (and d!82275 (not c!63400)) b!546253))

(assert (= (and b!546253 res!340107) b!546257))

(assert (= (and b!546257 (not res!340105)) b!546255))

(assert (= (and b!546255 (not res!340106)) b!546250))

(declare-fun m!523773 () Bool)

(assert (=> b!546250 m!523773))

(assert (=> b!546257 m!523773))

(assert (=> b!546255 m!523773))

(assert (=> d!82275 m!523631))

(declare-fun m!523775 () Bool)

(assert (=> d!82275 m!523775))

(assert (=> d!82275 m!523603))

(assert (=> b!546251 m!523631))

(declare-fun m!523777 () Bool)

(assert (=> b!546251 m!523777))

(assert (=> b!546251 m!523777))

(assert (=> b!546251 m!523593))

(declare-fun m!523779 () Bool)

(assert (=> b!546251 m!523779))

(assert (=> b!546044 d!82275))

(declare-fun d!82291 () Bool)

(declare-fun lt!249256 () (_ BitVec 32))

(declare-fun lt!249255 () (_ BitVec 32))

(assert (=> d!82291 (= lt!249256 (bvmul (bvxor lt!249255 (bvlshr lt!249255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82291 (= lt!249255 ((_ extract 31 0) (bvand (bvxor (select (arr!16545 a!3154) j!147) (bvlshr (select (arr!16545 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82291 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!340108 (let ((h!11628 ((_ extract 31 0) (bvand (bvxor (select (arr!16545 a!3154) j!147) (bvlshr (select (arr!16545 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51172 (bvmul (bvxor h!11628 (bvlshr h!11628 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51172 (bvlshr x!51172 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!340108 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!340108 #b00000000000000000000000000000000))))))

(assert (=> d!82291 (= (toIndex!0 (select (arr!16545 a!3154) j!147) mask!3216) (bvand (bvxor lt!249256 (bvlshr lt!249256 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!546044 d!82291))

(declare-fun d!82293 () Bool)

(assert (=> d!82293 (= (validKeyInArray!0 (select (arr!16545 a!3154) j!147)) (and (not (= (select (arr!16545 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16545 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546053 d!82293))

(declare-fun b!546258 () Bool)

(declare-fun e!315719 () SeekEntryResult!5003)

(assert (=> b!546258 (= e!315719 (Intermediate!5003 true lt!249145 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546259 () Bool)

(declare-fun lt!249258 () SeekEntryResult!5003)

(assert (=> b!546259 (and (bvsge (index!22238 lt!249258) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249258) (size!16909 a!3154)))))

(declare-fun e!315718 () Bool)

(assert (=> b!546259 (= e!315718 (= (select (arr!16545 a!3154) (index!22238 lt!249258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546260 () Bool)

(declare-fun e!315722 () SeekEntryResult!5003)

(assert (=> b!546260 (= e!315722 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249145 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546261 () Bool)

(assert (=> b!546261 (= e!315722 (Intermediate!5003 false lt!249145 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546262 () Bool)

(declare-fun e!315721 () Bool)

(declare-fun e!315720 () Bool)

(assert (=> b!546262 (= e!315721 e!315720)))

(declare-fun res!340111 () Bool)

(assert (=> b!546262 (= res!340111 (and (is-Intermediate!5003 lt!249258) (not (undefined!5815 lt!249258)) (bvslt (x!51163 lt!249258) #b01111111111111111111111111111110) (bvsge (x!51163 lt!249258) #b00000000000000000000000000000000) (bvsge (x!51163 lt!249258) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546262 (=> (not res!340111) (not e!315720))))

(declare-fun d!82295 () Bool)

(assert (=> d!82295 e!315721))

(declare-fun c!63403 () Bool)

(assert (=> d!82295 (= c!63403 (and (is-Intermediate!5003 lt!249258) (undefined!5815 lt!249258)))))

(assert (=> d!82295 (= lt!249258 e!315719)))

(declare-fun c!63402 () Bool)

(assert (=> d!82295 (= c!63402 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249257 () (_ BitVec 64))

(assert (=> d!82295 (= lt!249257 (select (arr!16545 a!3154) lt!249145))))

(assert (=> d!82295 (validMask!0 mask!3216)))

(assert (=> d!82295 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249145 (select (arr!16545 a!3154) j!147) a!3154 mask!3216) lt!249258)))

(declare-fun b!546263 () Bool)

(assert (=> b!546263 (= e!315719 e!315722)))

(declare-fun c!63404 () Bool)

(assert (=> b!546263 (= c!63404 (or (= lt!249257 (select (arr!16545 a!3154) j!147)) (= (bvadd lt!249257 lt!249257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546264 () Bool)

(assert (=> b!546264 (and (bvsge (index!22238 lt!249258) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249258) (size!16909 a!3154)))))

(declare-fun res!340110 () Bool)

(assert (=> b!546264 (= res!340110 (= (select (arr!16545 a!3154) (index!22238 lt!249258)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546264 (=> res!340110 e!315718)))

(declare-fun b!546265 () Bool)

(assert (=> b!546265 (= e!315721 (bvsge (x!51163 lt!249258) #b01111111111111111111111111111110))))

(declare-fun b!546266 () Bool)

(assert (=> b!546266 (and (bvsge (index!22238 lt!249258) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249258) (size!16909 a!3154)))))

(declare-fun res!340109 () Bool)

(assert (=> b!546266 (= res!340109 (= (select (arr!16545 a!3154) (index!22238 lt!249258)) (select (arr!16545 a!3154) j!147)))))

(assert (=> b!546266 (=> res!340109 e!315718)))

(assert (=> b!546266 (= e!315720 e!315718)))

(assert (= (and d!82295 c!63402) b!546258))

(assert (= (and d!82295 (not c!63402)) b!546263))

(assert (= (and b!546263 c!63404) b!546261))

(assert (= (and b!546263 (not c!63404)) b!546260))

(assert (= (and d!82295 c!63403) b!546265))

(assert (= (and d!82295 (not c!63403)) b!546262))

(assert (= (and b!546262 res!340111) b!546266))

(assert (= (and b!546266 (not res!340109)) b!546264))

(assert (= (and b!546264 (not res!340110)) b!546259))

(declare-fun m!523781 () Bool)

(assert (=> b!546259 m!523781))

(assert (=> b!546266 m!523781))

(assert (=> b!546264 m!523781))

(declare-fun m!523783 () Bool)

(assert (=> d!82295 m!523783))

(assert (=> d!82295 m!523603))

(declare-fun m!523785 () Bool)

(assert (=> b!546260 m!523785))

(assert (=> b!546260 m!523785))

(assert (=> b!546260 m!523593))

(declare-fun m!523787 () Bool)

(assert (=> b!546260 m!523787))

(assert (=> b!546046 d!82295))

(declare-fun b!546357 () Bool)

(declare-fun e!315775 () SeekEntryResult!5003)

(declare-fun e!315774 () SeekEntryResult!5003)

(assert (=> b!546357 (= e!315775 e!315774)))

(declare-fun lt!249297 () (_ BitVec 64))

(declare-fun lt!249295 () SeekEntryResult!5003)

(assert (=> b!546357 (= lt!249297 (select (arr!16545 a!3154) (index!22238 lt!249295)))))

(declare-fun c!63443 () Bool)

(assert (=> b!546357 (= c!63443 (= lt!249297 k!1998))))

(declare-fun b!546358 () Bool)

(assert (=> b!546358 (= e!315774 (Found!5003 (index!22238 lt!249295)))))

(declare-fun b!546359 () Bool)

(declare-fun c!63441 () Bool)

(assert (=> b!546359 (= c!63441 (= lt!249297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315776 () SeekEntryResult!5003)

(assert (=> b!546359 (= e!315774 e!315776)))

(declare-fun d!82297 () Bool)

(declare-fun lt!249296 () SeekEntryResult!5003)

(assert (=> d!82297 (and (or (is-Undefined!5003 lt!249296) (not (is-Found!5003 lt!249296)) (and (bvsge (index!22237 lt!249296) #b00000000000000000000000000000000) (bvslt (index!22237 lt!249296) (size!16909 a!3154)))) (or (is-Undefined!5003 lt!249296) (is-Found!5003 lt!249296) (not (is-MissingZero!5003 lt!249296)) (and (bvsge (index!22236 lt!249296) #b00000000000000000000000000000000) (bvslt (index!22236 lt!249296) (size!16909 a!3154)))) (or (is-Undefined!5003 lt!249296) (is-Found!5003 lt!249296) (is-MissingZero!5003 lt!249296) (not (is-MissingVacant!5003 lt!249296)) (and (bvsge (index!22239 lt!249296) #b00000000000000000000000000000000) (bvslt (index!22239 lt!249296) (size!16909 a!3154)))) (or (is-Undefined!5003 lt!249296) (ite (is-Found!5003 lt!249296) (= (select (arr!16545 a!3154) (index!22237 lt!249296)) k!1998) (ite (is-MissingZero!5003 lt!249296) (= (select (arr!16545 a!3154) (index!22236 lt!249296)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5003 lt!249296) (= (select (arr!16545 a!3154) (index!22239 lt!249296)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82297 (= lt!249296 e!315775)))

(declare-fun c!63442 () Bool)

(assert (=> d!82297 (= c!63442 (and (is-Intermediate!5003 lt!249295) (undefined!5815 lt!249295)))))

(assert (=> d!82297 (= lt!249295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82297 (validMask!0 mask!3216)))

(assert (=> d!82297 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!249296)))

(declare-fun b!546360 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34433 (_ BitVec 32)) SeekEntryResult!5003)

(assert (=> b!546360 (= e!315776 (seekKeyOrZeroReturnVacant!0 (x!51163 lt!249295) (index!22238 lt!249295) (index!22238 lt!249295) k!1998 a!3154 mask!3216))))

(declare-fun b!546361 () Bool)

(assert (=> b!546361 (= e!315775 Undefined!5003)))

(declare-fun b!546362 () Bool)

(assert (=> b!546362 (= e!315776 (MissingZero!5003 (index!22238 lt!249295)))))

(assert (= (and d!82297 c!63442) b!546361))

(assert (= (and d!82297 (not c!63442)) b!546357))

(assert (= (and b!546357 c!63443) b!546358))

(assert (= (and b!546357 (not c!63443)) b!546359))

(assert (= (and b!546359 c!63441) b!546362))

(assert (= (and b!546359 (not c!63441)) b!546360))

(declare-fun m!523839 () Bool)

(assert (=> b!546357 m!523839))

(declare-fun m!523841 () Bool)

(assert (=> d!82297 m!523841))

(declare-fun m!523843 () Bool)

(assert (=> d!82297 m!523843))

(declare-fun m!523847 () Bool)

(assert (=> d!82297 m!523847))

(declare-fun m!523849 () Bool)

(assert (=> d!82297 m!523849))

(assert (=> d!82297 m!523603))

(assert (=> d!82297 m!523847))

(declare-fun m!523851 () Bool)

(assert (=> d!82297 m!523851))

(declare-fun m!523853 () Bool)

(assert (=> b!546360 m!523853))

(assert (=> b!546055 d!82297))

(declare-fun d!82313 () Bool)

(declare-fun lt!249302 () (_ BitVec 32))

(assert (=> d!82313 (and (bvsge lt!249302 #b00000000000000000000000000000000) (bvslt lt!249302 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82313 (= lt!249302 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82313 (validMask!0 mask!3216)))

(assert (=> d!82313 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!249302)))

(declare-fun bs!17024 () Bool)

(assert (= bs!17024 d!82313))

(declare-fun m!523859 () Bool)

(assert (=> bs!17024 m!523859))

(assert (=> bs!17024 m!523603))

(assert (=> b!546056 d!82313))

(declare-fun d!82317 () Bool)

(declare-fun res!340144 () Bool)

(declare-fun e!315792 () Bool)

(assert (=> d!82317 (=> res!340144 e!315792)))

(assert (=> d!82317 (= res!340144 (= (select (arr!16545 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!82317 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!315792)))

(declare-fun b!546382 () Bool)

(declare-fun e!315793 () Bool)

(assert (=> b!546382 (= e!315792 e!315793)))

(declare-fun res!340145 () Bool)

(assert (=> b!546382 (=> (not res!340145) (not e!315793))))

(assert (=> b!546382 (= res!340145 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16909 a!3154)))))

(declare-fun b!546383 () Bool)

(assert (=> b!546383 (= e!315793 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82317 (not res!340144)) b!546382))

(assert (= (and b!546382 res!340145) b!546383))

(declare-fun m!523863 () Bool)

(assert (=> d!82317 m!523863))

(declare-fun m!523865 () Bool)

(assert (=> b!546383 m!523865))

(assert (=> b!546045 d!82317))

(declare-fun b!546384 () Bool)

(declare-fun e!315795 () SeekEntryResult!5003)

(assert (=> b!546384 (= e!315795 (Intermediate!5003 true index!1177 x!1030))))

(declare-fun b!546385 () Bool)

(declare-fun lt!249304 () SeekEntryResult!5003)

(assert (=> b!546385 (and (bvsge (index!22238 lt!249304) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249304) (size!16909 lt!249151)))))

(declare-fun e!315794 () Bool)

(assert (=> b!546385 (= e!315794 (= (select (arr!16545 lt!249151) (index!22238 lt!249304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546386 () Bool)

(declare-fun e!315798 () SeekEntryResult!5003)

(assert (=> b!546386 (= e!315798 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) lt!249147 lt!249151 mask!3216))))

(declare-fun b!546387 () Bool)

(assert (=> b!546387 (= e!315798 (Intermediate!5003 false index!1177 x!1030))))

(declare-fun b!546388 () Bool)

(declare-fun e!315797 () Bool)

(declare-fun e!315796 () Bool)

(assert (=> b!546388 (= e!315797 e!315796)))

(declare-fun res!340148 () Bool)

(assert (=> b!546388 (= res!340148 (and (is-Intermediate!5003 lt!249304) (not (undefined!5815 lt!249304)) (bvslt (x!51163 lt!249304) #b01111111111111111111111111111110) (bvsge (x!51163 lt!249304) #b00000000000000000000000000000000) (bvsge (x!51163 lt!249304) x!1030)))))

(assert (=> b!546388 (=> (not res!340148) (not e!315796))))

(declare-fun d!82319 () Bool)

(assert (=> d!82319 e!315797))

(declare-fun c!63448 () Bool)

(assert (=> d!82319 (= c!63448 (and (is-Intermediate!5003 lt!249304) (undefined!5815 lt!249304)))))

(assert (=> d!82319 (= lt!249304 e!315795)))

(declare-fun c!63447 () Bool)

(assert (=> d!82319 (= c!63447 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249303 () (_ BitVec 64))

(assert (=> d!82319 (= lt!249303 (select (arr!16545 lt!249151) index!1177))))

(assert (=> d!82319 (validMask!0 mask!3216)))

(assert (=> d!82319 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249147 lt!249151 mask!3216) lt!249304)))

(declare-fun b!546389 () Bool)

(assert (=> b!546389 (= e!315795 e!315798)))

(declare-fun c!63449 () Bool)

(assert (=> b!546389 (= c!63449 (or (= lt!249303 lt!249147) (= (bvadd lt!249303 lt!249303) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546390 () Bool)

(assert (=> b!546390 (and (bvsge (index!22238 lt!249304) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249304) (size!16909 lt!249151)))))

(declare-fun res!340147 () Bool)

(assert (=> b!546390 (= res!340147 (= (select (arr!16545 lt!249151) (index!22238 lt!249304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546390 (=> res!340147 e!315794)))

(declare-fun b!546391 () Bool)

(assert (=> b!546391 (= e!315797 (bvsge (x!51163 lt!249304) #b01111111111111111111111111111110))))

(declare-fun b!546392 () Bool)

(assert (=> b!546392 (and (bvsge (index!22238 lt!249304) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249304) (size!16909 lt!249151)))))

(declare-fun res!340146 () Bool)

(assert (=> b!546392 (= res!340146 (= (select (arr!16545 lt!249151) (index!22238 lt!249304)) lt!249147))))

(assert (=> b!546392 (=> res!340146 e!315794)))

(assert (=> b!546392 (= e!315796 e!315794)))

(assert (= (and d!82319 c!63447) b!546384))

(assert (= (and d!82319 (not c!63447)) b!546389))

(assert (= (and b!546389 c!63449) b!546387))

(assert (= (and b!546389 (not c!63449)) b!546386))

(assert (= (and d!82319 c!63448) b!546391))

(assert (= (and d!82319 (not c!63448)) b!546388))

(assert (= (and b!546388 res!340148) b!546392))

(assert (= (and b!546392 (not res!340146)) b!546390))

(assert (= (and b!546390 (not res!340147)) b!546385))

(declare-fun m!523867 () Bool)

(assert (=> b!546385 m!523867))

(assert (=> b!546392 m!523867))

(assert (=> b!546390 m!523867))

(declare-fun m!523869 () Bool)

(assert (=> d!82319 m!523869))

(assert (=> d!82319 m!523603))

(assert (=> b!546386 m!523601))

(assert (=> b!546386 m!523601))

(declare-fun m!523871 () Bool)

(assert (=> b!546386 m!523871))

(assert (=> b!546049 d!82319))

(declare-fun b!546393 () Bool)

(declare-fun e!315800 () SeekEntryResult!5003)

(assert (=> b!546393 (= e!315800 (Intermediate!5003 true lt!249145 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546394 () Bool)

(declare-fun lt!249306 () SeekEntryResult!5003)

(assert (=> b!546394 (and (bvsge (index!22238 lt!249306) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249306) (size!16909 lt!249151)))))

(declare-fun e!315799 () Bool)

(assert (=> b!546394 (= e!315799 (= (select (arr!16545 lt!249151) (index!22238 lt!249306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546395 () Bool)

(declare-fun e!315803 () SeekEntryResult!5003)

(assert (=> b!546395 (= e!315803 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249145 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!249147 lt!249151 mask!3216))))

(declare-fun b!546396 () Bool)

(assert (=> b!546396 (= e!315803 (Intermediate!5003 false lt!249145 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546397 () Bool)

(declare-fun e!315802 () Bool)

(declare-fun e!315801 () Bool)

(assert (=> b!546397 (= e!315802 e!315801)))

(declare-fun res!340151 () Bool)

(assert (=> b!546397 (= res!340151 (and (is-Intermediate!5003 lt!249306) (not (undefined!5815 lt!249306)) (bvslt (x!51163 lt!249306) #b01111111111111111111111111111110) (bvsge (x!51163 lt!249306) #b00000000000000000000000000000000) (bvsge (x!51163 lt!249306) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546397 (=> (not res!340151) (not e!315801))))

(declare-fun d!82321 () Bool)

(assert (=> d!82321 e!315802))

(declare-fun c!63451 () Bool)

(assert (=> d!82321 (= c!63451 (and (is-Intermediate!5003 lt!249306) (undefined!5815 lt!249306)))))

(assert (=> d!82321 (= lt!249306 e!315800)))

(declare-fun c!63450 () Bool)

(assert (=> d!82321 (= c!63450 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249305 () (_ BitVec 64))

(assert (=> d!82321 (= lt!249305 (select (arr!16545 lt!249151) lt!249145))))

(assert (=> d!82321 (validMask!0 mask!3216)))

(assert (=> d!82321 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249145 lt!249147 lt!249151 mask!3216) lt!249306)))

(declare-fun b!546398 () Bool)

(assert (=> b!546398 (= e!315800 e!315803)))

(declare-fun c!63452 () Bool)

(assert (=> b!546398 (= c!63452 (or (= lt!249305 lt!249147) (= (bvadd lt!249305 lt!249305) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546399 () Bool)

(assert (=> b!546399 (and (bvsge (index!22238 lt!249306) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249306) (size!16909 lt!249151)))))

(declare-fun res!340150 () Bool)

(assert (=> b!546399 (= res!340150 (= (select (arr!16545 lt!249151) (index!22238 lt!249306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546399 (=> res!340150 e!315799)))

(declare-fun b!546400 () Bool)

(assert (=> b!546400 (= e!315802 (bvsge (x!51163 lt!249306) #b01111111111111111111111111111110))))

(declare-fun b!546401 () Bool)

(assert (=> b!546401 (and (bvsge (index!22238 lt!249306) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249306) (size!16909 lt!249151)))))

(declare-fun res!340149 () Bool)

(assert (=> b!546401 (= res!340149 (= (select (arr!16545 lt!249151) (index!22238 lt!249306)) lt!249147))))

(assert (=> b!546401 (=> res!340149 e!315799)))

(assert (=> b!546401 (= e!315801 e!315799)))

(assert (= (and d!82321 c!63450) b!546393))

(assert (= (and d!82321 (not c!63450)) b!546398))

(assert (= (and b!546398 c!63452) b!546396))

(assert (= (and b!546398 (not c!63452)) b!546395))

(assert (= (and d!82321 c!63451) b!546400))

(assert (= (and d!82321 (not c!63451)) b!546397))

(assert (= (and b!546397 res!340151) b!546401))

(assert (= (and b!546401 (not res!340149)) b!546399))

(assert (= (and b!546399 (not res!340150)) b!546394))

(declare-fun m!523873 () Bool)

(assert (=> b!546394 m!523873))

(assert (=> b!546401 m!523873))

(assert (=> b!546399 m!523873))

(declare-fun m!523875 () Bool)

(assert (=> d!82321 m!523875))

(assert (=> d!82321 m!523603))

(assert (=> b!546395 m!523785))

(assert (=> b!546395 m!523785))

(declare-fun m!523877 () Bool)

(assert (=> b!546395 m!523877))

(assert (=> b!546049 d!82321))

(declare-fun d!82323 () Bool)

(declare-fun e!315821 () Bool)

(assert (=> d!82323 e!315821))

(declare-fun res!340166 () Bool)

(assert (=> d!82323 (=> (not res!340166) (not e!315821))))

(assert (=> d!82323 (= res!340166 (and (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16909 a!3154)) (and (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16909 a!3154)))) (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16909 a!3154)) (and (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154)))) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154))))))

(declare-fun lt!249312 () Unit!16940)

(declare-fun choose!47 (array!34433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16940)

(assert (=> d!82323 (= lt!249312 (choose!47 a!3154 i!1153 k!1998 j!147 lt!249145 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (=> d!82323 (validMask!0 mask!3216)))

(assert (=> d!82323 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249145 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216) lt!249312)))

(declare-fun b!546422 () Bool)

(assert (=> b!546422 (= e!315821 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249145 (select (store (arr!16545 a!3154) i!1153 k!1998) j!147) (array!34434 (store (arr!16545 a!3154) i!1153 k!1998) (size!16909 a!3154)) mask!3216) (Intermediate!5003 false resIndex!32 resX!32)))))

(assert (= (and d!82323 res!340166) b!546422))

(declare-fun m!523891 () Bool)

(assert (=> d!82323 m!523891))

(assert (=> d!82323 m!523603))

(assert (=> b!546422 m!523611))

(assert (=> b!546422 m!523607))

(assert (=> b!546422 m!523607))

(declare-fun m!523893 () Bool)

(assert (=> b!546422 m!523893))

(assert (=> b!546049 d!82323))

(declare-fun d!82331 () Bool)

(assert (=> d!82331 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49620 d!82331))

(declare-fun d!82337 () Bool)

(assert (=> d!82337 (= (array_inv!12341 a!3154) (bvsge (size!16909 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49620 d!82337))

(declare-fun b!546441 () Bool)

(declare-fun e!315838 () SeekEntryResult!5003)

(assert (=> b!546441 (= e!315838 (Intermediate!5003 true index!1177 x!1030))))

(declare-fun b!546442 () Bool)

(declare-fun lt!249323 () SeekEntryResult!5003)

(assert (=> b!546442 (and (bvsge (index!22238 lt!249323) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249323) (size!16909 a!3154)))))

(declare-fun e!315837 () Bool)

(assert (=> b!546442 (= e!315837 (= (select (arr!16545 a!3154) (index!22238 lt!249323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315841 () SeekEntryResult!5003)

(declare-fun b!546443 () Bool)

(assert (=> b!546443 (= e!315841 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16545 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546444 () Bool)

(assert (=> b!546444 (= e!315841 (Intermediate!5003 false index!1177 x!1030))))

(declare-fun b!546445 () Bool)

(declare-fun e!315840 () Bool)

(declare-fun e!315839 () Bool)

(assert (=> b!546445 (= e!315840 e!315839)))

(declare-fun res!340181 () Bool)

(assert (=> b!546445 (= res!340181 (and (is-Intermediate!5003 lt!249323) (not (undefined!5815 lt!249323)) (bvslt (x!51163 lt!249323) #b01111111111111111111111111111110) (bvsge (x!51163 lt!249323) #b00000000000000000000000000000000) (bvsge (x!51163 lt!249323) x!1030)))))

(assert (=> b!546445 (=> (not res!340181) (not e!315839))))

(declare-fun d!82339 () Bool)

(assert (=> d!82339 e!315840))

(declare-fun c!63460 () Bool)

(assert (=> d!82339 (= c!63460 (and (is-Intermediate!5003 lt!249323) (undefined!5815 lt!249323)))))

(assert (=> d!82339 (= lt!249323 e!315838)))

(declare-fun c!63459 () Bool)

(assert (=> d!82339 (= c!63459 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249322 () (_ BitVec 64))

(assert (=> d!82339 (= lt!249322 (select (arr!16545 a!3154) index!1177))))

(assert (=> d!82339 (validMask!0 mask!3216)))

(assert (=> d!82339 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16545 a!3154) j!147) a!3154 mask!3216) lt!249323)))

(declare-fun b!546446 () Bool)

(assert (=> b!546446 (= e!315838 e!315841)))

(declare-fun c!63461 () Bool)

(assert (=> b!546446 (= c!63461 (or (= lt!249322 (select (arr!16545 a!3154) j!147)) (= (bvadd lt!249322 lt!249322) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546447 () Bool)

(assert (=> b!546447 (and (bvsge (index!22238 lt!249323) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249323) (size!16909 a!3154)))))

(declare-fun res!340180 () Bool)

(assert (=> b!546447 (= res!340180 (= (select (arr!16545 a!3154) (index!22238 lt!249323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546447 (=> res!340180 e!315837)))

(declare-fun b!546448 () Bool)

(assert (=> b!546448 (= e!315840 (bvsge (x!51163 lt!249323) #b01111111111111111111111111111110))))

(declare-fun b!546449 () Bool)

(assert (=> b!546449 (and (bvsge (index!22238 lt!249323) #b00000000000000000000000000000000) (bvslt (index!22238 lt!249323) (size!16909 a!3154)))))

(declare-fun res!340179 () Bool)

(assert (=> b!546449 (= res!340179 (= (select (arr!16545 a!3154) (index!22238 lt!249323)) (select (arr!16545 a!3154) j!147)))))

(assert (=> b!546449 (=> res!340179 e!315837)))

(assert (=> b!546449 (= e!315839 e!315837)))

(assert (= (and d!82339 c!63459) b!546441))

(assert (= (and d!82339 (not c!63459)) b!546446))

(assert (= (and b!546446 c!63461) b!546444))

(assert (= (and b!546446 (not c!63461)) b!546443))

(assert (= (and d!82339 c!63460) b!546448))

(assert (= (and d!82339 (not c!63460)) b!546445))

(assert (= (and b!546445 res!340181) b!546449))

(assert (= (and b!546449 (not res!340179)) b!546447))

(assert (= (and b!546447 (not res!340180)) b!546442))

(declare-fun m!523905 () Bool)

(assert (=> b!546442 m!523905))

(assert (=> b!546449 m!523905))

(assert (=> b!546447 m!523905))

(assert (=> d!82339 m!523629))

(assert (=> d!82339 m!523603))

(assert (=> b!546443 m!523601))

(assert (=> b!546443 m!523601))

(assert (=> b!546443 m!523593))

(declare-fun m!523907 () Bool)

(assert (=> b!546443 m!523907))

(assert (=> b!546048 d!82339))

(declare-fun b!546467 () Bool)

(declare-fun e!315853 () Bool)

(declare-fun call!32144 () Bool)

(assert (=> b!546467 (= e!315853 call!32144)))

(declare-fun b!546468 () Bool)

(declare-fun e!315854 () Bool)

(assert (=> b!546468 (= e!315853 e!315854)))

(declare-fun lt!249336 () (_ BitVec 64))

(assert (=> b!546468 (= lt!249336 (select (arr!16545 a!3154) #b00000000000000000000000000000000))))

(declare-fun lt!249335 () Unit!16940)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34433 (_ BitVec 64) (_ BitVec 32)) Unit!16940)

(assert (=> b!546468 (= lt!249335 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!249336 #b00000000000000000000000000000000))))

(assert (=> b!546468 (arrayContainsKey!0 a!3154 lt!249336 #b00000000000000000000000000000000)))

(declare-fun lt!249337 () Unit!16940)

(assert (=> b!546468 (= lt!249337 lt!249335)))

(declare-fun res!340190 () Bool)

(assert (=> b!546468 (= res!340190 (= (seekEntryOrOpen!0 (select (arr!16545 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!5003 #b00000000000000000000000000000000)))))

(assert (=> b!546468 (=> (not res!340190) (not e!315854))))

(declare-fun b!546469 () Bool)

(assert (=> b!546469 (= e!315854 call!32144)))

(declare-fun bm!32141 () Bool)

(assert (=> bm!32141 (= call!32144 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!82341 () Bool)

(declare-fun res!340189 () Bool)

(declare-fun e!315855 () Bool)

(assert (=> d!82341 (=> res!340189 e!315855)))

(assert (=> d!82341 (= res!340189 (bvsge #b00000000000000000000000000000000 (size!16909 a!3154)))))

(assert (=> d!82341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315855)))

(declare-fun b!546470 () Bool)

(assert (=> b!546470 (= e!315855 e!315853)))

(declare-fun c!63467 () Bool)

(assert (=> b!546470 (= c!63467 (validKeyInArray!0 (select (arr!16545 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82341 (not res!340189)) b!546470))

(assert (= (and b!546470 c!63467) b!546468))

(assert (= (and b!546470 (not c!63467)) b!546467))

(assert (= (and b!546468 res!340190) b!546469))

(assert (= (or b!546469 b!546467) bm!32141))

(assert (=> b!546468 m!523863))

(declare-fun m!523915 () Bool)

(assert (=> b!546468 m!523915))

(declare-fun m!523917 () Bool)

(assert (=> b!546468 m!523917))

(assert (=> b!546468 m!523863))

(declare-fun m!523919 () Bool)

(assert (=> b!546468 m!523919))

(declare-fun m!523921 () Bool)

(assert (=> bm!32141 m!523921))

(assert (=> b!546470 m!523863))

(assert (=> b!546470 m!523863))

(declare-fun m!523923 () Bool)

(assert (=> b!546470 m!523923))

(assert (=> b!546051 d!82341))

(declare-fun b!546481 () Bool)

(declare-fun e!315865 () Bool)

(declare-fun e!315866 () Bool)

(assert (=> b!546481 (= e!315865 e!315866)))

(declare-fun c!63470 () Bool)

(assert (=> b!546481 (= c!63470 (validKeyInArray!0 (select (arr!16545 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82351 () Bool)

(declare-fun res!340197 () Bool)

(declare-fun e!315867 () Bool)

(assert (=> d!82351 (=> res!340197 e!315867)))

(assert (=> d!82351 (= res!340197 (bvsge #b00000000000000000000000000000000 (size!16909 a!3154)))))

(assert (=> d!82351 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10661) e!315867)))

(declare-fun b!546482 () Bool)

(declare-fun call!32147 () Bool)

(assert (=> b!546482 (= e!315866 call!32147)))

(declare-fun b!546483 () Bool)

(assert (=> b!546483 (= e!315866 call!32147)))

(declare-fun bm!32144 () Bool)

(assert (=> bm!32144 (= call!32147 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63470 (Cons!10660 (select (arr!16545 a!3154) #b00000000000000000000000000000000) Nil!10661) Nil!10661)))))

(declare-fun b!546484 () Bool)

(declare-fun e!315864 () Bool)

(declare-fun contains!2815 (List!10664 (_ BitVec 64)) Bool)

(assert (=> b!546484 (= e!315864 (contains!2815 Nil!10661 (select (arr!16545 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546485 () Bool)

(assert (=> b!546485 (= e!315867 e!315865)))

(declare-fun res!340199 () Bool)

(assert (=> b!546485 (=> (not res!340199) (not e!315865))))

(assert (=> b!546485 (= res!340199 (not e!315864))))

(declare-fun res!340198 () Bool)

(assert (=> b!546485 (=> (not res!340198) (not e!315864))))

(assert (=> b!546485 (= res!340198 (validKeyInArray!0 (select (arr!16545 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82351 (not res!340197)) b!546485))

(assert (= (and b!546485 res!340198) b!546484))

(assert (= (and b!546485 res!340199) b!546481))

(assert (= (and b!546481 c!63470) b!546483))

(assert (= (and b!546481 (not c!63470)) b!546482))

(assert (= (or b!546483 b!546482) bm!32144))

(assert (=> b!546481 m!523863))

(assert (=> b!546481 m!523863))

(assert (=> b!546481 m!523923))

(assert (=> bm!32144 m!523863))

(declare-fun m!523925 () Bool)

(assert (=> bm!32144 m!523925))

(assert (=> b!546484 m!523863))

(assert (=> b!546484 m!523863))

(declare-fun m!523927 () Bool)

(assert (=> b!546484 m!523927))

(assert (=> b!546485 m!523863))

(assert (=> b!546485 m!523863))

(assert (=> b!546485 m!523923))

(assert (=> b!546052 d!82351))

(push 1)

(assert (not d!82319))

(assert (not b!546395))

(assert (not d!82313))

(assert (not b!546481))

(assert (not bm!32141))

(assert (not d!82339))

(assert (not b!546360))

(assert (not b!546470))

(assert (not d!82275))

(assert (not b!546484))

(assert (not b!546443))

(assert (not b!546468))

(assert (not d!82323))

(assert (not b!546260))

(assert (not b!546251))

(assert (not d!82297))

(assert (not b!546386))

(assert (not d!82321))

(assert (not d!82295))

(assert (not b!546383))

(assert (not bm!32144))

(assert (not b!546485))

(assert (not b!546422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

