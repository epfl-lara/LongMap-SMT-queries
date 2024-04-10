; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48756 () Bool)

(assert start!48756)

(declare-fun b!536222 () Bool)

(declare-fun res!331439 () Bool)

(declare-fun e!311330 () Bool)

(assert (=> b!536222 (=> (not res!331439) (not e!311330))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33968 0))(
  ( (array!33969 (arr!16323 (Array (_ BitVec 32) (_ BitVec 64))) (size!16687 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33968)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536222 (= res!331439 (and (= (size!16687 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16687 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16687 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!331430 () Bool)

(assert (=> start!48756 (=> (not res!331430) (not e!311330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48756 (= res!331430 (validMask!0 mask!3216))))

(assert (=> start!48756 e!311330))

(assert (=> start!48756 true))

(declare-fun array_inv!12119 (array!33968) Bool)

(assert (=> start!48756 (array_inv!12119 a!3154)))

(declare-fun b!536223 () Bool)

(declare-fun res!331437 () Bool)

(assert (=> b!536223 (=> (not res!331437) (not e!311330))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536223 (= res!331437 (validKeyInArray!0 k!1998))))

(declare-fun b!536224 () Bool)

(declare-fun res!331428 () Bool)

(declare-fun e!311333 () Bool)

(assert (=> b!536224 (=> (not res!331428) (not e!311333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33968 (_ BitVec 32)) Bool)

(assert (=> b!536224 (= res!331428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536225 () Bool)

(declare-fun res!331438 () Bool)

(assert (=> b!536225 (=> (not res!331438) (not e!311333))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536225 (= res!331438 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16687 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16687 a!3154)) (= (select (arr!16323 a!3154) resIndex!32) (select (arr!16323 a!3154) j!147))))))

(declare-fun b!536226 () Bool)

(declare-fun res!331431 () Bool)

(declare-fun e!311334 () Bool)

(assert (=> b!536226 (=> (not res!331431) (not e!311334))))

(declare-datatypes ((SeekEntryResult!4781 0))(
  ( (MissingZero!4781 (index!21348 (_ BitVec 32))) (Found!4781 (index!21349 (_ BitVec 32))) (Intermediate!4781 (undefined!5593 Bool) (index!21350 (_ BitVec 32)) (x!50292 (_ BitVec 32))) (Undefined!4781) (MissingVacant!4781 (index!21351 (_ BitVec 32))) )
))
(declare-fun lt!246029 () SeekEntryResult!4781)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33968 (_ BitVec 32)) SeekEntryResult!4781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536226 (= res!331431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16323 a!3154) j!147) mask!3216) (select (arr!16323 a!3154) j!147) a!3154 mask!3216) lt!246029))))

(declare-fun b!536227 () Bool)

(declare-fun e!311332 () Bool)

(assert (=> b!536227 (= e!311334 e!311332)))

(declare-fun res!331427 () Bool)

(assert (=> b!536227 (=> (not res!331427) (not e!311332))))

(declare-fun lt!246030 () (_ BitVec 32))

(assert (=> b!536227 (= res!331427 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246030 #b00000000000000000000000000000000) (bvslt lt!246030 (size!16687 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536227 (= lt!246030 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536228 () Bool)

(assert (=> b!536228 (= e!311332 false)))

(declare-fun lt!246031 () SeekEntryResult!4781)

(assert (=> b!536228 (= lt!246031 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246030 (select (arr!16323 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536229 () Bool)

(assert (=> b!536229 (= e!311330 e!311333)))

(declare-fun res!331433 () Bool)

(assert (=> b!536229 (=> (not res!331433) (not e!311333))))

(declare-fun lt!246028 () SeekEntryResult!4781)

(assert (=> b!536229 (= res!331433 (or (= lt!246028 (MissingZero!4781 i!1153)) (= lt!246028 (MissingVacant!4781 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33968 (_ BitVec 32)) SeekEntryResult!4781)

(assert (=> b!536229 (= lt!246028 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536230 () Bool)

(declare-fun res!331429 () Bool)

(assert (=> b!536230 (=> (not res!331429) (not e!311333))))

(declare-datatypes ((List!10442 0))(
  ( (Nil!10439) (Cons!10438 (h!11381 (_ BitVec 64)) (t!16670 List!10442)) )
))
(declare-fun arrayNoDuplicates!0 (array!33968 (_ BitVec 32) List!10442) Bool)

(assert (=> b!536230 (= res!331429 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10439))))

(declare-fun b!536231 () Bool)

(declare-fun res!331435 () Bool)

(assert (=> b!536231 (=> (not res!331435) (not e!311334))))

(assert (=> b!536231 (= res!331435 (and (not (= (select (arr!16323 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16323 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16323 a!3154) index!1177) (select (arr!16323 a!3154) j!147)))))))

(declare-fun b!536232 () Bool)

(declare-fun res!331432 () Bool)

(assert (=> b!536232 (=> (not res!331432) (not e!311330))))

(assert (=> b!536232 (= res!331432 (validKeyInArray!0 (select (arr!16323 a!3154) j!147)))))

(declare-fun b!536233 () Bool)

(declare-fun res!331434 () Bool)

(assert (=> b!536233 (=> (not res!331434) (not e!311330))))

(declare-fun arrayContainsKey!0 (array!33968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536233 (= res!331434 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536234 () Bool)

(assert (=> b!536234 (= e!311333 e!311334)))

(declare-fun res!331436 () Bool)

(assert (=> b!536234 (=> (not res!331436) (not e!311334))))

(assert (=> b!536234 (= res!331436 (= lt!246029 (Intermediate!4781 false resIndex!32 resX!32)))))

(assert (=> b!536234 (= lt!246029 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16323 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48756 res!331430) b!536222))

(assert (= (and b!536222 res!331439) b!536232))

(assert (= (and b!536232 res!331432) b!536223))

(assert (= (and b!536223 res!331437) b!536233))

(assert (= (and b!536233 res!331434) b!536229))

(assert (= (and b!536229 res!331433) b!536224))

(assert (= (and b!536224 res!331428) b!536230))

(assert (= (and b!536230 res!331429) b!536225))

(assert (= (and b!536225 res!331438) b!536234))

(assert (= (and b!536234 res!331436) b!536226))

(assert (= (and b!536226 res!331431) b!536231))

(assert (= (and b!536231 res!331435) b!536227))

(assert (= (and b!536227 res!331427) b!536228))

(declare-fun m!515673 () Bool)

(assert (=> b!536231 m!515673))

(declare-fun m!515675 () Bool)

(assert (=> b!536231 m!515675))

(declare-fun m!515677 () Bool)

(assert (=> b!536233 m!515677))

(declare-fun m!515679 () Bool)

(assert (=> b!536230 m!515679))

(assert (=> b!536228 m!515675))

(assert (=> b!536228 m!515675))

(declare-fun m!515681 () Bool)

(assert (=> b!536228 m!515681))

(assert (=> b!536226 m!515675))

(assert (=> b!536226 m!515675))

(declare-fun m!515683 () Bool)

(assert (=> b!536226 m!515683))

(assert (=> b!536226 m!515683))

(assert (=> b!536226 m!515675))

(declare-fun m!515685 () Bool)

(assert (=> b!536226 m!515685))

(declare-fun m!515687 () Bool)

(assert (=> b!536225 m!515687))

(assert (=> b!536225 m!515675))

(assert (=> b!536234 m!515675))

(assert (=> b!536234 m!515675))

(declare-fun m!515689 () Bool)

(assert (=> b!536234 m!515689))

(declare-fun m!515691 () Bool)

(assert (=> b!536227 m!515691))

(declare-fun m!515693 () Bool)

(assert (=> b!536223 m!515693))

(declare-fun m!515695 () Bool)

(assert (=> b!536229 m!515695))

(assert (=> b!536232 m!515675))

(assert (=> b!536232 m!515675))

(declare-fun m!515697 () Bool)

(assert (=> b!536232 m!515697))

(declare-fun m!515699 () Bool)

(assert (=> start!48756 m!515699))

(declare-fun m!515701 () Bool)

(assert (=> start!48756 m!515701))

(declare-fun m!515703 () Bool)

(assert (=> b!536224 m!515703))

(push 1)

