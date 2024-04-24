; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45866 () Bool)

(assert start!45866)

(declare-fun b!508071 () Bool)

(declare-fun res!309086 () Bool)

(declare-fun e!297271 () Bool)

(assert (=> b!508071 (=> (not res!309086) (not e!297271))))

(declare-datatypes ((array!32623 0))(
  ( (array!32624 (arr!15691 (Array (_ BitVec 32) (_ BitVec 64))) (size!16055 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32623)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508071 (= res!309086 (validKeyInArray!0 (select (arr!15691 a!3235) j!176)))))

(declare-fun b!508072 () Bool)

(declare-fun e!297273 () Bool)

(assert (=> b!508072 (= e!297273 (and (bvsle #b00000000000000000000000000000000 (size!16055 a!3235)) (bvsgt j!176 (size!16055 a!3235))))))

(declare-fun b!508073 () Bool)

(declare-fun res!309089 () Bool)

(assert (=> b!508073 (=> (not res!309089) (not e!297271))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508073 (= res!309089 (and (= (size!16055 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16055 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16055 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508075 () Bool)

(declare-fun res!309084 () Bool)

(assert (=> b!508075 (=> (not res!309084) (not e!297271))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508075 (= res!309084 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508076 () Bool)

(declare-fun res!309088 () Bool)

(assert (=> b!508076 (=> (not res!309088) (not e!297271))))

(assert (=> b!508076 (= res!309088 (validKeyInArray!0 k0!2280))))

(declare-fun b!508077 () Bool)

(assert (=> b!508077 (= e!297271 e!297273)))

(declare-fun res!309085 () Bool)

(assert (=> b!508077 (=> (not res!309085) (not e!297273))))

(declare-datatypes ((SeekEntryResult!4114 0))(
  ( (MissingZero!4114 (index!18644 (_ BitVec 32))) (Found!4114 (index!18645 (_ BitVec 32))) (Intermediate!4114 (undefined!4926 Bool) (index!18646 (_ BitVec 32)) (x!47776 (_ BitVec 32))) (Undefined!4114) (MissingVacant!4114 (index!18647 (_ BitVec 32))) )
))
(declare-fun lt!232174 () SeekEntryResult!4114)

(assert (=> b!508077 (= res!309085 (or (= lt!232174 (MissingZero!4114 i!1204)) (= lt!232174 (MissingVacant!4114 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32623 (_ BitVec 32)) SeekEntryResult!4114)

(assert (=> b!508077 (= lt!232174 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508078 () Bool)

(declare-fun res!309090 () Bool)

(assert (=> b!508078 (=> (not res!309090) (not e!297273))))

(declare-datatypes ((List!9756 0))(
  ( (Nil!9753) (Cons!9752 (h!10629 (_ BitVec 64)) (t!15976 List!9756)) )
))
(declare-fun arrayNoDuplicates!0 (array!32623 (_ BitVec 32) List!9756) Bool)

(assert (=> b!508078 (= res!309090 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9753))))

(declare-fun b!508074 () Bool)

(declare-fun res!309087 () Bool)

(assert (=> b!508074 (=> (not res!309087) (not e!297273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32623 (_ BitVec 32)) Bool)

(assert (=> b!508074 (= res!309087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309091 () Bool)

(assert (=> start!45866 (=> (not res!309091) (not e!297271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45866 (= res!309091 (validMask!0 mask!3524))))

(assert (=> start!45866 e!297271))

(assert (=> start!45866 true))

(declare-fun array_inv!11550 (array!32623) Bool)

(assert (=> start!45866 (array_inv!11550 a!3235)))

(assert (= (and start!45866 res!309091) b!508073))

(assert (= (and b!508073 res!309089) b!508071))

(assert (= (and b!508071 res!309086) b!508076))

(assert (= (and b!508076 res!309088) b!508075))

(assert (= (and b!508075 res!309084) b!508077))

(assert (= (and b!508077 res!309085) b!508074))

(assert (= (and b!508074 res!309087) b!508078))

(assert (= (and b!508078 res!309090) b!508072))

(declare-fun m!489133 () Bool)

(assert (=> b!508078 m!489133))

(declare-fun m!489135 () Bool)

(assert (=> b!508077 m!489135))

(declare-fun m!489137 () Bool)

(assert (=> b!508075 m!489137))

(declare-fun m!489139 () Bool)

(assert (=> b!508076 m!489139))

(declare-fun m!489141 () Bool)

(assert (=> start!45866 m!489141))

(declare-fun m!489143 () Bool)

(assert (=> start!45866 m!489143))

(declare-fun m!489145 () Bool)

(assert (=> b!508071 m!489145))

(assert (=> b!508071 m!489145))

(declare-fun m!489147 () Bool)

(assert (=> b!508071 m!489147))

(declare-fun m!489149 () Bool)

(assert (=> b!508074 m!489149))

(check-sat (not b!508075) (not b!508074) (not b!508076) (not b!508078) (not b!508077) (not b!508071) (not start!45866))
(check-sat)
