; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49312 () Bool)

(assert start!49312)

(declare-fun b!542486 () Bool)

(declare-fun e!314045 () Bool)

(assert (=> b!542486 (= e!314045 false)))

(declare-fun lt!247993 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542486 (= lt!247993 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!542487 () Bool)

(declare-fun e!314043 () Bool)

(assert (=> b!542487 (= e!314043 e!314045)))

(declare-fun res!336934 () Bool)

(assert (=> b!542487 (=> (not res!336934) (not e!314045))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4879 0))(
  ( (MissingZero!4879 (index!21740 (_ BitVec 32))) (Found!4879 (index!21741 (_ BitVec 32))) (Intermediate!4879 (undefined!5691 Bool) (index!21742 (_ BitVec 32)) (x!50809 (_ BitVec 32))) (Undefined!4879) (MissingVacant!4879 (index!21743 (_ BitVec 32))) )
))
(declare-fun lt!247991 () SeekEntryResult!4879)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542487 (= res!336934 (= lt!247991 (Intermediate!4879 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34268 0))(
  ( (array!34269 (arr!16465 (Array (_ BitVec 32) (_ BitVec 64))) (size!16829 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34268)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34268 (_ BitVec 32)) SeekEntryResult!4879)

(assert (=> b!542487 (= lt!247991 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16465 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542488 () Bool)

(declare-fun res!336941 () Bool)

(declare-fun e!314044 () Bool)

(assert (=> b!542488 (=> (not res!336941) (not e!314044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542488 (= res!336941 (validKeyInArray!0 (select (arr!16465 a!3154) j!147)))))

(declare-fun b!542489 () Bool)

(assert (=> b!542489 (= e!314044 e!314043)))

(declare-fun res!336936 () Bool)

(assert (=> b!542489 (=> (not res!336936) (not e!314043))))

(declare-fun lt!247992 () SeekEntryResult!4879)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542489 (= res!336936 (or (= lt!247992 (MissingZero!4879 i!1153)) (= lt!247992 (MissingVacant!4879 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34268 (_ BitVec 32)) SeekEntryResult!4879)

(assert (=> b!542489 (= lt!247992 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542490 () Bool)

(declare-fun res!336935 () Bool)

(assert (=> b!542490 (=> (not res!336935) (not e!314045))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542490 (= res!336935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16465 a!3154) j!147) mask!3216) (select (arr!16465 a!3154) j!147) a!3154 mask!3216) lt!247991))))

(declare-fun b!542491 () Bool)

(declare-fun res!336932 () Bool)

(assert (=> b!542491 (=> (not res!336932) (not e!314044))))

(declare-fun arrayContainsKey!0 (array!34268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542491 (= res!336932 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542492 () Bool)

(declare-fun res!336940 () Bool)

(assert (=> b!542492 (=> (not res!336940) (not e!314043))))

(declare-datatypes ((List!10491 0))(
  ( (Nil!10488) (Cons!10487 (h!11445 (_ BitVec 64)) (t!16711 List!10491)) )
))
(declare-fun arrayNoDuplicates!0 (array!34268 (_ BitVec 32) List!10491) Bool)

(assert (=> b!542492 (= res!336940 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10488))))

(declare-fun res!336943 () Bool)

(assert (=> start!49312 (=> (not res!336943) (not e!314044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49312 (= res!336943 (validMask!0 mask!3216))))

(assert (=> start!49312 e!314044))

(assert (=> start!49312 true))

(declare-fun array_inv!12324 (array!34268) Bool)

(assert (=> start!49312 (array_inv!12324 a!3154)))

(declare-fun b!542493 () Bool)

(declare-fun res!336937 () Bool)

(assert (=> b!542493 (=> (not res!336937) (not e!314044))))

(assert (=> b!542493 (= res!336937 (and (= (size!16829 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16829 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16829 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542494 () Bool)

(declare-fun res!336939 () Bool)

(assert (=> b!542494 (=> (not res!336939) (not e!314043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34268 (_ BitVec 32)) Bool)

(assert (=> b!542494 (= res!336939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542495 () Bool)

(declare-fun res!336942 () Bool)

(assert (=> b!542495 (=> (not res!336942) (not e!314044))))

(assert (=> b!542495 (= res!336942 (validKeyInArray!0 k0!1998))))

(declare-fun b!542496 () Bool)

(declare-fun res!336933 () Bool)

(assert (=> b!542496 (=> (not res!336933) (not e!314045))))

(assert (=> b!542496 (= res!336933 (and (not (= (select (arr!16465 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16465 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16465 a!3154) index!1177) (select (arr!16465 a!3154) j!147)))))))

(declare-fun b!542497 () Bool)

(declare-fun res!336938 () Bool)

(assert (=> b!542497 (=> (not res!336938) (not e!314043))))

(assert (=> b!542497 (= res!336938 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16829 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16829 a!3154)) (= (select (arr!16465 a!3154) resIndex!32) (select (arr!16465 a!3154) j!147))))))

(assert (= (and start!49312 res!336943) b!542493))

(assert (= (and b!542493 res!336937) b!542488))

(assert (= (and b!542488 res!336941) b!542495))

(assert (= (and b!542495 res!336942) b!542491))

(assert (= (and b!542491 res!336932) b!542489))

(assert (= (and b!542489 res!336936) b!542494))

(assert (= (and b!542494 res!336939) b!542492))

(assert (= (and b!542492 res!336940) b!542497))

(assert (= (and b!542497 res!336938) b!542487))

(assert (= (and b!542487 res!336934) b!542490))

(assert (= (and b!542490 res!336935) b!542496))

(assert (= (and b!542496 res!336933) b!542486))

(declare-fun m!520891 () Bool)

(assert (=> b!542490 m!520891))

(assert (=> b!542490 m!520891))

(declare-fun m!520893 () Bool)

(assert (=> b!542490 m!520893))

(assert (=> b!542490 m!520893))

(assert (=> b!542490 m!520891))

(declare-fun m!520895 () Bool)

(assert (=> b!542490 m!520895))

(declare-fun m!520897 () Bool)

(assert (=> b!542495 m!520897))

(assert (=> b!542487 m!520891))

(assert (=> b!542487 m!520891))

(declare-fun m!520899 () Bool)

(assert (=> b!542487 m!520899))

(declare-fun m!520901 () Bool)

(assert (=> start!49312 m!520901))

(declare-fun m!520903 () Bool)

(assert (=> start!49312 m!520903))

(assert (=> b!542488 m!520891))

(assert (=> b!542488 m!520891))

(declare-fun m!520905 () Bool)

(assert (=> b!542488 m!520905))

(declare-fun m!520907 () Bool)

(assert (=> b!542497 m!520907))

(assert (=> b!542497 m!520891))

(declare-fun m!520909 () Bool)

(assert (=> b!542491 m!520909))

(declare-fun m!520911 () Bool)

(assert (=> b!542494 m!520911))

(declare-fun m!520913 () Bool)

(assert (=> b!542496 m!520913))

(assert (=> b!542496 m!520891))

(declare-fun m!520915 () Bool)

(assert (=> b!542489 m!520915))

(declare-fun m!520917 () Bool)

(assert (=> b!542486 m!520917))

(declare-fun m!520919 () Bool)

(assert (=> b!542492 m!520919))

(check-sat (not b!542490) (not b!542487) (not b!542486) (not start!49312) (not b!542492) (not b!542494) (not b!542488) (not b!542495) (not b!542489) (not b!542491))
(check-sat)
