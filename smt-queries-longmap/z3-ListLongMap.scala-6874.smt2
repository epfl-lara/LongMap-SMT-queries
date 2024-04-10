; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86500 () Bool)

(assert start!86500)

(declare-fun b!1001949 () Bool)

(declare-fun e!564519 () Bool)

(declare-fun e!564523 () Bool)

(assert (=> b!1001949 (= e!564519 e!564523)))

(declare-fun res!671439 () Bool)

(assert (=> b!1001949 (=> (not res!671439) (not e!564523))))

(declare-datatypes ((array!63301 0))(
  ( (array!63302 (arr!30476 (Array (_ BitVec 32) (_ BitVec 64))) (size!30978 (_ BitVec 32))) )
))
(declare-fun lt!442931 () array!63301)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!442937 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9408 0))(
  ( (MissingZero!9408 (index!40003 (_ BitVec 32))) (Found!9408 (index!40004 (_ BitVec 32))) (Intermediate!9408 (undefined!10220 Bool) (index!40005 (_ BitVec 32)) (x!87420 (_ BitVec 32))) (Undefined!9408) (MissingVacant!9408 (index!40006 (_ BitVec 32))) )
))
(declare-fun lt!442932 () SeekEntryResult!9408)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63301 (_ BitVec 32)) SeekEntryResult!9408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001949 (= res!671439 (not (= lt!442932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442937 mask!3464) lt!442937 lt!442931 mask!3464))))))

