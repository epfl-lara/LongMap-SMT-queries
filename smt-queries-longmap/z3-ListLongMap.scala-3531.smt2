; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48744 () Bool)

(assert start!48744)

(declare-fun b!535951 () Bool)

(declare-fun res!331310 () Bool)

(declare-fun e!311158 () Bool)

(assert (=> b!535951 (=> (not res!331310) (not e!311158))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33966 0))(
  ( (array!33967 (arr!16322 (Array (_ BitVec 32) (_ BitVec 64))) (size!16687 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33966)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535951 (= res!331310 (and (= (size!16687 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16687 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16687 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535952 () Bool)

(declare-fun e!311156 () Bool)

(declare-fun e!311157 () Bool)

(assert (=> b!535952 (= e!311156 e!311157)))

(declare-fun res!331303 () Bool)

(assert (=> b!535952 (=> (not res!331303) (not e!311157))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4777 0))(
  ( (MissingZero!4777 (index!21332 (_ BitVec 32))) (Found!4777 (index!21333 (_ BitVec 32))) (Intermediate!4777 (undefined!5589 Bool) (index!21334 (_ BitVec 32)) (x!50283 (_ BitVec 32))) (Undefined!4777) (MissingVacant!4777 (index!21335 (_ BitVec 32))) )
))
(declare-fun lt!245795 () SeekEntryResult!4777)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535952 (= res!331303 (= lt!245795 (Intermediate!4777 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33966 (_ BitVec 32)) SeekEntryResult!4777)

(assert (=> b!535952 (= lt!245795 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16322 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535953 () Bool)

(declare-fun res!331307 () Bool)

(assert (=> b!535953 (=> (not res!331307) (not e!311158))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535953 (= res!331307 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535954 () Bool)

(declare-fun res!331298 () Bool)

(assert (=> b!535954 (=> (not res!331298) (not e!311158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535954 (= res!331298 (validKeyInArray!0 k0!1998))))

(declare-fun b!535955 () Bool)

(declare-fun e!311160 () Bool)

(assert (=> b!535955 (= e!311157 e!311160)))

(declare-fun res!331300 () Bool)

(assert (=> b!535955 (=> (not res!331300) (not e!311160))))

(declare-fun lt!245796 () (_ BitVec 32))

(assert (=> b!535955 (= res!331300 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245796 #b00000000000000000000000000000000) (bvslt lt!245796 (size!16687 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535955 (= lt!245796 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535956 () Bool)

(declare-fun res!331299 () Bool)

(assert (=> b!535956 (=> (not res!331299) (not e!311157))))

(assert (=> b!535956 (= res!331299 (and (not (= (select (arr!16322 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16322 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16322 a!3154) index!1177) (select (arr!16322 a!3154) j!147)))))))

(declare-fun b!535957 () Bool)

(declare-fun res!331301 () Bool)

(assert (=> b!535957 (=> (not res!331301) (not e!311157))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535957 (= res!331301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16322 a!3154) j!147) mask!3216) (select (arr!16322 a!3154) j!147) a!3154 mask!3216) lt!245795))))

(declare-fun b!535958 () Bool)

(declare-fun res!331309 () Bool)

(assert (=> b!535958 (=> (not res!331309) (not e!311158))))

(assert (=> b!535958 (= res!331309 (validKeyInArray!0 (select (arr!16322 a!3154) j!147)))))

(declare-fun b!535959 () Bool)

(assert (=> b!535959 (= e!311158 e!311156)))

(declare-fun res!331302 () Bool)

(assert (=> b!535959 (=> (not res!331302) (not e!311156))))

(declare-fun lt!245797 () SeekEntryResult!4777)

(assert (=> b!535959 (= res!331302 (or (= lt!245797 (MissingZero!4777 i!1153)) (= lt!245797 (MissingVacant!4777 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33966 (_ BitVec 32)) SeekEntryResult!4777)

(assert (=> b!535959 (= lt!245797 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535960 () Bool)

(declare-fun res!331305 () Bool)

(assert (=> b!535960 (=> (not res!331305) (not e!311156))))

(declare-datatypes ((List!10480 0))(
  ( (Nil!10477) (Cons!10476 (h!11419 (_ BitVec 64)) (t!16699 List!10480)) )
))
(declare-fun arrayNoDuplicates!0 (array!33966 (_ BitVec 32) List!10480) Bool)

(assert (=> b!535960 (= res!331305 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10477))))

(declare-fun b!535961 () Bool)

(assert (=> b!535961 (= e!311160 false)))

(declare-fun lt!245794 () SeekEntryResult!4777)

(assert (=> b!535961 (= lt!245794 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245796 (select (arr!16322 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535962 () Bool)

(declare-fun res!331306 () Bool)

(assert (=> b!535962 (=> (not res!331306) (not e!311156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33966 (_ BitVec 32)) Bool)

(assert (=> b!535962 (= res!331306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535963 () Bool)

(declare-fun res!331308 () Bool)

(assert (=> b!535963 (=> (not res!331308) (not e!311156))))

(assert (=> b!535963 (= res!331308 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16687 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16687 a!3154)) (= (select (arr!16322 a!3154) resIndex!32) (select (arr!16322 a!3154) j!147))))))

(declare-fun res!331304 () Bool)

(assert (=> start!48744 (=> (not res!331304) (not e!311158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48744 (= res!331304 (validMask!0 mask!3216))))

(assert (=> start!48744 e!311158))

(assert (=> start!48744 true))

(declare-fun array_inv!12205 (array!33966) Bool)

(assert (=> start!48744 (array_inv!12205 a!3154)))

(assert (= (and start!48744 res!331304) b!535951))

(assert (= (and b!535951 res!331310) b!535958))

(assert (= (and b!535958 res!331309) b!535954))

(assert (= (and b!535954 res!331298) b!535953))

(assert (= (and b!535953 res!331307) b!535959))

(assert (= (and b!535959 res!331302) b!535962))

(assert (= (and b!535962 res!331306) b!535960))

(assert (= (and b!535960 res!331305) b!535963))

(assert (= (and b!535963 res!331308) b!535952))

(assert (= (and b!535952 res!331303) b!535957))

(assert (= (and b!535957 res!331301) b!535956))

(assert (= (and b!535956 res!331299) b!535955))

(assert (= (and b!535955 res!331300) b!535961))

(declare-fun m!514921 () Bool)

(assert (=> b!535961 m!514921))

(assert (=> b!535961 m!514921))

(declare-fun m!514923 () Bool)

(assert (=> b!535961 m!514923))

(declare-fun m!514925 () Bool)

(assert (=> b!535954 m!514925))

(declare-fun m!514927 () Bool)

(assert (=> start!48744 m!514927))

(declare-fun m!514929 () Bool)

(assert (=> start!48744 m!514929))

(declare-fun m!514931 () Bool)

(assert (=> b!535960 m!514931))

(declare-fun m!514933 () Bool)

(assert (=> b!535956 m!514933))

(assert (=> b!535956 m!514921))

(assert (=> b!535958 m!514921))

(assert (=> b!535958 m!514921))

(declare-fun m!514935 () Bool)

(assert (=> b!535958 m!514935))

(declare-fun m!514937 () Bool)

(assert (=> b!535959 m!514937))

(assert (=> b!535952 m!514921))

(assert (=> b!535952 m!514921))

(declare-fun m!514939 () Bool)

(assert (=> b!535952 m!514939))

(declare-fun m!514941 () Bool)

(assert (=> b!535963 m!514941))

(assert (=> b!535963 m!514921))

(assert (=> b!535957 m!514921))

(assert (=> b!535957 m!514921))

(declare-fun m!514943 () Bool)

(assert (=> b!535957 m!514943))

(assert (=> b!535957 m!514943))

(assert (=> b!535957 m!514921))

(declare-fun m!514945 () Bool)

(assert (=> b!535957 m!514945))

(declare-fun m!514947 () Bool)

(assert (=> b!535962 m!514947))

(declare-fun m!514949 () Bool)

(assert (=> b!535953 m!514949))

(declare-fun m!514951 () Bool)

(assert (=> b!535955 m!514951))

(check-sat (not b!535961) (not start!48744) (not b!535960) (not b!535957) (not b!535952) (not b!535954) (not b!535959) (not b!535953) (not b!535958) (not b!535955) (not b!535962))
(check-sat)
