; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112410 () Bool)

(assert start!112410)

(declare-fun b_free!30805 () Bool)

(declare-fun b_next!30805 () Bool)

(assert (=> start!112410 (= b_free!30805 (not b_next!30805))))

(declare-fun tp!108052 () Bool)

(declare-fun b_and!49647 () Bool)

(assert (=> start!112410 (= tp!108052 b_and!49647)))

(declare-fun b!1332723 () Bool)

(declare-fun res!884409 () Bool)

(declare-fun e!759238 () Bool)

(assert (=> b!1332723 (=> (not res!884409) (not e!759238))))

(declare-datatypes ((array!90306 0))(
  ( (array!90307 (arr!43619 (Array (_ BitVec 32) (_ BitVec 64))) (size!44169 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90306)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90306 (_ BitVec 32)) Bool)

(assert (=> b!1332723 (= res!884409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884410 () Bool)

(assert (=> start!112410 (=> (not res!884410) (not e!759238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112410 (= res!884410 (validMask!0 mask!1998))))

(assert (=> start!112410 e!759238))

(declare-datatypes ((V!54057 0))(
  ( (V!54058 (val!18432 Int)) )
))
(declare-datatypes ((ValueCell!17459 0))(
  ( (ValueCellFull!17459 (v!21069 V!54057)) (EmptyCell!17459) )
))
(declare-datatypes ((array!90308 0))(
  ( (array!90309 (arr!43620 (Array (_ BitVec 32) ValueCell!17459)) (size!44170 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90308)

(declare-fun e!759241 () Bool)

(declare-fun array_inv!32901 (array!90308) Bool)

(assert (=> start!112410 (and (array_inv!32901 _values!1320) e!759241)))

(assert (=> start!112410 true))

(declare-fun array_inv!32902 (array!90306) Bool)

(assert (=> start!112410 (array_inv!32902 _keys!1590)))

(assert (=> start!112410 tp!108052))

(declare-fun tp_is_empty!36715 () Bool)

(assert (=> start!112410 tp_is_empty!36715))

(declare-fun b!1332724 () Bool)

(declare-fun res!884411 () Bool)

(assert (=> b!1332724 (=> (not res!884411) (not e!759238))))

(declare-datatypes ((List!30898 0))(
  ( (Nil!30895) (Cons!30894 (h!32103 (_ BitVec 64)) (t!45096 List!30898)) )
))
(declare-fun arrayNoDuplicates!0 (array!90306 (_ BitVec 32) List!30898) Bool)

(assert (=> b!1332724 (= res!884411 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30895))))

(declare-fun b!1332725 () Bool)

(declare-fun e!759240 () Bool)

(declare-fun mapRes!56746 () Bool)

(assert (=> b!1332725 (= e!759241 (and e!759240 mapRes!56746))))

(declare-fun condMapEmpty!56746 () Bool)

(declare-fun mapDefault!56746 () ValueCell!17459)

