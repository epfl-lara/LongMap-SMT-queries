; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124688 () Bool)

(assert start!124688)

(declare-fun b!1445000 () Bool)

(declare-fun res!976928 () Bool)

(declare-fun e!814065 () Bool)

(assert (=> b!1445000 (=> (not res!976928) (not e!814065))))

(declare-datatypes ((array!98136 0))(
  ( (array!98137 (arr!47356 (Array (_ BitVec 32) (_ BitVec 64))) (size!47906 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98136)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98136 (_ BitVec 32)) Bool)

(assert (=> b!1445000 (= res!976928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445001 () Bool)

(declare-fun res!976930 () Bool)

(declare-fun e!814061 () Bool)

(assert (=> b!1445001 (=> (not res!976930) (not e!814061))))

(declare-fun e!814062 () Bool)

(assert (=> b!1445001 (= res!976930 e!814062)))

(declare-fun c!133548 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445001 (= c!133548 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445002 () Bool)

(declare-fun res!976933 () Bool)

(assert (=> b!1445002 (=> (not res!976933) (not e!814065))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445002 (= res!976933 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47906 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47906 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47906 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!634368 () array!98136)

(declare-datatypes ((SeekEntryResult!11608 0))(
  ( (MissingZero!11608 (index!48824 (_ BitVec 32))) (Found!11608 (index!48825 (_ BitVec 32))) (Intermediate!11608 (undefined!12420 Bool) (index!48826 (_ BitVec 32)) (x!130513 (_ BitVec 32))) (Undefined!11608) (MissingVacant!11608 (index!48827 (_ BitVec 32))) )
))
(declare-fun lt!634371 () SeekEntryResult!11608)

(declare-fun b!1445003 () Bool)

(declare-fun lt!634367 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98136 (_ BitVec 32)) SeekEntryResult!11608)

(assert (=> b!1445003 (= e!814062 (= lt!634371 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634367 lt!634368 mask!2687)))))

(declare-fun b!1445004 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98136 (_ BitVec 32)) SeekEntryResult!11608)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98136 (_ BitVec 32)) SeekEntryResult!11608)

(assert (=> b!1445004 (= e!814062 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634367 lt!634368 mask!2687) (seekEntryOrOpen!0 lt!634367 lt!634368 mask!2687)))))

(declare-fun e!814063 () Bool)

(declare-fun b!1445005 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445005 (= e!814063 (or (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) (select (arr!47356 a!2862) j!93))))))

(declare-fun b!1445007 () Bool)

(declare-fun e!814064 () Bool)

(assert (=> b!1445007 (= e!814064 e!814061)))

(declare-fun res!976932 () Bool)

(assert (=> b!1445007 (=> (not res!976932) (not e!814061))))

