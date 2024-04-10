; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134910 () Bool)

(assert start!134910)

(declare-fun res!1074179 () Bool)

(declare-fun e!876614 () Bool)

(assert (=> start!134910 (=> (not res!1074179) (not e!876614))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134910 (= res!1074179 (validMask!0 mask!889))))

(assert (=> start!134910 e!876614))

(assert (=> start!134910 true))

(declare-datatypes ((array!104980 0))(
  ( (array!104981 (arr!50658 (Array (_ BitVec 32) (_ BitVec 64))) (size!51208 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104980)

(declare-fun array_inv!39385 (array!104980) Bool)

(assert (=> start!134910 (array_inv!39385 _keys!600)))

(declare-fun b!1572112 () Bool)

(declare-fun res!1074180 () Bool)

(assert (=> b!1572112 (=> (not res!1074180) (not e!876614))))

(assert (=> b!1572112 (= res!1074180 (= (size!51208 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572113 () Bool)

(declare-fun res!1074178 () Bool)

(assert (=> b!1572113 (=> (not res!1074178) (not e!876614))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572113 (= res!1074178 (validKeyInArray!0 k!754))))

(declare-datatypes ((SeekEntryResult!13571 0))(
  ( (MissingZero!13571 (index!56682 (_ BitVec 32))) (Found!13571 (index!56683 (_ BitVec 32))) (Intermediate!13571 (undefined!14383 Bool) (index!56684 (_ BitVec 32)) (x!141445 (_ BitVec 32))) (Undefined!13571) (MissingVacant!13571 (index!56685 (_ BitVec 32))) )
))
(declare-fun lt!673858 () SeekEntryResult!13571)

(declare-fun b!1572114 () Bool)

(assert (=> b!1572114 (= e!876614 (and (is-Intermediate!13571 lt!673858) (not (undefined!14383 lt!673858)) (not (= (select (arr!50658 _keys!600) (index!56684 lt!673858)) k!754)) (not (= (select (arr!50658 _keys!600) (index!56684 lt!673858)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50658 _keys!600) (index!56684 lt!673858)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104980 (_ BitVec 32)) SeekEntryResult!13571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572114 (= lt!673858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134910 res!1074179) b!1572112))

(assert (= (and b!1572112 res!1074180) b!1572113))

(assert (= (and b!1572113 res!1074178) b!1572114))

(declare-fun m!1445971 () Bool)

(assert (=> start!134910 m!1445971))

(declare-fun m!1445973 () Bool)

(assert (=> start!134910 m!1445973))

(declare-fun m!1445975 () Bool)

(assert (=> b!1572113 m!1445975))

(declare-fun m!1445977 () Bool)

(assert (=> b!1572114 m!1445977))

(declare-fun m!1445979 () Bool)

(assert (=> b!1572114 m!1445979))

(assert (=> b!1572114 m!1445979))

(declare-fun m!1445981 () Bool)

(assert (=> b!1572114 m!1445981))

(push 1)

(assert (not b!1572114))

(assert (not start!134910))

(assert (not b!1572113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1572187 () Bool)

(declare-fun e!876655 () Bool)

(declare-fun lt!673888 () SeekEntryResult!13571)

(assert (=> b!1572187 (= e!876655 (bvsge (x!141445 lt!673888) #b01111111111111111111111111111110))))

(declare-fun b!1572188 () Bool)

(declare-fun e!876657 () Bool)

(assert (=> b!1572188 (= e!876655 e!876657)))

(declare-fun res!1074207 () Bool)

(assert (=> b!1572188 (= res!1074207 (and (is-Intermediate!13571 lt!673888) (not (undefined!14383 lt!673888)) (bvslt (x!141445 lt!673888) #b01111111111111111111111111111110) (bvsge (x!141445 lt!673888) #b00000000000000000000000000000000) (bvsge (x!141445 lt!673888) #b00000000000000000000000000000000)))))

(assert (=> b!1572188 (=> (not res!1074207) (not e!876657))))

(declare-fun b!1572189 () Bool)

(assert (=> b!1572189 (and (bvsge (index!56684 lt!673888) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673888) (size!51208 _keys!600)))))

(declare-fun e!876656 () Bool)

(assert (=> b!1572189 (= e!876656 (= (select (arr!50658 _keys!600) (index!56684 lt!673888)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572190 () Bool)

(declare-fun e!876659 () SeekEntryResult!13571)

(declare-fun e!876658 () SeekEntryResult!13571)

(assert (=> b!1572190 (= e!876659 e!876658)))

(declare-fun c!145233 () Bool)

(declare-fun lt!673887 () (_ BitVec 64))

(assert (=> b!1572190 (= c!145233 (or (= lt!673887 k!754) (= (bvadd lt!673887 lt!673887) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572192 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572192 (= e!876658 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572193 () Bool)

(assert (=> b!1572193 (= e!876658 (Intermediate!13571 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164715 () Bool)

(assert (=> d!164715 e!876655))

(declare-fun c!145232 () Bool)

(assert (=> d!164715 (= c!145232 (and (is-Intermediate!13571 lt!673888) (undefined!14383 lt!673888)))))

(assert (=> d!164715 (= lt!673888 e!876659)))

(declare-fun c!145231 () Bool)

(assert (=> d!164715 (= c!145231 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164715 (= lt!673887 (select (arr!50658 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164715 (validMask!0 mask!889)))

(assert (=> d!164715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673888)))

(declare-fun b!1572191 () Bool)

(assert (=> b!1572191 (= e!876659 (Intermediate!13571 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572194 () Bool)

(assert (=> b!1572194 (and (bvsge (index!56684 lt!673888) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673888) (size!51208 _keys!600)))))

(declare-fun res!1074209 () Bool)

(assert (=> b!1572194 (= res!1074209 (= (select (arr!50658 _keys!600) (index!56684 lt!673888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572194 (=> res!1074209 e!876656)))

(declare-fun b!1572195 () Bool)

(assert (=> b!1572195 (and (bvsge (index!56684 lt!673888) #b00000000000000000000000000000000) (bvslt (index!56684 lt!673888) (size!51208 _keys!600)))))

(declare-fun res!1074208 () Bool)

(assert (=> b!1572195 (= res!1074208 (= (select (arr!50658 _keys!600) (index!56684 lt!673888)) k!754))))

(assert (=> b!1572195 (=> res!1074208 e!876656)))

(assert (=> b!1572195 (= e!876657 e!876656)))

(assert (= (and d!164715 c!145231) b!1572191))

(assert (= (and d!164715 (not c!145231)) b!1572190))

(assert (= (and b!1572190 c!145233) b!1572193))

(assert (= (and b!1572190 (not c!145233)) b!1572192))

(assert (= (and d!164715 c!145232) b!1572187))

(assert (= (and d!164715 (not c!145232)) b!1572188))

(assert (= (and b!1572188 res!1074207) b!1572195))

(assert (= (and b!1572195 (not res!1074208)) b!1572194))

(assert (= (and b!1572194 (not res!1074209)) b!1572189))

(assert (=> d!164715 m!1445979))

(declare-fun m!1445999 () Bool)

(assert (=> d!164715 m!1445999))

(assert (=> d!164715 m!1445971))

(declare-fun m!1446001 () Bool)

(assert (=> b!1572194 m!1446001))

(assert (=> b!1572189 m!1446001))

(assert (=> b!1572195 m!1446001))

(assert (=> b!1572192 m!1445979))

(declare-fun m!1446003 () Bool)

(assert (=> b!1572192 m!1446003))

(assert (=> b!1572192 m!1446003))

(declare-fun m!1446005 () Bool)

(assert (=> b!1572192 m!1446005))

(assert (=> b!1572114 d!164715))

(declare-fun d!164725 () Bool)

(declare-fun lt!673894 () (_ BitVec 32))

(declare-fun lt!673893 () (_ BitVec 32))

(assert (=> d!164725 (= lt!673894 (bvmul (bvxor lt!673893 (bvlshr lt!673893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164725 (= lt!673893 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164725 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074210 (let ((h!38215 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141451 (bvmul (bvxor h!38215 (bvlshr h!38215 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141451 (bvlshr x!141451 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074210 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074210 #b00000000000000000000000000000000))))))

