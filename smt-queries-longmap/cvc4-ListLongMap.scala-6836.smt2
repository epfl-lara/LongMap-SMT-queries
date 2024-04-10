; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86058 () Bool)

(assert start!86058)

(declare-fun b!996882 () Bool)

(declare-fun res!667002 () Bool)

(declare-fun e!562340 () Bool)

(assert (=> b!996882 (=> (not res!667002) (not e!562340))))

(declare-datatypes ((array!63063 0))(
  ( (array!63064 (arr!30363 (Array (_ BitVec 32) (_ BitVec 64))) (size!30865 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63063)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!996882 (= res!667002 (and (= (size!30865 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30865 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30865 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996883 () Bool)

(declare-fun res!667003 () Bool)

(assert (=> b!996883 (=> (not res!667003) (not e!562340))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996883 (= res!667003 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!667004 () Bool)

(assert (=> start!86058 (=> (not res!667004) (not e!562340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86058 (= res!667004 (validMask!0 mask!3464))))

(assert (=> start!86058 e!562340))

(declare-fun array_inv!23487 (array!63063) Bool)

(assert (=> start!86058 (array_inv!23487 a!3219)))

(assert (=> start!86058 true))

(declare-fun b!996884 () Bool)

(declare-fun e!562342 () Bool)

(assert (=> b!996884 (= e!562340 e!562342)))

(declare-fun res!666998 () Bool)

(assert (=> b!996884 (=> (not res!666998) (not e!562342))))

(declare-datatypes ((SeekEntryResult!9295 0))(
  ( (MissingZero!9295 (index!39551 (_ BitVec 32))) (Found!9295 (index!39552 (_ BitVec 32))) (Intermediate!9295 (undefined!10107 Bool) (index!39553 (_ BitVec 32)) (x!86979 (_ BitVec 32))) (Undefined!9295) (MissingVacant!9295 (index!39554 (_ BitVec 32))) )
))
(declare-fun lt!441302 () SeekEntryResult!9295)

(assert (=> b!996884 (= res!666998 (or (= lt!441302 (MissingVacant!9295 i!1194)) (= lt!441302 (MissingZero!9295 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63063 (_ BitVec 32)) SeekEntryResult!9295)

(assert (=> b!996884 (= lt!441302 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996885 () Bool)

(declare-fun res!666996 () Bool)

(assert (=> b!996885 (=> (not res!666996) (not e!562342))))

(declare-datatypes ((List!21039 0))(
  ( (Nil!21036) (Cons!21035 (h!22200 (_ BitVec 64)) (t!30040 List!21039)) )
))
(declare-fun arrayNoDuplicates!0 (array!63063 (_ BitVec 32) List!21039) Bool)

(assert (=> b!996885 (= res!666996 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21036))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!996886 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996886 (= e!562342 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!996887 () Bool)

(declare-fun res!667005 () Bool)

(assert (=> b!996887 (=> (not res!667005) (not e!562340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996887 (= res!667005 (validKeyInArray!0 (select (arr!30363 a!3219) j!170)))))

(declare-fun b!996888 () Bool)

(declare-fun res!667000 () Bool)

(assert (=> b!996888 (=> (not res!667000) (not e!562342))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996888 (= res!667000 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30865 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30865 a!3219))))))

(declare-fun b!996889 () Bool)

(declare-fun res!666997 () Bool)

(assert (=> b!996889 (=> (not res!666997) (not e!562340))))

(assert (=> b!996889 (= res!666997 (validKeyInArray!0 k!2224))))

(declare-fun b!996890 () Bool)

(declare-fun res!667001 () Bool)

(assert (=> b!996890 (=> (not res!667001) (not e!562342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63063 (_ BitVec 32)) Bool)

(assert (=> b!996890 (= res!667001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996891 () Bool)

(declare-fun res!666999 () Bool)

(assert (=> b!996891 (=> (not res!666999) (not e!562342))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63063 (_ BitVec 32)) SeekEntryResult!9295)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996891 (= res!666999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30363 a!3219) j!170) mask!3464) (select (arr!30363 a!3219) j!170) a!3219 mask!3464) (Intermediate!9295 false resIndex!38 resX!38)))))

(assert (= (and start!86058 res!667004) b!996882))

(assert (= (and b!996882 res!667002) b!996887))

(assert (= (and b!996887 res!667005) b!996889))

(assert (= (and b!996889 res!666997) b!996883))

(assert (= (and b!996883 res!667003) b!996884))

(assert (= (and b!996884 res!666998) b!996890))

(assert (= (and b!996890 res!667001) b!996885))

(assert (= (and b!996885 res!666996) b!996888))

(assert (= (and b!996888 res!667000) b!996891))

(assert (= (and b!996891 res!666999) b!996886))

(declare-fun m!923893 () Bool)

(assert (=> start!86058 m!923893))

(declare-fun m!923895 () Bool)

(assert (=> start!86058 m!923895))

(declare-fun m!923897 () Bool)

(assert (=> b!996887 m!923897))

(assert (=> b!996887 m!923897))

(declare-fun m!923899 () Bool)

(assert (=> b!996887 m!923899))

(declare-fun m!923901 () Bool)

(assert (=> b!996890 m!923901))

(declare-fun m!923903 () Bool)

(assert (=> b!996884 m!923903))

(assert (=> b!996891 m!923897))

(assert (=> b!996891 m!923897))

(declare-fun m!923905 () Bool)

(assert (=> b!996891 m!923905))

(assert (=> b!996891 m!923905))

(assert (=> b!996891 m!923897))

(declare-fun m!923907 () Bool)

(assert (=> b!996891 m!923907))

(declare-fun m!923909 () Bool)

(assert (=> b!996883 m!923909))

(declare-fun m!923911 () Bool)

(assert (=> b!996885 m!923911))

(declare-fun m!923913 () Bool)

(assert (=> b!996889 m!923913))

(push 1)

(assert (not b!996889))

(assert (not b!996883))

(assert (not b!996885))

(assert (not start!86058))

(assert (not b!996884))

(assert (not b!996891))

(assert (not b!996890))

(assert (not b!996887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