(declare-fun a!3219 () array!63301)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001949 (= lt!442937 (select (store (arr!30476 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001949 (= lt!442931 (array!63302 (store (arr!30476 a!3219) i!1194 k0!2224) (size!30978 a!3219)))))

(declare-fun res!671436 () Bool)

(declare-fun e!564517 () Bool)

(assert (=> start!86500 (=> (not res!671436) (not e!564517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86500 (= res!671436 (validMask!0 mask!3464))))

(assert (=> start!86500 e!564517))

(declare-fun array_inv!23600 (array!63301) Bool)

(assert (=> start!86500 (array_inv!23600 a!3219)))

(assert (=> start!86500 true))

(declare-fun b!1001950 () Bool)

(declare-fun res!671432 () Bool)

(assert (=> b!1001950 (=> (not res!671432) (not e!564517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001950 (= res!671432 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001951 () Bool)

(declare-fun res!671434 () Bool)

(declare-fun e!564518 () Bool)

(assert (=> b!1001951 (=> (not res!671434) (not e!564518))))

(declare-fun lt!442933 () (_ BitVec 32))

(declare-fun lt!442936 () SeekEntryResult!9408)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001951 (= res!671434 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442933 (select (arr!30476 a!3219) j!170) a!3219 mask!3464) lt!442936))))

(declare-fun b!1001952 () Bool)

(declare-fun res!671441 () Bool)

(declare-fun e!564520 () Bool)

(assert (=> b!1001952 (=> (not res!671441) (not e!564520))))

(declare-datatypes ((List!21152 0))(
  ( (Nil!21149) (Cons!21148 (h!22325 (_ BitVec 64)) (t!30153 List!21152)) )
))
(declare-fun arrayNoDuplicates!0 (array!63301 (_ BitVec 32) List!21152) Bool)

(assert (=> b!1001952 (= res!671441 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21149))))

(declare-fun b!1001953 () Bool)

(assert (=> b!1001953 (= e!564518 false)))

(declare-fun lt!442935 () SeekEntryResult!9408)

(assert (=> b!1001953 (= lt!442935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442933 lt!442937 lt!442931 mask!3464))))

(declare-fun b!1001954 () Bool)

(assert (=> b!1001954 (= e!564523 e!564518)))

(declare-fun res!671427 () Bool)

(assert (=> b!1001954 (=> (not res!671427) (not e!564518))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001954 (= res!671427 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442933 #b00000000000000000000000000000000) (bvslt lt!442933 (size!30978 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001954 (= lt!442933 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001955 () Bool)

(declare-fun res!671429 () Bool)

(assert (=> b!1001955 (=> (not res!671429) (not e!564517))))

(declare-fun arrayContainsKey!0 (array!63301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001955 (= res!671429 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001956 () Bool)

(declare-fun res!671433 () Bool)

(assert (=> b!1001956 (=> (not res!671433) (not e!564520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63301 (_ BitVec 32)) Bool)

(assert (=> b!1001956 (= res!671433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001957 () Bool)

(declare-fun e!564522 () Bool)

(assert (=> b!1001957 (= e!564522 e!564519)))

(declare-fun res!671440 () Bool)

(assert (=> b!1001957 (=> (not res!671440) (not e!564519))))

(declare-fun lt!442930 () SeekEntryResult!9408)

(assert (=> b!1001957 (= res!671440 (= lt!442930 lt!442936))))

(assert (=> b!1001957 (= lt!442930 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30476 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001958 () Bool)

(declare-fun res!671428 () Bool)

(assert (=> b!1001958 (=> (not res!671428) (not e!564523))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001958 (= res!671428 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001959 () Bool)

(declare-fun res!671437 () Bool)

(assert (=> b!1001959 (=> (not res!671437) (not e!564520))))

(assert (=> b!1001959 (= res!671437 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30978 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30978 a!3219))))))

(declare-fun b!1001960 () Bool)

(declare-fun res!671435 () Bool)

(assert (=> b!1001960 (=> (not res!671435) (not e!564517))))

(assert (=> b!1001960 (= res!671435 (and (= (size!30978 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30978 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30978 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001961 () Bool)

(declare-fun res!671438 () Bool)

(assert (=> b!1001961 (=> (not res!671438) (not e!564517))))

(assert (=> b!1001961 (= res!671438 (validKeyInArray!0 (select (arr!30476 a!3219) j!170)))))

(declare-fun b!1001962 () Bool)

(assert (=> b!1001962 (= e!564520 e!564522)))

(declare-fun res!671430 () Bool)

(assert (=> b!1001962 (=> (not res!671430) (not e!564522))))

(assert (=> b!1001962 (= res!671430 (= lt!442932 lt!442936))))

(assert (=> b!1001962 (= lt!442936 (Intermediate!9408 false resIndex!38 resX!38))))

(assert (=> b!1001962 (= lt!442932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30476 a!3219) j!170) mask!3464) (select (arr!30476 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001963 () Bool)

(assert (=> b!1001963 (= e!564517 e!564520)))

(declare-fun res!671442 () Bool)

(assert (=> b!1001963 (=> (not res!671442) (not e!564520))))

(declare-fun lt!442934 () SeekEntryResult!9408)

(assert (=> b!1001963 (= res!671442 (or (= lt!442934 (MissingVacant!9408 i!1194)) (= lt!442934 (MissingZero!9408 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63301 (_ BitVec 32)) SeekEntryResult!9408)

(assert (=> b!1001963 (= lt!442934 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001964 () Bool)

(declare-fun res!671431 () Bool)

(assert (=> b!1001964 (=> (not res!671431) (not e!564523))))

(assert (=> b!1001964 (= res!671431 (not (= lt!442930 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442937 lt!442931 mask!3464))))))

(assert (= (and start!86500 res!671436) b!1001960))

(assert (= (and b!1001960 res!671435) b!1001961))

(assert (= (and b!1001961 res!671438) b!1001950))

(assert (= (and b!1001950 res!671432) b!1001955))

(assert (= (and b!1001955 res!671429) b!1001963))

(assert (= (and b!1001963 res!671442) b!1001956))

(assert (= (and b!1001956 res!671433) b!1001952))

(assert (= (and b!1001952 res!671441) b!1001959))

(assert (= (and b!1001959 res!671437) b!1001962))

(assert (= (and b!1001962 res!671430) b!1001957))

(assert (= (and b!1001957 res!671440) b!1001949))

(assert (= (and b!1001949 res!671439) b!1001964))

(assert (= (and b!1001964 res!671431) b!1001958))

(assert (= (and b!1001958 res!671428) b!1001954))

(assert (= (and b!1001954 res!671427) b!1001951))

(assert (= (and b!1001951 res!671434) b!1001953))

(declare-fun m!927909 () Bool)

(assert (=> b!1001952 m!927909))

(declare-fun m!927911 () Bool)

(assert (=> b!1001961 m!927911))

(assert (=> b!1001961 m!927911))

(declare-fun m!927913 () Bool)

(assert (=> b!1001961 m!927913))

(declare-fun m!927915 () Bool)

(assert (=> b!1001963 m!927915))

(declare-fun m!927917 () Bool)

(assert (=> b!1001956 m!927917))

(declare-fun m!927919 () Bool)

(assert (=> b!1001954 m!927919))

(declare-fun m!927921 () Bool)

(assert (=> b!1001964 m!927921))

(declare-fun m!927923 () Bool)

(assert (=> b!1001953 m!927923))

(assert (=> b!1001951 m!927911))

(assert (=> b!1001951 m!927911))

(declare-fun m!927925 () Bool)

(assert (=> b!1001951 m!927925))

(declare-fun m!927927 () Bool)

(assert (=> b!1001955 m!927927))

(declare-fun m!927929 () Bool)

(assert (=> b!1001949 m!927929))

(assert (=> b!1001949 m!927929))

(declare-fun m!927931 () Bool)

(assert (=> b!1001949 m!927931))

(declare-fun m!927933 () Bool)

(assert (=> b!1001949 m!927933))

(declare-fun m!927935 () Bool)

(assert (=> b!1001949 m!927935))

(assert (=> b!1001962 m!927911))

(assert (=> b!1001962 m!927911))

(declare-fun m!927937 () Bool)

(assert (=> b!1001962 m!927937))

(assert (=> b!1001962 m!927937))

(assert (=> b!1001962 m!927911))

(declare-fun m!927939 () Bool)

(assert (=> b!1001962 m!927939))

(assert (=> b!1001957 m!927911))

(assert (=> b!1001957 m!927911))

(declare-fun m!927941 () Bool)

(assert (=> b!1001957 m!927941))

(declare-fun m!927943 () Bool)

(assert (=> start!86500 m!927943))

(declare-fun m!927945 () Bool)

(assert (=> start!86500 m!927945))

(declare-fun m!927947 () Bool)

(assert (=> b!1001950 m!927947))

(check-sat (not b!1001956) (not b!1001963) (not b!1001953) (not b!1001949) (not b!1001964) (not b!1001952) (not b!1001954) (not b!1001955) (not b!1001962) (not b!1001961) (not b!1001950) (not b!1001957) (not b!1001951) (not start!86500))
(check-sat)
