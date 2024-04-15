; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134934 () Bool)

(assert start!134934)

(declare-fun res!1074173 () Bool)

(declare-fun e!876548 () Bool)

(assert (=> start!134934 (=> (not res!1074173) (not e!876548))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134934 (= res!1074173 (validMask!0 mask!889))))

(assert (=> start!134934 e!876548))

(assert (=> start!134934 true))

(declare-datatypes ((array!104928 0))(
  ( (array!104929 (arr!50630 (Array (_ BitVec 32) (_ BitVec 64))) (size!51182 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104928)

(declare-fun array_inv!39566 (array!104928) Bool)

(assert (=> start!134934 (array_inv!39566 _keys!600)))

(declare-fun b!1572024 () Bool)

(declare-fun res!1074174 () Bool)

(assert (=> b!1572024 (=> (not res!1074174) (not e!876548))))

(assert (=> b!1572024 (= res!1074174 (= (size!51182 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572025 () Bool)

(declare-fun res!1074172 () Bool)

(assert (=> b!1572025 (=> (not res!1074172) (not e!876548))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572025 (= res!1074172 (validKeyInArray!0 k0!754))))

(declare-fun b!1572026 () Bool)

(assert (=> b!1572026 (= e!876548 false)))

(declare-datatypes ((SeekEntryResult!13578 0))(
  ( (MissingZero!13578 (index!56710 (_ BitVec 32))) (Found!13578 (index!56711 (_ BitVec 32))) (Intermediate!13578 (undefined!14390 Bool) (index!56712 (_ BitVec 32)) (x!141483 (_ BitVec 32))) (Undefined!13578) (MissingVacant!13578 (index!56713 (_ BitVec 32))) )
))
(declare-fun lt!673665 () SeekEntryResult!13578)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104928 (_ BitVec 32)) SeekEntryResult!13578)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572026 (= lt!673665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134934 res!1074173) b!1572024))

(assert (= (and b!1572024 res!1074174) b!1572025))

(assert (= (and b!1572025 res!1074172) b!1572026))

(declare-fun m!1445205 () Bool)

(assert (=> start!134934 m!1445205))

(declare-fun m!1445207 () Bool)

(assert (=> start!134934 m!1445207))

(declare-fun m!1445209 () Bool)

(assert (=> b!1572025 m!1445209))

(declare-fun m!1445211 () Bool)

(assert (=> b!1572026 m!1445211))

(assert (=> b!1572026 m!1445211))

(declare-fun m!1445213 () Bool)

(assert (=> b!1572026 m!1445213))

(check-sat (not b!1572025) (not start!134934) (not b!1572026))
(check-sat)
