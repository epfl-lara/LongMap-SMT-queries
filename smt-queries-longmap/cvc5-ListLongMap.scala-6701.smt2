; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84178 () Bool)

(assert start!84178)

(declare-fun b_free!19879 () Bool)

(declare-fun b_next!19879 () Bool)

(assert (=> start!84178 (= b_free!19879 (not b_next!19879))))

(declare-fun tp!69240 () Bool)

(declare-fun b_and!31835 () Bool)

(assert (=> start!84178 (= tp!69240 b_and!31835)))

(declare-fun mapIsEmpty!36500 () Bool)

(declare-fun mapRes!36500 () Bool)

(assert (=> mapIsEmpty!36500 mapRes!36500))

(declare-fun b!984423 () Bool)

(declare-fun res!658727 () Bool)

(declare-fun e!554957 () Bool)

(assert (=> b!984423 (=> (not res!658727) (not e!554957))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61943 0))(
  ( (array!61944 (arr!29829 (Array (_ BitVec 32) (_ BitVec 64))) (size!30308 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61943)

(assert (=> b!984423 (= res!658727 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30308 _keys!1544))))))

(declare-fun b!984424 () Bool)

(declare-fun e!554953 () Bool)

(declare-fun tp_is_empty!22981 () Bool)

(assert (=> b!984424 (= e!554953 tp_is_empty!22981)))

(declare-fun b!984425 () Bool)

(declare-fun e!554954 () Bool)

(assert (=> b!984425 (= e!554954 (and e!554953 mapRes!36500))))

(declare-fun condMapEmpty!36500 () Bool)

(declare-datatypes ((V!35625 0))(
  ( (V!35626 (val!11541 Int)) )
))
(declare-datatypes ((ValueCell!11009 0))(
  ( (ValueCellFull!11009 (v!14103 V!35625)) (EmptyCell!11009) )
))
(declare-datatypes ((array!61945 0))(
  ( (array!61946 (arr!29830 (Array (_ BitVec 32) ValueCell!11009)) (size!30309 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61945)

(declare-fun mapDefault!36500 () ValueCell!11009)