(assert (=> b!1445007 (= res!976932 (= lt!634371 (Intermediate!11608 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445007 (= lt!634371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634367 mask!2687) lt!634367 lt!634368 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445007 (= lt!634367 (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445008 () Bool)

(declare-fun e!814066 () Bool)

(assert (=> b!1445008 (= e!814066 e!814064)))

(declare-fun res!976934 () Bool)

(assert (=> b!1445008 (=> (not res!976934) (not e!814064))))

(declare-fun lt!634370 () SeekEntryResult!11608)

(assert (=> b!1445008 (= res!976934 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47356 a!2862) j!93) mask!2687) (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!634370))))

(assert (=> b!1445008 (= lt!634370 (Intermediate!11608 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445009 () Bool)

(declare-fun res!976931 () Bool)

(assert (=> b!1445009 (=> (not res!976931) (not e!814063))))

(assert (=> b!1445009 (= res!976931 (= (seekEntryOrOpen!0 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) (Found!11608 j!93)))))

(declare-fun b!1445010 () Bool)

(declare-fun res!976938 () Bool)

(assert (=> b!1445010 (=> (not res!976938) (not e!814065))))

(assert (=> b!1445010 (= res!976938 (and (= (size!47906 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47906 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47906 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445011 () Bool)

(declare-fun res!976926 () Bool)

(assert (=> b!1445011 (=> (not res!976926) (not e!814065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445011 (= res!976926 (validKeyInArray!0 (select (arr!47356 a!2862) j!93)))))

(declare-fun b!1445012 () Bool)

(declare-fun res!976929 () Bool)

(assert (=> b!1445012 (=> (not res!976929) (not e!814061))))

(assert (=> b!1445012 (= res!976929 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445013 () Bool)

(declare-fun res!976927 () Bool)

(assert (=> b!1445013 (=> (not res!976927) (not e!814064))))

(assert (=> b!1445013 (= res!976927 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!634370))))

(declare-fun b!1445014 () Bool)

(declare-fun res!976939 () Bool)

(assert (=> b!1445014 (=> (not res!976939) (not e!814065))))

(declare-datatypes ((List!33857 0))(
  ( (Nil!33854) (Cons!33853 (h!35203 (_ BitVec 64)) (t!48551 List!33857)) )
))
(declare-fun arrayNoDuplicates!0 (array!98136 (_ BitVec 32) List!33857) Bool)

(assert (=> b!1445014 (= res!976939 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33854))))

(declare-fun b!1445015 () Bool)

(assert (=> b!1445015 (= e!814061 (not true))))

(assert (=> b!1445015 e!814063))

(declare-fun res!976925 () Bool)

(assert (=> b!1445015 (=> (not res!976925) (not e!814063))))

(assert (=> b!1445015 (= res!976925 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48712 0))(
  ( (Unit!48713) )
))
(declare-fun lt!634369 () Unit!48712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48712)

(assert (=> b!1445015 (= lt!634369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445016 () Bool)

(assert (=> b!1445016 (= e!814065 e!814066)))

(declare-fun res!976935 () Bool)

(assert (=> b!1445016 (=> (not res!976935) (not e!814066))))

(assert (=> b!1445016 (= res!976935 (= (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445016 (= lt!634368 (array!98137 (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47906 a!2862)))))

(declare-fun res!976937 () Bool)

(assert (=> start!124688 (=> (not res!976937) (not e!814065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124688 (= res!976937 (validMask!0 mask!2687))))

(assert (=> start!124688 e!814065))

(assert (=> start!124688 true))

(declare-fun array_inv!36384 (array!98136) Bool)

(assert (=> start!124688 (array_inv!36384 a!2862)))

(declare-fun b!1445006 () Bool)

(declare-fun res!976936 () Bool)

(assert (=> b!1445006 (=> (not res!976936) (not e!814065))))

(assert (=> b!1445006 (= res!976936 (validKeyInArray!0 (select (arr!47356 a!2862) i!1006)))))

(assert (= (and start!124688 res!976937) b!1445010))

(assert (= (and b!1445010 res!976938) b!1445006))

(assert (= (and b!1445006 res!976936) b!1445011))

(assert (= (and b!1445011 res!976926) b!1445000))

(assert (= (and b!1445000 res!976928) b!1445014))

(assert (= (and b!1445014 res!976939) b!1445002))

(assert (= (and b!1445002 res!976933) b!1445016))

(assert (= (and b!1445016 res!976935) b!1445008))

(assert (= (and b!1445008 res!976934) b!1445013))

(assert (= (and b!1445013 res!976927) b!1445007))

(assert (= (and b!1445007 res!976932) b!1445001))

(assert (= (and b!1445001 c!133548) b!1445003))

(assert (= (and b!1445001 (not c!133548)) b!1445004))

(assert (= (and b!1445001 res!976930) b!1445012))

(assert (= (and b!1445012 res!976929) b!1445015))

(assert (= (and b!1445015 res!976925) b!1445009))

(assert (= (and b!1445009 res!976931) b!1445005))

(declare-fun m!1333989 () Bool)

(assert (=> b!1445008 m!1333989))

(assert (=> b!1445008 m!1333989))

(declare-fun m!1333991 () Bool)

(assert (=> b!1445008 m!1333991))

(assert (=> b!1445008 m!1333991))

(assert (=> b!1445008 m!1333989))

(declare-fun m!1333993 () Bool)

(assert (=> b!1445008 m!1333993))

(declare-fun m!1333995 () Bool)

(assert (=> b!1445000 m!1333995))

(declare-fun m!1333997 () Bool)

(assert (=> b!1445014 m!1333997))

(declare-fun m!1333999 () Bool)

(assert (=> b!1445015 m!1333999))

(declare-fun m!1334001 () Bool)

(assert (=> b!1445015 m!1334001))

(declare-fun m!1334003 () Bool)

(assert (=> b!1445004 m!1334003))

(declare-fun m!1334005 () Bool)

(assert (=> b!1445004 m!1334005))

(declare-fun m!1334007 () Bool)

(assert (=> b!1445006 m!1334007))

(assert (=> b!1445006 m!1334007))

(declare-fun m!1334009 () Bool)

(assert (=> b!1445006 m!1334009))

(declare-fun m!1334011 () Bool)

(assert (=> start!124688 m!1334011))

(declare-fun m!1334013 () Bool)

(assert (=> start!124688 m!1334013))

(declare-fun m!1334015 () Bool)

(assert (=> b!1445016 m!1334015))

(declare-fun m!1334017 () Bool)

(assert (=> b!1445016 m!1334017))

(declare-fun m!1334019 () Bool)

(assert (=> b!1445007 m!1334019))

(assert (=> b!1445007 m!1334019))

(declare-fun m!1334021 () Bool)

(assert (=> b!1445007 m!1334021))

(assert (=> b!1445007 m!1334015))

(declare-fun m!1334023 () Bool)

(assert (=> b!1445007 m!1334023))

(assert (=> b!1445009 m!1333989))

(assert (=> b!1445009 m!1333989))

(declare-fun m!1334025 () Bool)

(assert (=> b!1445009 m!1334025))

(assert (=> b!1445013 m!1333989))

(assert (=> b!1445013 m!1333989))

(declare-fun m!1334027 () Bool)

(assert (=> b!1445013 m!1334027))

(assert (=> b!1445011 m!1333989))

(assert (=> b!1445011 m!1333989))

(declare-fun m!1334029 () Bool)

(assert (=> b!1445011 m!1334029))

(declare-fun m!1334031 () Bool)

(assert (=> b!1445003 m!1334031))

(declare-fun m!1334033 () Bool)

(assert (=> b!1445005 m!1334033))

(assert (=> b!1445005 m!1333989))

(push 1)

