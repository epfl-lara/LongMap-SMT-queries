; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48792 () Bool)

(assert start!48792)

(declare-fun b!536924 () Bool)

(declare-fun e!311600 () Bool)

(declare-fun e!311603 () Bool)

(assert (=> b!536924 (= e!311600 e!311603)))

(declare-fun res!332131 () Bool)

(assert (=> b!536924 (=> (not res!332131) (not e!311603))))

(declare-datatypes ((SeekEntryResult!4799 0))(
  ( (MissingZero!4799 (index!21420 (_ BitVec 32))) (Found!4799 (index!21421 (_ BitVec 32))) (Intermediate!4799 (undefined!5611 Bool) (index!21422 (_ BitVec 32)) (x!50358 (_ BitVec 32))) (Undefined!4799) (MissingVacant!4799 (index!21423 (_ BitVec 32))) )
))
(declare-fun lt!246247 () SeekEntryResult!4799)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536924 (= res!332131 (= lt!246247 (Intermediate!4799 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34004 0))(
  ( (array!34005 (arr!16341 (Array (_ BitVec 32) (_ BitVec 64))) (size!16705 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34004)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34004 (_ BitVec 32)) SeekEntryResult!4799)

(assert (=> b!536924 (= lt!246247 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16341 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536925 () Bool)

(declare-fun res!332136 () Bool)

(declare-fun e!311604 () Bool)

(assert (=> b!536925 (=> (not res!332136) (not e!311604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536925 (= res!332136 (validKeyInArray!0 (select (arr!16341 a!3154) j!147)))))

(declare-fun b!536926 () Bool)

(declare-fun res!332135 () Bool)

(assert (=> b!536926 (=> (not res!332135) (not e!311600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34004 (_ BitVec 32)) Bool)

(assert (=> b!536926 (= res!332135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536927 () Bool)

(declare-fun e!311602 () Bool)

(assert (=> b!536927 (= e!311603 e!311602)))

(declare-fun res!332137 () Bool)

(assert (=> b!536927 (=> (not res!332137) (not e!311602))))

(declare-fun lt!246245 () (_ BitVec 32))

(assert (=> b!536927 (= res!332137 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246245 #b00000000000000000000000000000000) (bvslt lt!246245 (size!16705 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536927 (= lt!246245 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536928 () Bool)

(declare-fun res!332140 () Bool)

(assert (=> b!536928 (=> (not res!332140) (not e!311603))))

(assert (=> b!536928 (= res!332140 (and (not (= (select (arr!16341 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16341 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16341 a!3154) index!1177) (select (arr!16341 a!3154) j!147)))))))

(declare-fun b!536929 () Bool)

(declare-fun res!332138 () Bool)

(assert (=> b!536929 (=> (not res!332138) (not e!311603))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536929 (= res!332138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16341 a!3154) j!147) mask!3216) (select (arr!16341 a!3154) j!147) a!3154 mask!3216) lt!246247))))

(declare-fun b!536930 () Bool)

(declare-fun res!332130 () Bool)

(assert (=> b!536930 (=> (not res!332130) (not e!311600))))

(assert (=> b!536930 (= res!332130 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16705 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16705 a!3154)) (= (select (arr!16341 a!3154) resIndex!32) (select (arr!16341 a!3154) j!147))))))

(declare-fun b!536931 () Bool)

(declare-fun res!332129 () Bool)

(assert (=> b!536931 (=> (not res!332129) (not e!311604))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536931 (= res!332129 (and (= (size!16705 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16705 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16705 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536932 () Bool)

(declare-fun res!332134 () Bool)

(assert (=> b!536932 (=> (not res!332134) (not e!311604))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536932 (= res!332134 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!332133 () Bool)

(assert (=> start!48792 (=> (not res!332133) (not e!311604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48792 (= res!332133 (validMask!0 mask!3216))))

(assert (=> start!48792 e!311604))

(assert (=> start!48792 true))

(declare-fun array_inv!12137 (array!34004) Bool)

(assert (=> start!48792 (array_inv!12137 a!3154)))

(declare-fun b!536933 () Bool)

(assert (=> b!536933 (= e!311604 e!311600)))

(declare-fun res!332132 () Bool)

(assert (=> b!536933 (=> (not res!332132) (not e!311600))))

(declare-fun lt!246246 () SeekEntryResult!4799)

(assert (=> b!536933 (= res!332132 (or (= lt!246246 (MissingZero!4799 i!1153)) (= lt!246246 (MissingVacant!4799 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34004 (_ BitVec 32)) SeekEntryResult!4799)

(assert (=> b!536933 (= lt!246246 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536934 () Bool)

(declare-fun res!332139 () Bool)

(assert (=> b!536934 (=> (not res!332139) (not e!311604))))

(assert (=> b!536934 (= res!332139 (validKeyInArray!0 k!1998))))

(declare-fun b!536935 () Bool)

(assert (=> b!536935 (= e!311602 false)))

(declare-fun lt!246244 () SeekEntryResult!4799)

(assert (=> b!536935 (= lt!246244 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246245 (select (arr!16341 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536936 () Bool)

(declare-fun res!332141 () Bool)

(assert (=> b!536936 (=> (not res!332141) (not e!311600))))

(declare-datatypes ((List!10460 0))(
  ( (Nil!10457) (Cons!10456 (h!11399 (_ BitVec 64)) (t!16688 List!10460)) )
))
(declare-fun arrayNoDuplicates!0 (array!34004 (_ BitVec 32) List!10460) Bool)

(assert (=> b!536936 (= res!332141 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10457))))

(assert (= (and start!48792 res!332133) b!536931))

(assert (= (and b!536931 res!332129) b!536925))

(assert (= (and b!536925 res!332136) b!536934))

(assert (= (and b!536934 res!332139) b!536932))

(assert (= (and b!536932 res!332134) b!536933))

(assert (= (and b!536933 res!332132) b!536926))

(assert (= (and b!536926 res!332135) b!536936))

(assert (= (and b!536936 res!332141) b!536930))

(assert (= (and b!536930 res!332130) b!536924))

(assert (= (and b!536924 res!332131) b!536929))

(assert (= (and b!536929 res!332138) b!536928))

(assert (= (and b!536928 res!332140) b!536927))

(assert (= (and b!536927 res!332137) b!536935))

(declare-fun m!516249 () Bool)

(assert (=> b!536936 m!516249))

(declare-fun m!516251 () Bool)

(assert (=> b!536933 m!516251))

(declare-fun m!516253 () Bool)

(assert (=> b!536935 m!516253))

(assert (=> b!536935 m!516253))

(declare-fun m!516255 () Bool)

(assert (=> b!536935 m!516255))

(declare-fun m!516257 () Bool)

(assert (=> b!536927 m!516257))

(declare-fun m!516259 () Bool)

(assert (=> b!536934 m!516259))

(assert (=> b!536929 m!516253))

(assert (=> b!536929 m!516253))

(declare-fun m!516261 () Bool)

(assert (=> b!536929 m!516261))

(assert (=> b!536929 m!516261))

(assert (=> b!536929 m!516253))

(declare-fun m!516263 () Bool)

(assert (=> b!536929 m!516263))

(declare-fun m!516265 () Bool)

(assert (=> b!536926 m!516265))

(declare-fun m!516267 () Bool)

(assert (=> b!536928 m!516267))

(assert (=> b!536928 m!516253))

(assert (=> b!536924 m!516253))

(assert (=> b!536924 m!516253))

(declare-fun m!516269 () Bool)

(assert (=> b!536924 m!516269))

(declare-fun m!516271 () Bool)

(assert (=> b!536930 m!516271))

(assert (=> b!536930 m!516253))

(assert (=> b!536925 m!516253))

(assert (=> b!536925 m!516253))

(declare-fun m!516273 () Bool)

(assert (=> b!536925 m!516273))

(declare-fun m!516275 () Bool)

(assert (=> b!536932 m!516275))

(declare-fun m!516277 () Bool)

(assert (=> start!48792 m!516277))

(declare-fun m!516279 () Bool)

(assert (=> start!48792 m!516279))

(push 1)

