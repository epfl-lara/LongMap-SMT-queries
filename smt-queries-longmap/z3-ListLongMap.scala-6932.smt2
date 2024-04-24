; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87502 () Bool)

(assert start!87502)

(declare-fun res!679983 () Bool)

(declare-fun e!569907 () Bool)

(assert (=> start!87502 (=> (not res!679983) (not e!569907))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87502 (= res!679983 (validMask!0 mask!3464))))

(assert (=> start!87502 e!569907))

(declare-datatypes ((array!63717 0))(
  ( (array!63718 (arr!30667 (Array (_ BitVec 32) (_ BitVec 64))) (size!31170 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63717)

(declare-fun array_inv!23803 (array!63717) Bool)

(assert (=> start!87502 (array_inv!23803 a!3219)))

(assert (=> start!87502 true))

(declare-fun b!1012836 () Bool)

(declare-fun res!679984 () Bool)

(declare-fun e!569905 () Bool)

(assert (=> b!1012836 (=> (not res!679984) (not e!569905))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1012836 (= res!679984 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1012837 () Bool)

(declare-fun e!569900 () Bool)

(assert (=> b!1012837 (= e!569900 e!569905)))

(declare-fun res!679972 () Bool)

(assert (=> b!1012837 (=> (not res!679972) (not e!569905))))

(declare-fun lt!447561 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9535 0))(
  ( (MissingZero!9535 (index!40511 (_ BitVec 32))) (Found!9535 (index!40512 (_ BitVec 32))) (Intermediate!9535 (undefined!10347 Bool) (index!40513 (_ BitVec 32)) (x!88091 (_ BitVec 32))) (Undefined!9535) (MissingVacant!9535 (index!40514 (_ BitVec 32))) )
))
(declare-fun lt!447562 () SeekEntryResult!9535)

(declare-fun lt!447564 () array!63717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63717 (_ BitVec 32)) SeekEntryResult!9535)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012837 (= res!679972 (not (= lt!447562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447561 mask!3464) lt!447561 lt!447564 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1012837 (= lt!447561 (select (store (arr!30667 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1012837 (= lt!447564 (array!63718 (store (arr!30667 a!3219) i!1194 k0!2224) (size!31170 a!3219)))))

(declare-fun b!1012838 () Bool)

(declare-fun res!679981 () Bool)

(assert (=> b!1012838 (=> (not res!679981) (not e!569907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1012838 (= res!679981 (validKeyInArray!0 (select (arr!30667 a!3219) j!170)))))

(declare-fun b!1012839 () Bool)

(declare-fun res!679979 () Bool)

(assert (=> b!1012839 (=> (not res!679979) (not e!569905))))

(declare-fun lt!447559 () SeekEntryResult!9535)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1012839 (= res!679979 (not (= lt!447559 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447561 lt!447564 mask!3464))))))

(declare-fun b!1012840 () Bool)

(declare-fun res!679969 () Bool)

(declare-fun e!569903 () Bool)

(assert (=> b!1012840 (=> (not res!679969) (not e!569903))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1012840 (= res!679969 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31170 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31170 a!3219))))))

(declare-fun b!1012841 () Bool)

(declare-fun res!679976 () Bool)

(assert (=> b!1012841 (=> (not res!679976) (not e!569903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63717 (_ BitVec 32)) Bool)

(assert (=> b!1012841 (= res!679976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1012842 () Bool)

(declare-fun e!569906 () Bool)

(assert (=> b!1012842 (= e!569903 e!569906)))

(declare-fun res!679982 () Bool)

(assert (=> b!1012842 (=> (not res!679982) (not e!569906))))

(declare-fun lt!447565 () SeekEntryResult!9535)

(assert (=> b!1012842 (= res!679982 (= lt!447562 lt!447565))))

(assert (=> b!1012842 (= lt!447565 (Intermediate!9535 false resIndex!38 resX!38))))

(assert (=> b!1012842 (= lt!447562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30667 a!3219) j!170) mask!3464) (select (arr!30667 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012843 () Bool)

(declare-fun e!569904 () Bool)

(assert (=> b!1012843 (= e!569904 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1245)) (bvsub #b01111111111111111111111111111110 x!1245)))))

(declare-fun b!1012844 () Bool)

(assert (=> b!1012844 (= e!569906 e!569900)))

(declare-fun res!679980 () Bool)

(assert (=> b!1012844 (=> (not res!679980) (not e!569900))))

(assert (=> b!1012844 (= res!679980 (= lt!447559 lt!447565))))

(assert (=> b!1012844 (= lt!447559 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30667 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012845 () Bool)

(declare-fun res!679970 () Bool)

(assert (=> b!1012845 (=> (not res!679970) (not e!569907))))

(assert (=> b!1012845 (= res!679970 (and (= (size!31170 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31170 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31170 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1012846 () Bool)

(declare-fun res!679975 () Bool)

(assert (=> b!1012846 (=> (not res!679975) (not e!569904))))

(declare-fun lt!447560 () (_ BitVec 32))

(declare-fun lt!447566 () SeekEntryResult!9535)

(assert (=> b!1012846 (= res!679975 (not (= lt!447566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447560 lt!447561 lt!447564 mask!3464))))))

(declare-fun b!1012847 () Bool)

(declare-fun e!569902 () Bool)

(assert (=> b!1012847 (= e!569905 e!569902)))

(declare-fun res!679971 () Bool)

(assert (=> b!1012847 (=> (not res!679971) (not e!569902))))

(assert (=> b!1012847 (= res!679971 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447560 #b00000000000000000000000000000000) (bvslt lt!447560 (size!31170 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012847 (= lt!447560 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1012848 () Bool)

(assert (=> b!1012848 (= e!569907 e!569903)))

(declare-fun res!679985 () Bool)

(assert (=> b!1012848 (=> (not res!679985) (not e!569903))))

(declare-fun lt!447563 () SeekEntryResult!9535)

(assert (=> b!1012848 (= res!679985 (or (= lt!447563 (MissingVacant!9535 i!1194)) (= lt!447563 (MissingZero!9535 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63717 (_ BitVec 32)) SeekEntryResult!9535)

(assert (=> b!1012848 (= lt!447563 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1012849 () Bool)

(declare-fun res!679973 () Bool)

(assert (=> b!1012849 (=> (not res!679973) (not e!569907))))

(assert (=> b!1012849 (= res!679973 (validKeyInArray!0 k0!2224))))

(declare-fun b!1012850 () Bool)

(declare-fun res!679974 () Bool)

(assert (=> b!1012850 (=> (not res!679974) (not e!569907))))

(declare-fun arrayContainsKey!0 (array!63717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1012850 (= res!679974 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1012851 () Bool)

(assert (=> b!1012851 (= e!569902 e!569904)))

(declare-fun res!679978 () Bool)

(assert (=> b!1012851 (=> (not res!679978) (not e!569904))))

(assert (=> b!1012851 (= res!679978 (= lt!447566 lt!447565))))

(assert (=> b!1012851 (= lt!447566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447560 (select (arr!30667 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012852 () Bool)

(declare-fun res!679977 () Bool)

(assert (=> b!1012852 (=> (not res!679977) (not e!569903))))

(declare-datatypes ((List!21314 0))(
  ( (Nil!21311) (Cons!21310 (h!22517 (_ BitVec 64)) (t!30307 List!21314)) )
))
(declare-fun arrayNoDuplicates!0 (array!63717 (_ BitVec 32) List!21314) Bool)

(assert (=> b!1012852 (= res!679977 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21311))))

(assert (= (and start!87502 res!679983) b!1012845))

(assert (= (and b!1012845 res!679970) b!1012838))

(assert (= (and b!1012838 res!679981) b!1012849))

(assert (= (and b!1012849 res!679973) b!1012850))

(assert (= (and b!1012850 res!679974) b!1012848))

(assert (= (and b!1012848 res!679985) b!1012841))

(assert (= (and b!1012841 res!679976) b!1012852))

(assert (= (and b!1012852 res!679977) b!1012840))

(assert (= (and b!1012840 res!679969) b!1012842))

(assert (= (and b!1012842 res!679982) b!1012844))

(assert (= (and b!1012844 res!679980) b!1012837))

(assert (= (and b!1012837 res!679972) b!1012839))

(assert (= (and b!1012839 res!679979) b!1012836))

(assert (= (and b!1012836 res!679984) b!1012847))

(assert (= (and b!1012847 res!679971) b!1012851))

(assert (= (and b!1012851 res!679978) b!1012846))

(assert (= (and b!1012846 res!679975) b!1012843))

(declare-fun m!937139 () Bool)

(assert (=> b!1012848 m!937139))

(declare-fun m!937141 () Bool)

(assert (=> b!1012852 m!937141))

(declare-fun m!937143 () Bool)

(assert (=> b!1012847 m!937143))

(declare-fun m!937145 () Bool)

(assert (=> start!87502 m!937145))

(declare-fun m!937147 () Bool)

(assert (=> start!87502 m!937147))

(declare-fun m!937149 () Bool)

(assert (=> b!1012851 m!937149))

(assert (=> b!1012851 m!937149))

(declare-fun m!937151 () Bool)

(assert (=> b!1012851 m!937151))

(declare-fun m!937153 () Bool)

(assert (=> b!1012837 m!937153))

(assert (=> b!1012837 m!937153))

(declare-fun m!937155 () Bool)

(assert (=> b!1012837 m!937155))

(declare-fun m!937157 () Bool)

(assert (=> b!1012837 m!937157))

(declare-fun m!937159 () Bool)

(assert (=> b!1012837 m!937159))

(declare-fun m!937161 () Bool)

(assert (=> b!1012841 m!937161))

(assert (=> b!1012844 m!937149))

(assert (=> b!1012844 m!937149))

(declare-fun m!937163 () Bool)

(assert (=> b!1012844 m!937163))

(declare-fun m!937165 () Bool)

(assert (=> b!1012849 m!937165))

(declare-fun m!937167 () Bool)

(assert (=> b!1012846 m!937167))

(declare-fun m!937169 () Bool)

(assert (=> b!1012839 m!937169))

(assert (=> b!1012838 m!937149))

(assert (=> b!1012838 m!937149))

(declare-fun m!937171 () Bool)

(assert (=> b!1012838 m!937171))

(assert (=> b!1012842 m!937149))

(assert (=> b!1012842 m!937149))

(declare-fun m!937173 () Bool)

(assert (=> b!1012842 m!937173))

(assert (=> b!1012842 m!937173))

(assert (=> b!1012842 m!937149))

(declare-fun m!937175 () Bool)

(assert (=> b!1012842 m!937175))

(declare-fun m!937177 () Bool)

(assert (=> b!1012850 m!937177))

(check-sat (not b!1012849) (not b!1012852) (not start!87502) (not b!1012848) (not b!1012844) (not b!1012851) (not b!1012841) (not b!1012839) (not b!1012850) (not b!1012847) (not b!1012842) (not b!1012838) (not b!1012837) (not b!1012846))
(check-sat)
