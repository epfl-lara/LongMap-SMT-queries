; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48844 () Bool)

(assert start!48844)

(declare-fun b!537938 () Bool)

(declare-fun res!333149 () Bool)

(declare-fun e!311994 () Bool)

(assert (=> b!537938 (=> (not res!333149) (not e!311994))))

(declare-datatypes ((array!34056 0))(
  ( (array!34057 (arr!16367 (Array (_ BitVec 32) (_ BitVec 64))) (size!16731 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34056)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537938 (= res!333149 (validKeyInArray!0 (select (arr!16367 a!3154) j!147)))))

(declare-fun b!537939 () Bool)

(declare-fun e!311991 () Bool)

(declare-fun e!311993 () Bool)

(assert (=> b!537939 (= e!311991 e!311993)))

(declare-fun res!333152 () Bool)

(assert (=> b!537939 (=> (not res!333152) (not e!311993))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4825 0))(
  ( (MissingZero!4825 (index!21524 (_ BitVec 32))) (Found!4825 (index!21525 (_ BitVec 32))) (Intermediate!4825 (undefined!5637 Bool) (index!21526 (_ BitVec 32)) (x!50448 (_ BitVec 32))) (Undefined!4825) (MissingVacant!4825 (index!21527 (_ BitVec 32))) )
))
(declare-fun lt!246556 () SeekEntryResult!4825)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537939 (= res!333152 (= lt!246556 (Intermediate!4825 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34056 (_ BitVec 32)) SeekEntryResult!4825)

(assert (=> b!537939 (= lt!246556 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16367 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537940 () Bool)

(assert (=> b!537940 (= e!311994 e!311991)))

(declare-fun res!333143 () Bool)

(assert (=> b!537940 (=> (not res!333143) (not e!311991))))

(declare-fun lt!246559 () SeekEntryResult!4825)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537940 (= res!333143 (or (= lt!246559 (MissingZero!4825 i!1153)) (= lt!246559 (MissingVacant!4825 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34056 (_ BitVec 32)) SeekEntryResult!4825)

(assert (=> b!537940 (= lt!246559 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537941 () Bool)

(declare-fun res!333148 () Bool)

(assert (=> b!537941 (=> (not res!333148) (not e!311993))))

(assert (=> b!537941 (= res!333148 (and (not (= (select (arr!16367 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16367 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16367 a!3154) index!1177) (select (arr!16367 a!3154) j!147)))))))

(declare-fun b!537943 () Bool)

(declare-fun res!333145 () Bool)

(assert (=> b!537943 (=> (not res!333145) (not e!311991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34056 (_ BitVec 32)) Bool)

(assert (=> b!537943 (= res!333145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537944 () Bool)

(declare-fun res!333150 () Bool)

(assert (=> b!537944 (=> (not res!333150) (not e!311994))))

(assert (=> b!537944 (= res!333150 (validKeyInArray!0 k!1998))))

(declare-fun b!537945 () Bool)

(declare-fun e!311990 () Bool)

(assert (=> b!537945 (= e!311990 false)))

(declare-fun lt!246557 () SeekEntryResult!4825)

(declare-fun lt!246558 () (_ BitVec 32))

(assert (=> b!537945 (= lt!246557 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246558 (select (arr!16367 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537946 () Bool)

(declare-fun res!333147 () Bool)

(assert (=> b!537946 (=> (not res!333147) (not e!311994))))

(assert (=> b!537946 (= res!333147 (and (= (size!16731 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16731 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16731 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!333154 () Bool)

(assert (=> start!48844 (=> (not res!333154) (not e!311994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48844 (= res!333154 (validMask!0 mask!3216))))

(assert (=> start!48844 e!311994))

(assert (=> start!48844 true))

(declare-fun array_inv!12163 (array!34056) Bool)

(assert (=> start!48844 (array_inv!12163 a!3154)))

(declare-fun b!537942 () Bool)

(declare-fun res!333155 () Bool)

(assert (=> b!537942 (=> (not res!333155) (not e!311991))))

(declare-datatypes ((List!10486 0))(
  ( (Nil!10483) (Cons!10482 (h!11425 (_ BitVec 64)) (t!16714 List!10486)) )
))
(declare-fun arrayNoDuplicates!0 (array!34056 (_ BitVec 32) List!10486) Bool)

(assert (=> b!537942 (= res!333155 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10483))))

(declare-fun b!537947 () Bool)

(declare-fun res!333151 () Bool)

(assert (=> b!537947 (=> (not res!333151) (not e!311991))))

(assert (=> b!537947 (= res!333151 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16731 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16731 a!3154)) (= (select (arr!16367 a!3154) resIndex!32) (select (arr!16367 a!3154) j!147))))))

(declare-fun b!537948 () Bool)

(assert (=> b!537948 (= e!311993 e!311990)))

(declare-fun res!333146 () Bool)

(assert (=> b!537948 (=> (not res!333146) (not e!311990))))

(assert (=> b!537948 (= res!333146 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246558 #b00000000000000000000000000000000) (bvslt lt!246558 (size!16731 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537948 (= lt!246558 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537949 () Bool)

(declare-fun res!333153 () Bool)

(assert (=> b!537949 (=> (not res!333153) (not e!311993))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537949 (= res!333153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16367 a!3154) j!147) mask!3216) (select (arr!16367 a!3154) j!147) a!3154 mask!3216) lt!246556))))

(declare-fun b!537950 () Bool)

(declare-fun res!333144 () Bool)

(assert (=> b!537950 (=> (not res!333144) (not e!311994))))

(declare-fun arrayContainsKey!0 (array!34056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537950 (= res!333144 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48844 res!333154) b!537946))

(assert (= (and b!537946 res!333147) b!537938))

(assert (= (and b!537938 res!333149) b!537944))

(assert (= (and b!537944 res!333150) b!537950))

(assert (= (and b!537950 res!333144) b!537940))

(assert (= (and b!537940 res!333143) b!537943))

(assert (= (and b!537943 res!333145) b!537942))

(assert (= (and b!537942 res!333155) b!537947))

(assert (= (and b!537947 res!333151) b!537939))

(assert (= (and b!537939 res!333152) b!537949))

(assert (= (and b!537949 res!333153) b!537941))

(assert (= (and b!537941 res!333148) b!537948))

(assert (= (and b!537948 res!333146) b!537945))

(declare-fun m!517081 () Bool)

(assert (=> start!48844 m!517081))

(declare-fun m!517083 () Bool)

(assert (=> start!48844 m!517083))

(declare-fun m!517085 () Bool)

(assert (=> b!537950 m!517085))

(declare-fun m!517087 () Bool)

(assert (=> b!537942 m!517087))

(declare-fun m!517089 () Bool)

(assert (=> b!537949 m!517089))

(assert (=> b!537949 m!517089))

(declare-fun m!517091 () Bool)

(assert (=> b!537949 m!517091))

(assert (=> b!537949 m!517091))

(assert (=> b!537949 m!517089))

(declare-fun m!517093 () Bool)

(assert (=> b!537949 m!517093))

(assert (=> b!537938 m!517089))

(assert (=> b!537938 m!517089))

(declare-fun m!517095 () Bool)

(assert (=> b!537938 m!517095))

(assert (=> b!537945 m!517089))

(assert (=> b!537945 m!517089))

(declare-fun m!517097 () Bool)

(assert (=> b!537945 m!517097))

(declare-fun m!517099 () Bool)

(assert (=> b!537944 m!517099))

(declare-fun m!517101 () Bool)

(assert (=> b!537941 m!517101))

(assert (=> b!537941 m!517089))

(declare-fun m!517103 () Bool)

(assert (=> b!537948 m!517103))

(declare-fun m!517105 () Bool)

(assert (=> b!537947 m!517105))

(assert (=> b!537947 m!517089))

(declare-fun m!517107 () Bool)

(assert (=> b!537943 m!517107))

(assert (=> b!537939 m!517089))

(assert (=> b!537939 m!517089))

(declare-fun m!517109 () Bool)

(assert (=> b!537939 m!517109))

(declare-fun m!517111 () Bool)

(assert (=> b!537940 m!517111))

(push 1)

(assert (not b!537945))

(assert (not b!537940))

(assert (not b!537944))

(assert (not b!537939))

(assert (not b!537943))

(assert (not b!537948))

