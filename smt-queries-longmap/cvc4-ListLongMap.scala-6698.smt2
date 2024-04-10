; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84164 () Bool)

(assert start!84164)

(declare-fun b_free!19865 () Bool)

(declare-fun b_next!19865 () Bool)

(assert (=> start!84164 (= b_free!19865 (not b_next!19865))))

(declare-fun tp!69199 () Bool)

(declare-fun b_and!31807 () Bool)

(assert (=> start!84164 (= tp!69199 b_and!31807)))

(declare-fun b!984177 () Bool)

(declare-fun res!658555 () Bool)

(declare-fun e!554832 () Bool)

(assert (=> b!984177 (=> (not res!658555) (not e!554832))))

(declare-datatypes ((array!61915 0))(
  ( (array!61916 (arr!29815 (Array (_ BitVec 32) (_ BitVec 64))) (size!30294 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61915)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61915 (_ BitVec 32)) Bool)

(assert (=> b!984177 (= res!658555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!658553 () Bool)

(assert (=> start!84164 (=> (not res!658553) (not e!554832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84164 (= res!658553 (validMask!0 mask!1948))))

(assert (=> start!84164 e!554832))

(assert (=> start!84164 true))

(declare-fun tp_is_empty!22967 () Bool)

(assert (=> start!84164 tp_is_empty!22967))

(declare-datatypes ((V!35605 0))(
  ( (V!35606 (val!11534 Int)) )
))
(declare-datatypes ((ValueCell!11002 0))(
  ( (ValueCellFull!11002 (v!14096 V!35605)) (EmptyCell!11002) )
))
(declare-datatypes ((array!61917 0))(
  ( (array!61918 (arr!29816 (Array (_ BitVec 32) ValueCell!11002)) (size!30295 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61917)

(declare-fun e!554830 () Bool)

(declare-fun array_inv!23057 (array!61917) Bool)

(assert (=> start!84164 (and (array_inv!23057 _values!1278) e!554830)))

(assert (=> start!84164 tp!69199))

(declare-fun array_inv!23058 (array!61915) Bool)

(assert (=> start!84164 (array_inv!23058 _keys!1544)))

(declare-fun b!984178 () Bool)

(declare-fun res!658559 () Bool)

(assert (=> b!984178 (=> (not res!658559) (not e!554832))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984178 (= res!658559 (and (= (size!30295 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30294 _keys!1544) (size!30295 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984179 () Bool)

(declare-fun e!554828 () Bool)

(declare-fun mapRes!36479 () Bool)

(assert (=> b!984179 (= e!554830 (and e!554828 mapRes!36479))))

(declare-fun condMapEmpty!36479 () Bool)

(declare-fun mapDefault!36479 () ValueCell!11002)

