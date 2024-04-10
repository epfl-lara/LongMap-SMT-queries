; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48388 () Bool)

(assert start!48388)

(declare-fun b!531697 () Bool)

(declare-fun res!327188 () Bool)

(declare-fun e!309688 () Bool)

(assert (=> b!531697 (=> (not res!327188) (not e!309688))))

(declare-datatypes ((array!33696 0))(
  ( (array!33697 (arr!16190 (Array (_ BitVec 32) (_ BitVec 64))) (size!16554 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33696)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531697 (= res!327188 (validKeyInArray!0 (select (arr!16190 a!3154) j!147)))))

(declare-fun b!531698 () Bool)

(declare-fun e!309689 () Bool)

(assert (=> b!531698 (= e!309688 e!309689)))

(declare-fun res!327191 () Bool)

(assert (=> b!531698 (=> (not res!327191) (not e!309689))))

(declare-datatypes ((SeekEntryResult!4648 0))(
  ( (MissingZero!4648 (index!20816 (_ BitVec 32))) (Found!4648 (index!20817 (_ BitVec 32))) (Intermediate!4648 (undefined!5460 Bool) (index!20818 (_ BitVec 32)) (x!49790 (_ BitVec 32))) (Undefined!4648) (MissingVacant!4648 (index!20819 (_ BitVec 32))) )
))
(declare-fun lt!245056 () SeekEntryResult!4648)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531698 (= res!327191 (or (= lt!245056 (MissingZero!4648 i!1153)) (= lt!245056 (MissingVacant!4648 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33696 (_ BitVec 32)) SeekEntryResult!4648)

(assert (=> b!531698 (= lt!245056 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531699 () Bool)

(declare-fun res!327189 () Bool)

(assert (=> b!531699 (=> (not res!327189) (not e!309689))))

(declare-datatypes ((List!10309 0))(
  ( (Nil!10306) (Cons!10305 (h!11245 (_ BitVec 64)) (t!16537 List!10309)) )
))
(declare-fun arrayNoDuplicates!0 (array!33696 (_ BitVec 32) List!10309) Bool)

(assert (=> b!531699 (= res!327189 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10306))))

(declare-fun res!327192 () Bool)

(assert (=> start!48388 (=> (not res!327192) (not e!309688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48388 (= res!327192 (validMask!0 mask!3216))))

(assert (=> start!48388 e!309688))

(assert (=> start!48388 true))

(declare-fun array_inv!11986 (array!33696) Bool)

(assert (=> start!48388 (array_inv!11986 a!3154)))

(declare-fun b!531700 () Bool)

(declare-fun res!327193 () Bool)

(assert (=> b!531700 (=> (not res!327193) (not e!309688))))

(declare-fun arrayContainsKey!0 (array!33696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531700 (= res!327193 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531701 () Bool)

(declare-fun res!327187 () Bool)

(assert (=> b!531701 (=> (not res!327187) (not e!309688))))

(assert (=> b!531701 (= res!327187 (and (= (size!16554 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16554 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16554 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531702 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!531702 (= e!309689 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16554 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16554 a!3154)) (= (select (arr!16190 a!3154) resIndex!32) (select (arr!16190 a!3154) j!147)) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!531703 () Bool)

(declare-fun res!327194 () Bool)

(assert (=> b!531703 (=> (not res!327194) (not e!309689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33696 (_ BitVec 32)) Bool)

(assert (=> b!531703 (= res!327194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531704 () Bool)

(declare-fun res!327190 () Bool)

(assert (=> b!531704 (=> (not res!327190) (not e!309688))))

(assert (=> b!531704 (= res!327190 (validKeyInArray!0 k!1998))))

(assert (= (and start!48388 res!327192) b!531701))

(assert (= (and b!531701 res!327187) b!531697))

(assert (= (and b!531697 res!327188) b!531704))

(assert (= (and b!531704 res!327190) b!531700))

(assert (= (and b!531700 res!327193) b!531698))

(assert (= (and b!531698 res!327191) b!531703))

(assert (= (and b!531703 res!327194) b!531699))

(assert (= (and b!531699 res!327189) b!531702))

(declare-fun m!512065 () Bool)

(assert (=> b!531699 m!512065))

(declare-fun m!512067 () Bool)

(assert (=> b!531702 m!512067))

(declare-fun m!512069 () Bool)

(assert (=> b!531702 m!512069))

(assert (=> b!531697 m!512069))

(assert (=> b!531697 m!512069))

(declare-fun m!512071 () Bool)

(assert (=> b!531697 m!512071))

(declare-fun m!512073 () Bool)

(assert (=> b!531698 m!512073))

(declare-fun m!512075 () Bool)

(assert (=> b!531704 m!512075))

(declare-fun m!512077 () Bool)

(assert (=> start!48388 m!512077))

(declare-fun m!512079 () Bool)

(assert (=> start!48388 m!512079))

(declare-fun m!512081 () Bool)

(assert (=> b!531703 m!512081))

(declare-fun m!512083 () Bool)

(assert (=> b!531700 m!512083))

(push 1)

(assert (not b!531700))

(assert (not b!531698))

(assert (not b!531703))

(assert (not b!531699))

(assert (not b!531697))

(assert (not start!48388))

(assert (not b!531704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

