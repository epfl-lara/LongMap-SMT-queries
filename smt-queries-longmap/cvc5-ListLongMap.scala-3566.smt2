; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49020 () Bool)

(assert start!49020)

(declare-fun b!540176 () Bool)

(declare-fun res!335231 () Bool)

(declare-fun e!312989 () Bool)

(assert (=> b!540176 (=> (not res!335231) (not e!312989))))

(declare-datatypes ((array!34181 0))(
  ( (array!34182 (arr!16428 (Array (_ BitVec 32) (_ BitVec 64))) (size!16792 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34181)

(declare-datatypes ((List!10547 0))(
  ( (Nil!10544) (Cons!10543 (h!11489 (_ BitVec 64)) (t!16775 List!10547)) )
))
(declare-fun arrayNoDuplicates!0 (array!34181 (_ BitVec 32) List!10547) Bool)

(assert (=> b!540176 (= res!335231 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10544))))

(declare-fun b!540177 () Bool)

(declare-fun res!335229 () Bool)

(assert (=> b!540177 (=> (not res!335229) (not e!312989))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4886 0))(
  ( (MissingZero!4886 (index!21768 (_ BitVec 32))) (Found!4886 (index!21769 (_ BitVec 32))) (Intermediate!4886 (undefined!5698 Bool) (index!21770 (_ BitVec 32)) (x!50683 (_ BitVec 32))) (Undefined!4886) (MissingVacant!4886 (index!21771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34181 (_ BitVec 32)) SeekEntryResult!4886)

(assert (=> b!540177 (= res!335229 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16428 a!3154) j!147) a!3154 mask!3216) (Intermediate!4886 false resIndex!32 resX!32)))))

(declare-fun b!540178 () Bool)

(declare-fun res!335224 () Bool)

(assert (=> b!540178 (=> (not res!335224) (not e!312989))))

(assert (=> b!540178 (= res!335224 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16792 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16792 a!3154)) (= (select (arr!16428 a!3154) resIndex!32) (select (arr!16428 a!3154) j!147))))))

(declare-fun b!540179 () Bool)

(assert (=> b!540179 (= e!312989 false)))

(declare-fun lt!247327 () SeekEntryResult!4886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540179 (= lt!247327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16428 a!3154) j!147) mask!3216) (select (arr!16428 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540180 () Bool)

(declare-fun res!335222 () Bool)

(declare-fun e!312990 () Bool)

(assert (=> b!540180 (=> (not res!335222) (not e!312990))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540180 (= res!335222 (and (= (size!16792 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16792 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16792 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540182 () Bool)

(assert (=> b!540182 (= e!312990 e!312989)))

(declare-fun res!335226 () Bool)

(assert (=> b!540182 (=> (not res!335226) (not e!312989))))

(declare-fun lt!247326 () SeekEntryResult!4886)

(assert (=> b!540182 (= res!335226 (or (= lt!247326 (MissingZero!4886 i!1153)) (= lt!247326 (MissingVacant!4886 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34181 (_ BitVec 32)) SeekEntryResult!4886)

(assert (=> b!540182 (= lt!247326 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540183 () Bool)

(declare-fun res!335228 () Bool)

(assert (=> b!540183 (=> (not res!335228) (not e!312990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540183 (= res!335228 (validKeyInArray!0 (select (arr!16428 a!3154) j!147)))))

(declare-fun res!335230 () Bool)

(assert (=> start!49020 (=> (not res!335230) (not e!312990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49020 (= res!335230 (validMask!0 mask!3216))))

(assert (=> start!49020 e!312990))

(assert (=> start!49020 true))

(declare-fun array_inv!12224 (array!34181) Bool)

(assert (=> start!49020 (array_inv!12224 a!3154)))

(declare-fun b!540181 () Bool)

(declare-fun res!335227 () Bool)

(assert (=> b!540181 (=> (not res!335227) (not e!312990))))

(assert (=> b!540181 (= res!335227 (validKeyInArray!0 k!1998))))

(declare-fun b!540184 () Bool)

(declare-fun res!335225 () Bool)

(assert (=> b!540184 (=> (not res!335225) (not e!312989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34181 (_ BitVec 32)) Bool)

(assert (=> b!540184 (= res!335225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540185 () Bool)

(declare-fun res!335223 () Bool)

(assert (=> b!540185 (=> (not res!335223) (not e!312990))))

(declare-fun arrayContainsKey!0 (array!34181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540185 (= res!335223 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49020 res!335230) b!540180))

(assert (= (and b!540180 res!335222) b!540183))

(assert (= (and b!540183 res!335228) b!540181))

(assert (= (and b!540181 res!335227) b!540185))

(assert (= (and b!540185 res!335223) b!540182))

(assert (= (and b!540182 res!335226) b!540184))

(assert (= (and b!540184 res!335225) b!540176))

(assert (= (and b!540176 res!335231) b!540178))

(assert (= (and b!540178 res!335224) b!540177))

(assert (= (and b!540177 res!335229) b!540179))

(declare-fun m!519009 () Bool)

(assert (=> b!540177 m!519009))

(assert (=> b!540177 m!519009))

(declare-fun m!519011 () Bool)

(assert (=> b!540177 m!519011))

(assert (=> b!540179 m!519009))

(assert (=> b!540179 m!519009))

(declare-fun m!519013 () Bool)

(assert (=> b!540179 m!519013))

(assert (=> b!540179 m!519013))

(assert (=> b!540179 m!519009))

(declare-fun m!519015 () Bool)

(assert (=> b!540179 m!519015))

(declare-fun m!519017 () Bool)

(assert (=> start!49020 m!519017))

(declare-fun m!519019 () Bool)

(assert (=> start!49020 m!519019))

(declare-fun m!519021 () Bool)

(assert (=> b!540178 m!519021))

(assert (=> b!540178 m!519009))

(declare-fun m!519023 () Bool)

(assert (=> b!540182 m!519023))

(declare-fun m!519025 () Bool)

(assert (=> b!540185 m!519025))

(assert (=> b!540183 m!519009))

(assert (=> b!540183 m!519009))

(declare-fun m!519027 () Bool)

(assert (=> b!540183 m!519027))

(declare-fun m!519029 () Bool)

(assert (=> b!540181 m!519029))

(declare-fun m!519031 () Bool)

(assert (=> b!540184 m!519031))

(declare-fun m!519033 () Bool)

(assert (=> b!540176 m!519033))

(push 1)

