; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49384 () Bool)

(assert start!49384)

(declare-fun b!543782 () Bool)

(declare-fun e!314475 () Bool)

(assert (=> b!543782 (= e!314475 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248316 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543782 (= lt!248316 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543783 () Bool)

(declare-fun res!338232 () Bool)

(declare-fun e!314477 () Bool)

(assert (=> b!543783 (=> (not res!338232) (not e!314477))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543783 (= res!338232 (validKeyInArray!0 k0!1998))))

(declare-fun b!543784 () Bool)

(declare-fun res!338231 () Bool)

(assert (=> b!543784 (=> (not res!338231) (not e!314475))))

(declare-datatypes ((SeekEntryResult!4915 0))(
  ( (MissingZero!4915 (index!21884 (_ BitVec 32))) (Found!4915 (index!21885 (_ BitVec 32))) (Intermediate!4915 (undefined!5727 Bool) (index!21886 (_ BitVec 32)) (x!50941 (_ BitVec 32))) (Undefined!4915) (MissingVacant!4915 (index!21887 (_ BitVec 32))) )
))
(declare-fun lt!248317 () SeekEntryResult!4915)

(declare-datatypes ((array!34340 0))(
  ( (array!34341 (arr!16501 (Array (_ BitVec 32) (_ BitVec 64))) (size!16865 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34340)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34340 (_ BitVec 32)) SeekEntryResult!4915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543784 (= res!338231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16501 a!3154) j!147) mask!3216) (select (arr!16501 a!3154) j!147) a!3154 mask!3216) lt!248317))))

(declare-fun b!543785 () Bool)

(declare-fun res!338230 () Bool)

(assert (=> b!543785 (=> (not res!338230) (not e!314477))))

(declare-fun arrayContainsKey!0 (array!34340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543785 (= res!338230 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543786 () Bool)

(declare-fun res!338238 () Bool)

(declare-fun e!314478 () Bool)

(assert (=> b!543786 (=> (not res!338238) (not e!314478))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543786 (= res!338238 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16865 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16865 a!3154)) (= (select (arr!16501 a!3154) resIndex!32) (select (arr!16501 a!3154) j!147))))))

(declare-fun b!543787 () Bool)

(declare-fun res!338236 () Bool)

(assert (=> b!543787 (=> (not res!338236) (not e!314478))))

(declare-datatypes ((List!10527 0))(
  ( (Nil!10524) (Cons!10523 (h!11481 (_ BitVec 64)) (t!16747 List!10527)) )
))
(declare-fun arrayNoDuplicates!0 (array!34340 (_ BitVec 32) List!10527) Bool)

(assert (=> b!543787 (= res!338236 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10524))))

(declare-fun b!543788 () Bool)

(declare-fun res!338234 () Bool)

(assert (=> b!543788 (=> (not res!338234) (not e!314475))))

(assert (=> b!543788 (= res!338234 (and (not (= (select (arr!16501 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16501 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16501 a!3154) index!1177) (select (arr!16501 a!3154) j!147)))))))

(declare-fun b!543789 () Bool)

(declare-fun res!338235 () Bool)

(assert (=> b!543789 (=> (not res!338235) (not e!314477))))

(assert (=> b!543789 (= res!338235 (validKeyInArray!0 (select (arr!16501 a!3154) j!147)))))

(declare-fun b!543790 () Bool)

(assert (=> b!543790 (= e!314478 e!314475)))

(declare-fun res!338228 () Bool)

(assert (=> b!543790 (=> (not res!338228) (not e!314475))))

(assert (=> b!543790 (= res!338228 (= lt!248317 (Intermediate!4915 false resIndex!32 resX!32)))))

(assert (=> b!543790 (= lt!248317 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16501 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543791 () Bool)

(declare-fun res!338237 () Bool)

(assert (=> b!543791 (=> (not res!338237) (not e!314477))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543791 (= res!338237 (and (= (size!16865 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16865 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16865 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543792 () Bool)

(assert (=> b!543792 (= e!314477 e!314478)))

(declare-fun res!338239 () Bool)

(assert (=> b!543792 (=> (not res!338239) (not e!314478))))

(declare-fun lt!248315 () SeekEntryResult!4915)

(assert (=> b!543792 (= res!338239 (or (= lt!248315 (MissingZero!4915 i!1153)) (= lt!248315 (MissingVacant!4915 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34340 (_ BitVec 32)) SeekEntryResult!4915)

(assert (=> b!543792 (= lt!248315 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543793 () Bool)

(declare-fun res!338233 () Bool)

(assert (=> b!543793 (=> (not res!338233) (not e!314478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34340 (_ BitVec 32)) Bool)

(assert (=> b!543793 (= res!338233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!338229 () Bool)

(assert (=> start!49384 (=> (not res!338229) (not e!314477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49384 (= res!338229 (validMask!0 mask!3216))))

(assert (=> start!49384 e!314477))

(assert (=> start!49384 true))

(declare-fun array_inv!12360 (array!34340) Bool)

(assert (=> start!49384 (array_inv!12360 a!3154)))

(assert (= (and start!49384 res!338229) b!543791))

(assert (= (and b!543791 res!338237) b!543789))

(assert (= (and b!543789 res!338235) b!543783))

(assert (= (and b!543783 res!338232) b!543785))

(assert (= (and b!543785 res!338230) b!543792))

(assert (= (and b!543792 res!338239) b!543793))

(assert (= (and b!543793 res!338233) b!543787))

(assert (= (and b!543787 res!338236) b!543786))

(assert (= (and b!543786 res!338238) b!543790))

(assert (= (and b!543790 res!338228) b!543784))

(assert (= (and b!543784 res!338231) b!543788))

(assert (= (and b!543788 res!338234) b!543782))

(declare-fun m!521971 () Bool)

(assert (=> b!543793 m!521971))

(declare-fun m!521973 () Bool)

(assert (=> b!543785 m!521973))

(declare-fun m!521975 () Bool)

(assert (=> b!543792 m!521975))

(declare-fun m!521977 () Bool)

(assert (=> b!543784 m!521977))

(assert (=> b!543784 m!521977))

(declare-fun m!521979 () Bool)

(assert (=> b!543784 m!521979))

(assert (=> b!543784 m!521979))

(assert (=> b!543784 m!521977))

(declare-fun m!521981 () Bool)

(assert (=> b!543784 m!521981))

(assert (=> b!543790 m!521977))

(assert (=> b!543790 m!521977))

(declare-fun m!521983 () Bool)

(assert (=> b!543790 m!521983))

(assert (=> b!543789 m!521977))

(assert (=> b!543789 m!521977))

(declare-fun m!521985 () Bool)

(assert (=> b!543789 m!521985))

(declare-fun m!521987 () Bool)

(assert (=> b!543786 m!521987))

(assert (=> b!543786 m!521977))

(declare-fun m!521989 () Bool)

(assert (=> b!543787 m!521989))

(declare-fun m!521991 () Bool)

(assert (=> b!543783 m!521991))

(declare-fun m!521993 () Bool)

(assert (=> b!543788 m!521993))

(assert (=> b!543788 m!521977))

(declare-fun m!521995 () Bool)

(assert (=> start!49384 m!521995))

(declare-fun m!521997 () Bool)

(assert (=> start!49384 m!521997))

(declare-fun m!521999 () Bool)

(assert (=> b!543782 m!521999))

(check-sat (not b!543790) (not b!543793) (not b!543783) (not b!543789) (not b!543792) (not b!543782) (not b!543787) (not b!543785) (not b!543784) (not start!49384))
(check-sat)
