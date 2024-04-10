; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86054 () Bool)

(assert start!86054)

(declare-fun b!996823 () Bool)

(declare-fun res!666942 () Bool)

(declare-fun e!562322 () Bool)

(assert (=> b!996823 (=> (not res!666942) (not e!562322))))

(declare-datatypes ((array!63059 0))(
  ( (array!63060 (arr!30361 (Array (_ BitVec 32) (_ BitVec 64))) (size!30863 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63059)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996823 (= res!666942 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30863 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30863 a!3219))))))

(declare-fun b!996824 () Bool)

(declare-fun res!666945 () Bool)

(assert (=> b!996824 (=> (not res!666945) (not e!562322))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63059 (_ BitVec 32)) Bool)

(assert (=> b!996824 (= res!666945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996825 () Bool)

(declare-fun res!666937 () Bool)

(declare-fun e!562324 () Bool)

(assert (=> b!996825 (=> (not res!666937) (not e!562324))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996825 (= res!666937 (validKeyInArray!0 k!2224))))

(declare-fun b!996826 () Bool)

(declare-fun res!666938 () Bool)

(assert (=> b!996826 (=> (not res!666938) (not e!562322))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9293 0))(
  ( (MissingZero!9293 (index!39543 (_ BitVec 32))) (Found!9293 (index!39544 (_ BitVec 32))) (Intermediate!9293 (undefined!10105 Bool) (index!39545 (_ BitVec 32)) (x!86977 (_ BitVec 32))) (Undefined!9293) (MissingVacant!9293 (index!39546 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63059 (_ BitVec 32)) SeekEntryResult!9293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996826 (= res!666938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30361 a!3219) j!170) mask!3464) (select (arr!30361 a!3219) j!170) a!3219 mask!3464) (Intermediate!9293 false resIndex!38 resX!38)))))

(declare-fun b!996827 () Bool)

(declare-fun res!666941 () Bool)

(assert (=> b!996827 (=> (not res!666941) (not e!562322))))

(declare-datatypes ((List!21037 0))(
  ( (Nil!21034) (Cons!21033 (h!22198 (_ BitVec 64)) (t!30038 List!21037)) )
))
(declare-fun arrayNoDuplicates!0 (array!63059 (_ BitVec 32) List!21037) Bool)

(assert (=> b!996827 (= res!666941 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21034))))

(declare-fun b!996828 () Bool)

(assert (=> b!996828 (= e!562324 e!562322)))

(declare-fun res!666936 () Bool)

(assert (=> b!996828 (=> (not res!666936) (not e!562322))))

(declare-fun lt!441296 () SeekEntryResult!9293)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996828 (= res!666936 (or (= lt!441296 (MissingVacant!9293 i!1194)) (= lt!441296 (MissingZero!9293 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63059 (_ BitVec 32)) SeekEntryResult!9293)

(assert (=> b!996828 (= lt!441296 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996829 () Bool)

(declare-fun res!666943 () Bool)

(assert (=> b!996829 (=> (not res!666943) (not e!562324))))

(declare-fun arrayContainsKey!0 (array!63059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996829 (= res!666943 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!666940 () Bool)

(assert (=> start!86054 (=> (not res!666940) (not e!562324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86054 (= res!666940 (validMask!0 mask!3464))))

(assert (=> start!86054 e!562324))

(declare-fun array_inv!23485 (array!63059) Bool)

(assert (=> start!86054 (array_inv!23485 a!3219)))

(assert (=> start!86054 true))

(declare-fun b!996822 () Bool)

(assert (=> b!996822 (= e!562322 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!996830 () Bool)

(declare-fun res!666939 () Bool)

(assert (=> b!996830 (=> (not res!666939) (not e!562324))))

(assert (=> b!996830 (= res!666939 (and (= (size!30863 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30863 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30863 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996831 () Bool)

(declare-fun res!666944 () Bool)

(assert (=> b!996831 (=> (not res!666944) (not e!562324))))

(assert (=> b!996831 (= res!666944 (validKeyInArray!0 (select (arr!30361 a!3219) j!170)))))

(assert (= (and start!86054 res!666940) b!996830))

(assert (= (and b!996830 res!666939) b!996831))

(assert (= (and b!996831 res!666944) b!996825))

(assert (= (and b!996825 res!666937) b!996829))

(assert (= (and b!996829 res!666943) b!996828))

(assert (= (and b!996828 res!666936) b!996824))

(assert (= (and b!996824 res!666945) b!996827))

(assert (= (and b!996827 res!666941) b!996823))

(assert (= (and b!996823 res!666942) b!996826))

(assert (= (and b!996826 res!666938) b!996822))

(declare-fun m!923849 () Bool)

(assert (=> b!996827 m!923849))

(declare-fun m!923851 () Bool)

(assert (=> b!996824 m!923851))

(declare-fun m!923853 () Bool)

(assert (=> b!996829 m!923853))

(declare-fun m!923855 () Bool)

(assert (=> b!996831 m!923855))

(assert (=> b!996831 m!923855))

(declare-fun m!923857 () Bool)

(assert (=> b!996831 m!923857))

(declare-fun m!923859 () Bool)

(assert (=> start!86054 m!923859))

(declare-fun m!923861 () Bool)

(assert (=> start!86054 m!923861))

(declare-fun m!923863 () Bool)

(assert (=> b!996825 m!923863))

(assert (=> b!996826 m!923855))

(assert (=> b!996826 m!923855))

(declare-fun m!923865 () Bool)

(assert (=> b!996826 m!923865))

(assert (=> b!996826 m!923865))

(assert (=> b!996826 m!923855))

(declare-fun m!923867 () Bool)

(assert (=> b!996826 m!923867))

(declare-fun m!923869 () Bool)

(assert (=> b!996828 m!923869))

(push 1)

(assert (not start!86054))

(assert (not b!996828))

(assert (not b!996824))

(assert (not b!996831))

(assert (not b!996829))

(assert (not b!996825))

(assert (not b!996826))

(assert (not b!996827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

